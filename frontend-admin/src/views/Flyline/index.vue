<script setup>
defineOptions({
  name: 'FlylineComponent',
})
</script>

<template>
  <h1>FlylineComponent</h1>
</template>

<style scoped lang="scss">
@use '@/styles/themes/_variables.scss' as *;

.data-table__toolbar {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
  gap: 12px;
  flex-wrap: wrap;
  padding: 12px 16px;
  background: var(--card-bg-color);
  border-radius: 8px;
  border: 1px solid var(--border-color);
  box-shadow: 0 1px 3px var(--shadow-color);

  .toolbar-left {
    display: flex;
    align-items: center;
    gap: 10px;
    flex-wrap: wrap;

    .data-table__search {
      width: 220px;
      transition: all 0.2s ease;

      &:focus-within {
        border-radius: var(--el-input-border-radius);
      }
    }

    .data-table__filter {
      width: 180px;
    }
  }

  .toolbar-right {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 8px;

    .data-table__btn {
      border-radius: 6px;
      font-weight: 500;
      transition: all 0.2s ease;

      &:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 8px var(--shadow-color);
      }
    }
  }
}

.data-table__wrapper {
  width: 100%;
  min-height: 400px;
  /* 防止高度跳动 */
  position: relative;
  padding: 10px;
  overflow: hidden;
  border-radius: $border-radius-md;
  background-color: var(--card-bg-color);
  box-shadow: 0 0 5px var(--shadow-color);

  :deep(.el-table--fit) {
    overflow: hidden;
    box-sizing: border-box;
    background-color: var(--card-bg-color);

    .el-table__header {
      height: 60px;
      font-size: $font-size-xl;
    }

    .column-operation {
      display: flex;
      justify-content: start;
      align-items: center;
      align-content: center;

      flex-wrap: wrap;

      button {
        margin: 5px 20px;
        margin-left: 0px;

        &:last-child {
          margin-right: 0px;
        }
      }
    }

    img {
      max-height: 60px;
    }

    .point_img img {
      max-height: 30px;
    }
  }
}

.empty-state {
  text-align: center;
  padding: 20px;
  color: var(--text-color-secondary);
  font-size: $font-size-lg;
}

.data-table__pagination {
  margin-top: 20px;
  display: flex;
  justify-content: end;
}

/* 逐行浮动动画 */
:deep(.row-animate) {
  opacity: 0;
  transform: translateY(20px);
  animation: rowFadeIn 1s ease forwards;
}

@for $i from 0 through 20 {
  /* 支持最多20行，必要时可增加 */
  :deep(.row-animate-#{$i}) {
    animation-delay: #{$i * 0.1}s;
  }
}

@keyframes rowFadeIn {
  0% {
    opacity: 0;
    transform: translateY(100%);
  }

  30% {
    opacity: 0;
    transform: translateY(100%);
  }

  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

// loading
.example-showcase .el-loading-mask {
  z-index: 9;
}
</style>
