<script setup>
import ToggleTheme from '@/components/ToggleTheme.vue'
import { useUserStore } from '@/stores/userStore'
import { storeToRefs } from 'pinia'
import { computed, reactive, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { logoutAdmin } from '@/api/admin'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus } from '@element-plus/icons-vue'
import { updateAdmonInfo } from '@/api/admin'
import runRequest from '@/utils/useRequestWrapper'

defineOptions({
  name: 'LayoutHeader',
})

const route = useRoute()
const title = computed(() => route?.meta?.title)

const userStore = useUserStore()
const { userInfo } = storeToRefs(useUserStore())

// 默认头像
const default_avatar = new URL('@/assets/default_avatar.png', import.meta.url).href
const avatar = ref(userInfo.value.avatar)
const ruleFormRef = ref()
const ruleForm = reactive({
  name: userInfo.value.name || '',
  email: userInfo.value.email || '',
})

const rules = reactive({
  name: [
    { required: true, message: '姓名不可为空', trigger: 'blur' },
    { min: 2, message: '姓名至少两位数', trigger: 'blur' },
  ],
  email: [
    { required: true, message: '邮箱不可为空', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' },
  ],
})

// 处理图片
const img_preview = computed({
  get: () => avatar.value || default_avatar,
  set: (value) => {
    avatar.value = value
  },
})

const img_file = ref(null)
const avatarFile = (event) => {
  // 1. 获取 input 元素
  const target = event.target
  const files = target.files

  if (!files || files.length === 0) {
    console.log('未选择文件')
    return
  }

  const file = files[0]
  img_file.value = file // ✅ 保存文件对象，上传时用

  const reader = new FileReader()
  reader.onload = (e) => {
    const result = e.target?.result
    img_preview.value = result
  }
  reader.readAsDataURL(file)
}

const editProfileVisible = ref(false)

// 编辑管理员弹窗控制
function editProfile(bool) {
  setTimeout(() => {
    Object.assign(ruleForm, {
      name: userInfo.value.name || '',
      email: userInfo.value.email || '',
    })
    ruleFormRef.value?.clearValidate()
  }, 1000)
  if (!bool) avatar.value = userInfo.value.avatar
  editProfileVisible.value = bool
}

// 提交管理员信息
const subAdminInfo = async (formEl) => {
  if (!formEl) return

  const formData = new FormData()
  // ✅ 文本数据
  formData.append('name', ruleForm.name)
  formData.append('email', ruleForm.email)

  // ✅ 图片文件（只有选择了才加）
  if (img_file.value) {
    formData.append('avatar', img_file.value)
  }

  formEl.validate(async (valid) => {
    console.log(valid)
    if (valid) {
      const res = await runRequest(() => updateAdmonInfo(formData))
      if (!res) return
      userStore.setUserInfo(res.data)
      editProfile(false)
      ElMessage.success('修改成功')
    }
  })
}

// 退出登录
const router = useRouter()
function logout() {
  ElMessageBox.confirm('确认退出登录吗？', '退出登录', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    cancelButtonClass: 'el-button--info',
  })
    .then(async () => {
      await runRequest(() => logoutAdmin())
      userStore.clearUserInfo()
      router.push({ name: 'login' })

      ElMessage.success('登出成功')
    })
    .catch(() => {})
}
</script>

