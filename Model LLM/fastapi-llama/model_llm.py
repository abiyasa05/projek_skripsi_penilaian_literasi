from fastapi import FastAPI, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from pydantic import BaseModel
import logging, hashlib, re
import httpx

# Logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

app = FastAPI()

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# OLLAMA_URL = "http://167.71.212.60:111/api/generate"
OLLAMA_URL = "http://labai.polinema.ac.id:11434/api/generate"

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    return JSONResponse(
        status_code=422,
        content={"detail": jsonable_encoder(exc.errors()), "body": exc.body},
    )

class MaterialRequest(BaseModel):
    content: str
    question_type: str  # hanya 'multiple_choice' atau 'essay'
    question_count: int = 5

def potong_konten(text: str, max_chars: int = 5000):
    return text[:max_chars] if len(text) > max_chars else text

@app.post("/generate-from-material/")
async def generate_from_material(request: MaterialRequest):
    if request.question_count < 1 or request.question_count > 20:
        raise HTTPException(status_code=400, detail="Jumlah soal harus antara 1-20")
    
    if request.question_type not in ["multiple_choice", "essay"]:
        raise HTTPException(status_code=400, detail="Jenis soal hanya bisa 'multiple_choice' atau 'essay'")

    mc_count = essay_count = 0
    if request.question_type == "multiple_choice":
        mc_count = request.question_count
    else:
        essay_count = request.question_count

    content_bersih = potong_konten(request.content.strip())

    prompt_generate = f"""
Buat soal latihan berdasarkan teks materi berikut untuk siswa SD kelas 3.

**Instruksi:**
1. Buat total {request.question_count} soal:
   - Pilihan ganda: {mc_count}
   - Isian/essay: {essay_count}
2. Setiap soal sertakan:
   - Kutipan dari teks (1 kalimat)
   - Pertanyaan
   - Jawaban
   - Bobot default: isi `Bobot: TBD` (nanti akan ditentukan otomatis)
3. Gunakan bahasa yang sederhana dan sesuai untuk siswa SD kelas 3.

**Format Output:**
---
**Soal Pilihan Ganda:**
1. Kalimat sumber: "[kutipan]"
   Pertanyaan: [pertanyaan]
   A. ...
   B. ...
   C. ...
   D. ...
   Jawaban: [opsi]
   Bobot: TBD

**Soal Isian:**
1. Kalimat sumber: "[kutipan]"
   Pertanyaan: [pertanyaan]
   Jawaban: [jawaban]
   Bobot: TBD
---

**Materi:**
{content_bersih}
"""

    async with httpx.AsyncClient(timeout=300) as client:
        res = await client.post(OLLAMA_URL, json={
            "model": "gemma3:12b",
            "prompt": prompt_generate,
            "stream": False,
            "options": {"num_predict": 2048}
        })
        res.raise_for_status()
        raw_output = res.json().get("response", "").strip()

    prompt_bobot = f"""
Tentukan bobot untuk setiap soal berikut berdasarkan kompleksitas:

**Panduan Penilaian:**
- Pilihan ganda:
  - 1 = mudah
  - 2 = agak sulit
- Isian:
  - 3 = sedang
  - 4 = agak sulit
  - 5 = sulit

Kembalikan soal yang sama, tapi ganti baris "Bobot: TBD" dengan bobot sesuai tingkat kesulitan. Jangan ubah bagian lainnya.

Soal:
{raw_output}
""".strip()

    async with httpx.AsyncClient(timeout=120) as client:
        bobot_res = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt_bobot,
            "stream": False
        })
        bobot_res.raise_for_status()
        final_output = bobot_res.json().get("response", "").strip()

    return {
        "generated_questions": final_output,
        "question_type": request.question_type,
        "question_count": request.question_count,
        "mc_count": mc_count,
        "essay_count": essay_count
    }

