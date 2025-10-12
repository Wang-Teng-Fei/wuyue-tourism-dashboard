<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Traits\ApiResponseTrait;


// 可视化平台 API 密钥认证中间件
class VisualizationApiKey
{
    use ApiResponseTrait;

    /**
     * Handle an incoming request.
     *
     * @param \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response) $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $key = $request->header('X-API-KEY'); // 前端传过来的密钥

        if (!$key || $key !== env('VISUALIZATION_API_KEY')) {
            return $this->apiResponse401(); // 直接用 Trait 的方法
        }

        return $next($request);
    }
}
