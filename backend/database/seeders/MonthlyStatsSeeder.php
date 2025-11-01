<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\MountainId;
use App\Models\MonthlyStats;

class MonthlyStatsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $mountains = MountainId::all();
        foreach ($mountains as $mountain) {
            for ($year = 2015; $year <= 2025; $year++) {
                for ($month = 1; $month <= 12; $month++) {
                    MonthlyStats::factory()->create([
                        'mountain_id' => $mountain->id,
                        'year' => $year,
                        'month' => $month,
                    ]);
                }
            }
        }
    }
}
