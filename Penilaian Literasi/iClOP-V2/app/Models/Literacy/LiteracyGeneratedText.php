<?php

namespace App\Models\Literacy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LiteracyGeneratedText extends Model
{
    use HasFactory;

    protected $table = 'literacy_generated_texts';

    protected $fillable = [
        'user_id',
        'generate_text',
    ];

    public function teacher()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id');
    }
}
