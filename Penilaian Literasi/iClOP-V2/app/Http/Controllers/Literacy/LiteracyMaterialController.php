<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class LiteracyMaterialController extends Controller
{
    function materials()
    {
        $materials = LiteracyMaterial::all();
        $users = User::all();
        $questions = LiteracyQuestion::all();
        return view('literacy.teacher.materials.index', [
            'materials' => $materials,
            'users' => $users,
            'questions' => $questions,
        ]);

    }

    public function show($id)
    {
        $material = LiteracyMaterial::findOrFail($id);
        return view('literacy.teacher.materials.index', compact('material'));
    }

    public function create()
    {
        return view('literacy.teacher.materials.index');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'file_path' => 'nullable|file|mimes:pdf,doc,docx|max:2048' // Ubah 'file_path' jadi 'file'
        ]);

        $filePath = null;

        if ($request->hasFile('file')) {
            // Simpan file dengan nama asli ke folder public/literacy/document
            $originalName = $request->file('file')->getClientOriginalName();
            $filePath = 'literacy/document/' . $originalName;
            $request->file('file')->move(public_path('literacy/document'), $originalName);
        }

        LiteracyMaterial::create([
            'title' => $request->title,
            'description' => $request->description,
            'file_path' => $filePath,  // Simpan path relatif ke folder public
            'user_id' => auth()->id()
        ]);

        return redirect()->route('literacy_teacher_materials');
    }

    public function edit($id)
    {
        $material = LiteracyMaterial::findOrFail($id);
        return view('literacy.teacher.materials.index', compact('material'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'file_path' => 'nullable|file|mimes:pdf,doc,docx|max:2048' // Ubah 'file_path' jadi 'file'
        ]);

        $material = LiteracyMaterial::findOrFail($id);
        $filePath = $material->file_path;

        if ($request->hasFile('file')) {
            // Hapus file lama jika ada
            if ($filePath) {
                $oldFilePath = public_path($filePath);
                if (file_exists($oldFilePath)) {
                    unlink($oldFilePath);
                }
            }

            // Simpan file baru dengan nama asli ke folder public/literacy/document
            $originalName = $request->file('file')->getClientOriginalName();
            $filePath = 'literacy/document/' . $originalName;
            $request->file('file')->move(public_path('literacy/document'), $originalName);
        }

        $material->update([
            'title' => $request->title,
            'description' => $request->description,
            'file_path' => $filePath
        ]);

        return redirect()->route('literacy_teacher_materials');
    }

    public function destroy($id)
    {
        $material = LiteracyMaterial::findOrFail($id);

        // Hapus file kalau ada
        if ($material->file_path) {
            $filePath = public_path($material->file_path); // Mendapatkan path lengkap di public
            if (file_exists($filePath)) {
                unlink($filePath); // Hapus file secara langsung
            }
        }

        $material->delete();
        return redirect()->route('literacy_teacher_materials');
    }
}