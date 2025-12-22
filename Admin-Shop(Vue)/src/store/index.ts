import { defineStore } from 'pinia'
import type { UserInfo } from '@/types/employee'

export const useUserInfoStore = defineStore('userInfo', {
  state: () => ({
    userInfo: null as UserInfo | null
  }),
  actions: {
    setUserInfo(info: UserInfo | null) {
      this.userInfo = info
    },
    clearUserInfo() {
      this.userInfo = null
    }
  },
  persist: true // 持久化存储
})