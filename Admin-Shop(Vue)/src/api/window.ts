import request from '@/utils/request'

/**
 * 获取窗口分页列表
 * @param params 分页查询参数
 */
export const getWindowPageListAPI = (params: any) => {
  return request({
    url: '/window/page',
    method: 'get',
    params
  })
}

/**
 * 获取所有窗口列表（不分页）
 */
export const getWindowListAPI = () => {
  return request({
    url: '/window/list',
    method: 'get'
  })
}

/**
 * 根据id获取窗口信息
 * @param id 窗口id
 */
export const getWindowByIdAPI = (id: number) => {
  return request({
    url: `/window/${id}`,
    method: 'get'
  })
}

/**
 * 新增窗口
 * @param params 窗口DTO对象
 */
export const addWindowAPI = (params: any) => {
  return request({
    url: '/window',
    method: 'post',
    data: { ...params }
  })
}

/**
 * 修改窗口信息
 * @param params 窗口DTO对象
 */
export const updateWindowAPI = (params: any) => {
  return request({
    url: '/window',
    method: 'put',
    data: { ...params }
  })
}

/**
 * 切换窗口营业状态
 * @param id 窗口id
 */
export const toggleWindowStatusAPI = (id: number) => {
  return request({
    url: `/window/status/${id}`,
    method: 'put'
  })
}

/**
 * 删除窗口
 * @param id 窗口id
 */
export const deleteWindowAPI = (id: number) => {
  return request({
    url: `/window/${id}`,
    method: 'delete'
  })
}

/**
 * 获取员工管理的窗口列表
 * @param employeeId 员工id
 */
export const getEmployeeWindowsAPI = (employeeId: number) => {
  return request({
    url: `/window/employee/${employeeId}`,
    method: 'get'
  })
}

/**
 * 更新员工管理的窗口
 * @param employeeId 员工id
 * @param windowIds 窗口id列表
 */
export const updateEmployeeWindowsAPI = (employeeId: number, windowIds: number[]) => {
  return request({
    url: `/window/employee/${employeeId}`,
    method: 'put',
    data: windowIds
  })
}
