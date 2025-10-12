<script setup lang="ts">
import { reactive, ref } from 'vue'
import { searchMountainNameList } from '@/api/mountain'
import {
  getMountainHeightList,
  addMountainHeight,
  updateMountainHeight,
  deleteMountainHeight,
} from '@/api/mountain-height'
import { ElMessage, type FormInstance, type FormRules } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'
import type { MountainData } from '@/types/mountain'

defineOptions({
  name: 'MountainHeight',
})

interface MountainHeightDataObj {
  id: number
  year?: number
  height?: string | number
  mountain?: MountainData
  created_at?: string
  updated_at?: string
  editItem?: boolean
}

interface MountainHeightListObj {
  data: MountainHeightDataObj[]
  current_page?: number | string
  total?: number | string
  per_page?: number | string
  last_page?: number | string
}

interface AddRuleForm {
  mountain_id: number | string
  year: string
  height: number
}

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value) // 记录当前页码

const mountainHeightList = ref<MountainHeightListObj>({
  data: [],
})
const isLoading = ref(true)
const addDialogVisible = ref(false)

const searchData = ref({
  year: '',
  mountain_name: '',
})

// 搜索
const handleSearch = async (pageNum = currentPage.value, pageSize = perPage.value) => {
  isLoading.value = true
  try {
    const res = await runRequest(() =>
      getMountainHeightList(
        searchData.value.mountain_name,
        +searchData.value.year,
        pageNum,
        pageSize,
      ),
    )
    if (res) {
      mountainHeightList.value = res.data
      currentPage.value = Number(res.data.current_page) || pageNum
    }
  } finally {
    isLoading.value = false
  }
}

handleSearch()

// 新增表单验证
const addRuleFormRef = ref<FormInstance>()
const addRuleForm = reactive<AddRuleForm>({
  year: String(new Date().getFullYear()),
  height: 0,
  mountain_id: '',
})

const addRules = reactive<FormRules<AddRuleForm>>({
  year: [
    {
      required: true,
      message: '年份不可为空',
      trigger: 'blur',
    },
  ],
  height: [
    {
      required: true,
      message: '山脉高度不可为空',
      trigger: 'blur',
    },
    {
      type: 'number',
      min: 0,
      message: '山脉高度必须大于0',
      trigger: 'blur',
    },
  ],
  mountain_id: [
    {
      required: true,
      message: '山脉不可为空',
      trigger: 'blur',
    },
  ],
})

const handleAdd = (bool: boolean) => {
  Object.assign(addRuleForm, {
    mountain_id: '',
    year: String(new Date().getFullYear()),
    height: 0,
  })
  addDialogVisible.value = bool
}

// 山脉名称选择器
const mountainNameList = ref<
  {
    id: number
    name: string
    preview: string
  }[]
>([])
const mountainNameSelectFocus = async () => {
  console.log('focus事件触发 - 加载所有数据')
  const res = await runRequest(() => searchMountainNameList(''))
  if (!res) return
  mountainNameList.value = res.data
}

// filter-method 事件 - 实时搜索
const mountainNameSelectFilter = async (query: string) => {
  console.log('filter-method事件触发 - 搜索:', query)
  const res = await runRequest(() => searchMountainNameList(query))
  if (!res) return
  mountainNameList.value = res.data
}

// 格式化高度显示，保留两位小数
const formatHeight = (height: string | number) => {
  if (!height && height !== 0) return '0.00'
  return parseFloat(height.toString()).toFixed(2)
}

// 新增
const addMountainHeightData = async (addFormEl: FormInstance | undefined) => {
  if (!addFormEl) return
  await addFormEl.validate(async (valid) => {
    if (valid) {
      isLoading.value = true
      const res = await runRequest(() => addMountainHeight(addRuleForm))
      if (res) {
        // 设置搜索年份为新增数据的年份
        searchData.value.year = addRuleForm.year

        // 直接重新获取第一页数据来更新分页信息
        await handleSearch(1)

        // 使用更新后的分页信息跳转到最后一页
        const lastPage = Number(mountainHeightList.value.last_page) || 1
        await handleSearch(lastPage)

        ElMessage.success('新增山脉高度成功')
        handleAdd(false)
      }
    }
  })
}

