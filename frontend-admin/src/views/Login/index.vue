<script setup>
import { reactive, ref, defineOptions } from 'vue'
import ToggleTheme from '@/components/ToggleTheme.vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { loginAdmin } from '@/api/admin'
import { useUserStore } from '@/stores/userStore'
import { useRouter } from 'vue-router'

defineOptions({
  name: 'LoginComponents',
})

const mountains = [
  new URL('@/assets/mountains/mountain_E.png', import.meta.url).href,
  new URL('@/assets/mountains/mountain_W.png', import.meta.url).href,
  new URL('@/assets/mountains/mountain_S.png', import.meta.url).href,
  new URL('@/assets/mountains/mountain_N.png', import.meta.url).href,
  new URL('@/assets/mountains/mountain_C.png', import.meta.url).href,
]

// 忘记密码
const forgotPassword = () => {
  ElMessageBox.alert('why？？？ 密码都能忘？自己联系超级管理员', '本座懒得做这个功能', {
    confirmButtonText: '知道了',
  })
}

// 登录表单校验
const ruleFormRef = ref()
const ruleForm = reactive({
  email: 'admin02@wuyue.com',
  password: 'admin02_123456',
})
const rules = reactive({
  email: [
    { required: true, message: '邮箱不能为空', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码不能小于6位数', trigger: 'blur' },
    { max: 50, message: '密码不能大于50位数', trigger: 'blur' },
  ],
})

// 登录判断
const userStore = useUserStore()
const router = useRouter()
const submitForm = async (formEl) => {
  if (!formEl) return
  await formEl.validate(async (valid) => {
    if (valid) {
      const result = await loginAdmin(ruleForm)
      userStore.setUserInfo(result.data)
      ElMessage.success('登录成功')
      router.push({ name: 'layout' })
    }
  })
}
</script>
<template>
  <div class="main">
    <div class="left">
      <div class="logo">
        <img
          src="@/assets/logo.png"
          draggable="false"
          alt=""
        />
      </div>
      <ul class="mountains">
        <li
          v-for="(item, index) in mountains"
          :key="index"
        >
          <img
            :src="item"
            draggable="false"
            alt=""
          />
        </li>
      </ul>
    </div>
    <div class="right">
      <!-- From Uiverse.io by nathann09 -->
      <el-form
        ref="ruleFormRef"
        action="javascript:;"
        :model="ruleForm"
        :rules="rules"
        label-width="auto"
        class="form"
        novalidate
      >
        <h2 class="form-title">欢迎登录您的账户</h2>
        <el-form-item
          class="input-container"
          prop="email"
        >
          <el-input
            v-model="ruleForm.email"
            type="email"
            placeholder="输入邮箱"
          />
        </el-form-item>
        <el-form-item
          class="input-container"
          prop="password"
        >
          <el-input
            v-model="ruleForm.password"
            type="password"
            show-password
            placeholder="输入密码"
          />
        </el-form-item>
        <button
          type="submit"
          class="submit"
          @click="submitForm(ruleFormRef)"
        >
          登录
        </button>
        <p class="forgot-password">
          忘记密码?
          <a
            href="javascript:;"
            @click="forgotPassword"
          >
            找回
          </a>
        </p>
      </el-form>

      <div class="toggle_theme">
        <ToggleTheme></ToggleTheme>
      </div>
    </div>
  </div>
</template>
<style lang="scss">
@use '@/styles/themes/_variables' as *;

.main {
  display: flex;
  justify-content: baseline;
  align-items: center;
  width: 100dvw;
  height: 100dvh;

  .left {
    position: relative;
    width: 45%;
    height: 100%;

    .logo {
      position: absolute;
      left: 50px;
      top: 30px;
      width: 100px;
    }

    .mountains {
      position: absolute;
      left: 50%;
      bottom: 10%;
      transform: translateX(-50%);
      width: 100%;
      display: flex;
      justify-content: space-around;
      align-content: center;
      flex-wrap: wrap;

      li {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
        width: 20%;
      }

      img {
        width: 100%;
        cursor: pointer;
        filter: drop-shadow(0 0 5px var(--shadow-color));
        transition: $transition-fast;

        &:hover {
          filter: drop-shadow(0 0 5px var(--shadow-color));
        }
      }
    }

    li:nth-child(1),
    li:nth-child(2) {
      width: 50%;

      img {
        width: 40%;
      }
    }
  }

  .right {
    position: relative;
    width: 55%;
    height: 100%;
    background-color: var(--card-bg-color);

    /* From Uiverse.io by nathann09 */
    .form {
      position: absolute;
      left: 50%;
      top: 50%;
      display: flex !important;
      flex-direction: column;
      align-items: center;
      justify-content: space-evenly;
      transform: translate(-50%, -50%);
      background-color: var(--card-bg-color-inner);
      display: block;
      padding: 30px;
      width: 60%;
      aspect-ratio: 2 / 1.8;
      box-shadow:
        0 10px 15px -3px var(--shadow-color),
        0 4px 6px -2px var(--shadow-color);
      border-radius: $border-radius-sm;

      .form-title {
        margin-bottom: 25px;
        line-height: 1.5;
        font-weight: 700;
        text-align: center;
        color: var(--text-color);
      }

      .input-container {
        margin-bottom: 35px;
        position: relative;
        border: 1px solid var(--border-color);
        border-radius: $border-radius-md;
        background-color: var(--input-bg-color);

        input {
          padding: 16px;
          padding-right: 30px;
          font-size: $font-size-xl;
          line-height: 1.5;
          width: 100%;
          border-radius: $border-radius-md;
          color: var(--sub-text-color);
          outline: none;
          background-color: var(--input-bg-color);

          &::placeholder {
            color: var(--placeholder-color);
          }
        }
      }

      .el-form-item {
        width: 100%;
        height: 15%;

        .el-form-item__content {
          height: 100%;
        }

        .el-input {
          height: 100%;
        }
        .el-input__wrapper {
          height: 100%;
          padding: 10px 0;
          background-color: var(--input-bg-color);
          box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
          border: 1px solid var(--input-border);
          border-radius: $border-radius-md;

          &.is-focus {
            box-shadow: none;
          }
        }
      }

      .el-form-item__error {
        margin: 6px 0;
      }

      .submit {
        display: block;
        margin-bottom: 20px;
        padding: 14px 20px;
        background-color: var(--primary-color);
        color: var(--button-text);
        font-size: $font-size-xl;
        font-weight: 500;
        width: 100%;
        height: 15%;
        border-radius: $border-radius-md;
        transition: all $transition-fast;

        &:hover {
          transform: translateY(-2px);
          box-shadow: 0 5px 10px var(--shadow-color);
        }

        &:active {
          background-color: var(--primary-hover-color);
          transform: $transition-scale-btn;
          transition: all $transition-btn-active;
          transform: translateY(0px);
          box-shadow: 0 0px 5px var(--shadow-color);
        }
      }

      .forgot-password {
        color: var(--prompt-text-color);
        font-size: $font-size-base;
        line-height: 1.5;
        text-align: center;

        a {
          text-decoration: underline;
        }
      }
    }

    .toggle_theme {
      position: absolute;
      right: 30px;
      top: 30px;
    }
  }
}
</style>
<style lang="scss">
// 密码输入框的显示密码图标
.el-input__suffix {
  transform: translateX(-100%);
  svg {
    transform: scale(1.5);
  }
}
</style>
