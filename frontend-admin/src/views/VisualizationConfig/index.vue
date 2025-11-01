<script setup>
import { reactive, ref, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { Picture, Plus } from '@element-plus/icons-vue'
import { storeToRefs } from 'pinia'
import { usePaginationStore } from '@/stores/pagination'
import runRequest from '@/utils/useRequestWrapper'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'
import {
  getVisualizationConfigList,
  updateVisualizationConfig,
  addVisualizationConfig,
  deleteVisualizationConfig,
} from '@/api/visualization-config'
import { searchMountainNameList } from '@/api/mountain'
import { searchFlylineChartsNameList } from '@/api/flyline'

// ========== 组件配置 ==========
defineOptions({
  name: 'VisualizationConfigManagement',
})

// ========== 状态管理 ==========
const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)

// 响应式数据
const currentPage = ref(page.value)
const visualizationList = ref({})
const isLoading = ref(true)
const searchData = ref({ visualization_name: '' })

// 弹窗控制
const showMountainsDialog = ref(false)
const addDialogVisible = ref(false)
const visualizationIndex = ref(0)

// 山脉数据
const mountainSearchSort = ref('')
const includedMountains = ref([])
const addIncludedMountains = ref([])
const mountainNameList = ref()

// 飞线图数据
const flylineNameList = ref([])
const isFlylineNameListLoading = ref(true)

// 图片相关
const imageUrl = ref('')

// ========== 表单定义 ==========
const addRuleFormRef = ref('')

const addRuleForm = reactive({
  name: '',
  flyline_chart_id: '',
  mountain_ids: [],
  year: +new Date().getFullYear(),
  background_image: '',
  config_json: {
    title: '',
    borderColor: ['rgba(255, 255, 255, 0)', 'rgba(255, 255, 255, 0)'],
    echartsAnimationTime: '',
  },
})

const addRules = reactive({
  name: [
    { required: true, message: '请输入配置名称', trigger: 'change' },
    { min: 2, max: 50, message: '名称长度在 2 到 50 个字符', trigger: 'blur' },
  ],
  year: [{ required: true, message: '请选择年份', trigger: 'blur' }],
  flyline_chart_id: [{ required: true, message: '请选择飞线图', trigger: 'blur' }],

  mountain_ids: [
    {
      required: true,
      message: '至少包含一个山脉',
      trigger: 'blue',
    },
    {
      validator: (rule, value, callback) => {
        const selectedCount = addIncludedMountains.value.filter((item) => item.checkbox).length
        if (selectedCount === 0) {
          callback(new Error('至少包含一个山脉'))
        } else {
          callback()
        }
      },
      trigger: 'change',
    },
  ],
  background_image: [
    {
      required: true,
      message: '请上传背景图片',
      trigger: 'change',
    },
    {
      validator: (rule, value, callback) => {
        if (!value) {
          callback('头像不可为空')
        } else if (!(value instanceof File)) callback(new Error('必须上传图片文件'))
        callback()
      },
      trigger: 'change',
    },
  ],
  config_json: [
    {
      required: true,
      message: '请上传额外配置项',
      trigger: 'change',
    },
    {
      validator: (rule, value, callback) => {
        if (!value.title) callback(new Error('配置项-标题不能为空'))
        if (!value.borderColor[0] || !value.borderColor[1])
          callback(new Error('配置项-颜色不能为空'))
        if (!value.echartsAnimationTime) callback(new Error('配置项-动画时间不能为空'))
        callback()
      },
      trigger: 'change',
    },
  ],
})

// ========== 数据初始化 ==========
// 搜索可视化配置
const handleSearch = async (pageNum = currentPage.value, pageSize = perPage.value) => {
  isLoading.value = true
  try {
    const res = await runRequest(() =>
      getVisualizationConfigList(searchData.value.visualization_name, pageNum, pageSize),
    )

    if (res) {
      visualizationList.value = res.data
      visualizationList.value.data = visualizationList.value.data.map((item) => {
        if (item.config_json && typeof item.config_json === 'string') {
          item.config_json = JSON.parse(item.config_json)
        }
        return item
      })
      currentPage.value = Number(res.data.current_page) || pageNum
    }
  } finally {
    isLoading.value = false
  }
}

