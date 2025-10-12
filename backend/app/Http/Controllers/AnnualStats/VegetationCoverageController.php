<?php

namespace App\Http\Controllers\AnnualStats;

use App\Http\Controllers\BaseController;
use App\Http\Requests\AnnualStats\VegetationCoverageRequest;
use App\Http\Services\AnnualStats\AnnualStatService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class VegetationCoverageController extends BaseController
{
    protected AnnualStatService $service;

    public function __construct(AnnualStatService $service)
    {
        $this->service = $service;
    }

    /**
     * 获取所有植被覆盖率统计列表（分页）
     */
    public function getAllVegetationCoverage(Request $request): JsonResponse
    {
        $perPage = (int)$request->get('per_page', 10);
        $list = $this->service->getAll('vegetation_coverage', $perPage);

        return $this->apiResponse200($list);
    }

    /**
     * 获取植被覆盖率统计（支持搜索）
     */
    public function getVegetationCoverage(Request $request): JsonResponse
    {
        $mountainName = $request->get('mountain_name');
        $year = $request->get('year');
        $perPage = (int)$request->get('per_page', 10);
        $page = (int)$request->get('page', 1);

        $list = $this->service->get('vegetation_coverage', $mountainName, $year, $perPage, $page);
        return $this->apiResponse200($list);
    }

    /**
     * 新增植被覆盖率
     */
    public function addVegetationCoverage(VegetationCoverageRequest $request): JsonResponse
    {
        $data = [
            'mountain_id' => $request->integer('mountain_id'),
            'year' => $request->integer('year'),
            'value' => $request->input('vegetation_coverage')
        ];

        $result = $this->service->add('vegetation_coverage', $data);

        if (is_null($result)) {
            return $this->apiResponse404('找不到对应山脉');
        }

        if ($result === 'exists') {
            return $this->apiResponse409('该年份的植被覆盖率已存在，不能重复添加');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 更新植被覆盖率
     */
    public function updateVegetationCoverage(Request $request, int $coverageId): JsonResponse
    {
        $result = $this->service->update('vegetation_coverage', $coverageId, $request->input('vegetation_coverage'));

        if (is_null($result)) {
            return $this->apiResponse404('未找到对应记录');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 删除植被覆盖率
     */
    public function deleteVegetationCoverage(int $coverageId): JsonResponse
    {
        $result = $this->service->delete('vegetation_coverage', $coverageId);

        if (is_null($result)) {
            return $this->apiResponse404('未找到对应记录');
        }

        if ($result === 'deleted') {
            return $this->apiResponse404('该记录已删除');
        }

        return $this->apiResponse200(null, '删除成功');
    }
}
