<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\Literacy\LiteracyAnswer;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyOption;
use App\Models\Literacy\LiteracyAssessment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class LiteracyQuestionController extends Controller
{
    public function questions()
    {
        $questions = LiteracyQuestion::all();
        $materials = LiteracyMaterial::all();
        $users = User::all();
        return view('literacy.teacher.questions.index', [
            'questions' => $questions,
            'materials' => $materials,
            'users' => $users,
        ]);
    }

    public function show($id)
    {
        $questions = LiteracyQuestion::findOrFail($id);
        return view('literacy.teacher.questions.index', compact('questions'));
    }

    public function create()
    {
        return view('literacy.teacher.questions.index');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'material_id' => 'required|exists:materials,id',
            'question_text' => 'required|string',
            'type' => 'required|in:multiple_choice,essay',
        ]);

        $question = LiteracyQuestion::create($validated);

        // Jika tipe soal adalah pilihan ganda, simpan opsi jawaban
        if ($request->type === 'multiple_choice' && $request->has('options')) {
            foreach ($request->options as $option) {
                $question->options()->create([
                    'option_text' => $option['text'] ?? null, // Gunakan null jika tidak ada teks
                    'score' => $option['score'] ?? 0, // Pastikan skor selalu ada
                    'is_correct' => isset($option['is_correct']) ? 1 : 0,
                ]);
            }
        }
        // Jika tipe soal adalah isian (essay), simpan skor & jawaban yang benar
        elseif ($request->type === 'essay') {
            $question->update([
                'essay_score' => $request->essay_score ?? 0,
                'essay_answer' => $request->essay_answer ?? null,
            ]);
        }

        return redirect()->back()->with('success', 'Pertanyaan berhasil ditambahkan.');
    }

    public function publishAssessment()
    {
        $users = User::all();
        $questionsCount = LiteracyQuestion::count();

        if ($questionsCount === 0) {
            return redirect()->back()->with('error', 'Belum ada soal yang tersedia untuk asesmen.');
        }

        foreach ($users as $user) {
            LiteracyAssessment::firstOrCreate(
                ['user_id' => $user->id],
                [
                    'status' => 'pending',
                    'score' => 0,
                    'feedback' => '',
                    'assessed_at' => null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
        return redirect()->back()->with('success', 'Asesmen berhasil dipublikasikan untuk semua siswa.');
    }

    public function edit($id)
    {
        $question = LiteracyQuestion::with('options')->findOrFail($id);
        return view('literacy.teacher.questions.index', compact('question'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'material_id' => 'required|exists:materials,id',
            'question_text' => 'required|string|max:255',
            'type' => 'required|string|in:multiple_choice,essay',
            'essay_score' => 'nullable|integer|min:0|max:100',
            'essay_answer' => 'nullable|string',
            'options.*.id' => 'nullable|exists:literacy_options,id',
            'options.*.option_text' => 'required_if:type,multiple_choice|string|max:255',
            'options.*.score' => 'nullable|integer|min:0',
            'options.*.is_correct' => 'nullable|boolean',
        ]);

        $question = LiteracyQuestion::findOrFail($id);
        $question->update([
            'material_id' => $request->material_id, // Tambahkan material_id
            'question_text' => $request->question_text,
            'type' => $request->type,
            'essay_score' => $request->type === 'essay' ? $request->essay_score : null,
            'essay_answer' => $request->type === 'essay' ? $request->essay_answer : null,
        ]);

        // Jika pertanyaan adalah pilihan ganda, kelola opsi jawaban
        if ($request->type === 'multiple_choice' && $request->has('options')) {
            $existingOptionIds = $question->options->pluck('id')->toArray();
            $newOptionIds = collect($request->options)->pluck('id')->filter()->toArray();

            // Hapus opsi yang tidak ada di input baru
            $optionsToDelete = array_diff($existingOptionIds, $newOptionIds);
            LiteracyOption::whereIn('id', $optionsToDelete)->delete();

            foreach ($request->options as $option) {
                if (isset($option['id'])) {
                    // Update opsi yang sudah ada
                    LiteracyOption::where('id', $option['id'])->update([
                        'option_text' => $option['option_text'],
                        'score' => $option['score'] ?? 0,
                        'is_correct' => isset($option['is_correct']) ? 1 : 0,
                    ]);
                } else {
                    // Tambahkan opsi baru
                    $question->options()->create([
                        'option_text' => $option['option_text'],
                        'score' => $option['score'] ?? 0,
                        'is_correct' => isset($option['is_correct']) ? 1 : 0,
                    ]);
                }
            }
        }

        return redirect()->route('literacy_teacher_questions')->with('success', 'Pertanyaan berhasil diperbarui!');
    }

    public function destroy($id)
    {
        $question = LiteracyQuestion::findOrFail($id);
        $question->delete();

        return redirect()->route('literacy_teacher_questions')->with('success', 'Question deleted successfully.');
    }
}