// 初始化加载数据
handleSearch(page.value, perPage.value)

// ========== 监听器 ==========
// 为数据项添加属性
watch(
  () => visualizationList.value.data,
  (newList) => {
    if (!Array.isArray(newList)) return
    newList.forEach((item) => {
      if (item && typeof item === 'object' && !('editItem' in item)) {
        item.BGIFile = ''
        item.addMountain = ''
      }
    })
  },
  { deep: true, immediate: true },
)

// ========== API 函数 ==========
// 获取所有山脉名称用于选择山脉
const mountainName = async (query) => {
  const res = await runRequest(() => searchMountainNameList(query))
  if (!res) return
  return res.data
}
mountainNameList.value = mountainName()

// 鼠标聚焦触发
const flylineNameSelectFocus = async () => {
  const res = await runRequest(() => searchFlylineChartsNameList(''))
  if (!res) return
  isFlylineNameListLoading.value = false
  flylineNameList.value = res.data
}

// 修改select触发
const flylineNameSelectFilter = async (query) => {
  const res = await runRequest(() => searchFlylineChartsNameList(query))
  if (!res) return
  flylineNameList.value = res.data
}

// ========== 工具函数 ==========
// 排序函数，将选中的排序在前面
const mountainSort = (arr, keyword = '') => {
  let sortArr = []
  sortArr = arr.sort((a, b) => {
    // 1. 按 checkbox 分组：选中的在前，未选中的在后
    if (a.checkbox !== b.checkbox) {
      return b.checkbox - a.checkbox // true(1) - false(0) = 1，所以选中的在前
    }

    // 2. 在同一 checkbox 组内，按关键词匹配排序
    if (keyword) {
      const aHasKeyword = a.name.includes(keyword)
      const bHasKeyword = b.name.includes(keyword)

      // 有关键词的排前面
      if (aHasKeyword && !bHasKeyword) return -1
      if (!aHasKeyword && bHasKeyword) return 1
    }

    // 3. 如果 checkbox 和关键词状态都相同，保持原顺序
    return 0
  })

  return sortArr
}

// 格式化状态显示
const formatStatus = (status) => {
  return status === 1 ? '启用' : '禁用'
}

// ========== 弹窗控制函数 ==========
// 控制修改可视化山脉弹窗
const toggleMountainsDialog = async (
  bool = false,
  index = visualizationIndex.value,
  confirm = false,
) => {
  console.log(bool)
  showMountainsDialog.value = bool
  visualizationIndex.value = index
  mountainSearchSort.value = ''

  // 打开弹窗
  if (bool) {
    includedMountains.value = await mountainName('')
    if (includedMountains.value[0]) {
      includedMountains.value.forEach((item) => {
        item.checkbox = visualizationList.value.data[visualizationIndex.value].mountain_info.some(
          (it) => it.id === item.id,
        )
      })

      includedMountains.value = mountainSort(includedMountains.value)
    }
  }

  // 确认弹窗
  if (!bool) {
    if (confirm) {
      visualizationList.value.data[visualizationIndex.value].mountain_info =
        includedMountains.value.filter((item) => item.checkbox)
    }
    includedMountains.value = []
  }
}

// 新增弹窗控制
const handleAdd = async (bool) => {
  addDialogVisible.value = bool
  if (bool) {
    addIncludedMountains.value = []
    addIncludedMountains.value = await mountainName('')

    if (addIncludedMountains.value[0]) {
      addIncludedMountains.value.forEach((item) => {
        item.checkbox = false
      })
    }
  }
}

// ========== 文件处理函数 ==========
// 编辑的背景图处理
const updateBGIFile = (index) => {
  const event = window.event
  const target = event.target
  const files = target.files

  if (!files || files.length === 0) {
    console.log('未选择文件')
    return
  }

  const file = files[0]

  // 验证文件类型
  if (!file.type.startsWith('image/')) {
    ElMessage.error('请选择图片文件')
    return
  }

  // 验证文件大小（例如限制为 10MB）
  if (file.size > 10 * 1024 * 1024) {
    ElMessage.error('图片大小不能超过 10MB')
    return
  }
  visualizationList.value.data[index].BGIFile = file

  // 使用 FileReader 读取文件
  const reader = new FileReader()
  reader.onload = (e) => {
    const result = e.target?.result
    if (result) {
      // 更新行的 BGI 属性
      visualizationList.value.data[index].background_image = result
    }
  }

  reader.onerror = () => {
    ElMessage.error('图片读取失败')
  }

  reader.readAsDataURL(file) // 读取为 Data URL

  // 清空 input，允许重复选择同一文件
  target.value = ''
}

