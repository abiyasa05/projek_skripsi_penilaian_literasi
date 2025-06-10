<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyGeneratedText;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Smalot\PdfParser\Parser;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\Element\Text;
use PhpOffice\PhpWord\Element\TextRun;

class LiteracyGenerateQuestionsController extends Controller
{
    public function __construct()
    {
        // Middleware memastikan hanya teacher yang bisa mengakses
        $this->middleware(function ($request, $next) {
            if (Auth::user()->role !== 'teacher') {
                abort(403, 'Unauthorized action.');
            }
            return $next($request);
        });
    }

    public function generate_questions()
    {
        $generate_questions = LiteracyQuestion::all();
        $materials = LiteracyMaterial::all();
        $users = User::all();
        $questions = LiteracyQuestion::all();

        // Ambil generate_text berdasarkan user yang sedang login
        $latestGeneratedText = LiteracyGeneratedText::where('user_id', Auth::id())->latest()->first();

        // Mengirimkan data terbaru ke view
        return view('literacy.teacher.generate_questions.index', [
            'generate_questions' => $generate_questions,
            'materials' => $materials,
            'users' => $users,
            'questions' => $questions,
            'latestGeneratedText' => $latestGeneratedText,
        ]);
    }

    // Fungsi untuk menyimpan dan meng-generate pertanyaan
    // public function generate_from_ai(Request $request)
    // {
    //     try {
    //         $fastApiUrl = 'http://127.0.0.1:8001/generate/';

    //         // Mengirim request ke FastAPI
    //         $response = Http::timeout(300)->post($fastApiUrl, [
    //             'content' => $request->input('content'),
    //         ]);

    //         // Jika response dari API berhasil
    //         if ($response->successful()) {
    //             // Cek apakah data sudah ada
    //             $existingText = LiteracyGeneratedText::where('user_id', auth()->id())
    //                 ->where('generate_text', $response->json()['generated_questions'])
    //                 ->first();

    //             if (!$existingText) {
    //                 // Menyimpan hasil generate ke database hanya jika belum ada
    //                 $generatedText = new LiteracyGeneratedText();
    //                 $generatedText->user_id = auth()->id();
    //                 $generatedText->generate_text = $response->json()['generated_questions'] ?? "No questions generated.";
    //                 $generatedText->save();
    //             }

    //             // Ambil hasil generate terbaru dari database
    //             $latestGeneratedText = LiteracyGeneratedText::where('user_id', auth()->id())->latest()->first()->generate_text;

    //             // Mengembalikan response sukses dengan pertanyaan yang dihasilkan
    //             return response()->json([
    //                 'status' => 'success',
    //                 'generated_questions' => $latestGeneratedText // Ambil generate_text terbaru
    //             ]);
    //         } else {
    //             return response()->json([
    //                 'status' => 'error',
    //                 'message' => 'Failed to fetch questions from AI.',
    //                 'fastapi_response' => $response->body()
    //             ], $response->status());
    //         }
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => 'Internal Server Error: ' . $e->getMessage()
    //         ], 500);
    //     }
    // }

