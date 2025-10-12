import type { Directive } from 'vue'

const vLoading: Directive = {
  mounted(el, binding) {
    toggleLoader(el, binding.value)
  },
  updated(el, binding) {
    console.log(binding.value)
    toggleLoader(el, binding.value)
  }
}

// 抽取的函数
function toggleLoader(el: HTMLElement, show: boolean) {
  const loader = el.querySelector('.v-loading') as HTMLElement
  if (show) {
    if (!loader) {
      const newLoader = document.createElement('div')
      newLoader.className = 'v-loading'
      newLoader.innerHTML = `
        <div class="cssloader">
          <div class="triangle1"></div>
          <div class="triangle2"></div>
          <p class="text">loading...</p>
        </div>
      `
      el.appendChild(newLoader)
    }
  } else {
    if (loader) loader.remove()
  }
}

export default vLoading