// 新增背景图片处理
const handleFileChange = (response) => {
  const isImage = response.raw.type.startsWith('image/')
  const isLt50M = response.size / 1024 / 1024 < 50

  if (!isImage) {
    ElMessage.error('请上传图片文件!')
    return
  }
  if (!isLt50M) {
    ElMessage.error('图片大小不能超过 10MB!')
    return
  }

  // 创建图片预览
  imageUrl.value = URL.createObjectURL(response.raw)
  // 上传的File文件
  addRuleForm.background_image = response.raw
}

// ========== 业务操作函数 ==========
// 新增"包含山脉"多选框排序控制
const addToggleMountainsDialog = () => {
  // 重新排序
  addIncludedMountains.value = mountainSort(addIncludedMountains.value)

  // 将选中的传回表单对象
  addRuleForm.mountain_ids = addIncludedMountains.value
    .filter((item) => item.checkbox)
    .map((item) => item.id)
}

// 新增可视化配置
const addVisualizationData = (formEl) => {
  formEl.validate(async (valid) => {
    // 验证表单
    if (!valid) return
    // 验证背景图片
    if (!(addRuleForm.background_image instanceof File)) return ElMessage.warning('未上传背景图片')
    // 验证山脉

    const formData = new FormData()
    for (const key in addRuleForm) {
      formData.append(key, addRuleForm[key])
      if (key === 'config_json' || key === 'mountain_ids') {
        formData.append(key, JSON.stringify(addRuleForm[key]))
      }
    }

    await addVisualizationConfig(formData)
    ElMessage.success('新增成功')

    handleAdd(false)
  })
}

// 编辑可视化配置
const updateVisualizationData = async (row, index) => {
  const data = visualizationList.value.data[index]

  const formData = new FormData()

  // 直接添加字段，让 Laravel 处理 JSON
  formData.append('name', data.name)
  formData.append('flyline_chart_id', data.flyline_chart?.id || data.flyline_chart_id)
  formData.append('mountain_ids', JSON.stringify(data.mountain_info.map((item) => item.id)))
  formData.append('year', data.year)
  formData.append('config_json', JSON.stringify(data.config_json))
  formData.append('is_active', data.is_active ? 1 : 0)

  // 添加图片
  if (data.BGIFile instanceof File) {
    formData.append('background_image', data.BGIFile)
  }

  await updateVisualizationConfig(row.id, formData)
  handleSearch()
  ElMessage.success('更新成功')
}

