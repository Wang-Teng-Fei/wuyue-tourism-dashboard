import request from '@/utils/request'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
const { page, perPage } = storeToRefs(usePaginationStore())

// 获取：所有配可视化配置统计列表（分页）
// export const getVisualizationConfigAllList = (
//   pageNum: number = page.value,
//   pageSize: number = perPage.value,
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
  visualization_name: string,
  pageNum: number = page.value,
  pageSize: number = perPage.value,
) => {
  return request.get(`/api/visualization-configs/search/name`, {
    params: {
      visualization_name,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// // 新增：可视化配置数据
// export const addVisualizationConfig = (data: object) => {
//   return request.post(`/api/mountain-height/add`, data)
// }

// // 更新：可视化配置数据
// export const updateVisualizationConfig = (height_id: number, data: object) => {
//   return request.patch(`/api/mountain-height/${height_id}/update`, data)
// }

// // 删除：可视化配置数据
// export const deleteVisualizationConfig = (height_id: number) => {
//   return request.delete(`/api/mountain-height/${height_id}/delete`)
// }
