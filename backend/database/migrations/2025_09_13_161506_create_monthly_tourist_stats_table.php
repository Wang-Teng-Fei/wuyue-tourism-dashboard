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
        Schema::create('monthly_tourist_stats', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id()->comment('主键，自增 ID');
            $table->foreignId('mountain_id')
                ->constrained('mountain_ids')
                ->cascadeOnDelete()
                ->comment('外键，关联 Mountains 表 id');
            $table->integer('year')->comment('年份 （数据所属年份）');
            $table->tinyInteger('month')->unsigned()->comment('月份（1-12）');
            $table->integer('tourist_count')->nullable()->comment('当月游客人数');
            $table->decimal('income', 15, 2)->nullable()->comment('当月收入，单位元');
            $table->timestamps();
            $table->unique(['mountain_id', 'year', 'month'], 'unique_mountain_year_month');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('monthly_tourist_stats');
    }
};
