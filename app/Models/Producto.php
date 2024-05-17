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
        "precio",
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

    public static function incrementarStock($producto, $cantidad)
    {
        $producto->stock_actual = (float)$producto->stock_actual + $cantidad;
        $producto->save();
        return true;
    }
    public static function decrementarStock($producto, $cantidad)
    {
        $producto->stock_actual = (float)$producto->stock_actual - $cantidad;
        $producto->save();
        return true;
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
