<template>
  <view class="cart-page">
    <!-- 顶部标题 -->
    <view class="header">
      <text class="title">购物车</text>
    </view>

    <!-- 未登录状态 -->
    <view v-if="!isLogin" class="empty">
      <image src="../../static/images/cart_empty.png" mode="aspectFit" />
      <text class="empty-text">请先登录查看购物车</text>
      <view class="go-order" @tap="goLogin">去登录</view>
    </view>

    <!-- 购物车为空 -->
    <view v-else-if="cartList.length === 0" class="empty">
      <image src="../../static/images/cart_empty.png" mode="aspectFit" />
      <text class="empty-text">购物车是空的</text>
      <view class="go-order" @tap="goIndex">去点餐</view>
    </view>

    <!-- 购物车列表（按窗口分组） -->
    <view v-else class="cart-content">
      <view v-for="(group, windowId) in groupedCart" :key="windowId" class="window-group">
        <view class="window-header">
          <text class="window-name">{{ group.windowName || '窗口' }}</text>
        </view>
        <view v-for="item in group.items" :key="item.id" class="cart-item">
          <image class="item-image" :src="item.pic || '../../static/images/logo.png'" mode="aspectFill" />
          <view class="item-info">
            <view class="item-name">{{ item.name }}</view>
            <view v-if="item.dishFlavor" class="item-flavor">{{ item.dishFlavor }}</view>
            <view class="item-price">
              <text class="symbol">¥</text>
              <text class="amount">{{ item.amount }}</text>
            </view>
          </view>
          <view class="item-actions">
            <image src="../../static/icon/sub.png" class="action-btn" @tap="subItem(item)" />
            <text class="item-number">{{ item.number }}</text>
            <image src="../../static/icon/add.png" class="action-btn" @tap="addItem(item)" />
          </view>
        </view>
      </view>

      <!-- 清空购物车 -->
      <view class="clear-cart" @tap="clearCart">
        <image src="../../static/icon/clear.png" class="clear-icon" />
        <text>清空购物车</text>
      </view>
    </view>

    <!-- 底部结算栏 -->
    <view v-if="isLogin && cartList.length > 0" class="footer">
      <view class="total-info">
        <text class="total-label">合计：</text>
        <text class="total-symbol">¥</text>
        <text class="total-price">{{ totalPrice.toFixed(2) }}</text>
        <text class="total-count">共{{ totalCount }}件</text>
      </view>
      <view class="submit-btn" @tap="submitOrder">去结算</view>
    </view>
  </view>
</template>

<script setup lang="ts">
import {ref, computed} from 'vue'
import {onShow} from '@dcloudio/uni-app'
import {getCartAPI, addToCartAPI, subCartAPI, cleanCartAPI} from '@/api/cart'
import {isLoggedIn} from '@/utils/http'
import type {CartItem, CartDTO} from '@/types/cart'

const cartList = ref<CartItem[]>([])
const isLogin = ref(false)

// 按窗口分组购物车
const groupedCart = computed(() => {
  const groups: Record<number, {windowName: string; items: CartItem[]}> = {}
  cartList.value.forEach((item) => {
    const windowId = item.windowId || 0
    if (!groups[windowId]) {
      groups[windowId] = {
        windowName: item.windowName || '未知窗口',
        items: [],
      }
    }
    groups[windowId].items.push(item)
  })
  return groups
})

// 总数量
const totalCount = computed(() => {
  return cartList.value.reduce((acc, cur) => acc + cur.number, 0)
})

// 总价格
const totalPrice = computed(() => {
  return cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0)
})

// 获取购物车列表
const getCartList = async () => {
  // 先检查是否登录
  if (!isLoggedIn()) {
    isLogin.value = false
    cartList.value = []
    return
  }
  isLogin.value = true
  try {
    const res = await getCartAPI()
    cartList.value = res.data || []
  } catch (error) {
    console.error('获取购物车失败', error)
    cartList.value = []
  }
}

// 增加数量
const addItem = async (item: CartItem) => {
  const dto: Partial<CartDTO> = {
    dishId: item.dishId,
    setmealId: item.setmealId,
    dishFlavor: item.dishFlavor,
  }
  await addToCartAPI(dto)
  await getCartList()
}

