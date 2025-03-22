from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from huggingface_hub import InferenceClient
import random

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Ganti dengan token API Hugging Face kamu
HF_TOKEN = "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"
client = InferenceClient(model="TinyLlama/TinyLlama-1.1B-chat-v1.0", token=HF_TOKEN)

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
        "Pantun Nasihat": "Jalan-jalan ke kota Blitar,\nJangan lupa membeli roti.\nRajin belajar sejak kecil,\nAgar sukses di kemudian hari.",
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
        # Pilih 2 cerita, 1 pantun, dan 1 puisi secara acak
        selected_stories = random.sample(list(data_sources["cerita"].keys()), 2)
        selected_pantun = random.choice(list(data_sources["pantun"].keys()))
        selected_puisi = random.choice(list(data_sources["puisi"].keys()))

        # Buat format prompt dengan cerita, pantun, dan puisi
        story_prompts = "\n\n".join([
            f"**{story}**\n{data_sources['cerita'][story]}"
            for story in selected_stories
        ])
        
        pantun_prompt = f"**{selected_pantun}**\n{data_sources['pantun'][selected_pantun]}"
        puisi_prompt = f"**{selected_puisi}**\n{data_sources['puisi'][selected_puisi]}"

        # Gabungkan semua prompt dengan instruksi eksplisit
        full_prompt = f"""
Berdasarkan teks berikut ini, buatlah soal pilihan ganda dengan format berikut:
- Setiap soal harus memiliki **1 pertanyaan** dan **4 pilihan jawaban (A, B, C, D)**.
- Berikan **jawaban yang benar dengan format 'Jawaban Benar: X'** di akhir setiap soal.
- Buat total **5 soal** dari teks yang tersedia.

### **Teks Bacaan**
{story_prompts}

{pantun_prompt}

{puisi_prompt}

### **Contoh Format Soal**
1. Siapakah tokoh utama dalam cerita '{selected_stories[0]}'?
   A. Bawang Putih  
   B. Timun Mas  
   C. {selected_stories[0]}  
   D. Si Kancil  
   **Jawaban Benar: C**

Sekarang, buatlah **5 soal pilihan ganda** berdasarkan teks di atas.
"""

        # Kirim permintaan ke model TinyLlama
        response = client.text_generation(full_prompt, max_new_tokens=400)

        return {
            "selected_stories": selected_stories,
            "selected_pantun": selected_pantun,
            "selected_puisi": selected_puisi,
            "generated_questions": response
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")