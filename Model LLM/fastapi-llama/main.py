# from fastapi import FastAPI, HTTPException
# from fastapi.middleware.cors import CORSMiddleware
# import httpx
# import logging
# import traceback
# import random  # Untuk memilih cerita secara acak

# app = FastAPI()

# OLLAMA_URL = "http://192.168.60.92:11434/api/generate"

# # Konfigurasi Logging
# logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# # Data ringkasan cerita
# summaries = {
#     "Malin Kundang": "Malin Kundang adalah seorang anak dari keluarga miskin yang menjadi kaya raya namun menolak mengakui ibunya, hingga akhirnya dikutuk menjadi batu.",
#     "Bawang Merah Bawang Putih": "Bawang Putih adalah gadis baik hati yang diperlakukan buruk oleh ibu dan saudara tirinya, tetapi kebaikannya membuahkan hasil berkat ikan ajaib.",
#     "Sangkuriang": "Sangkuriang jatuh cinta pada ibunya, Dayang Sumbi, dan diberi tugas mustahil untuk membangun perahu dalam satu malam. Ia gagal dan akhirnya marah, menendang perahu hingga menjadi Gunung Tangkuban Perahu.",
#     "Si Kancil": "Si Kancil dengan kecerdikannya berhasil menipu buaya untuk menyeberangi sungai dengan aman."
# }

# @app.get("/generate/")
# async def generate_text():
#     try:
#         # Pilih cerita secara acak
#         selected_story = random.choice(list(summaries.keys()))
#         story_summary = summaries[selected_story]

#         # Buat prompt untuk Ollama
#         prompt = f"""Buatlah tiga soal literasi dan jawabannya berdasarkan ringkasan cerita berikut:
        
#         Cerita:
#         {story_summary}

#         Format output:
#         Soal 1: [Tulis soal pertama di sini]
#         Jawaban: [Tulis jawaban pertama di sini]

#         Soal 2: [Tulis soal kedua di sini]
#         Jawaban: [Tulis jawaban kedua di sini]

#         Soal 3: [Tulis soal ketiga di sini]
#         Jawaban: [Tulis jawaban ketiga di sini]
#         """

#         payload = {
#             "model": "llama3.1:latest",
#             "prompt": prompt,
#             "stream": False
#         }

#         logging.info(f"Sending request to Ollama: {payload}")

#         # Kirim request ke Ollama dengan timeout
#         async with httpx.AsyncClient(timeout=30) as client:
#             response = await client.post(OLLAMA_URL, json=payload)

#         # Log response dari Ollama
#         logging.info(f"Response status code: {response.status_code}")
#         logging.info(f"Response content: {response.text}")

#         # Raise error jika status code bukan 2xx
#         response.raise_for_status()

#         # Coba parse JSON response
#         try:
#             result = response.json()
#             logging.info(f"Parsed response: {result}")
#             return {
#                 "selected_story": selected_story,
#                 "generated_questions": result
#             }
#         except Exception as e:
#             logging.error(f"Failed to parse JSON response: {response.text}")
#             raise HTTPException(status_code=500, detail="Invalid response format from Ollama API")

#     except httpx.HTTPStatusError as e:
#         logging.error(f"HTTP error from Ollama API: {e.response.text}")
#         raise HTTPException(status_code=e.response.status_code, detail=e.response.text)

#     except Exception as e:
#         error_trace = traceback.format_exc()  # Dapatkan traceback lengkap
#         logging.error(f"Unexpected error: {error_trace}")  # Cetak error di log
#         raise HTTPException(status_code=500, detail="Internal Server Error")

# # Endpoint untuk mengecek koneksi ke Ollama
# @app.get("/test-connection/")
# async def test_connection():
#     try:
#         async with httpx.AsyncClient(timeout=10) as client:
#             response = await client.get("http://192.168.60.92:11434")
#         return {"status": response.status_code, "content": response.text}
#     except Exception as e:
#         logging.error(f"Connection test failed: {str(e)}")
#         return {"error": str(e)}

# app = FastAPI()

# OLLAMA_URL = "http://192.168.60.92:11434/api/generate"

# logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# class GenerateRequest(BaseModel):
#     content: str  # Menerima teks bebas, bukan content_id

# @app.post("/generate/")
# async def generate_text(request: GenerateRequest):
#     try:
#         if not request.content.strip():
#             raise HTTPException(status_code=400, detail="Content cannot be empty")

#         prompt = f"""Buatlah tiga soal literasi dan jawabannya berdasarkan teks berikut:

#         {request.content}

#         Format output:
#         Soal 1: [Tulis soal pertama di sini]
#         Jawaban: [Tulis jawaban pertama di sini]
#         Jawaban: [Tulis jawaban kedua di sini]

#         Soal 2: [Tulis soal kedua di sini]
#         Jawaban: [Tulis jawaban pertama di sini]
#         Jawaban: [Tulis jawaban kedua di sini]

#         Soal 3: [Tulis soal ketiga di sini]
#         Jawaban: [Tulis jawaban pertama di sini]
#         Jawaban: [Tulis jawaban kedua di sini]
#         """

#         payload = {
#             "model": "llama3.1:latest",
#             "prompt": prompt,
#             "stream": False
#         }

#         async with httpx.AsyncClient(timeout=30) as client:
#             response = await client.post(OLLAMA_URL, json=payload)
#             response.raise_for_status()
#             result = response.json()
#             return result

#     except Exception as e:
#         logging.error(f"Error: {traceback.format_exc()}")
#         raise HTTPException(status_code=500, detail="Internal Server Error")

# from fastapi import FastAPI, HTTPException
# from pydantic import BaseModel
# import httpx
# import logging
# import traceback

# app = FastAPI()

# OLLAMA_URL = "http://192.168.60.92:11434/api/generate"

# class GenerateRequest(BaseModel):
#     content: str = "Buatlah soal literasi berdasarkan teks anak-anak tentang lingkungan."

# @app.post("/generate/")
# async def generate_text(request: GenerateRequest):
#     # Prompt default jika kosong
#     prompt = f"""Buatlah tiga soal literasi berdasarkan teks berikut:

#     {request.content}

#     Format output:
#     Soal 1: [Tulis soal pertama di sini]
#     Jawaban: [Tulis jawaban pertama di sini]

#     Soal 2: [Tulis soal kedua di sini]
#     Jawaban: [Tulis jawaban kedua di sini]

#     Soal 3: [Tulis soal ketiga di sini]
#     Jawaban: [Tulis jawaban ketiga di sini]
#     """

#     payload = {
#         "model": "llama3.1:latest",
#         "prompt": prompt,
#         "stream": False
#     }

#     async with httpx.AsyncClient() as client:
#         response = await client.post(OLLAMA_URL, json=payload)
#         response.raise_for_status()
#         return response.json()

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
import httpx
import logging
import random

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Ubah sesuai kebutuhan jika ada pembatasan domain
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

OLLAMA_URL = "http://localhost:11434/api/generate"

