<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\MountainId;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\AnnualStats>
 */
class AnnualStatsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'height' => $this->faker->randomFloat(2, 1000, 3000),
            'vegetation_coverage' => $this->faker->randomFloat(2, 30, 95),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
