<script setup>
// 飞线图增强版
import { reactive, ref, watch } from 'vue'
import { defineProps } from 'vue'
import { baseURL } from '@/utils/request'
import mapImg from '@/assets/china-map-max.png'
import mapSign from '@/assets/sign.png'
import mapStar from '@/assets/star.png'
import { useElementSize, useMouseInElement } from '@vueuse/core'

// props
const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})

// 安全获取飞线图数据
const flylineData = reactive({
  points: props.visualizationData?.flyline_chart?.points || [],
  lines: props.visualizationData?.flyline_chart?.lines || [],
  main_image: props.visualizationData?.flyline_chart?.main_image || mapImg,
  sub_image: props.visualizationData?.flyline_chart?.sub_image || null,
  point_image_path: props.visualizationData?.flyline_chart?.point_image_path || mapSign,
})

// 生成随机的飞线数据（后期从后端获取） 
// while (true) {
//   if (lines.value.length >= 60) break
//   const source = points.value[Math.floor(Math.random() * points.value.length)].name
//   const target = points.value[Math.floor(Math.random() * points.value.length)].name
//   if (!lines.value.some(item => item.source === source && item.target === target)) {
//     const lineArr = {
//       source,
//       target,
//     }
//     if (target === '北京') lineArr.color = '#ff0000'
//     lines.value.push(lineArr)
//   }
// }

// 自动拼接 points 中的图片 URL
flylineData.points = flylineData.points.map(item => {
  if (item?.icon?.src) item.icon.src = baseURL + item.icon.src
  return item
})

// config_json 处理
const config_json = props.visualizationData.config_json


// 获取点击位置的坐标
const mapArr = ref([])
const mapDom = ref(null)
const { width, height } = useElementSize(mapDom)
const { x, y, isOutside } = useMouseInElement(mapDom)

const addPoint = () => {
  const w = width.value
  const h = height.value
  const Mx = x.value
  const My = y.value - 76
  const X = +(Mx / w).toFixed(4)
  const Y = +(My / h).toFixed(4)
  const name = prompt('请输入位置名称')
  if (name) {
    mapArr.value.push({ name, coordinate: [X, Y] })
  }
}

// 生成飞线图配置的函数
function createFlylineChartConfig(data) {
  return {
    points: data.points,
    lines: data.lines,
    icon: {
      show: true,
      src: data.point_image_path || mapSign,
      width: 5,
      height: 5
    },
    text: {
      show: true,
      color: '#fff',
      offset: [0, 10],
    },
    k: 1,
    bgImgSrc: data.main_image,
  }
}

// 响应式飞线图配置
const flylineChartConfig = reactive(createFlylineChartConfig(flylineData))

// 监听 points 和 lines 变化，更新 flylineChartConfig
watch(() => flylineData.points, () => {
  Object.assign(flylineChartConfig, createFlylineChartConfig(flylineData))
}, { deep: true })

watch(() => flylineData.lines, () => {
  Object.assign(flylineChartConfig, createFlylineChartConfig(flylineData))
}, { deep: true })

</script>

<template>
  <dv-border-box1 :color="config_json.borderColor" ref="borderRef">
    <dv-flyline-chart-enhanced class="map-img" ref="mapDom" :config="flylineChartConfig"
      style="width:100%;height:100%; background-repeat: no-repeat; background-position: center;" />
    <!-- <div :style="`width: ${width}rem`" h18rem color-white flex justify-center items-center>
      </div> -->
  </dv-border-box1>
  <div class="min-map" v-if="flylineData.sub_image">
    <dv-border-box12>
      <img :src="flylineData.sub_image" alt="">
    </dv-border-box12>
  </div>
</template>

<style lang="less">
.map {
  position: relative;
  width: 100%;
  aspect-ratio: 10 / 7;
  flex-shrink: 0;

  // 小地图
  .min-map {
    position: absolute;
    right: 5%;
    bottom: 5%;
    width: 10%;
    aspect-ratio: 1 / 1.5;

    img {
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      width: 80%;
      height: 80%;
      object-fit: cover;
    }
  }

  svg {
    width: 100% !important;
    height: 100% !important;

    // 控制飞线图字体大小
    text {
      font-size: 14px !important;
    }
  }
}
</style>