<div class="modal fade" id="editMateriModal-{{ $material->id }}" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Materi</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="{{ route('literacy_materials_update', $material->id) }}" method="POST"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="title" class="form-label">Judul</label>
                        <input type="text" class="form-control" name="title" value="{{ $material->title }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Deskripsi</label>
                        <textarea name="description" class="form-control">{{ $material->description }}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="currentFile" class="form-label">File Saat Ini</label>
                        @if (!empty($material->file_path) && file_exists(public_path($material->file_path)))
                            <a href="{{ asset($material->file_path) }}" target="_blank"
                                class="text-blue-500 hover:underline">
                                Lihat File: {{ basename($material->file_path) }}
                            </a>
                        @else
                            <p class="text-gray-600">Tidak ada file.</p>
                        @endif
                    </div>

                    <div class="mb-3">
                        <label for="file" class="form-label">Ganti File</label>
                        <input type="file" name="file" class="form-control">
                    </div>

                    <!-- Input Hidden untuk Path File Lama -->
                    <input type="hidden" name="old_file_path" value="{{ $material->file }}">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>