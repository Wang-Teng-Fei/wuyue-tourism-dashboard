<?php

namespace App\Http\Requests\Chars;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use Illuminate\Validation\Rule;

//use Illuminate\Support\Facades\Validator;
class FlylineChartRequest extends BaseFormRequest
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
        $flylineId = $this->route('flyline_id'); // 用于更新时忽略唯一验证

        return [
            'name' => [
                'required',
                'string',
                'max:50',
                $flylineId
                    ? Rule::unique('flyline_charts', 'name')->ignore($flylineId)
                    : 'unique:flyline_charts,name'
            ],
            'description' => ['required', 'string', 'max:255'],

            // 坐标点
            'points' => ['required', 'json', 'min:2'],
            'points.*.name' => ['required', 'string', 'max:50'],
            'points.*.coordinate' => ['required', 'array', 'size:2'],
            'points.*.coordinate.*' => ['numeric', 'between:0,1'],

            // 飞线
            'lines' => ['required', 'json', 'min:1'],
            'lines.*.source' => ['required', 'string'],
            'lines.*.target' => ['required', 'string'],
            'lines.*.color' => ['nullable', 'string'], // 可选
            'lines.*.width' => ['nullable', 'numeric'],

            // 图片
            'main_image' => $flylineId ? ['nullable', 'image', 'max:51200'] : ['required', 'image', 'max:51200'],
            'sub_image' => ['nullable', 'image', 'max:51200'],
            'point_image_path' => ['nullable', 'image', 'max:51200'], // 新增普通点图标

            // 额外配置
            'extra_config' => ['nullable', 'json'],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => '飞线图名称必填',
            'name.string' => '飞线图名称必须是字符串',
            'name.max' => '飞线图名称不能超过50个字符',
            'name.unique' => '飞线图名称已存在',

            'description.required' => '飞线图描述必填',
            'description.string' => '飞线图描述必须是字符串',
            'description.max' => '飞线图描述不能超过255个字符',

            'points.required' => '坐标点数据必填',
            'points.json' => '坐标点数据必须是 JSON 格式',
            'points.min' => '坐标点数组至少包含 2 个元素',
            'points.*.name.required' => '每个坐标点必须有名称',
            'points.*.name.string' => '坐标点名称必须是字符串',
            'points.*.name.max' => '坐标点名称不能超过50个字符',
            'points.*.coordinate.required' => '坐标点坐标必填',
            'points.*.coordinate.array' => '坐标点坐标必须是数组',
            'points.*.coordinate.size' => '坐标点坐标数组必须包含 2 个元素',
            'points.*.coordinate.*.numeric' => '坐标点坐标必须是数字',
            'points.*.coordinate.*.between' => '坐标点坐标值必须在 0~1 之间',

            'lines.required' => '飞线数据必填',
            'lines.json' => '飞线数据必须是 JSON 格式',
            'lines.min' => '飞线数组至少包含 1 个元素',
            'lines.*.source.required' => '飞线必须有源点',
            'lines.*.target.required' => '飞线必须有目标点',
            'lines.*.color.string' => '飞线颜色必须是字符串',
            'lines.*.width.numeric' => '飞线宽度必须是数字',

            'main_image.required' => '主图必填',
            'main_image.image' => '主图必须是图片',
            'main_image.max' => '主图大小不能超过50MB',

            'sub_image.image' => '附图必须是图片',
            'sub_image.max' => '附图大小不能超过50MB',

            'point_image_path.image' => '普通点图标必须是图片',
            'point_image_path.max' => '普通点图标大小不能超过50MB',

            'extra_config.json' => '额外配置必须是 JSON 格式',
        ];
    }
}
