<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class LiteracyGenerateQuestionsController extends Controller
{
    function generate_questions()
    {
        $generate_questions = LiteracyQuestion::all();
        $materials = LiteracyMaterial::all();
        $users = User::all();
        $questions = LiteracyQuestion::all();
        return view('literacy.teacher.generate_questions.index', [
            'generate_questions' => $generate_questions,
            'materials' => $materials,
            'users' => $users,
            'questions' => $questions,
        ]);
    }

    function generate_from_ai(Request $request)
    {
        try {
            $fastApiUrl = 'http://127.0.0.1:8001/generate/'; // Pastikan ini benar

            $response = Http::timeout(60)->post($fastApiUrl, [
                'content' => $request->input('content'),
            ]);

            if ($response->successful()) {
                return response()->json([
                    'status' => 'success',
                    'generated_questions' => $response->json()['generated_questions'] ?? "No questions generated."
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