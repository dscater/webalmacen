<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Salida extends Model
{
    use HasFactory;

    protected $fillable = [
        "tipo_salida_id",
        "unidad_solicitante",
        "descripcion",
        "fecha_salida",
        "fecha_registro",
    ];

    protected $appends = ["fecha_registro_t", "fecha_salida_t"];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getFechaSalidaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_salida));
    }

    public function proveedor()
    {
        return $this->belongsTo(Proveedor::class, 'proveedor_id');
    }

    public function tipo_salida()
    {
        return $this->belongsTo(TipoSalida::class, 'tipo_salida_id');
    }

    public function salida_detalles()
    {
        return $this->hasMany(SalidaDetalle::class, 'salida_id');
    }

    public function unidad()
    {
        return $this->belongsTo(Unidad::class, 'unidad_solicitante');
    }
}
