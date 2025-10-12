// 使用泛型 T 扩展 Record<string, unknown> 来表示数据项
export interface DataItem extends Record<string, unknown> {
  id: number
  editItem?: boolean
}

export interface DataList<T extends DataItem> {
  data: T[]
  current_page?: number | string
  total?: number | string
  per_page?: number | string
}
