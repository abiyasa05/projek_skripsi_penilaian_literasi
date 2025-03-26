<?php

namespace App\Http\Controllers\Literacy;

use App\Http\Controllers\Controller;
use App\Models\Literacy\LiteracyMaterial;
use App\Models\Literacy\LiteracyQuestion;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class LiteracyMaterialStudentController extends Controller
{
    function materials()
    {
        $materials = LiteracyMaterial::all();
        $users = User::all();
        $questions = LiteracyQuestion::all();
        return view('literacy.student.materials.index', [
            'materials' => $materials,
            'users' => $users,
            'questions' => $questions,
        ]);

    }

    public function show($id)
    {
        $material = LiteracyMaterial::findOrFail($id);
        return view('literacy.student.materials.show', compact('material'));
    }

    function show_materials()
    {
        $materials_student = LiteracyMaterial::all();
        return view('literacy.student.materials.index', [
            'materials_student' => $materials_student,
        ]);
    }

    public function view_materials($id)
    {
        $material_student = LiteracyMaterial::findOrFail($id);

        // Pastikan file tersedia
        if (!$material_student->file_path || !file_exists(public_path($material_student->file_path))) {
            abort(404, 'File tidak ditemukan');
        }

        // Arahkan ke file langsung agar bisa ditampilkan di browser
        return response()->file(public_path($material_student->file_path));
    }
}