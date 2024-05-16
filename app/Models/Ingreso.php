<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingreso extends Model
{
    use HasFactory;

    protected $fillable = [
        "proveedor_id",
        "tipo_ingreso_id",
        "precio",
        "nro_factura",
        "descripcion",
        "fecha_ingreso",
        "fecha_registro",
    ];

    public function proveedor()
    {
        return $this->belongsTo(Proveedor::class, 'proveedor_id');
    }

    public function tipo_ingreso()
    {
        return $this->belongsTo(TipoIngreso::class, 'tipo_ingreso_id');
    }
}
