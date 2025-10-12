<?php

namespace App\Http\Requests\AnnualStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;

class VegetationCoverageRequest extends BaseFormRequest
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
            'year' => ['required', 'integer', 'min:1'],
            'vegetation_coverage' => ['required', 'numeric', 'between:0,100'], // 百分比 0~100
        ];
    }

    public function messages(): array
    {
        return [
            'year.required' => '年份必填',
            'year.integer' => '年份必须是整数',
            'year.min' => '年份不能小于 1',

            'vegetation_coverage.required' => '植被覆盖率必填',
            'vegetation_coverage.numeric' => '植被覆盖率必须是数字',
            'vegetation_coverage.between' => '植被覆盖率必须在 0~100 之间',
        ];
    }
}
