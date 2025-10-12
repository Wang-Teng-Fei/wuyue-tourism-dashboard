<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\BaseFormRequest;
use Illuminate\Validation\Rule;

class AdminRequest extends BaseFormRequest
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
        // 获取路由参数 admin_id
        $adminId = $this->route('admin_id');

        return [
            'name' => ['required', 'string', 'max:50'],
            'email' => [
                'required',
                'email',
                'max:100',
                Rule::unique('admins', 'email')->ignore($adminId, 'id'),
            ],
            'role' => ['required', 'in:super,admin'],
            'avatar' => ['image', 'mimes:jpeg,png,jpg,gif', 'max:10240'], // 更新时可不传
            'status' => ['required', 'in:0,1']
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => '管理员姓名必填',
            'name.string' => '管理员姓名必须是字符串',
            'name.max' => '管理员姓名不能超过50个字符',

            'email.required' => '邮箱必填',
            'email.email' => '邮箱格式不正确',
            'email.max' => '邮箱不能超过100个字符',
            'email.unique' => '该邮箱已存在',

            'password.string' => '密码必须是字符串',
            'password.min' => '密码最少6位',

            'role.required' => '角色必填',
            'role.in' => '角色必须是 super 或 admin',

            'avatar.required' => '头像必填',
            'avatar.image' => '头像必须是图片文件',
            'avatar.mimes' => '头像格式必须是 jpeg, png, jpg, gif',
            'avatar.max' => '头像大小不能超过10MB',

            'status.required' => '状态必填',
            'status.in' => '状态只能为 0 或 1',
        ];
    }
}
