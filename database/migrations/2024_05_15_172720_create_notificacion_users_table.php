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
        Schema::create('notificacion_users', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("notificacion_id");
            $table->unsignedBigInteger("user_id");
            $table->integer("visto")->default(0);
            $table->timestamps();

            $table->foreign("notificacion_id")->on("notificacions")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notificacion_users');
    }
};
