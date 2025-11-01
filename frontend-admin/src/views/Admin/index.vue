<script setup>
import { reactive, ref, watch } from 'vue'
import {
  searchAdminsInfoList,
  getAdminsInfoDetail,
  addAdmin,
  updateAdmin,
  changeAdminPassword,
  deleteAdmin,
} from '@/api/admin'
import { ElMessage } from 'element-plus'
import runRequest from '@/utils/useRequestWrapper'
import { usePaginationStore } from '@/stores/pagination'
import { storeToRefs } from 'pinia'
import { useUserStore } from '@/stores/userStore'
import LayoutDataTableWrapper from '@/components/LayoutDataTableWrapper.vue'
import { Plus } from '@element-plus/icons-vue'

defineOptions({
  name: 'AdminManagement',
})

const userStore = useUserStore()

const layoutDataTableWrapperRef = ref()

const paginationStore = usePaginationStore()
const { perPage, page } = storeToRefs(paginationStore)
const currentPage = ref(page.value) // 记录当前页码

const adminList = ref({
  data: [],
})
const isLoading = ref(true)
const addDialogVisible = ref(false)
const detailDialogVisible = ref(false)

const searchData = ref({
  role: '',
  email: '',
})

// 为数据项添加 editItem 属性
watch(
  () => adminList.value.data,
  (newList) => {
    if (!Array.isArray(newList)) return
    newList.forEach((item) => {
      if (item && typeof item === 'object' && !('editItem' in item)) {
        item.avatarFile = null
      }
    })
  },
  { deep: true, immediate: true },
)

// 搜索
const handleSearch = async (pageNum = currentPage.value, pageSize = perPage.value) => {
  isLoading.value = true
  try {
    // 使用搜索接口
    const res = await runRequest(() =>
      searchAdminsInfoList(searchData.value.role, searchData.value.email, pageNum, pageSize),
    )

    if (res) {
      adminList.value = res.data
      currentPage.value = Number(res.data.current_page) || pageNum
    }
  } finally {
    isLoading.value = false
  }
}

handleSearch(page.value, perPage.value)

// 新增表单验证
const addRuleFormRef = ref()
const addRuleForm = reactive({
  name: '',
  email: '',
  password: '',
  role: 'admin',
  status: 1,
  avatar: '',
})

const addRules = reactive({
  avatar: [
    {
      required: true,
      message: '头像不可为空',
      trigger: 'blur',
    },
    {
      validator: (rule, value, callback) => {
        if (!value) {
          callback('头像不可为空')
        } else if (!(value instanceof File)) {
          callback('必须上传图片文件')
        }
        callback()
      },
      trigger: 'change',
    },
  ],
  name: [
    {
      required: true,
      message: '管理员名称不可为空',
      trigger: 'blur',
    },
  ],
  email: [
    {
      required: true,
      message: '邮箱不可为空',
      trigger: 'blur',
    },
    {
      type: 'email',
      message: '请输入正确的邮箱格式',
      trigger: 'blur',
    },
  ],
  password: [
    {
      required: true,
      message: '密码不可为空',
      trigger: 'blur',
    },
    {
      min: 6,
      message: '密码长度不能少于6位',
      trigger: 'blur',
    },
  ],
  role: [
    {
      required: true,
      message: '角色不可为空',
      trigger: 'change',
    },
  ],
  status: [
    {
      required: true,
      message: '状态不可为空',
      trigger: 'change',
    },
  ],
})

// 头像
// 默认头像
const default_avatar = new URL('@/assets/default_avatar.png', import.meta.url).href

// ✅ 正确：计算属性基于其他响应式数据
const img_preview = ref('') // 实际存储值的响应式变量

//
const handleAdd = (bool) => {
  Object.assign(addRuleForm, {
    name: '',
    email: '',
    password: '',
    role: 'admin',
    status: 1,
    avatar: '',
  })
  addDialogVisible.value = bool
}

