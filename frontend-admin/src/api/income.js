import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有收入统计列表（分页）
export const getIncomeAllList = (pageNum = page.value, pageSize = perPage.value) => {
  return request.get('/api/income/all', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 获取：指定山脉和年份收入统计列表
export const getIncomeMountainYearList = (
  mountain_name,
  year,
  pageNum = page.value,
  pageSize = perPage.value,
) => {
  return request.get(`/api/income/search`, {
    params: {
      mountain_name,
      year,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 新增：指定山脉收入统计数据
export const addIncome = (data) => {
  return request.post(`/api/income/add`, data)
}

// 更新：收入统计数据
export const updateIncome = (income_id, data) => {
  return request.patch(`/api/income/${income_id}/update`, data)
}

// 删除：收入统计数据
export const deleteIncome = (income_id) => {
  return request.delete(`/api/income/${income_id}/delete`)
}
