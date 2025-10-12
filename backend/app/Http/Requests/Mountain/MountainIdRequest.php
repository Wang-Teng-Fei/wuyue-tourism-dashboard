<?php

namespace App\Http\Requests\Mountain;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use Illuminate\Validation\Rule;

class MountainIdRequest extends BaseFormRequest
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
        $mountain_name = $this->route('mountain_id');
        return [
            'name' => ['required', 'string', Rule::unique('mountain_ids', 'name')->ignore($mountain_name, 'id')], // 名称，必填
            'province' => ['required', 'string'], // 描述，必填
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => '山脉名称必填',
            'name.string' => '山脉名称必须是字符串',
            'name.unique' => '山脉名称已存在',
            'province.required' => '省份必填',
            'province.string' => '省份必须是字符串',
        ];
    }
}
