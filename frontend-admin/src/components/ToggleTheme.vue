<script setup lang="ts">
import { ref } from 'vue'
import { useThemesStore } from '@/stores/themesStore'

const themesStore = useThemesStore()

const isTheme = ref(themesStore.theme)

const toggleTheme = (event, isTheme) =>
  themesStore.toggleTheme(!isTheme, event.clientX, event.clientY)
</script>

<template>
  <label class="switch" @click="toggleTheme($event, isTheme)">
    <input type="checkbox" @keydown.prevent v-model="isTheme" />
    <span class="slider"></span>
  </label>
</template>

<style scoped lang="scss">
.switch {
  font-size: 17px;
  position: relative;
  display: inline-block;
  width: 70px;
  height: 36px;
  border-radius: 100px;
  view-transition-name: none;

  input {
    opacity: 0;
    width: 0;
    height: 0;

    &:checked {
      & + .slider {
        background-color: #333333;

        &::before {
          background-color: #333333;
          border-radius: 50px;
          box-shadow: inset 9px 0px 1px 0px #eeeeee;
          transform: translateX(36px);
          background: url(@/assets/toggle/sun.png) no-repeat 300% center/60%;
        }
      }
    }
  }

  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #eeeeee;
    transition: 0.4s;
    border-radius: 30px;
    box-shadow:
      -2px -2px 2px #999 inset,
      2px 2px 2px #ccc inset;

    &::before {
      position: absolute;
      content: '';
      height: 23px;
      width: 23px;
      border-radius: 20px;
      left: 5px;
      bottom: 6px;
      background: url(@/assets/toggle/sun.png) no-repeat center/60%;
      background-color: #333333;
      transition: 0.4s;
    }
  }
}
</style>
