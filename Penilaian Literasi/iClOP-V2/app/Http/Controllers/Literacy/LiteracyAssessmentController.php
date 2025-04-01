<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyAssessment;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyOption;
use App\Models\Literacy\LiteracyAnswer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class LiteracyAssessmentController extends Controller
{
    public function __construct()
    {
        // Middleware memastikan hanya student yang bisa mengakses
        $this->middleware(function ($request, $next) {
            if (Auth::user()->role !== 'student') {
                abort(403, 'Unauthorized action.');
            }
            return $next($request);
        });
    }

    /**
     * Menampilkan daftar asesmen yang sedang berjalan atau sudah selesai untuk student yang login.
     */
    public function index()
    {
        $assessments = LiteracyAssessment::where('user_id', Auth::id())->get();

        return view('literacy.student.assessments.index', compact('assessments'));
    }

    /**
     * Memulai asesmen dan mengubah status menjadi "in_progress".
     */
    public function start($id)
    {
        $assessment = LiteracyAssessment::where('id', $id)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        // Ubah status asesmen menjadi in_progress
        $assessment->update(['status' => 'in_progress']);

        // Ambil semua pertanyaan terkait asesmen ini
        $questions = LiteracyQuestion::all(); // Sesuaikan jika ada filter

        // Insert jawaban kosong jika belum ada
        foreach ($questions as $question) {
            LiteracyAnswer::updateOrInsert(
                [
                    'assessment_id' => $assessment->id,
                    'question_id' => $question->id,
                ],
                [
                    'option_id' => null,
                    'answer_text' => null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }

        return redirect()->route('literacy_assessments_show', $id);
    }

    /**
     * Menampilkan halaman asesmen dengan pertanyaan yang diurutkan.
     */
    public function show($id)
    {
        $assessment = LiteracyAssessment::where('id', $id)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        // Ambil semua pertanyaan, urutkan pilihan ganda dulu baru essay
        $questions = LiteracyQuestion::orderByRaw("FIELD(type, 'multiple_choice', 'essay')")
            ->with([
                'answers' => function ($query) use ($id) {
                    $query->where('assessment_id', $id);
                }
            ])
            ->get();

        return view('literacy.student.assessments.assessment', compact('assessment', 'questions'));
    }

    /**
     * Melanjutkan asesmen yang belum selesai.
     */
    public function continue($id)
    {
        $assessment = LiteracyAssessment::where('id', $id)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        return redirect()->route('literacy_assessments_show', $id);
    }

    /**
     * Menyimpan jawaban siswa ke database secara otomatis saat memilih atau mengisi jawaban.
     */
    public function storeAnswer(Request $request, $assessmentId): JsonResponse
    {
        Log::info('Request Data:', $request->all());

        $request->validate([
            'question_id' => 'required|exists:literacy_questions,id',
            'answer' => 'nullable|string',
        ]);

        // Pastikan pengguna memiliki asesmen ini
        $assessment = LiteracyAssessment::where('id', $assessmentId)
            ->where('user_id', Auth::id())
            ->first();

        if (!$assessment) {
            return response()->json(['error' => 'Asesmen tidak ditemukan'], 404);
        }

        $questionId = $request->question_id;
        $answerValue = $request->answer;

        $question = LiteracyQuestion::find($questionId);
        if (!$question) {
            return response()->json(['error' => 'Pertanyaan tidak ditemukan'], 404);
        }

        $answerData = ['option_id' => null, 'answer_text' => $answerValue];

        if ($question->type === 'multiple_choice') {
            $option = LiteracyOption::where('id', $answerValue)
                ->where('question_id', $questionId)
                ->first();

            if (!$option) {
                return response()->json(['error' => 'Jawaban tidak valid'], 400);
            }

            $answerData = ['option_id' => $option->id, 'answer_text' => null];
        }

        LiteracyAnswer::updateOrCreate(
            [
                'assessment_id' => $assessment->id,
                'question_id' => $questionId,
            ],
            $answerData
        );

        // Hitung jumlah pertanyaan dalam asesmen ini
        $totalQuestions = $assessment->questions()->count();

        // Hitung jumlah pertanyaan yang sudah dijawab
        $answeredQuestions = LiteracyAnswer::where('assessment_id', $assessment->id)
            ->where(function ($query) {
                $query->whereNotNull('option_id')
                    ->orWhere('answer_text', '!=', '');
            })
            ->count();

        Log::info('Answered Questions:', ['answered' => $answeredQuestions, 'total' => $totalQuestions]);

        // Jika semua pertanyaan sudah dijawab, update status ke `completed`
        if ($answeredQuestions >= $totalQuestions) {
            $assessment->update(['status' => 'completed']);
        }

        return response()->json(['success' => true]);
    }

    public function submitAssessment($id)
    {
        try {
            $user = Auth::user();
            $assessment = LiteracyAssessment::where('id', $id)
                ->where('user_id', $user->id)
                ->firstOrFail();

            if ($assessment->status !== 'in_progress') {
                return response()->json(['error' => 'Asesmen tidak sedang berjalan.'], 400);
            }

            $answers = LiteracyAnswer::where('assessment_id', $id)->get();

            $correctWeight = 0; // Total bobot jawaban benar
            $totalWeight = 0;   // Total bobot semua soal

            foreach ($answers as $answer) {
                $question = LiteracyQuestion::find($answer->question_id);
                if (!$question)
                    continue;

                $weight = $question->weight ?? ($question->type === 'essay' ? 5 : 1);
                $totalWeight += $weight; // Tambah bobot soal ke total

                if ($question->type === 'multiple_choice') {
                    // Cek apakah jawaban pilihan ganda benar
                    if ($answer->option_id && LiteracyOption::where('id', $answer->option_id)->where('is_correct', true)->exists()) {
                        $correctWeight += $weight;
                    }
                } elseif ($question->type === 'essay') {
                    // Ambil kunci jawaban esai
                    $correctAnswer = strtolower(trim($question->essay_answer));
                    $userAnswer = strtolower(trim($answer->answer_text));

                    // Jika jawaban sama persis, beri skor penuh
                    if ($userAnswer === $correctAnswer) {
                        $correctWeight += $weight;
                    }
                }
            }

            // Hitung skor akhir berdasarkan bobot
            $score = $totalWeight > 0 ? ($correctWeight / $totalWeight) * 100 : 0;

            // Simpan skor dan ubah status asesmen ke 'completed'
            $assessment->update([
                'score' => round($score, 2),
                'status' => 'completed',
                'assessed_at' => now(),
            ]);

            // Buat asesmen baru untuk percobaan berikutnya
            LiteracyAssessment::create([
                'user_id' => $user->id,
                'status' => 'pending',
                'score' => null,
                'feedback' => '',
                'assessed_at' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            return response()->json(['message' => 'Asesmen berhasil diselesaikan.', 'score' => round($score, 2)], 200);

        } catch (\Exception $e) {
            return response()->json(['error' => 'Terjadi kesalahan: ' . $e->getMessage()], 500);
        }
    }

    public function viewResult($id)
    {
        // Ambil asesmen berdasarkan ID, pastikan asesmen milik user dan statusnya sudah 'completed'
        $assessment = LiteracyAssessment::where('id', $id)
            ->where('user_id', Auth::id())
            ->where('status', 'completed')
            ->firstOrFail();

        // Ambil semua pertanyaan, beserta jawaban dan opsi untuk asesmen ini
        $questions = LiteracyQuestion::with([
            'answers' => function ($query) use ($id) {
                $query->where('assessment_id', $id);
            },
            'options'
        ])->get();

        return view('literacy.student.assessments.result', compact('assessment', 'questions'));
    }

    public function result($id)
    {
        $assessment = LiteracyAssessment::where('id', $id)
            ->where('user_id', Auth::id())
            ->where('status', 'completed')
            ->firstOrFail();

        $questions = LiteracyQuestion::with([
            'answers' => function ($query) use ($id) {
                $query->where('assessment_id', $id);
            },
            'options'
        ])->get();

        return view('literacy.student.assessments.result', compact('assessment', 'questions'));
    }
}
