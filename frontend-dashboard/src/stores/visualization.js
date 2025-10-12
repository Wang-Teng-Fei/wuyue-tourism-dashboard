import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import { getVisualizationData } from '@/api/visualication'

export const useVisualizationStore = defineStore('visualization', () => {
  // 可视化数据
  const visualizationData = ref({})

  // 获取可视化数据
  const fetchVisualizationData = async () => {
    const res = await getVisualizationData()
    visualizationData.value = res.data

    // 解析 config_json
    let configJson = typeof visualizationData.value.config_json === 'string'
      ? JSON.parse(visualizationData.value.config_json)
      : visualizationData.value.config_json ?? {}

    // 处理数组型字段
    const borderColor = typeof configJson.borderColor === 'string'
      ? JSON.parse(configJson.borderColor.replace(/'/g, '"'))
      : configJson.borderColor ?? ['#4fd2dd', '#235fa7']

    const echartsAnimationTime = Number(configJson.echartsAnimationTime) || 1500

    const echartsWuYueColor = typeof configJson.echartsWuYueColor === 'string'
      ? JSON.parse(configJson.echartsWuYueColor.replace(/'/g, '"'))
      : configJson.echartsWuYueColor ?? []

    // 合并默认值
    configJson = {
      ...configJson, // 原有字段
      borderColor,
      echartsAnimationTime,
      echartsWuYueColor
    }

    visualizationData.value.config_json = configJson
  }

  return {
    visualizationData,
    fetchVisualizationData
  }
})
