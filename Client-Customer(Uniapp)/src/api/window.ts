import type { WindowItem } from '@/types/window'
import { http } from '@/utils/http'

/**
 * 获取所有营业中的窗口列表
 */
export const getWindowListAPI = () => {
  return http<WindowItem[]>({
    method: 'GET',
    url: '/user/window/list',
  })
}

/**
 * 获取窗口详情
 */
export const getWindowByIdAPI = (id: number) => {
  return http<WindowItem>({
    method: 'GET',
    url: `/user/window/${id}`,
  })
}
