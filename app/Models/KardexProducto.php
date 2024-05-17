<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KardexProducto extends Model
{
    use HasFactory;
    protected $fillable = [
        "tipo_registro",
        "registro_id",
        "producto_id",
        "detalle",
        "precio",
        "tipo_is",
        "cantidad_ingreso",
        "cantidad_salida",
        "cantidad_saldo",
        "cu",
        "monto_ingreso",
        "monto_salida",
        "monto_saldo",
        "fecha",
    ];


    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'lugar_id');
    }

    // REGISTRAR INGRESO
    public static function registroIngreso($tipo_registro, $registro_id = 0, Producto $producto, $cantidad, $precio, $detalle = "")
    {
        //buscar el ultimo registro y usar sus valores
        $ultimo = KardexProducto::where('producto_id', $producto->id)
            ->orderBy('created_at', 'asc')
            ->get()
            ->last();
        $monto = (float)$cantidad * (float)$producto->precio;
        if ($ultimo) {
            if (!$detalle || $detalle == "") {
                $detalle = "INGRESO DE PRODUCTO";
            }
            KardexProducto::create([
                'tipo_registro' => $tipo_registro, //INGRESO, EGRESO, VENTA, COMPRA,etc...
                'registro_id' => $registro_id,
                'producto_id' => $producto->id,
                'detalle' => $detalle,
                'precio' => $precio,
                'tipo_is' => 'INGRESO',
                'cantidad_ingreso' => $cantidad,
                'cantidad_saldo' => (float)$ultimo->cantidad_saldo + (float)$cantidad,
                'cu' => $producto->precio,
                'monto_ingreso' => $monto,
                'monto_saldo' => (float)$ultimo->monto_saldo + $monto,
                'fecha' => date('Y-m-d'),
            ]);
        } else {
            if (!$detalle || $detalle == "") {
                $detalle = "VALOR INICIAL";
            }
            KardexProducto::create([
                'tipo_registro' => $tipo_registro, //INGRESO, EGRESO, VENTA,etc...
                'registro_id' => $registro_id,
                'producto_id' => $producto->id,
                'detalle' => $detalle,
                'precio' => $precio,
                'tipo_is' => 'INGRESO',
                'cantidad_ingreso' => $cantidad,
                'cantidad_saldo' => (float)$cantidad,
                'cu' => $producto->precio,
                'monto_ingreso' => $monto,
                'monto_saldo' =>  $monto,
                'fecha' => date('Y-m-d'),
            ]);
        }

        // INCREMENTAR STOCK
        Producto::incrementarStock($producto, $cantidad);

        // REGITRAR NOTIFICACION
        $notificacion = Notificacion::create([
            "evento" => "INGRESO DE PRODUCTO",
            "modulo" => "INGRESO DETALLE",
            "registro_id" => $registro_id,
            "descripcion" => "INGRESO DEL PRODUCTO " . $producto->nombre,
            "fecha" => date("Y-m-d"),
            "hora" => date("H:i")
        ]);

        // ASIGNAR NOTIFICACIONES
        $users = User::where("tipo", "SUPERVISOR DE ALMACEN")->get();
        foreach ($users as $user) {
            NotificacionUser::create([
                "notificacion_id" => $notificacion->id,
                "user_id" => $user->id,
            ]);
        }

        return true;
    }

    // REGISTRAR EGRESO
    public static function registroSalida($tipo_registro, $registro_id = 0, Producto $producto, $cantidad, $precio, $detalle = "")
    {
        //buscar el ultimo registro y usar sus valores
        $ultimo = KardexProducto::where('producto_id', $producto->id)
            ->orderBy('created_at', 'asc')
            ->get()
            ->last();
        $monto = (float)$cantidad * (float)$producto->precio;

        if (!$detalle || $detalle == "") {
            $detalle = "SALIDA DE PRODUCTO";
        }

        KardexProducto::create([
            'tipo_registro' => $tipo_registro,
            'registro_id' => $registro_id,
            'producto_id' => $producto->id,
            'detalle' => $detalle,
            'precio' => $precio,
            'tipo_is' => 'EGRESO',
            'cantidad_salida' => $cantidad,
            'cantidad_saldo' => (float)$ultimo->cantidad_saldo - (float)$cantidad,
            'cu' => $producto->precio,
            'monto_salida' => $monto,
            'monto_saldo' => (float)$ultimo->monto_saldo - $monto,
            'fecha' => date('Y-m-d'),
        ]);

        Producto::decrementarStock($producto, $cantidad);

        // REGITRAR NOTIFICACION
        $notificacion = Notificacion::create([
            "evento" => "SALIDA DE PRODUCTO",
            "modulo" => "SALIDA DETALLE",
            "registro_id" => $registro_id,
            "descripcion" => "SALIDA DEL PRODUCTO " . $producto->nombre,
            "fecha" => date("Y-m-d"),
            "hora" => date("H:i")
        ]);

        // ASIGNAR NOTIFICACIONES
        $users = User::where("tipo", "SUPERVISOR DE ALMACEN")->get();
        foreach ($users as $user) {
            NotificacionUser::create([
                "notificacion_id" => $notificacion->id,
                "user_id" => $user->id,
            ]);
        }

        return true;
    }

    // ACTUALIZA REGISTROS KARDEX
    // FUNCIÓN QUE ACTUALIZA LOS REGISTROS DEL KARDEX DE UN LUGAR
    // SOLO ACTUALIZARA LOS REGISTROS POSTERIORES AL REGISTRO ACTUALIZADO
    public static function actualizaRegistrosKardex($id, $producto_id)
    {
        $siguientes = KardexProducto::where("producto_id", $producto_id)
            ->where("id", ">=", $id)
            ->get();

        foreach ($siguientes as $item) {
            $anterior = KardexProducto::where("producto_id", $producto_id)
                ->where("id", "<", $item->id)->get()
                ->last();

            $datos_actualizacion = [
                "precio" => 0,
                "cantidad_ingreso" => NULL,
                "cantidad_salida" => NULL,
                "cantidad_saldo" => 0,
                "cu" => 0,
                "monto_ingreso" => NULL,
                "monto_salida" => NULL,
                "monto_saldo" => 0,
            ];

            switch ($item->tipo_registro) {
                case 'INGRESO':
                    $ingreso_producto = IngresoProducto::find($item->registro_id);
                    $monto = (float)$ingreso_producto->cantidad * (float)$ingreso_producto->producto->precio;
                    if ($anterior) {
                        $datos_actualizacion["precio"] = $ingreso_producto->producto->precio;
                        $datos_actualizacion["cantidad_ingreso"] =  $ingreso_producto->cantidad;
                        $datos_actualizacion["cantidad_saldo"] = (float)$anterior->cantidad_saldo + (float)$ingreso_producto->cantidad;
                        $datos_actualizacion["cu"] = $ingreso_producto->producto->precio;
                        $datos_actualizacion["monto_ingreso"] = $monto;
                        $datos_actualizacion["monto_saldo"] = (float)$anterior->monto_saldo + $monto;
                    } else {
                        $datos_actualizacion["precio"] = $ingreso_producto->producto->precio;
                        $datos_actualizacion["cantidad_ingreso"] =  $ingreso_producto->cantidad;
                        $datos_actualizacion["cantidad_saldo"] = (float)$ingreso_producto->cantidad;
                        $datos_actualizacion["cu"] = $ingreso_producto->producto->precio;
                        $datos_actualizacion["monto_ingreso"] = $monto;
                        $datos_actualizacion["monto_saldo"] = $monto;
                    }
                    break;
                case 'SALIDA':
                    $salida_producto = SalidaProducto::find($item->registro_id);
                    $monto = (float)$salida_producto->cantidad * (float)$salida_producto->producto->precio;
                    if ($anterior) {
                        $datos_actualizacion["precio"] = $salida_producto->producto->precio;
                        $datos_actualizacion["cantidad_salida"] =  $salida_producto->cantidad;
                        $datos_actualizacion["cantidad_saldo"] = (float)$anterior->cantidad_saldo - (float)$salida_producto->cantidad;
                        $datos_actualizacion["cu"] = $salida_producto->producto->precio;
                        $datos_actualizacion["monto_salida"] = $monto;
                        $datos_actualizacion["monto_saldo"] =  (float)$anterior->monto_saldo - $monto;
                    } else {
                        $datos_actualizacion["precio"] = $salida_producto->producto->precio;
                        $datos_actualizacion["cantidad_salida"] =  $salida_producto->cantidad;
                        $datos_actualizacion["cantidad_saldo"] = (float)$salida_producto->cantidad * (-1);
                        $datos_actualizacion["cu"] = $salida_producto->producto->precio;
                        $datos_actualizacion["monto_salida"] = $monto;
                        $datos_actualizacion["monto_saldo"] = $monto * (-1);
                    }
                    break;
            }

            $item->update($datos_actualizacion);
        }
    }
}
