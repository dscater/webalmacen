<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IngresoDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "ingreso_id",
        "producto_id",
        "cantidad",
        "precio",
        "total"
    ];

    public function ingreso()
    {
        return $this->belongsTo(Ingreso::class, 'ingreso_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }
}
