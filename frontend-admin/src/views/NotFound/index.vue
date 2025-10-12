<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'

defineOptions({
  name: 'NotFound',
})

const router = useRouter()

// DOM 元素引用
const ghostEyesRef = ref<HTMLDivElement | null>(null)

// 页面尺寸
let pageX = window.innerWidth
let pageY = window.innerHeight

// 鼠标位置
let mouseX = 0
let mouseY = 0

// 更新页面尺寸
const updatePageSize = () => {
  pageX = window.innerWidth
  pageY = window.innerHeight
}

window.addEventListener('resize', updatePageSize)

// 鼠标移动处理
const handleMouseMove = (event: MouseEvent) => {
  mouseX = event.pageX
  mouseY = event.pageY

  // 修正：Y 轴上下移动，X 轴左右移动
  const yAxis = ((mouseY - pageY) / pageY) * 200 // 正方向向下
  const xAxis = ((mouseX - pageX) / pageX) * 100 // 正方向向右

  if (ghostEyesRef.value) {
    ghostEyesRef.value.style.transform = `translate(${xAxis}%, ${yAxis}%)`
  }
}

onMounted(() => {
  window.addEventListener('mousemove', handleMouseMove)
})

const goHome = () => {
  router.push({ name: 'layout' })
}
</script>

<template>
  <div class="not-found"></div>

  <div class="box">
    <div class="box__ghost">
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>

      <div class="box__ghost-container">
        <div
          class="box__ghost-eyes"
          ref="ghostEyesRef"
        >
          <div class="box__eye-left"></div>
          <div class="box__eye-right"></div>
        </div>
        <div class="box__ghost-bottom">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
      <div class="box__ghost-shadow"></div>
    </div>

    <div class="box__description">
      <div class="box__description-container">
        <div class="box__description-title">Whoops!</div>
        <div class="box__description-text">
          It seems like we couldn't find the page you were looking for
        </div>
      </div>

      <button
        class="box__button"
        @click="goHome"
      >
        Home
      </button>
    </div>
  </div>
</template>

<style scoped lang="scss">
/* cyrillic-ext */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKcg72j00.woff2) format('woff2');
  unicode-range: U+0460-052F, U+1C80-1C8A, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
}

/* cyrillic */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKew72j00.woff2) format('woff2');
  unicode-range: U+0301, U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
}

/* greek-ext */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKcw72j00.woff2) format('woff2');
  unicode-range: U+1F00-1FFF;
}

/* greek */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKfA72j00.woff2) format('woff2');
  unicode-range: U+0370-0377, U+037A-037F, U+0384-038A, U+038C, U+038E-03A1, U+03A3-03FF;
}

/* latin-ext */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKcQ72j00.woff2) format('woff2');
  unicode-range:
    U+0100-02BA, U+02BD-02C5, U+02C7-02CC, U+02CE-02D7, U+02DD-02FF, U+0304, U+0308, U+0329,
    U+1D00-1DBF, U+1E00-1E9F, U+1EF2-1EFF, U+2020, U+20A0-20AB, U+20AD-20C0, U+2113, U+2C60-2C7F,
    U+A720-A7FF;
}

/* latin */
@font-face {
  font-family: 'Ubuntu';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/ubuntu/v21/4iCs6KVjbNBYlgoKfw72.woff2) format('woff2');
  unicode-range:
    U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+0304, U+0308, U+0329,
    U+2000-206F, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}

