<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Ingreso;
use App\Models\Proveedor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class ProveedorController extends Controller
{
    public $validacion = [
        'razon_social' => 'required|min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu',
    ];

    public $mensajes = [
        "razon_social.required" => "Este campo es obligatorio",
        "razon_social.min" => "Debes ingresar al menos :min caracteres",
        'razon_social.regex' => 'Debes ingresar solo texto',
        'nit.numeric' => 'Debes ingresar un valor númerico',
        'dir.regex' => 'Debes ingresar solo texto',
        'nombre_contacto.regex' => 'Debes ingresar solo texto',
        'fono.numeric' => 'Debes ingresar un valor númerico',
        'descripcion.regex' => 'Debes ingresar solo texto',
    ];

    public function index()
    {
        return Inertia::render("Proveedors/Index");
    }

    public function listado(Request $request)
    {
        $proveedors = Proveedor::select("proveedors.*");

        if ($request->order && $request->order == "desc") {
            $proveedors->orderBy("proveedors.id", $request->order);
        }

        $proveedors = $proveedors->get();

        return response()->JSON([
            "proveedors" => $proveedors
        ]);
    }

    public function paginado(Request $request)
    {

        $search = $request->search;

        $proveedors = Proveedor::select("proveedors.*");

        if (trim($search) != "") {
            $proveedors->where("razon_social", "LIKE", "%$search%");
        }

        $proveedors = $proveedors->paginate($request->itemsPerPage);
        return response()->JSON([
            "proveedors" => $proveedors
        ]);
    }

    public function store(Request $request)
    {
        if ($request->nit) {
            $this->validacion["nit"] = "numeric";
        }
        if ($request->dir) {
            $this->validacion["dir"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }
        if ($request->nombre_contacto) {
            $this->validacion["nombre_contacto"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }
        if ($request->fono) {
            $this->validacion["fono"] = "numeric";
        }
        if ($request->descripcion) {
            $this->validacion["descripcion"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }

        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Proveedor
            $nuevo_proveedor = Proveedor::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_proveedor, "proveedors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UN PROVEEDOR',
                'datos_original' => $datos_original,
                'modulo' => 'PROVEEDORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("proveedors.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Proveedor $proveedor) {}

    public function update(Proveedor $proveedor, Request $request)
    {
        if ($request->nit) {
            $this->validacion["nit"] = "numeric";
        }
        if ($request->dir) {
            $this->validacion["dir"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }
        if ($request->nombre_contacto) {
            $this->validacion["nombre_contacto"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }
        if ($request->fono) {
            $this->validacion["fono"] = "numeric";
        }
        if ($request->descripcion) {
            $this->validacion["descripcion"] = "min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu";
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($proveedor, "proveedors");
            $proveedor->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($proveedor, "proveedors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UN PROVEEDOR',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PROVEEDORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            DB::commit();
            return redirect()->route("proveedors.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(Proveedor $proveedor)
    {
        DB::beginTransaction();
        try {
            $usos = Ingreso::where("proveedor_id", $proveedor->id)->get();
            if (count($usos) > 0) {
                throw ValidationException::withMessages([
                    'error' =>  "No es posible eliminar esta categoría porque esta siendo utilizada por otros registros",
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($proveedor, "proveedors");
            $proveedor->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UN PROVEEDOR',
                'datos_original' => $datos_original,
                'modulo' => 'PROVEEDORES',
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
