import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
// 将自动注册所有组件为全局组件
import DataVVue3 from '@kjgl77/datav-vue3'

// DataV组件

// 清楚默认样式
import '@/styles/base.css'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(DataVVue3)

app.mount('#app')
