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
        Schema::create('flyline_charts', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id();
            $table->string('name')->unique()->comment('飞线图名称');
            $table->json('points')->comment('坐标点数组');
            $table->json('lines')->comment('飞线数组');
            $table->string('description')->comment('飞线图描述');
            $table->string('main_image')->comment('主图');
            $table->string('sub_image')->nullable()->comment('附图，可以为空');
            $table->string('point_image_path')->nullable()->comment('普通点图片路径');
            $table->json('extra_config')->nullable()->comment('飞线图额外配置');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('flyline_charts');
    }
};
