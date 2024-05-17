<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalidaDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "salida_id",
        "producto_id",
        "cantidad",
    ];

    public function salida()
    {
        return $this->belongsTo(Salida::class, 'salida_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }
}
