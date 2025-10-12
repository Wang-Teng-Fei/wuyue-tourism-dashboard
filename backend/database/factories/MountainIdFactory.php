<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\MountainId>
 */
class MountainIdFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->word . '山',  // 随机山名
            'province' => $this->faker->state,             // 随机省份
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
