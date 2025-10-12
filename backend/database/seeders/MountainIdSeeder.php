<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\MountainId;

class MountainIdSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $mountains = [
            ['name' => '西岳华山', 'province' => '陕西'],
            ['name' => '东岳泰山', 'province' => '山东'],
            ['name' => '南岳衡山', 'province' => '湖南'],
            ['name' => '北岳恒山', 'province' => '山西'],
            ['name' => '中岳嵩山', 'province' => '河南'],
        ];

        foreach ($mountains as $mountain) {
            MountainId::create([
                'name' => $mountain['name'],
                'province' => $mountain['province'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
