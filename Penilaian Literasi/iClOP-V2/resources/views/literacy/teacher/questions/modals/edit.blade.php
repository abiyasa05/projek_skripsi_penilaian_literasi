<!-- Modal Edit Pertanyaan -->
<div class="modal fade" id="modalEditPertanyaan{{ $question->id }}" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Pertanyaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="{{ route('literacy_questions_update', $question->id) }}" method="POST">
                @csrf
                @method('PUT')
                <input type="hidden" name="question_id" value="{{ $question->id }}">

                <div class="modal-body">
                    <!-- Teks Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_question_text" class="form-label">Pertanyaan</label>
                        <textarea name="question_text" class="form-control"
                            required>{{ $question->question_text }}</textarea>
                    </div>

                    <!-- Tipe Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_questionType" class="form-label">Tipe Pertanyaan</label>
                        <select name="type" class="form-control edit_questionType" required>
                            <option value="multiple_choice" {{ $question->type == 'multiple_choice' ? 'selected' : '' }}>
                                Pilihan Ganda</option>
                            <option value="essay" {{ $question->type == 'essay' ? 'selected' : '' }}>Isian</option>
                        </select>
                    </div>

                    <!-- Opsi Jawaban -->
                    <div class="mb-3 edit_multipleChoiceOptions"
                        style="display: {{ $question->type == 'multiple_choice' ? 'block' : 'none' }};">
                        <label class="form-label">Opsi Jawaban</label>
                        <div class="edit_answerOptions">
                            @foreach ($question->options as $index => $option)
                                <div class="option-group mb-2 d-flex align-items-center gap-2">
                                    <input type="hidden" name="options[{{ $index }}][id]" value="{{ $option->id }}">

                                    <input type="text" name="options[{{ $index }}][option_text]" class="form-control"
                                        style="width: 40%;" value="{{ $option->option_text }}" required>

                                    <input type="number" name="options[{{ $index }}][score]" class="form-control"
                                        style="width: 15%;" value="{{ $option->score }}" min="0" max="100" required>

                                    <!-- Tambahkan margin kiri agar checkbox lebih rata -->
                                    <label class="d-flex align-items-center ms-3">
                                        <input type="checkbox" name="options[{{ $index }}][is_correct]" value="1"
                                            class="me-2" {{ $option->is_correct ? 'checked' : '' }}>
                                        <span>Benar</span>
                                    </label>

                                    <button type="button" class="btn btn-danger btn-sm remove-option">X</button>
                                </div>
                            @endforeach
                        </div>
                        <button type="button" class="btn btn-success btn-sm addOption">+ Tambah Opsi</button>
                    </div>

                    <!-- Skor untuk pertanyaan Isian -->
                    <div id="edit_essayScoreField" class="mb-3"
                        style="display: {{ $question->type == 'essay' ? 'block' : 'none' }};">
                        <label for="edit_essay_score" class="form-label">Skor untuk Isian</label>
                        <input type="number" name="essay_score" id="edit_essay_score" class="form-control" min="0"
                            max="100" value="{{ $question->essay_score ?? '' }}" placeholder="Masukkan skor">
                    </div>

                    <!-- Jawaban untuk Isian -->
                    <div id="edit_essayReferenceAnswerField" class="mb-3"
                        style="display: {{ $question->type == 'essay' ? 'block' : 'none' }};">
                        <label for="edit_essay_answer" class="form-label">Jawaban Isian</label>
                        <textarea name="essay_answer" id="edit_essay_answer" class="form-control"
                            placeholder="Masukkan jawaban referensi">{{ $question->essay_answer ?? '' }}</textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>