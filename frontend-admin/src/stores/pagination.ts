// stores/pagination.ts (Pinia)
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const usePaginationStore = defineStore('pagination', () => {
  const page = ref<number>(1)
  const perPage = ref<number>(6) // 默认每页 10 条

  const setPage = (p: number) => page.value = p
  const setPerPage = (n: number) => perPage.value = n

  return { page, perPage, setPage, setPerPage }
})