// 减少数量
const subItem = async (item: CartItem) => {
  const dto: Partial<CartDTO> = {
    dishId: item.dishId,
    setmealId: item.setmealId,
    dishFlavor: item.dishFlavor,
  }
  await subCartAPI(dto)
  await getCartList()
}

// 清空购物车
const clearCart = async () => {
  uni.showModal({
    title: '提示',
    content: '确定要清空购物车吗？',
    success: async (res) => {
      if (res.confirm) {
        await cleanCartAPI()
        await getCartList()
      }
    },
  })
}

// 去结算
const submitOrder = () => {
  uni.navigateTo({
    url: '/pages/submit/submit',
  })
}

// 去点餐
const goIndex = () => {
  uni.switchTab({
    url: '/pages/index/index',
  })
}

// 去登录
const goLogin = () => {
  uni.navigateTo({
    url: '/pages/login/login',
  })
}

onShow(() => {
  getCartList()
})
</script>

<style lang="less" scoped>
.cart-page {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 180rpx;
}

.header {
  background-color: #00aaff;
  padding: 30rpx;
  padding-top: calc(30rpx + var(--status-bar-height));

  .title {
    font-size: 36rpx;
    font-weight: bold;
    color: #fff;
  }
}

.empty {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding-top: 200rpx;

  image {
    width: 200rpx;
    height: 200rpx;
    margin-bottom: 30rpx;
  }

  .empty-text {
    font-size: 28rpx;
    color: #999;
    margin-bottom: 40rpx;
  }

  .go-order {
    padding: 20rpx 60rpx;
    background-color: #00aaff;
    color: #fff;
    border-radius: 40rpx;
    font-size: 28rpx;
  }
}

.cart-content {
  padding: 20rpx;
}

.window-group {
  background-color: #fff;
  border-radius: 16rpx;
  margin-bottom: 20rpx;
  overflow: hidden;

  .window-header {
    padding: 20rpx 24rpx;
    border-bottom: 1rpx solid #f0f0f0;

    .window-name {
      font-size: 28rpx;
      font-weight: bold;
      color: #333;
    }
  }
}

.cart-item {
  display: flex;
  align-items: center;
  padding: 24rpx;
  border-bottom: 1rpx solid #f5f5f5;

  &:last-child {
    border-bottom: none;
  }

  .item-image {
    width: 120rpx;
    height: 120rpx;
    border-radius: 12rpx;
    flex-shrink: 0;
  }

  .item-info {
    flex: 1;
    margin-left: 20rpx;
    overflow: hidden;

    .item-name {
      font-size: 28rpx;
      color: #333;
      margin-bottom: 8rpx;
    }

    .item-flavor {
      font-size: 22rpx;
      color: #999;
      margin-bottom: 8rpx;
    }

    .item-price {
      color: #e94e3c;

      .symbol {
        font-size: 22rpx;
      }

      .amount {
        font-size: 30rpx;
        font-weight: bold;
      }
    }
  }

  .item-actions {
    display: flex;
    align-items: center;

    .action-btn {
      width: 48rpx;
      height: 48rpx;
    }

    .item-number {
      min-width: 60rpx;
      text-align: center;
      font-size: 28rpx;
      color: #333;
    }
  }
}

.clear-cart {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 30rpx;
  color: #999;
  font-size: 26rpx;

  .clear-icon {
    width: 32rpx;
    height: 32rpx;
    margin-right: 10rpx;
  }
}

.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20rpx 30rpx;
  padding-bottom: calc(20rpx + env(safe-area-inset-bottom));
  background-color: #fff;
  box-shadow: 0 -2rpx 10rpx rgba(0, 0, 0, 0.05);

  .total-info {
    display: flex;
    align-items: baseline;

    .total-label {
      font-size: 26rpx;
      color: #666;
    }

    .total-symbol {
      font-size: 24rpx;
      color: #e94e3c;
    }

    .total-price {
      font-size: 40rpx;
      font-weight: bold;
      color: #e94e3c;
    }

    .total-count {
      font-size: 22rpx;
      color: #999;
      margin-left: 20rpx;
    }
  }

  .submit-btn {
    padding: 20rpx 60rpx;
    background-color: #00aaff;
    color: #fff;
    border-radius: 40rpx;
    font-size: 28rpx;
    font-weight: bold;
  }
}
</style>
