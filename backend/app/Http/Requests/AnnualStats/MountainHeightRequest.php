<?php

namespace App\Http\Requests\AnnualStats;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;

class MountainHeightRequest extends BaseFormRequest
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
            'height' => ['required', 'integer', 'min:1'], // 高度不能为负
        ];
    }

    public function messages(): array
    {
        return [
            'year.required' => '年份必填',
            'year.integer' => '年份必须是整数',
            'year.min' => '年份不能小于 1',

            'height.required' => '山高必填',
            'height.integer' => '山高必须是整数',
            'height.min' => '山高不能小于 1',
        ];
    }
}
