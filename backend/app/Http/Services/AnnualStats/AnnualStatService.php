<?php

namespace App\Http\Services\AnnualStats;

use App\Models\AnnualStats;
use App\Models\MountainId;

class AnnualStatService
{
    /**
     * 获取所有统计列表（分页）
     */
    public function getAll(string $field, int $perPage = 10)
    {
        return AnnualStats::with('mountain')
            ->whereNotNull($field)
            ->orderByDesc('year')
            ->paginate($perPage)
            ->through(function ($item) use ($field) {
                // 隐藏另一个字段和 mountain_id
                if ($field === 'height') {
                    unset($item->vegetation_coverage, $item->mountain_id);
                } else {
                    unset($item->height, $item->mountain_id);
                }
                return $item;
            });
    }

    /**
     * 获取年度统计记录（分页）
     * 支持灵活筛选：
     * 1. 年份为空，山脉名称不为空 → 查询该山脉所有年份的数据
     * 2. 山脉名称为空，年份不为空 → 查询该年份所有山脉的数据
     * 3. 年份和山脉名称都为空 → 查询所有数据
     * 4. 年份和山脉名称都不为空 → 查询指定年份和山脉的数据
     *
     * @param string $field 字段名（height 或 vegetation_coverage）
     * @param string|null $mountain_name 山脉名称，可为空（支持模糊查询）
     * @param int|null $year 年份，可为空
     * @param int $per_page 每页条数
     * @param int $page 当前页码
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function get(string $field, ?string $mountain_name = null, ?int $year = null, int $per_page = 10, int $page = 1)
    {
        // 验证字段名
        if (!in_array($field, ['height', 'vegetation_coverage'])) {
            throw new \InvalidArgumentException('字段名必须是 height 或 vegetation_coverage');
        }

        // 构建查询
        $query = AnnualStats::with('mountain')
            ->whereNotNull($field)
            ->when($year, fn($q) => $q->where('year', $year));

        // 按山脉名称筛选（模糊搜索）
        if ($mountain_name) {
            $query->whereHas('mountain', function ($q) use ($mountain_name) {
                $q->where('name', 'like', "%{$mountain_name}%");
            });
        }

        // 排序：按年份降序排列
        $query->orderByDesc('year');

        // 分页查询 - 如果查询不到数据会返回空的分页结果
        $paginator = $query->paginate($per_page, ['*'], 'page', $page);

        // 格式化数据，隐藏不需要的字段
        $paginator->getCollection()->transform(function ($item) use ($field) {
            if ($field === 'height') {
                unset($item->vegetation_coverage);
            } else {
                unset($item->height);
            }
            unset($item->mountain_id);
            return $item;
        });

        return $paginator;
    }

    /**
     * 新增数据
     */
    public function add(string $field, array $data)
    {
        $mountainId = $data['mountain_id'];
        $year = $data['year'];
        $value = $data['value'];

        $mountain = MountainId::find($mountainId);
        if (!$mountain) {
            return null; // 山脉不存在
        }

        $record = AnnualStats::where('mountain_id', $mountainId)
            ->where('year', $year)
            ->first();

        if ($record) {
            if (is_null($record->$field)) {
                $record->update([$field => $value]);
                $record->mountain_name = $mountain->name;
                if ($field === 'height') {
                    unset($record->vegetation_coverage, $record->mountain_id);
                } else {
                    unset($record->height, $record->mountain_id);
                }
                return $record;
            }
            return 'exists'; // 已存在
        }

        $newRecord = AnnualStats::create([
            'mountain_id' => $mountainId,
            'year' => $year,
            $field => $value,
        ]);

        $newRecord->mountain_name = $mountain->name;
        if ($field === 'height') {
            unset($newRecord->vegetation_coverage, $newRecord->mountain_id);
        } else {
            unset($newRecord->height, $newRecord->mountain_id);
        }

        return $newRecord;
    }

    /**
     * 更新数据
     */
    public function update(string $field, int $id, $value)
    {
        $record = AnnualStats::find($id);

        if (!$record || is_null($record->$field)) {
            return null;
        }

        $record->update([$field => $value]);

        $mountain = MountainId::find($record->mountain_id);
        $record->mountain_name = $mountain?->name;

        if ($field === 'height') {
            unset($record->vegetation_coverage, $record->mountain_id);
        } else {
            unset($record->height, $record->mountain_id);
        }

        return $record;
    }

    /**
     * 删除数据
     */
    public function delete(string $field, int $id)
    {
        $record = AnnualStats::find($id);

        if (!$record) {
            return null; // 记录不存在
        }

        if (is_null($record->$field)) {
            return 'deleted'; // 已删除
        }

        $record->update([$field => null]);

        if (is_null($record->height) && is_null($record->vegetation_coverage)) {
            $record->delete();
        }

        return true;
    }
}
