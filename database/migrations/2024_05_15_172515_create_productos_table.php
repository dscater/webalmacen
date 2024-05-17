<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string("codigo")->unique();
            $table->bigInteger("nro")->unique();
            $table->string("nombre", 255);
            $table->string("descripcion", 255)->nullable();
            $table->unsignedBigInteger("categoria_id");
            $table->unsignedBigInteger("tipo_producto_id");
            $table->double("stock_minimo", 8, 2);
            $table->double("stock_actual", 8, 2)->default(0);
            $table->decimal("precio", 24, 2)->default(0);
            $table->string("imagen", 255)->nullable();
            $table->date("fecha_registro")->nullable();
            $table->integer("status")->default(1);
            $table->timestamps();

            $table->foreign("categoria_id")->on("categorias")->references("id");
            $table->foreign("tipo_producto_id")->on("tipo_productos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
