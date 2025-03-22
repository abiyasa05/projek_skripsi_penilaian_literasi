<!-- Modal Detail Pertanyaan -->
<div class="modal fade" id="detailPertanyaanModal{{ $question->id }}" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Pertanyaan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Materi:</label>
                    <div class="form-control bg-light">{{ $question->material->title }}</div>
                </div>
                <textarea class="form-control bg-light" readonly
                    style="height: 150px !important; overflow-y: auto !important; resize: none !important;">
                    {{ $question->question_text }}
                </textarea>
                <div class="mb-3">
                    <label class="form-label">Tipe Pertanyaan:</label>
                    <div class="form-control bg-light">
                        {{ $question->type == 'multiple_choice' ? 'Pilihan Ganda' : 'Isian' }}
                    </div>
                </div>
                <!-- Menampilkan Opsi Jawaban jika tipe pertanyaan Pilihan Ganda -->
                @if($question->type == 'multiple_choice')
                    <div class="mb-3">
                        <label class="form-label">Opsi Jawaban:</label>
                        <ul class="list-group">
                            @foreach ($question->options as $option)
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>{{ $option->option_text }}</span>
                                    <div>
                                        <span class="badge bg-primary">Skor: {{ $option->score ?? 0 }}</span>
                                        @if($option->is_correct)
                                            <span class="badge bg-success">Benar</span>
                                        @endif
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                @else
                    <div class="mb-3">
                        <label class="form-label">Jawaban Isian:</label>
                        <textarea class="form-control bg-light" rows="5"
                            readonly>{{ $question->essay_answer ?? '-' }}</textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Skor:</label>
                        <div class="form-control bg-light">{{ $question->essay_score ?? '-' }}</div>
                    </div>
                @endif
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>