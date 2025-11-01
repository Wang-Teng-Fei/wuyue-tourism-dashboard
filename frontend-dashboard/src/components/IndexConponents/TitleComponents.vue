<script setup>
import { ref, computed, onMounted, onUnmounted, defineProps, toRef } from "vue";

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({}),
  },
});

// 标题
const title = computed(() => props.visualizationData.config_json.title);

const config_json = props.visualizationData.config_json;

const year = ref(props.visualizationData.year);
</script>

<template>
  <dv-decoration8
    :color="['aqua', 'aqua']"
    class="border"
  />
  <span class="t">
    <span>{{ title }}</span>
    <dv-decoration6 :color="config_json.borderColor" />
  </span>
  <span class="year">日期：{{ year }}</span>
  <!-- <dv-decoration5 class="border" :dur="3" style=""></dv-decoration5> -->
  <dv-decoration8
    :color="['aqua', 'aqua']"
    class="border right"
    :reverse="true"
  />
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

span.year {
  position: absolute;
  right: 5%;
  top: 0%;
  font-size: 20px;
  transform: translateX(-100%);
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
