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
        Schema::create('salidas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("tipo_salida_id");
            $table->string("unidad_solicitante", 255);
            $table->string("descripcion", 255)->nullable();
            $table->date("fecha_salida");
            $table->date("fecha_registro")->nullable();
            $table->timestamps();

            $table->foreign("tipo_salida_id")->on("tipo_salidas")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('salidas');
    }
};
