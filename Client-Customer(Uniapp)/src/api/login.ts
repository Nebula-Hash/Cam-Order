import type { Login, LoginParams } from '@/types/login'
import { http } from '@/utils/http'

/**
 * 用户登录
 */
export const loginAPI = (data: LoginParams) => {
  return http<Login>({
    method: 'POST',
    url: '/user/user/login',
    data,
  })
}

/**
 * 用户注册
 */
export const registerAPI = (data: LoginParams) => {
  return http({
    method: 'POST',
    url: '/user/user/register',
    data,
  })
}