<template>
  <div class="header">
    <div class="left-panel">
      <h5>{{ title }}</h5>
    </div>

    <div class="right-panel">
      <div class="toggle-theme">
        <ToggleTheme></ToggleTheme>
      </div>
      <div class="settings">
        <i class="iconfont icon-shezhi"></i>

        <div class="user-card">
          <div class="user-info">
            <img
              :src="avatar || default_avatar"
              alt="头像"
              class="avatar"
            />
            <div class="details">
              <h3 class="name">{{ userInfo.name || 'name' }}</h3>
              <p class="role">{{ userInfo.role === 'super' ? '超级管理员' : '管理员' }}</p>
              <p class="email">{{ userInfo.email }}</p>
            </div>
          </div>
          <div class="actions">
            <button
              class="btn confirm-btn edit-btn"
              @click="editProfile(true)"
            >
              编辑资料
            </button>
            <button
              class="btn cancel-btn logout-btn"
              @click="logout"
            >
              退出登录
            </button>
          </div>
        </div>
      </div>
      <div class="admin-info">
        <div class="avatar">
          <img
            :src="avatar || default_avatar"
            alt="头像"
          />
        </div>
        <div class="admin-details">
          <div class="name">{{ userInfo.name || 'name' }}</div>
          <div class="is-admin">{{ userInfo.role === 'super' ? '超级管理员' : '管理员' }}</div>
        </div>
      </div>
    </div>

    <!-- 对话框 -->
    <el-dialog
      class="edit-dialog"
      @close="editProfile(false)"
      v-model="editProfileVisible"
    >
      <template #header>
        <h5>编辑管理员信息</h5>
      </template>
      <template #default>
        <el-form
          class="update-admin-info"
          ref="ruleFormRef"
          style="max-width: 300px"
          :model="ruleForm"
          :rules="rules"
          label-width="auto"
        >
          <el-form-item class="avatar-form">
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
            label="名字"
            prop="name"
          >
            <el-input v-model="ruleForm.name" />
          </el-form-item>
          <el-form-item
            label="邮箱"
            prop="email"
          >
            <el-input v-model="ruleForm.email" />
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <el-button
          type="info"
          @click="editProfile(false)"
        >
          取消
        </el-button>
        <el-button
          type="primary"
          @click="subAdminInfo(ruleFormRef)"
        >
          确认
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.header {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  width: 100%;
  height: 100%;
  background-color: var(--card-bg-color);
  box-shadow: 0 0 10px var(--shadow-color);
  border-radius: $border-radius-md;
  font-size: $font-size-base;
  z-index: 100;

  .left-panel,
  .right-panel {
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .right-panel {
    .toggle-theme {
      margin-right: 20px;
      transform: scale(calc(25px / 36px));
    }

    .settings {
      position: relative;
      height: 100%;

      &:hover {
        .user-card {
          transform: translate(-50%, 0);
          opacity: 1;
          visibility: visible;
          transition-delay: 0s;
        }
      }

      .icon-shezhi {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 30px;
        color: var(--sub-text-color);
        font-size: 20px;
        cursor: pointer;
        height: 100%;

        &:hover {
          color: var(--text-color);
        }
      }

      .user-card {
        position: absolute;
        top: calc(100% + 10px);
        left: 50%;
        transform: translate(-50%, 0);
        width: 260px;
        background: var(--card-bg-color);
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 6px 18px var(--shadow-color);
        display: flex;
        flex-direction: column;
        gap: 15px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        transition: all $transition-base;
        transform: translate(-50%, -10%);
        opacity: 0;
        visibility: hidden;
        transition-delay: 0.3s;
        z-index: 100;

        .user-info {
          display: flex;
          align-items: center;
          gap: 15px;

          .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--primary-color);
          }

          .details {
            display: flex;
            flex-direction: column;

            .name {
              font-size: $font-size-lg;
              font-weight: 600;
              color: var(--text-color);
              margin-bottom: 3px;
            }

            .role {
              font-size: $font-size-sm;
              color: var(--primary-color);
              margin-bottom: 2px;
            }

            .email {
              font-size: $font-size-sm;
              color: var(--sub-text-color);
            }
          }
        }

        .actions {
          display: flex;
          justify-content: space-between;

          .btn {
            flex: 1;
            padding: 6px 10px;
            font-size: $font-size-sm;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
          }

          .edit-btn {
            margin-right: 8px;
          }
        }
      }
    }

    .admin-info {
      position: relative;
      display: flex;
      justify-content: end;
      padding-left: 20px;
      align-items: center;
      height: 100%;

      &:hover {
        .popover {
          transform: translateY(0%);
          opacity: 1;
          visibility: visible;

          .popover_avatar {
            transform: translate(-50%, -50%);
            opacity: 1;
            visibility: visible;
          }
        }
      }

      &::before {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        content: '';
        border-left: 1px solid var(--border-color);
        height: 60%;
      }

      .avatar {
        margin-right: 15px;
        height: 75%;
        border-radius: 1000px;
        cursor: pointer;
        aspect-ratio: 1;
        border-radius: 100px;
        overflow: hidden;
        border: 2px solid var(--primary-color);

        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
      }

      .admin-details {
        .name {
          font-size: $font-size-base;
          font-weight: 700;
          font-size: 15px;
        }

        .is-admin {
          font-size: $font-size-sm;
          color: var(--primary-color);
        }
      }

      .popover {
        position: absolute;
        top: calc(100% + 20px);
        right: 0;
        padding-top: 70px;
        min-width: 300px;
        height: 400px;
        border-radius: $border-radius-md;
        transform: translateY(10px);
        opacity: 0;
        visibility: hidden;
        background-color: var(--card-bg-color);
        transition: all $transition-base;
        filter: drop-shadow(0 5px 5px var(--shadow-color));
        transform: translateY(0%);
        opacity: 1;
        visibility: visible;

        /* 示例背景 */
        .popover_avatar {
          position: absolute;
          left: 50%;
          top: 0%;
          transform: translate(-50%, -50%);
          margin-right: 15px;
          width: 120px;
          border-radius: 1000px;
          cursor: pointer;
          transform: translate(-50%, -75%);
          opacity: 0;
          visibility: hidden;
          transition: all $transition-base;
          transform: translate(-50%, -50%);
          opacity: 1;
          visibility: visible;
        }

        .name_isadmin {
          text-align: center;

          h3 {
            font-size: 20px;
          }
        }
      }
    }
  }

  // 弹出框
  :deep(.el-overlay) {
    .el-overlay-dialog {
      background: var(--overlay-color);
    }

    .edit-dialog {
      width: 500px !important;
    }

    .el-dialog__body {
      margin-top: 10px;
      padding: 0 10px;
    }

    .el-dialog__footer {
      .el-button {
        padding: 0 20px;
      }

      .el-button.el-button--primary {
        margin-left: 30px;
      }
    }

    .update-admin-info {
      display: grid;
      grid-template-columns: 1fr 2fr;
      grid-template-rows: 70px 70px;
      max-width: initial !important;

      .el-input__wrapper {
        height: 40px;
      }

      .el-form-item {
        height: initial !important;
      }

      .el-form-item__label-wrap,
      .el-form-item__content {
        display: flex;
        align-items: center;
      }

      .avatar-form {
        grid-row: 1/3;
        // grid-column: 1/3;
      }

      .avatar {
        margin-right: 30px;
        position: relative;
        width: 100%;
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
  }
}
</style>
