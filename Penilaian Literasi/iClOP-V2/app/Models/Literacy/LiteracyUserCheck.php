<?php

namespace App\Models\Literacy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LiteracyUserCheck extends Model
{
    protected $table    = 'react_user_submits'; // Sesuaikan dengan nama tabel di database
    protected $fillable = ['userid'];
}
