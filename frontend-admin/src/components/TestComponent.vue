<script setup lang="ts">
const props = defineProps<{
  btnClick: (id: number | string) => void
}>()
</script>

<template>
  <el-button
    type="primary"
    @click="props.btnClick(1211113)"
  >
    点击
  </el-button>
</template>

<style scoped lang="scss"></style>
