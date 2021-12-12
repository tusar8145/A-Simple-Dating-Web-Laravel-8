<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class users_chat extends Model
{
    public $table='users_chat';
    public $primaryKey='id';
    public $incrementing=true;
    public $keyType='int';
    public $timestamp=true;
}
