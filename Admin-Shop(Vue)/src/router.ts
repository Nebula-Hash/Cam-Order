import { createRouter, createWebHistory } from 'vue-router'
import { useUserInfoStore } from './store'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: () => import('./views/layout/index.vue'),
      redirect: '/dashboard',
      children: [
        {
          path: 'dashboard',
          name: 'dashboard',
          component: () => import('./views/dashboard/index.vue')
        },
        {
          path: 'statistics',
          name: 'statistics',
          component: () => import('./views/statistics/index.vue')
        },
        {
          path: 'window',
          name: 'window',
          component: () => import('./views/window/index.vue')
        },
        {
          path: 'window/:windowId',
          name: 'window_detail',
          component: () => import('./views/window/detail.vue'),
          props: true
        },
        {
          path: 'employee',
          name: 'employee',
          component: () => import('./views/employee/index.vue')
        },
        {
          path: 'employee/add',
          name: 'employee_add',
          component: () => import('./views/employee/add.vue')
        },
        {
          path: 'employee/update',
          name: 'employee_update',
          component: () => import('./views/employee/update.vue')
        },
        // 订单管理（保留用于 dashboard 跳转）
        {
          path: 'order',
          name: 'order',
          component: () => import('./views/order/index.vue')
        },
        // 分类管理
        {
          path: 'category',
          name: 'category',
          component: () => import('./views/category/index.vue')
        },
        {
          path: 'category/add',
          name: 'category_add',
          component: () => import('./views/category/add.vue')
        },
        {
          path: 'category/update',
          name: 'category_update',
          component: () => import('./views/category/update.vue')
        },
        // 菜品管理
        {
          path: 'dish',
          name: 'dish',
          component: () => import('./views/dish/index.vue')
        },
        {
          path: 'dish/add',
          name: 'dish_add',
          component: () => import('./views/dish/add.vue')
        },
        // 套餐管理
        {
          path: 'setmeal',
          name: 'setmeal',
          component: () => import('./views/setmeal/index.vue')
        },
        {
          path: 'setmeal/add',
          name: 'setmeal_add',
          component: () => import('./views/setmeal/add.vue')
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('./views/login/index.vue')
    },
    {
      path: '/reg',
      name: 'reg',
      component: () => import('./views/reg/index.vue')
    }
  ]
})

// 路由守卫：检查登录状态
router.beforeEach((to, _from, next) => {
  const userInfoStore = useUserInfoStore()
  const isLoggedIn = !!userInfoStore.userInfo

  // 白名单页面（无需登录即可访问）
  const whiteList = ['/login', '/reg']

  if (whiteList.includes(to.path)) {
    // 如果已登录且访问登录/注册页，重定向到首页
    if (isLoggedIn) {
      next('/dashboard')
    } else {
      next()
    }
  } else {
    // 需要登录的页面
    if (isLoggedIn) {
      next()
    } else {
      next('/login')
    }
  }
})

export default router
