{{-- <!-- Modal Edit Pertanyaan -->
<div class="modal fade" id="modalEditPertanyaan{{ $question->id }}" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Pertanyaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="{{ route('literacy_questions_update', $question->id) }}" method="POST" id="editQuestionForm">
                @csrf
                @method('PUT')
                <input type="hidden" name="question_id" id="edit_question_id" value="{{ $question->id }}">
                <div class="modal-body">
                    <!-- Pilihan Materi -->
                    <div class="mb-3">
                        <label for="edit_material_id" class="form-label">Materi</label>
                        <select name="material_id" id="edit_material_id" class="form-control" required>
                            <option value="">Pilih Materi</option>
                            @foreach ($materials as $material)
                            <option value="{{ $material->id }}" {{ $question->material_id == $material->id ? 'selected'
                                : '' }}>
                                {{ $material->title }}
                            </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Teks Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_question_text" class="form-label">Teks Pertanyaan</label>
                        <textarea name="question_text" id="edit_question_text" class="form-control"
                            required>{{ $question->question_text }}</textarea>
                    </div>

                    <!-- Tipe Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_questionType" class="form-label">Tipe Pertanyaan</label>
                        <select name="type" class="form-control" id="edit_questionType" required>
                            <option value="multiple_choice" {{ $question->type == 'multiple_choice' ? 'selected' : ''
                                }}>Pilihan Ganda</option>
                            <option value="essay" {{ $question->type == 'essay' ? 'selected' : '' }}>Isian</option>
                        </select>
                    </div>

                    <!-- Opsi Jawaban (Untuk Pilihan Ganda) -->
                    <div id="edit_multipleChoiceOptions" class="mb-3">
                        <label class="form-label">Opsi Jawaban</label>
                        <div id="edit_answerOptions">
                            @foreach ($question->options as $index => $option)
                            <div class="edit-option-group mb-2 d-flex align-items-center">
                                <input type="text" name="options[{{ $index }}][option_text]"
                                    class="form-control me-2 edit-option-text" style="width: 40%;"
                                    value="{{ $option->option_text }}" required>
                                <input type="number" name="options[{{ $index }}][score]"
                                    class="form-control me-2 edit-option-score" style="width: 20%;"
                                    value="{{ $option->score }}" min="0" max="100" required>
                                <input type="checkbox" name="options[{{ $index }}][is_correct]" value="1"
                                    class="ms-2 edit-correct-answer" {{ $option->is_correct ? 'checked' : '' }}> Jawaban
                                Benar
                                <button type="button" class="btn btn-danger btn-sm ms-2 edit-remove-option">X</button>
                            </div>
                            @endforeach
                        </div>
                        <button type="button" class="btn btn-success btn-sm" id="edit_addOption">+ Tambah Opsi</button>
                    </div>

                    <!-- Skor untuk pertanyaan Isian -->
                    <div id="edit_essayScoreField" class="mb-3">
                        <label for="edit_essay_score" class="form-label">Skor untuk Isian</label>
                        <input type="number" name="essay_score" id="edit_essay_score" class="form-control" min="0"
                            max="100" value="{{ $question->essay_score ?? '' }}" placeholder="Masukkan skor">
                    </div>

                    <!-- Jawaban untuk Isian -->
                    <div id="edit_essayReferenceAnswerField" class="mb-3">
                        <label for="edit_essay_answer" class="form-label">Jawaban Isian</label>
                        <textarea name="essay_answer" id="edit_essay_answer" class="form-control"
                            placeholder="Masukkan jawaban referensi">{{ $question->essay_answer ?? '' }}</textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="edit_saveButton">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const editQuestionType = document.getElementById("edit_questionType");
        const editMultipleChoiceOptions = document.getElementById("edit_multipleChoiceOptions");
        const editAnswerOptions = document.getElementById("edit_answerOptions");
        const editAddOptionBtn = document.getElementById("edit_addOption");
        const editEssayScoreField = document.getElementById("edit_essayScoreField");
        const editEssayReferenceAnswerField = document.getElementById("edit_essayReferenceAnswerField");

        function toggleEditFields() {
            if (editQuestionType.value === "multiple_choice") {
                editMultipleChoiceOptions.style.display = "block";
                editEssayScoreField.style.display = "none";
                editEssayReferenceAnswerField.style.display = "none";
            } else {
                editMultipleChoiceOptions.style.display = "none";
                editEssayScoreField.style.display = "block";
                editEssayReferenceAnswerField.style.display = "block";
            }
        }

        editQuestionType.addEventListener("change", toggleEditFields);
        toggleEditFields();

        editAddOptionBtn.addEventListener("click", function () {
            let index = document.querySelectorAll(".edit-option-group").length;
            let div = document.createElement("div");
            div.classList.add("edit-option-group", "mb-2", "d-flex", "align-items-center");
            div.innerHTML = `
                <input type="text" name="options[${index}][text]" class="form-control me-2 edit-option-text" style="width: 40%;" placeholder="Opsi ${index + 1}" required>
                <input type="number" name="options[${index}][score]" class="form-control me-2 edit-option-score" style="width: 20%;" placeholder="Skor" min="0" max="100" required>
                <input type="checkbox" name="options[${index}][is_correct]" value="1" class="ms-2 edit-correct-answer"> Jawaban Benar
                <button type="button" class="btn btn-danger btn-sm ms-2 edit-remove-option">X</button>
            `;
            editAnswerOptions.appendChild(div);
            div.querySelector(".edit-remove-option").addEventListener("click", function () {
                div.remove();
            });
        });

        document.querySelectorAll(".edit-remove-option").forEach(button => {
            button.addEventListener("click", function () {
                this.parentElement.remove();
            });
        });
    });
