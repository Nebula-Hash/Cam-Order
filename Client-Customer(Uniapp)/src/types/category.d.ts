import type { DishItem } from './dish'

// 分类列表
export type CategoryItem = {
  children: DishItem[]
  id: number
  windowId: number
  name: string
  sort: number
  type: number // 1-菜品分类 2-套餐分类
}
