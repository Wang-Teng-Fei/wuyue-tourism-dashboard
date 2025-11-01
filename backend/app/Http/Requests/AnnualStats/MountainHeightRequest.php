<?php

namespace App\Http\Requests\AnnualStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use App\Http\Requests\AnnualStats\BaseAnnualStatsRequest;

class MountainHeightRequest extends BaseAnnualStatsRequest
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
            'height' => 'required|numeric|min:0|max:10000', // 最大10000米
        ];

        return array_merge($parentRules, $customRules);
    }

    public function messages()
    {
        $parentMessages = parent::messages();

        $customMessages = [
            'height.required' => '山高不能为空',
            'height.numeric' => '山高必须为数字',
            'height.min' => '山高不能为负数',
            'height.max' => '山高最大为10000米',
        ];

        return array_merge($parentMessages, $customMessages);
    }
}
