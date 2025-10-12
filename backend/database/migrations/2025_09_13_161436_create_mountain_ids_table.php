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
        Schema::create('mountain_ids', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id()->comment('主键 ID，自增，唯一标识一座山峰'); // 主键 id
            $table->string('name', 50)->comment('山峰名称')->unique(); // 山峰名称
            $table->string('province', 50)->comment('所在省份'); // 山峰所在省份
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mountain_ids');
    }
};
