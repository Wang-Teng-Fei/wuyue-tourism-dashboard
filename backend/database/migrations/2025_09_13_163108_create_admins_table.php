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
        Schema::create('admins', function (Blueprint $table) {
            $table->engine('InnoDB');
            $table->id()->comment('主键，自增ID');
            $table->string('name', 50)->comment('管理员姓名或用户名');
            $table->string('email', 100)->unique()->comment('登录邮箱，唯一');
            $table->string('password')->comment('密码（加密存储）');
            $table->string('role', 20)->default('admin')->comment('管理员角色，super(超级管理员)，admin(普通管理员)');
            $table->string('token', 100)->nullable()->comment('记住我或 API Token'); // token
            $table->tinyInteger('status')->default(1)->comment('状态：1=启用，0=禁用');
            $table->string('avatar', 255)->comment('头像 URL 或路径');
            $table->timestamp('last_login_at')->nullable()->comment('最后登录时间');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admins');
    }
};
