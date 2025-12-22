export type UserInfo = {
  id: number
  account: string
  token: string
  role?: number  // 0:窗口员工 1:窗口管理员 2:超级管理员
}