<script setup lang="ts">
import { ref, inject, reactive, onMounted } from 'vue'
import { getCategoryPageListAPI, updateCategoryStatusAPI, deleteCategoryAPI, addCategoryAPI, updateCategoryAPI, getCategoryByIdAPI } from '@/api/category'
import { ElMessage, ElMessageBox } from 'element-plus'

// 从父组件注入windowId
const windowId = inject<any>('windowId')

// ------ 类型定义 ------
interface Category {
    id: number
    name: string
    type: number
    sort: number
    status: number
    updateTime: string
    windowId: number
}

// ------ 数据 ------
const categoryList = ref<Category[]>([])
const loading = ref(false)
const pageData = reactive({
    page: 1,
    pageSize: 10,
    total: 0,
    name: '',
    type: '' as string | number
})

// 分类类型选项
const typeOptions = [
    { value: 1, label: '菜品分类' },
    { value: 2, label: '套餐分类' }
]

// 对话框相关
const dialogVisible = ref(false)
const dialogTitle = ref('新增分类')
const formData = reactive({
    id: undefined as number | undefined,
    name: '',
    type: 1,
    sort: 0,
    windowId: 0
})

// ------ 方法 ------

// 获取分类列表
const getCategoryList = async () => {
    loading.value = true
    try {
        const { data: res } = await getCategoryPageListAPI({
            page: pageData.page,
            pageSize: pageData.pageSize,
            name: pageData.name || undefined,
            type: pageData.type || undefined,
            windowId: windowId?.value
        })
        categoryList.value = res.data?.records || []
        pageData.total = res.data?.total || 0
    } catch (error) {
        console.error('获取分类列表失败', error)
    } finally {
        loading.value = false
    }
}

// 重置搜索
const resetSearch = () => {
    pageData.name = ''
    pageData.type = ''
    pageData.page = 1
    getCategoryList()
}

// 打开新增对话框
const openAddDialog = () => {
    dialogTitle.value = '新增分类'
    formData.id = undefined
    formData.name = ''
    formData.type = 1
    formData.sort = 0
    formData.windowId = windowId?.value
    dialogVisible.value = true
}

// 打开编辑对话框
const openEditDialog = async (row: Category) => {
    dialogTitle.value = '编辑分类'
    try {
        const { data: res } = await getCategoryByIdAPI(row.id)
        const data = res.data
        formData.id = data.id
        formData.name = data.name
        formData.type = data.type
        formData.sort = data.sort
        formData.windowId = data.windowId
        dialogVisible.value = true
    } catch (error) {
        console.error('获取分类详情失败', error)
    }
}

// 提交表单
const submitForm = async () => {
    if (!formData.name) {
        ElMessage.warning('请输入分类名称')
        return
    }
    try {
        if (formData.id) {
            await updateCategoryAPI(formData)
            ElMessage.success('修改成功')
        } else {
            await addCategoryAPI(formData)
            ElMessage.success('新增成功')
        }
        dialogVisible.value = false
        getCategoryList()
    } catch (error) {
        console.error('保存失败', error)
    }
}

// 修改分类状态
const changeStatus = async (row: Category) => {
    try {
        await updateCategoryStatusAPI(row.id)
        ElMessage.success('状态修改成功')
        getCategoryList()
    } catch (error) {
        console.error('修改状态失败', error)
    }
}

// 删除分类
const deleteCategory = (row: Category) => {
    ElMessageBox.confirm('该操作会永久删除分类，是否继续？', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
    }).then(async () => {
        await deleteCategoryAPI(row.id)
        ElMessage.success('删除成功')
        getCategoryList()
    }).catch(() => {
        ElMessage.info('已取消删除')
    })
}

// 分页变化
const handleCurrentChange = (val: number) => {
    pageData.page = val
    getCategoryList()
}

const handleSizeChange = (val: number) => {
    pageData.pageSize = val
    getCategoryList()
}

onMounted(() => {
    getCategoryList()
})
</script>

<template>
    <el-card shadow="never">
        <!-- 筛选区域 -->
        <div class="filter-bar">
            <el-input v-model="pageData.name" placeholder="分类名称" clearable style="width: 160px" />
            <el-select v-model="pageData.type" placeholder="分类类型" clearable style="width: 140px">
                <el-option v-for="opt in typeOptions" :key="opt.value" :label="opt.label" :value="opt.value" />
            </el-select>
            <el-button type="primary" @click="getCategoryList">查询</el-button>
            <el-button @click="resetSearch">重置</el-button>
            <el-button type="success" @click="openAddDialog">
                <el-icon style="margin-right: 4px">
                    <Plus />
                </el-icon>新增分类
            </el-button>
        </div>

        <!-- 分类列表 -->
        <el-table v-loading="loading" :data="categoryList" stripe>
            <el-table-column prop="name" label="分类名称" align="center" />
            <el-table-column prop="type" label="类别" align="center" width="120">
                <template #default="{ row }">
                    <el-tag :type="row.type === 1 ? 'primary' : 'success'">
                        {{ row.type === 1 ? '菜品分类' : '套餐分类' }}
                    </el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="sort" label="排序" align="center" width="80" />
            <el-table-column prop="status" label="状态" align="center" width="100">
                <template #default="{ row }">
                    <el-tag :type="row.status === 1 ? 'success' : 'danger'" round>
                        {{ row.status === 1 ? '启用' : '停用' }}
                    </el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="updateTime" label="更新时间" width="180" align="center" />
            <el-table-column label="操作" width="220" align="center" fixed="right">
                <template #default="{ row }">
                    <el-button size="small" type="primary" @click="openEditDialog(row)">修改</el-button>
                    <el-button size="small" :type="row.status === 1 ? 'danger' : 'success'" plain
                        @click="changeStatus(row)">
                        {{ row.status === 1 ? '停用' : '启用' }}
                    </el-button>
                    <el-button size="small" type="danger" @click="deleteCategory(row)">删除</el-button>
                </template>
            </el-table-column>
            <template #empty>
                <el-empty description="暂无分类数据" />
            </template>
        </el-table>

        <!-- 分页 -->
        <el-pagination class="pagination" background layout="total, sizes, prev, pager, next, jumper"
            :total="pageData.total" :page-sizes="[10, 20, 50]" v-model:current-page="pageData.page"
            v-model:page-size="pageData.pageSize" @current-change="handleCurrentChange"
            @size-change="handleSizeChange" />

        <!-- 新增/编辑对话框 -->
        <el-dialog v-model="dialogVisible" :title="dialogTitle" width="500px">
            <el-form :model="formData" label-width="80px">
                <el-form-item label="分类名称" required>
                    <el-input v-model="formData.name" placeholder="请输入分类名称" />
                </el-form-item>
                <el-form-item label="分类类型" required>
                    <el-radio-group v-model="formData.type">
                        <el-radio :value="1">菜品分类</el-radio>
                        <el-radio :value="2">套餐分类</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="排序">
                    <el-input-number v-model="formData.sort" :min="0" :max="999" />
                </el-form-item>
            </el-form>
            <template #footer>
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="submitForm">确定</el-button>
            </template>
        </el-dialog>
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
</style>
