import axios from 'axios'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/stores/userStore'

const baseURL = 'http://www.wuyue-tourism-dashboard.com'

const request = axios.create({
  baseURL: baseURL,
  timeout: 10000,
})

// 请求拦截器
request.interceptors.request.use(
  (config) => {
    const userStore = useUserStore()
    const token = userStore.token
    if (token) config.headers.Authorization = `Bearer ${token}`
    return config
  },
  (error) => {
    return Promise.reject(error)
  },
)

// 响应拦截器
request.interceptors.response.use(
  (response) => {
    return response.data
  },
  (error) => {
    const userStore = useUserStore()
    let msg = '请求失败'

    const data = error.response?.data

    if (data) {
      if (typeof data === 'string') {
        msg = data
      } else if (Array.isArray(data?.msg) && data?.msg.length > 0) {
        // 如果返回数组，取第一个元素
        msg = String(data?.msg[0])
      } else if (typeof data === 'object') {
        // 对象类型，优先 msg 字段
        msg = 'msg' in data ? String(data.msg) : JSON.stringify(data)
      }
    }

    // 打印调试
    // console.log(msg)

    // 安全调用 ElMessage
    ElMessage.error(msg)

    if (msg === '管理员不存在' || msg === '账号被封禁') {
      userStore.clearUserInfo()
    }

    return Promise.reject(error)
  },
)

export { baseURL }
export default request
