<?php

namespace App\Http\Traits;

trait ApiResponseTrait
{

    protected function apiResponse($code, $msg, $data)
    {
        $response = [
            'code' => $code,
            'msg' => $msg,
            'data' => $data
        ];

        if (is_null($data)) unset($response['data']);

        return response()->json($response, $code);
    }

//    200
    protected function apiResponse200($data = null)
    {
        return $this->apiResponse(200, '请求成功', $data);
    }

//    401
    protected function apiResponse401($msg = '未授权', $data = null)
    {
        return $this->apiResponse(401, $msg, $data);
    }

//    403
    protected function apiResponse403($msg = '权限不足', $data = null)
    {
        return $this->apiResponse(403, $msg, $data);
    }

//    404
    protected function apiResponse404($msg = '请求的资源不存在', $data = null)
    {
        return $this->apiResponse(404, $msg, $data);
    }

//    409
    protected function apiResponse409($msg = '资源已存在', $data = null)
    {
        return $this->apiResponse(409, $msg, $data);
    }


//    422
    protected function apiResponse422($msg = '参数验证失败', $data = null)
    {
        return $this->apiResponse(422, $msg, $data);
    }
}
