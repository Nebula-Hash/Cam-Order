<script setup lang="ts">

import { reactive, ref, onMounted, computed } from 'vue'
import { getEmployeePageListAPI, updateEmployeeStatusAPI, deleteEmployeeAPI } from '@/api/employee'
import { getWindowListAPI, getEmployeeWindowsAPI, updateEmployeeWindowsAPI } from '@/api/window'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useRouter } from 'vue-router'
import { useUserInfoStore } from '@/store'

// ------ .d.ts 属性类型接口 ------
interface employee {
  id: number
  name: string
  account: string
  phone: string
  age: number
  gender: string
  pic: string
  status: string
  role: number
  updateTime: string
}

interface windowItem {
  id: number
  name: string
}

// ------ 数据 ------
let userInfoStore = useUserInfoStore()
// 当前页的员工列表
const employeeList = ref<employee[]>([])
// 窗口列表
const windowList = ref<windowItem[]>([])
// 带查询的分页参数
const pageData = reactive({
  name: '',
  page: 1,
  pageSize: 6,
  total: 0
})
// 窗口分配弹窗
const windowDialogVisible = ref(false)
const currentEmployee = ref<employee | null>(null)
const selectedWindowIds = ref<number[]>([])

// 角色列表
const roleOptions = [
  { value: 0, label: '窗口员工' },
  { value: 1, label: '窗口管理员' },
  { value: 2, label: '超级管理员' }
]

// 当前登录用户的角色
const currentUserRole = computed(() => userInfoStore.userInfo?.role ?? -1)
const currentUserId = computed(() => userInfoStore.userInfo?.id)

// ------ 权限判断方法 ------

// 判断是否可以点击"修改"按钮
// 超级管理员(2)：可以修改所有人
// 窗口管理员(1)：只能修改自己
// 窗口员工(0)：只能修改自己
const canEdit = (row: employee) => {
  if (currentUserRole.value === 2) return true
  return currentUserId.value === row.id
}

// 判断是否可以点击"窗口"按钮
// 超级管理员(2)：可以操作所有人
// 窗口管理员(1)：只能操作自己
// 窗口员工(0)：不能操作
const canAssignWindow = (row: employee) => {
  if (currentUserRole.value === 2) return true
  if (currentUserRole.value === 1) return currentUserId.value === row.id
  return false
}

// 判断是否可以点击"禁用/启用"按钮
// 超级管理员(2)：可以操作所有人
// 窗口管理员(1)：只能操作自己
// 窗口员工(0)：不能操作
const canToggleStatus = (row: employee) => {
  if (currentUserRole.value === 2) return true
  if (currentUserRole.value === 1) return currentUserId.value === row.id
  return false
}

// 判断是否可以点击"删除"按钮
// 超级管理员(2)：可以删除所有人
// 窗口管理员(1)：只能删除自己
// 窗口员工(0)：不能删除
const canDelete = (row: employee) => {
  if (currentUserRole.value === 2) return true
  if (currentUserRole.value === 1) return currentUserId.value === row.id
  return false
}

// ------ 方法 ------

// 页面初始化，就根据token去获取用户信息，才能实现如果没有token/token过期，刚开始就能够跳转到登录页
const init = async () => {
  // 参数解构再传进去，因为不用传total
  const { data: res } = await getEmployeePageListAPI({ page: pageData.page, pageSize: pageData.pageSize, name: pageData.name })
  console.log(res)
  console.log('员工列表')
  console.log(res.data)
  // 空数据防护
  employeeList.value = res.data?.records || []
  pageData.total = res.data?.total || 0
}

init()  // 页面初始化，写在这里时的生命周期是beforecreated/created的时候

// 获取窗口列表
const getWindows = async () => {
  const { data: res } = await getWindowListAPI()
  windowList.value = res.data || []
}

onMounted(() => {
  getWindows()
})

// 监听翻页和每页显示数量的变化
const handleCurrentChange = (val: number) => {
  pageData.page = val
  init()
}

const handleSizeChange = (val: number) => {
  pageData.pageSize = val
  init()
}

// 修改员工(路径传参，到update页面后，根据id查询员工信息，回显到表单中)
const router = useRouter()
const update_btn = (row: any) => {
  console.log('要修改的行数据')
  console.log(row)
  router.push({
    name: 'employee_update',
    query: {
      id: row.id
    }
  })
}

// 修改员工状态
const change_btn = async (row: any) => {
  console.log('要修改的行数据')
  console.log(row)
  // const status = row.status === 1 ? 0 : 1
  await updateEmployeeStatusAPI(row.id)
  // 修改后刷新页面，更新数据
  init()
  ElMessage({
    type: 'success',
    message: '修改成功',
  })
}

// 删除员工
const delete_btn = (row: any) => {
  console.log('要删除的行数据')
  console.log(row)
  ElMessageBox.confirm(
    '该操作会永久删除员工，是否继续？',
    'Warning',
    {
      confirmButtonText: 'OK',
      cancelButtonText: 'Cancel',
      type: 'warning',
    }
  )
    .then(async () => {
      console.log('要删除的行数据')
      console.log(row)
      await deleteEmployeeAPI(row.id)
      // 删除后刷新页面，更新数据
      init()
      ElMessage({
        type: 'success',
        message: '删除成功',
      })
    })
    .catch(() => {
      ElMessage({
        type: 'info',
        message: '取消删除',
      })
    })
}