// 编辑
const updateMountainHeightData = async (data: MountainHeightDataObj) => {
  await runRequest(() =>
    updateMountainHeight(data.id, {
      year: data.year,
      height: data.height,
      mountain_id: data?.mountain?.id,
    }),
  )
  mountainHeightList.value.data.forEach((item) => {
    if (item.id === data.id) {
      // 格式化高度显示
      if (item.height) {
        item.height = formatHeight(item.height)
      }
      item.editItem = false
    }
  })
  ElMessage.success('更新山脉高度成功')
}

// 删除
const deleteMountainHeightData = async (data: MountainHeightDataObj) => {
  await runRequest(() => deleteMountainHeight(data.id))

  // 删除后保持在当前页
  const currentPageNum = Number(mountainHeightList.value.current_page) || page.value
  await handleSearch(currentPageNum)

  ElMessage.success('删除山脉高度成功')
}
</script>

<template>
  <LayoutDataTableWrapper
    :dataList="mountainHeightList"
    :addDialogVisible="addDialogVisible"
    :isLoading="isLoading"
    addDataDialogTitle="新增山脉高度数据"
    @handleAdd="handleAdd"
    @getDataListData="handleSearch"
    @addData="() => addMountainHeightData(addRuleFormRef)"
    @updateData="updateMountainHeightData"
    @deleteData="deleteMountainHeightData"
  >
    <template #toolbarLeft>
      <el-date-picker
        v-model="searchData.year"
        @change="handleSearch(1)"
        :columns="5"
        :rows="5"
        type="year"
        placeholder="选择年份"
        value-format="YYYY"
      />
    </template>
    <template #toolbarRight>
      <el-input
        v-model="searchData.mountain_name"
        placeholder="请输入山脉名称"
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
        prop="year"
        label="年份"
      >
        <template #default="{ row }">
          <span>
            {{ row.year }}
          </span>
        </template>
      </el-table-column>
      <el-table-column
        prop="mountain.name"
        label="山脉"
      >
        <template #default="{ row }">
          <span>
            {{ row.mountain.name }}
          </span>
        </template>
      </el-table-column>
      <el-table-column
        prop="height"
        label="山脉高度(米)"
      >
        <template #default="{ row }">
          <el-input
            v-if="row.editItem"
            v-model="row.height"
            placeholder="山脉高度"
          />
          <span v-else>
            {{ formatHeight(row.height) }}
          </span>
        </template>
      </el-table-column>
    </template>
    <template #addDialog>
      <el-form
        ref="addRuleFormRef"
        style="max-width: 600px"
        :model="addRuleForm"
        :rules="addRules"
        label-width="auto"
      >
        <el-form-item
          label="山脉名称"
          prop="mountain_id"
        >
          <el-select
            @focus="mountainNameSelectFocus"
            :filter-method="mountainNameSelectFilter"
            v-model="addRuleForm.mountain_id"
            filterable
            placeholder="请选择山脉"
          >
            <el-option
              v-for="item in mountainNameList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label="年份"
          prop="year"
        >
          <el-date-picker
            v-model="addRuleForm.year"
            :columns="5"
            :rows="5"
            type="year"
            placeholder="选择年份"
            value-format="YYYY"
          />
        </el-form-item>
        <el-form-item
          label="山脉高度(米)"
          prop="height"
        >
          <el-input
            v-model.number="addRuleForm.height"
            type="number"
            placeholder="请输入山脉高度"
            step="0.01"
          />
        </el-form-item>
      </el-form>
    </template>
  </LayoutDataTableWrapper>
</template>
