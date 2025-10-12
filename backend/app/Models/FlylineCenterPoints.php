<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FlylineCenterPoints extends Model
{
    /** @use HasFactory<\Database\Factories\FlylineCenterPointsFactory> */
    use HasFactory;

    // 指定可以批量赋值的字段
    protected $fillable = [
        'name',
        'image_path',
        'width',
        'height',
        'halo_config',
        'text_config',
        'extra_config',
    ];

    // 自动将 JSON 字段转换为数组
    protected $casts = [
        'halo_config' => 'array',
        'text_config' => 'array',
        'extra_config' => 'array',
    ];
}
