<?php

namespace App\Http\Controllers\AnnualStats;

use App\Http\Controllers\BaseController;
use App\Http\Requests\AnnualStats\MountainHeightRequest;
use App\Http\Services\AnnualStats\AnnualStatService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class MountainHeightController extends BaseController
{
    protected AnnualStatService $service;

    public function __construct(AnnualStatService $service)
    {
        $this->service = $service;
    }

    /**
     * 获取所有山脉高度统计列表（分页）
     */
    public function getAllMountainHeight(Request $request): JsonResponse
    {
        $perPage = (int)$request->get('per_page', 10);
        $list = $this->service->getAll('height', $perPage);

        return $this->apiResponse200($list);
    }

    /**
     * 获取山脉高度统计（支持搜索）
     */
    public function getMountainHeight(Request $request): JsonResponse
    {
        $mountainName = $request->get('mountain_name');
        $year = $request->get('year');
        $perPage = (int)$request->get('per_page', 10);
        $page = (int)$request->get('page', 1);

        $list = $this->service->get('height', $mountainName, $year, $perPage, $page);

        return $this->apiResponse200($list);
    }

    /**
     * 新增山脉高度
     */
    public function addMountainHeight(MountainHeightRequest $request): JsonResponse
    {
        $data = [
            'mountain_id' => $request->integer('mountain_id'),
            'year' => $request->integer('year'),
            'value' => $request->input('height')
        ];

        $result = $this->service->add('height', $data);

        if (is_null($result)) {
            return $this->apiResponse404('找不到对应山脉');
        }

        if ($result === 'exists') {
            return $this->apiResponse409('该年份的山脉高度已存在，不能重复添加');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 更新山脉高度
     */
    public function updateMountainHeight(Request $request, int $heightId): JsonResponse
    {
        $result = $this->service->update('height', $heightId, $request->input('height'));

        if (is_null($result)) {
            return $this->apiResponse404('未找到对应记录');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 删除山脉高度
     */
    public function deleteMountainHeight(int $heightId): JsonResponse
    {
        $result = $this->service->delete('height', $heightId);

        if (is_null($result)) {
            return $this->apiResponse404('未找到对应记录');
        }

        if ($result === 'deleted') {
            return $this->apiResponse404('该记录已删除');
        }

        return $this->apiResponse200(null, '删除成功');
    }
}
