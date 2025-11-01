<?php

namespace App\Http\Requests\MonthlyStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use App\Http\Requests\MonthlyStats\BaseMonthlyStatsRequest;

class IncomeRequest extends BaseMonthlyStatsRequest
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
        $parentRules = parent::rules();

        $customRules = [
            'income' => 'required|numeric|min:0|max:100000000000', // 最大1000亿
        ];

        return array_merge($parentRules, $customRules);
    }

    public function messages()
    {
        $parentMessages = parent::messages();

        $customMessages = [
            'income.required' => '收入不能为空',
            'income.numeric' => '收入必须为数字',
            'income.min' => '收入不能为负数',
            'income.max' => '收入最大为1000亿元',
        ];

        return array_merge($parentMessages, $customMessages);
    }
}
