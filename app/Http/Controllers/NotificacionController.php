<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Notificacion;
use App\Models\NotificacionUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class NotificacionController extends Controller
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
        return Inertia::render("Notificacions/Index");
    }

    public function listado(Request $request)
    {
        $notificacions = Notificacion::select("notificacions.*");

        if ($request->order && $request->order == "desc") {
            $notificacions->orderBy("notificacions.id", $request->order);
        }

        $notificacions = $notificacions->get();

        return response()->JSON([
            "notificacions" => $notificacions
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $notificacions = Notificacion::with(["ingreso_detalle.producto", "salida_detalle.producto", "ingreso_detalle.ingreso.tipo_ingreso", "salida_detalle.salida.tipo_salida"])->select("notificacions.*");

        if (Auth::user()->tipo == 'SUPERVISOR DE ALMACEN') {
            $notificacions->join("notificacion_users", "notificacion_users.notificacion_id", "=", "notificacions.id");
            $notificacions->where("notificacion_users.user_id", Auth::user()->id);
        }

        if (trim($search) != "") {
            $notificacions->where("nombre", "LIKE", "%$search%");
        }

        $notificacions = $notificacions->orderBy("notificacions.id", "desc")->paginate($request->itemsPerPage);
        return response()->JSON([
            "notificacions" => $notificacions,

        ]);
    }

    public function byUser(Request $request)
    {
        $list_notificacions = NotificacionUser::with(["notificacion"]);
        $list_notificacions->where("user_id", Auth::user()->id);
        $sin_ver = NotificacionUser::where("user_id", Auth::user()->id)->where("visto", 0)->count();

        $list_notificacions = $list_notificacions->orderBy("id", "desc")->get();

        $ultimo_sin_ver = 0;
        if (count($list_notificacions) >  0) {
            $ultimo_sin_ver = $list_notificacions[0]->id;
        }
        return response()->JSON([
            "sin_ver" => (int)$sin_ver,
            "list_notificacions" => $list_notificacions,
            "ultimo_sin_ver" => $ultimo_sin_ver,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Notificacion
            $nuevo_notificacion = Notificacion::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_notificacion, "notificacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' REGISTRO UNA NOTIFICACIÓN',
                'datos_original' => $datos_original,
                'modulo' => 'NOTIFICACIONES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("notificacions.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Notificacion $notificacion)
    {
        $notificacion->load(["ingreso_detalle.producto", "salida_detalle.producto", "ingreso_detalle.ingreso.tipo_ingreso", "salida_detalle.salida.tipo_salida"]);

        if (Auth::user()->tipo == 'SUPERVISOR DE ALMACEN') {
            $notificacion_user = NotificacionUser::where("notificacion_id", $notificacion->id)->where("user_id", Auth::user()->id)->get()->first();
            $notificacion_user->visto = 1;
            $notificacion_user->save();
        }

        return Inertia::render("Notificacions/Show", compact("notificacion"));
    }

    public function update(Notificacion $notificacion, Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($notificacion, "notificacions");
            $notificacion->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($notificacion, "notificacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' MODIFICÓ UNA NOTIFICACIÓN',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'NOTIFICACIONES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("notificacions.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
    public function destroy(Notificacion $notificacion)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($notificacion, "notificacions");
            $notificacion->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->user . ' ELIMINÓ UNA NOTIFICACIÓN',
                'datos_original' => $datos_original,
                'modulo' => 'NOTIFICACIONES',
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
