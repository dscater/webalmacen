<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $fillable = [
        "codigo",
        "nro",
        "nombre",
        "descripcion",
        "categoria_id",
        "tipo_producto_id",
        "stock_minimo",
        "stock_actual",
        "imagen",
        "fecha_registro",
        "status",
    ];

    protected $appends = ["fecha_registro_t", "url_imagen"];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getUrlImagenAttribute()
    {
        if ($this->imagen) {
            return asset("imgs/productos/" . $this->imagen);
        }
        return false;
    }

    // funciones
    public static function getNuevoCodigo()
    {
        $last = Producto::get()->last();
        $nro = 1;

        if ($last) {
            $nro = (int)$last->nro + 1;
        }
        return ["P." . $nro, $nro];
    }

    // relaciones
    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id');
    }
    public function tipo_producto()
    {
        return $this->belongsTo(TipoProducto::class, 'tipo_producto_id');
    }
}
