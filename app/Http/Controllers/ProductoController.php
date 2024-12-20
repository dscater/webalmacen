<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\IngresoDetalle;
use App\Models\Producto;
use App\Models\SalidaDetalle;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class ProductoController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu',
        "precio" => "required|numeric|min:0.01",
        "stock_minimo" => "required|int|min:1",
        "categoria_id" => "required",
        "tipo_producto_id" => "required",
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
        'nombre.regex' => 'Debes ingresar solo texto',
        "nombre.min" => "Debes ingresar al menos :min caracteres",
        "precio.required" => "Este campo es obligatorio",
        "precio.min" => "Debes ingresar al menos :min",
        'descripcion.regex' => 'Debes ingresar solo texto',
        "stock_minimo.required" => "Este campo es obligatorio",
        "stock_minimo.min" => "Debes ingresar al menos :min",
        "categoria_id.required" => "Este campo es obligatorio",
        "tipo_producto_id.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Productos/Index");
    }

    public function listado(Request $request)
    {
        $productos = Producto::select("productos.*")->where("status", 1);

        if ($request->order && $request->order == "desc") {
            $productos->orderBy("productos.id", $request->order);
        }

        $productos = $productos->get();

        return response()->JSON([
            "productos" => $productos
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $productos = Producto::with(["categoria", "tipo_producto"])->select("productos.*")->where("status", 1);
        if (trim($search) != "") {
            $productos->where("nombre", "LIKE", "%$search%");
        }

        $productos = $productos->paginate($request->itemsPerPage);
        return response()->JSON([
            "productos" => $productos
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
            $nuevo_codigo = Producto::getNuevoCodigo();
            $request["codigo"] = $nuevo_codigo[0];
            $request["nro"] = $nuevo_codigo[1];
            // crear el Producto
            $nuevo_producto = Producto::create(array_map('mb_strtoupper', $request->except("imagen")));
            if ($request->hasFile('imagen')) {
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $nuevo_producto->id . '.' . $file->getClientOriginalExtension();
                $nuevo_producto->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/productos/', $nom_imagen);
                $nuevo_producto->save();
            }

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_producto, "productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("productos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Producto $producto) {}

    public function update(Producto $producto, Request $request)
    {
        if ($request->descripcion) {
            $this->validacion['descripcion'] = 'min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($producto, "productos");
            $producto->update(array_map('mb_strtoupper', $request->except("imagen")));
            if ($request->hasFile('imagen')) {
                $antiguo = $producto->imagen;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/productos/' . $antiguo);
                }
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $producto->id . '.' . $file->getClientOriginalExtension();
                $producto->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/productos/', $nom_imagen);
                $producto->save();
            }
            $datos_nuevo = HistorialAccion::getDetalleRegistro($producto, "productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("productos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(Producto $producto)
    {
        DB::beginTransaction();
        try {
            $usos1 = IngresoDetalle::where("producto_id", $producto->id)->get();
            $usos2 = SalidaDetalle::where("producto_id", $producto->id)->get();
            // if (count($usos1) > 0) {
            //     throw ValidationException::withMessages([
            // 'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            //     ]);
            // }
            // if (count($usos2) > 0) {
            //     throw ValidationException::withMessages([
            // 'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            //     ]);
            // }



            $datos_original = HistorialAccion::getDetalleRegistro($producto, "productos");

            if (count($usos1) > 0 || count($usos2) > 0) {
                // eliminacion logica
                $producto->status = 0;
                $producto->save();
            } else {
                // eliminacion fisica
                $antiguo = $producto->imagen;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/productos/' . $antiguo);
                }
                $producto->delete();
            }

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'PRODUCTOS',
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
