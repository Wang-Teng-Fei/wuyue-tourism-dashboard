<script setup lang="ts">
import { reactive, ref } from 'vue'
import { searchMountainNameList } from '@/api/mountain'
import {
  getVegetationCoverageList,
  addVegetationCoverage,
  updateVegetationCoverage,
  deleteVegetationCoverage,
} from '@/api/vegetation-coverage'
import { ElMessage, type FormInstance, type FormRules } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'
import type { MountainData } from '@/types/mountain'

defineOptions({
  name: 'VegetationCoverage',
})

interface VegetationCoverageDataObj {
  id: number
  year?: number
  vegetation_coverage?: string | number
  mountain?: MountainData
  created_at?: string
  updated_at?: string
  editItem?: boolean
}

interface VegetationCoverageListObj {
  data: VegetationCoverageDataObj[]
  current_page?: number | string
  total?: number | string
  per_page?: number | string
  last_page?: number | string
}

interface AddRuleForm {
  mountain_id: number | string
  year: string
  vegetation_coverage: number
}

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value) // 记录当前页码

const vegetationCoverageList = ref<VegetationCoverageListObj>({
  data: [],
})
const isLoading = ref(true)
const addDialogVisible = ref(false)

const searchData = ref({
  year: String(new Date().getFullYear()),
  mountain_name: '',
})

// 搜索
const handleSearch = async (pageNum = currentPage.value, pageSize = perPage.value) => {
  isLoading.value = true
  try {
    const res = await runRequest(() =>
      getVegetationCoverageList(
        searchData.value.year,
        searchData.value.mountain_name,
        pageNum,
        pageSize,
      ),
    )
    if (res) {
      vegetationCoverageList.value = res.data
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
  vegetation_coverage: 0,
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
  vegetation_coverage: [
    {
      required: true,
      message: '植被覆盖率不可为空',
      trigger: 'blur',
    },
    {
      type: 'number',
      min: 0,
      max: 100,
      message: '植被覆盖率必须在 0-100 之间',
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
    vegetation_coverage: 0,
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

// 格式化植被覆盖率显示，保留两位小数并添加百分比
const formatCoverage = (coverage: string | number) => {
  if (!coverage && coverage !== 0) return '0.00%'
  return parseFloat(coverage.toString()).toFixed(2) + '%'
}

// 新增
const addVegetationCoverageData = async (addFormEl: FormInstance | undefined) => {
  if (!addFormEl) return
  await addFormEl.validate(async (valid) => {
    if (valid) {
      isLoading.value = true
      const res = await runRequest(() => addVegetationCoverage(addRuleForm))
      if (res) {
        // 设置搜索年份为新增数据的年份
        searchData.value.year = addRuleForm.year

        // 直接重新获取第一页数据来更新分页信息
        await handleSearch(1)

        // 使用更新后的分页信息跳转到最后一页
        const lastPage = Number(vegetationCoverageList.value.last_page) || 1
        await handleSearch(lastPage)

        ElMessage.success('新增植被覆盖率成功')
        handleAdd(false)
      }
    }
  })
}

// 编辑
const updateVegetationCoverageData = async (data: VegetationCoverageDataObj) => {
  await runRequest(() =>
    updateVegetationCoverage(data.id, {
      year: data.year,
      vegetation_coverage: data.vegetation_coverage,
      mountain_id: data?.mountain?.id,
    }),
  )
  vegetationCoverageList.value.data.forEach((item) => {
    if (item.id === data.id) {
      item.editItem = false
    }
  })
  ElMessage.success('更新植被覆盖率成功')
}

// 删除
const deleteVegetationCoverageData = async (data: VegetationCoverageDataObj) => {
  await runRequest(() => deleteVegetationCoverage(data.id))

  // 删除后保持在当前页
  const currentPageNum = Number(vegetationCoverageList.value.current_page) || page.value
  await handleSearch(currentPageNum)

  ElMessage.success('删除植被覆盖率成功')
}
</script>

<template>
  <LayoutDataTableWrapper
    :dataList="vegetationCoverageList"
    :addDialogVisible="addDialogVisible"
    :isLoading="isLoading"
    addDataDialogTitle="新增植被覆盖率"
    @handleAdd="handleAdd"
    @getDataListData="handleSearch"
    @addData="() => addVegetationCoverageData(addRuleFormRef)"
    @updateData="updateVegetationCoverageData"
    @deleteData="deleteVegetationCoverageData"
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
        prop="vegetation_coverage"
        label="植被覆盖率"
      >
        <template #default="{ row }">
          <el-input
            v-if="row.editItem"
            v-model="row.vegetation_coverage"
            placeholder="植被覆盖率"
          />
          <span v-else>
            {{ formatCoverage(row.vegetation_coverage) }}
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
          label="植被覆盖率(%)"
          prop="vegetation_coverage"
        >
          <el-input
            v-model.number="addRuleForm.vegetation_coverage"
            type="number"
            placeholder="请输入植被覆盖率"
            step="0.01"
            max="100"
            min="0"
          />
        </el-form-item>
      </el-form>
    </template>
  </LayoutDataTableWrapper>
</template>
