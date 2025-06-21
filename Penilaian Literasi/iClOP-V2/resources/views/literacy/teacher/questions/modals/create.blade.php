<!-- Modal Tambah Pertanyaan -->
<div class="modal fade" id="modalTambahPertanyaan" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Pertanyaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="{{ route('literacy_questions_store') }}" method="POST" id="createQuestionForm">
                @csrf
                <div class="modal-body">
                    <!-- Pilihan Materi -->
                    <div class="mb-3">
                        <label for="material_id" class="form-label">Materi</label>
                        <select name="material_id" class="form-control" id="materialSelect" required>
                            <option value="">Pilih Materi</option>
                            @foreach ($materials as $material)
                                <option value="{{ $material->id }}">{{ $material->title }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Pilihan Teks Bacaan -->
                    <div class="mb-3">
                        <label for="story_text_display" class="form-label">Teks Bacaan</label>
                        <textarea id="story_text_display" class="form-control" rows="6" readonly></textarea>
                        <input type="hidden" name="story_text_id" id="story_text_id">
                        <button type="button" class="btn btn-secondary mt-2" id="btnPilihTeks">Pilih Teks
                            Bacaan</button>
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

                    <!-- Opsi Jawaban -->
                    <div id="multipleChoiceOptions" class="mb-3">
                        <label class="form-label">Opsi Jawaban</label>
                        <div id="answerOptions"></div>
                        <button type="button" class="btn btn-success btn-sm" id="addOption">+ Tambah Opsi</button>
                    </div>

                    <!-- Skor & Jawaban Isian -->
                    <div id="essayScoreField" class="mb-3">
                        <label for="essay_score" class="form-label">Skor untuk Isian</label>
                        <input type="number" name="essay_score" id="essay_score" class="form-control" min="0" max="100">
                    </div>

                    <div id="essayReferenceAnswerField" class="mb-3">
                        <label for="essay_answer" class="form-label">Jawaban Referensi</label>
                        <textarea name="essay_answer" id="essay_answer" class="form-control"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="saveButton" disabled>Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Pilih Teks Bacaan -->
<div class="modal fade" id="modalPilihTeks" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Pilih Teks Bacaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="listTeksBacaan">
                <p>Memuat teks bacaan...</p>
            </div>
        </div>
    </div>
</div>

<!-- Script -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const materialSelect = document.getElementById("materialSelect");
        const storyTextDisplay = document.getElementById("story_text_display");
        const storyTextIdInput = document.getElementById("story_text_id");
        const btnPilihTeks = document.getElementById("btnPilihTeks");
        const listTeksBacaan = document.getElementById("listTeksBacaan");

        const questionType = document.getElementById("questionType");
        const answerOptions = document.getElementById("answerOptions");
        const addOptionBtn = document.getElementById("addOption");
        const essayScore = document.getElementById("essay_score");
        const essayAnswer = document.getElementById("essay_answer");
        const saveButton = document.getElementById("saveButton");

        btnPilihTeks.addEventListener("click", function () {
            const materialId = materialSelect.value;
            if (!materialId) {
                alert("Pilih materi terlebih dahulu.");
                return;
            }

            listTeksBacaan.innerHTML = "<p>Memuat teks bacaan...</p>";
            $('#modalPilihTeks').modal('show');

            fetch(`/literacy/teacher/materials/${materialId}/story-texts`)
                .then(res => res.json())
                .then(data => {
                    if (data.length === 0) {
                        listTeksBacaan.innerHTML = "<p>Tidak ada teks bacaan.</p>";
                        return;
                    }

                    listTeksBacaan.innerHTML = "";
                    data.forEach(text => {
                        const div = document.createElement("div");
                        div.classList.add("mb-3", "p-2", "border", "rounded");
                        div.innerHTML = `
                        <div style="max-height: 150px; overflow-y: auto; white-space: pre-wrap;">${text.story_text}</div>
                        <button type="button" class="btn btn-sm btn-primary mt-2 pilih-teks" 
                            data-id="${text.id}" 
                            data-teks="${text.story_text.replace(/"/g, '&quot;')}">
                            Pilih Teks Ini
                        </button>
                    `;
                        listTeksBacaan.appendChild(div);
                    });

                    document.querySelectorAll(".pilih-teks").forEach(btn => {
                        btn.addEventListener("click", function () {
                            const id = this.getAttribute("data-id");
                            const teks = this.getAttribute("data-teks");

                            storyTextDisplay.textContent = teks;
                            storyTextIdInput.value = id;

                            $('#modalPilihTeks').modal('hide');
                        });
                    });
                });
        });

        function toggleFields() {
            const isMultipleChoice = questionType.value === "multiple_choice";

            const multipleChoiceDiv = document.getElementById("multipleChoiceOptions");
            const essayScoreField = document.getElementById("essayScoreField");
            const essayAnswerField = document.getElementById("essayReferenceAnswerField");

            if (isMultipleChoice) {
                multipleChoiceDiv.style.display = "block";
                essayScoreField.style.display = "none";
                essayAnswerField.style.display = "none";

                // Aktifkan kembali input pilihan ganda dan tambahkan required
                document.querySelectorAll("#answerOptions input").forEach(input => {
                    input.removeAttribute("disabled");
                    if (input.classList.contains("option-text") || input.classList.contains("option-score")) {
                        input.setAttribute("required", "required");
                    }
                });
            } else {
                multipleChoiceDiv.style.display = "none";
                essayScoreField.style.display = "block";
                essayAnswerField.style.display = "block";

                // Nonaktifkan semua input pilihan ganda agar tidak divalidasi
                document.querySelectorAll("#answerOptions input").forEach(input => {
                    input.setAttribute("disabled", "disabled");
                    input.removeAttribute("required");
                });
            }

            validateForm();
        }

        function addNewOptionIfEmpty() {
            if (answerOptions.children.length === 0) addNewOption();
        }

        function addNewOption() {
            const index = answerOptions.children.length;
            const div = document.createElement("div");
            div.classList.add("option-group", "mb-2", "d-flex", "align-items-center", "gap-2");
            div.innerHTML = `
            <input type="text" name="options[${index}][text]" class="form-control option-text" style="width: 40%;" placeholder="Opsi ${index + 1}" required>
            <input type="number" name="options[${index}][score]" class="form-control option-score" style="width: 20%;" placeholder="Skor" min="0" max="100" required>
            <label class="d-flex align-items-center ms-2">
                <input type="checkbox" name="options[${index}][is_correct]" value="1" class="correct-answer me-1">
                <span>Benar</span>
            </label>
            <button type="button" class="btn btn-danger btn-sm ms-2 remove-option">X</button>
        `;
            answerOptions.appendChild(div);

            div.querySelector(".remove-option").addEventListener("click", function () {
                div.remove();
                updateOptionIndexes();
                validateForm();
            });
        }

        function updateOptionIndexes() {
            document.querySelectorAll(".option-group").forEach((el, index) => {
                el.querySelector(".option-text").name = `options[${index}][text]`;
                el.querySelector(".option-score").name = `options[${index}][score]`;
                el.querySelector(".correct-answer").name = `options[${index}][is_correct]`;
            });
        }

        function validateForm() {
            let isValid = false;
            if (questionType.value === "multiple_choice") {
                const hasText = document.querySelector(".option-text");
                const hasCorrect = document.querySelector(".correct-answer:checked");
                isValid = hasText && hasCorrect;
            } else {
                // Skor opsional, jawaban wajib
                isValid = essayAnswer.value.trim() !== "";
            }
            saveButton.disabled = !isValid;
        }

        questionType.addEventListener("change", toggleFields);
        addOptionBtn.addEventListener("click", addNewOption);
        essayScore.addEventListener("input", validateForm);
        essayAnswer.addEventListener("input", validateForm);
        answerOptions.addEventListener("input", validateForm);

        toggleFields(); // Inisialisasi awal
    });
</script>