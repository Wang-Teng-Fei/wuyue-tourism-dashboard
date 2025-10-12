<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\BaseController;
use App\Http\Requests\Admin\AdminRequest;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

//  管理员控制器
class AdminController extends BaseController
{
//  管理员登录
    public function login(Request $request)
    {
        // 登录逻辑
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return $this->apiResponse(400, '验证失败', $validator->errors());
        }


        $credentials = $request->only('email', 'password');

        // 根据 email 查找管理员
        $admin = Admin::where('email', $credentials['email'])->first();

        if (!$admin) {
            return $this->apiResponse401('邮箱错误');
        }

//        验证密码
        if (!$admin->checkPassword($credentials['password'])) {
            return $this->apiResponse401('密码错误');
        }

//        判断账号是否被封禁
        if (!$admin->status) {
            return $this->apiResponse(403, '账号被封禁', null);
        }

        // 生成新的 token
        $token = Admin::generateToken();
        $admin->token = $token;
        $admin->last_login_at = now();
        $admin->save();

        $response = [
            ...$admin->only('id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'),
        ];

        return $this->apiResponse(200, '登录成功', $response);

    }

//    管理员登出
    public function logout(Request $request)
    {
        $admin_id = $request->attributes->get('admin_info')->id;

        // 登出逻辑
        $admin = Admin::find($admin_id);

        if (!$admin) {
            return $this->apiResponse404();
        }

        $admin->token = null;
        $admin->save();

        return $this->apiResponse(200, '登出成功', null);
    }

//    获取管理员个人信息
    public function getProfile(Request $request)
    {
        $admin_info = $request->attributes->get('admin_info');

        $admin = Admin::select(['id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'])->find($admin_info->id);

        if (!$admin) {
            return $this->apiResponse404();
        }

        $admin['avatar'] = asset($admin['avatar']);

        return $this->apiResponse200($admin);
    }

//    更新管理员个人信息
    public function updateProfile(Request $request)
    {
        $data = Validator::make($request->all(), [
            'email' => ['required', 'email'],
            'name' => ['required', 'string', 'max:50'],
            'avatar' => ['image', 'mimes:jpeg,png,jpg,gif', 'max:10240'],
        ]);

        if ($data->fails()) {
            return $this->apiResponse(400, $data->errors()->all(), null);
        }

        $admin_info = request()->attributes->get('admin_info');

//        判断是否是重复别人的邮箱地址
        $required_email = Admin::where('email', '!=', $admin_info->email)
            ->where('email', $request->email)
            ->first();

        if ($required_email) {
            return $this->apiResponse(400, ['邮箱已存在'], null);
        }

//        获取id
        $admin = Admin::find($admin_info->id);

        $fullPath = public_path($admin->avatar);
        if (file_exists($fullPath)) {
            // 删除文件
            unlink($fullPath);
        }

        $data = $request->all();

        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar')->store('avatars', 'public');
            $data['avatar'] = '/storage/' . $avatar;
        }

        $admin->update($data);

        $response = Admin::select(['id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'])->find($admin_info->id);

        $response['avatar'] = asset($data['avatar'] ?? $response['avatar']);

        return $this->apiResponse200($response);
    }

//    获取所有管理员信息列表（仅超级管理员可用）
    public function getAdminsList()
    {
        // 获取所有管理员逻辑
        $admins = Admin::select(['id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'])->get();

        return $this->apiResponse200($admins);
    }


