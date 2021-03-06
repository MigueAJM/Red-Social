<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;
    protected $table = 'images';

    //  Relación One to Many
    public function comments()
    {
        return $this->hasMany('App\Models\Comment');
    }

    //  Relación One to Many
    public function likes()
    {
        return $this->hasMany('App\Models\Like');
    }

    //  Relación Many to One
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
