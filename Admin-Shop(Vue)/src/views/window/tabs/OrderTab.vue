<script setup lang="ts">
import { ref, inject, computed, onMounted, reactive } from 'vue'
import { getOrderDetailPageAPI, completeOrderAPI, orderCancelAPI } from '@/api/order'
import { ElMessage, ElMessageBox } from 'element-plus'

// 从父组件注入windowId
const windowId = inject<any>('windowId')

// ------ 类型定义 ------
interface Order {
    id: number
    number: string
    pickupCode: string
    status: number
    consignee: string
    phone: string
    dormitory: string
    amount: number
    orderTime: string
    remark: string
}

// ------ 数据 ------
const orderList = ref<Order[]>([])
const loading = ref(false)
const pageData = reactive({
    page: 1,
    pageSize: 10,
    total: 0,
    status: undefined as number | undefined
})

// 订单状态选项
const statusOptions = [
    { value: undefined, label: '全部订单' },
    { value: 1, label: '待付款' },
    { value: 2, label: '已付款' },
    { value: 3, label: '部分完成' },
    { value: 4, label: '已完成' },
    { value: 5, label: '已取消' }
]

// 获取状态标签类型
const getStatusType = (status: number) => {
    const types: Record<number, string> = {
        1: 'info',
        2: 'primary',
        3: 'warning',
        4: 'success',
        5: 'danger'
    }
    return types[status] || 'info'
}

// 获取状态文本
const getStatusText = (status: number) => {
    const texts: Record<number, string> = {
        1: '待付款',
        2: '已付款',
        3: '部分完成',
        4: '已完成',
        5: '已取消'
    }
    return texts[status] || '未知'
}

// ------ 方法 ------

// 获取订单列表
const getOrderList = async () => {
    loading.value = true
    try {
        const { data: res } = await getOrderDetailPageAPI({
            page: pageData.page,
            pageSize: pageData.pageSize,
            status: pageData.status,
            windowId: windowId?.value
        })
        orderList.value = res.data?.records || []
        pageData.total = res.data?.total || 0
    } catch (error) {
        console.error('获取订单列表失败', error)
    } finally {
        loading.value = false
    }
}

// 完成订单
const completeOrder = async (order: Order) => {
    try {
        await completeOrderAPI({ id: order.id })
        ElMessage.success('订单已完成')
        getOrderList()
    } catch (error) {
        console.error('完成订单失败', error)
    }
}

// 取消订单
const cancelOrder = (order: Order) => {
    ElMessageBox.prompt('请输入取消原因', '取消订单', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPlaceholder: '请输入取消原因'
    }).then(async ({ value }) => {
        await orderCancelAPI({ id: order.id, cancelReason: value || '管理员取消' })
        ElMessage.success('订单已取消')
        getOrderList()
    }).catch(() => {
        ElMessage.info('已取消操作')
    })
}

// 分页变化
const handleCurrentChange = (val: number) => {
    pageData.page = val
    getOrderList()
}

const handleSizeChange = (val: number) => {
    pageData.pageSize = val
    getOrderList()
}

onMounted(() => {
    getOrderList()
})
</script>

<template>
    <el-card shadow="never">
        <!-- 筛选区域 -->
        <div class="filter-bar">
            <el-select v-model="pageData.status" placeholder="订单状态" clearable @change="getOrderList"
                style="width: 150px">
                <el-option v-for="opt in statusOptions" :key="opt.value" :label="opt.label" :value="opt.value" />
            </el-select>
            <el-button type="primary" @click="getOrderList">刷新</el-button>
        </div>

        <!-- 订单列表 -->
        <el-table v-loading="loading" :data="orderList" stripe>
            <el-table-column prop="number" label="订单号" width="180" />
            <el-table-column prop="pickupCode" label="取餐码" width="100" align="center">
                <template #default="{ row }">
                    <el-tag type="warning" size="large" effect="dark">{{ row.pickupCode || '-' }}</el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="status" label="状态" width="100" align="center">
                <template #default="{ row }">
                    <el-tag :type="getStatusType(row.status)">{{ getStatusText(row.status) }}</el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="consignee" label="取餐人" width="100" />
            <el-table-column prop="phone" label="电话" width="120" />
            <el-table-column prop="dormitory" label="宿舍" width="100" />
            <el-table-column prop="amount" label="金额" width="100" align="right">
                <template #default="{ row }">
                    ¥{{ row.amount?.toFixed(2) }}
                </template>
            </el-table-column>
            <el-table-column prop="orderTime" label="下单时间" width="180" />
            <el-table-column prop="remark" label="备注" show-overflow-tooltip />
            <el-table-column label="操作" width="150" align="center" fixed="right">
                <template #default="{ row }">
                    <el-button v-if="row.status === 2" size="small" type="success" @click="completeOrder(row)">
                        完成
                    </el-button>
                    <el-button v-if="row.status < 4" size="small" type="danger" @click="cancelOrder(row)">
                        取消
                    </el-button>
                </template>
            </el-table-column>
            <template #empty>
                <el-empty description="暂无订单数据" />
            </template>
        </el-table>

        <!-- 分页 -->
        <el-pagination class="pagination" background layout="total, sizes, prev, pager, next, jumper"
            :total="pageData.total" :page-sizes="[10, 20, 50]" v-model:current-page="pageData.page"
            v-model:page-size="pageData.pageSize" @current-change="handleCurrentChange"
            @size-change="handleSizeChange" />
    </el-card>
</template>

<style lang="less" scoped>
.filter-bar {
    display: flex;
    gap: 12px;
    margin-bottom: 16px;
}

.pagination {
    margin-top: 16px;
    justify-content: center;
}

.el-table {
    width: 100%;
}
</style>