@app.post("/generate-with-bobot/")
async def generate_with_bobot(request: MaterialRequest):
    if request.question_count < 1 or request.question_count > 20:
        raise HTTPException(status_code=400, detail="Jumlah soal harus antara 1-20")
    
    if request.question_type not in ["multiple_choice", "essay"]:
        raise HTTPException(status_code=400, detail="Jenis soal hanya bisa 'multiple_choice' atau 'essay'")

    mc_count = request.question_count if request.question_type == "multiple_choice" else 0
    essay_count = request.question_count if request.question_type == "essay" else 0

    content_bersih = potong_konten(request.content.strip())

    # Langkah 1: Generate soal mentah dengan Bobot: TBD
    prompt_generate = f"""
Buat soal latihan berdasarkan teks berikut untuk siswa SD kelas 3.

Instruksi:
- Total soal: {request.question_count}
- Jenis soal:
  - Pilihan Ganda: {mc_count}
  - Isian/Essay: {essay_count}
- Setiap soal berisi:
  - Kalimat sumber
  - Pertanyaan
  - Jawaban
  - Bobot: isi "Bobot: TBD"

Format:
---
**Soal Pilihan Ganda:**
1. Kalimat sumber: "[kutipan]"
   Pertanyaan: ...
   A. ...
   B. ...
   C. ...
   D. ...
   Jawaban: ...
   Bobot: TBD

**Soal Isian:**
1. Kalimat sumber: "[kutipan]"
   Pertanyaan: ...
   Jawaban: ...
   Bobot: TBD
---

Teks:
{content_bersih}
"""

    async with httpx.AsyncClient(timeout=300) as client:
        res = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt_generate,
            "stream": False
        })
        res.raise_for_status()
        raw_output = res.json().get("response", "").strip()

    # Langkah 2: Tambahkan bobot
    prompt_bobot = f"""
Tentukan bobot untuk setiap soal berdasarkan kompleksitas.

Panduan Penilaian:
- Pilihan Ganda:
  - 1 = mudah
  - 2 = agak sulit
- Isian:
  - 3 = sedang
  - 4 = agak sulit
  - 5 = sulit

Ganti baris "Bobot: TBD" menjadi "Bobot: [1-5]". Jangan ubah bagian lainnya.

Soal:
{raw_output}
"""

    async with httpx.AsyncClient(timeout=180) as client:
        res_bobot = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt_bobot,
            "stream": False
        })
        res_bobot.raise_for_status()
        final_output = res_bobot.json().get("response", "").strip()

    return {
        "generated_questions": final_output,
        "question_type": request.question_type,
        "question_count": request.question_count,
        "mc_count": mc_count,
        "essay_count": essay_count
    }

class GenerateQuestionsRequest(BaseModel):
    content: str
    question_count: int
    question_type: str  # 'multiple_choice', 'essay', atau 'both'
    with_bobot: bool = True

@app.post("/generate-questions/")
async def generate_questions(request: GenerateQuestionsRequest):
    mc_count = essay_count = 0
    if request.question_type == "multiple_choice":
        mc_count = request.question_count
    elif request.question_type == "essay":
        essay_count = request.question_count
    else:
        raise HTTPException(status_code=400, detail="Jenis soal tidak valid.")

    prompt = f"""
Buat soal dari teks berikut untuk siswa SD kelas 3.
Jumlah soal: {request.question_count}
- Pilihan Ganda: {mc_count}
- Isian: {essay_count}

Setiap soal sertakan:
- Kalimat sumber
- Pertanyaan
- Jawaban
- Bobot: TBD

Format:
...
Teks:
{potong_konten(request.content)}
""".strip()

    async with httpx.AsyncClient(timeout=300) as client:
        result = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt,
            "stream": False
        })
        result.raise_for_status()
        output = result.json().get("response", "").strip()

    if not request.with_bobot:
        return {
            "generated_questions": output,
            "mc_count": mc_count,
            "essay_count": essay_count
        }

    # Tambah bobot
    prompt_bobot = f"""
Tentukan bobot soal berdasarkan kompleksitas. Ganti 'Bobot: TBD' dengan angka 1-5 sesuai panduan. Jangan ubah bagian lainnya.

Soal:
{output}
"""
    async with httpx.AsyncClient(timeout=180) as client:
        bobot_result = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt_bobot,
            "stream": False
        })
        bobot_result.raise_for_status()
        final_output = bobot_result.json().get("response", "").strip()

    return {
        "generated_questions": final_output,
        "mc_count": mc_count,
        "essay_count": essay_count
    }

class FeedbackRequest(BaseModel):
    user_answer: str
    expected_answer: str

feedback_cache = {}

@app.post("/generate-feedback/")
async def generate_feedback(request: FeedbackRequest):
    user_answer = request.user_answer.strip()
    expected_answer = request.expected_answer.strip()
    prompt_hash = hashlib.sha256(f"{user_answer}|{expected_answer}".encode()).hexdigest()

    if prompt_hash in feedback_cache:
        return {"feedback": feedback_cache[prompt_hash]}

    prompt = f"""
Kamu adalah asisten pengajar SD kelas 3. Siswa memberikan jawaban berikut.

**Jawaban Siswa:** {user_answer}
**Jawaban Ideal:** {expected_answer}

Beri feedback singkat dan membangun, maksimal 2 kalimat, dengan bahasa mudah dipahami.
"""

    async with httpx.AsyncClient(timeout=120) as client:
        response = await client.post(OLLAMA_URL, json={
            "model": "llama3.1:latest",
            "prompt": prompt,
            "stream": False
        })

    response.raise_for_status()
    feedback = response.json().get("response", "").strip()
    feedback_cache[prompt_hash] = feedback
    return {"feedback": feedback}
