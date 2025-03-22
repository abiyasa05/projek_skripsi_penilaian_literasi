<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyAssessment;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\Literacy\LiteracyAnswer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
            ->where('user_id', Auth::id()) // Pastikan hanya asesmen milik student tersebut
            ->firstOrFail();

        $assessment->update(['status' => 'in_progress']);

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
        $questions = LiteracyQuestion::orderByRaw("FIELD(type, 'multiple_choice', 'essay')")->get();

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
    public function storeAnswer(Request $request, $assessmentId)
    {
        $request->validate([
            'question_id' => 'required|exists:literacy_questions,id',
            'answer' => 'nullable|string',
        ]);

        $assessment = LiteracyAssessment::where('id', $assessmentId)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        // Simpan atau update jawaban siswa
        LiteracyAnswer::updateOrCreate(
            [
                'assessment_id' => $assessment->id,
                'user_id' => Auth::id(),
                'question_id' => $request->question_id,
            ],
            [
                'answer' => $request->answer,
            ]
        );

        // Cek apakah semua pertanyaan telah dijawab
        $totalQuestions = LiteracyQuestion::count();
        $answeredQuestions = LiteracyAnswer::where('assessment_id', $assessment->id)
            ->whereNotNull('answer')
            ->count();

        // Jika semua pertanyaan sudah dijawab, ubah status asesmen menjadi "completed"
        if ($answeredQuestions >= $totalQuestions) {
            $assessment->update(['status' => 'completed']);
        }

        return response()->json(['success' => true]);
    }
}
