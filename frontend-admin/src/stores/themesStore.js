import { ref } from 'vue'
import { defineStore } from 'pinia'

export const useThemesStore = defineStore(
  'themes',
  () => {
    const theme = ref(false)

    let isRunning = false

    const toggleTheme = (isTheme, mouseX, mouseY) => {
      if (!document?.startViewTransition) {
        if (isTheme) {
          document.documentElement.classList.add('dark')
          theme.value = true
        } else {
          document.documentElement.classList.remove('dark')
          theme.value = false
        }

        return
      }

      if (isRunning) return
      isRunning = true

      // 安全计算百分比位置
      const vw = window.innerWidth || 1
      const vh = window.innerHeight || 1
      const xPercent = Math.min(Math.max((mouseX / vw) * 100, 0), 100)
      const yPercent = Math.min(Math.max((mouseY / vh) * 100, 0), 100)

      // 抽离设置 clip-path 的逻辑
      const setClipPath = (oldSize, newSize) => {
        document.documentElement.style.setProperty(
          '--clip-path-old',
          `circle(${oldSize} at ${xPercent}% ${yPercent}%)`,
        )
        document.documentElement.style.setProperty(
          '--clip-path-new',
          `circle(${newSize} at ${xPercent}% ${yPercent}%)`,
        )
      }

      // 设置初始/目标 clip-path
      setClipPath('0%', '141.4%')

      const transition = document.startViewTransition(() => {
        if (isTheme) {
          document.documentElement.classList.add('dark')
          theme.value = true
        } else {
          document.documentElement.classList.remove('dark')
          theme.value = false
        }
      })

      transition.finished.finally(() => {
        isRunning = false
      })
    }
    const initTheme = () => {
      const raw = localStorage.getItem('__wuyue-warehouse-theme__')
      const local_theme = raw ? JSON.parse(raw)?.theme : null

      // 如果有本地的主题，就用本地的，没有则跟随系统主题
      const isDark = local_theme ?? window.matchMedia('(prefers-color-scheme: dark)').matches

      if (isDark) {
        document.documentElement.classList.add('dark')
        theme.value = true
      } else {
        document.documentElement.classList.remove('dark')
        theme.value = false
      }
    }

    return {
      theme,
      toggleTheme,
      initTheme,
    }
  },
  {
    persist: {
      key: '__wuyue-warehouse-theme__',
    },
  },
)
