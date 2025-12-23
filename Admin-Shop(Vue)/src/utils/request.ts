import axios from 'axios'
// import { useRouter } from 'vue-router'   // 这个方法是写在组件里的，不是这里的 request.ts !
import router from '@/router'
import { ElMessage } from 'element-plus'
import { useUserInfoStore } from '@/store'

//定义一个变量,记录公共的前缀,  baseURL: http://localhost:8080/api
const baseURL = '/api'
const instance = axios.create({ baseURL })

const userInfoStore = useUserInfoStore()

// 1.定义"请求"拦截器(前端给后端服务器的请求)
// api里每次调用request方法，都会触发一次请求拦截器
instance.interceptors.request.use(
  (config) => {
    // config配置对象（要请求后台的参数都在这个对象上）
    // console.log('------请求拦截器-------')
    const token = userInfoStore.userInfo ? userInfoStore.userInfo.token : null
    // 在发起时要统一携带请求头Authorization和token值
    // 判断，登录和注册页面，pinia里无token，而且登录接口和注册接口也不需要携带token（其他页面需要——）
    // console.log('token:', token)
    if (token) {
      // 为请求头挂载 Authorization 字段
      config.headers.Authorization = token
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// 2.定义"响应"拦截器(后端服务器给前端的响应)
instance.interceptors.response.use(
  // 响应http状态码为 2xx,3xx 时触发成功的回调，形参中的 response 是“成功的结果”
  (response) => {
    // console.log('------响应拦截器-------')
    console.log(response)
    // 如果返回的data里有状态码code并且不是1，说明后端返回了错误信息（token过期等），这时候要给前端提示错误信息
    if ('code' in response.data && response.data.code !== 1) {
      // "xxx已存在" 等各种重复错误，后端有返回提示信息，此处在前端用ElMessage做统一拦截提示
      ElMessage.error(response.data.msg)
    }
    // 对响应的response先在上面拦截处理，最后再放行，返回response
    return response
  },
  // 响应状态码是 4xx,5xx 时触发失败的回调
  (error) => {
    console.dir(error)
    // 网络错误或后端未响应时 error.response 可能为 undefined
    if (error.response) {
      if (error.response.status === 401) {
        // 无效的 token (不存在，过期，伪造或者被修改)
        // token没用了，把 Pinia 中的一切重置为空，并跳转到登录页面(相当于没token的状态)
        userInfoStore.userInfo = null
        ElMessage.error('用户身份已过期~')
        router.push('/login') // js无法获取this.$router，所以要引入router来跳转
      } else if (error.response.status === 404) {
        ElMessage.error('请求的接口不存在')
      } else if (error.response.status >= 500) {
        ElMessage.error('服务器错误，请稍后重试')
      } else {
        ElMessage.error(error.response.data?.msg || '请求失败')
      }
    } else if (error.code === 'ERR_NETWORK') {
      ElMessage.error('网络错误，请检查后端服务是否启动')
    } else {
      ElMessage.error('未知错误')
    }
    return Promise.reject(error)
  }
)

export default instance
