<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Http\Traits\ApiResponseTrait;

class BaseFormRequest extends FormRequest
{
    use ApiResponseTrait; // 引入 Trait
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
        ];
    }

    /**
     * 验证失败时返回自定义统一格式
     */
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all(); // 获取所有错误信息
        $response = $this->apiResponse(400, $errors, null);

        throw new HttpResponseException($response);
    }
}
