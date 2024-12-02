<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Ingreso;
use App\Models\TipoIngreso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class TipoIngresoController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu',
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
        'nombre.regex' => 'Debes ingresar solo texto',
        "nombre.min" => "Debes ingresar al menos :min caracteres",
        'descripcion.regex' => 'Debes ingresar solo texto',
    ];


    public function index()
    {
        return Inertia::render("TipoIngresos/Index");
    }

    public function listado(Request $request)
    {
        $tipo_ingresos = TipoIngreso::select("tipo_ingresos.*");

        if ($request->order && $request->order == "desc") {
            $tipo_ingresos->orderBy("tipo_ingresos.id", $request->order);
        }

        $tipo_ingresos = $tipo_ingresos->get();

        return response()->JSON([
            "tipo_ingresos" => $tipo_ingresos
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $tipo_ingresos = TipoIngreso::select("tipo_ingresos.*");
        if (trim($search) != "") {
            $tipo_ingresos->where("nombre", "LIKE", "%$search%");
        }

        $tipo_ingresos = $tipo_ingresos->paginate($request->itemsPerPage);
        return response()->JSON([
            "tipo_ingresos" => $tipo_ingresos
        ]);
    }

    public function store(Request $request)
    {
        if ($request->descripcion) {
            $this->validacion['descripcion'] = 'min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu';
        }
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el TipoIngreso
            $nuevo_tipo_ingreso = TipoIngreso::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_tipo_ingreso, "tipo_ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UN TIPO DE INGRESO',
                'datos_original' => $datos_original,
                'modulo' => 'TIPO DE INGRESOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("tipo_ingresos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(TipoIngreso $tipo_ingreso)
    {
    }

    public function update(TipoIngreso $tipo_ingreso, Request $request)
    {
        if ($request->descripcion) {
            $this->validacion['descripcion'] = 'min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($tipo_ingreso, "tipo_ingresos");
            $tipo_ingreso->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($tipo_ingreso, "tipo_ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UN TIPO DE INGRESO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'TIPO DE INGRESOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("tipo_ingresos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(TipoIngreso $tipo_ingreso)
    {
        DB::beginTransaction();
        try {
            $usos = Ingreso::where("tipo_ingreso_id", $tipo_ingreso->id)->get();
            if (count($usos) > 0) {
                throw ValidationException::withMessages([
                    'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($tipo_ingreso, "tipo_ingresos");
            $tipo_ingreso->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UN TIPO DE INGRESO',
                'datos_original' => $datos_original,
                'modulo' => 'TIPO DE INGRESOS',
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
