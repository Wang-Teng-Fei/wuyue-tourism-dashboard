import { createApp } from 'vue'
import { createPinia } from 'pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import { useThemesStore } from './stores/themesStore'
import Directives from './directives/index'

import 'element-plus/dist/index.css' // if you just want to import css
import 'element-plus/theme-chalk/dark/css-vars.css'
import '@/styles/main.scss'
// import '@/assets/iconfonts/iconfont.css'

import App from './App.vue'
import router from './router'
const app = createApp(App)

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)

app.use(pinia)
app.use(router)
app.use(Directives)

// 提前初始化主题（必须在 app.mount 之前）
const themesStore = useThemesStore()
themesStore.initTheme()
// document.documentElement.classList.add('el-theme-dark')
app.mount('#app')
