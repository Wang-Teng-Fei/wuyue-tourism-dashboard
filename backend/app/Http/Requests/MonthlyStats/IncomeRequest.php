<?php

namespace App\Http\Requests\MonthlyStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;

class IncomeRequest extends BaseFormRequest
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
            'income' => ['required', 'numeric', 'min:0'], // 收入 >= 0，可以是小数
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

            'income.required' => '收入必填',
            'income.numeric' => '收入必须是数字',
            'income.min' => '收入不能小于 0',
        ];
    }
}
