<script setup>
import { computed, ref } from 'vue'
import { useUserStore } from '@/stores/userStore'
defineOptions({
  name: 'DashboardComponent',
})

// 四条欢迎语
const messages = [
  '欢迎来到数据仪表盘 🚀',
  '今日的工作，从这里开始 ✨',
  '数据让决策更智慧 📊',
  '你好！准备好探索数据了吗？🔍',
]

// 随机选择一条显示
const welcomeMessage = ref(messages[Math.floor(Math.random() * messages.length)])

// 仪表盘介绍文字
const introduction = ref(
  '本系统是基于大数据的可视化管理平台，帮助您实时监控和分析各类数据。通过图表、统计指标和互动界面，让数据变得直观易懂，支持智能决策和业务优化。',
)

const userStore = useUserStore()
const name = computed(() => userStore.userInfo?.name)
</script>

<template>
  <div class="dashboard">
    <!-- 欢迎语 -->
    <div class="welcome-section">
      <h1 class="welcome-administrator">
        欢迎回来，
        <span class="name">{{ name }}</span>
        ！
      </h1>
      <div class="welcome-card">
        <h2>{{ welcomeMessage }}</h2>
        <p>{{ introduction }}</p>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.dashboard {
  padding: 30px 5%;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  color: #333;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  gap: 40px;
}

/* 欢迎部分 */
.welcome-section {
  display: flex;
  flex-direction: column;
  gap: 20px;
  width: 100%;
  max-width: 900px;
}

// :root {
//   .welcome-administrator {
//     .name {
//       color: var(--primary-color);
//       text-shadow: 2px 2px 0 var(--sub-text-color);
//     }
//   }
// }

// :root.dark {
//   .welcome-administrator {
//     .name {
//       color: var(--text-color);
//       text-shadow: 2px 2px 0 var(--primary-color);
//     }
//   }
// }

.welcome-administrator {
  padding-left: 40px;
  font-size: 40px;
  font-weight: 600;
  color: var(--text-color);

  .name {
    color: var(--primary-color);
    text-shadow: 2px 2px 2px var(--sub-text-color);
  }
}

/* 欢迎卡 */
.welcome-card {
  width: 100%;
  background: var(--card-bg-color);
  color: var(--text-color);
  border-radius: 24px;
  padding: 40px 50px;
  transition:
    transform 0.3s ease,
    box-shadow 0.3s ease;

  &:hover {
    transform: translateY(-5px);
  }

  h2 {
    font-size: 2.2rem;
    margin-bottom: 15px;
    font-weight: 700;
  }

  p {
    font-size: 1.1rem;
    line-height: 1.6;
  }
}

/* 核心数据标题 */
.stats-title {
  font-size: 1.6rem;
  font-weight: 600;
  margin-bottom: 20px;
  color: #444;
}
</style>
