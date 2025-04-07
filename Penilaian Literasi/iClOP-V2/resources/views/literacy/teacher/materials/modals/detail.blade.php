<div class="modal fade" id="detailMateriModal{{ $material->id }}" tabindex="-1" role="dialog"
    aria-labelledby="detailMateriLabel{{ $material->id }}" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailMateriLabel{{ $material->id }}">Detail Materi</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Judul:</label>
                    <textarea class="form-control bg-light" rows="2" readonly
                        style="resize: none; overflow: auto;">{{ $material->title }}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deskripsi:</label>
                    <textarea class="form-control bg-light" rows="4" readonly
                        style="resize: none; overflow: auto;">{{ $material->description ?? '-' }}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">File:</label>
                    <div class="form-control bg-light">
                        {{ $material->file_path ? basename($material->file_path) : '-' }}
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>