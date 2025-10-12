<script setup lang="ts">
import { reactive, ref } from 'vue'
import { getVisualizationConfigList } from '@/api/visualization-config'
import { ElMessage } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'
import { Picture } from '@element-plus/icons-vue'

defineOptions({
  name: 'VisualizationConfigManagement',
})

// 山脉信息接口
interface MountainInfo {
  id: number
  name: string
  province: string
}

// 可视化配置项接口
interface VisualizationConfigItem {
  id: number
  name: string
  year: number
  background_image: string
  config_json: string
  is_active: number
  created_at: string
  updated_at: string
  mountain_info: MountainInfo[]
  flyline_chart_name: string
  editItem?: boolean
}

// 列表数据结构
interface VisualizationListObj {
  data: VisualizationConfigItem[]
  current_page?: number | string
  total?: number | string
  per_page?: number | string
  last_page?: number | string
}

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value)

const visualizationList = ref<VisualizationListObj>({
  data: [],
})
const isLoading = ref(true)
const addDialogVisible = ref(false)

// 搜索条件
const searchData = ref({
  visualization_name: '',
})

// 搜索可视化配置
const handleSearch = async (pageNum = currentPage.value, pageSize = perPage.value) => {
  isLoading.value = true
  try {
    const res = await runRequest(() =>
      getVisualizationConfigList(searchData.value.visualization_name, pageNum, pageSize),
    )

    if (res) {
      visualizationList.value = res.data
      currentPage.value = Number(res.data.current_page) || pageNum
    }
  } finally {
    isLoading.value = false
  }
}

// 初始化加载数据
handleSearch(page.value, perPage.value)

// 新增弹窗控制
const handleAdd = (bool: boolean) => {
  addDialogVisible.value = bool
}

// 假接口 - 新增可视化配置
const addVisualizationData = async () => {
  ElMessage.info('新增功能待实现')
  handleAdd(false)
}

// 假接口 - 编辑可视化配置
const updateVisualizationData = async (row: { data: VisualizationConfigItem; index: number }) => {
  ElMessage.success('更新成功（演示）')
  visualizationList.value.data[row.index].editItem = false
}

// 假接口 - 删除可视化配置
const deleteVisualizationData = async (data: VisualizationConfigItem) => {
  ElMessage.success('删除成功（演示）')
  // 删除后保持在当前页
  const currentPageNum = Number(visualizationList.value.current_page) || page.value
  await handleSearch(currentPageNum)
}

// 格式化状态显示
const formatStatus = (status: number) => {
  return status === 1 ? '启用' : '禁用'
}

// 格式化山脉信息显示
const formatMountains = (mountains: MountainInfo[]) => {
  return mountains.map((m) => m.name).join('、')
}

// 解析配置JSON
const parseConfigJson = (configJson: string) => {
  try {
    return JSON.parse(configJson)
  } catch {
    return {}
  }
}

// 获取配置标题
const getConfigTitle = (configJson: string) => {
  const config = parseConfigJson(configJson)
  return config.title || '无标题'
}
</script>

