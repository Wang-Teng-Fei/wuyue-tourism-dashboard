import request from '@/utils/request'
import { storeToRefs } from 'pinia'
import { usePaginationStore } from '@/stores/pagination'
const { page, perPage } = storeToRefs(usePaginationStore())

// 登录
export const loginAdmin = (data) => {
  return request.post('/api/admin/login', data)
}

// 退出登陆
export const logoutAdmin = () => {
  return request.post('/api/admin/logout')
}

// 获取管理员个人信息
export const getAdmonInfo = () => {
  return request.get('/api/admin')
}

// 更新管理员个人信息
export const updateAdmonInfo = (data) => {
  return request.post('/api/admin/update-profile', data, {
    params: {
      _method: 'PATCH',
    },
  })
}

/**
 * 超级管理员
 */
// 获取所有管理员信息列表（仅超级管理员可用）
export const getAdminsInfoList = (pageNum = page.value, pageSize = perPage.value) => {
  return request.get('/api/admin/super/all', {
    params: {
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 获取所有管理员信息列表（仅超级管理员可用）
export const searchAdminsInfoList = (
  role,
  email,
  pageNum = page.value,
  pageSize = perPage.value,
) => {
  return request.get('/api/admin/super/search/admins', {
    params: {
      role,
      email,
      page: pageNum,
      per_page: pageSize,
    },
  })
}

// 单个管理员信息详情（仅超级管理员可用）
export const getAdminsInfoDetail = (admin_id) => {
  return request.get(`/api/admin/super/${admin_id}`)
}

// 新增管理员
export const addAdmin = (data) => {
  return request.post(`/api/admin/super/add`, data)
}

// 更新管理员
export const updateAdmin = (admin_id, data) => {
  return request.post(`/api/admin/super/${admin_id}/update`, data, {
    params: {
      _method: 'PATCH',
    },
  })
}

// 更新管理员密码
export const changeAdminPassword = (admin_id, data) => {
  return request.patch(`/api/admin/super/${admin_id}/change-password`, data)
}

// 删除管理员
export const deleteAdmin = (admin_id) => {
  return request.delete(`/api/admin/super/${admin_id}/delete`)
}