</script> --}}


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
                    <!-- Pilihan Materi -->
                    <div class="mb-3">
                        <label for="material_id" class="form-label">Materi</label>
                        <select name="material_id" class="form-control" required>
                            <option value="">Pilih Materi</option>
                            @foreach ($materials as $material)
                                <option value="{{ $material->id }}" {{ $question->material_id == $material->id ? 'selected' : '' }}>
                                    {{ $material->title }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <!-- Teks Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_question_text" class="form-label">Teks Pertanyaan</label>
                        <textarea name="question_text" class="form-control" required>{{ $question->question_text }}</textarea>
                    </div>

                    <!-- Tipe Pertanyaan -->
                    <div class="mb-3">
                        <label for="edit_questionType" class="form-label">Tipe Pertanyaan</label>
                        <select name="type" class="form-control edit_questionType" required>
                            <option value="multiple_choice" {{ $question->type == 'multiple_choice' ? 'selected' : '' }}>Pilihan Ganda</option>
                            <option value="essay" {{ $question->type == 'essay' ? 'selected' : '' }}>Isian</option>
                        </select>
                    </div>

                    <!-- Opsi Jawaban -->
                    <div class="mb-3 edit_multipleChoiceOptions" style="display: {{ $question->type == 'multiple_choice' ? 'block' : 'none' }};">
                        <label class="form-label">Opsi Jawaban</label>
                        <div class="edit_answerOptions">
                            @foreach ($question->options as $index => $option)
                                <div class="option-group mb-2 d-flex align-items-center">
                                    <input type="hidden" name="options[{{ $index }}][id]" value="{{ $option->id }}">
                                    <input type="text" name="options[{{ $index }}][option_text]" class="form-control me-2" style="width: 40%;" value="{{ $option->option_text }}" required>
                                    <input type="number" name="options[{{ $index }}][score]" class="form-control me-2" style="width: 20%;" value="{{ $option->score }}" min="0" max="100" required>
                                    <input type="checkbox" name="options[{{ $index }}][is_correct]" value="1" class="ms-2" {{ $option->is_correct ? 'checked' : '' }}> Benar
                                    <button type="button" class="btn btn-danger btn-sm ms-2 remove-option">X</button>
                                </div>
                            @endforeach
                        </div>
                        <button type="button" class="btn btn-success btn-sm addOption">+ Tambah Opsi</button>
                    </div>

                    <!-- Skor untuk pertanyaan Isian -->
                    <div id="edit_essayScoreField" class="mb-3" style="display: {{ $question->type == 'essay' ? 'block' : 'none' }};">
                        <label for="edit_essay_score" class="form-label">Skor untuk Isian</label>
                        <input type="number" name="essay_score" id="edit_essay_score" class="form-control" min="0" max="100" value="{{ $question->essay_score ?? '' }}" placeholder="Masukkan skor">
                    </div>

                    <!-- Jawaban untuk Isian -->
                    <div id="edit_essayReferenceAnswerField" class="mb-3" style="display: {{ $question->type == 'essay' ? 'block' : 'none' }};">
                        <label for="edit_essay_answer" class="form-label">Jawaban Isian</label>
                        <textarea name="essay_answer" id="edit_essay_answer" class="form-control" placeholder="Masukkan jawaban referensi">{{ $question->essay_answer ?? '' }}</textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- <script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".addOption").forEach(function (btn) {
            btn.addEventListener("click", function (e) {
                let container = this.previousElementSibling;
                let index = container.querySelectorAll(".option-group").length;
                let div = document.createElement("div");

                div.classList.add("option-group", "mb-2", "d-flex", "align-items-center");
                div.innerHTML = `
                    <input type="text" name="options[${index}][option_text]" class="form-control me-2" style="width: 40%;" placeholder="Opsi ${index + 1}" required>
                    <input type="number" name="options[${index}][score]" class="form-control me-2" style="width: 20%;" placeholder="Skor" min="0" max="100" required>
                    <input type="checkbox" name="options[${index}][is_correct]" value="1" class="ms-2"> Benar
                    <button type="button" class="btn btn-danger btn-sm ms-2 remove-option">X</button>
                `;

                container.appendChild(div);
            });
        });

        document.addEventListener("click", function (e) {
            if (e.target.classList.contains("remove-option")) {
                e.target.parentElement.remove();
            }
        });

        document.querySelectorAll(".edit_questionType").forEach(function (select) {
            select.addEventListener("change", function () {
                let parent = this.closest(".modal-content");
                let multipleChoiceOptions = parent.querySelector(".edit_multipleChoiceOptions");
                let essayScoreField = parent.querySelector("#edit_essayScoreField");
                let essayReferenceAnswerField = parent.querySelector("#edit_essayReferenceAnswerField");

                if (this.value === "multiple_choice") {
                    multipleChoiceOptions.style.display = "block";
                    essayScoreField.style.display = "none";
                    essayReferenceAnswerField.style.display = "none";
                } else {
                    multipleChoiceOptions.style.display = "none";
                    essayScoreField.style.display = "block";
                    essayReferenceAnswerField.style.display = "block";
                }
            });
        });
    });
