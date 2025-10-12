<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\MountainId;
use App\Models\AnnualStats;

class AnnualStatsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $mountains = MountainId::all();

        $years = range(2015, 2025); // 确保年份唯一

        foreach ($years as $year) {
            $mountain = $mountains->random(); // 随机选一个山
            AnnualStats::create([
                'mountain_id' => $mountain->id,
                'year' => $year,
                'height' => rand(1000, 2500),
                'vegetation_coverage' => rand(50, 90),
            ]);
        }
    }
}
