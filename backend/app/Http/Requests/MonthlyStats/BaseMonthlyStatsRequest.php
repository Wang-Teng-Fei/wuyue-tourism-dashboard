<?php

namespace App\Http\Requests\MonthlyStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;

class BaseMonthlyStatsRequest extends BaseFormRequest
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
            'mountain_id' => 'required|exists:mountain_ids,id',
            'year' => 'required|integer|min:1000|max:2100',
            'month' => 'required|integer|min:1|max:12',
        ];
    }

    public function messages()
    {
        return [
            'mountain_id.required' => '必须选择山脉',
            'mountain_id.exists' => '选择的山脉不存在',
            'year.required' => '年份不能为空',
            'year.integer' => '年份必须为整数',
            'year.min' => '年份不能早于1000年',
            'year.max' => '年份不能晚于2100年',
            'month.required' => '月份不能为空',
            'month.integer' => '月份必须为整数',
            'month.min' => '月份必须在1-12之间',
            'month.max' => '月份必须在1-12之间',
        ];
    }
}
