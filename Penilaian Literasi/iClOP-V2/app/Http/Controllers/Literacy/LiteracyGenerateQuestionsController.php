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

    // function generate_from_ai(Request $request)
    // {
    //     try {
    //         $fastApiUrl = 'http://127.0.0.1:8001/generate/'; // Pastikan ini benar

    //         $response = Http::timeout(300)->post($fastApiUrl, [
    //             'content' => $request->input('content'),
    //         ]);

    //         if ($response->successful()) {
    //             return response()->json([
    //                 'status' => 'success',
    //                 'generated_questions' => $response->json()['generated_questions'] ?? "No questions generated."
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
    public function generate_from_ai(Request $request)
    {
        try {
            $fastApiUrl = 'http://127.0.0.1:8001/generate/';

            // Mengirim request ke FastAPI
            $response = Http::timeout(300)->post($fastApiUrl, [
                'content' => $request->input('content'),
            ]);

            // Jika response dari API berhasil
            if ($response->successful()) {
                // Cek apakah data sudah ada
                $existingText = LiteracyGeneratedText::where('user_id', auth()->id())
                    ->where('generate_text', $response->json()['generated_questions'])
                    ->first();

                if (!$existingText) {
                    // Menyimpan hasil generate ke database hanya jika belum ada
                    $generatedText = new LiteracyGeneratedText();
                    $generatedText->user_id = auth()->id();
                    $generatedText->generate_text = $response->json()['generated_questions'] ?? "No questions generated.";
                    $generatedText->save();
                }

                // Ambil hasil generate terbaru dari database
                $latestGeneratedText = LiteracyGeneratedText::where('user_id', auth()->id())->latest()->first()->generate_text;

                // Mengembalikan response sukses dengan pertanyaan yang dihasilkan
                return response()->json([
                    'status' => 'success',
                    'generated_questions' => $latestGeneratedText // Ambil generate_text terbaru
                ]);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to fetch questions from AI.',
                    'fastapi_response' => $response->body()
                ], $response->status());
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Internal Server Error: ' . $e->getMessage()
            ], 500);
        }
    }
}