<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Ingreso;
use App\Models\KardexProducto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use PDF;

class IngresoController extends Controller
{
    public $validacion = [
        "proveedor_id" => "required",
        "nro_factura" => "required",
        "tipo_ingreso_id" => "required",
        "precio" => "required|numeric",
        "fecha_ingreso" => "required",
    ];

    public $mensajes = [
        "proveedor_id.required" => "Este campo es obligatorio",
        "tipo_ingreso_id.required" => "Este campo es obligatorio",
        "nro_factura.required" => "Este campo es obligatorio",
        "precio.required" => "Este campo es obligatorio",
        "fecha_ingreso.required" => "Este campo es obligatorio",
        'descripcion.regex' => 'Debes ingresar solo texto',
        "precio.numeric" => "Debes ingresar un valor númerico",
    ];

    public function index()
    {
        return Inertia::render("Ingresos/Index");
    }

    public function listado(Request $request)
    {
        $ingresos = Ingreso::select("ingresos.*");

        if ($request->order && $request->order == "desc") {
            $ingresos->orderBy("ingresos.id", $request->order);
        }

        $ingresos = $ingresos->get();

        return response()->JSON([
            "ingresos" => $ingresos
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $ingresos = Ingreso::with(["proveedor", "tipo_ingreso", "ingreso_detalles.producto"])->select("ingresos.*");
        if (trim($search) != "") {
            $ingresos->where("nombre", "LIKE", "%$search%");
        }

        $ingresos = $ingresos->orderBy("fecha_ingreso", "desc")->orderBy("id", "desc")->paginate($request->itemsPerPage);
        return response()->JSON([
            "ingresos" => $ingresos
        ]);
    }

    public function create()
    {
        return Inertia::render("Ingresos/Create");
    }

    public function store(Request $request)
    {
        if ($request->descripcion) {
            $this->validacion['descripcion'] = 'min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/u';
        }
        if (!isset($request->ingreso_detalles) || count($request->ingreso_detalles) <= 0) {
            throw ValidationException::withMessages([
                'error' =>  "Debes ingresar al menos un producto",
            ]);
        }

        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Ingreso
            $data_ingreso = [
                "proveedor_id" => $request["proveedor_id"] ? $request["proveedor_id"] : NULL,
                "tipo_ingreso_id" => $request["tipo_ingreso_id"] ? $request["tipo_ingreso_id"] : NULL,
                "precio" => $request["precio"] ? $request["precio"] : NULL,
                "nro_factura" => $request["nro_factura"] ? $request["nro_factura"] : NULL,
                "descripcion" => $request["descripcion"] ? mb_strtoupper($request["descripcion"]) : NULL,
                "fecha_ingreso" => $request["fecha_ingreso"] ? $request["fecha_ingreso"] : NULL,
                "fecha_registro" => date("Y-m-d"),
            ];
            $nuevo_ingreso = Ingreso::create($data_ingreso);

            // registrar kardex
            $ingreso_detalles = $request->ingreso_detalles;
            $total = 0;
            foreach ($ingreso_detalles as $item) {
                $ingreso_detalle = $nuevo_ingreso->ingreso_detalles()->create([
                    "producto_id" => $item["producto_id"],
                    "cantidad" => $item["cantidad"],
                    "precio" => $item["precio"],
                    "total" => $item["total"],
                ]);
                $total += (float)$item["total"];
                KardexProducto::registroIngreso("INGRESO", $ingreso_detalle->id, $ingreso_detalle->producto, $ingreso_detalle->cantidad, $ingreso_detalle->producto->precio, $nuevo_ingreso->descripcion);
            }
            $nuevo_ingreso->precio  = $total;
            $nuevo_ingreso->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_ingreso, "ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UN INGRESO DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("ingresos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Ingreso $ingreso)
    {
        $ingreso = $ingreso->load(["proveedor", "tipo_ingreso", "ingreso_detalles.producto"]);
        return Inertia::render("Ingresos/Show", compact("ingreso"));
    }

    public function pdf(Ingreso $ingreso)
    {
        $pdf = PDF::loadView('reportes.ingreso', compact('ingreso'))->setPaper('letter', 'portrait');

        // ENUMERAR LAS PÁGINAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('ingreso.pdf');
    }

    public function edit(Ingreso $ingreso)
    {
        $ingreso = $ingreso->load(["proveedor", "tipo_ingreso", "ingreso_detalles.producto"]);
        return Inertia::render("Ingresos/Edit", compact("ingreso"));
    }

    public function update(Ingreso $ingreso, Request $request)
    {
        if ($request->descripcion) {
            $this->validacion['descripcion'] = 'min:2|regex:/^[\pL\s\.\'\"\,áéíóúÁÉÍÓÚñÑ]+$/uu';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            $ingreso->update(array_map('mb_strtoupper', $request->except("ingreso_detalles", "eliminados")));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UN INGRESO DE PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'INGRESO DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("ingresos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(Ingreso $ingreso)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            $ingreso->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UN INGRESO DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE PRODUCTOS',
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
