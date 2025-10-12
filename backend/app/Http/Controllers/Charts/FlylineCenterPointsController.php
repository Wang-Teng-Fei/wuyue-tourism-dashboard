<?php

namespace App\Http\Controllers\Charts;

use App\Http\Controllers\Controller;
use App\Http\Requests\Chars\FlylineCenterPointsRequest;
use App\Models\FlylineCenterPoints;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\BaseController;

class FlylineCenterPointsController extends BaseController
{
    /**
     * 获取飞线图中心点列表
     */
    public function getFlylineChartsCenterList(Request $request)
    {
        $centerPoints = FlylineCenterPoints::get();

        $centerPoints->transform(function ($item) {
            $item['full_image_path'] = asset("{$item['image_path']}");
            return $item;
        });


        return $this->apiResponse200($centerPoints);
    }

    /**
     * 获取单个飞线图中心点详情
     */
    public function getFlylineChartsCenterDetail($center_points_id)
    {
        $centerPoint = FlylineCenterPoints::find($center_points_id);

        if (!$centerPoint) {
            return $this->apiResponse404('中心点不存在');
        }

        return $this->apiResponse200($centerPoint);
    }

    /**
     * 新增飞线图中心点
     */
    public function addFlylineChartsCenter(FlylineCenterPointsRequest $request)
    {
        $data = $request->validated();

        // 上传图片
        if ($request->hasFile('image_path')) {
            $path = $request->file('image_path')->store('flyline_center_points', 'public');
            $data['image_path'] = '/storage/' . $path;
        }

        $centerPoint = FlylineCenterPoints::create($data);

        $centerPoint['image_path'] = asset($centerPoint['image_path']);

        return $this->apiResponse200($centerPoint);
    }

    /**
     * 更新飞线图中心点
     */
    public function updateFlylineChartsCenter(FlylineCenterPointsRequest $request, $center_points_id)
    {
        $centerPoint = FlylineCenterPoints::find($center_points_id);

        if (!$centerPoint) {
            return $this->apiResponse404('中心点不存在');
        }

        $data = $request->validated();

        // 上传新图片并删除旧图片
        if ($request->hasFile('image_path')) {
            if ($centerPoint->image_path && Storage::disk('public')->exists(str_replace('/storage/', '', $centerPoint->image_path))) {
                Storage::disk('public')->delete(str_replace('/storage/', '', $centerPoint->image_path));
            }
            $path = $request->file('image_path')->store('flyline_center_points', 'public');
            $data['image_path'] = '/storage/' . $path;
        }

        $centerPoint->update($data);
        $centerPoint['image_path'] = asset($centerPoint['image_path']);

        return $this->apiResponse200($centerPoint);
    }

    /**
     * 删除飞线图中心点
     */
    public function deleteFlylineChartsCenter($center_points_id)
    {
        $centerPoint = FlylineCenterPoints::find($center_points_id);

        if (!$centerPoint) {
            return $this->apiResponse404('中心点不存在');
        }

        // 删除图片
        if ($centerPoint->image_path && Storage::disk('public')->exists(str_replace('/storage/', '', $centerPoint->image_path))) {
            Storage::disk('public')->delete(str_replace('/storage/', '', $centerPoint->image_path));
        }

        $centerPoint->delete();

        return $this->apiResponse(200, '删除成功', null);
    }
}