# Konfigurasi Logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# Data ringkasan cerita, pantun, dan puisi (bisa ditambah lagi)
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
        # Pilih 3 cerita, 1 pantun, dan 1 puisi secara acak
        selected_stories = random.sample(list(data_sources["cerita"].keys()), 3)
        selected_pantun = random.choice(list(data_sources["pantun"].keys()))
        selected_puisi = random.choice(list(data_sources["puisi"].keys()))
        
        # Buat format prompt dengan cerita, pantun, dan puisi
        story_prompts = "\n\n".join([
            f"**{story}**\n\n{data_sources['cerita'][story]}\n\nBerdasarkan cerita ini, buatlah **3 soal literasi** dalam format pilihan ganda." 
            for story in selected_stories
        ])
        
        pantun_prompt = f"**{selected_pantun}**\n\n{data_sources['pantun'][selected_pantun]}\n\nBerdasarkan pantun ini, buatlah **1 soal literasi** dalam format pilihan ganda."
        
        puisi_prompt = f"**{selected_puisi}**\n\n{data_sources['puisi'][selected_puisi]}\n\nBerdasarkan puisi ini, buatlah **1 soal literasi** dalam format pilihan ganda."
        
        # Gabungkan semua prompt
        full_prompt = f"""
        Buatlah soal berdasarkan teks berikut ini:
        
        {story_prompts}
        
        {pantun_prompt}
        
        {puisi_prompt}
        
        Pastikan soal yang dibuat beragam, berbobot untuk siswa SD, dan tidak hanya berasal dari satu jenis teks.
        """

        payload = {
            "model": "llama3.1:latest",
            "prompt": full_prompt,
            "stream": False
        }

        logging.info(f"Mengirim permintaan ke Ollama: {payload}")

        # Kirim request ke Ollama
        async with httpx.AsyncClient(timeout=60) as client:
            response = await client.post(OLLAMA_URL, json=payload)

        # Log response dari Ollama
        logging.info(f"Response status code: {response.status_code}")
        logging.info(f"Response content: {response.text}")

        # Raise error jika status code bukan 2xx
        response.raise_for_status()

        # Ambil hasil respon dan parsing JSON
        result = response.json()

        # Pastikan hasil tidak kosong
        generated_text = result.get("response", "").strip()
        if not generated_text:
            raise HTTPException(status_code=500, detail="Ollama tidak menghasilkan pertanyaan")

        return {
            "selected_stories": selected_stories,
            "selected_pantun": selected_pantun,
            "selected_puisi": selected_puisi,
            "generated_questions": generated_text
        }

    except httpx.HTTPStatusError as e:
        logging.error(f"HTTP error dari Ollama API: {e.response.text}")
        raise HTTPException(status_code=e.response.status_code, detail=e.response.text)

    except Exception as e:
        logging.error(f"Terjadi kesalahan: {str(e)}")
        raise HTTPException(status_code=500, detail="Terjadi kesalahan internal")

# from fastapi import FastAPI, HTTPException
# from fastapi.middleware.cors import CORSMiddleware
# import httpx
# import logging
# import random
# import re
# import traceback

# app = FastAPI()

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["*"],
#     allow_credentials=True,
#     allow_methods=["*"],
#     allow_headers=["*"],
# )

# OLLAMA_URL = "http://192.168.60.92:11434/api/generate"

# # Konfigurasi Logging
# logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# # Data ringkasan cerita, pantun, dan puisi
# data_sources = {
#     "cerita": {
#         "Malin Kundang": "Malin Kundang adalah seorang anak dari keluarga miskin yang menjadi kaya raya namun menolak mengakui ibunya, hingga akhirnya dikutuk menjadi batu.",
#         "Bawang Merah Bawang Putih": "Bawang Putih adalah gadis baik hati yang diperlakukan buruk oleh ibu dan saudara tirinya, tetapi kebaikannya membuahkan hasil berkat ikan ajaib.",
#         "Sangkuriang": "Sangkuriang jatuh cinta pada ibunya, Dayang Sumbi, dan diberi tugas mustahil untuk membangun perahu dalam satu malam. Ia gagal dan akhirnya marah, menendang perahu hingga menjadi Gunung Tangkuban Perahu.",
#         "Si Kancil": "Si Kancil dengan kecerdikannya berhasil menipu buaya untuk menyeberangi sungai dengan aman.",
#         "Timun Mas": "Seorang ibu tua mendapatkan anak dari biji timun emas. Namun, anak itu harus melarikan diri dari raksasa jahat yang ingin memakannya."
#     },
#     "pantun": {
#         "Pantun Nasihat": "Jalan-jalan ke kota Blitar,\nJangan lupa membeli roti.\nRajin belajar sejak pintar,\nAgar sukses di kemudian hari.",
#         "Pantun Jenaka": "Ke pasar beli ikan teri,\nIkan habis tinggal kepala.\nJangan suka mencuri,\nNanti ketahuan malah celaka."
#     },
#     "puisi": {
#         "Puisi Alam": "Langit biru membentang luas,\nBurung-burung terbang bebas.\nAngin sepoi menyapu dedaunan,\nAlam indah penuh kedamaian.",
#         "Puisi Persahabatan": "Sahabat sejati selalu ada,\nDalam suka dan dalam duka.\nBersama kita jalani hari,\nMengukir cerita tak terlupa."
#     }
# }

