import { useUserStore } from '@/stores/userStore'
import { createRouter, createWebHistory } from 'vue-router'
import dashboard from '@/assets/icons/dashboard.svg'
import flyline from '@/assets/icons/flyline.svg'
import list from '@/assets/icons/list.svg'
import centerPoint from '@/assets/icons/center-point.svg'
import mountain from '@/assets/icons/mountain.svg'
import mountainHeight from '@/assets/icons/mountain-height.svg'
import touristCount from '@/assets/icons/tourist-count.svg'
import income from '@/assets/icons/income.svg'
import vegetationCoverage from '@/assets/icons/vegetation-coverage.svg'
import visualizationConfig from '@/assets/icons/visualization-config.svg'
import admin from '@/assets/icons/admin.svg'
import { ElMessage } from 'element-plus'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/admin',
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/Login/index.vue'),
    },
    {
      path: '/admin',
      name: 'layout',
      redirect: '/admin/dashboard',
      component: () => import('@/views/Layout/index.vue'),
      children: [
        {
          path: 'dashboard',
          name: 'dashboard',
          component: () => import('@/views/Dashboard/index.vue'),
          meta: {
            title: '仪表盘',
            icon: dashboard,
          },
        },
        {
          path: 'flyline',
          name: 'flyline',
          meta: {
            title: '飞线管理',
            icon: flyline,
          },
          redirect: '/admin/flyline/list',
          children: [
            {
              path: 'list',
              name: 'flyline-list',
              component: () => import('@/views/Flyline/index.vue'),
              meta: {
                title: '飞线图列表',
                icon: list,
              },
            },
            {
              path: 'center-points',
              name: 'flyline-center-points',
              component: () => import('@/views/Flyline/FlylineCenterPoints/index.vue'),
              meta: {
                title: '飞线图中心点',
                icon: centerPoint,
              },
            },
          ],
        },
        {
          path: 'mountain',
          name: 'mountain',
          component: () => import('@/views/Mountain/index.vue'),
          meta: {
            title: '山脉',
            icon: mountain,
          },
        },
        {
          path: 'tourist-count',
          name: 'tourist-count',
          component: () => import('@/views/TouristCount/index.vue'),
          meta: {
            title: '游客数量',
            icon: touristCount,
          },
        },
        {
          path: 'income',
          name: 'income',
          component: () => import('@/views/Income/index.vue'),
          meta: {
            title: '收入',
            icon: income,
          },
        },
        {
          path: 'mountain-height',
          name: 'mountain-height',
          component: () => import('@/views/MountainHeight/index.vue'),
          meta: {
            title: '山脉高度',
            icon: mountainHeight,
          },
        },
        {
          path: 'vegetation-coverage',
          name: 'vegetation-coverage',
          component: () => import('@/views/VegetationCoverage/index.vue'),
          meta: {
            title: '植被覆盖率',
            icon: vegetationCoverage,
          },
        },
        {
          path: 'visualization-config',
          name: 'visualization-config',
          component: () => import('@/views/VisualizationConfig/index.vue'),
          meta: {
            title: '可视化配置项',
            icon: visualizationConfig,
          },
        },
        {
          path: 'super-admin',
          name: 'super-admin',
          component: () => import('@/views/Admin/index.vue'),
          meta: {
            title: '管理员',
            icon: admin,
          },
        },
      ],
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'NotFound',
      component: () => import('@/views/NotFound/index.vue'),
    },
  ],
})

export default router

router.beforeEach(async (to) => {
  const userStore = useUserStore()
  const token = userStore.token

  // 登录页面重定向
  if (to.name === 'login' && token) {
    return { name: 'layout' }
  }

  // 未登录重定向到登录页
  if ((to.name === 'layout' || to.matched[0]?.name === 'layout') && !token) {
    return { name: 'login' }
  }

  // 超级管理员路由权限验证
  if (to.path.includes('/admin/super-admin') || to.name === 'super-admin') {
    if (!token) {
      return { name: 'login' }
    }

    // 检查用户角色
    const userInfo = userStore.userInfo
    if (!userInfo || userInfo.role !== 'super') {
      router.back()
    }
  }

  return true
})
