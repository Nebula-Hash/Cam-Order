<template>
  <view class="container">
    <view class="address-list" v-if="addressList && addressList.length > 0">
      <view class="address-item" v-for="item in addressList" :key="item.id" @click="choseAddress(item)">
        <view class="address-info">
          <view class="address-text">{{ item.dormitory }}</view>
          <view class="user-info">
            <text class="name">{{ item.consignee }}</text>
            <text class="phone">{{ item.phone }}</text>
          </view>
        </view>
        <view class="address-actions">
          <view class="default-tag" v-if="item.isDefault === 1">默认</view>
          <image class="edit-icon" src="../../static/icon/edit.png" @click.stop="editAddress(item)" />
        </view>
      </view>
    </view>

    <view v-else class="empty">
      <image src="../../static/images/table_empty.png" mode="aspectFit" />
      <text>暂无收货地址</text>
    </view>

    <view class="add-btn-wrapper">
      <button class="add-btn" @click="addAddress">+ 添加收货地址</button>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { getAddressListAPI } from '@/api/address'
import type { Address } from '@/types/address'
import { useAddressStore } from '@/stores/modules/address'

const store = useAddressStore()
const addressList = ref<Address[]>([])
const addressBackUrl = store.addressBackUrl

onShow(() => {
  getAddressList()
})

const getAddressList = async () => {
  try {
    const res = await getAddressListAPI()
    if (res.code === 1) {
      addressList.value = res.data || []
    }
  } catch (e) {
    console.error('获取地址列表失败', e)
  }
}

const addAddress = () => {
  uni.navigateTo({
    url: '/pages/addOrEditAddress/addOrEditAddress',
  })
}

const editAddress = (item: Address) => {
  uni.navigateTo({
    url: `/pages/addOrEditAddress/addOrEditAddress?id=${item.id}`,
  })
}

const choseAddress = (item: Address) => {
  // 如果是从提交订单页面跳转过来的，选择后返回
  if (addressBackUrl === '/pages/submit/submit') {
    uni.redirectTo({
      url: '/pages/submit/submit?address=' + JSON.stringify(item),
    })
  }
}
</script>

<style lang="less" scoped>
.container {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 140rpx;
}

.address-list {
  padding: 20rpx;
}

.address-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #fff;
  border-radius: 16rpx;
  padding: 30rpx;
  margin-bottom: 20rpx;

  .address-info {
    flex: 1;

    .address-text {
      font-size: 32rpx;
      font-weight: bold;
      color: #333;
      margin-bottom: 16rpx;
    }

    .user-info {
      font-size: 26rpx;
      color: #999;

      .name {
        margin-right: 20rpx;
      }
    }
  }

  .address-actions {
    display: flex;
    align-items: center;

    .default-tag {
      font-size: 22rpx;
      color: #00aaff;
      border: 1rpx solid #00aaff;
      padding: 4rpx 12rpx;
      border-radius: 20rpx;
      margin-right: 20rpx;
    }

    .edit-icon {
      width: 40rpx;
      height: 40rpx;
    }
  }
}

.empty {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 200rpx 0;

  image {
    width: 200rpx;
    height: 200rpx;
    margin-bottom: 20rpx;
  }

  text {
    font-size: 28rpx;
    color: #999;
  }
}

.add-btn-wrapper {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 30rpx;
  background-color: #fff;

  .add-btn {
    width: 100%;
    height: 88rpx;
    line-height: 88rpx;
    background-color: #00aaff;
    color: #fff;
    font-size: 32rpx;
    border-radius: 44rpx;
    border: none;
  }
}
</style>