<template>
  <div class="visualization-config-management">
    <LayoutDataTableWrapper
      :dataList="visualizationList"
      :addDialogVisible="addDialogVisible"
      :isLoading="isLoading"
      addDataDialogTitle="新增可视化配置"
      @handleAdd="handleAdd"
      @getDataListData="handleSearch"
      @addData="addVisualizationData"
      @updateData="updateVisualizationData"
      @deleteData="deleteVisualizationData"
    >
      <template #toolbarLeft>
        <el-input
          v-model="searchData.visualization_name"
          placeholder="请输入可视化配置名称"
          @keyup.enter="handleSearch(1)"
          class="data-table__search"
          clearable
          style="width: 300px"
        />
      </template>
      <template #toolbarRight>
        <el-button
          type="primary"
          class="data-table__btn"
          @click="handleSearch(1)"
        >
          查询
        </el-button>
      </template>
      <template #default>
        <el-table-column
          prop="name"
          label="配置名称"
          min-width="200"
        >
          <template #default="{ row }">
            <el-input
              v-if="row.editItem"
              v-model="row.name"
              placeholder="配置名称"
            />
            <span v-else>
              {{ row.name }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="year"
          label="年份"
          min-width="100"
        >
          <template #default="{ row }">
            <el-input
              v-if="row.editItem"
              v-model="row.year"
              placeholder="年份"
              type="number"
            />
            <span v-else>
              {{ row.year }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="config_title"
          label="配置标题"
          min-width="180"
        >
          <template #default="{ row }">
            <span>{{ getConfigTitle(row.config_json) }}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="mountain_info"
          label="包含山脉"
          min-width="200"
        >
          <template #default="{ row }">
            <span>{{ formatMountains(row.mountain_info) }}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="flyline_chart_name"
          label="飞线图"
          min-width="150"
        >
          <template #default="{ row }">
            <span>{{ row.flyline_chart_name }}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="is_active"
          label="状态"
          min-width="100"
        >
          <template #default="{ row }">
            <el-switch
              v-if="row.editItem"
              v-model="row.is_active"
              inline-prompt
              active-text="启用"
              inactive-text="禁用"
              :active-value="1"
              :inactive-value="0"
              class="ml-2"
              style="--el-switch-on-color: #13ce66; --el-switch-off-color: #ff4949"
            />
            <span
              v-else
              class="custom-tag"
              :class="row.is_active === 1 ? 'custom-success' : 'custom-danger'"
            >
              {{ formatStatus(row.is_active) }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="background_image"
          label="背景图片"
          min-width="120"
        >
          <template #default="{ row }">
            <div class="image-preview">
              <el-image
                v-if="row.background_image"
                :src="row.background_image"
                :preview-src-list="[row.background_image]"
                fit="cover"
                class="background-image"
              >
                <template #error>
                  <div class="image-slot">
                    <el-icon><Picture /></el-icon>
                  </div>
                </template>
              </el-image>
              <div
                v-else
                class="no-image"
              >
                无图片
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column
          prop="created_at"
          label="创建时间"
          min-width="180"
        >
          <template #default="{ row }">
            <span>{{ new Date(row.created_at).toLocaleString() }}</span>
          </template>
        </el-table-column>
      </template>
      <template #addDialog>
        <div class="add-dialog-placeholder">
          <el-alert
            title="新增功能待实现"
            type="info"
            description="这是一个演示页面，新增功能将在后续版本中实现"
            show-icon
            :closable="false"
          />
        </div>
      </template>
    </LayoutDataTableWrapper>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.visualization-config-management {
  .data-table__search {
    width: 300px;
  }

  .image-preview {
    display: flex;
    justify-content: center;
    align-items: center;

    .background-image {
      width: 60px;
      height: 40px;
      border-radius: 4px;
      cursor: pointer;
      border: 1px solid var(--border-color);
    }

    .image-slot {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100%;
      background: var(--bg-color-subtle);
      color: var(--text-color-secondary);
      font-size: 20px;
    }

    .no-image {
      color: var(--text-color-secondary);
      font-size: 12px;
    }
  }

  .custom-tag {
    display: inline-block;
    padding: 0 8px;
    height: 24px;
    line-height: 22px;
    font-size: 12px;
    border-radius: 4px;
    box-sizing: border-box;
    border: 1px solid;
    white-space: nowrap;
    transition: none;
  }

  .custom-success {
    color: var(--el-color-success);
    background-color: var(--el-color-success-light-9);
    border-color: var(--el-color-success-light-8);
  }

  .custom-danger {
    color: var(--el-color-danger);
    background-color: var(--el-color-danger-light-9);
    border-color: var(--el-color-danger-light-8);
  }

  .add-dialog-placeholder {
    padding: 20px;
  }
}
</style>
