// 登录返回结果
export type Login = {
  id: number
  account: string
  token: string
}

// 登录/注册请求参数
export type LoginParams = {
  account: string
  password: string
}
