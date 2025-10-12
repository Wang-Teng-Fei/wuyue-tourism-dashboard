import type { App } from 'vue'
import vLoading from './v-loading-wuyue'

export default {
  install(app: App) {
    app.directive('loading-wuyue', vLoading)
  }
}
