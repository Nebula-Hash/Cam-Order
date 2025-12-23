import type { CategoryItem } from '@/types/category'
import { http } from '@/utils/http'

/**
 * 分类列表-小程序
 */
export const getCategoryAPI = () => {
  return http<CategoryItem[]>({
    method: 'GET',
    url: '/user/category/list',
  })
}

/**
 * 根据窗口ID获取分类列表
 */
export const getCategoryByWindowAPI = (windowId: number) => {
  return http<CategoryItem[]>({
    method: 'GET',
    url: `/user/category/list/${windowId}`,
  })
}
