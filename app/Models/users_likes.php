<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class users_likes extends Model
{
    //use HasFactory;
    public $table='users_likes';
    public $primaryKey='id';
    public $incrementing=true;
    public $keyType='int';
    public $timestamp=true;
}