// 头像上传处理
const avatarFile = (event) => {
  const target = event.target
  const files = target.files

  if (!files || files.length === 0) {
    console.log('未选择文件')
    return
  }

  const file = files[0]

  // 保存文件对象到 FormData 需要的格式
  addRuleForm.avatar = file

  // 预览图片
  const reader = new FileReader()
  reader.onload = (e) => {
    const result = e.target?.result
    img_preview.value = result
  }
  reader.readAsDataURL(file)

  // 清空 input 值，允许重复选择同一文件
  target.value = ''
}

// 新增
const addAdminData = async (addFormEl) => {
  if (!addFormEl) return
  await addFormEl.validate(async (valid) => {
    if (valid) {
      isLoading.value = true

      // 创建 FormData 对象
      const formData = new FormData()

      // 添加文本字段
      formData.append('name', addRuleForm.name)
      formData.append('email', addRuleForm.email)
      formData.append('password', addRuleForm.password)
      formData.append('role', addRuleForm.role)
      formData.append('status', addRuleForm.status.toString())

      // 如果有头像文件，添加到 FormData
      if (addRuleForm.avatar instanceof File) {
        formData.append('avatar', addRuleForm.avatar)
      } else if (addRuleForm.avatar) {
        // 如果是字符串（URL），也添加
        formData.append('avatar', addRuleForm.avatar)
      }

      // 使用 FormData 调用 API
      const res = await runRequest(() => addAdmin(formData))

      if (res) {
        // 直接重新获取第一页数据来更新分页信息
        await handleSearch(1)

        // 使用更新后的分页信息跳转到最后一页
        const lastPage = Number(adminList.value.last_page) || 1

        await handleSearch(lastPage)

        ElMessage.success('新增管理员成功')
        handleAdd(false)

        // 重置表单
        addFormEl.resetFields()
        Object.assign(addRuleForm, {
          name: '',
          email: '',
          password: '',
          role: 'admin',
          status: 1,
          avatar: '',
        })
        img_preview.value = default_avatar
      }
    }
  })
}

// 编辑的头像处理
const updateAvatarFile = (row, index) => {
  const event = window.event
  const target = event.target
  const files = target.files

  if (!files || files.length === 0) {
    console.log('未选择文件')
    return
  }

  const file = files[0]

  // 验证文件类型
  if (!file.type.startsWith('image/')) {
    ElMessage.error('请选择图片文件')
    return
  }

  // 验证文件大小（例如限制为 10MB）
  if (file.size > 10 * 1024 * 1024) {
    ElMessage.error('图片大小不能超过 10MB')
    return
  }
  adminList.value.data[index].avatarFile = file

  // 使用 FileReader 读取文件
  const reader = new FileReader()
  reader.onload = (e) => {
    const result = e.target?.result
    if (result) {
      // 更新行的 avatar 属性
      row.avatar = result
      adminList.value.data[index].avatar = result
      // 如果需要立即保存到后端，可以调用更新接口
      // updateAdminAvatar(row)
    }
  }

  reader.onerror = () => {
    ElMessage.error('图片读取失败')
  }

  reader.readAsDataURL(file) // 读取为 Data URL

  // 清空 input，允许重复选择同一文件
  target.value = ''
}

// 编辑
const updateAdminData = async (data, index, onSuccess) => {
  const formData = new FormData()
  formData.append('name', data.name)
  formData.append('email', data.email)
  formData.append('role', data.role)
  // 处理 status - 确保是字符串
  if (typeof data.status === 'number') {
    formData.append('status', data.status.toString())
  } else {
    formData.append('status', data.status)
  }

  // 处理 avatarFile - 检查是否存在
  if (data.avatarFile instanceof File) {
    formData.append('avatar', data.avatarFile)
  }

  // 调用 API
  const res = await updateAdmin(data.id, formData)

  if (res) {
    ElMessage.success('更新成功')
    // 判断是否只有一个编辑项
    const editingItems = adminList.value.data.filter((item) => item.editItem === true)
    const hasOnlyOneEditingItem = editingItems.length === 1
    onSuccess?.()
    if (hasOnlyOneEditingItem) {
      // 如果只有一个编辑项，重新加载数据
      await handleSearch(currentPage.value)
    } else {
      adminList.value.data[index].editItem = false
    }
  }
}

