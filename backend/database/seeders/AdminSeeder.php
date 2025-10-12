<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;


class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        // 超级管理员
        Admin::create([
            'name' => 'superAdmin',
            'email' => 'superadmin@wuyue.com',
            'password' => 'superAdmin_123456', // 模型会自动加密
            'role' => 'super',
            'token' => Admin::generateToken(),
            'status' => 1,
            'avatar' => 'https://i.pravatar.cc/150?img=' . rand(1, 70), // 随机人像
            'last_login_at' => null,
        ]);

        // 普通管理员 1
        Admin::create([
            'name' => 'admin01',
            'email' => 'admin01@wuyue.com',
            'password' => 'admin01_123456',
            'role' => 'admin',
            'token' => Admin::generateToken(),
            'status' => 1,
            'avatar' => 'https://i.pravatar.cc/150?img=' . rand(1, 70),
            'last_login_at' => null,
        ]);

        // 普通管理员 2
        Admin::create([
            'name' => 'admin02',
            'email' => 'admin02@wuyue.com',
            'password' => 'admin02_123456',
            'role' => 'admin',
            'token' => Admin::generateToken(),
            'status' => 1,
            'avatar' => 'https://i.pravatar.cc/150?img=' . rand(1, 70),
            'last_login_at' => null,
        ]);
    }
}
