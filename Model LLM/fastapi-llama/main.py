from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os, logging, httpx, hashlib
from utils_file import read_text_from_file

# Logging setup
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Path lokal file materi
MATERIAL_BASE_PATH = r"D:\Projek Skripsi\Penilaian Literasi\iClOP-V2\storage\app\public"
OLLAMA_URL = "http://labai.polinema.ac.id:11434/api/generate"

# Request model
class FileMaterialRequest(BaseModel):
    file_name: str
    question_type: str
    question_count: int
    start_page: int = 10

class FeedbackRequest(BaseModel):
    user_answer: str
    expected_answer: str

feedback_cache = {}

def potong_konten(text: str, max_chars: int = 5000):
    return text[:max_chars] if len(text) > max_chars else text

@app.post("/generate-from-file/")
async def generate_from_file(request: FileMaterialRequest):
    try:
        if request.question_count < 1 or request.question_count > 20:
            raise HTTPException(status_code=400, detail="Jumlah soal harus antara 1–20")

        if request.question_type not in ["multiple_choice", "essay"]:
            raise HTTPException(status_code=400, detail="Jenis soal tidak valid. Pilih: multiple_choice atau essay")

        mc_count = request.question_count if request.question_type == "multiple_choice" else 0
        essay_count = request.question_count if request.question_type == "essay" else 0

        file_path = os.path.join(MATERIAL_BASE_PATH, request.file_name)
        if not os.path.exists(file_path):
            raise HTTPException(status_code=404, detail=f"File tidak ditemukan: {file_path}")

        # Baca isi file mulai dari halaman tertentu
        text = read_text_from_file(file_path, start_page=request.start_page)
        if not text.strip():
            raise HTTPException(status_code=400, detail="Isi file kosong atau tidak terbaca.")

        content_bersih = potong_konten(text.strip())

        prompt = f"""
Buat soal latihan berdasarkan teks materi berikut untuk siswa SD kelas 3.

**Instruksi:**
1. Buat total {request.question_count} soal dengan rincian:
   - Soal pilihan ganda: {mc_count}
   - Soal isian: {essay_count}

2. **Untuk soal isian:**
   - Ambil kutipan **minimal dua kalimat yang saling terhubung** dari teks sebagai dasar soal
   - Awali dengan: **Bacalah kutipan berikut: "[kutipan]"**
   - Buat pertanyaan berdasarkan kutipan tersebut
   - Sertakan **jawaban singkat**
   - Beri bobot antara **3–5** sesuai kompleksitas

3. **Untuk soal pilihan ganda (jika ada):**
   - Ambil kutipan **1 kalimat yang relevan** dari teks
   - Buat pertanyaan dan 4 pilihan jawaban (A–D)
   - Beri jawaban benar dan bobot antara **1–2** sesuai tingkat kesulitan

4. Gunakan bahasa sederhana dan sesuai dengan siswa SD kelas 3.

5. Jangan menambahkan informasi di luar teks materi.

**Format Output:**
""" + ("""
**Soal Pilihan Ganda:**
1. Bacalah kutipan berikut: "[2 kalimat atau lebih dari teks]"
   Pertanyaan: [Pertanyaan]
   A. [Opsi A]
   B. [Opsi B]
   C. [Opsi C]
   D. [Opsi D]
   Jawaban: [Huruf Opsi]
   Bobot: [1 atau 2]
""" if mc_count > 0 else "") + ("""

**Soal Isian:**
1. Bacalah kutipan berikut: "[2 kalimat atau lebih dari teks]". [Pertanyaan]
   Jawaban: [Jawaban]
   Bobot: [3 - 5]
""" if essay_count > 0 else "") + f"""

---

**Materi:**
{content_bersih}
""".strip()

        logging.info("Mengirim prompt ke Ollama...")
        async with httpx.AsyncClient(timeout=120) as client:
            response = await client.post(OLLAMA_URL, json={
                "model": "llama3.1:latest",
                "prompt": prompt,
                "stream": False,
                "options": {
                    "num_predict": 2048
                }
            })

        response.raise_for_status()
        result = response.json()
        generated_text = result.get("response", "").strip()

        return {
            "generated_questions": generated_text,
            "question_type": request.question_type,
            "question_count": request.question_count,
            "mc_count": mc_count,
            "essay_count": essay_count,
            "start_page": request.start_page
        }

    except Exception as e:
        logging.error(f"Error saat generate dari file: {e}")
        raise HTTPException(status_code=500, detail=f"Terjadi kesalahan internal: {str(e)}")

@app.post("/generate-feedback/")
async def generate_feedback(request: FeedbackRequest):
    try:
        user_answer = request.user_answer.strip()
        expected_answer = request.expected_answer.strip()

        prompt_hash = hashlib.sha256(f"{user_answer}|{expected_answer}".encode()).hexdigest()
        if prompt_hash in feedback_cache:
            logging.info("Feedback dari cache.")
            return {"feedback": feedback_cache[prompt_hash]}

        prompt = f"""
Kamu adalah asisten pengajar untuk siswa SD kelas 3. Siswa memberikan jawaban berikut untuk soal isian.

**Jawaban Siswa:** {user_answer}
**Jawaban Ideal:** {expected_answer}

Beri feedback singkat dan membangun, maksimal 2 kalimat. Gunakan bahasa yang mudah dimengerti oleh siswa SD. Jika jawaban siswa salah, berikan petunjuk atau koreksi yang membantu.
"""

        logging.info("Mengirim prompt feedback ke Ollama...")
        async with httpx.AsyncClient(timeout=60) as client:
            response = await client.post(OLLAMA_URL, json={
                "model": "llama3.1:latest",
                "prompt": prompt,
                "stream": False
            })

        response.raise_for_status()
        result = response.json()
        feedback = result.get("response", "").strip()

        feedback_cache[prompt_hash] = feedback
        return {"feedback": feedback}

    except Exception as e:
        logging.error(f"Error saat generate feedback: {e}")
        raise HTTPException(status_code=500, detail=f"Terjadi kesalahan: {str(e)}")