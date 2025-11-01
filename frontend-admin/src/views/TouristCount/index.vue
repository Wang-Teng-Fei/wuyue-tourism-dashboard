<script setup>
import { reactive, ref } from 'vue'
import { searchMountainNameList } from '@/api/mountain'
import {
  getTouristCountMountainYearList,
  addTouristCount,
  updateTouristCount,
  deleteTouristCount,
} from '@/api/tourist-count'
import { ElMessage } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'

defineOptions({
  name: 'TouristCount',
})

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value) // 记录当前页码

const touristCountList = ref({
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
      getTouristCountMountainYearList(
        searchData.value.mountain_name,
        +searchData.value.year,
        pageNum,
        pageSize,
      ),
    )
    if (res) {
      touristCountList.value = res.data
      currentPage.value = Number(res.data.current_page) || pageNum
    }
  } finally {
    isLoading.value = false
  }
}

handleSearch()

// 新增表单验证
const addRuleFormRef = ref()
const addRuleForm = reactive({
  year: String(new Date().getFullYear()), // 改为 number
  month: 1,
  tourist_count: 0,
  mountain_id: '',
})
const addRules = reactive({
  year: [
    {
      required: true,
      message: '年份不可为空',
      trigger: 'blur',
    },
  ],
  month: [
    {
      required: true,
      message: '月份不可为空',
      trigger: 'blur',
    },
  ],
  tourist_count: [
    {
      required: true,
      message: '游客数量不可为空',
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

const handleAdd = (bool) => {
  Object.assign(addRuleForm, {
    mountain_id: '',
    year: String(new Date().getFullYear()),
    month: 1,
    tourist_count: 0,
  })
  addDialogVisible.value = bool
}

// 山脉名称选择器
const mountainNameList = ref([])
const ismountainNameListLoading = ref(true)
const mountainNameSelectFocus = async () => {
  console.log('focus事件触发 - 加载所有数据')
  const res = await runRequest(() => searchMountainNameList(''))
  if (!res) return
  ismountainNameListLoading.value = false
  mountainNameList.value = res.data
}

// filter-method 事件 - 实时搜索
const mountainNameSelectFilter = async (query) => {
  console.log('filter-method事件触发 - 搜索:', query)
  const res = await runRequest(() => searchMountainNameList(query))
  if (!res) return
  mountainNameList.value = res.data
}

// 新增
const addTouristCountData = async (addFormEl) => {
  if (!addFormEl) return
  await addFormEl.validate(async (valid) => {
    if (valid) {
      isLoading.value = true
      const res = await runRequest(() => addTouristCount(addRuleForm))
      if (res) {
        searchData.value.year = addRuleForm.year
        // 直接重新获取第一页数据来更新分页信息
        await handleSearch(1)

        // 使用更新后的分页信息跳转到最后一页
        const lastPage = Number(touristCountList.value.last_page) || 1
        await handleSearch(lastPage)

        ElMessage.success('新增游客统计成功')
        handleAdd(false)
      }
    }
  })
}

// 编辑
const updateTouristCountData = async (data, onSuccess) => {
  await runRequest(() =>
    updateTouristCount(data.id, {
      year: data.year,
      month: data.month,
      tourist_count: data.tourist_count,
      mountain_id: data?.mountain?.id,
    }),
  )
  touristCountList.value.data.forEach((item) => {
    if (item.id === data.id) {
      item.editItem = false
    }
  })
  onSuccess?.()
  ElMessage.success('更新游客统计成功')
}

// 删除
const deleteTouristCountData = async (data) => {
  await runRequest(() => deleteTouristCount(data.id))

  // 删除后保持在当前页
  const currentPageNum = Number(touristCountList.value.current_page) || page.value
  await handleSearch(currentPageNum)

  ElMessage.success('删除游客统计成功')
}
</script>

<template>
  <LayoutDataTableWrapper
    :dataList="touristCountList"
    :addDialogVisible="addDialogVisible"
    :isLoading="isLoading"
    addDataDialogTitle="新增游客数量数据"
    @handleAdd="handleAdd"
    @getDataListData="handleSearch"
    @addData="() => addTouristCountData(addRuleFormRef)"
    @updateData="updateTouristCountData"
    @deleteData="deleteTouristCountData"
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
        prop="month"
        label="月份"
      >
        <template #default="{ row }">
          <span>
            {{ row.month }}
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
        prop="tourist_count"
        label="游客数量"
      >
        <template #default="{ row }">
          <el-input
            v-if="row.editItem"
            v-model="row.tourist_count"
            placeholder="游客数量"
          />
          <span v-else>
            {{ row.tourist_count }}
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
          label="月份"
          prop="month"
        >
          <el-select
            v-model="addRuleForm.month"
            placeholder="Select"
          >
            <el-option
              v-for="item in 12"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label="游客数量"
          prop="tourist_count"
        >
          <el-input
            v-model.number="addRuleForm.tourist_count"
            type="number"
          />
        </el-form-item>
      </el-form>
    </template>
  </LayoutDataTableWrapper>
</template>