//     获取所有普通管理员或者所有超级管理员（仅超级管理员可用）

    public function getAdmins(Request $request)
    {
        $role = $request->input('role', 'admin'); // 默认获取普通管理员
        $perPage = (int)$request->input('per_page', 10);

        // 使用自带分页
        $admins = Admin::select(['id', 'name', 'email', 'role', 'status', 'avatar', 'last_login_at'])
            ->where('role', $role)
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);

        $admins->getCollection()->transform(function ($item) {
            $item->avatar = asset($item->avatar);
            return $item;
        });

        return $this->apiResponse200($admins); // 分页对象直接返回，包含 total、per_page、current_page 等
    }

    /**
     * 获取管理员列表（仅超级管理员可用）
     * 支持灵活筛选，并确保超级管理员排在最前面，当前登录的管理员排在第一页第一个
     */
    public function searchAdmins(Request $request)
    {
        $role = $request->input('role'); // 可为空
        $email = $request->input('email'); // 可为空，支持模糊查询
        $perPage = (int)$request->input('per_page', 10);
        $page = (int)$request->input('page', 1);

        // 获取当前登录的管理员ID
        $currentAdminId = $request->attributes->get('admin_info')->id;

        // 构建查询
        $query = Admin::select(['id', 'name', 'email', 'role', 'status', 'avatar', 'last_login_at']);

        // 按角色筛选
        if ($role && in_array($role, ['admin', 'super'])) {
            $query->where('role', $role);
        }

        // 按邮箱模糊搜索
        if ($email) {
            $query->where('email', 'like', "%{$email}%");
        }

        // 排序规则
        if ($page === 1) {
            // 第一页：当前管理员第一，然后超级管理员，最后普通管理员
            $query->orderByRaw('id = ? DESC', [$currentAdminId]) // 当前管理员排第一
            ->orderByRaw("CASE WHEN role = 'super' THEN 0 ELSE 1 END ASC"); // 超级管理员在前
        } else {
            // 其他页：超级管理员在前，普通管理员在后
            $query->orderByRaw("CASE WHEN role = 'super' THEN 0 ELSE 1 END ASC");
        }

        // 分页查询
        $admins = $query->paginate($perPage, ['*'], 'page', $page);

        // 处理头像路径
        $admins->getCollection()->transform(function ($item) {
            $item->avatar = asset($item->avatar);
            return $item;
        });

        return $this->apiResponse200($admins);
    }

//    按邮箱查询管理员（仅超级管理员可用）
    public
    function getAdminSearchEmail(Request $request)
    {
        $admin_email = $request->input('admin_email');

        $adminList = Admin::where('email', $admin_email)
            ->select(['id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'])
            ->get();

        return $this->apiResponse200($adminList);
    }

//    获取单个管理员信息详情（仅超级管理员可用）
    public
    function getAdminDetail($admin_id)
    {
        // 获取单个管理员逻辑
        $admin = Admin::select(['id', 'name', 'email', 'role', 'token', 'status', 'avatar', 'last_login_at'])->find($admin_id);

        if (!$admin) {
            return $this->apiResponse404();
        }

        $admin['avatar'] = asset($admin['avatar']);

        return $this->apiResponse200($admin);

    }

