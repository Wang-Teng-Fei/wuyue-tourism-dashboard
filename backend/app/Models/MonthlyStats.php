<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\MountainId;

class MonthlyStats extends Model
{
    /** @use HasFactory<\Database\Factories\MonthlyStatsFactory> */
    use HasFactory;

    protected $table = 'monthly_stats';
    protected $guarded = ['id', 'created_at', 'updated_at'];

    // 外键关联山脉
    public function mountain()
    {
        return $this->belongsTo(MountainId::class, 'mountain_id');
    }
}
