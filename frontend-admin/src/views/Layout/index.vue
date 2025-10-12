<script setup lang="ts">
import Sidebar from '@/views/Layout/components/Sidebar.vue'
import Header from '@/views/Layout/components/Header.vue'
import { getAdmonInfo } from '@/api/admin'
import { useUserStore } from '@/stores/userStore'
import { ref } from 'vue'
defineOptions({
  name: 'LayoutComponents',
})

const userStore = useUserStore()
const userInfoBool = ref(true)
// 获取个人信息
const adminInfo = async () => {
  const res = await getAdmonInfo()
  userStore.setUserInfo(res.data)
  userInfoBool.value = false
}
adminInfo()
</script>

<template>
  <!-- 最外层容器，固定存在 -->
  <div
    class="layout-wrapper"
    v-loading-wuyue="userInfoBool"
  >
    <div
      v-if="userStore.userInfo"
      class="layout"
    >
      <!-- 侧边栏 -->
      <aside class="layout-sidebar">
        <Sidebar />
      </aside>

      <!-- 主区域 -->
      <div class="layout-main">
        <header class="layout-header">
          <Header />
        </header>

        <main class="layout-content">
          <div class="content-panel">
            <Transition name="fade">
              <router-view />
            </Transition>
          </div>
        </main>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.layout-wrapper {
  position: relative;
  width: 100%;
  height: 100vh;
  overflow: hidden;

  .layout {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 100%;

    .layout-sidebar {
      flex-shrink: 0;
      width: 280px;
      height: 100%;
    }

    .layout-main {
      padding: 15px;
      width: 100%;
      height: 100%;

      .layout-header {
        position: relative;
        width: 100%;
        height: 60px;
        border-radius: $border-radius-md;
        z-index: 10;
      }

      .layout-content {
        position: relative;
        padding: 10px;
        margin: 0 auto;
        margin-top: 30px;
        width: calc(100dvw - 350px);
        height: calc(100dvh - 120px);
        overflow: auto;
        z-index: 0;

        &::-webkit-scrollbar {
          width: 5px;
          height: 5px;
          background-color: var(--card-bg-color-inner);
        }

        &::-webkit-scrollbar-thumb {
          background-color: var(--border-color);
          border-radius: 100px;
        }

        &::-webkit-scrollbar-track {
          background-color: var(--card-bg-color-inner);
          border-radius: 100px;
        }

        .content-panel {
          width: 100%;
          max-width: 1800px;
          min-width: 600px;
          margin: 0 auto;
        }
      }
    }
  }
}

.fade-enter-active,
.fade-leave-active {
  // transition: all 0.5s ease;
  animation: active 1.5s forwards;
}

@keyframes active {
  0% {
    transform: translateY(15%);
    opacity: 0;
  }

  50% {
    transform: translateY(0%);
  }

  100% {
    opacity: 1;
  }
}

// .fade-enter-from,
// .fade-leave-to {
//   transform: translateX(25%);
//   opacity: 0;
// }

// .fade-enter-to,
// .fade-leave-from {
//   transform: translateX(0%);
//   opacity: 1;
// }
</style>
