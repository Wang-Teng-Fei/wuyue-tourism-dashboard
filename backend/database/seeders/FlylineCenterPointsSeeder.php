<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FlylineCenterPointsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('flyline_center_points')->insert([
            [
                'name' => '郑州',
                'image_path' => '/storage/icons/center-zhengzhou.png',
                'width' => 30,
                'height' => 30,
                'halo_config' => json_encode(['show' => true, 'color' => '#00ffff']),
                'text_config' => json_encode(['show' => false]),
                'extra_config' => json_encode([]),
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => '南阳',
                'image_path' => '/storage/icons/center-nanyang.png',
                'width' => 28,
                'height' => 28,
                'halo_config' => json_encode(['show' => true, 'color' => '#37a2da']),
                'text_config' => json_encode(['show' => true, 'color' => '#fff']),
                'extra_config' => json_encode(['opacity' => 0.9]),
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
