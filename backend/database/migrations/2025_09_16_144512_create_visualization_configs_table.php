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
        Schema::create('visualization_configs', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id();
            $table->string('name', 100)->unique()->comment('配置名称');
            $table->foreignId('flyline_chart_id')
                ->constrained('flyline_charts')
                ->cascadeOnDelete()
                ->comment('飞线图 ID，关联 flyline_charts.id');
            $table->json('mountain_ids')->comment('要展示的山脉 ID 数组');
            $table->integer('year')->comment('数据年份');
            $table->string('background_image', 255)->nullable()->comment('背景图片路径或 URL');
            $table->json('config_json')->nullable()->comment('额外配置，如颜色、大小、动画等');
            $table->boolean('is_active')->default(0)->comment('是否启用，0=禁用，1=启用');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('visualization_configs');
    }
};
