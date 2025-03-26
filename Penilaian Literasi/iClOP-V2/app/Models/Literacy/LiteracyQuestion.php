<?php

namespace App\Models\Literacy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LiteracyQuestion extends Model
{
    use HasFactory;

    protected $table = 'literacy_questions';
    protected $fillable = ['question_text', 'type', 'essay_answer', 'essay_score'];

    public function answers()
    {
        return $this->hasMany(LiteracyAnswer::class, 'question_id');
    }

    public function options()
    {
        return $this->hasMany(LiteracyOption::class, 'question_id');
    }
}
