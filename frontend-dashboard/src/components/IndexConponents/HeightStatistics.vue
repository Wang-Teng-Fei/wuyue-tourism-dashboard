<script setup>
import { reactive, defineProps, watch, computed } from 'vue'

// props 定义
const props = defineProps({
  visualizationData: {
    type: Object,
    default: () => ({})
  }
})

const config_json = props.visualizationData.config_json

// 安全取值
const annualStats = computed(() => props.visualizationData?.annualStats ?? [])

// 计算山的数据
const mountainData = computed(() =>
  annualStats.value.map(item => ({
    name: item?.mountain_name || '未知',
    value: item?.mountain_annual_stats?.height || 0,
  })).sort((a, b) => a.value - b.value)
)
console.log(mountainData.value)
// 核心配置
const config = reactive({
  fontSize: 12,
  columnColor: '#0099ff9d',
  sort: false,
  data: [],   // 初始为空，后面同步
  img: [],
  showValue: true,
})

// 同步数据
watch(mountainData, (newVal) => {
  config.data = [...newVal]
}, { immediate: true })

// 模拟新增数据
const addData = () => {
  config.data.push({
    name: `新增${Math.floor(Math.random() * 129) + 1}`,
    value: Math.floor(Math.random() * 129) + 1,
  })

  // 假设你有个图片
  // config.img.push(require('@/assets/top7.png'))
}
</script>


<template>
  <dv-border-box6 :color="config_json.borderColor">
    <h2>五岳高度概览(单位：m)</h2>
    <div class="data">
      <dv-conical-column-chart :config="config" />
    </div>
  </dv-border-box6>
</template>

<style scoped lang="less">
.dv-border-box-6 {
  padding-top: 15px;
}

h2 {
  text-align: center;
  font-size: 20px;
  color: aqua;
}

.data {
  padding: 0 20px;
  margin-top: 20px;
  width: 100%;
  height: calc(100% - 100px);

  :deep(image) {
    display: none;
  }

  :deep(path) {
    margin-bottom: 20px;
  }
}
</style>
