<script setup>
import { reactive, ref } from 'vue'
import {
  addMountain,
  updateMountain,
  deleteMountain,
  getMountainList,
  getMountainNameList,
} from '@/api/mountain'
import { ElMessage } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'

defineOptions({
  name: 'MountainComponent',
})

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value) // 记录当前页码

const mountainList = ref({ data: [], total: 0, last_page: 0 })

const isLoading = ref(true)
// 新增面版是否显示
const addDialogVisible = ref(false)

const searchQuery = ref('')

const getMountainListData = async (pageNum = currentPage.value) => {
  const res = await runRequest(() => getMountainList(pageNum, perPage.value))
  mountainList.value = res ? res.data : []
  isLoading.value = false
}

// 搜索山脉，优先使用传入的 pageNum
const handleSearch = async (pageNum = page.value, pageSize = perPage.value) => {
  isLoading.value = true
  console.log(pageNum)
  try {
    const res = await runRequest(() =>
      getMountainNameList(searchQuery.value ?? '', pageNum, pageSize),
    )
    if (res) {
      mountainList.value = res.data
      currentPage.value = Number(res.data.current_page) || pageNum // 更新当前页码
    }
  } catch (error) {
    console.error(error)
    ElMessage.error('获取数据失败')
  } finally {
    isLoading.value = false
  }
}

// 如果搜索的山脉名字为空，则获取所有数据
handleSearch()

// 新增表单验证
const addRuleFormRef = ref()
const addRuleForm = reactive({
  name: '',
  province: '',
})
const addRules = reactive({
  name: [{ required: true, message: '山脉名称不可为空', trigger: 'blur' }],
  province: [{ required: true, message: '所属省份不可为空', trigger: 'blur' }],
})

const handleAdd = (bool) => {
  Object.assign(addRuleForm, { name: '', province: '' })
  addDialogVisible.value = bool
}

// 新增山脉 - 通过计算确定页码
const addMountainData = async (addFormEl) => {
  if (!addFormEl) return
  await addFormEl.validate(async (valid) => {
    if (valid) {
      try {
        isLoading.value = true
        const res = await runRequest(() => addMountain(addRuleForm))
        if (res) {
          // 获取当前分页信息
          const currentTotal = Number(mountainList.value.total)
          const currentPerPage = Number(mountainList.value.per_page) || perPage.value

          // 计算新增后的总页数
          const newTotal = currentTotal + 1
          const lastPage = Math.ceil(newTotal / currentPerPage)

          // 跳转到最后一页
          await getMountainListData(lastPage)

          ElMessage.success('新增山脉成功')
          handleAdd(false)
        }
      } finally {
        isLoading.value = false
      }
    }
  })
}

// 编辑山脉
const updateMountainData = async (data, index, onSuccess) => {
  await updateMountain(data.id, { name: data.name, province: data.province })
  onSuccess?.()
  mountainList.value.data[index].editItem = false
  ElMessage.success('更新山脉成功')
}

// 删除山脉，保留当前页码（如最后一页被删光则自动回到上一页）
const deleteMountainData = async (data) => {
  await deleteMountain(data.id)

  // 记录删除前的当前页数据情况
  const currentPageBeforeDelete = Number(mountainList.value.current_page)
  const currentDataCount = mountainList.value.data.length

  // 如果当前页只有一条数据且不是第一页，则删除后回到上一页
  if (currentDataCount === 1 && currentPageBeforeDelete > 1) {
    currentPage.value = currentPageBeforeDelete - 1
  } else {
    currentPage.value = currentPageBeforeDelete
  }

  // 使用无搜索条件的方法重新加载数据
  await getMountainListData(currentPage.value)
  ElMessage.success('删除山脉成功')
}
</script>

<template>
  <LayoutDataTableWrapper
    :dataList="mountainList"
    :addDialogVisible="addDialogVisible"
    :isLoading="isLoading"
    addDataDialogTitle="新增山脉数据"
    @handleAdd="handleAdd"
    @getDataListData="getMountainListData"
    @addData="() => addMountainData(addRuleFormRef)"
    @updateData="updateMountainData"
    @deleteData="deleteMountainData"
  >
    <template #toolbarLeft>
      <!-- 可添加筛选功能 -->
    </template>
    <template #toolbarRight>
      <el-input
        v-model="searchQuery"
        placeholder="请输入山脉名称"
        @keyup.enter="handleSearch"
        class="data-table__search"
        clearable
      />
      <el-button
        type="primary"
        class="data-table__btn"
        @click="handleSearch"
      >
        查询
      </el-button>
    </template>
    <template #default>
      <el-table-column
        prop="name"
        label="名称"
      >
        <template #default="{ row }">
          <el-input
            v-if="row.editItem"
            v-model="row.name"
            placeholder="山脉名称"
          />
          <span v-else>{{ row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="province"
        label="所属省份"
      >
        <template #default="{ row }">
          <el-input
            v-if="row.editItem"
            v-model="row.province"
            placeholder="所属省份"
          />
          <span v-else>{{ row.province }}</span>
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
          prop="name"
        >
          <el-input v-model="addRuleForm.name" />
        </el-form-item>
        <el-form-item
          label="所属省份"
          prop="province"
        >
          <el-input v-model="addRuleForm.province" />
        </el-form-item>
      </el-form>
    </template>
  </LayoutDataTableWrapper>
</template>
