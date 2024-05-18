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
    protected $appends = ["fecha_t", "fecha_hora_t", "hace"];

    public function getFechaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha));
    }

    public function getFechaHoraTAttribute()
    {
        return date("d/m/Y H:i", strtotime($this->fecha . ' ' . $this->hora));
    }

    public function getHaceAttribute()
    {
        if ($this->visto == 0) {
            return $this->updated_at->diffForHumans();
        }
        return $this->created_at->diffForHumans();
    }

    public function ingreso_detalle()
    {
        return $this->belongsTo(IngresoDetalle::class, 'registro_id');
    }

    public function salida_detalle()
    {
        return $this->belongsTo(SalidaDetalle::class, 'registro_id');
    }
}
