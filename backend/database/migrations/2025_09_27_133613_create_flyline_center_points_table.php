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
        Schema::create('flyline_center_points', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id();
            $table->string('name', 100)->unique()->comment('中心点名字');
            $table->string('image_path', 255)->comment('中心点图片路径');
            $table->unsignedInteger('width')->default(30)->comment('图标宽度');
            $table->unsignedInteger('height')->default(30)->comment('图标高度');
            $table->json('halo_config')->nullable()->comment('光环配置');
            $table->json('text_config')->nullable()->comment('文本配置');
            $table->json('extra_config')->nullable()->comment('额外配置');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('flyline_center_points');
    }
};
