<?php

namespace App\Http\Controllers;

use App\Models\Ingreso;
use App\Models\Notificacion;
use Illuminate\Support\Facades\Auth;

class AgenteInteligenteController extends Controller
{
    public function generarNotificacionIngresos()
    {
        // Array para almacenar las notificaciones
        $notificaciones = array();

        // Generar notificaciones para cada usuario
        $ingresos = $this->detectarEventosIngresos();

        if (!empty($ingresos)) {
            foreach ($ingresos as $ingreso) {
                // inicializar la notificacion
                $notificacion_generada = Notificacion::create([

                    "evento" => "INGRESO DE PRODUCTO",
                    "modulo" => "INGRESO DETALLE",
                    "registro_id" => $ingreso->id,
                    "descripcion" => "INGRESO DEL PRODUCTO " . $ingreso->producto->nombre,
                    "fecha" => date("Y-m-d"),
                    "hora" => date("H:i")
                ]);

                $notificacion = $this->generarNotificacionUserIngreso($notificacion_generada);
                if ($notificacion) {
                    $notificaciones[] = $notificacion;
                }
            }
        }
        return $notificaciones;
    }

    // Obtener eventos/ingresos
    private function detectarEventosIngresos()
    {
        // segun la fecha actual
        $fecha_actual = date("Y-m-d");
        $ingresos = Ingreso::where("fecha_registro", $fecha_actual);
        $ingresos = $ingresos->get();
        return $ingresos;
    }

    public function generarNotificacionSalidas()
    {
        // Array para almacenar las notificaciones
        $notificaciones = array();

        // Generar notificaciones para cada usuario
        $salidas = $this->detectarEventosSalidas();

        if (!empty($salidas)) {
            foreach ($salidas as $salida) {
                // inicializar la notificacion
                $notificacion_generada = Notificacion::create([
                    "evento" => "SALIDA DE PRODUCTO",
                    "modulo" => "SALIDA DETALLE",
                    "registro_id" => $salida->id,
                    "descripcion" => "SALIDA DEL PRODUCTO " . $salida->producto->nombre,
                    "fecha" => date("Y-m-d"),
                    "hora" => date("H:i")
                ]);

                $notificacion = $this->generarNotificacionUser($notificacion_generada);
                if ($notificacion) {
                    $notificaciones[] = $notificacion;
                }
            }
        }
        return $notificaciones;
    }

    // Obtener eventos/salidas
    private function detectarEventosSalidas()
    {
        // segun la fecha actual
        $fecha_actual = date("Y-m-d");
        $salidas = Ingreso::where("fecha_registro", $fecha_actual);
        $salidas = $salidas->get();
        return $salidas;
    }


    // Generar una notificación para un evento dado
    private function generarNotificacionUser(Notificacion $notificacion)
    {
        // obtener los usuarios que recibiran la notificación
        $usuarios = User::whereIn("tipo", ["SUPERVISOR DE ALMACEN"])->get();
        foreach ($usuarios as $item) {
            $notificacion->notificacion_users()->create([
                "user_id" => $item->id,
                "visto" => 0,
            ]);
        }

        return $notificacion;
    }
}
