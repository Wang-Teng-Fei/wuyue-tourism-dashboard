<script setup>
import { ref, onMounted, onUnmounted, defineProps, watch, computed } from "vue";
import * as echarts from "echarts/core";
import { TooltipComponent, GridComponent } from "echarts/components";
import { BarChart } from "echarts/charts";
import { CanvasRenderer } from "echarts/renderers";

echarts.use([TooltipComponent, GridComponent, BarChart, CanvasRenderer]);

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({}),
  },
});
const config_json = props.visualizationData.config_json;

// 计算属性：按 income 从高到低排序的数据
const sortedData = computed(() => {
  const monthlyStats = props.visualizationData?.monthlyStats || [];

  // 计算每个山脉的总收入并排序
  return monthlyStats
    .map((item) => {
      const totalIncome = item.mountain_monthly_stats.reduce(
        (acc, cur) => acc + +cur.income,
        0
      );
      return {
        mountain_name: item.mountain_name,
        totalIncome: totalIncome,
        incomeInHundredMillion: totalIncome / 100000000,
        mountain_monthly_stats: item.mountain_monthly_stats,
        originalData: item, // 保留原始数据
      };
    })
    .sort((a, b) => a.totalIncome - b.totalIncome); // 从低到高排序
});

// X轴数据（排序后的山脉名称）
const XData = computed(
  () => sortedData.value.map((item) => item.mountain_name) || []
);

// Y轴数据（排序后的收入数据，单位：亿元）
const YData = computed(
  () =>
    sortedData.value.map((item) => item.incomeInHundredMillion.toFixed(2)) || []
);

// 调试数据（已排序）
const debugData = computed(
  () =>
    sortedData.value.map((item) => ({
      mountain: item.mountain_name,
      totalIncome: item.totalIncome,
      incomeInHundredMillion: item.incomeInHundredMillion,
      monthlyCount: item.mountain_monthly_stats.length,
    })) || []
);
console.log("X轴数据:", XData.value);
console.log("Y轴数据:", YData.value);
console.log("调试数据:", debugData.value);

const chartDom = ref(null);
let myChart = null;

const renderChart = () => {
  if (!chartDom.value) return;

  if (!myChart) {
    myChart = echarts.init(chartDom.value, "dark");
  }

  const option = {
    animationDuration:
      props.visualizationData?.config_json?.echartsAnimationTime || 1500,
    backgroundColor: "transparent",
    tooltip: {
      trigger: "axis",
      axisPointer: { type: "shadow" },
    },
    title: {
      text: "景区收入统计",
      textStyle: {
        color: "aqua",
        fontSize: 20,
      },
      left: "center",
      top: "3%",
    },
    grid: {
      left: "8%",
      right: "8%",
      top: "20%",
      bottom: "3%",
      containLabel: true,
    },
    xAxis: {
      type: "category",
      data: XData.value,
      axisTick: { alignWithLabel: true },
      axisLabel: { interval: 0 },
    },
    yAxis: {
      type: "value",
      axisLabel: {
        color: "#42b983",
        formatter: "{value}亿",
      },
    },
    series: [
      {
        name: "收入",
        type: "bar",
        barWidth: "60%",
        data: YData.value,
      },
    ],
  };

  myChart.setOption(option);
};

// 监听数据变化，自动刷新
watch(() => props.visualizationData, renderChart, {
  deep: true,
  immediate: true,
});

// 监听窗口大小变化
const resizeChart = () => {
  if (myChart) myChart.resize();
};

onMounted(() => {
  window.addEventListener("resize", resizeChart);
  renderChart();
});

onUnmounted(() => {
  window.removeEventListener("resize", resizeChart);
  if (myChart) {
    myChart.dispose();
    myChart = null;
  }
});
</script>

<template>
  <dv-border-box6 :color="config_json.borderColor">
    <div
      class="vegetation-coverage-rate"
      ref="chartDom"
    ></div>
  </dv-border-box6>
</template>

<style scoped lang="less">
.vegetation-coverage-rate {
  width: 100%;
  height: 100%;
}
</style>
