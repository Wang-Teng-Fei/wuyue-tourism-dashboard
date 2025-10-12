<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\MonthlyTouristStats;
use App\Models\AnnualStats;

class MountainId extends Model
{
    /** @use HasFactory<\Database\Factories\MountainIdFactory> */
    use HasFactory;

    protected $table = 'mountain_ids';
    protected $guarded = ['id', 'created_at', 'updated_at'];

    // 山脉的月度统计
    public function monthlyStats()
    {
        return $this->hasMany(MonthlyTouristStats::class, 'mountain_id', 'id');
    }

    // 山脉的年度统计
    public function annualStats()
    {
        return $this->hasMany(AnnualStats::class, 'mountain_id', 'id');
    }

    // 山脉可能出现在多个可视化配置中
    public function visualizationConfigs()
    {
        return $this->whereJsonContains('mountain_ids', $this->id);
    }
}
