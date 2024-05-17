<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Salida;
use App\Models\TipoSalida;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class TipoSalidaController extends Controller
{
    public $validacion = [
        "nombre" => "required|min:2",
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
        "nombre.min" => "Debes ingresar al menos :min caracteres",
    ];

    public function index()
    {
        return Inertia::render("TipoSalidas/Index");
    }

    public function listado(Request $request)
    {
        $tipo_salidas = TipoSalida::select("tipo_salidas.*");

        if ($request->order && $request->order == "desc") {
            $tipo_salidas->orderBy("tipo_salidas.id", $request->order);
        }

        $tipo_salidas = $tipo_salidas->get();

        return response()->JSON([
            "tipo_salidas" => $tipo_salidas
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $tipo_salidas = TipoSalida::select("tipo_salidas.*");
        if (trim($search) != "") {
            $tipo_salidas->where("nombre", "LIKE", "%$search%");
        }

        $tipo_salidas = $tipo_salidas->paginate($request->itemsPerPage);
        return response()->JSON([
            "tipo_salidas" => $tipo_salidas
        ]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el TipoSalida
            $nuevo_tipo_salida = TipoSalida::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_tipo_salida, "tipo_salidas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UNA CATEGORIA',
                'datos_original' => $datos_original,
                'modulo' => 'CATEGORIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("tipo_salidas.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(TipoSalida $tipo_salida)
    {
    }

    public function update(TipoSalida $tipo_salida, Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($tipo_salida, "tipo_salidas");
            $tipo_salida->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($tipo_salida, "tipo_salidas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UNA CATEGORIA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CATEGORIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("tipo_salidas.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(TipoSalida $tipo_salida)
    {
        DB::beginTransaction();
        try {
            $usos = Salida::where("tipo_salida_id", $tipo_salida->id)->get();
            if (count($usos) > 0) {
                throw ValidationException::withMessages([
                    'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($tipo_salida, "tipo_salidas");
            $tipo_salida->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UNA CATEGORIA',
                'datos_original' => $datos_original,
                'modulo' => 'CATEGORIAS',
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