//variables
$purple: darken(#07bfb8, 15%);
$l-purple: #058e89;
$t-purple: #fff;
$pink: #ff5e65;
$white: #fff;

html,
body {
  background: $purple;
  font-family: 'Ubuntu';
}

* {
  box-sizing: border-box;
}

.not-found {
  position: relative;
  width: 100dvw;
  height: 100dvh;
  background-color: $purple;
  overflow: hidden;

  &::after {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    content: '404';
    font-size: 70vh;
    font-weight: 700;
    z-index: 0;
    color: #ffffff1f;
  }
}

.box {
  position: relative;
  width: 350px;
  height: 100%;
  max-height: 600px;
  min-height: 450px;
  background: $l-purple;
  border-radius: 20px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  padding: 30px 50px;
  backdrop-filter: blur(6px);
  overflow: hidden;

  &::after {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    content: '0';
    font-size: 70vh;
    font-weight: 700;
    z-index: 0;
    color: #ffffff1f;
    filter: blur(6px);
    z-index: -1;
  }

  .box__ghost {
    padding: 15px 25px 25px;
    position: absolute;
    left: 50%;
    top: 30%;
    transform: translate(-50%, -30%);

    .symbol {
      &:nth-child(1) {
        opacity: 0.2;
        animation: shine 4s ease-in-out 3s infinite;

        &:before,
        &:after {
          content: '';
          width: 12px;
          height: 4px;
          background: $white;
          position: absolute;
          border-radius: 5px;
          bottom: 65px;
          left: 0;
        }

        &:before {
          transform: rotate(45deg);
        }

        &:after {
          transform: rotate(-45deg);
        }
      }

      &:nth-child(2) {
        position: absolute;
        left: -5px;
        top: 30px;
        height: 18px;
        width: 18px;
        border: 4px solid;
        border-radius: 50%;
        border-color: $white;
        opacity: 0.2;
        animation: shine 4s ease-in-out 1.3s infinite;
      }

      &:nth-child(3) {
        opacity: 0.2;
        animation: shine 3s ease-in-out 0.5s infinite;

        &:before,
        &:after {
          content: '';
          width: 12px;
          height: 4px;
          background: $white;
          position: absolute;
          border-radius: 5px;
          top: 5px;
          left: 40px;
        }

        &:before {
          transform: rotate(90deg);
        }

        &:after {
          transform: rotate(180deg);
        }
      }

      &:nth-child(4) {
        opacity: 0.2;
        animation: shine 6s ease-in-out 1.6s infinite;

        &:before,
        &:after {
          content: '';
          width: 15px;
          height: 4px;
          background: $white;
          position: absolute;
          border-radius: 5px;
          top: 10px;
          right: 30px;
        }

        &:before {
          transform: rotate(45deg);
        }

        &:after {
          transform: rotate(-45deg);
        }
      }

      &:nth-child(5) {
        position: absolute;
        right: 5px;
        top: 40px;
        height: 12px;
        width: 12px;
        border: 3px solid;
        border-radius: 50%;
        border-color: $white;
        opacity: 0.2;
        animation: shine 1.7s ease-in-out 7s infinite;
      }

      &:nth-child(6) {
        opacity: 0.2;
        animation: shine 2s ease-in-out 6s infinite;

        &:before,
        &:after {
          content: '';
          width: 15px;
          height: 4px;
          background: $white;
          position: absolute;
          border-radius: 5px;
          bottom: 65px;
          right: -5px;
        }

        &:before {
          transform: rotate(90deg);
        }

        &:after {
          transform: rotate(180deg);
        }
      }
    }

    .box__ghost-container {
      background: $white;
      width: 100px;
      height: 100px;
      border-radius: 100px 100px 0 0;
      position: relative;
      margin: 0 auto;
      animation: upndown 3s ease-in-out infinite;

      .box__ghost-eyes {
        position: absolute;
        left: 50%;
        top: 45%;
        //transform: translate(-50%, -45%);
        height: 12px;
        width: 70px;

        .box__eye-left {
          width: 12px;
          height: 12px;
          background: $l-purple;
          border-radius: 50%;
          margin: 0 10px;
          position: absolute;
          left: 0;
        }

        .box__eye-right {
          width: 12px;
          height: 12px;
          background: $l-purple;
          border-radius: 50%;
          margin: 0 10px;
          position: absolute;
          right: 0;
        }
      }

      .box__ghost-bottom {
        display: flex;
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;

        div {
          flex-grow: 1;
          position: relative;
          top: -10px;
          height: 20px;
          border-radius: 100%;
          background-color: $white;

          &:nth-child(2n) {
            top: -12px;
            margin: 0 -0px;
            border-top: 15px solid $l-purple;
            background: transparent;
          }
        }
      }
    }

    .box__ghost-shadow {
      height: 20px;
      box-shadow: 0 50px 15px 5px darken(#07bfb98a, 20%);
      border-radius: 50%;
      margin: 0 auto;
      animation: smallnbig 3s ease-in-out infinite;
    }
  }

  .box__description {
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);

    .box__description-container {
      color: $white;
      text-align: center;
      width: 200px;
      font-size: 16px;
      margin: 0 auto;

      .box__description-title {
        font-size: 24px;
        letter-spacing: 0.5px;
      }

      .box__description-text {
        color: $t-purple;
        line-height: 20px;
        margin-top: 20px;
      }
    }

    .box__button {
      position: relative;
      display: block;
      position: relative;
      background: $pink;
      border: 1px solid transparent;
      border-radius: 50px;
      height: 50px;
      text-align: center;
      text-decoration: none;
      color: $white;
      line-height: 50px;
      font-size: 18px;
      padding: 0 70px;
      white-space: nowrap;
      margin-top: 25px;
      transition: background 0.5s ease;
      overflow: hidden;
      -webkit-mask-image: -webkit-radial-gradient(white, black);
      z-index: 100;

      &:before {
        content: '';
        position: absolute;
        width: 20px;
        height: 100px;
        background: $white;
        bottom: -25px;
        left: 0;
        border: 2px solid $white;
        transform: translateX(-50px) rotate(45deg);
        transition: transform 0.5s ease;
      }

      &:hover {
        background: transparent;
        border-color: $white;

        &:before {
          transform: translateX(250px) rotate(45deg);
        }
      }
    }
  }
}

//keyframes
@keyframes upndown {
  0% {
    transform: translateY(5px);
  }

  50% {
    transform: translateY(15px);
  }

  100% {
    transform: translateY(5px);
  }
}

@keyframes smallnbig {
  0% {
    width: 90px;
  }

  50% {
    width: 100px;
  }

  100% {
    width: 90px;
  }
}

@keyframes shine {
  0% {
    opacity: 0.2;
  }

  25% {
    opacity: 0.1;
  }

  50% {
    opacity: 0.2;
  }

  100% {
    opacity: 0.2;
  }
}
</style>
