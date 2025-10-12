<script setup>
import { ref, computed, onMounted, onUnmounted, defineProps } from 'vue'

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})

// 标题
const title = computed(() => props.visualizationData.name)

const config_json = props.visualizationData.config_json

</script>

<template>
  <dv-decoration8 :color="['aqua', 'aqua']" class="border" />
  <span class="t">
    <span>{{ title }}</span>
    <dv-decoration6 :color="config_json.borderColor" />
  </span>
  <!-- <dv-decoration5 class="border" :dur="3" style=""></dv-decoration5> -->
  <dv-decoration8 :color="['aqua', 'aqua']" class="border right" :reverse="true" />
</template>

<style scoped lang="less">
span.t {
  width: 40%;
  position: relative;
  font-size: 40px;
  flex-shrink: 0;

  span {
    position: relative;
    z-index: 10;
  }

  .dv-decoration-6 {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    opacity: 0.3;
  }
}

:deep(.border) {
  width: 30%;

  polyline {
    stroke: aqua;
  }

  &.right {
    display: flex;
    justify-content: end;
  }
}
</style>