# @app.post("/generate/")
# async def generate_text():
#     try:
#         # Pilih 3 cerita, 1 pantun, dan 1 puisi secara acak
#         selected_stories = random.sample(list(data_sources["cerita"].keys()), 3)
#         selected_pantun = random.choice(list(data_sources["pantun"].keys()))
#         selected_puisi = random.choice(list(data_sources["puisi"].keys()))
        
#         # Buat format prompt dengan cerita, pantun, dan puisi
#         story_prompts = "\n\n".join([
#             f"**{story}**\n\n{data_sources['cerita'][story]}\n\nBerdasarkan cerita ini, buatlah **3 soal literasi** dalam format pilihan ganda." 
#             for story in selected_stories
#         ])
        
#         pantun_prompt = f"**{selected_pantun}**\n\n{data_sources['pantun'][selected_pantun]}\n\nBerdasarkan pantun ini, buatlah **1 soal literasi** dalam format pilihan ganda."
        
#         puisi_prompt = f"**{selected_puisi}**\n\n{data_sources['puisi'][selected_puisi]}\n\nBerdasarkan puisi ini, buatlah **1 soal literasi** dalam format pilihan ganda."
        
#         # Gabungkan semua prompt
#         full_prompt = f"""
#         Buatlah soal berdasarkan teks berikut ini:

#         {story_prompts}

#         {pantun_prompt}

#         {puisi_prompt}

#         Format setiap soal:
#         ---
#         **Pertanyaan**
#         A. Pilihan 1
#         B. Pilihan 2
#         C. Pilihan 3
#         D. Pilihan 4
#         Jawaban: (A/B/C/D)
#         ---
#         """

#         payload = {
#             "model": "llama3.1:latest",
#             "prompt": full_prompt,
#             "stream": False
#         }

#         logging.info(f"Mengirim permintaan ke Ollama: {payload}")

#         # Kirim request ke Ollama
#         async with httpx.AsyncClient(timeout=60) as client:
#             response = await client.post(OLLAMA_URL, json=payload)

#         logging.info(f"Response status code: {response.status_code}")
#         logging.info(f"Response content: {response.text}")

#         response.raise_for_status()
#         result = response.json()

#         generated_text = result.get("response", "").strip()
#         if not generated_text:
#             raise HTTPException(status_code=500, detail="Ollama tidak menghasilkan pertanyaan")

#         # Parsing hasil teks menjadi daftar soal
#         questions = []
#         raw_questions = re.split(r'\n\s*\n', generated_text)

#         for raw in raw_questions:
#             lines = raw.strip().split("\n")
#             if len(lines) >= 6:
#                 question_text = lines[0].strip()
#                 options = [f"({opt[0]}) {opt[3:].strip()}" for opt in lines[1:5] if len(opt) > 3]
                
#                 # Ambil jawaban dengan regex
#                 answer_match = re.search(r'Jawaban:\s*\(?([A-D])\)?', raw)
#                 correct_answer = f"({answer_match.group(1)})" if answer_match else "Tidak ditemukan"

#                 questions.append({
#                     "question": question_text,
#                     "options": options,
#                     "correct_answer": correct_answer
#                 })

#         if not questions:
#             raise HTTPException(status_code=500, detail="Parsing soal gagal, format tidak sesuai.")

#         return {
#             "selected_stories": selected_stories,
#             "selected_pantun": selected_pantun,
#             "selected_puisi": selected_puisi,
#             "generated_questions": questions
#         }

#     except httpx.HTTPStatusError as e:
#         logging.error(f"HTTP error dari Ollama API: {e.response.text}")
#         raise HTTPException(status_code=e.response.status_code, detail=e.response.text)

#     except Exception as e:
#         logging.error(f"Terjadi kesalahan: {str(e)}")
#         logging.error(traceback.format_exc())  # Cetak stack trace lengkap
#         raise HTTPException(status_code=500, detail="Terjadi kesalahan internal")