<?php

namespace App\Http\Requests\AnnualStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use App\Http\Requests\AnnualStats\BaseAnnualStatsRequest;

class VegetationCoverageRequest extends BaseAnnualStatsRequest
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
            'vegetation_coverage' => 'required|numeric|min:0|max:100', // 0-100%
        ];

        return array_merge($parentRules, $customRules);
    }

    public function messages()
    {
        $parentMessages = parent::messages();

        $customMessages = [
            'vegetation_coverage.required' => '植被覆盖率不能为空',
            'vegetation_coverage.numeric' => '植被覆盖率必须为数字',
            'vegetation_coverage.min' => '植被覆盖率不能为负数',
            'vegetation_coverage.max' => '植被覆盖率最大为100%',
        ];

        return array_merge($parentMessages, $customMessages);
    }
}
