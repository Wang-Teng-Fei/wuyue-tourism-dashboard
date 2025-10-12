<?php

namespace App\Http\Requests\MonthlyStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;

class TouristCountRequest extends BaseFormRequest
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
        return [
            'mountain_id' => ['integer', 'exists:mountain_ids,id'],
            'year' => ['required', 'integer', 'min:1'],
            'month' => ['required', 'integer', 'min:1', 'max:12'],
            'tourist_count' => ['required', 'integer', 'min:0'], // 游客数量可为 0
        ];
    }
    /**
     * 自定义错误消息
     */
    public function messages(): array
    {
        return [
            'year.required' => '年份必填',
            'year.integer' => '年份必须是整数',
            'year.min' => '年份必须大于 0',

            'month.required' => '月份必填',
            'month.integer' => '月份必须是整数',
            'month.min' => '月份不能小于 1',
            'month.max' => '月份不能大于 12',

            'tourist_count.required' => '游客数量必填',
            'tourist_count.integer' => '游客数量必须是整数',
            'tourist_count.min' => '游客数量不能小于 0',
        ];
    }
}
