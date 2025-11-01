<?php

namespace App\Http\Services\MonthlyStats;

use App\Models\MonthlyStats;
use App\Models\MountainId;
use Illuminate\Pagination\LengthAwarePaginator;

class MonthlyStatservice
{
    protected string $valueField; // 例如：tourist_count / income
    protected string $hideField;  // 对应需要隐藏的字段

    public function __construct(string $valueField, string $hideField)
    {
        $this->valueField = $valueField;
        $this->hideField = $hideField;
    }

    /**
     * 获取所有记录（分页）
     */
    public function getAll(int $perPage = 10): LengthAwarePaginator
    {
        $list = MonthlyStats::with('mountain')
            ->whereNotNull($this->valueField)
            ->orderByDesc('year')
            ->orderByDesc('month')
            ->paginate($perPage);

        $list->getCollection()->transform(function ($item) {
            unset($item->{$this->hideField}, $item->mountain_id);
            return $item;
        });

        return $list;
    }


    /**
     * 获取指定山脉名称和年份的记录（分页）
     * 支持灵活筛选：
     * 1. 年份为空，山脉名称不为空 → 查询该山脉所有年份的数据
     * 2. 山脉名称为空，年份不为空 → 查询该年份所有山脉的数据
     * 3. 年份和山脉名称都为空 → 查询所有数据
     *
     * @param string|null $mountain_name 山脉名称，可为空（支持模糊查询）
     * @param int|null $year 年份，可为空
     * @param int $per_page 每页条数
     * @param int $page 当前页码
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function get(?string $mountain_name = null, ?int $year = null, int $per_page = 10, int $page = 1)
    {
        // 构建查询
        $query = MonthlyStats::with('mountain')
            ->whereNotNull($this->valueField)
            ->when($year, fn($q) => $q->where('year', $year));

        // 按山脉名称筛选（模糊搜索）
        if ($mountain_name) {
            $query->whereHas('mountain', function ($q) use ($mountain_name) {
                $q->where('name', 'like', "%{$mountain_name}%");
            });
        }

        // 排序：优先按山脉ID，其次按年份和月份
        $query->orderBy('mountain_id')
            ->orderBy('year')
            ->orderBy('month');

        // 分页查询 - 如果查询不到数据会返回空的分页结果
        $paginator = $query->paginate($per_page, ['*'], 'page', $page);

        // 格式化数据，隐藏不需要的字段
        $paginator->getCollection()->transform(function ($item) {
            unset($item->{$this->hideField}, $item->mountain_id);
            return $item;
        });

        return $paginator;
    }



    /**
     * 新增记录
     * 返回：新记录对象，或 'exists' 字符串表示已存在，或 null 表示山脉不存在
     */
    public function add(array $data)
    {
        $mountain_id = $data['mountain_id'];
        $year = $data['year'];
        $month = $data['month'];
        $value = $data[$this->valueField]; // 使用动态字段名

        $mountain = MountainId::find($mountain_id);
        if (!$mountain) {
            return null;
        }

        $record = MonthlyStats::where('mountain_id', $mountain_id)
            ->where('year', $year)
            ->where('month', $month)
            ->first();

        if ($record) {
            if (is_null($record->{$this->valueField})) {
                $record->update([$this->valueField => $value]);
                $record->mountain_name = $mountain->name;
                unset($record->mountain_id, $record->{$this->hideField});
                return $record;
            }
            return 'exists';
        }

        $newRecord = MonthlyStats::create([
            'mountain_id' => $mountain_id,
            'year' => $year,
            'month' => $month,
            $this->valueField => $value,
        ]);

        $newRecord->mountain_name = $mountain->name;
        unset($newRecord->mountain_id, $newRecord->{$this->hideField});
        return $newRecord;
    }


    /**
     * 更新记录
     */
    public function update(int $id, $value)
    {
        $record = MonthlyStats::find($id);
        if (!$record || is_null($record->{$this->valueField})) {
            return null;
        }

        $record->update([$this->valueField => $value]);

        $mountain = MountainId::find($record->mountain_id);
        $record->mountain_name = $mountain?->name;
        unset($record->mountain_id, $record->{$this->hideField});

        return $record;
    }

    /**
     * 删除记录
     * - 只将 valueField 置空
     * - 如果 tourist_count 和 income 都为空，则删除整条记录
     */
    public function delete(int $id): bool|null
    {
        $record = MonthlyStats::find($id);
        if (!$record || is_null($record->{$this->valueField})) {
            return null;
        }

        $record->update([$this->valueField => null]);

        if (is_null($record->tourist_count) && is_null($record->income)) {
            $record->delete();
        }

        return true;
    }
}
