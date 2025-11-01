// stores/pagination.js (Pinia)
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const usePaginationStore = defineStore('pagination', () => {
  const page = ref(1)
  const perPage = ref(6) // 默认每页 6 条

  const setPage = (p) => page.value = p
  const setPerPage = (n) => perPage.value = n

  return { page, perPage, setPage, setPerPage }
})
