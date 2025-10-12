<?php

namespace App\Http\Controllers\Visualization;

use App\Http\Controllers\BaseController;
use App\Http\Requests\Visualization\VisualizationConfigRequest;
use App\Models\AnnualStats;
use App\Models\FlylineChart;
use App\Models\MonthlyTouristStats;
use App\Models\MountainId;
use App\Models\VisualizationConfig;
use Illuminate\Http\Request;


// 数据可视化配置控制器
class VisualizationConfigController extends BaseController
{
//     获取单个可视化配置详情（前端展示用，请求头验证）
    public function getVisualizationConfigActive()
    {
        $visualizationConfig = VisualizationConfig::where('is_active', 1)->first();

        if (!$visualizationConfig) {
            return $this->apiResponse404('没有找到激活的可视化配置');
        }

        $mountainIds = $visualizationConfig->mountain_ids;
        $mountainIds = is_array($mountainIds) ? $mountainIds : json_decode($mountainIds);
        $year = $visualizationConfig->year;

        // 一次性查出所有山脉，避免 N+1
        $mountains = MountainId::whereIn('id', $mountainIds)->get()->keyBy('id');

        // 月度级：旅游人数和景区收入统计
        $monthlyStats = [];
        foreach ($mountainIds as $mountainId) {
            $mountain = $mountains->get($mountainId);
            if (!$mountain) continue;

            $monthlyStats[] = [
                'mountain_name' => $mountain->name,
                'mountain_monthly_stats' => MonthlyTouristStats::where('mountain_id', $mountainId)
                    ->where('year', $year)
                    ->get()
                    ->makeHidden('mountain_id')
            ];
        }

        // 年度级：山高和植被覆盖率统计
        $annualStats = [];
        foreach ($mountainIds as $mountainId) {
            $mountain = $mountains->get($mountainId);
            if (!$mountain) continue;

            $annual = AnnualStats::where('mountain_id', $mountainId)
                ->where('year', $year)
                ->first();

            $annualStats[] = [
                'mountain_name' => $mountain->name,
                'mountain_annual_stats' => $annual ? $annual->makeHidden('mountain_id') : null
            ];
        }

        // 返回的数据
        $configJson = $visualizationConfig->config_json ?? [];
        $response = [
            'id' => $visualizationConfig->id,
            'name' => $visualizationConfig->name,
            'flyline_chart' => $visualizationConfig->flylineChart,
            'background_image' => $visualizationConfig->background_image
                ? asset($visualizationConfig->background_image)
                : null,
            'config_json' => $configJson,
            'monthlyStats' => $monthlyStats,
            'annualStats' => $annualStats,
        ];

        $response['flyline_chart']['main_image'] = asset($response['flyline_chart']['main_image']);
        $response['flyline_chart']['sub_image'] = asset($response['flyline_chart']['sub_image']);

        return $this->apiResponse200($response);
    }

//    获取可视化配置列表
    public function getVisualizationConfigList(Request $request)
    {
        $per_page = request()->input('per_page', $request->input('per_page')); // 每页条数，默认10

        $visualizationConfigs = VisualizationConfig::with('flylineChart:id,name')
            ->paginate($per_page);

        // 格式化数据
        $visualizationConfigs->getCollection()->transform(function ($item) {
            $mountain_ids = is_array($item->mountain_ids) ? $item->mountain_ids : json_decode($item->mountain_ids);
            $item->flyline_chart_name = $item->flylineChart->name;
            $item->mountain_info = MountainId::whereIn('id', $mountain_ids)->select(['id', 'name', 'province'])->get();
            unset($item->flylineChart);
            unset($item->flyline_chart_id);
            unset($item->mountain_ids);
            if ($item->background_image) {
                $item->background_image = asset($item->background_image);
            }
            return $item;
        });


        return $this->apiResponse200($visualizationConfigs);
    }

// 按名称查询可视化配置
    public function getVisualizationConfigSearchName(Request $request)
    {
        $visualization_name = $request->input('visualization_name');
        $perPage = $request->input('per_page', 10); // 默认每页10条
        $page = $request->input('page', 1); // 默认第一页

        // 构建查询
        $query = VisualizationConfig::query();

        // 如果名称不为空，添加名称筛选条件
        if (!empty($visualization_name)) {
            $query->where('name', 'like', "%{$visualization_name}%");
        }

        // 按激活状态排序（激活的排在最前面），然后按创建时间倒序
        $visualizationList = $query->orderBy('is_active', 'desc')
            ->paginate($perPage, ['*'], 'page', $page);

        // 转换数据
        $visualizationList->getCollection()->transform(function ($item) {
            $mountainIds = is_array($item['mountain_ids']) ? $item['mountain_ids'] : json_decode($item['mountain_ids']);

            $item['mountain_info'] = MountainId::whereIn('id', $mountainIds)->select(['id', 'name', 'province'])->get();
            $item['flyline_chart_name'] = FlylineChart::where('id', $item->flyline_chart_id)->select(['name'])->first()->name;

            // 为 background_image 添加完整的服务器路径
            if (!empty($item->background_image)) {
                $item->background_image = asset($item->background_image);
            }

            unset($item->mountain_ids);
            unset($item->flyline_chart_id);

            return $item;
        });

        return $this->apiResponse200($visualizationList);
    }

//    获取单个可视化配置详情
    public function getVisualizationConfigDetail(Request $request, $visualization_id)
    {
        $visualizationConfig = VisualizationConfig::find($visualization_id);

        if (!$visualizationConfig) {
            return $this->apiResponse404();
        }

        $mountainIds = $visualizationConfig->mountain_ids;
        $mountainIds = is_array($mountainIds) ? $mountainIds : json_decode($mountainIds);
        $year = $visualizationConfig->year;

        // 一次性查出所有山脉，避免 N+1
        $mountains = MountainId::whereIn('id', $mountainIds)->get()->keyBy('id');

        // 月度级：旅游人数和景区收入统计
        $monthlyStats = [];
        foreach ($mountainIds as $mountainId) {
            $mountain = $mountains->get($mountainId);
            if (!$mountain) continue;

            $monthlyStats[] = [
                'mountain_name' => $mountain->name,
                'mountain_monthly_stats' => MonthlyTouristStats::where('mountain_id', $mountainId)
                    ->where('year', $year)
                    ->get()
                    ->makeHidden('mountain_id')
            ];
        }

        // 年度级：山高和植被覆盖率统计
        $annualStats = [];
        foreach ($mountainIds as $mountainId) {
            $mountain = $mountains->get($mountainId);
            if (!$mountain) continue;

            $annual = AnnualStats::where('mountain_id', $mountainId)
                ->where('year', $year)
                ->first();

            $annualStats[] = [
                'mountain_name' => $mountain->name,
                'mountain_annual_stats' => $annual ? $annual->makeHidden('mountain_id') : null
            ];
        }

        // 返回的数据
        $configJson = $visualizationConfig->config_json ?? [];
        $response = [
            'id' => $visualization_id,
            'name' => $visualizationConfig->name,
            'flyline_chart' => $visualizationConfig->flylineChart,
            'background_image' => $visualizationConfig->background_image
                ? asset($visualizationConfig->background_image)
                : null,
            'config_json' => $configJson,
            'monthlyStats' => $monthlyStats,
            'annualStats' => $annualStats,
        ];

        $response['flyline_chart']['main_image'] = asset($response['flyline_chart']['main_image']);
        $response['flyline_chart']['sub_image'] = asset($response['flyline_chart']['sub_image']);

        return $this->apiResponse200($response);
    }

//    新增可视化配置
    public function addVisualizationConfig(VisualizationConfigRequest $request)
    {
        $data = $request->validated();

        // 处理主图上传
        if ($request->hasFile('background_image')) {
            $backgroundImagePath = $request->file('background_image')->store('visualizations', 'public');
            $data['background_image'] = '/storage/' . $backgroundImagePath;
        }

        $result = VisualizationConfig::create($data);

        $result['flyline_chart_name'] = FlylineChart::find($result['flyline_chart_id'])->name;

        $mountainIds = $result->mountain_ids;
        $mountainIds = is_array($mountainIds) ? $mountainIds : json_decode($mountainIds);

//      查询名字
        $mountainNames = MountainId::whereIn('id', $mountainIds)->pluck('name')->toArray();

//      返回给前端
        $result['mountain_names'] = $mountainNames;

        $result['background_image'] = asset('/storage/' . $backgroundImagePath);

        $result->makeHidden('mountain_ids')->makeHidden('flyline_chart_id');

        return $this->apiResponse200($result);
    }

//    更新可视化配置
    public function updateVisualizationConfig(VisualizationConfigRequest $request, $visualization_id)
    {
        $visualizationConfig = VisualizationConfig::find($visualization_id);

        $fullPath = public_path($visualizationConfig->background_image);
        if (file_exists($fullPath)) {
            // 删除文件
            unlink($fullPath);
        }

        if (!$visualizationConfig) {
            return $this->apiResponse404();
        }

        $data = $request->validated();

        // 处理主图上传
        if ($request->hasFile('background_image')) {
            $backgroundImagePath = $request->file('background_image')->store('visualizations', 'public');
            $data['background_image'] = '/storage/' . $backgroundImagePath;
        }

        $visualizationConfig->update($data);

        $result = VisualizationConfig::find($visualization_id);

        $result['flyline_chart_name'] = FlylineChart::find($result['flyline_chart_id'])->name;

        $result['background_image'] = asset('/storage/' . $backgroundImagePath);

        $mountainIds = $result->mountain_ids;
        $mountainIds = is_array($mountainIds) ? $mountainIds : json_decode($mountainIds);

//      查询名字
        $mountainNames = MountainId::whereIn('id', $mountainIds)->pluck('name')->toArray();

//      返回给前端
        $result['mountain_names'] = $mountainNames;

        $result['background_image'] = asset('/storage/' . $backgroundImagePath);

        $result->makeHidden('mountain_ids')->makeHidden('flyline_chart_id');

        return $this->apiResponse200($result);
    }

//    更新可视化配置激活状态
    public function updateVisualizationConfigActive(Request $request, $visualization_id)
    {
        $visualizationConfig = VisualizationConfig::find($visualization_id);

        if (!$visualizationConfig) {
            return $this->apiResponse404();
        }

        // 如果已经是激活状态，直接返回
        if ($visualizationConfig->is_active) {
            return $this->apiResponse(200, '已经是激活状态', null);
        }

        // 将其他所有配置设为非激活
        VisualizationConfig::where('is_active', 1)->update(['is_active' => 0]);

        // 激活当前配置
        $visualizationConfig->is_active = 1;
        $visualizationConfig->save();

        return $this->apiResponse(200, '激活成功', null);
    }


//    删除可视化配置
    public function deleteVisualizationConfig($visualization_id)
    {
        $visualizationConfig = VisualizationConfig::find($visualization_id);

        if (!$visualizationConfig) {
            return $this->apiResponse404();
        }

        $visualizationConfig->delete();

        return $this->apiResponse(200, '删除成功', null);
    }

}
