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
        Schema::create('ingresos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("proveedor_id");
            $table->unsignedBigInteger("tipo_ingreso_id");
            $table->decimal("precio", 24, 2);
            $table->string("nro_factura", 255);
            $table->string("descripcion", 255)->nullable();
            $table->date("fecha_ingreso");
            $table->date("fecha_registro")->nullable();
            $table->timestamps();

            $table->foreign("proveedor_id")->on("proveedors")->references("id");
            $table->foreign("tipo_ingreso_id")->on("tipo_ingresos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ingresos');
    }
};
