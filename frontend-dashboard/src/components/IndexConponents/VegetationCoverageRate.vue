<script setup>
import { ref, computed, onMounted, onUnmounted, watch } from 'vue'
import * as echarts from 'echarts/core';
import { ToolboxComponent, LegendComponent } from 'echarts/components';
import { PieChart } from 'echarts/charts';
import { LabelLayout } from 'echarts/features';
import { CanvasRenderer } from 'echarts/renderers';

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})

const config_json = props.visualizationData.config_json

const annualStats = computed(() => props.visualizationData.annualStats || [])

// 计算植被覆盖率的数据
const vegetationData = computed(() =>
  annualStats.value.map(item => ({
    name: item?.mountain_name || '未知',
    value: item?.mountain_annual_stats?.vegetation_coverage || 0,
  })).sort((a, b) => a.value - b.value)
)

echarts.use([
  ToolboxComponent,
  LegendComponent,
  PieChart,
  CanvasRenderer,
  LabelLayout
]);

const chartDom = ref(null)
let myChart = null

const renderChart = () => {
  if (!chartDom.value) return;

  if (!myChart) {
    myChart = echarts.init(chartDom.value, 'dark');
  }

  const option = {
    backgroundColor: 'transparent',
    title: {
      text: '植被覆盖率',
      textStyle: { color: 'aqua', fontSize: 20 },
      left: 'center',
      top: '3%',
    },
    legend: {
      orient: 'horizontal',
      bottom: '5%',
      left: '10%',
      textStyle: { color: '#fff' }
    },
    label: {
      show: true,
      color: '#fff',
      formatter: `{b}\n{c}%`
    },
    toolbox: {
      show: true,
      feature: {
        mark: { show: true },
        dataView: { show: false, readOnly: false },
        restore: { show: false },
        saveAsImage: { show: false }
      }
    },
    series: [
      {
        name: 'Nightingale Chart',
        type: 'pie',
        radius: ['5%', '50%'],
        center: ['50%', '45%'],
        roseType: 'area',
        animationDuration: config_json.echartsAnimationTime,
        itemStyle: { borderRadius: 8 },
        labelLine: { show: true, length: 10, length2: 10, smooth: true },
        data: vegetationData.value || []
      }
    ]
  };

  myChart.setOption(option);
}

onMounted(() => {
  renderChart();
  window.addEventListener('resize', resizeChart);
})

onUnmounted(() => {
  window.removeEventListener('resize', resizeChart);
  if (myChart) {
    myChart.dispose();
    myChart = null;
  }
})

const resizeChart = () => {
  if (myChart) {
    myChart.resize();
  }
}

// 响应式更新图表，当 vegetationData 改变时
watch(vegetationData, () => {
  renderChart();
}, { deep: true })
</script>



<template>
  <dv-border-box6 :color="config_json.borderColor">
    <div ref="chartDom" class="left-map-table"></div>
  </dv-border-box6>

</template>

<style lang="less">
.left-map-table {
  width: 100%;
  height: 100%;
}
</style>