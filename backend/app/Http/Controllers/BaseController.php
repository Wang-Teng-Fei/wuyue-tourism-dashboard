<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Traits\ApiResponseTrait;

class BaseController extends Controller
{
    use ApiResponseTrait; // 引入 Trait
}
