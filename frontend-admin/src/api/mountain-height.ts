import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有山脉高度统计列表（分页）
export const getMountainHeightAllList = (
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get('/api/mountain-height/all', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 获取：获取指定山脉高度列表
export const getMountainHeightList = (
  mountain_name: string,
  year: number,
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get(`/api/mountain-height/search`, {
    params: {
      mountain_name,
      year,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 新增：高度的年度统计数据
export const addMountainHeight = (data: object) => {
  return request.post(`/api/mountain-height/add`, data)
}

// 更新：高度的年度统计数据
export const updateMountainHeight = (height_id: number, data: object) => {
  return request.patch(`/api/mountain-height/${height_id}/update`, data)
}

// 删除：山脉高度的年度统计数据
export const deleteMountainHeight = (height_id: number) => {
  return request.delete(`/api/mountain-height/${height_id}/delete`)
}