// 新增管理员（仅超级管理员可用）
    public function addAdmin(AdminRequest $request)
    {
            // 手动验证密码
            $validator = Validator::make($request->all(), [
                'password' => [
                    'required',
                    'string',
                    'min:6',
                    'max:50',
                ],
            ], [
                'password.required' => '密码不能为空',
                'password.min' => '密码长度不能少于6位',
                'password.max' => '密码长度不能超过50位',
            ]);

            // 如果密码验证失败，返回错误信息
            if ($validator->fails()) {
                return $this->apiResponse(400, $validator->errors()->first(), null);
            }

            // 添加管理员逻辑
            $data = $request->validated();


            // 加密密码
            $data['password'] = $request->input('password');

            // 处理头像上传
            if ($request->hasFile('avatar')) {
                $avatar = $request->file('avatar')->store('avatars', 'public');
                $data['avatar'] = '/storage/' . $avatar;
            }

            // 创建管理员
            $admin = Admin::create($data);

            // 返回创建的管理员信息（不包含密码）
            $adminData = Admin::select(['id', 'name', 'email', 'role', 'status', 'avatar', 'last_login_at', 'created_at', 'updated_at'])
                ->find($admin->id);

            // 处理头像URL
            if ($adminData->avatar) {
                $adminData->avatar = asset($adminData->avatar);
            }

            return $this->apiResponse200($adminData, '管理员创建成功');

    }

    /**
     * 更新管理员信息（仅超级管理员可用）
     */
    public function updateAdmin(AdminRequest $request, $admin_id)
    {
        // 先查找管理员
        $admin = Admin::find($admin_id);
        if (!$admin) {
            return $this->apiResponse404();
        }

        $data = $request->validated();

        // 处理头像上传
        if ($request->hasFile('avatar')) {
            // 先删除旧头像（如果存在且不是默认头像）
            $this->deleteOldAvatar($admin->avatar);

            // 上传新头像
            $avatar = $request->file('avatar')->store('avatars', 'public');
            $data['avatar'] = '/storage/' . $avatar;
        } else {
            // 如果没有上传新头像，保持原头像
            unset($data['avatar']);
        }

        // 处理密码
        if (isset($data['password'])) {
            if (!empty($data['password'])) {
                $data['password'] = bcrypt($data['password']);
            } else {
                // 如果密码为空，不更新密码
                unset($data['password']);
            }
        }

        // 检查超级管理员修改自己角色的情况
        $admin_info = $request->attributes->get('admin_info');
        $isSelfRoleChange = $admin_info->id === $admin->id
            && $admin_info->role === 'super'
            && isset($data['role'])
            && $data['role'] !== 'super';

        if ($isSelfRoleChange) {
            return $this->apiResponse(400, '超级管理员不能修改自己的角色', null);
        }

        // 更新数据
        $admin->update($data);

        // 准备返回数据
        $responseData = [
            'id' => $admin->id,
            'name' => $admin->name,
            'email' => $admin->email,
            'role' => $admin->role,
            'status' => $admin->status,
            'avatar' => asset($admin->avatar),
            'last_login_at' => $admin->last_login_at,
        ];

        return $this->apiResponse200($responseData);
    }


    /**
     * 更新管理员密码
     */
    public function changePassword(Request $request, $admin_id)
    {
        $validator = Validator::make($request->all(), [
            'new_password' => [
                'required',
                'string',
                'min:6',
                'max:50',
            ],
            'confirm_password' => ['required', 'string', 'min:6', 'same:new_password'],
        ], [
            'new_password.required' => '新密码不能为空',
            'new_password.min' => '新密码长度不能少于6位',
            'new_password.max' => '新密码长度不能超过50位',
            'confirm_password.required' => '确认密码不能为空',
            'confirm_password.min' => '确认密码长度不能少于6位',
            'confirm_password.same' => '两次输入的新密码不一致',
        ]);

        // 2. 如果验证失败，返回错误信息
        if ($validator->fails()) {
            return $this->apiResponse(400, $validator->errors()->first(), null);
        }

        $newPassword = $request->new_password;

        // 检查是否包含字母
        if (!preg_match('/[a-zA-Z]/', $newPassword)) {
            return $this->apiResponse(400, '新密码必须包含至少一个字母', null);
        }

        // 检查是否包含数字
        if (!preg_match('/\d/', $newPassword)) {
            return $this->apiResponse(400, '新密码必须包含至少一个数字', null);
        }


        $admin = Admin::find($admin_id);
        $admin->password = $request->new_password;
        $admin->save();
        return $this->apiResponse(200, '密码更新成功', null);
    }


    /**
     * 删除旧头像
     */
    private function deleteOldAvatar($avatarPath)
    {
        if (!$avatarPath) {
            return;
        }

        // 移除 asset() 生成的 URL 前缀，获取相对路径
        $relativePath = str_replace(asset(''), '', $avatarPath);
        $fullPath = public_path($relativePath);

        // 检查是否是默认头像，默认头像不删除
        $isDefaultAvatar = str_contains($avatarPath, 'default_avatar');

        if (!$isDefaultAvatar && file_exists($fullPath) && is_file($fullPath)) {
            unlink($fullPath);
        }
    }

//    删除管理员（仅超级管理员可用）
    public
    function deleteAdmin($admin_id)
    {
        // 删除管理员逻辑
        $admin = Admin::find($admin_id);

        if (!$admin) {
            return $this->apiResponse404();
        }

        $admin->delete();

        return $this->apiResponse(200, '删除成功', null);
    }

}
