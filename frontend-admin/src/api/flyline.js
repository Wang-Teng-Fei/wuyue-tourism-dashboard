import request from '@/utils/request'

// 获取飞线图名称列表
export const searchFlylineChartsNameList = (flyline_name) => {
  return request.get('/api/flyline-charts/name', {
    params: {
      flyline_name,
    },
  })
}

// 获取飞线图详情列表
export const getFlylineChartsList = () => {
  return request.get('/api/flyline-charts/list')
}
