<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\AnnualStats\MountainHeightController;
use App\Http\Controllers\AnnualStats\VegetationCoverageController;
use App\Http\Controllers\Charts\FlylineCenterPointsController;
use App\Http\Controllers\Charts\FlylineChartController;
use App\Http\Controllers\MonthlyStats\IncomeController;
use App\Http\Controllers\MonthlyStats\MonthlyTouristStatsController;
use App\Http\Controllers\MonthlyStats\TouristCountController;
use App\Http\Controllers\Mountain\MountainIdController;
use App\Http\Controllers\Visualization\VisualizationConfigController;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\SuperAdminMiddleware;
use App\Http\Middleware\VisualizationApiKey;
use Illuminate\Support\Facades\Route;

Route::middleware([AdminMiddleware::class])->group(function () {
//    ------------- 飞线图 -------------
    Route::prefix('/flyline-charts')->group(function () {
//        获取飞线图名称列表
        Route::get('/name', [FlylineChartController::class, 'searchFlylineChartsNameList']);
//        获取飞线图列表
        Route::get('/list', [FlylineChartController::class, 'getFlylineChartsList']);
//        按名称查询飞线图
        Route::get('/search/name', [FlylineChartController::class, 'getFlylineChartSearchName']);
//        获取单个飞线图详情
        Route::get('/{flyline_id}', [FlylineChartController::class, 'getFlylineCharts']);
//        新增飞线图
        Route::post('/', [FlylineChartController::class, 'addFlylineCharts']);
//        更新飞线图
        Route::patch('/{flyline_id}', [FlylineChartController::class, 'updateFlylineCharts']);
//        删除飞线图
        Route::delete('/{flyline_id}', [FlylineChartController::class, 'deleteFlylineCharts']);
    });

//    ------------- 飞线图中心点 -------------
    Route::prefix('/flyline-center-points')->group(function () {
//        获取飞线图中心点列表
        Route::get('/list', [FlylineCenterPointsController::class, 'getFlylineChartsCenterList']);
//        获取单个飞线图中心点详情
        Route::get('/{center_points_id}', [FlylineCenterPointsController::class, 'getFlylineChartsCenterDetail']);
//        新增飞线图中心点
        Route::post('/add', [FlylineCenterPointsController::class, 'addFlylineChartsCenter']);
//        更新飞线图中心点
        Route::patch('/{center_points_id}/update', [FlylineCenterPointsController::class, 'updateFlylineChartsCenter']);
//        删除飞线图中心点
        Route::delete('/{center_points_id}/delete', [FlylineCenterPointsController::class, 'deleteFlylineChartsCenter']);
    });

//    ------------- 山脉 -------------
    Route::prefix('/mountains')->group(function () {
//        按名称查询山脉
        Route::get('/search/name/details-list', [MountainIdController::class, 'getMountainSearchName']);
//        获取山脉名称列表
        Route::get('/name', [MountainIdController::class, 'getMountainNameList']);
//        关键字搜索山脉名称列表
        Route::get('/search/name', [MountainIdController::class, 'searchMountainNameList']);
//        获取山脉列表分页
        Route::get('/', [MountainIdController::class, 'getMountainListPage']);
//        新增山脉
        Route::post('/add', [MountainIdController::class, 'addMountain']);
//        更新山脉
        Route::patch('/{mountain_id}/update', [MountainIdController::class, 'updateMountain']);
//        删除山脉
        Route::delete('/{mountain_id}/delete', [MountainIdController::class, 'deleteMountain']);
    });

//    ------------- 游客数量 -------------
    Route::prefix('/tourist-count')->group(function () {
//        获取：所有游客数量统计列表（分页）
        Route::get('/all', [TouristCountController::class, 'getAllTouristCountList']);
//        获取：指定山脉和年份游客数量统计列表
        Route::get('/search', [TouristCountController::class, 'searchTouristCountList']);
//        新增：指定山脉游客数量统计数据（先获取，是否有当前年份与月份的数据，没有再新建记录； 如果有，判断该字段数据是否为空，为空则填充，不为空则返回400）
        Route::post('/add', [TouristCountController::class, 'addTouristCount']);
//        更新：游客数量统计数据
        Route::patch('/{tourist_id}/update', [TouristCountController::class, 'updateTouristCount']);
//        删除：游客数量统计数据（只需要把这一项数据变为空即可，如果“游客数量”和“景区收入”都是空则删除这一条）
        Route::delete('/{tourist_id}/delete', [TouristCountController::class, 'deleteTouristCount']);
    });

//    ------------- 景区收入 -------------
    Route::prefix('/income')->group(function () {
//        获取：所有收入统计列表（分页）
        Route::get('/all', [IncomeController::class, 'getAllIncomeList']);
//        获取：指定山脉和年份收入统计列表
        Route::get('/search', [IncomeController::class, 'searchIncomeList']);
//        新增：指定山脉收入统计数据（先获取，是否有当前年份与月份的数据，没有再新建记录； 如果有，判断该字段数据是否为空，为空则填充，不为空则返回400）
        Route::post('/add', [IncomeController::class, 'addIncome']);
//        更新：收入统计数据
        Route::patch('/{income_id}/update', [IncomeController::class, 'updateIncome']);
//        删除：收入统计数据（只需要把这一项数据变为空即可，如果“游客数量”和“景区收入”都是空则删除这一条）
        Route::delete('/{income_id}/delete', [IncomeController::class, 'deleteIncome']);
    });

//    ------------- 山脉高度 -------------
    Route::prefix('/mountain-height')->group(function () {
//        获取：所有山脉高度统计列表（分页）
        Route::get('/all', [MountainHeightController::class, 'getAllMountainHeight']);
//        获取：获取指定山脉高度列表
        Route::get('/search', [MountainHeightController::class, 'getMountainHeight']);
//        新增：当前山脉高度的年度统计数据（先获取，是否有当前年份的数据，没有再新建记录； 如果有，判断该字段数据是否为空，为空则填充，不为空则返回400）
        Route::post('/add', [MountainHeightController::class, 'addMountainHeight']);
//      更新：当前山脉高度的年度统计数据
        Route::patch('/{height_id}/update', [MountainHeightController::class, 'updateMountainHeight']);
//      删除：当前山脉高度的年度统计数据（只需要把这一项数据变为空即可，如果“山脉高度”和“植被覆盖率”都是空则删除这一条）
        Route::delete('/{height_id}/delete', [MountainHeightController::class, 'deleteMountainHeight']);
    });

//    ------------- 植被覆盖率 -------------
    Route::prefix('/vegetation-coverage')->group(function () {
//        获取：所有植被覆盖率统计列表（分页）
        Route::get('/all', [VegetationCoverageController::class, 'getAllVegetationCoverage']);
//        获取：获取指定植被覆盖率列表
        Route::get('/search', [VegetationCoverageController::class, 'getVegetationCoverage']);
//        新增：当前植被覆盖率的年度统计数据（先获取，是否有当前年份的数据，没有再新建记录； 如果有，判断该字段数据是否为空，为空则填充，不为空则返回400）
        Route::post('/add', [VegetationCoverageController::class, 'addVegetationCoverage']);
//      更新：当前植被覆盖率的年度统计数据
        Route::patch('/{coverage_id}/update', [VegetationCoverageController::class, 'updateVegetationCoverage']);
//      删除：当前植被覆盖率的年度统计数据（只需要把这一项数据变为空即可，如果“植被覆盖率”和“植被覆盖率”都是空则删除这一条）
        Route::delete('/{coverage_id}/delete', [VegetationCoverageController::class, 'deleteVegetationCoverage']);
    });

//    ------------- 可视化配置 -------------
    Route::prefix('/visualization-configs')->group(function () {
//        获取开启状态可视化配置详情（可视化界面用的，请求头验证）
        Route::get('/active', [VisualizationConfigController::class, 'getVisualizationConfigActive'])->middleware([VisualizationApiKey::class])->withoutMiddleware([AdminMiddleware::class]);
//        获取可视化配置列表
        Route::get('/list', [VisualizationConfigController::class, 'getVisualizationConfigList']);
//        按名称查询可视化配置
        Route::get('/search/name', [VisualizationConfigController::class, 'getVisualizationConfigSearchName']);
//        获取单个可视化配置详情，只匹配数字 ID
        Route::get('/{visualization_id}', [VisualizationConfigController::class, 'getVisualizationConfigDetail'])->where('visualization_id', '[0-9]+');
//        新增可视化配置
        Route::post('/add', [VisualizationConfigController::class, 'addVisualizationConfig']);
//        更新可视化配置
        Route::patch('/{visualization_id}/update', [VisualizationConfigController::class, 'updateVisualizationConfig']);
//        更新可视化配置激活状态
        Route::patch('/{visualization_id}/active/update', [VisualizationConfigController::class, 'updateVisualizationConfigActive']);
//        删除可视化配置
        Route::delete('/{visualization_id}/delete', [VisualizationConfigController::class, 'deleteVisualizationConfig']);
    });

//    ------------- 管理员 -------------
    Route::prefix('/admin')->group(function () {
//        管理员登录
        Route::post('/login', [AdminController::class, 'login'])->withoutMiddleware([AdminMiddleware::class]);
//        管理员登出
        Route::post('/logout', [AdminController::class, 'logout']);
//        获取管理员个人信息
        Route::get('/', [AdminController::class, 'getProfile']);
//        更新管理员个人信息
        Route::patch('/update-profile', [AdminController::class, 'updateProfile']);
//        更新管理员密码
//        Route::patch('/update-password', [AdminController::class, 'updatePassword']);

//        判断是不是超级管理员
        Route::prefix('/super')->middleware([SuperAdminMiddleware::class])->group(function () {
//        获取所有管理员信息列表（仅超级管理员可用）
            Route::get('/all', [AdminController::class, 'getAdminsList']);
//        管理员列表搜索接口（仅超级管理员可用）
            Route::get('/search/admins', [AdminController::class, 'searchAdmins']);
//        获取所有普通管理员或者所有超级管理员（仅超级管理员可用）
            Route::get('/admins', [AdminController::class, 'getAdmins']);
//        按邮箱查询管理员（仅超级管理员可用）
            Route::get('/search/email', [AdminController::class, 'getAdminSearchEmail']);
//        获取单个管理员信息详情（仅超级管理员可用）
            Route::get('/{admin_id}', [AdminController::class, 'getAdminDetail']);
//        新增管理员（仅超级管理员可用）
            Route::post('/add', [AdminController::class, 'addAdmin']);
//        更新管理员信息（仅超级管理员可用）
            Route::patch('/{admin_id}/update', [AdminController::class, 'updateAdmin']);
//        更新管理员信息（仅超级管理员可用）
            Route::patch('/{admin_id}/change-password', [AdminController::class, 'changePassword']);
//        删除管理员（仅超级管理员可用）
            Route::delete('/{admin_id}/delete', [AdminController::class, 'deleteAdmin']);
        });
    });
});