// 打开窗口分配弹窗
const openWindowDialog = async (row: employee) => {
  currentEmployee.value = row
  const { data: res } = await getEmployeeWindowsAPI(row.id)
  selectedWindowIds.value = (res.data || []).map((w: any) => w.id)
  windowDialogVisible.value = true
}

// 保存窗口分配
const saveWindowAssign = async () => {
  if (!currentEmployee.value) return
  await updateEmployeeWindowsAPI(currentEmployee.value.id, selectedWindowIds.value)
  ElMessage.success('窗口分配成功')
  windowDialogVisible.value = false
}

// 获取角色名称
const getRoleName = (role: number) => {
  const option = roleOptions.find(item => item.value === role)
  return option ? option.label : '未知'
}

// 获取角色标签类型
const getRoleType = (role: number) => {
  if (role === 2) return 'danger'
  if (role === 1) return 'warning'
  return 'info'
}
</script>

<template>
  <el-card>
    <div class="horizontal">
      <el-input size="large" class="input" v-model="pageData.name" placeholder="请输入想查询的员工名" />
      <el-button size="large" class="btn" round type="success" @click="init()">查询员工</el-button>
      <el-button size="large" class="btn" type="primary" @click="router.push('/employee/add')">
        <el-icon style="font-size: 15px; margin-right: 10px;">
          <Plus />
        </el-icon>添加员工
      </el-button>
    </div>
    <el-table :data="employeeList" stripe>
      <!-- <el-table-column prop="id" label="id" /> -->
      <el-table-column prop="name" label="姓名" align="center" />
      <el-table-column prop="account" label="账号" align="center" />
      <el-table-column prop="phone" label="手机号" width="120px" align="center" />
      <el-table-column prop="role" label="角色" width="120px" align="center">
        <template #default="scope">
          <el-tag :type="getRoleType(scope.row.role)" round>
            {{ getRoleName(scope.row.role) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="gender" label="性别" align="center" />
      <el-table-column prop="pic" label="头像" align="center">
        <template #default="scope">
          <img v-if="scope.row.pic" :src="scope.row.pic" alt="" />
          <img v-else src="/src/assets/image/user_default.png" alt="" />
        </template>
      </el-table-column>
      <el-table-column prop="status" label="状态" align="center">
        <template #default="scope">
          <el-tag :type="scope.row.status === 1 ? 'success' : 'danger'" round>
            {{ scope.row.status === 1 ? '启用' : '禁用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="updateTime" label="上次操作时间" width="120px" align="center" />
      <el-table-column label="操作" width="280px" align="center">
        <!-- scope 的父组件是 el-table -->
        <template #default="scope">
          <el-button @click="update_btn(scope.row)" type="primary" :disabled="!canEdit(scope.row)">修改
          </el-button>
          <el-button @click="openWindowDialog(scope.row)" type="warning" :disabled="!canAssignWindow(scope.row)">窗口
          </el-button>
          <el-button @click="change_btn(scope.row)" plain :type="scope.row.status === 1 ? 'danger' : 'primary'"
            :disabled="!canToggleStatus(scope.row)">
            {{ scope.row.status === 1 ? '禁用' : '启用' }}
          </el-button>
          <el-button @click="delete_btn(scope.row)" type="danger" :disabled="!canDelete(scope.row)">删除
          </el-button>
        </template>
      </el-table-column>
      <template #empty>
        <el-empty description=" 没有数据" />
      </template>
    </el-table>

    <!-- element ui 官方推荐使用 v-model 双向绑定 而不是使用事件监听 -->
    <!-- 但是为了监听后还要调用相关函数，看来只能用事件了... -->
    <!-- 有没有办法让v-model的值发生改变时自动触发更新函数？ -->
    <el-pagination class="page" background layout="total, sizes, prev, pager, next, jumper" :total="pageData.total"
      :page-sizes="[2, 4, 6, 8]" v-model:current-page="pageData.page" v-model:page-size="pageData.pageSize"
      @current-change="handleCurrentChange" @size-change="handleSizeChange" />

    <!-- 窗口分配弹窗 -->
    <el-dialog v-model="windowDialogVisible" title="分配管理窗口" width="500px">
      <p style="margin-bottom: 15px;">为员工 <strong>{{ currentEmployee?.name }}</strong> 分配可管理的窗口：</p>
      <el-checkbox-group v-model="selectedWindowIds">
        <el-checkbox v-for="window in windowList" :key="window.id" :value="window.id" :label="window.name"
          style="margin-bottom: 10px; display: block;">
          {{ window.name }}
        </el-checkbox>
      </el-checkbox-group>
      <template #footer>
        <el-button @click="windowDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="saveWindowAssign">确定</el-button>
      </template>
    </el-dialog>
  </el-card>
</template>


<style lang="less" scoped>
// element-plus的样式修改
.el-table {
  width: 90%;
  height: 500px;
  margin: 3rem auto;
  text-align: center;
  border: 1px solid #e4e4e4;
}

:deep(.el-table tr) {
  font-size: 12px;
}

.el-button {
  width: 45px;
  font-size: 12px;
}

.el-pagination {
  justify-content: center;
}

// 自定义样式
body {
  background-color: #c91c1c;
}

.horizontal {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin: 0 80px;

  .input {
    width: 240px;
  }

  .btn {
    width: 120px;
  }
}

img {
  width: 50px;
  height: 50px;
  border-radius: 10px;
}
</style>