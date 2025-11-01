<?php

namespace App\Http\Controllers\Mountain;

use App\Http\Controllers\BaseController;
use App\Http\Requests\Mountain\MountainIdRequest;
use App\Models\MountainId;
use Illuminate\Http\Request;


//  山脉管理控制器
class MountainIdController extends BaseController
{
// 按名称关键字查询山脉（分页）
    public function getMountainSearchName(Request $request)
    {
        $keyword = trim($request->input('mountain_name', ''));
        $perPage = (int)$request->input('per_page', 10); // 每页条数，默认 10
        $page = (int)$request->input('page', 1); // 当前页码，默认第 1 页

        $query = MountainId::query()
            ->select(['id', 'name', 'province']);

        // 仅当关键字不为空时才进行模糊查询
        if ($keyword !== '') {
            $query->where('name', 'like', "%{$keyword}%");
        }

        $mountainList = $query->paginate($perPage, ['*'], 'page', $page);

        return $this->apiResponse200($mountainList);
    }

//    获取山脉名称列表
    public function getMountainNameList()
    {
        $mountainList = MountainId::select('id', 'name')->get();
        return $this->apiResponse200($mountainList);
    }


    /**
     * 关键字搜索山脉名称列表（支持模糊搜索，不分页）
     * 可传入 ?name=关键词
     */
    public function searchMountainNameList(Request $request)
    {
        $keyword = $request->input('mountain_name'); // 搜索关键字

        $query = MountainId::select('id', 'name');

        // 如果有搜索关键字，执行模糊匹配
        if (!empty($keyword)) {
            $query->where('name', 'like', "%{$keyword}%");
        }

        $mountainList = $query->get();

        return $this->apiResponse200($mountainList);
    }


//    获取山脉列表分页
    public function getMountainListPage(Request $request)
    {
        $mountainList = MountainId::paginate($request->input('per_page', 10));
        return $this->apiResponse200($mountainList);
    }

//   新增山脉
    public function addMountain(MountainIdRequest $request)
    {
        $data = $request->validated();

        $mountain = MountainId::create($data);

        return $this->apiResponse200($mountain);
    }

//   更新山脉
    public function updateMountain(MountainIdRequest $request, $mountain_id)
    {
        $data = $request->validated();

        $mountain = MountainId::find($mountain_id);

        if (!$mountain) {
            return $this->apiResponse404();
        }

        $mountain->update($data);

        $result = MountainId::find($mountain_id);

        return $this->apiResponse200($result);
    }

//    删除山脉
    public function deleteMountain($mountain_id)
    {
        $mountain = MountainId::find($mountain_id);

        if (!$mountain) {
            return $this->apiResponse404();
        }

        // 删除相关的月度和年度统计数据
        $mountain->monthlyStats()->delete();
        $mountain->annualStats()->delete();

        // 删除山脉
        $mountain->delete();

        return $this->apiResponse(200, '删除成功', null);
    }

}