// 删除可视化配置
const deleteVisualizationData = async (data) => {
  await deleteVisualizationConfig(data.id)
  ElMessage.success('删除成功')
  // 删除后保持在当前页
  const currentPageNum = Number(visualizationList.value.current_page) || page.value
  await handleSearch(currentPageNum)
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
      @addData="() => addVisualizationData(addRuleFormRef)"
      @updateData="updateVisualizationData"
      @deleteData="deleteVisualizationData"
    >
      <template #toolbarRight>
        <el-input
          v-model="searchData.visualization_name"
          placeholder="请输入可视化配置名称"
          @keyup.enter="handleSearch(1)"
          class="data-table__search"
          clearable
        />
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
          min-width="150"
        >
          <template #default="{ row }">
            <el-date-picker
              v-if="row.editItem"
              :model-value="row.year?.toString()"
              @update:model-value="
                (val) => {
                  row.year = Number(val)
                }
              "
              :columns="5"
              :rows="5"
              type="year"
              placeholder="选择年份"
              value-format="YYYY"
              class="year"
            />
            <span v-else>
              {{ row.year }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="mountain_info"
          label="包含山脉"
          min-width="200"
        >
          <template #default="{ row, $index }">
            <span>{{ row.mountain_info.map((m) => m.name).join('、') }}</span>
            <el-button
              plain
              v-if="row.editItem"
              type="info"
              class="btn-update-mountain"
              @click="toggleMountainsDialog(true, $index)"
            >
              更新山脉
            </el-button>
          </template>
        </el-table-column>
        <el-table-column
          prop="flyline_chart_name"
          label="飞线图"
          min-width="200"
        >
          <template #default="{ row }">
            <el-select
              v-if="row.editItem"
              @focus="flylineNameSelectFocus"
              :filter-method="flylineNameSelectFilter"
              :model-value="row.flyline_chart.name"
              @update:model-value="(val) => (row.flyline_chart = val)"
              value-key="id"
              filterable
              placeholder="请选择飞线图"
            >
              <el-option
                v-for="item in flylineNameList"
                :key="item.id"
                :label="item.name"
                :value="item"
              />
            </el-select>
            <span v-else>{{ row.flyline_chart.name }}</span>
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
          <template #default="{ row, $index }">
            <label
              v-if="row.editItem"
              class="change-image-preview"
            >
              <input
                @change="updateBGIFile($index)"
                type="file"
                name="avatar"
                id=""
              />
              <img
                :src="row.background_image"
                alt=""
              />
            </label>

            <div
              class="image-preview"
              v-else
            >
              <el-image
                v-if="row.background_image"
                :src="row.background_image"
                :preview-src-list="[row.background_image]"
                fit="cover"
                :scale="0.8"
                class="background-image"
                :preview-teleported="true"
                hide-on-click-modal
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
          prop="config_title"
          label="配置项"
          min-width="300"
        >
          <template #default="{ row }">
            <ul class="config_item">
              <li>
                <div>标题：</div>
                <el-input
                  v-if="row.editItem"
                  v-model="row.config_json.title"
                  type="text"
                />
                <span v-else>{{ row.config_json.title }}</span>
              </li>
              <li>
                <div>颜色：</div>
                <div
                  class="color-input"
                  v-if="row.editItem"
                >
                  <el-color-picker
                    v-model="row.config_json.borderColor[0]"
                    show-alpha
                  />
                  <el-color-picker
                    v-model="row.config_json.borderColor[1]"
                    show-alpha
                  />
                </div>
                <div
                  class="color"
                  v-else
                >
                  <span :style="{ backgroundColor: row.config_json.borderColor[0] }"></span>
                  <span :style="{ backgroundColor: row.config_json.borderColor[1] }"></span>
                </div>
              </li>
              <li>
                <div>动画时间：</div>
                <el-input
                  v-if="row.editItem"
                  v-model="row.config_json.echartsAnimationTime"
                  type="text"
                />
                <span v-else>{{ row.config_json.echartsAnimationTime }}</span>
              </li>
            </ul>
          </template>
        </el-table-column>
      </template>
      <template #addDialog>
        <div class="add-dialog-placeholder">
          <el-form
            ref="addRuleFormRef"
            :model="addRuleForm"
            :rules="addRules"
            label-width="auto"
          >
            <el-form-item
              label="可视化名称"
              prop="name"
            >
              <el-input
                type="text"
                v-model="addRuleForm.name"
              ></el-input>
            </el-form-item>
            <el-form-item
              label="年份"
              prop="year"
            >
              <el-date-picker
                :model-value="addRuleForm.year?.toString()"
                @update:model-value="
                  (val) => {
                    addRuleForm.year = Number(val)
                  }
                "
                :columns="5"
                :rows="5"
                type="year"
                placeholder="选择年份"
                value-format="YYYY"
                class="year"
              />
            </el-form-item>
            <el-form-item
              label="飞线图"
              prop="flyline_chart_id"
            >
              <el-select
                @focus="flylineNameSelectFocus"
                :filter-method="flylineNameSelectFilter"
                v-model="addRuleForm.flyline_chart_id"
                value-key="id"
                filterable
                placeholder="请选择飞线图"
              >
                <el-option
                  v-for="item in flylineNameList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
              </el-select>
            </el-form-item>
            <el-form-item
              label="包含山脉"
              prop="mountain_ids"
              style="--el-form-item-valid-border-color: var(--el-border-color)"
            >
              <div class="mountain-ids">
                <form
                  action="javascript:;"
                  class="sort"
                  @submit="mountainSort(addIncludedMountains, mountainSearchSort)"
                >
                  <el-input
                    type="text"
                    v-model="mountainSearchSort"
                  />
                  <el-button type="info">排序</el-button>
                </form>
                <div
                  class="checkbox-group"
                  :class="{ 'checkbox-group-loading': !addIncludedMountains[0] }"
                  v-loading="!addIncludedMountains[0]"
                >
                  <el-checkbox
                    v-for="value in addIncludedMountains"
                    v-model="value.checkbox"
                    :label="value.name"
                    size="large"
                    :key="value.id"
                    @change="addToggleMountainsDialog(addIncludedMountains)"
                  />
                </div>
              </div>
            </el-form-item>
            <el-form-item
              label="背景图"
              prop="background_image"
            >
              <el-upload
                class="avatar-uploader"
                action="javascript:;"
                :auto-upload="false"
                :show-file-list="false"
                :on-change="handleFileChange"
                drag
              >
                <img
                  v-if="imageUrl"
                  :src="imageUrl"
                  class="avatar"
                />
                <el-icon
                  v-else
                  class="avatar-uploader-icon"
                >
                  <Plus />
                  <text>可拖动图片</text>
                </el-icon>
              </el-upload>
            </el-form-item>
            <el-form-item
              label="配置项"
              prop="config_json"
            >
              <ul class="config_item">
                <li>
                  <div>标题：</div>
                  <el-input
                    v-model="addRuleForm.config_json.title"
                    type="text"
                  />
                </li>
                <li>
                  <div>颜色：</div>
                  <div class="color-input">
                    <el-color-picker
                      v-model="addRuleForm.config_json.borderColor[0]"
                      show-alpha
                    />
                    <el-color-picker
                      v-model="addRuleForm.config_json.borderColor[1]"
                      show-alpha
                    />
                  </div>
                </li>
                <li>
                  <div>动画时间：</div>
                  <el-input
                    v-model="addRuleForm.config_json.echartsAnimationTime"
                    type="text"
                  />
                </li>
              </ul>
            </el-form-item>
          </el-form>
        </div>
      </template>
    </LayoutDataTableWrapper>

    <!-- 新增"包含山脉"选项弹出框 -->
    <el-dialog
      v-model="showMountainsDialog"
      title="更改可视化山脉"
      width="500"
      :before-close="() => toggleMountainsDialog(false)"
      class="mountain-dialog"
      append-to-body
    >
      <!-- 使用默认插槽的 template -->
      <template #default>
        <form
          action="javascript:;"
          class="sort"
          @submit="mountainSort(includedMountains, mountainSearchSort)"
        >
          <el-input
            type="text"
            v-model="mountainSearchSort"
          />
          <el-button type="info">排序</el-button>
        </form>
        <div
          class="checkbox-group"
          :class="{ 'checkbox-group-loading': !includedMountains[0] }"
          v-loading="!includedMountains[0]"
        >
          <el-checkbox
            v-for="value in includedMountains"
            v-model="value.checkbox"
            :label="value.name"
            size="large"
            :key="value.id"
            @change="mountainSort(includedMountains)"
          />
        </div>
      </template>

      <template #footer>
        <div class="dialog-footer">
          <el-button
            type="info"
            @click="toggleMountainsDialog(false)"
          >
            取消
          </el-button>
          <el-button
            type="primary"
            @click="toggleMountainsDialog(false, visualizationIndex, true)"
          >
            确认
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.visualization-config-management {
  // 年份
  .year {
    width: 100%;
  }

  // 更新山脉确认按钮
  .btn-update-mountain {
    margin-top: 10px;
    display: block;
    .el-icon {
      margin-right: 10px;
    }
  }

  //背景图片
  .image-preview {
    display: flex;
    justify-content: start;
    align-items: center;

    .background-image {
      width: 60px;
      height: 40px;
      border-radius: $border-radius-sm;
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

  // 切换背景图片
  .change-image-preview {
    display: block;
    position: relative;
    margin-right: 30px;
    width: 60px;
    height: 40px;
    aspect-ratio: 1;
    border: 3px dotted var(--primary-color);
    border-radius: $border-radius-md;
    cursor: pointer;
    overflow: hidden;

    input {
      display: none;
    }

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .el-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) scale(1.5);
      opacity: 0.5;

      svg {
        stroke: var(--primary-color);

        * {
          stroke: var(--primary-color);
          fill: var(--primary-color);
        }
      }
    }
  }

  // 配置项
  .config_item {
    max-height: 150px;
    overflow-y: auto;
    li {
      margin-bottom: 10px;
      display: flex;
      justify-content: start;
      align-items: center;

      .el-input {
        width: inherit;
        height: 30px;
        min-width: inherit;
      }

      .color-input {
        .el-input {
          width: 25px;
          height: 25px;
          min-width: inherit;
        }
      }

      .color {
        display: flex;
        align-items: center;
        justify-content: start;
        span {
          margin-right: 10px;
          width: 25px;
          height: 25px;
          border-radius: $border-radius-sm;
        }
      }

      div {
        flex-shrink: 0;
        font-weight: 700;
      }
    }
  }

  // 是否激活
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
}

// 新增弹窗
.add-dialog-placeholder {
  padding: 20px;

  // 包含山脉
  .mountain-ids {
    padding: 10px;
    border: 1px solid var(--border-color);
    border-radius: $border-radius-sm;
    form.sort {
      margin-bottom: 10px;
      display: flex;
      justify-content: start;
      align-items: center;
      width: 100%;
      :deep(.el-input) {
        margin-right: 10px;
        width: 50% !important;
        height: 32px !important;
      }
    }
    :deep(.el-input__wrapper) {
      box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
      &:hover {
        box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
      }
      &.is-focus {
        box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
      }
    }
    .checkbox-group {
      max-height: 200px;
      overflow: auto;
    }
    .checkbox-group-loading {
      height: 50px;
    }
  }

  :deep(.avatar-uploader) {
    width: 100%;
    min-height: 200px;
    &:has(img) {
      width: initial;
    }
    display: block;

    .el-upload.el-upload--text {
      width: 100%;
      height: 100%;
      .el-icon {
        width: 100%;
        height: 100%;
        font-size: 30px;
        text {
          margin-top: 20px;
          font-size: 16px;
        }
      }
      .el-upload-dragger {
        padding: 0;
        display: block;
        height: 200px;
      }
    }

    .avatar-uploader-icon {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .avatar {
      height: 200px;
    }
  }

  .config_item {
    width: 100%;
    overflow-y: auto;
    li {
      margin-bottom: 10px;
      display: flex;
      justify-content: start;
      align-items: center;
      :deep(.el-input__wrapper) {
        box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
        &:hover {
          box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
        }
        &.is-focus {
          box-shadow: 0 0 0 1px var(--el-input-border-color, var(--el-border-color)) inset;
        }
      }
      .el-input {
        width: 300px !important;
        height: 30px !important;
        min-width: inherit;
      }

      .color-input {
        .el-input {
          width: 25px;
          height: 25px;
          min-width: inherit;
        }
      }

      .color {
        display: flex;
        align-items: center;
        justify-content: start;
        span {
          margin-right: 10px;
          width: 25px;
          height: 25px;
          border-radius: $border-radius-sm;
        }
      }

      div {
        flex-shrink: 0;
      }
    }
  }
}
</style>

<style lang="scss">
// 包含山脉弹出框
.mountain-dialog {
  .el-dialog__body {
    form.sort {
      margin-bottom: 10px;
      display: flex;
      width: 100%;
      .el-input {
        margin-right: 10px;
        width: 50%;
      }
    }
  }
  .checkbox-group {
    max-height: 50vh;
    overflow: auto;
  }
  .checkbox-group-loading {
    height: 50px;
  }
}

// .avatar-uploader .el-upload {
//   border: 1px dashed var(--el-border-color);
//   border-radius: 6px;
//   cursor: pointer;
//   position: relative;
//   overflow: hidden;
//   transition: var(--el-transition-duration-fast);
// }

// .avatar-uploader .el-upload:hover {
//   border-color: var(--el-color-primary);
// }

// .el-icon.avatar-uploader-icon {
//   font-size: 28px;
//   color: #8c939d;
//   width: 178px;
//   height: 178px;
//   text-align: center;
// }
</style>
