<?php

namespace App\Http\Controllers\MonthlyStats;

use App\Http\Controllers\BaseController;
use App\Http\Requests\MonthlyStats\IncomeRequest;
use App\Http\Services\MonthlyStats\MonthlyStatService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class IncomeController extends BaseController
{
    protected MonthlyStatService $service;

    public function __construct()
    {
        // valueField = 'income', hideField = 'tourist_count'
        $this->service = new MonthlyStatService('income', 'tourist_count');
    }

    /**
     * 获取所有收入统计列表（分页）
     */
    public function getAllIncomeList(Request $request): JsonResponse
    {
        $perPage = (int)$request->get('per_page', 10);
        $list = $this->service->getAll($perPage);

        return $this->apiResponse200($list);
    }

    /**
     * 获取指定山脉和年份的收入统计列表（分页）
     * mountain_name 可为空：查询所有山脉
     * year 可为空：默认当前年份
     */
    public function searchIncomeList(Request $request): JsonResponse
    {
        $mountain_name = $request->input('mountain_name'); // ✅ 改这里
        $year = $request->input('year');
        $page = (int)$request->input('page', 1);
        $perPage = (int)$request->input('per_page', 10);

        // ✅ 调用 Service 层时传名称而不是 ID
        $list = $this->service->get($mountain_name, $year, $perPage, $page);

        return $this->apiResponse200($list); // 自动包含分页数据
    }

    /**
     * 新增收入统计数据
     */
    public function addIncome(IncomeRequest $request): JsonResponse
    {
        $data = [
            'mountain_id' => $request->integer('mountain_id'),
            'year' => $request->integer('year'),
            'month' => $request->integer('month'),
            'income' => $request->input('income')
        ];

        $result = $this->service->add($data);

        if ($result === null) {
            return $this->apiResponse404('找不到对应山脉');
        }

        if ($result === 'exists') {
            return $this->apiResponse409('该月份的收入已存在，不能重复添加');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 更新收入统计数据
     */
    public function updateIncome(Request $request, int $income_id): JsonResponse
    {
        $income = $request->input('income');
        $result = $this->service->update($income_id, $income);

        if ($result === null) {
            return $this->apiResponse404('未找到对应记录');
        }

        return $this->apiResponse200($result);
    }

    /**
     * 删除收入统计数据
     */
    public function deleteIncome(int $income_id): JsonResponse
    {
        $result = $this->service->delete($income_id);

        if ($result === null) {
            return $this->apiResponse404('未找到对应记录或已删除');
        }

        return $this->apiResponse(200, '删除成功', null);
    }
}
