<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\MountainId;

class AnnualStats extends Model
{
    /** @use HasFactory<\Database\Factories\AnnualStatsFactory> */
    use HasFactory;

    protected $table = 'annual_stats';
    // 黑名单：不允许批量赋值的字段
    protected $guarded = ['id', 'created_at', 'updated_at'];

    public function mountain()
    {
        return $this->belongsTo(MountainId::class, 'mountain_id');
    }
}
