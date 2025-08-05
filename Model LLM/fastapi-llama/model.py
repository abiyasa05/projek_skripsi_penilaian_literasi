from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import httpx
import logging
import random

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

OLLAMA_URL = "http://192.168.60.110:11434/api/generate"

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

data_sources = {
    "cerita": {
        "Malin Kundang": "Malin Kundang adalah seorang anak dari keluarga miskin yang menjadi kaya raya namun menolak mengakui ibunya, hingga akhirnya dikutuk menjadi batu.",
        "Bawang Merah Bawang Putih": "Bawang Putih adalah gadis baik hati yang diperlakukan buruk oleh ibu dan saudara tirinya, tetapi kebaikannya membuahkan hasil berkat ikan ajaib.",
        "Sangkuriang": "Sangkuriang jatuh cinta pada ibunya, Dayang Sumbi, dan diberi tugas mustahil untuk membangun perahu dalam satu malam. Ia gagal dan akhirnya marah, menendang perahu hingga menjadi Gunung Tangkuban Perahu.",
        "Si Kancil": "Si Kancil dengan kecerdikannya berhasil menipu buaya untuk menyeberangi sungai dengan aman.",
        "Timun Mas": "Seorang ibu tua mendapatkan anak dari biji timun emas. Namun, anak itu harus melarikan diri dari raksasa jahat yang ingin memakannya."
    },
    "pantun": {
        "Pantun Nasihat": "Jalan-jalan ke kota Blitar,\nJangan lupa membeli roti.\nRajin belajar sejak pintar,\nAgar sukses di kemudian hari.",
        "Pantun Jenaka": "Ke pasar beli ikan teri,\nIkan habis tinggal kepala.\nJangan suka mencuri,\nNanti ketahuan malah celaka."
    },
    "puisi": {
        "Puisi Alam": "Langit biru membentang luas,\nBurung-burung terbang bebas.\nAngin sepoi menyapu dedaunan,\nAlam indah penuh kedamaian.",
        "Puisi Persahabatan": "Sahabat sejati selalu ada,\nDalam suka dan dalam duka.\nBersama kita jalani hari,\nMengukir cerita tak terlupa."
    }
}

