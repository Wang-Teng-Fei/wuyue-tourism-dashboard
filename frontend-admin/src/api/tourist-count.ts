import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有游客数量统计列表（分页）
export const getTouristCountAllList = (
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get('/api/tourist-count/all', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 获取：指定山脉和年份游客数量统计列表
export const getTouristCountMountainYearList = (
  mountain_name: string | string,
  year: number,
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get(`/api/tourist-count/search`, {
    params: {
      mountain_name,
      year,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 新增：游客数量统计数据
export const addTouristCount = (data: object) => {
  return request.post(`/api/tourist-count/add`, data)
}

// 更新：游客数量统计数据
export const updateTouristCount = (tourist_id: number, data: object) => {
  return request.patch(`/api/tourist-count/${tourist_id}/update`, data)
}

// 删除：游客数量统计数据
export const deleteTouristCount = (tourist_id: number) => {
  return request.delete(`/api/tourist-count/${tourist_id}/delete`)
}
