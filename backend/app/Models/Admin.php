<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class Admin extends Model
{
    use HasFactory;

    protected $table = 'admins';

    // 黑名单：不允许批量赋值的字段
    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $hidden = ['password'];

    /**
     * 自动加密密码（创建或更新）
     */
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::needsRehash($value) ? Hash::make($value) : $value;
    }

    /**
     * 生成或刷新 token
     * @return string 返回生成的 token
     */
    public static function generateToken(): string
    {
        return bin2hex(random_bytes(40));
    }

    /**
     * 验证密码是否正确
     */
    public function checkPassword(string $password): bool
    {
        return Hash::check($password, $this->password);
    }
}
