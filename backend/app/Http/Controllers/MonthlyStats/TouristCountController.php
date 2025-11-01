<?php

namespace App\Http\Controllers\MonthlyStats;

use App\Http\Controllers\BaseController;
use App\Http\Requests\MonthlyStats\TouristCountRequest;
use App\Http\Services\MonthlyStats\MonthlyStatService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class TouristCountController extends BaseController
{
    protected MonthlyStatService $service;

    public function __construct()
    {
        // valueField = 'tourist_count', hideField = 'income'
        $this->service = new MonthlyStatService('tourist_count', 'income');
    }

    /**
     * 获取所有游客数量统计列表（分页）
     */
    public function getAllTouristCountList(Request $request): JsonResponse
    {
        $perPage = (int)$request->get('per_page', 10);
        $list = $this->service->getAll($perPage);

        return $this->apiResponse200($list);
    }

    /**
     * 获取游客数量统计列表（分页）
     * mountain_name 可为空：查询所有山脉
     * year 可为空：默认当前年份
     */
    public function searchTouristCountList(Request $request): JsonResponse
    {
        $mountain_name = $request->input('mountain_name'); // ✅ 改这里
        $year = $request->input('year');
        $page = (int)$request->input('page', 1);
        $perPage = (int)$request->input('per_page', 10);

        // ✅ 改这里：传 mountain_name 而不是 mountain_id
        $list = $this->service->get($mountain_name, $year, $perPage, $page);


        return $this->apiResponse200($list);
    }


    /**
     * 新增游客数量统计数据
     */
    public function addTouristCount(TouristCountRequest $request): JsonResponse
    {
        $data = [
            'mountain_id' => $request->integer('mountain_id'),
            'year' => $request->integer('year'),
            'month' => $request->integer('month'),
            'tourist_count' => $request->integer('tourist_count')
        ];

        $result = $this->service->add($data);

        if ($result === null) {
            return $this->apiResponse404('找不到对应山脉');
        }

        if ($result === 'exists') {
            return $this->apiResponse409('该月份的游客数量已存在，不能重复添加');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 更新游客数量统计数据
     */
    public function updateTouristCount(TouristCountRequest $request, int $tourist_id): JsonResponse
    {
        $tourist_count = $request->input('tourist_count');
        $result = $this->service->update($tourist_id, $tourist_count);

        if ($result === null) {
            return $this->apiResponse404('未找到对应记录');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 删除游客数量统计数据
     */
    public function deleteTouristCount(int $tourist_id): JsonResponse
    {
        $result = $this->service->delete($tourist_id);

        if ($result === null) {
            return $this->apiResponse404('未找到对应记录或已删除');
        }

        return $this->apiResponse(200, '删除成功', null);
    }
}
