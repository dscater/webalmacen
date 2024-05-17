<?php

use App\Http\Controllers\AvanceObraController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\IngresoController;
use App\Http\Controllers\MaquinariaController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\NotificacionController;
use App\Http\Controllers\ObraController;
use App\Http\Controllers\OperarioController;
use App\Http\Controllers\PresupuestoController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProveedorController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\SalidaController;
use App\Http\Controllers\TipoIngresoController;
use App\Http\Controllers\TipoProductoController;
use App\Http\Controllers\TipoSalidaController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
});

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");

Route::middleware('auth')->group(function () {
    // INICIO
    Route::get('/inicio', function () {
        return Inertia::render('Home');
    })->name('inicio');

    // INSTITUCION
    Route::resource("configuracions", ConfiguracionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('/profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get("/getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("/permisos", [UserController::class, 'permisos']);
    Route::get("/menu_user", [UserController::class, 'permisos']);

    // USUARIOS
    Route::put("/usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::get("/usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("/usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("/usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("/usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("/usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("/usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // PROVEEDORS
    Route::get("/proveedors/paginado", [ProveedorController::class, 'paginado'])->name("proveedors.paginado");
    Route::get("/proveedors/listado", [ProveedorController::class, 'listado'])->name("proveedors.listado");
    Route::resource("proveedors", ProveedorController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // CATEGORIAS
    Route::get("/categorias/paginado", [CategoriaController::class, 'paginado'])->name("categorias.paginado");
    Route::get("/categorias/listado", [CategoriaController::class, 'listado'])->name("categorias.listado");
    Route::resource("categorias", CategoriaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // TIPO PRODUCTOS
    Route::get("/tipo_productos/paginado", [TipoProductoController::class, 'paginado'])->name("tipo_productos.paginado");
    Route::get("/tipo_productos/listado", [TipoProductoController::class, 'listado'])->name("tipo_productos.listado");
    Route::resource("tipo_productos", TipoProductoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // PRODUCTOS
    Route::get("/productos/paginado", [ProductoController::class, 'paginado'])->name("productos.paginado");
    Route::get("/productos/listado", [ProductoController::class, 'listado'])->name("productos.listado");
    Route::resource("productos", ProductoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // TIPO INGRESOS
    Route::get("/tipo_ingresos/paginado", [TipoIngresoController::class, 'paginado'])->name("tipo_ingresos.paginado");
    Route::get("/tipo_ingresos/listado", [TipoIngresoController::class, 'listado'])->name("tipo_ingresos.listado");
    Route::resource("tipo_ingresos", TipoIngresoController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // INGRESOS
    Route::get("/ingresos/paginado", [IngresoController::class, 'paginado'])->name("ingresos.paginado");
    Route::get("/ingresos/listado", [IngresoController::class, 'listado'])->name("ingresos.listado");
    Route::resource("ingresos", IngresoController::class)->only(
        ["index", "create", "store", "edit", "update", "show", "destroy"]
    );

    // TIPO SALIDAS
    Route::get("/tipo_salidas/paginado", [TipoSalidaController::class, 'paginado'])->name("tipo_salidas.paginado");
    Route::get("/tipo_salidas/listado", [TipoSalidaController::class, 'listado'])->name("tipo_salidas.listado");
    Route::resource("tipo_salidas", TipoSalidaController::class)->only(
        ["index", "store", "update", "show", "destroy"]
    );

    // SALIDAS
    Route::get("/salidas/paginado", [SalidaController::class, 'paginado'])->name("salidas.paginado");
    Route::get("/salidas/listado", [SalidaController::class, 'listado'])->name("salidas.listado");
    Route::resource("salidas", SalidaController::class)->only(
        ["index", "create", "store", "edit", "update", "show", "destroy"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");
});

require __DIR__ . '/auth.php';
