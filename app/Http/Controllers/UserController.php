<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{


    public static $permisos = [
        "ADMINISTRADOR" => [
            "usuarios.index",
            "usuarios.create",
            "usuarios.edit",
            "usuarios.destroy",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.destroy",

            "proveedors.index",
            "proveedors.create",
            "proveedors.edit",
            "proveedors.destroy",

            "categorias.index",
            "categorias.create",
            "categorias.edit",
            "categorias.destroy",

            "tipo_productos.index",
            "tipo_productos.create",
            "tipo_productos.edit",
            "tipo_productos.destroy",

            "productos.index",
            "productos.create",
            "productos.edit",
            "productos.destroy",

            "tipo_ingresos.index",
            "tipo_ingresos.create",
            "tipo_ingresos.edit",
            "tipo_ingresos.destroy",

            "ingresos.index",
            "ingresos.create",
            "ingresos.edit",
            "ingresos.destroy",

            "tipo_salidas.index",
            "tipo_salidas.create",
            "tipo_salidas.edit",
            "tipo_salidas.destroy",

            "salidas.index",
            "salidas.create",
            "salidas.edit",
            "salidas.destroy",

            "notificacions.index",
            "notificacions.create",
            "notificacions.edit",
            "notificacions.destroy",

            "notificacion_users.index",
            "notificacion_users.create",
            "notificacion_users.edit",
            "notificacion_users.destroy",

            "reportes.usuarios",
        ],
        "SUPERVISOR DE ALMACEN" => [],
        "ALMACENERO" => [],
    ];

    public static function getPermisosUser()
    {
        $array_permisos = self::$permisos;
        if ($array_permisos[Auth::user()->tipo]) {
            return $array_permisos[Auth::user()->tipo];
        }
        return [];
    }


    public static function verificaPermiso($permiso)
    {
        if (in_array($permiso, self::$permisos[Auth::user()->tipo])) {
            return true;
        }
        return false;
    }

    public function permisos(Request $request)
    {
        return response()->JSON([
            "permisos" => $this->permisos[Auth::user()->tipo]
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }
}
