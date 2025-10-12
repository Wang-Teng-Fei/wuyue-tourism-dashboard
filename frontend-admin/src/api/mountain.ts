import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取山脉详情列表
export const getMountainList = (pageNum: number = page.value, pageSize: number = perPage.value) => {
  return request.get('/api/mountains', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 按名称查询山脉
export const getMountainNameList = (
  mountain_name: string,
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get('/api/mountains/search/name/details-list', {
    params: {
      mountain_name,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 关键字搜索山脉名称列表
export const searchMountainNameList = (mountain_name: string | number) => {
  return request.get('/api/mountains/search/name', {
    params: {
      mountain_name,
    },
  })
}

// 新增山脉
export const addMountain = (data: object) => {
  return request.post('/api/mountains/add', data)
}

// 更新山脉
export const updateMountain = (mountain_id: number, data: object) => {
  return request.patch(`/api/mountains/${mountain_id}/update`, data)
}

// 删除山脉
export const deleteMountain = (mountain_id: number) => {
  return request.delete(`/api/mountains/${mountain_id}/delete`)
}
