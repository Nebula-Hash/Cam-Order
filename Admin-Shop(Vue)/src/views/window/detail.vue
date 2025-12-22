<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { getWindowByIdAPI } from '@/api/window'
import { useUserInfoStore } from '@/store'
import { ElMessage } from 'element-plus'

// Tab子组件
import OrderTab from './tabs/OrderTab.vue'
import CategoryTab from './tabs/CategoryTab.vue'
import DishTab from './tabs/DishTab.vue'
import SetmealTab from './tabs/SetmealTab.vue'

// ------ 类型定义 ------
interface WindowInfo {
    id: number
    name: string
    location: string
    description: string
    pic: string
    status: number
}

// ------ 数据 ------
const route = useRoute()
const router = useRouter()
const userInfoStore = useUserInfoStore()

const windowId = computed(() => Number(route.params.windowId))
const windowInfo = ref<WindowInfo | null>(null)
const activeTab = ref('order')
const loading = ref(false)

// 提供windowId给子组件使用
provide('windowId', windowId)

const isSuperAdmin = computed(() => {
    return userInfoStore.userInfo?.role === 2
})

// Tab配置
const tabs = [
    { name: 'order', label: '订单管理', icon: 'Collection' },
    { name: 'category', label: '分类管理', icon: 'Postcard' },
    { name: 'dish', label: '菜品管理', icon: 'Dish' },
    { name: 'setmeal', label: '套餐管理', icon: 'Box' }
]

// ------ 方法 ------

// 获取窗口详情
const getWindowInfo = async () => {
    loading.value = true
    try {
        const { data: res } = await getWindowByIdAPI(windowId.value)
        if (res.data) {
            windowInfo.value = res.data
        } else {
            ElMessage.error('窗口不存在')
            router.push('/window')
        }
    } catch (error) {
        console.error('获取窗口信息失败', error)
        ElMessage.error('获取窗口信息失败')
    } finally {
        loading.value = false
    }
}

// 返回窗口列表
const goBack = () => {
    router.push('/window')
}

onMounted(() => {
    getWindowInfo()
})
</script>

<template>
    <div v-loading="loading" class="window-detail">
        <!-- 顶部导航 -->
        <div class="detail-header">
            <div class="header-left">
                <el-button type="text" @click="goBack" class="back-btn">
                    <el-icon size="20">
                        <ArrowLeft />
                    </el-icon>
                    返回
                </el-button>
                <div class="window-info">
                    <h2>{{ windowInfo?.name || '加载中...' }}</h2>
                    <el-tag v-if="windowInfo" :type="windowInfo.status === 1 ? 'success' : 'danger'" effect="plain">
                        {{ windowInfo.status === 1 ? '营业中' : '已打烊' }}
                    </el-tag>
                </div>
            </div>
            <div class="header-right">
                <span class="location" v-if="windowInfo?.location">
                    <el-icon>
                        <Location />
                    </el-icon>
                    {{ windowInfo.location }}
                </span>
            </div>
        </div>

        <!-- Tab导航 -->
        <div class="tab-container">
            <el-tabs v-model="activeTab" type="card" class="custom-tabs">
                <el-tab-pane v-for="tab in tabs" :key="tab.name" :name="tab.name">
                    <template #label>
                        <span class="tab-label">
                            <el-icon>
                                <component :is="tab.icon" />
                            </el-icon>
                            {{ tab.label }}
                        </span>
                    </template>
                </el-tab-pane>
            </el-tabs>
        </div>

        <!-- Tab内容区域 -->
        <div class="tab-content">
            <OrderTab v-if="activeTab === 'order'" />
            <CategoryTab v-if="activeTab === 'category'" />
            <DishTab v-if="activeTab === 'dish'" />
            <SetmealTab v-if="activeTab === 'setmeal'" />
        </div>
    </div>
</template>

<style lang="less" scoped>
.window-detail {
    min-height: calc(100vh - 120px);
    background: #f5f7fa;
}

.detail-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 24px;
    background: #fff;
    border-bottom: 1px solid #ebeef5;

    .header-left {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .back-btn {
        display: flex;
        align-items: center;
        gap: 4px;
        font-size: 14px;
        color: #606266;
        padding: 8px 12px;
        border-radius: 4px;

        &:hover {
            background: #f5f7fa;
            color: #409eff;
        }
    }

    .window-info {
        display: flex;
        align-items: center;
        gap: 12px;

        h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 600;
            color: #303133;
        }
    }

    .header-right {
        .location {
            display: flex;
            align-items: center;
            gap: 4px;
            font-size: 14px;
            color: #909399;
        }
    }
}

.tab-container {
    background: #fff;
    padding: 0 24px;
    border-bottom: 1px solid #ebeef5;

    .custom-tabs {
        :deep(.el-tabs__header) {
            margin: 0;
            border: none;
        }

        :deep(.el-tabs__nav-wrap::after) {
            display: none;
        }

        :deep(.el-tabs__item) {
            height: 50px;
            line-height: 50px;
            font-size: 14px;
            color: #606266;

            &.is-active {
                color: #409eff;
                font-weight: 500;
            }

            &:hover {
                color: #409eff;
            }
        }
    }

    .tab-label {
        display: flex;
        align-items: center;
        gap: 6px;
    }
}

.tab-content {
    padding: 24px;
    min-height: 400px;
}
</style>