// 删除
const deleteAdminData = async (data) => {
  await deleteAdmin(data.id)

  // 删除后保持在当前页
  const currentPageNum = Number(adminList.value.current_page) || page.value
  await handleSearch(currentPageNum)

  ElMessage.success('删除管理员成功')
}

const adminDetailDefault = () => ({
  id: 0,
  name: '',
  email: '',
  role: 'admin',
  status: 1,
  last_login_at: '',
  avatar: '',
})

// 管理员详情
const adminDetail = ref(adminDetailDefault())

// 详情弹窗的显示与关闭
const handleDetailDialogVisible = (value) => {
  // 使用对象解构来重置数据
  setTimeout(() => {
    Object.assign(adminDetail.value, adminDetailDefault())
  }, 200)
  detailDialogVisible.value = value
}

const getAdminDetail = async (admin_id) => {
  handleDetailDialogVisible(true)
  const res = await getAdminsInfoDetail(admin_id)
  console.log()
  Object.assign(adminDetail.value, res.data)
}

// 格式化角色显示
const formatRole = (role) => {
  return role === 'super' ? '超级管理员' : '普通管理员'
}

// 格式化状态显示
const formatStatus = (status) => {
  return status === 1 ? '启用' : '禁用'
}

// 更改密码弹窗控制
const changePasswordVisible = ref(false)

// 更改密码表单
const passwordFormRef = ref()
const passwordForm = reactive({
  new_password: '',
  confirm_password: '',
})

// 更改密码表单验证规则
const passwordRules = reactive({
  new_password: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '新密码长度至少为6位', trigger: 'blur' },
  ],
  confirm_password: [
    { required: true, message: '请输入确认密码', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (value !== passwordForm.new_password) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur',
    },
  ],
})

// 打开/关闭更改密码弹窗
const handleChangePassword = (visible) => {
  if (visible && !adminDetail.value?.name) {
    return ElMessage.warning('没有获取到个人信息')
  }

  changePasswordVisible.value = visible

  if (!visible) {
    Object.assign(passwordForm, {
      new_password: '',
      confirm_password: '',
    })
  }

  passwordFormRef.value?.resetFields()
}

// 提交更改密码
const submitChangePassword = async (admin_id, formEl) => {
  if (!formEl) return
  await formEl.validate(async (valid) => {
    if (valid) {
      await changeAdminPassword(admin_id, passwordForm)
      ElMessage.success('密码更改成功')
      handleChangePassword(false)
    }
  })
}
</script>

