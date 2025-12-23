import { useUserStore } from '@/stores/modules/user'

// 请求基地址
const baseURL = 'http://localhost:8081'

// 标记是否正在跳转登录页，避免重复跳转
let isNavigatingToLogin = false

// 拦截器配置
const httpInterceptor = {
  // 拦截前触发
  invoke(options: UniApp.RequestOptions) {
    // 1. 非 http 开头需拼接地址
    if (!options.url.startsWith('http')) {
      options.url = baseURL + options.url
    }
    // 2. 请求超时
    options.timeout = 10000
    // 3. 添加小程序端请求头标识
    options.header = {
      'source-client': 'miniapp',
      ...options.header,
    }
    // 4. 添加 token 请求头标识
    const userStore = useUserStore()
    const token = userStore.profile?.token
    console.log('token', token)
    if (token) {
      options.header.Authorization = token
    }
  },
}

// 拦截 request 请求
uni.addInterceptor('request', httpInterceptor)
// 拦截 uploadFile 文件上传
// uni.addInterceptor('uploadFile', httpInterceptor)

// 定义泛型接口
interface Data<T> {
  code: number
  msg: string
  data: T
}
// 相比axios，uniapp对ts不友好，因此自己封装函数升级request，实现响应拦截器的功能
// 直观体现： wx.request({}) -> async await promise对象
export const http = <T>(options: UniApp.RequestOptions) => {
  return new Promise<Data<T>>((resolve, reject) => {
    uni.request({
      ...options,
      // 响应成功
      success(res) {
        console.log('响应  ', res)
        if (res.statusCode >= 200 && res.statusCode < 300) {
          const data = res.data as Data<T>
          // 检查业务状态码，1表示成功
          if (data.code === 1) {
            resolve(data)
          } else {
            // 业务错误，显示错误信息
            uni.showToast({
              title: data.msg || '操作失败',
              icon: 'none',
            })
            reject(data)
          }
        } else if (res.statusCode === 401) {
          // 401错误, 说明token过期, 调用reject,
          // 清理用户信息
          const userStore = useUserStore()
          userStore.clearProfile()
          // 避免重复跳转登录页
          if (!isNavigatingToLogin) {
            isNavigatingToLogin = true
            uni.showToast({
              title: '请先登录',
              icon: 'none',
            })
            setTimeout(() => {
              // 跳转到登录页
              uni.navigateTo({
                url: '/pages/login/login',
                complete: () => {
                  // 跳转完成后重置标记
                  setTimeout(() => {
                    isNavigatingToLogin = false
                  }, 1000)
                }
              })
            }, 500)
          }
          reject(res)
        } else {
          // 通用错误, 调用reject, 轻量提示框
          uni.showToast({
            title: (res.data as Data<T>).msg || '请求失败',
            icon: 'none',
          })
          reject(res)
        }
      },
      // 响应失败
      fail(err) {
        // 网络错误, 调用reject
        uni.showToast({
          title: '网络不行，换个试试？',
          icon: 'none',
          // mask: true,
        })
        reject(err)
      },
    })
  })
}

// 检查是否已登录
export const isLoggedIn = () => {
  const userStore = useUserStore()
  return !!userStore.profile?.token
}
