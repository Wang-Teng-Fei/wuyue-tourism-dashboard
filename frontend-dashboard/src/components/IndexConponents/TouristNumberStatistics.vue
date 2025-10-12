<script setup>
import { ref, onMounted, onUnmounted, defineProps, watch } from 'vue'
import * as echarts from 'echarts'

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})

const config_json = props.visualizationData.config_json

const leftMapTable = ref(null)
let myChart = null

const renderChart = () => {
  if (!myChart) return //  先检查 myChart 是否初始化
  if (!props.visualizationData?.monthlyStats) return

  const monthlyStats = props.visualizationData.monthlyStats
  const config_json = props.visualizationData.config_json || {}

  const mountain_name = monthlyStats.map(item => item.mountain_name)

  const series = monthlyStats.map(mountain => ({
    type: 'line',
    stack: 'Total',
    areaStyle: {},
    emphasis: { focus: 'series' },
    name: mountain.mountain_name,
    data: mountain.mountain_monthly_stats.map(item => item.tourist_count)
  }))

  const yAxisMax = Math.max(...series.map(item => item.data.reduce((arr, cur) => arr + cur, 0)))

  const option = {
    animation: true,
    animationDuration: config_json.echartsAnimationTime || props.echartsAnimationTime,
    animationEasing: 'cubicOut',
    backgroundColor: 'transparent',
    title: {
      text: '旅游人数统计',
      textStyle: { color: 'aqua', fontSize: 20 },
      left: 'center',
      top: '3%',
    },
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'cross', label: { backgroundColor: '#6a7985' } }
    },
    legend: {
      data: mountain_name,
      textStyle: { color: '#00ccff' },
      orient: 'horizontal',
      bottom: '5%',
      left: '10%',
    },
    grid: { left: '10%', right: '10%', top: '15%', bottom: '20%', containLabel: true },
    xAxis: [{
      type: 'category',
      boundaryGap: false,
      data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
      axisLabel: { color: '#ffffff', interval: 1, rotate: 0 }
    }],
    yAxis: [{
      type: 'value',
      min: 0,
      max: yAxisMax / 1.5,
      // interval: 1000000, // 让刻度线均分（比如 1330/5=266）
      boundaryGap: false,
      axisLabel: { color: '#ffffff', formatter: '{value}人' }
    }],
    series
  }

  myChart.setOption(option, true)
}

onMounted(() => {
  myChart = echarts.init(leftMapTable.value, 'dark')
  renderChart()
  window.addEventListener('resize', () => { if (myChart) myChart.resize() })
})

// watch 数据变化，确保 myChart 初始化后再调用 renderChart
watch(() => props.visualizationData, () => {
  if (myChart) renderChart()
}, { deep: true })

onUnmounted(() => {
  window.removeEventListener('resize', () => { })
  if (myChart) myChart.dispose()
})
</script>



<template>
  <dv-border-box6 :color="config_json.borderColor">
    <div ref="leftMapTable" class="left-map-table"></div>
  </dv-border-box6>
</template>

<style lang="less"></style>