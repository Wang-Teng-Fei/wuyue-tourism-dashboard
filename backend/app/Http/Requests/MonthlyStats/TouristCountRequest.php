<?php

namespace App\Http\Requests\MonthlyStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use App\Http\Requests\MonthlyStats\BaseMonthlyStatsRequest;

class TouristCountRequest extends BaseMonthlyStatsRequest
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
            'tourist_count' => 'required|integer|min:0|max:100000000', // 最大1亿
        ];

        return array_merge($parentRules, $customRules);
    }

    public function messages()
    {
        $parentMessages = parent::messages();

        $customMessages = [
            'tourist_count.required' => '游客数量不能为空',
            'tourist_count.integer' => '游客数量必须为整数',
            'tourist_count.min' => '游客数量不能为负数',
            'tourist_count.max' => '游客数量不能超过1亿',
        ];

        return array_merge($parentMessages, $customMessages);
    }
}
