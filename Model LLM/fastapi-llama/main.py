from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os, logging, httpx, hashlib
from utils_file import read_text_from_file
from pathlib import Path

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
BASE_DIR = Path(__file__).resolve().parent
MATERIAL_BASE_PATH = (BASE_DIR.parent.parent / "Penilaian Literasi" / "iCLOP-V2" / "storage" / "app" / "public")
OLLAMA_URL = "http://labai.polinema.ac.id:11434/api/generate"

logging.info(f"📂 Path materi: {MATERIAL_BASE_PATH}")

# Request model
class FileMaterialRequest(BaseModel):
    file_name: str
    question_type: str
    question_count: int
    start_page: int = 24

class FeedbackRequest(BaseModel):
    user_answer: str
    expected_answer: str
    question_text: str

feedback_cache = {}

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

        # ==== PROMPT INSTRUKSI BERDASARKAN JENIS SOAL ====
        if request.question_type == "multiple_choice":
            soal_instruksi = f"""
1. Ambil satu paragraf panjang dari teks.
2. Buat **{mc_count} soal pilihan ganda** dari paragraf tersebut.
3. Soal harus berdasarkan informasi yang tertulis langsung dalam paragraf (eksplisit).
4. Hindari soal yang:
   - Mengandung simpulan di luar isi
   - Menambahkan tokoh, nama, atau kejadian di luar paragraf
   - Jawabannya tidak bisa ditemukan dari paragraf
5. Topik soal mencakup:
   - Ide pokok paragraf
   - Kalimat utama
   - Sinonim atau antonim (jika ada kata yang mendukung)
   - Informasi eksplisit dari kalimat dalam paragraf
6. Gunakan bahasa sederhana, sesuai siswa SD kelas 3–4.
7. Bobot setiap soal **1–2**, berdasarkan tingkat kesulitan.
8. Gunakan format berikut:

**Paragraf:**
"[Isi paragraf]"

**Soal Pilihan Ganda:**
1. [Pertanyaan]
   A. ...
   B. ...
   C. ...
   D. ...
   Jawaban: ...
   Bobot: ...

---

✅ Contoh soal:

**Paragraf:**
"Pak Budi memelihara ayam, bebek, dan kambing. Setiap pagi, ia memberi makan ternaknya dengan penuh kasih sayang."

**Contoh Soal Pilihan Ganda:**
1. Apa hewan yang dipelihara Pak Budi?
   A. Kucing
   B. Ayam dan kambing
   C. Anjing dan bebek
   D. Ikan dan sapi  
   Jawaban: B  
   Bobot: 1

2. Apa sinonim dari kata 'ternak' dalam paragraf tersebut?
   A. Hewan peliharaan  
   B. Sayuran  
   C. Alat tani  
   D. Makanan ternak  
   Jawaban: A  
   Bobot: 2
""".strip()

        elif request.question_type == "essay":
            soal_instruksi = f"""
1. Ambil satu paragraf panjang dari teks.
2. Buat **{essay_count} soal isian** dari paragraf tersebut.
3. Soal harus berasal dari informasi eksplisit yang tertulis dalam paragraf.
4. Hindari soal yang:
   - Mengandung penalaran atau simpulan dari luar isi
   - Mengandung tokoh, tempat, atau kejadian tambahan
5. Topik soal mencakup:
   - Ide pokok paragraf
   - Kalimat penting
   - Karakter tokoh
   - Sinonim atau antonim (jika tersedia dalam paragraf)
6. Gunakan bahasa sederhana, sesuai siswa SD kelas 3–4.
7. **Ingat: Bobot soal isian HARUS antara 3 hingga 5. Tidak boleh menggunakan bobot 1 atau 2.**
8. Gunakan format berikut:

**Paragraf:**
"[Isi paragraf]"

**Soal Isian:**
1. [Pertanyaan]
   Jawaban: ...
   Bobot: [3, 4, atau 5 saja — bukan angka lain]

---

✅ Contoh soal (ikuti strukturnya):

**Paragraf:**
"Pak Ali menanam padi di sawah setiap musim tanam. Ia bekerja keras agar panennya berhasil."

**Contoh Soal Isian:**
1. Apa yang ditanam Pak Ali di sawah?  
   Jawaban: Padi  
   Bobot: 3

2. Mengapa Pak Ali bekerja keras?  
   Jawaban: Agar panennya berhasil  
   Bobot: 4

3. Apa sinonim dari kata 'bekerja keras' dalam paragraf tersebut?  
   Jawaban: Rajin atau tekun  
   Bobot: 5
""".strip()

        # ==== FINAL PROMPT ====
        prompt = f"""
Kamu adalah asisten guru SD kelas 3 dan 4.

Tugasmu adalah membuat soal literasi dari teks di bawah ini. Soal HARUS berdasarkan isi teks, tanpa menambahkan informasi dari luar.

---

### 🎯 Tujuan:
Buat **{request.question_count} soal literasi** berdasarkan **satu paragraf** untuk masing-masing jenis soal.

---

### 📌 Instruksi Umum:
- Gunakan paragraf berbeda untuk soal pilihan ganda dan isian (jika kedua jenis digunakan).
- Jangan menambahkan nama tokoh, tempat, atau kejadian di luar isi paragraf.
- Bahasa harus sederhana dan mudah dipahami siswa SD.

---

### 📌 Instruksi Soal:
{soal_instruksi}

---

### 📚 Teks:
{text.strip()}
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
        question_text = request.question_text.strip()

        prompt_hash = hashlib.sha256(f"{user_answer}|{expected_answer}|{question_text}".encode()).hexdigest()
        if prompt_hash in feedback_cache:
            logging.info("Feedback dari cache.")
            return {"feedback": feedback_cache[prompt_hash]}

        prompt = f"""
Kamu adalah asisten pengajar untuk siswa SD kelas 3. Berikut ini adalah soal isian, jawaban siswa, dan jawaban ideal.

**Soal:** {question_text}
**Jawaban Siswa:** {user_answer}
**Jawaban Ideal:** {expected_answer}

Beri feedback singkat dan membangun, maksimal 2 kalimat. Gunakan bahasa yang mudah dimengerti oleh siswa SD. Jika jawaban siswa salah, berikan petunjuk atau koreksi yang membantu.
"""

        logging.info("Mengirim prompt feedback ke Ollama...")
        async with httpx.AsyncClient(timeout=300) as client:
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