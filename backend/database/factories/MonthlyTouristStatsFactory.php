<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\MountainId;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\MonthlyTouristStats>
 */
class MonthlyTouristStatsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'mountain_id' => MountainId::factory(), // 自动关联一座山
            'year' => $this->faker->numberBetween(2015, 2025),
            'month' => $this->faker->numberBetween(1, 12),
            'tourist_count' => $this->faker->numberBetween(5000, 500000),
            'income' => $this->faker->randomFloat(2, 100000, 50000000),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
