export type Address = {
  id?: number
  userId?: number // 用户id
  consignee?: string // 收货人
  phone?: string // 手机号
  dormitory?: string // 地址（如：12栋305）
  label?: string // 标签
  isDefault?: number // 是否默认 0否 1是
}
