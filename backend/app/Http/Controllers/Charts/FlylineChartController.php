<?php

namespace App\Http\Controllers\Charts;

use App\Http\Controllers\BaseController;
use App\Http\Requests\Chars\FlylineChartRequest;
use App\Models\FlylineChart;
use Illuminate\Http\Request;


//  飞线图管理控制器
class FlylineChartController extends BaseController
{
    /**
     * 关键字搜索飞线图名称列表（支持模糊搜索，不分页）
     * 可传入 ?name=关键词
     */
    public function searchFlylineChartsNameList(Request $request)
    {
        $keyword = $request->input('flyline_name'); // 搜索关键字

        $query = FlylineChart::select('id', 'name', 'description');

        // 如果有搜索关键字，执行模糊匹配（名称或描述）
        if (!empty($keyword)) {
            $query->where(function ($q) use ($keyword) {
                $q->where('name', 'like', "%{$keyword}%")
                    ->orWhere('description', 'like', "%{$keyword}%");
            });
        }

        $flylineChartList = $query->get();

        return $this->apiResponse200($flylineChartList);
    }

// 获取飞线图列表
    public function getFlylineChartsList(Request $request)
    {
        // 获取分页参数（默认每页10条）
        $perPage = $request->input('per_page', 10);

        // 使用分页查询
        $flyline_charts = FlylineChart::paginate($perPage);

        // 修改图片路径
        $flyline_charts->getCollection()->transform(function ($item) {
            if (!empty($item->main_image)) {
                $item->main_image = asset($item->main_image);
            }

            if (!empty($item->sub_image)) {
                $item->sub_image = asset($item->sub_image);
            }

            if (!empty($item->point_image_path)) {
                $item->point_image_path = asset($item->point_image_path);
            }

            return $item;
        });

        return $this->apiResponse200($flyline_charts);
    }

//   按名称查询飞线图
    public function getFlylineChartSearchName(Request $request)
    {
        $name = $request->input('flyline_name');

        $flyline_charts = FlylineChart::where('name', $name)->get();

        $flyline_charts = $flyline_charts->map(function ($item) {
            if (isset($item->main_image)) {
                $item->main_image = asset($item->main_image);
            }

            if (isset($item->sub_image)) {
                $item->sub_image = asset($item->sub_image);
            }

            if (isset($item->point_image_path)) {
                $item->point_image_path = asset($item->point_image_path);
            }

            return $item;
        });

        return $this->apiResponse200($flyline_charts);
    }

//    获取单个的飞线图详情
    public function getFlylineCharts($flyline_id)
    {
        $result = FlylineChart::where('id', $flyline_id)->first();

        if (isset($result->main_image)) {
            $result->main_image = asset($result->main_image);
        }

        if (isset($result->sub_image)) {
            $result->sub_image = asset($result->sub_image);
        }

        if (isset($result->point_image_path)) {
            $result->point_image_path = asset($result->point_image_path);
        }

        return $result ? $this->apiResponse200($result) : $this->apiResponse404();
    }

//    新增飞线图
    public function addFlylineCharts(FlylineChartRequest $request)
    {
        // 获取验证后的数据
        $data = $request->validated();

        // 处理主图上传
        if ($request->hasFile('main_image')) {
            $mainImagePath = $request->file('main_image')->store('flylines', 'public');
            $data['main_image'] = '/storage/' . $mainImagePath;
        }

        // 处理附图上传（可选）
        if ($request->hasFile('sub_image')) {
            $subImagePath = $request->file('sub_image')->store('flylines', 'public');
            $data['sub_image'] = '/storage/' . $subImagePath;
        }

        // 普通点的图片
        if ($request->hasFile('point_image_path')) {
            $pointImagePath = $request->file('point_image_path')->store('flylines', 'public');
            $data['point_image_path'] = '/storage/' . $pointImagePath;
        }

        // 保存 JSON 字段（points 和 lines）
        $data['points'] = json_decode($data['points']);
        $data['lines'] = json_decode($data['lines']);

//        创建飞线图数据
        $flylineChart = FlylineChart::create($data);

//       准备返回的数据，包含完整的图片 URL
        if ($request->hasFile('main_image')) {
            $flylineChart['main_image'] = asset('/storage/' . $mainImagePath);
        }
        if ($request->hasFile('sub_image')) {
            $flylineChart['sub_image'] = asset('/storage/' . $subImagePath);
        }
        if ($request->hasFile('point_image_path')) {
            $flylineChart['point_image_path'] = asset('/storage/' . $pointImagePath);
        }

        // 返回成功响应
        return $this->apiResponse200($flylineChart);
    }

//    更新飞线图
    public function updateFlylineCharts(FlylineChartRequest $request, $flyline_id)
    {
        // 获取验证后的数据
        $data = $request->validated();

        $flylineChart = FlylineChart::find($flyline_id);
        if (!$flylineChart) {
            return $this->apiResponse404('飞线图不存在');
        }

        // 处理主图上传
        if ($request->hasFile('main_image')) {
            // 删除旧图片
            if ($flylineChart->main_image && file_exists(public_path($flylineChart->main_image))) {
                unlink(public_path($flylineChart->main_image));
            }

            $mainImagePath = $request->file('main_image')->store('flylines', 'public');
            $data['main_image'] = '/storage/' . $mainImagePath;
        }

        // 处理附图上传（可选）
        if ($request->hasFile('sub_image')) {
            if ($flylineChart->sub_image && file_exists(public_path($flylineChart->sub_image))) {
                unlink(public_path($flylineChart->sub_image));
            }

            $subImagePath = $request->file('sub_image')->store('flylines', 'public');
            $data['sub_image'] = '/storage/' . $subImagePath;
        }

        // 普通点的图片（可选）
        if ($request->hasFile('point_image_path')) {
            if ($flylineChart->point_image_path && file_exists(public_path($flylineChart->point_image_path))) {
                unlink(public_path($flylineChart->point_image_path));
            }

            $pointImagePath = $request->file('point_image_path')->store('flylines', 'public');
            $data['point_image_path'] = '/storage/' . $pointImagePath;
        }

        // 保存 JSON 字段（points 和 lines）
        $data['points'] = json_decode($data['points']);
        $data['lines'] = json_decode($data['lines']);

        // 更新数据
        $flylineChart->update($data);

        // 返回成功响应，确保图片路径为完整 URL
        $data['main_image'] = isset($data['main_image']) ? asset($data['main_image']) : $flylineChart->main_image;
        $data['sub_image'] = isset($data['sub_image']) ? asset($data['sub_image']) : $flylineChart->sub_image;
        $data['point_image_path'] = isset($data['point_image_path']) ? asset($data['point_image_path']) : $flylineChart->point_image_path;

        return $this->apiResponse200($data);
    }


//    删除飞线图
    public function deleteFlylineCharts($flyline_id)
    {
        $flylineChart = FlylineChart::where('id', $flyline_id)->first();

        if (!$flylineChart) return $this->apiResponse404('飞线图不存在');

        $result = $flylineChart->delete();
        // 返回成功响应
        if ($result) return $this->apiResponse(200, $msg = '删除成功', $data = null);
    }
}





















