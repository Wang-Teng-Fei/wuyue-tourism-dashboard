import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有植被覆盖率统计列表（分页）
export const getVegetationCoverageAllList = (pageNum = page.value, pageSize = perPage.value) => {
  return request.get('/api/vegetation-coverage/all', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 获取：获取指定植被覆盖率列表
export const getVegetationCoverageList = (
  year,
  mountain_name,
  pageNum = page.value,
  pageSize = perPage.value,
) => {
  return request.get(`/api/vegetation-coverage/search`, {
    params: {
      year,
      mountain_name,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 新增：植被覆盖率的年度统计数据
export const addVegetationCoverage = (data) => {
  return request.post(`/api/vegetation-coverage/add`, data)
}

// 更新：植被覆盖率的年度统计数据
export const updateVegetationCoverage = (coverage_id, data) => {
  return request.patch(`/api/vegetation-coverage/${coverage_id}/update`, data)
}

// 删除：植被覆盖率的年度统计数据
export const deleteVegetationCoverage = (coverage_id) => {
  return request.delete(`/api/vegetation-coverage/${coverage_id}/delete`)
}
