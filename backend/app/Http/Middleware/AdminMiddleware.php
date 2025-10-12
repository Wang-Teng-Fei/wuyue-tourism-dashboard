<?php

namespace App\Http\Middleware;

use App\Models\Admin;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Traits\ApiResponseTrait;


//  管理员认证中间件，判断请求是否携带合法的管理员 token
class AdminMiddleware
{
    use ApiResponseTrait;

    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        // 获取 Authorization 头
        $authHeader = $request->header('Authorization');

        // 判断是否存在并且是否以 Bearer 开头
        if (!$authHeader || !str_starts_with($authHeader, 'Bearer ')) {
            return $this->apiResponse401(); // 直接用 Trait 的方法
        }

        // 去掉 "Bearer " 前缀
        $token = str_replace('Bearer ', '', $authHeader);

        // 查询管理员
        $admin = Admin::where('token', $token)->first();

        // 判断管理员是否存在
        if (!$admin) {
            return $this->apiResponse401('管理员不存在');
        }

//        判断账号是否被封禁
        if (!$admin->status) {
            return $this->apiResponse(403, '账号被封禁', null);
        }

        // 将管理员的信息绑定到请求里，方便后续使用
        $request->attributes->set('admin_info', $admin);

        // 放行请求
        return $next($request);
    }
}
