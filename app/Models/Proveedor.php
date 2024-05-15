<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proveedor extends Model
{
    use HasFactory;

    protected $fillable = [
        "razon_social",
        "nit",
        "dir",
        "nombre_contacto",
        "fono",
        "descripcion",
        "fecha_registro",
    ];
}