</script> --}}


<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".addOption").forEach(function (btn) {
            btn.addEventListener("click", function (e) {
                let container = this.previousElementSibling;
                let index = container.querySelectorAll(".option-group").length;
                let div = document.createElement("div");

                div.classList.add("option-group", "mb-2", "d-flex", "align-items-center");
                div.innerHTML = `
                    <input type="text" name="options[${index}][option_text]" class="form-control me-2" style="width: 40%;" placeholder="Opsi ${index + 1}" required>
                    <input type="number" name="options[${index}][score]" class="form-control me-2" style="width: 20%;" placeholder="Skor" min="0" max="100" required>
                    <input type="checkbox" name="options[${index}][is_correct]" value="1" class="ms-2"> Benar
                    <button type="button" class="btn btn-danger btn-sm ms-2 remove-option">X</button>
                `;

                container.appendChild(div);
            });
        });

        document.addEventListener("click", function (e) {
            if (e.target.classList.contains("remove-option")) {
                e.target.parentElement.remove();
            }
        });

        document.querySelectorAll(".edit_questionType").forEach(function (select) {
            select.addEventListener("change", function () {
                let parent = this.closest(".modal-content");
                let multipleChoiceOptions = parent.querySelector(".edit_multipleChoiceOptions");
                let essayScoreField = parent.querySelector("#edit_essayScoreField");
                let essayReferenceAnswerField = parent.querySelector("#edit_essayReferenceAnswerField");

                if (this.value === "multiple_choice") {
                    multipleChoiceOptions.style.display = "block";
                    essayScoreField.style.display = "none";
                    essayReferenceAnswerField.style.display = "none";
                } else {
                    multipleChoiceOptions.style.display = "none";
                    essayScoreField.style.display = "block";
                    essayReferenceAnswerField.style.display = "block";
                }
            });
        });
    });
</script>