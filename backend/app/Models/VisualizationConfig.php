<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\FlylineChart;

class VisualizationConfig extends Model
{
    /** @use HasFactory<\Database\Factories\VisualizationConfigFactory> */
    use HasFactory;
    protected $table = 'visualization_configs';
    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $casts = [
        'mountain_ids'   => 'array',
        'config_json'    => 'array',
    ];

    // 关联飞线图
    public function flylineChart()
    {
        return $this->belongsTo(FlylineChart::class, 'flyline_chart_id');
    }

    public function mountains()
    {
        return MountainId::whereIn('id', $this->mountain_ids ?: []);
    }

}
