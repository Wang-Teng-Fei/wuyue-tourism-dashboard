<?php

namespace App\Http\Requests\Visualization;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use Illuminate\Validation\Rule;

class VisualizationConfigRequest extends BaseFormRequest
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
        $visualization_id = $this->route('visualization_id');
        $isUpdate = $this->isMethod('PATCH') || $this->isMethod('PUT');

        $rules = [
            'name' => ['required', 'string', 'max:100', Rule::unique('visualization_configs', 'name')->ignore($visualization_id, 'id')],
            'flyline_chart_id' => ['required', 'integer', 'exists:flyline_charts,id'],
            'mountain_ids' => ['required', 'string', 'json', 'min:1'],
            'year' => ['required', 'integer', 'min:1000', 'max:9999'],
            'background_image' => ['nullable', 'image', 'max:51200'],
            'config_json' => ['nullable', 'string', 'json'],
        ];

        // 只有在更新时才验证 is_active
        if ($isUpdate) {
            $rules['is_active'] = ['required', 'boolean'];
        }

        return $rules;
    }

    public function messages(): array
    {
        return [
            'name.required' => '配置名称必填',
            'name.string' => '配置名称必须是字符串',
            'name.max' => '配置名称不能超过 100 个字符',
            'name.unique' => '配置名称已存在',
            'flyline_chart_id.required' => '飞线图必选',
            'flyline_chart_id.integer' => '飞线图 ID 必须是整数',
            'flyline_chart_id.exists' => '选择的飞线图不存在',
            'mountain_ids.required' => '请选择山脉',
            'mountain_ids.string' => '山脉列表必须是字符串',
            'mountain_ids.json' => '山脉列表必须是 JSON 格式',
            'mountain_ids.min' => '山脉列表不能为空',
            'year.required' => '年份必填',
            'year.integer' => '年份必须是整数',
            'year.min' => '年份格式不正确',
            'year.max' => '年份格式不正确',
            'background_image.image' => '背景图片必须是图片文件',
            'background_image.max' => '背景图片不能超过 50MB',
            'config_json.string' => '配置 JSON 必须是字符串',
            'config_json.json' => '配置 JSON 格式不正确',
            'is_active.required' => '启用状态必填',
            'is_active.boolean' => '启用状态必须是布尔值',
        ];
    }
}
