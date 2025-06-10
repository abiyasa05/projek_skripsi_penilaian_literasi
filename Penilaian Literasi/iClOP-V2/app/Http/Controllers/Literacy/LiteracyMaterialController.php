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
    public function materials()
    {
        $materials = LiteracyMaterial::orderBy('created_at', 'desc')->get();
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
            'title' => 'required|string',
            'description' => 'nullable|string',
            'file_path' => 'nullable|file|mimes:pdf,doc,docx|max:1048576'
        ]);

        $filePath = null;

        if ($request->hasFile('file')) {
            $originalName = $request->file('file')->getClientOriginalName();
            $path = $request->file('file')->storeAs('public/literacy_materials', $originalName);
            $filePath = str_replace('public/', '', $path); // Simpan path relatif
        }

        LiteracyMaterial::create([
            'title' => $request->title,
            'description' => $request->description,
            'file_path' => $filePath,
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
            'title' => 'required|string',
            'description' => 'nullable|string',
            'file_path' => 'nullable|file|mimes:pdf,doc,docx,txt|max:1048576'
        ]);

        $material = LiteracyMaterial::findOrFail($id);
        $filePath = $material->file_path;

        if ($request->hasFile('file')) {
            if ($filePath && Storage::exists('public/' . $filePath)) {
                Storage::delete('public/' . $filePath);
            }

            $originalName = $request->file('file')->getClientOriginalName();
            $path = $request->file('file')->storeAs('public/literacy_materials', $originalName);
            $filePath = str_replace('public/', '', $path);
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

        if ($material->file_path && Storage::exists('public/' . $material->file_path)) {
            Storage::delete('public/' . $material->file_path);
        }

        $material->delete();
        return redirect()->route('literacy_teacher_materials');
    }

    public function show_materials($id)
    {
        $material = LiteracyMaterial::findOrFail($id);
        $path = storage_path('app/public/' . $material->file_path);

        if (!file_exists($path)) {
            abort(404, 'File tidak ditemukan');
        }

        return response()->file($path);
    }
}