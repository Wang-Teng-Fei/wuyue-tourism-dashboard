<script setup>
import { ref, computed, watchEffect, defineProps } from 'vue';
import { useTransition } from '@vueuse/core'

const props = defineProps({
  visualizationData: {
    type: Object,
    required: true,
    default: () => ({})
  }
})
const config_json = props.visualizationData.config_json

const monthlyStats = computed(() => props.visualizationData.monthlyStats || [])

// 计算旅游人数
const touristNumber = computed(() => monthlyStats.value.map(item => item.mountain_monthly_stats.reduce((a, b) => a + +b.tourist_count, 0)).reduce((a, b) => a + b, 0) || 0)

// 计算收入
const income = computed(() => monthlyStats.value.map(item => item.mountain_monthly_stats.reduce((a, b) => a + +b.income, 0)).reduce((a, b) => a + b, 0) || 0)

// people
const people = ref(0)
const peopleValue = useTransition(people, {
  duration: config_json.echartsAnimationTime,
})

// money
const money = ref(0)
const moneyValue = useTransition(money, {
  duration: config_json.echartsAnimationTime,
})

watchEffect(() => {
  people.value = touristNumber.value
  money.value = income.value
})
</script>

<template>
  <dv-border-box8 :dur="5" class="total-number">
    <ul class="total-count">
      <li>
        <h2>旅游人数总数</h2>
        <div>{{ (peopleValue / 10000).toFixed(2) + '万' }}</div>
      </li>
      <li>
        <h2>景区收入总数</h2>
        <div>{{ (moneyValue / 100000000).toFixed(2) + '亿' }}</div>
      </li>
    </ul>
  </dv-border-box8>
</template>

<style scoped lang="less">
.total-count {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  width: 100%;
  height: 100%;
  color: #fff;

  h2 {
    padding: 5px 50px;
    background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(0, 153, 255, 0.733) 20%, rgba(0, 153, 255, 0.733) 80%, rgba(255, 255, 255, 0) 100%);
  }

  div {
    margin-top: 20px;
    font-size: 30px;
    font-weight: 700;
    text-align: center;
  }
}
</style>
