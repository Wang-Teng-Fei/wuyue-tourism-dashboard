<script setup>
import { ref, watch, toRefs } from 'vue'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'

defineOptions({
  name: 'LayoutDataTableWrapper',
})

// 定义组件 props
const props = defineProps({
  dataList: {
    type: Object,
    default: () => ({}),
  },
  addDialogVisible: {
    type: Boolean,
    default: false,
  },
  isLoading: {
    type: Boolean,
    default: false,
  },
  addDataDialogTitle: {
    type: String,
    default: '',
  },
})

// 定义组件可以触发的事件
const emit = defineEmits(['handleAdd', 'getDataListData', 'addData', 'updateData', 'deleteData'])

const { dataList, addDialogVisible, isLoading, addDataDialogTitle } = toRefs(props)
// 在现有变量后面添加
const originalDataMap = ref(new Map())
const { page, perPage } = storeToRefs(usePaginationStore())

// 加载动画 SVG
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

// 动态行类名，用于添加动画
const rowClassName = ({ rowIndex }) => {
  return `row-animate row-animate-${rowIndex}`
}

// 获取数据列表
const getDataListData = async (pageNum = page.value) => {
  emit('getDataListData', pageNum)
}

// 为数据项添加 editItem 属性
watch(
  () => dataList.value.data,
  (newList) => {
    if (!Array.isArray(newList)) return
    newList.forEach((item) => {
      if (item && typeof item === 'object' && !('editItem' in item)) {
        item.editItem = false
      }
    })
  },
  { deep: true, immediate: true },
)

// 开启或关闭弹窗
const handleAdd = (bool) => {
  emit('handleAdd', bool)
}

// 新增数据
const addData = () => {
  emit('addData')
}

// 添加取消编辑方法
const cancelEdit = (data) => {
  const originalData = originalDataMap.value.get(data.id)
  if (originalData) {
    // 恢复原始数据
    Object.assign(data, originalData)
    originalDataMap.value.delete(data.id)
  }
  data.editItem = false
}

// 编辑按钮点击事件
const handleEditClick = (data) => {
  // 进入编辑模式时备份数据
  originalDataMap.value.set(data.id, JSON.parse(JSON.stringify({ ...data })))
  data.editItem = true
}

// 编辑数据 - 添加成功回调参数
const updateData = async (data, index) => {
  emit('updateData', data, index, () => {
    // 成功回调：清除备份
    originalDataMap.value.delete(data.id)
  })
}

// 删除数据
const deleteData = async (data) => {
  emit('deleteData', data)
}

defineExpose({
  getDataListData,
  handleAdd,
  addData,
  cancelEdit,
  handleEditClick,
  updateData,
  deleteData,
  originalDataMap, // 暴露备份映射，方便父组件操作
})
</script>

