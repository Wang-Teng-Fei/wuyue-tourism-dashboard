<script setup lang="ts">
import { ref } from 'vue'
import { getFlylineChartsList } from '@/api/flyline'
import { ElMessage } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'

defineOptions({
  name: 'FlylineComponent',
})

// loading
const svg = `
        <path class="path" d="
          M 30 15
          L 28 17
          M 25.61 25.61
          A 15 15, 0, 0, 1, 15 30
          A 15 15, 0, 1, 1, 27.99 7.5
          L 15 15
        " style="stroke-width: 4px; fill: rgba(0, 0, 0, 0)"/>
      `

const searchQuery = ref('')
const filterStatus = ref('')
const handleSearch = ref(() => {}) // 占位，需实现具体逻辑
const handleAdd = ref(() => {}) // 占位，需实现具体逻辑

const flylineKey = ref([
  { field: 'id', name: 'ID' },
  { field: 'name', name: '名字' },
  { field: 'description', name: '描述' },
  { field: 'main_image', name: '主图' },
  { field: 'sub_image', name: '附图' },
  { field: 'sub_image', name: '附图' },
  { field: 'point_image_path', name: '普通点位' },
  { field: 'extra_config', name: '额外配置' },
])
const flylineList = ref([])
const isLoading = ref(true) // 加载状态

const getFlylineList = async () => {
  try {
    isLoading.value = true // 开始加载
    const res = await runRequest(() => getFlylineChartsList())
    if (!res) return
    flylineList.value = res.data.data
  } catch (error) {
    ElMessage.error('获取数据失败，请稍后重试')
    console.error('获取飞线图数据失败:', error)
  } finally {
    isLoading.value = false // 加载完成
  }
}
getFlylineList()

// 动态行类名，用于添加动画
const rowClassName = ({ rowIndex }: { rowIndex: number }) => {
  return `row-animate row-animate-${rowIndex}`
}
</script>

<template>
  <div class="data-table">
    <div class="data-table__toolbar">
      <div class="toolbar-left">
        <el-input
          v-model="searchQuery"
          placeholder="请输入关键字搜索"
          class="data-table__search"
          clearable
        />
        <el-select
          v-model="filterStatus"
          placeholder="状态"
          class="data-table__filter"
        >
          <el-option
            label="全部"
            value=""
          />
          <el-option
            label="启用"
            value="1"
          />
          <el-option
            label="禁用"
            value="0"
          />
        </el-select>
      </div>

      <div class="toolbar-right">
        <el-button
          type="primary"
          class="data-table__btn"
          @click="handleSearch"
        >
          查询
        </el-button>
        <el-button
          type="success"
          class="data-table__btn"
          @click="handleAdd"
        >
          新增
        </el-button>
      </div>
    </div>

    <div
      class="data-table__wrapper"
      element-loading-text="Loading..."
      :element-loading-spinner="svg"
      element-loading-svg-view-box="-10, -10, 50, 50"
      v-loading="isLoading"
    >
      <el-table
        v-if="!isLoading && flylineList.length"
        :data="flylineList"
        max-height="400px"
        :row-class-name="rowClassName"
        :row-key="(row: { id: string }) => row.id"
      >
        <el-table-column
          prop="id"
          label="ID"
        />
        <el-table-column
          prop="name"
          label="名字"
        />
        <el-table-column
          prop="description"
          label="描述"
        />
        <el-table-column
          prop="main_image"
          label="主图"
        >
          <template #default="{ row }">
            <span v-show="!row.main_image">无</span>
            <img
              v-show="row.main_image"
              :src="row.main_image"
              alt=""
            />
          </template>
        </el-table-column>
        <el-table-column
          prop="sub_image"
          label="附图"
        >
          <template #default="{ row }">
            <span v-show="!row.sub_image">无</span>
            <img
              v-show="row.sub_image"
              :src="row.sub_image"
              alt=""
            />
          </template>
        </el-table-column>
        <el-table-column
          prop="point_image_path"
          label="普通点位"
        >
          <template #default="{ row }">
            <div class="point_img">
              <span v-show="!row.point_image_path">无</span>
              <img
                v-show="row.point_image_path"
                :src="row.point_image_path"
                alt=""
              />
            </div>
          </template>
        </el-table-column>
        <el-table-column
          prop="extra_config"
          label="额外配置"
        />
        <el-table-column
          prop="operation"
          class="column-operation"
          label="操作"
        >
          <template #default="{ row }">
            <div class="column-operation">
              <el-button
                type="primary"
                plain
              >
                编辑
              </el-button>
              <el-button
                type="danger"
                plain
              >
                删除
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
      <div
        v-if="!isLoading && !flylineList.length"
        class="empty-state"
      >
        暂无数据
      </div>
    </div>

    <div
      class="data-table__pagination"
      v-if="false"
    >
      <el-pagination
        background
        layout="prev, pager, next"
        :total="1000"
      />
    </div>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.data-table__toolbar {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
  gap: 12px;
  flex-wrap: wrap;
  padding: 12px 16px;
  background: var(--card-bg-color);
  border-radius: 8px;
  border: 1px solid var(--border-color);
  box-shadow: 0 1px 3px var(--shadow-color);

  .toolbar-left {
    display: flex;
    align-items: center;
    gap: 10px;
    flex-wrap: wrap;

    .data-table__search {
      width: 220px;
      transition: all 0.2s ease;

      &:focus-within {
        border-radius: var(--el-input-border-radius);
      }
    }

    .data-table__filter {
      width: 180px;
    }
  }

  .toolbar-right {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 8px;

    .data-table__btn {
      border-radius: 6px;
      font-weight: 500;
      transition: all 0.2s ease;

      &:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 8px var(--shadow-color);
      }
    }
  }
}

.data-table__wrapper {
  width: 100%;
  min-height: 400px;
  /* 防止高度跳动 */
  position: relative;
  padding: 10px;
  overflow: hidden;
  border-radius: $border-radius-md;
  background-color: var(--card-bg-color);
  box-shadow: 0 0 5px var(--shadow-color);

  :deep(.el-table--fit) {
    overflow: hidden;
    box-sizing: border-box;
    background-color: var(--card-bg-color);

    .el-table__header {
      height: 60px;
      font-size: $font-size-xl;
    }

    .column-operation {
      display: flex;
      justify-content: start;
      align-items: center;
      align-content: center;

      flex-wrap: wrap;

      button {
        margin: 5px 20px;
        margin-left: 0px;

        &:last-child {
          margin-right: 0px;
        }
      }
    }

    img {
      max-height: 60px;
    }

    .point_img img {
      max-height: 30px;
    }
  }
}

.empty-state {
  text-align: center;
  padding: 20px;
  color: var(--text-color-secondary);
  font-size: $font-size-lg;
}

.data-table__pagination {
  margin-top: 20px;
  display: flex;
  justify-content: end;
}

/* 逐行浮动动画 */
:deep(.row-animate) {
  opacity: 0;
  transform: translateY(20px);
  animation: rowFadeIn 1s ease forwards;
}

@for $i from 0 through 20 {
  /* 支持最多20行，必要时可增加 */
  :deep(.row-animate-#{$i}) {
    animation-delay: #{$i * 0.1}s;
  }
}

@keyframes rowFadeIn {
  0% {
    opacity: 0;
    transform: translateY(100%);
  }

  30% {
    opacity: 0;
    transform: translateY(100%);
  }

  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

// loading
.example-showcase .el-loading-mask {
  z-index: 9;
}
</style>
