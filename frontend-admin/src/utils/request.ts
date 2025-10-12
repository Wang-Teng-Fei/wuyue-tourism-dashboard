import axios from 'axios'
import type { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from 'axios'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/stores/userStore'

interface ErrorResponse {
  msg: string
}

const baseURL: string = 'http://www.wuyue-tourism-dashboard.com'

const request = axios.create({
  baseURL: baseURL,
  timeout: 10000,
})

// 请求拦截器
request.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const userStore = useUserStore()
    const token = userStore.token
    if (token) config.headers.Authorization = `Bearer ${token}`
    return config
  },
  (error: AxiosError) => {
    return Promise.reject(error)
  },
)

// 响应拦截器
request.interceptors.response.use(
  (response: AxiosResponse) => {
    return response.data
  },
  (error: AxiosError) => {
    const userStore = useUserStore()
    let msg = '请求失败'

    const data = error.response?.data

    if (data) {
      if (typeof data === 'string') {
        msg = data
      } else if (Array.isArray(data) && data.length > 0) {
        // 如果返回数组，取第一个元素
        msg = String(data[0])
      } else if (typeof data === 'object') {
        // 对象类型，优先 msg 字段
        msg = 'msg' in data ? String((data as ErrorResponse).msg) : JSON.stringify(data)
      }
    }

    // 打印调试
    // console.log(msg)

    // 安全调用 ElMessage
    ElMessage.error(msg)

    if (msg === '管理员不存在') {
      userStore.clearUserInfo()
    }

    return Promise.reject(error)
  },
)

export { baseURL }
export default request
