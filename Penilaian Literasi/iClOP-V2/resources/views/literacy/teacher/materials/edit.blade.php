<h2 class="text-2xl font-bold mb-4">Edit Materi</h2>

<form action="{{ route('literacy.teacher.materials.update', $material->id) }}" method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')

    <div class="mb-4">
        <label for="title" class="block text-gray-700">Judul</label>
        <input type="text" name="title" id="title" value="{{ old('title', $material->title) }}"
               class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
        @error('title')
        <span class="text-red-500 text-sm">{{ $message }}</span>
        @enderror
    </div>

    <div class="mb-4">
        <label for="description" class="block text-gray-700">Deskripsi</label>
        <textarea name="description" id="description" rows="4"
                  class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">{{ old('description', $material->description) }}</textarea>
        @error('description')
        <span class="text-red-500 text-sm">{{ $message }}</span>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">File Saat Ini</label>
        @if ($material->file_path)
            <a href="{{ asset($material->file_path) }}" target="_blank" class="text-blue-500 hover:underline">
                Lihat File: {{ basename($material->file_path) }}
            </a>
        @else
            <p class="text-gray-600">Tidak ada file.</p>
        @endif
    </div>

    <div class="mb-4">
        <label for="file" class="block text-gray-700">Ganti File (Opsional)</label>
        <input type="file" name="file" id="file"
               class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
        @error('file')
        <span class="text-red-500 text-sm">{{ $message }}</span>
        @enderror
    </div>

    <div class="flex justify-between">
        <a href="{{ route('literacy_teacher_materials') }}" class="bg-gray-500 text-white rounded-md px-4 py-2">
            Batal
        </a>
        <button type="submit" class="bg-blue-600 text-white rounded-md px-4 py-2">
            Simpan Perubahan
        </button>
    </div>
</form>