@app.post("/generate/")
async def generate_text():
    try:
        selected_stories = random.sample(list(data_sources["cerita"].keys()), 3)
        selected_pantun = random.choice(list(data_sources["pantun"].keys()))
        selected_puisi = random.choice(list(data_sources["puisi"].keys()))

        # PROMPT BAGIAN CERITA
        story_prompts = "\n\n".join([
            f"Judul: {story}\nIsi:\n{data_sources['cerita'][story]}"
            for story in selected_stories
        ])

        story_prompt_full = f"""
Kamu adalah asisten pengajar untuk siswa SD kelas 3. Berdasarkan teks cerita di bawah ini, buat soal latihan.

**Instruksi:**
- Untuk setiap cerita, buat:
  - 1 soal pilihan ganda (A-D) + jawabannya (Jawaban Benar: X)
  - 1 soal isian + jawabannya (Jawaban Ideal: ...)

Gunakan format berikut:

---

Judul: [judul]
Isi:
[isi teks]

**Soal Pilihan Ganda:**
1. ...
A. ...
B. ...
C. ...
D. ...
Jawaban Benar: X

**Soal Isian:**
...
Jawaban Ideal: ...

---

Berikut teks ceritanya:

{story_prompts}
"""

        # PROMPT BAGIAN PANTUN & PUISI
        pantun_prompt = f"Judul: {selected_pantun}\nIsi:\n{data_sources['pantun'][selected_pantun]}"
        puisi_prompt = f"Judul: {selected_puisi}\nIsi:\n{data_sources['puisi'][selected_puisi]}"

        pantun_puisi_full = f"""
Kamu adalah asisten pengajar untuk siswa SD kelas 3. Berdasarkan teks pantun dan puisi di bawah ini, buat soal latihan.

**Instruksi:**
- Untuk setiap teks, buat:
  - 1 soal pilihan ganda (A-D) + jawabannya (Jawaban Benar: X)
  - 1 soal isian + jawabannya (Jawaban Ideal: ...)

Gunakan format berikut:

---

Judul: [judul]
Isi:
[isi teks]

**Soal Pilihan Ganda:**
1. ...
A. ...
B. ...
C. ...
D. ...
Jawaban Benar: X

**Soal Isian:**
...
Jawaban Ideal: ...

---

Berikut teks pantun dan puisinya:

{pantun_prompt}

{puisi_prompt}
"""

        # Siapkan payload untuk kedua request
        async with httpx.AsyncClient(timeout=300) as client:
            # Request untuk CERITA
            res1 = await client.post(OLLAMA_URL, json={
                "model": "llama3.1:latest",
                "prompt": story_prompt_full,
                "stream": False,
                "options": {
                    "num_predict": 2048
                }
            })
            res1.raise_for_status()
            response_story = res1.json().get("response", "").strip()

            # Request untuk PANTUN + PUISI
            res2 = await client.post(OLLAMA_URL, json={
                "model": "llama3.1:latest",
                "prompt": pantun_puisi_full,
                "stream": False,
                "options": {
                    "num_predict": 1024
                }
            })
            res2.raise_for_status()
            response_pantun_puisi = res2.json().get("response", "").strip()

        if not response_story or not response_pantun_puisi:
            raise HTTPException(status_code=500, detail="Ollama tidak menghasilkan pertanyaan")

        return {
            "selected_stories": [
                {"title": title, "content": data_sources["cerita"][title]}
                for title in selected_stories
            ],
            "selected_pantun": {
                "title": selected_pantun,
                "content": data_sources["pantun"][selected_pantun]
            },
            "selected_puisi": {
                "title": selected_puisi,
                "content": data_sources["puisi"][selected_puisi]
            },
            "generated_questions": response_story + "\n\n" + response_pantun_puisi
        }

    except httpx.HTTPStatusError as e:
        logging.error(f"HTTP error dari Ollama API: {e.response.text}")
        raise HTTPException(status_code=e.response.status_code, detail=e.response.text)

    except Exception as e:
        logging.error(f"Terjadi kesalahan: {str(e)}")
        raise HTTPException(status_code=500, detail="Terjadi kesalahan internal")

class FeedbackRequest(BaseModel):
    user_answer: str
    expected_answer: str
    
@app.post("/generate-feedback/")
async def generate_feedback(request: FeedbackRequest):
    try:
        prompt = f"""
Kamu adalah asisten pengajar untuk siswa SD kelas 3. Siswa memberikan jawaban berikut untuk soal isian.

**Jawaban Siswa:** {request.user_answer.strip()}
**Jawaban Ideal:** {request.expected_answer.strip()}

Beri feedback singkat dan membangun, maksimal 2 kalimat. Gunakan bahasa yang mudah dimengerti oleh siswa SD. Jika jawaban siswa salah, berikan petunjuk atau koreksi yang membantu.
"""

        payload = {
            "model": "llama3.1:latest",
            "prompt": prompt,
            "stream": False
        }

        logging.info("Mengirim permintaan feedback ke Ollama...")
        async with httpx.AsyncClient(timeout=60) as client:
            response = await client.post(OLLAMA_URL, json=payload)

        response.raise_for_status()
        result = response.json()
        feedback = result.get("response", "").strip()

        if not feedback:
            raise HTTPException(status_code=500, detail="Ollama tidak memberikan feedback")

        return {"feedback": feedback}

    except Exception as e:
        logging.error(f"Gagal menghasilkan feedback dari Ollama: {e}")
        raise HTTPException(status_code=500, detail=f"Terjadi kesalahan: {str(e)}")