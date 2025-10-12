<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\VisualizationConfig;

class FlylineChart extends Model
{
    /** @use HasFactory<\Database\Factories\FlylineChartFactory> */
    use HasFactory;

    protected $table = 'flyline_charts';

    // 黑名单：不允许批量赋值的字段
    protected $guarded = ['id', 'created_at', 'updated_at'];

    // JSON 字段自动转换为数组
    protected $casts = [
        'points' => 'array',
        'lines' => 'array',
    ];

    // 一个飞线图可能对应多个可视化配置
    public function visualizationConfigs()
    {
        return $this->hasMany(VisualizationConfig::class, 'flyline_chart_id');
    }
}
