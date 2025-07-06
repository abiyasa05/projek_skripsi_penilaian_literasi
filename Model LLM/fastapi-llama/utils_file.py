import os
from docx import Document
import fitz

def read_text_from_file(filepath: str, start_page: int = 0, max_chars: int = 5000) -> str:
    ext = os.path.splitext(filepath)[1].lower()

    try:
        if ext == '.pdf':
            doc = fitz.open(filepath)
            if start_page >= len(doc):
                return ""
            text = ""
            for page_num in range(start_page, len(doc)):
                text += doc[page_num].get_text()
                if len(text) >= max_chars:
                    break
            return text[:max_chars]

        elif ext == '.docx':
            doc = Document(filepath)
            paragraphs = [para.text.strip() for para in doc.paragraphs if para.text.strip()]
            if not paragraphs:
                return ""

            para_per_page = 20
            if start_page > 0:
                start_index = start_page * para_per_page
                if start_index >= len(paragraphs):
                    return ""
                selected_paragraphs = paragraphs[start_index:]
            else:
                selected_paragraphs = paragraphs

            combined_text = "\n".join(selected_paragraphs)
            return combined_text[:max_chars]

        elif ext == '.txt':
            with open(filepath, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            if not lines:
                return ""

            lines_per_page = 40
            if start_page > 0:
                start_index = start_page * lines_per_page
                if start_index >= len(lines):
                    return ""
                selected_lines = lines[start_index:]
            else:
                selected_lines = lines

            combined_text = "".join(selected_lines)
            return combined_text[:max_chars]

        else:
            raise Exception(f"Format file tidak didukung: {ext}")

    except Exception as e:
        raise Exception(f"Gagal membaca file {ext.upper()}: {e}")
