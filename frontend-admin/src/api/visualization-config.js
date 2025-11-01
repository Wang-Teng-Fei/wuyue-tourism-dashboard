import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有配可视化配置统计列表（分页）
// export const getVisualizationConfigAllList = (
//   pageNum = page.value,
//   pageSize = perPage.value,
// ) => {
//   return request.get('/api/mountain-height/all', {
//     params: {
//       page: pageNum,
//       per_page: pageSize,
//     },
//   })
// }

// 获取：获取指定可视化配置列表
export const getVisualizationConfigList = (
  visualization_name,
  pageNum = page.value,
  pageSize = perPage.value,
) => {
  return request.get(`/api/visualization-configs/search/name`, {
    params: {
      visualization_name,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 新增：可视化配置数据
export const addVisualizationConfig = (data) => {
  return request.post(`/api/visualization-configs/add`, data)
}

// 更新：可视化配置数据
export const updateVisualizationConfig = (visualization_id, data) => {
  return request.post(`/api/visualization-configs/${visualization_id}/update`, data, {
    params: {
      _method: 'PATCH',
    },
  })
}

// // 删除：可视化配置数据
export const deleteVisualizationConfig = (visualization_id) => {
  return request.delete(`/api/visualization-configs/${visualization_id}/delete`)
}
