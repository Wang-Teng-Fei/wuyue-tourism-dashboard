<?php

namespace App\Http\Requests\Chars;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use App\Http\Requests\BaseFormRequest;

class FlylineCenterPointsRequest extends BaseFormRequest
{
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
        // 获取路由里的中心点 ID（用于更新时忽略自己）
        $centerPointId = $this->route('center_points_id');

        return [
            'name' => [
                'required',
                'string',
                'max:100',
                Rule::unique('flyline_center_points', 'name')
                    ->ignore($centerPointId, 'id'), // 更新时忽略自己
            ],
            'image_path' => [
                'required',
                'image',
                'mimes:jpeg,png,jpg,gif',
                'max:10240', // 最大 10MB
            ],
            'width' => ['nullable', 'integer', 'min:1', 'max:500'],
            'height' => ['nullable', 'integer', 'min:1', 'max:500'],
            'halo_config' => ['nullable', 'string'], // JSON 字符串
            'text_config' => ['nullable', 'string'], // JSON 字符串
            'extra_config' => ['nullable', 'string'], // JSON 字符串
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => '中心点名称必填',
            'name.string' => '中心点名称必须是字符串',
            'name.max' => '中心点名称不能超过100个字符',
            'name.unique' => '该中心点名称已存在',

            'image_path.required' => '中心点图片必填',
            'image_path.image' => '上传文件必须是图片',
            'image_path.mimes' => '图片格式必须是 jpeg, png, jpg, gif',
            'image_path.max' => '图片大小不能超过10MB',

            'width.integer' => '宽度必须是整数',
            'width.min' => '宽度不能小于1',
            'width.max' => '宽度不能超过500',

            'height.integer' => '高度必须是整数',
            'height.min' => '高度不能小于1',
            'height.max' => '高度不能超过500',

            'halo_config.string' => '光环配置必须是字符串',
            'text_config.string' => '文本配置必须是字符串',
            'extra_config.string' => '额外配置必须是字符串',
        ];
    }
}
