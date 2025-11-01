import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useRouter } from 'vue-router'

export const useUserStore = defineStore('user', () => {
  const userInfo = ref()
  const token = ref(undefined)
  const setUserInfo = (data) => {
    userInfo.value = data
    token.value = userInfo.value.token
  }

  const router = useRouter()
  const clearUserInfo = () => {
    userInfo.value = {}
    token.value = userInfo.value?.token
    router.push({ name: 'login' })
  }

  return {
    userInfo,
    token,
    setUserInfo,
    clearUserInfo
  }
}, {
  persist: {
    key: '__wuyue-warehouse-user-token__',
    pick: ['token']
  }
})
