<script setup lang="ts">
import { ref, inject, reactive, onMounted } from 'vue'
import { getDishPageListAPI, updateDishStatusAPI, deleteDishesAPI } from '@/api/dish'
import { getCategoryPageListAPI } from '@/api/category'
import { ElMessage, ElMessageBox, ElTable } from 'element-plus'
import { useRouter } from 'vue-router'

// 从父组件注入windowId
const windowId = inject<any>('windowId')
const router = useRouter()

// ------ 类型定义 ------
interface Dish {
    id: number
    name: string
    pic: string
    detail: string
    price: number
    status: number
    categoryId: number
    updateTime: string
}

interface Category {
    id: number
    name: string
}

// ------ 数据 ------
const dishList = ref<Dish[]>([])
const categoryList = ref<Category[]>([])
const loading = ref(false)
const pageData = reactive({
    page: 1,
    pageSize: 10,
    total: 0,
    name: '',
    categoryId: '' as string | number,
    status: '' as string | number
})

// 状态选项
const statusOptions = [
    { value: 1, label: '起售' },
    { value: 0, label: '停售' }
]

// 多选相关
const multiTableRef = ref<InstanceType<typeof ElTable>>()
const multiSelection = ref<Dish[]>([])

// ------ 方法 ------

// 获取分类列表（菜品分类 type=1）
const getCategoryOptions = async () => {
    try {
        const { data: res } = await getCategoryPageListAPI({
            page: 1,
            pageSize: 100,
            type: 1,
            windowId: windowId?.value
        })
        categoryList.value = res.data?.records || []
    } catch (error) {
        console.error('获取分类列表失败', error)
    }
}

// 获取菜品列表
const getDishList = async () => {
    loading.value = true
    try {
        const { data: res } = await getDishPageListAPI({
            page: pageData.page,
            pageSize: pageData.pageSize,
            name: pageData.name || undefined,
            categoryId: pageData.categoryId || undefined,
            status: pageData.status !== '' ? pageData.status : undefined,
            windowId: windowId?.value
        })
        dishList.value = res.data?.records || []
        pageData.total = res.data?.total || 0
    } catch (error) {
        console.error('获取菜品列表失败', error)
    } finally {
        loading.value = false
    }
}

// 重置搜索
const resetSearch = () => {
    pageData.name = ''
    pageData.categoryId = ''
    pageData.status = ''
    pageData.page = 1
    getDishList()
}

// 多选变化
const handleSelectionChange = (val: Dish[]) => {
    multiSelection.value = val
}

// 跳转到新增/编辑页面
const toAddOrEdit = (row?: Dish) => {
    if (row && row.id) {
        router.push({
            path: '/dish/add',
            query: { id: row.id, windowId: windowId?.value }
        })
    } else {
        router.push({
            path: '/dish/add',
            query: { windowId: windowId?.value }
        })
    }
}

// 修改菜品状态
const changeStatus = async (row: Dish) => {
    try {
        await updateDishStatusAPI(row.id)
        ElMessage.success('状态修改成功')
        getDishList()
    } catch (error) {
        console.error('修改状态失败', error)
    }
}

// 删除菜品（支持批量）
const deleteBatch = (row?: Dish) => {
    ElMessageBox.confirm('该操作会永久删除菜品，是否继续？', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
    }).then(async () => {
        try {
            if (row === undefined) {
                // 批量删除
                if (multiSelection.value.length === 0) {
                    ElMessage.warning('请先选择要删除的菜品')
                    return
                }
                const ids = multiSelection.value.map(item => item.id).join(',')
                const res = await deleteDishesAPI(ids)
                if (res.data.code !== 0) return
            } else {
                // 单个删除
                const res = await deleteDishesAPI(String(row.id))
                if (res.data.code !== 0) return
            }
            ElMessage.success('删除成功')
            getDishList()
        } catch (error) {
            console.error('删除失败', error)
        }
    }).catch(() => {
        ElMessage.info('已取消删除')
    })
}

// 获取分类名称
const getCategoryName = (categoryId: number) => {
    const category = categoryList.value.find(item => item.id === categoryId)
    return category?.name || '-'
}

// 分页变化
const handleCurrentChange = (val: number) => {
    pageData.page = val
    getDishList()
}

const handleSizeChange = (val: number) => {
    pageData.pageSize = val
    getDishList()
}

onMounted(() => {
    getCategoryOptions()
    getDishList()
})
</script>

<template>
    <el-card shadow="never">
        <!-- 筛选区域 -->
        <div class="filter-bar">
            <el-input v-model="pageData.name" placeholder="菜品名称" clearable style="width: 160px" />
            <el-select v-model="pageData.categoryId" placeholder="选择分类" clearable style="width: 140px">
                <el-option v-for="item in categoryList" :key="item.id" :label="item.name" :value="item.id" />
            </el-select>
            <el-select v-model="pageData.status" placeholder="状态" clearable style="width: 100px">
                <el-option v-for="opt in statusOptions" :key="opt.value" :label="opt.label" :value="opt.value" />
            </el-select>
            <el-button type="primary" @click="getDishList">查询</el-button>
            <el-button @click="resetSearch">重置</el-button>
            <el-button type="danger" @click="deleteBatch()">批量删除</el-button>
            <el-button type="success" @click="toAddOrEdit()">
                <el-icon style="margin-right: 4px">
                    <Plus />
                </el-icon>添加菜品
            </el-button>
        </div>

        <!-- 菜品列表 -->
        <el-table v-loading="loading" ref="multiTableRef" :data="dishList" stripe
            @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="50" />
            <el-table-column prop="name" label="菜品名称" align="center" />
            <el-table-column prop="pic" label="图片" width="80" align="center">
                <template #default="{ row }">
                    <img v-if="row.pic" :src="row.pic" class="dish-img" />
                    <span v-else>-</span>
                </template>
            </el-table-column>
            <el-table-column prop="detail" label="详情" width="150" align="center" show-overflow-tooltip />
            <el-table-column prop="price" label="价格" width="100" align="center">
                <template #default="{ row }">
                    ¥{{ row.price?.toFixed(2) }}
                </template>
            </el-table-column>
            <el-table-column prop="status" label="状态" width="80" align="center">
                <template #default="{ row }">
                    <el-tag :type="row.status === 1 ? 'success' : 'danger'" round>
                        {{ row.status === 1 ? '起售' : '停售' }}
                    </el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="categoryId" label="所属分类" width="120" align="center">
                <template #default="{ row }">
                    {{ getCategoryName(row.categoryId) }}
                </template>
            </el-table-column>
            <el-table-column prop="updateTime" label="更新时间" width="180" align="center" />
            <el-table-column label="操作" width="200" align="center" fixed="right">
                <template #default="{ row }">
                    <el-button size="small" type="primary" @click="toAddOrEdit(row)">修改</el-button>
                    <el-button size="small" :type="row.status === 1 ? 'danger' : 'success'" plain
                        @click="changeStatus(row)">
                        {{ row.status === 1 ? '停售' : '起售' }}
                    </el-button>
                    <el-button size="small" type="danger" @click="deleteBatch(row)">删除</el-button>
                </template>
            </el-table-column>
            <template #empty>
                <el-empty description="暂无菜品数据" />
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
    flex-wrap: wrap;
}

.pagination {
    margin-top: 16px;
    justify-content: center;
}

.el-table {
    width: 100%;
}

.dish-img {
    width: 50px;
    height: 50px;
    border-radius: 8px;
    object-fit: cover;
}
</style>
