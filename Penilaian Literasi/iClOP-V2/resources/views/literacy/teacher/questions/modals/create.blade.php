<!-- Modal Tambah Pertanyaan -->
<div class="modal fade" id="modalTambahPertanyaan" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Pertanyaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="{{ route('literacy_questions_store') }}" method="POST" id="questionForm">
                @csrf
                <div class="modal-body">
                    <!-- Pilihan Materi -->
                    <div class="mb-3">
                        <label for="material_id" class="form-label">Materi</label>
                        <select name="material_id" class="form-control" required>
                            <option value="">Pilih Materi</option>
                            @foreach ($materials as $material)
                                <option value="{{ $material->id }}">{{ $material->title }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Teks Pertanyaan -->
                    <div class="mb-3">
                        <label for="question_text" class="form-label">Teks Pertanyaan</label>
                        <textarea name="question_text" class="form-control" required></textarea>
                    </div>

                    <!-- Tipe Pertanyaan -->
                    <div class="mb-3">
                        <label for="type" class="form-label">Tipe Pertanyaan</label>
                        <select name="type" class="form-control" id="questionType" required>
                            <option value="multiple_choice">Pilihan Ganda</option>
                            <option value="essay">Isian</option>
                        </select>
                    </div>

                    <!-- Opsi Jawaban (Untuk Pilihan Ganda) -->
                    <div id="multipleChoiceOptions" class="mb-3">
                        <label class="form-label">Opsi Jawaban</label>
                        <div id="answerOptions"></div>
                        <button type="button" class="btn btn-success btn-sm" id="addOption">+ Tambah Opsi</button>
                    </div>

                    <!-- Skor untuk pertanyaan Isian -->
                    <div id="essayScoreField" class="mb-3">
                        <label for="essay_score" class="form-label">Skor untuk Isian</label>
                        <input type="number" name="essay_score" id="essay_score" class="form-control" min="0" max="100"
                            placeholder="Masukkan skor">
                    </div>

                    <!-- Jawaban untuk Isian -->
                    <div id="essayReferenceAnswerField" class="mb-3">
                        <label for="essay_answer" class="form-label">Jawaban Isian</label>
                        <textarea name="essay_answer" id="essay_answer" class="form-control"
                            placeholder="Masukkan jawaban referensi"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="saveButton" disabled>Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const questionType = document.getElementById("questionType");
        const multipleChoiceOptions = document.getElementById("multipleChoiceOptions");
        const answerOptions = document.getElementById("answerOptions");
        const addOptionBtn = document.getElementById("addOption");
        const essayScoreField = document.getElementById("essayScoreField");
        const essayReferenceAnswerField = document.getElementById("essayReferenceAnswerField");
        const saveButton = document.getElementById("saveButton");
        const essayScore = document.getElementById("essay_score");
        const essayAnswer = document.getElementById("essay_answer");
        const questionForm = document.getElementById("questionForm");

        function toggleFields() {
            if (questionType.value === "multiple_choice") {
                multipleChoiceOptions.style.display = "block";
                essayScoreField.style.display = "none";
                essayReferenceAnswerField.style.display = "none";

                essayScore.removeAttribute("required");
                essayAnswer.removeAttribute("required");

                document.querySelectorAll(".option-text, .option-score").forEach(input => {
                    input.setAttribute("required", "required");
                });

                // Tambahkan minimal 1 opsi jika belum ada
                if (answerOptions.children.length === 0) {
                    addNewOption();
                }
            } else {
                multipleChoiceOptions.style.display = "none";
                essayScoreField.style.display = "block";
                essayReferenceAnswerField.style.display = "block";

                essayScore.setAttribute("required", "required");
                essayAnswer.setAttribute("required", "required");

                document.querySelectorAll(".option-text, .option-score").forEach(input => {
                    input.removeAttribute("required");
                });
            }

            validateForm();
        }

        function addNewOption() {
            let optionsCount = document.querySelectorAll(".option-group").length; // Hitung ulang indeks
            let div = document.createElement("div");
            div.classList.add("option-group", "mb-2", "d-flex", "align-items-center");
            div.innerHTML = `
                <input type="text" name="options[${optionsCount}][text]" class="form-control me-2 option-text" style="width: 40%;" placeholder="Opsi ${optionsCount + 1}" required>
                <input type="number" name="options[${optionsCount}][score]" class="form-control me-2 option-score" style="width: 20%;" placeholder="Skor" min="0" max="100" required>
                <input type="checkbox" name="options[${optionsCount}][is_correct]" value="1" class="ms-2 correct-answer"> Jawaban Benar
                <button type="button" class="btn btn-danger btn-sm ms-2 remove-option">X</button>
            `;
            answerOptions.appendChild(div);

            // Tambahkan event listener untuk tombol hapus opsi
            div.querySelector(".remove-option").addEventListener("click", function () {
                div.remove();
                updateOptionIndexes(); // Perbarui indeks setelah opsi dihapus
                validateForm();
            });

            updateOptionIndexes(); // Pastikan indeks tetap berurutan
            validateForm();
        }

        function updateOptionIndexes() {
            document.querySelectorAll(".option-group").forEach((option, index) => {
                option.querySelector(".option-text").name = `options[${index}][text]`;
                option.querySelector(".option-score").name = `options[${index}][score]`;
                option.querySelector(".correct-answer").name = `options[${index}][is_correct]`;
                option.querySelector(".option-text").placeholder = `Opsi ${index + 1}`;
            });
        }

        function validateForm() {
            let isValid = false;

            if (questionType.value === "multiple_choice") {
                let options = document.querySelectorAll(".option-text");
                let scores = document.querySelectorAll(".option-score");
                let checkedCorrect = document.querySelector(".correct-answer:checked");

                isValid = options.length > 0 && scores.length > 0 && checkedCorrect;
            } else {
                isValid = essayScore.value.trim() !== "" && essayAnswer.value.trim() !== "";
            }

            saveButton.disabled = !isValid;

            questionForm.reportValidity();
        }

        // Event Listeners
        questionType.addEventListener("change", toggleFields);
        addOptionBtn.addEventListener("click", addNewOption);
        essayScore.addEventListener("input", validateForm);
        essayAnswer.addEventListener("input", validateForm);
        answerOptions.addEventListener("input", validateForm);

        // Inisialisasi awal
        toggleFields();
    });
</script>
