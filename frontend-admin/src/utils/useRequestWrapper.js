// utils/useRequestWrapper.js
/**
 * 局部请求锁
 * 同一个组件内，同一个 API（相同 key）只允许一次请求
 * 支持：
 * 1️⃣ 传函数名：runRequest(getFlylineChartsList)
 * 2️⃣ 传箭头函数：runRequest(() => getFlylineChartsList())
 * 3️⃣ 自定义 key：runRequest(() => getFlylineChartsList(), 'myKey')
 */
const loadingMap = new Map()

/**
 * 尝试从箭头函数中解析出被调用的函数名
 */
function extractFunctionName(fn) {
  const fnStr = fn.toString().trim()
  // 匹配箭头函数体：() => funcName(...) 或 () => funcName
  const match = fnStr.match(/^\(?\s*.*\s*\)?\s*=>\s*([\w$]+)/)
  return match ? match[1] : null
}

/**
 * 执行请求函数，并用局部锁防止重复调用
 * @param requestFn 请求函数
 * @param key 可选 key，如果未传会自动使用函数名或箭头函数解析名
 */
const runRequest = async (requestFn, key) => {
  // 自动识别 key：传入 key > 函数名 > 箭头函数解析 > Symbol
  const finalKey =
    key || requestFn.name || extractFunctionName(requestFn) || String(Symbol('anonymous_request'))

  // 防止同一个 API 重复调用
  if (loadingMap.get(finalKey)) return

  loadingMap.set(finalKey, true)

  try {
    const res = await requestFn()
    return res
  } finally {
    loadingMap.set(finalKey, false)
  }
}

export default runRequest
