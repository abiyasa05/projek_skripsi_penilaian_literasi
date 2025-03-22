<?php

namespace App\Models\Literacy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LiteracyTopic_detail extends Model
{
    protected $table = 'react_topics_detail'; // Sesuaikan dengan nama tabel di database
    protected $fillable = ['title', 'id_topics' ,'controller', 'description', 'folder_path','file_name'];



    public function user_enroll()
    {
        return $this->hasMany(LiteracyUserEnroll::class);
    }
}
