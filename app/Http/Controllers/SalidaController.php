<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\KardexProducto;
use App\Models\Producto;
use App\Models\Salida;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class SalidaController extends Controller
{
    public $validacion = [
        "tipo_salida_id" => "required",
        "unidad_solicitante" => "required",
        "fecha_salida" => "required",
    ];

    public $mensajes = [
        "tipo_salida_id.required" => "Este campo es obligatorio",
        "unidad_solicitante.required" => "Este campo es obligatorio",
        "fecha_salida.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Salidas/Index");
    }

    public function listado(Request $request)
    {
        $salidas = Salida::select("salidas.*");

        if ($request->order && $request->order == "desc") {
            $salidas->orderBy("salidas.id", $request->order);
        }

        $salidas = $salidas->get();

        return response()->JSON([
            "salidas" => $salidas
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $salidas = Salida::with(["proveedor", "tipo_salida", "salida_detalles.producto"])->select("salidas.*");
        if (trim($search) != "") {
            $salidas->where("nombre", "LIKE", "%$search%");
        }

        $salidas = $salidas->paginate($request->itemsPerPage);
        return response()->JSON([
            "salidas" => $salidas
        ]);
    }

    public function create()
    {
        return Inertia::render("Salidas/Create");
    }

    public function store(Request $request)
    {

        if (!isset($request->salida_detalles) || count($request->salida_detalles) <= 0) {
            throw ValidationException::withMessages([
                'error' =>  "Debes ingresar al menos un producto",
            ]);
        }

        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Salida
            $nuevo_salida = Salida::create(array_map('mb_strtoupper', $request->except("salida_detalles", "eliminados")));

            // registrar kardex
            $salida_detalles = $request->salida_detalles;
            foreach ($salida_detalles as $item) {
                $salida_detalle = $nuevo_salida->salida_detalles()->create([
                    "producto_id" => $item["producto_id"],
                    "cantidad" => $item["cantidad"],
                ]);
                KardexProducto::registroSalida("SALIDA", $salida_detalle->id, $salida_detalle->producto, $salida_detalle->cantidad, $salida_detalle->producto->precio, $nuevo_salida->descripcion);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_salida, "salidas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("salidas.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Salida $salida)
    {
        $salida = $salida->load(["proveedor", "tipo_salida", "salida_detalles.producto"]);
        return Inertia::render("Salidas/Show", compact("salida"));
    }

    public function edit(Salida $salida)
    {
        $salida = $salida->load(["proveedor", "tipo_salida", "salida_detalles.producto"]);
        return Inertia::render("Salidas/Edit", compact("salida"));
    }

    public function update(Salida $salida, Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($salida, "salidas");
            $salida->update(array_map('mb_strtoupper', $request->except("salida_detalles", "eliminados")));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($salida, "salidas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'SALIDA DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("salidas.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(Salida $salida)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($salida, "salidas");
            $salida->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
