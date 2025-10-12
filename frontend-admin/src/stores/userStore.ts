import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useRouter } from 'vue-router'
import type { UserInfo } from '@/types/user'

export const useUserStore = defineStore('user', () => {
  const userInfo = ref<UserInfo>()
  const token = ref<string | undefined>(undefined)
  const setUserInfo = (data: UserInfo) => {
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
