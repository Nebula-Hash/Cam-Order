<script setup lang="ts">
import { reactive, ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import {
    getWindowListAPI,
    toggleWindowStatusAPI,
    deleteWindowAPI,
    addWindowAPI,
    updateWindowAPI,
    getWindowByIdAPI,
    getEmployeeWindowsAPI
} from '@/api/window'
import { useUserInfoStore } from '@/store'
import { ElMessage, ElMessageBox } from 'element-plus'

// ------ 类型定义 ------
interface Window {
    id: number
    name: string
    location: string
    description: string
    pic: string
    status: number
    sort: number
    createTime: string
    updateTime: string
}

// ------ 数据 ------
const router = useRouter()
const userInfoStore = useUserInfoStore()
const windowList = ref<Window[]>([])
const loading = ref(false)

// 判断是否为超级管理员 (role === 2)
const isSuperAdmin = computed(() => {
    return userInfoStore.userInfo?.role === 2
})

// 弹窗相关
const dialogVisible = ref(false)
const dialogTitle = ref('新增窗口')
const formRef = ref()
const form = reactive({
    id: undefined as number | undefined,
    name: '',
    location: '',
    description: '',
    pic: '',
    sort: 0
})

const rules = {
    name: [
        { required: true, message: '请输入窗口名称', trigger: 'blur' },
        { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
    ],
    location: [
        { required: true, message: '请输入窗口位置', trigger: 'blur' }
    ],
    sort: [
        { required: true, message: '请输入排序', trigger: 'blur' }
    ]
}

// ------ 方法 ------

// 初始化获取窗口列表
const init = async () => {
    loading.value = true
    try {
        if (isSuperAdmin.value) {
            // 超级管理员获取所有窗口
            const { data: res } = await getWindowListAPI()
            windowList.value = res.data || []
        } else {
            // 普通员工获取自己管理的窗口
            const employeeId = userInfoStore.userInfo?.id
            if (employeeId) {
                const { data: res } = await getEmployeeWindowsAPI(employeeId)
                windowList.value = res.data || []
            }
        }
    } catch (error) {
        console.error('获取窗口列表失败', error)
    } finally {
        loading.value = false
    }
}

onMounted(() => {
    init()
})

// 进入窗口详情
const enterWindow = (window: Window) => {
    router.push({
        name: 'window_detail',
        params: { windowId: window.id }
    })
}

// 打开新增弹窗
const openAddDialog = () => {
    dialogTitle.value = '新增窗口'
    resetForm()
    dialogVisible.value = true
}

// 打开编辑弹窗
const openEditDialog = async (row: Window, event: Event) => {
    event.stopPropagation() // 阻止冒泡，避免触发卡片点击
    dialogTitle.value = '编辑窗口'
    const { data: res } = await getWindowByIdAPI(row.id)
    if (res.data) {
        Object.assign(form, res.data)
    }
    dialogVisible.value = true
}

// 重置表单
const resetForm = () => {
    form.id = undefined
    form.name = ''
    form.location = ''
    form.description = ''
    form.pic = ''
    form.sort = 0
}

// 提交表单
const submitForm = async () => {
    const valid = await formRef.value.validate()
    if (!valid) return

    if (form.id) {
        await updateWindowAPI(form)
        ElMessage.success('修改成功')
    } else {
        await addWindowAPI(form)
        ElMessage.success('新增成功')
    }
    dialogVisible.value = false
    init()
}

// 切换状态
const toggleStatus = async (row: Window, event: Event) => {
    event.stopPropagation()
    await toggleWindowStatusAPI(row.id)
    ElMessage.success('状态修改成功')
    init()
}

// 删除窗口
const deleteWindow = (row: Window, event: Event) => {
    event.stopPropagation()
    ElMessageBox.confirm('该操作会永久删除窗口及其关联的分类和菜品，是否继续？', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
    })
        .then(async () => {
            await deleteWindowAPI(row.id)
            ElMessage.success('删除成功')
            init()
        })
        .catch(() => {
            ElMessage.info('已取消删除')
        })
}
</script>

<template>
    <div class="window-container">
        <div class="header">
            <h2>窗口管理</h2>
            <el-button v-if="isSuperAdmin" type="primary" size="large" @click="openAddDialog">
                <el-icon style="margin-right: 8px">
                    <Plus />
                </el-icon>
                新增窗口
            </el-button>
        </div>

        <div v-loading="loading" class="window-grid">
            <!-- 空状态 -->
            <el-empty v-if="windowList.length === 0 && !loading" description="暂无窗口数据">
                <el-button v-if="isSuperAdmin" type="primary" @click="openAddDialog">新增窗口</el-button>
            </el-empty>

            <!-- 窗口卡片列表 -->
            <div v-for="window in windowList" :key="window.id" class="window-card" @click="enterWindow(window)">
                <div class="card-image">
                    <img v-if="window.pic" :src="window.pic" alt="" />
                    <div v-else class="no-image">
                        <el-icon size="48">
                            <Picture />
                        </el-icon>
                    </div>
                    <el-tag class="status-tag" :type="window.status === 1 ? 'success' : 'danger'" effect="dark">
                        {{ window.status === 1 ? '营业中' : '已打烊' }}
                    </el-tag>
                </div>
                <div class="card-content">
                    <h3 class="card-title">{{ window.name }}</h3>
                    <p class="card-location">
                        <el-icon>
                            <Location />
                        </el-icon>
                        {{ window.location || '暂无位置信息' }}
                    </p>
                    <p class="card-desc">{{ window.description || '暂无描述' }}</p>
                </div>
                <div v-if="isSuperAdmin" class="card-actions" @click.stop>
                    <el-button size="small" type="primary" @click="openEditDialog(window, $event)">编辑</el-button>
                    <el-button size="small" :type="window.status === 1 ? 'warning' : 'success'"
                        @click="toggleStatus(window, $event)">
                        {{ window.status === 1 ? '打烊' : '营业' }}
                    </el-button>
                    <el-button size="small" type="danger" @click="deleteWindow(window, $event)">删除</el-button>
                </div>
                <div class="card-arrow">
                    <el-icon size="24">
                        <ArrowRight />
                    </el-icon>
                </div>
            </div>
        </div>

        <!-- 新增/编辑弹窗 -->
        <el-dialog v-model="dialogVisible" :title="dialogTitle" width="500px">
            <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入窗口名称" />
                </el-form-item>
                <el-form-item label="位置" prop="location">
                    <el-input v-model="form.location" placeholder="请输入窗口位置，如：一楼A区" />
                </el-form-item>
                <el-form-item label="描述" prop="description">
                    <el-input v-model="form.description" type="textarea" :rows="3" placeholder="请输入窗口描述" />
                </el-form-item>
                <el-form-item label="图片" prop="pic">
                    <el-input v-model="form.pic" placeholder="请输入图片URL" />
                </el-form-item>
                <el-form-item label="排序" prop="sort">
                    <el-input-number v-model="form.sort" :min="0" :max="999" />
                </el-form-item>
            </el-form>
            <template #footer>
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="submitForm">确定</el-button>
            </template>
        </el-dialog>
    </div>
</template>

<style lang="less" scoped>
.window-container {
    padding: 20px;
    min-height: calc(100vh - 120px);
    background: #f5f7fa;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 24px;

    h2 {
        margin: 0;
        font-size: 24px;
        color: #303133;
    }
}

.window-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 24px;
    min-height: 300px;
}

.window-card {
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;

    &:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);

        .card-arrow {
            opacity: 1;
            right: 16px;
        }
    }
}

.card-image {
    position: relative;
    height: 160px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    overflow: hidden;

    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .no-image {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
        color: rgba(255, 255, 255, 0.6);
    }

    .status-tag {
        position: absolute;
        top: 12px;
        right: 12px;
    }
}

.card-content {
    padding: 16px;

    .card-title {
        margin: 0 0 8px;
        font-size: 18px;
        font-weight: 600;
        color: #303133;
    }

    .card-location {
        display: flex;
        align-items: center;
        gap: 4px;
        margin: 0 0 8px;
        font-size: 14px;
        color: #909399;
    }

    .card-desc {
        margin: 0;
        font-size: 13px;
        color: #606266;
        line-height: 1.5;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
}

.card-actions {
    display: flex;
    gap: 8px;
    padding: 0 16px 16px;
    border-top: 1px solid #ebeef5;
    padding-top: 12px;
}

.card-arrow {
    position: absolute;
    right: 24px;
    top: 50%;
    transform: translateY(-50%);
    opacity: 0;
    color: #409eff;
    transition: all 0.3s ease;
}
</style>