<template>
  <div class="admin-management">
    <LayoutDataTableWrapper
      ref="layoutDataTableWrapperRef"
      :dataList="adminList"
      :addDialogVisible="addDialogVisible"
      :isLoading="isLoading"
      addDataDialogTitle="新增游客数量数据"
      @handleAdd="handleAdd"
      @getDataListData="handleSearch"
      @addData="() => addAdminData(addRuleFormRef)"
      @updateData="updateAdminData"
      @deleteData="deleteAdminData"
    >
      <template #toolbarLeft>
        <el-select
          v-model="searchData.role"
          placeholder="选择角色"
          @change="handleSearch(1)"
          clearable
        >
          <el-option
            label="所有角色"
            value=""
          />
          <el-option
            label="普通管理员"
            value="admin"
          />
          <el-option
            label="超级管理员"
            value="super"
          />
        </el-select>
      </template>
      <template #toolbarRight>
        <el-input
          v-model="searchData.email"
          placeholder="请输入邮箱"
          @keyup.enter="handleSearch(1)"
          class="data-table__search"
          clearable
        />
        <el-button
          type="primary"
          class="data-table__btn"
          @click="handleSearch(1)"
        >
          查询
        </el-button>
      </template>
      <template #default>
        <el-table-column
          prop="avatar"
          label="头像"
          width="100"
        >
          <template #default="{ row, $index }">
            <label
              v-if="row.editItem"
              class="avatar"
            >
              <input
                @change="updateAvatarFile(row, $index)"
                type="file"
                name="avatar"
                id=""
              />
              <img
                :src="row.avatar"
                alt=""
              />
            </label>

            <el-avatar
              v-else
              :src="row.avatar"
              :size="40"
              shape="circle"
            />
          </template>
        </el-table-column>
        <el-table-column
          prop="name"
          label="姓名"
          min-width="120"
        >
          <template #default="{ row }">
            <el-input
              v-if="row.editItem"
              v-model="row.name"
              placeholder="姓名"
            />
            <div v-else>
              {{ row.name }}
              <div class="is_oneself">
                {{ row.email === userStore.userInfo?.email ? '( 自己 )' : '' }}
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column
          prop="email"
          label="邮箱"
          min-width="200"
        >
          <template #default="{ row }">
            <el-input
              v-if="row.editItem"
              v-model="row.email"
              placeholder="邮箱"
            />
            <span v-else>
              {{ row.email }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="role"
          label="角色"
          min-width="120"
        >
          <template #default="{ row }">
            <el-select
              v-if="row.editItem"
              v-model="row.role"
              placeholder="选择角色"
            >
              <el-option
                label="普通管理员"
                value="admin"
              />
              <el-option
                label="超级管理员"
                value="super"
              />
            </el-select>
            <span
              v-else
              :class="{ is_super: row.role === 'super' }"
            >
              {{ formatRole(row.role) }}
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="status"
          label="状态"
          min-width="100"
        >
          <template #default="{ row }">
            <el-switch
              v-if="row.editItem"
              v-model="row.status"
              inline-prompt
              active-text="启用"
              inactive-text="禁用"
              :active-value="1"
              :inactive-value="0"
              class="ml-2"
              style="--el-switch-on-color: #13ce66; --el-switch-off-color: #ff4949"
            />
            <span
              v-else
              class="custom-tag"
              :class="row.status === 1 ? 'custom-success' : 'custom-danger'"
            >
              {{ row.status === 1 ? '启用' : '禁用' }}
            </span>
          </template>
        </el-table-column>
      </template>
      <template #operation>
        <el-table-column
          fixed="right"
          width="260px"
          prop="operation"
          class="column-operation"
          label="操作"
        >
          <template #default="{ row, $index }">
            <div
              v-if="row.editItem"
              class="column-operation"
            >
              <el-button
                type="success"
                @click="layoutDataTableWrapperRef?.updateData(row, $index)"
                plain
              >
                确定
              </el-button>
              <el-button
                type="info"
                @click="layoutDataTableWrapperRef?.cancelEdit(row)"
                plain
              >
                取消
              </el-button>
            </div>
            <div
              v-else
              class="column-operation"
            >
              <el-button
                type="primary"
                plain
                @click="layoutDataTableWrapperRef?.handleEditClick(row)"
                v-if="row.email !== userStore.userInfo?.email"
              >
                编辑
              </el-button>
              <el-button
                type="danger"
                plain
                @click="layoutDataTableWrapperRef?.deleteData(row)"
                v-if="row.email !== userStore.userInfo?.email"
              >
                删除
              </el-button>
              <el-button
                type="info"
                plain
                @click="getAdminDetail(row.id)"
              >
                详情
              </el-button>
            </div>
          </template>
        </el-table-column>
      </template>
      <template #addDialog>
        <el-form
          ref="addRuleFormRef"
          style="max-width: 600px"
          :model="addRuleForm"
          :rules="addRules"
          label-width="auto"
          class="add_dialog"
        >
          <el-form-item
            label="头像"
            prop="avatar"
          >
            <label class="avatar">
              <input
                @change="avatarFile($event)"
                type="file"
                name="avatar"
                id=""
              />
              <el-icon v-show="!img_preview">
                <Plus />
              </el-icon>
              <img
                v-show="img_preview"
                :src="img_preview"
                alt=""
              />
            </label>
          </el-form-item>
          <el-form-item
            label="姓名"
            prop="name"
          >
            <el-input v-model="addRuleForm.name" />
          </el-form-item>
          <el-form-item
            label="邮箱"
            prop="email"
          >
            <el-input v-model="addRuleForm.email" />
          </el-form-item>
          <el-form-item
            label="密码"
            prop="password"
          >
            <el-input
              v-model="addRuleForm.password"
              type="password"
              show-password
            />
          </el-form-item>

          <el-row :gutter="50">
            <el-col :span="12">
              <el-form-item
                label="角色"
                prop="role"
              >
                <el-select v-model="addRuleForm.role">
                  <el-option
                    label="普通管理员"
                    value="admin"
                  />
                  <el-option
                    label="超级管理员"
                    value="super"
                  />
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item
                label="状态"
                prop="status"
              >
                <el-select v-model="addRuleForm.status">
                  <el-option
                    label="启用"
                    :value="1"
                  />
                  <el-option
                    label="禁用"
                    :value="0"
                  />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </template>
    </LayoutDataTableWrapper>

    <el-dialog
      v-model="detailDialogVisible"
      append-to-body
      class="admin-detail"
      @close="handleDetailDialogVisible(false)"
    >
      <template #title>
        <h3>管理员详情</h3>
      </template>

      <template #default>
        <div class="admin-detail-main">
          <div class="main-left">
            <el-avatar
              shape="square"
              class="avatar"
              :size="100"
              :src="adminDetail.avatar"
            >
              User
            </el-avatar>
            <el-button
              type="success"
              @click="handleChangePassword(true)"
            >
              更改密码
            </el-button>
          </div>
          <div class="detail-list">
            <ul>
              <li>
                <h4>名字</h4>
                <span class="content">
                  <el-skeleton
                    v-if="!adminDetail.email"
                    :rows="0"
                    style="--el-skeleton-row-height: 20px"
                  />
                  {{ adminDetail.name }}
                </span>
              </li>
              <li>
                <h4>邮箱</h4>
                <span class="content">
                  <el-skeleton
                    v-if="!adminDetail.email"
                    :rows="0"
                    style="--el-skeleton-row-height: 20px"
                  />
                  {{ adminDetail.email }}
                </span>
              </li>
              <li>
                <h4>角色</h4>
                <el-tag type="success">{{ formatRole(adminDetail.role) }}</el-tag>
              </li>
              <li>
                <h4>状态</h4>
                <el-tag :type="adminDetail.status === 1 ? 'success' : 'error'">
                  {{ formatStatus(adminDetail.status) }}
                </el-tag>
              </li>
              <li>
                <h4>上次登录时间</h4>
                <span class="content">
                  <el-skeleton
                    v-if="!adminDetail.email"
                    :rows="0"
                    style="--el-skeleton-row-height: 20px"
                  />
                  {{ adminDetail.last_login_at }}
                </span>
              </li>
            </ul>
          </div>
        </div>
      </template>
      <template #footer>
        <el-button
          type="info"
          @click="handleDetailDialogVisible(false)"
        >
          取消
        </el-button>
      </template>
    </el-dialog>

    <!-- 更改密码弹窗 -->
    <el-dialog
      class="password-dialog"
      title="更改密码"
      v-model="changePasswordVisible"
      @close="handleChangePassword(false)"
      width="400px"
      append-to-body
    >
      <el-form
        ref="passwordFormRef"
        :model="passwordForm"
        :rules="passwordRules"
        label-width="100px"
        class="password-form"
      >
        <el-form-item
          label="新密码"
          prop="new_password"
        >
          <el-input
            v-model="passwordForm.new_password"
            type="password"
            placeholder="请输入新密码"
            show-password
          />
        </el-form-item>
        <el-form-item
          label="确认密码"
          prop="confirm_password"
        >
          <el-input
            v-model="passwordForm.confirm_password"
            type="password"
            placeholder="请确认新密码"
            show-password
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button
          type="info"
          @click="handleChangePassword(false)"
        >
          取消
        </el-button>
        <el-button
          type="primary"
          @click="submitChangePassword(adminDetail.id, passwordFormRef)"
        >
          确定
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;
// 列表头像
.data-table__wrapper {
  .el-avatar {
    width: 45px;
    height: 45px;
    border-radius: $border-radius-sm;
    border: 1px solid var(--border-color);
  }
  // 是否是自己
  .is_oneself {
    color: var(--primary-color);
  }
  // 超级管理员样式
  .is_super {
    transform: translateX(-6px);
    display: inline-block;
    padding: 2px 5px;
    border-radius: 5px;
    background-color: var(--bg-color);
    white-space: nowrap;
  }

  // 头像
  .avatar {
    display: block;
    position: relative;
    margin-right: 30px;
    width: 45px;
    height: 45px;
    aspect-ratio: 1;
    border: 3px dotted var(--primary-color);
    border-radius: $border-radius-md;
    cursor: pointer;
    overflow: hidden;

    input {
      display: none;
    }

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .el-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) scale(1.5);
      opacity: 0.5;

      svg {
        stroke: var(--primary-color);

        * {
          stroke: var(--primary-color);
          fill: var(--primary-color);
        }
      }
    }
  }
  .custom-tag {
    display: inline-block;
    padding: 0 8px;
    height: 24px;
    line-height: 22px;
    font-size: 12px;
    border-radius: 4px;
    box-sizing: border-box;
    border: 1px solid;
    white-space: nowrap;
    transition: none;
  }

  .custom-success {
    color: var(--el-color-success);
    background-color: var(--el-color-success-light-9);
    border-color: var(--el-color-success-light-8);
  }

  .custom-danger {
    color: var(--el-color-danger);
    background-color: var(--el-color-danger-light-9);
    border-color: var(--el-color-danger-light-8);
  }
}

