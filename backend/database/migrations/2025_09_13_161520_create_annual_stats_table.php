<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('annual_stats', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id()->comment('主键，自增ID');
            $table->foreignId('mountain_id')
                ->constrained('mountain_ids')
                ->cascadeOnDelete()
                ->comment('外键，关联 Mountains 表 id');
            $table->integer('year')->comment('年份 (数据所属年份)');
            $table->decimal('height', 8, 2)->nullable()->comment('山峰高度 (单位：米)');
            $table->decimal('vegetation_coverage', 5, 2)
                ->nullable()
                ->comment('植被覆盖率（0~100%)');
            $table->timestamps();
            $table->unique(['mountain_id', 'year'], 'unique_mountain_year');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('annual_stats');
    }
};
