<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notificacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "evento",
        "modulo",
        "registro_id",
        "descripcion",
        "fecha",
        "hora",
    ];

    public function ingreso_detalle()
    {
        return $this->belongsTo(IngresoDetalle::class, 'registro_id');
    }
}
