<template>
  <view class="container">
    <view class="form">
      <view class="form-item">
        <text class="label">联系人</text>
        <input class="input" v-model="form.consignee" placeholder="请输入联系人姓名" maxlength="10" />
      </view>

      <view class="form-item">
        <text class="label">手机号</text>
        <input class="input" v-model="form.phone" type="number" placeholder="请输入手机号" maxlength="11" />
      </view>

      <view class="form-item">
        <text class="label">地址</text>
        <input class="input" v-model="form.dormitory" placeholder="如：12栋305、教学楼A301" maxlength="50" />
      </view>

      <view class="form-item switch-item">
        <text class="label">设为默认地址</text>
        <switch :checked="form.isDefault === 1" @change="onDefaultChange" color="#00aaff" />
      </view>
    </view>

    <view class="btn-wrapper">
      <button class="save-btn" @click="saveAddress">保存</button>
      <button v-if="isEdit" class="delete-btn" @click="deleteAddress">删除地址</button>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { ref, reactive } from 'vue'
import { addAddressAPI, deleteAddressAPI, getAddressByIdAPI, updateAddressAPI } from '@/api/address'
import { onLoad } from '@dcloudio/uni-app'
import type { Address } from '@/types/address'

const isEdit = ref(false)
const addressId = ref<number>()

const form = reactive<Address>({
  consignee: '',
  phone: '',
  dormitory: '',
  isDefault: 0,
})

onLoad(async (options) => {
  if (options?.id) {
    isEdit.value = true
    addressId.value = Number(options.id)
    uni.setNavigationBarTitle({ title: '编辑地址' })
    await loadAddress(addressId.value)
  } else {
    uni.setNavigationBarTitle({ title: '新增地址' })
  }
})

const loadAddress = async (id: number) => {
  const res = await getAddressByIdAPI(id)
  if (res.code === 1 && res.data) {
    form.consignee = res.data.consignee || ''
    form.phone = res.data.phone || ''
    form.dormitory = res.data.dormitory || ''
    form.isDefault = res.data.isDefault || 0
  }
}

const onDefaultChange = (e: any) => {
  form.isDefault = e.detail.value ? 1 : 0
}

const saveAddress = async () => {
  // 校验
  if (!form.consignee?.trim()) {
    return uni.showToast({ title: '请输入联系人', icon: 'none' })
  }
  if (!form.phone?.trim()) {
    return uni.showToast({ title: '请输入手机号', icon: 'none' })
  }
  const phoneReg = /^1[3-9]\d{9}$/
  if (!phoneReg.test(form.phone)) {
    return uni.showToast({ title: '手机号格式不正确', icon: 'none' })
  }
  if (!form.dormitory?.trim()) {
    return uni.showToast({ title: '请输入地址', icon: 'none' })
  }

  try {
    if (isEdit.value) {
      await updateAddressAPI({ ...form, id: addressId.value })
    } else {
      await addAddressAPI(form)
    }
    uni.showToast({ title: '保存成功', icon: 'success' })
    setTimeout(() => {
      uni.navigateBack()
    }, 1000)
  } catch (e) {
    console.error('保存地址失败', e)
  }
}

const deleteAddress = async () => {
  uni.showModal({
    title: '提示',
    content: '确定删除该地址吗？',
    success: async (res) => {
      if (res.confirm && addressId.value) {
        await deleteAddressAPI(addressId.value)
        uni.showToast({ title: '删除成功', icon: 'success' })
        setTimeout(() => {
          uni.navigateBack()
        }, 1000)
      }
    },
  })
}
</script>

<style lang="less" scoped>
.container {
  min-height: 100vh;
  background-color: #f5f5f5;
}

.form {
  background-color: #fff;
  margin: 20rpx;
  border-radius: 16rpx;
  padding: 0 30rpx;
}

.form-item {
  display: flex;
  align-items: center;
  padding: 30rpx 0;
  border-bottom: 1rpx solid #f0f0f0;

  &:last-child {
    border-bottom: none;
  }

  .label {
    width: 140rpx;
    font-size: 28rpx;
    color: #333;
    flex-shrink: 0;
  }

  .input {
    flex: 1;
    font-size: 28rpx;
    color: #333;
  }
}

.switch-item {
  justify-content: space-between;
}

.btn-wrapper {
  padding: 40rpx 30rpx;

  .save-btn {
    width: 100%;
    height: 88rpx;
    line-height: 88rpx;
    background-color: #00aaff;
    color: #fff;
    font-size: 32rpx;
    border-radius: 44rpx;
    border: none;
  }

  .delete-btn {
    width: 100%;
    height: 88rpx;
    line-height: 88rpx;
    background-color: #f5f5f5;
    color: #666;
    font-size: 32rpx;
    border-radius: 44rpx;
    border: none;
    margin-top: 20rpx;
  }
}
</style>