// 新增面版
.add_dialog {
  // 头像
  .avatar {
    position: relative;
    margin-right: 30px;
    height: 120px;
    aspect-ratio: 1;
    border: 3px dotted var(--primary-color);
    border-radius: $border-radius-md;
    cursor: pointer;
    overflow: hidden;

    input {
      display: none;
    }

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .el-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) scale(2);

      svg {
        stroke: var(--primary-color);

        * {
          stroke: var(--primary-color);
          fill: var(--primary-color);
        }
      }
    }
  }
}

// 详情面版
.admin-detail {
  .el-dialog__body {
    .admin-detail-main {
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      height: 250px;
      .main-left {
        height: 100%;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        flex-direction: column;
        .avatar {
          font-size: 20px;
        }
      }
      .detail-list {
        padding: 10px 0;
        width: 70%;
        ul {
          li {
            display: flex;
            justify-content: start;
            align-items: center;
            border: 1px solid var(--border-color);
            border-bottom: none;
            &:last-child {
              border-bottom: 1px solid var(--border-color);
              border-bottom-left-radius: $border-radius-sm;
              border-bottom-right-radius: $border-radius-sm;
            }
            &:first-child {
              border-top-left-radius: $border-radius-sm;
              border-top-right-radius: $border-radius-sm;
            }
            h4 {
              flex-shrink: 0;
              text-align: center;
              width: 120px;
              margin-right: 20px;
              font-size: $font-size-lg;
              background-color: var(--bg-color-subtle);
              padding: 15px 8px;
            }
            span.content {
              width: 100%;

              .el-skeleton {
                display: flex;
                align-items: center;
              }

              .el-tag {
                font-size: $font-size-sm;
              }
            }
          }
        }
      }
    }
  }
  .el-dialog__footer {
    .el-button {
      margin-top: 10px;
    }
  }
}

.password-dialog {
  :deep(.el-dialog) {
    border-radius: $border-radius-md;
    box-shadow: 0 4px 16px var(--shadow-color);
  }

  :deep(.el-dialog__header) {
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 10px;

    .el-dialog__title {
      font-size: $h4-size;
      color: var(--text-color-primary);
    }
  }

  :deep(.el-dialog__body) {
    padding: 20px;

    .password-form {
      .el-form-item {
        margin-bottom: 24px;

        .el-form-item__label {
          font-size: $font-size-lg;
          color: var(--text-color-primary);
        }

        .el-input {
          width: 100%;

          .el-input__inner {
            border-radius: 6px;
            border-color: var(--border-color);

            &:focus {
              border-color: var(--el-color-primary);
              box-shadow: 0 0 0 1px var(--el-color-primary);
            }
          }
        }

        .el-form-item__error {
          font-size: $font-size-sm;
          color: var(--el-color-danger);
        }
      }
    }
  }

  :deep(.el-dialog__footer) {
    border-top: 1px solid var(--border-color);
    padding-top: 10px;
    text-align: right;

    .el-button {
      border-radius: 6px;
      margin-left: 12px;

      &:hover {
        transform: translateY(-1px);
      }
    }
  }
}
</style>
