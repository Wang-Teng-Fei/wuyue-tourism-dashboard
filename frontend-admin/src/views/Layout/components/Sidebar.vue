<script setup>
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/userStore'

defineOptions({
  name: 'LayoutSidebar',
})

const router = useRouter()
const userStore = useUserStore()

// 从 router 获取 layout 子路由
const layoutRoute = router.options.routes.find((r) => r.name === 'layout')
const menuRoutes =
  layoutRoute?.children
    ?.filter((item) => {
      if (userStore.userInfo?.role !== 'super') {
        return item.name !== 'super-admin'
      } else {
        return item
      }
    }) // 先过滤
    ?.map((item) => {
      const newItem = { ...item }
      newItem.index = item.name
      if (item.children) {
        newItem.children = item.children.map((child) => ({
          ...child,
          index: child.name,
        }))
      }
      return newItem
    }) || []

function handleMenuSelect(index) {
  // 点击菜单，通过 name 跳转
  router.push({ name: index })
}
</script>

<template>
  <div
    class="sidebar"
    v-loading
  >
    <div class="logo">
      <img
        src="@/assets/logo.png"
        alt=""
      />
      <h1>五岳智游数据可视化</h1>
    </div>
    <nav>
      <el-row class="tac">
        <el-col>
          <el-menu
            :default-active="$route.name"
            class="el-menu-vertical-demo"
            @select="handleMenuSelect"
          >
            <template
              v-for="item in menuRoutes"
              :key="item.index"
            >
              <!-- 有子菜单 -->
              <el-sub-menu
                v-if="item.children"
                :index="item.index"
              >
                <template #title>
                  <component
                    :is="item.meta?.icon"
                    class="menu-icon"
                  />
                  <span>{{ item.meta?.title }}</span>
                </template>
                <el-menu-item
                  v-for="child in item.children"
                  :key="child.index"
                  :index="child.index"
                >
                  <component
                    :is="child.meta?.icon"
                    class="menu-icon"
                  />
                  {{ child.meta?.title }}
                </el-menu-item>
              </el-sub-menu>

              <!-- 没有子菜单 -->
              <el-menu-item
                v-else
                :index="item.index"
              >
                <component
                  :is="item.meta?.icon"
                  class="menu-icon"
                />
                {{ item.meta?.title }}
              </el-menu-item>
            </template>
          </el-menu>
        </el-col>
      </el-row>
    </nav>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.sidebar {
  padding-top: 1px;
  flex-shrink: 0;
  width: 100%;
  height: 100%;
  background-color: var(--card-bg-color);
  border-right: 1px solid var(--border-color);

  .logo {
    margin-top: 15px;
    padding: 0 15px;
    display: flex;
    justify-content: start;
    align-items: center;
    height: 60px;

    img {
      margin-right: 10px;
      height: 70%;
    }

    h1 {
      font-size: 18px;
      font-family: '寒蝉半圆';
      letter-spacing: 1px;
    }
  }

  nav {
    width: 100%;

    :deep(.tac) {
      width: 100%;
      max-height: calc(100dvh - 100px);
      overflow-y: scroll;

      &::-webkit-scrollbar {
        width: 5px;
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

      .el-menu {
        padding: 20px 15px 0 15px;
        border-right: none;
        color: var(--text-color);
        background-color: transparent;

        .menu-icon {
          margin-right: 20px;
          width: 20px;
          stroke: var(--sub-text-color) !important;
          fill: var(--sub-text-color) !important;
          stroke-width: 40px !important;
          stroke-dasharray: 0, 600px;
          stroke-linecap: round !important;
          vertical-align: middle !important;
          animation: menu-icon 2s forwards;

          * {
            fill: transparent;
            animation: menu-icon-box 2s forwards 2s;
          }
        }

        @keyframes menu-icon {
          0% {
            fill: var(--text-color) !important;
            stroke-dasharray: 0, 600px;
          }

          100% {
            stroke-dasharray: 600px, 0;
            fill: var(--sub-text-color);
          }
        }

        @keyframes menu-icon-box {
          0% {
            fill: transparent;
          }

          100% {
            fill: var(--sub-text-color);
          }
        }

        .el-menu-item,
        .el-sub-menu__title {
          font-size: $font-size-lg;
          border-radius: $border-radius-md;
          overflow: hidden;
          transition: all $transition-fast;

          &:active {
            transition: all $transition-btn-active;
            transform: translateY(3px);
            transform: scale(0.95);
            box-shadow: 0 0px 5px var(--shadow-color) inset;
          }

          &:hover {
            background-color: var(--card-bg-color-inner);
            color: var(--primary-color);
          }
        }

        .el-menu-item.is-active,
        .el-sub-menu.is-active .el-sub-menu__title {
          color: var(--primary-color);
          transform: translateY(-3px);
          box-shadow: 0 2px 5px var(--shadow-color);
          background-color: var(--card-bg-color);
        }

        .el-sub-menu.is-active .el-sub-menu__title span {
          color: var(--primary-color);
        }

        .el-sub-menu.is-active.is-opened .el-sub-menu__title {
          transform: translateY(0);
          box-shadow: none;
          background-color: transparent;
        }

        &.el-menu--inline {
          padding: 0;
        }

        * {
          color: var(--text-color);
          background-color: transparent;
        }

        .el-sub-menu {
          .el-menu-item {
            font-size: $font-size-base;
          }

          .el-sub-menu__icon-arrow {
            transform: translateY(-2px);
            font-size: 18px;
          }
        }
      }

      .el-col {
        width: 100%;
        border-right: none;
      }
    }
  }
}
</style>
