<script setup>
import { ref, onMounted, onUnmounted, defineProps, watch, computed } from 'vue'
import * as echarts from 'echarts/core'
import { TooltipComponent, GridComponent } from 'echarts/components'
import { BarChart } from 'echarts/charts'
import { CanvasRenderer } from 'echarts/renderers'

echarts.use([TooltipComponent, GridComponent, BarChart, CanvasRenderer])

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})
const config_json = props.visualizationData.config_json

// 计算属性：X轴和Y轴数据
const XData = computed(() => props.visualizationData?.monthlyStats?.map(item => item.mountain_name) || [])
const YData = computed(() =>
  props.visualizationData?.monthlyStats?.map(item =>
    (item.mountain_monthly_stats.reduce((acc, cur) => acc + +cur.income, 0) / 100000000)
  ).sort((a, b) => a - b) || []
)

console.log(YData.value)

const chartDom = ref(null)
let myChart = null

const renderChart = () => {
  if (!chartDom.value) return

  if (!myChart) {
    myChart = echarts.init(chartDom.value, 'dark')
  }

  const option = {
    animationDuration: props.visualizationData?.config_json?.echartsAnimationTime || 1500,
    backgroundColor: 'transparent',
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' }
    },
    title: {
      text: '景区收入统计',
      textStyle: {
        color: 'aqua',
        fontSize: 20
      },
      left: 'center',
      top: '3%'
    },
    grid: {
      left: '8%',
      right: '8%',
      top: '20%',
      bottom: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: XData.value,
      axisTick: { alignWithLabel: true },
      axisLabel: { interval: 0 }
    },
    yAxis: {
      type: 'value',
      axisLabel: {
        color: '#42b983',
        formatter: '{value}亿'
      }
    },
    series: [{
      name: '收入',
      type: 'bar',
      barWidth: '60%',
      data: YData.value
    }]
  }

  myChart.setOption(option)
}

// 监听数据变化，自动刷新
watch(() => props.visualizationData, renderChart, { deep: true, immediate: true })

// 监听窗口大小变化
const resizeChart = () => {
  if (myChart) myChart.resize()
}

onMounted(() => {
  window.addEventListener('resize', resizeChart)
  renderChart()
})

onUnmounted(() => {
  window.removeEventListener('resize', resizeChart)
  if (myChart) {
    myChart.dispose()
    myChart = null
  }
})
</script>

<template>
  <dv-border-box6 :color="config_json.borderColor">
    <div class="vegetation-coverage-rate" ref="chartDom"></div>
  </dv-border-box6>
</template>

<style scoped lang="less">
.vegetation-coverage-rate {
  width: 100%;
  height: 100%;
}
</style>
