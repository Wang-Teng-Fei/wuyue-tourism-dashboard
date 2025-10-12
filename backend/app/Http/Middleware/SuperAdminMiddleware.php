<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Traits\ApiResponseTrait;
use App\Models\Admin;

//  超级管理员中间件
class SuperAdminMiddleware
{
    use ApiResponseTrait;

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $admin_info = $request->attributes->get('admin_info');

        if(!$admin_info || $admin_info->role !== 'super') {
            return $this->apiResponse403('需要超级管理员权限');
        }

        // 放行请求
        return $next($request);
    }
}