    // Fungsi untuk menyimpan dan meng-generate pertanyaan
    public function generate_from_ai_last(Request $request)
    {
        $request->validate([
            'material_id' => 'required|exists:literacy_materials,id',
            'question_type' => 'required|in:multiple_choice,essay',
            'question_count' => 'required|integer|min:1|max:20',
        ]);

        try {
            ini_set('max_execution_time', 300);

            $material = LiteracyMaterial::findOrFail($request->material_id);
            $filePath = 'public/' . $material->file_path;

            if (!Storage::exists($filePath)) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'File materi tidak ditemukan: ' . $filePath
                ], 400);
            }

            $fullPath = storage_path('app/' . $filePath);
            $extension = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
            $text = '';

            if ($extension === 'pdf') {
                $parser = new Parser();
                $pdf = $parser->parseFile($fullPath);
                $text = $pdf->getText();
            } elseif ($extension === 'docx') {
                $phpWord = IOFactory::load($fullPath);
                foreach ($phpWord->getSections() as $section) {
                    if (method_exists($section, 'getElements')) {
                        foreach ($section->getElements() as $element) {
                            if ($element instanceof Text) {
                                $text .= $element->getText() . " ";
                            } elseif ($element instanceof TextRun && method_exists($element, 'getElements')) {
                                foreach ($element->getElements() as $subElement) {
                                    if ($subElement instanceof Text) {
                                        $text .= $subElement->getText() . " ";
                                    }
                                }
                            }
                        }
                    }
                }
            } elseif ($extension === 'txt') {
                $text = file_get_contents($fullPath);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Format file tidak didukung.'
                ], 400);
            }

            if (empty(trim($text))) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Isi file tidak dapat dibaca sebagai teks.'
                ], 400);
            }

            $text = mb_convert_encoding($text, 'UTF-8', 'UTF-8');
            $text = strip_tags($text);
            $text = substr($text, 0, length: 3000);

            $response = Http::timeout(300)->asJson()->post('http://127.0.0.1:8001/generate-from-material/', [
                'content' => $text,
                'question_type' => $request->question_type,
                'question_count' => (int) $request->question_count,
            ]);

            if ($response->successful()) {
                $generatedText = LiteracyGeneratedText::create([
                    'user_id' => Auth::id(),
                    'material_id' => $request->material_id,
                    'question_type' => $request->question_type,
                    'generate_text' => $response->json()['generated_questions'],
                    'question_count' => $request->question_count,
                ]);

                return response()->json([
                    'status' => 'success',
                    'generated_questions' => $generatedText->generate_text
                ]);
            }

            Log::error('FastAPI Error Response:', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return response()->json([
                'status' => 'error',
                'message' => 'Gagal menghasilkan soal dari model',
                'response' => $response->json()
            ], $response->status());

        } catch (\Exception $e) {
            Log::error('Generate Error:', ['error' => $e->getMessage()]);
            return response()->json([
                'status' => 'error',
                'message' => 'Terjadi kesalahan internal: ' . $e->getMessage()
            ], 500);
        }
    }

    public function generate_from_ai2(Request $request)
    {
        $request->validate([
            'material_id' => 'required|exists:literacy_materials,id',
            'question_type' => 'required|in:multiple_choice,essay',
            'question_count' => 'required|integer|min:1|max:20',
            'start_page' => 'nullable|integer|min:1',
            'end_page' => 'nullable|integer|min:1',
        ]);

        try {
            ini_set('max_execution_time', 300);

            $material = LiteracyMaterial::findOrFail($request->material_id);
            $filePath = 'public/' . $material->file_path;

            if (!Storage::exists($filePath)) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'File materi tidak ditemukan: ' . $filePath
                ], 400);
            }

            $fullPath = storage_path('app/' . $filePath);
            $extension = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
            $text = '';

            if ($extension === 'pdf') {
                $parser = new Parser();
                $pdf = $parser->parseFile($fullPath);
                $pages = $pdf->getPages();

                $start = $request->input('start_page', 10);
                $end = $request->input('end_page', count($pages));

                // Validasi batas halaman
                if ($start < 1 || $start > count($pages) || $end < $start) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Halaman tidak valid atau melebihi jumlah halaman PDF.'
                    ], 400);
                }

                for ($i = $start - 1; $i < $end && $i < count($pages); $i++) {
                    $text .= $pages[$i]->getText();
                }
            } elseif ($extension === 'docx') {
                $phpWord = IOFactory::load($fullPath);
                foreach ($phpWord->getSections() as $section) {
                    if (method_exists($section, 'getElements')) {
                        foreach ($section->getElements() as $element) {
                            if ($element instanceof Text) {
                                $text .= $element->getText() . " ";
                            } elseif ($element instanceof TextRun && method_exists($element, 'getElements')) {
                                foreach ($element->getElements() as $subElement) {
                                    if ($subElement instanceof Text) {
                                        $text .= $subElement->getText() . " ";
                                    }
                                }
                            }
                        }
                    }
                }
            } elseif ($extension === 'txt') {
                $text = file_get_contents($fullPath);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Format file tidak didukung.'
                ], 400);
            }

            if (empty(trim($text))) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Isi file tidak dapat dibaca sebagai teks.'
                ], 400);
            }

            // Sanitasi dan potong agar tidak melebihi token limit
            $text = mb_convert_encoding($text, 'UTF-8', 'UTF-8');
            $text = strip_tags($text);
            $text = substr($text, 0, 3000); // max 3000 karakter (bisa diatur)

            $response = Http::timeout(300)->asJson()->post('http://127.0.0.1:8001/generate-from-material/', [
                'content' => $text,
                'question_type' => $request->question_type,
                'question_count' => (int) $request->question_count,
            ]);

            if ($response->successful()) {
                $generatedText = LiteracyGeneratedText::create([
                    'user_id' => Auth::id(),
                    'material_id' => $request->material_id,
                    'question_type' => $request->question_type,
                    'generate_text' => $response->json()['generated_questions'],
                    'question_count' => $request->question_count,
                ]);

                return response()->json([
                    'status' => 'success',
                    'generated_questions' => $generatedText->generate_text
                ]);
            }

            Log::error('FastAPI Error Response:', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return response()->json([
                'status' => 'error',
                'message' => 'Gagal menghasilkan soal dari model',
                'response' => $response->json()
            ], $response->status());

        } catch (\Exception $e) {
            Log::error('Generate Error:', ['error' => $e->getMessage()]);
            return response()->json([
                'status' => 'error',
                'message' => 'Terjadi kesalahan internal: ' . $e->getMessage()
            ], 500);
        }
    }

    public function generate_from_ai(Request $request)
    {
        $request->validate([
            'material_id' => 'required|exists:literacy_materials,id',
            'question_type' => 'required|in:multiple_choice,essay',
            'question_count' => 'required|integer|min:1|max:20',
        ]);

        try {
            ini_set('max_execution_time', 300);

            $material = LiteracyMaterial::findOrFail($request->material_id);
            $relativePath = $material->file_path;

            // Kirim permintaan ke FastAPI
            $response = Http::timeout(300)->asJson()->post('http://127.0.0.1:8010/generate-from-file/', [
                'file_name' => $relativePath,
                'question_type' => $request->question_type,
                'question_count' => (int) $request->question_count,
            ]);

            if ($response->successful()) {
                $generatedText = LiteracyGeneratedText::create([
                    'user_id' => Auth::id(),
                    'material_id' => $request->material_id,
                    'question_type' => $request->question_type,
                    'generate_text' => $response->json()['generated_questions'],
                    'question_count' => $request->question_count,
                ]);

                return response()->json([
                    'status' => 'success',
                    'generated_questions' => $generatedText->generate_text
                ]);
            }

            Log::error('FastAPI Error Response:', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return response()->json([
                'status' => 'error',
                'message' => 'Gagal menghasilkan soal dari model',
                'response' => $response->json()
            ], $response->status());

        } catch (\Exception $e) {
            Log::error('Generate Error:', ['error' => $e->getMessage()]);
            return response()->json([
                'status' => 'error',
                'message' => 'Terjadi kesalahan internal: ' . $e->getMessage()
            ], 500);
        }
    }

    // public function generate_from_ai(Request $request)
    // {
    //     $request->validate([
    //         'material_id' => 'required|exists:literacy_materials,id',
    //         'question_type' => 'required|in:multiple_choice,essay',
    //         'question_count' => 'required|integer|min:1|max:20',
    //     ]);

    //     try {
    //         $material = LiteracyMaterial::findOrFail($request->material_id);

    //         // Ambil path file PDF
    //         $filePath = 'public/' . $material->file_path;
    //         if (!Storage::exists($filePath)) {
    //             return response()->json([
    //                 'status' => 'error',
    //                 'message' => 'File materi tidak ditemukan: ' . $filePath
    //             ], 400);
    //         }

    //         // Parse isi PDF halaman 15-17 (index 14 sampai 16)
    //         $parser = new Parser();
    //         $pdf = $parser->parseFile(storage_path('app/' . $filePath));
    //         $pages = $pdf->getPages();

    //         $startPage = 14; // halaman 15 (index mulai 0)
    //         $endPage = 16;   // halaman 17
    //         $totalPages = count($pages);

    //         if ($totalPages < $startPage + 1) {
    //             return response()->json([
    //                 'status' => 'error',
    //                 'message' => 'PDF tidak cukup halaman untuk mengambil halaman 15-17'
    //             ], 400);
    //         }

    //         $text = '';
    //         for ($i = $startPage; $i <= $endPage && $i < $totalPages; $i++) {
    //             $text .= $pages[$i]->getText() . "\n";
    //         }

    //         // Bersihkan dan batasi panjang konten
    //         $text = mb_convert_encoding($text, 'UTF-8', 'UTF-8');
    //         $text = strip_tags($text);
    //         $text = substr($text, 0, 5000); // potong supaya tidak terlalu panjang

    //         // Kirim ke FastAPI
    //         $response = Http::timeout(300)
    //             ->asJson()
    //             ->post('http://127.0.0.1:8001/generate-from-material/', [
    //                 'content' => $text,
    //                 'question_type' => $request->question_type,
    //                 'question_count' => (int) $request->question_count,
    //             ]);

    //         if ($response->successful()) {
    //             $generatedText = LiteracyGeneratedText::create([
    //                 'user_id' => auth()->id(),
    //                 'material_id' => $request->material_id,
    //                 'question_type' => $request->question_type,
    //                 'generate_text' => $response->json()['generated_questions'],
    //                 'question_count' => $request->question_count,
    //             ]);

    //             return response()->json([
    //                 'status' => 'success',
    //                 'generated_questions' => $generatedText->generate_text
    //             ]);
    //         }

    //         Log::error('FastAPI Error Response:', [
    //             'status' => $response->status(),
    //             'body' => $response->body()
    //         ]);

    //         return response()->json([
    //             'status' => 'error',
    //             'message' => 'Gagal menghasilkan soal dari model',
    //             'response' => $response->json()
    //         ], $response->status());

    //     } catch (\Exception $e) {
    //         Log::error('Generate Error:', ['error' => $e->getMessage()]);
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => 'Terjadi kesalahan internal: ' . $e->getMessage()
    //         ], 500);
    //     }
    // }

    public function history_generated_texts()
    {
        $history_generated_texts = LiteracyGeneratedText::where('user_id', Auth::id())
            ->orderBy('created_at', 'desc')
            ->get();

        $materials = LiteracyMaterial::all();

        return view('literacy.teacher.history_generated.index', [
            'history_generated_texts' => $history_generated_texts,
            'materials' => $materials,
        ]);
    }

    public function show_history_generated_texts($id)
    {
        $history_generated_texts = LiteracyGeneratedText::all();
        return view('literacy.teacher.history_generated.index', compact('history_generated_texts'));
    }

    public function history_index()
    {
        $history_generated_texts = LiteracyGeneratedText::orderBy('created_at', 'desc')->get();

        return view('literacy.teacher.history_generated.index', compact('history_generated_texts'));
    }

    public function destroy_history($id)
    {
        $deleted = LiteracyGeneratedText::findOrFail($id);
        $deleted->delete();

        return redirect()->route('literacy_teacher_generate_questions_history')
            ->with('success', 'History deleted successfully.');
    }
}