<template>
  <div class="data-table">
    <div class="data-table__toolbar">
      <div class="toolbar-left">
        <slot name="toolbarLeft"></slot>
      </div>
      <div class="toolbar-right">
        <slot name="toolbarRight"></slot>
        <el-button
          type="success"
          class="data-table__btn"
          @click="handleAdd(true)"
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
        v-if="!isLoading && dataList?.data?.length"
        :data="dataList.data"
        max-height="400px"
        :row-class-name="rowClassName"
        :row-key="(row) => row.id"
      >
        <el-table-column
          fixed="left"
          prop="id"
          label="ID"
          width="150"
        >
          <template #default="{ $index }">
            <span>{{ (page - 1) * perPage + $index + 1 }}</span>
          </template>
        </el-table-column>
        <slot></slot>
        <slot name="operation">
          <el-table-column
            fixed="right"
            width="200"
            prop="operation"
            class="column-operation"
            label="操作"
          >
            <template #default="{ row, $index }">
              <div
                v-if="row.editItem"
                class="column-operation"
              >
                <el-button
                  type="success"
                  @click="updateData(row, $index)"
                  plain
                >
                  确定
                </el-button>
                <el-button
                  type="info"
                  @click="cancelEdit(row)"
                  plain
                >
                  取消
                </el-button>
              </div>
              <div
                v-else
                class="column-operation"
              >
                <el-button
                  type="primary"
                  plain
                  @click="handleEditClick(row)"
                >
                  编辑
                </el-button>
                <el-button
                  type="danger"
                  plain
                  @click="deleteData(row)"
                >
                  删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </slot>
      </el-table>

      <div
        v-if="!isLoading && dataList?.data?.length <= 0"
        class="empty-state"
      >
        暂无数据
      </div>
    </div>

    <div
      class="data-table__pagination"
      v-if="dataList?.per_page"
    >
      <el-pagination
        background
        layout="prev, pager, next"
        :total="dataList?.total"
        :page-size="dataList?.per_page"
        :current-page="dataList?.current_page"
        @current-change="getDataListData"
      />
    </div>

    <el-dialog
      class="add_dialog"
      append-to-body
      @close="handleAdd(false)"
      v-model="addDialogVisible"
      :title="addDataDialogTitle || '新增数据'"
    >
      <template #default>
        <slot name="addDialog"></slot>
      </template>
      <template #footer>
        <el-button
          type="info"
          @click="handleAdd(false)"
        >
          取消
        </el-button>
        <el-button
          type="primary"
          @click="addData"
        >
          确定
        </el-button>
      </template>
    </el-dialog>
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

    .data-table__filter {
      width: 180px;
    }

    :deep(.el-input),
    :deep(.el-select) {
      width: 200px;
      height: 35px;

      .el-select__wrapper {
        height: 100%;
      }
    }
  }

  .toolbar-right {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 8px;

    :deep(.el-input),
    :deep(.el-select) {
      margin-right: 5px;
      width: 220px;
      height: 35px;
      .el-select__wrapper {
        height: 100%;
      }
    }

    .data-table__search {
      margin: 0 20px;
      width: 200px;

      &:focus-within {
        border-radius: var(--el-input-border-radius);
      }
    }

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
  position: relative;
  width: 100%;
  min-height: 200px;
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

      .cell {
        font-size: $font-size-xl;
      }
    }

    .cell {
      font-size: $font-size-base;
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

    .el-input {
      width: 100%;
      min-width: 100px;
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
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
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

:deep(.row-animate) {
  opacity: 0;
  transform: translateY(20px);
  animation: rowFadeIn 1s ease forwards;
}

@for $i from 0 through 20 {
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
</style>

<style lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.add_dialog {
  max-width: 500px;
  border-radius: $border-radius-md;

  .el-dialog__header {
    display: block;
    height: 50px;

    .el-dialog__title {
      display: block;
      text-align: center;
      font-size: $h4-size;
    }
  }

  .el-dialog__body {
    padding: 10px;
    max-height: calc(70dvh - 100px);
    overflow-y: scroll;

    &::-webkit-scrollbar {
      width: 5px;
      background-color: var(--card-bg-color-inner);
    }

    &::-webkit-scrollbar-thumb {
      background-color: var(--border-color);
      border-radius: 100px;
    }

    &::-webkit-scrollbar-track {
      background-color: var(--card-bg-color-inner);
      border-radius: 100px;
    }

    .el-form-item {
      margin-bottom: 20px;
      display: block;

      .el-form-item__label {
        font-size: $font-size-lg !important;
        margin-bottom: 5px !important;
      }

      .el-form-item__label-wrap,
      .el-select,
      .el-select__wrapper {
        width: 100% !important;
        height: 100% !important;
        margin-left: 0 !important;
        font-size: $font-size-lg !important;
        text-align: start;
      }

      .el-select,
      .el-input {
        width: 100% !important;
        height: 40px !important;
      }

      .el-form-item__error {
        display: block;
        width: 100%;
        margin-top: 10px;
        text-align: end;
      }
    }
  }

  .el-dialog__footer {
    padding: 10px;

    .el-button {
      margin-left: 30px;
    }
  }
}

.custom-year-panel .el-year-table {
  display: grid !important;
  grid-template-columns: repeat(4, 1fr) !important;
  grid-gap: 4px;
}

.example-showcase .el-loading-mask {
  z-index: 9;
}
</style>
