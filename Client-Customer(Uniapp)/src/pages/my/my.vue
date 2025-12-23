<template>
  <view class="page">
    <!-- 1、个人信息区域 -->
    <view class="user-header" @click="!isLoggedIn && goLogin()">
      <image class="avatar" :src="user.pic || '../../static/images/user_default.png'"></image>
      <view class="user-info">
        <template v-if="isLoggedIn">
          <view class="name-row">
            <text class="name">{{ user.name || '未设置昵称' }}</text>
            <image v-if="user.gender === 0" class="gender-icon" src="../../static/icon/girl.png"></image>
            <image v-else class="gender-icon" src="../../static/icon/boy.png"></image>
          </view>
          <text class="phone">{{ user.phone || '未设置手机号' }}</text>
        </template>
        <template v-else>
          <text class="login-text">点击登录</text>
          <text class="login-hint">登录后享受更多服务</text>
        </template>
      </view>
    </view>

    <!-- 2、余额卡片 -->
    <view class="balance-card" v-if="isLoggedIn">
      <view class="balance-info">
        <text class="balance-label">账户余额</text>
        <view class="balance-amount">
          <text class="currency">¥</text>
          <text class="amount">{{ balance }}</text>
        </view>
      </view>
      <button class="recharge-btn" @click="handleRecharge">充值</button>
    </view>

    <!-- 3、功能菜单列表 -->
    <view class="menu-card">
      <view class="menu-item" @click="handleMenuClick('address')">
        <view class="menu-left">
          <image class="menu-icon" src="../../static/icon/address.png" mode="aspectFit"></image>
          <text class="menu-text">地址管理</text>
        </view>
        <image class="arrow-icon" src="../../static/icon/toRight.png" mode="aspectFit"></image>
      </view>
      <view class="menu-item" @click="handleMenuClick('history')">
        <view class="menu-left">
          <image class="menu-icon" src="../../static/icon/history.png" mode="aspectFit"></image>
          <text class="menu-text">历史订单</text>
        </view>
        <image class="arrow-icon" src="../../static/icon/toRight.png" mode="aspectFit"></image>
      </view>
      <view class="menu-item" @click="handleMenuClick('setting')">
        <view class="menu-left">
          <image class="menu-icon" src="../../static/icon/my.png" mode="aspectFit"></image>
          <text class="menu-text">个人设置</text>
        </view>
        <image class="arrow-icon" src="../../static/icon/toRight.png" mode="aspectFit"></image>
      </view>
    </view>

    <!-- 4、退出登录按钮 -->
    <view class="logout-card" v-if="isLoggedIn">
      <button class="logout-btn" @click="handleLogout">退出登录</button>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { ref, reactive } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/modules/user'
import { getUserInfoAPI, rechargeAPI } from '@/api/user'

const userStore = useUserStore()

const isLoggedIn = ref(!!userStore.profile)
const balance = ref('0.00')

const user = reactive({
  id: userStore.profile?.id ?? 0,
  name: '',
  gender: 1,
  phone: '',
  pic: '',
})

onShow(async () => {
  isLoggedIn.value = !!userStore.profile
  user.id = userStore.profile?.id ?? 0

  if (isLoggedIn.value && user.id) {
    await getUserInfo(user.id)
  }
})

const getUserInfo = async (id: number) => {
  try {
    const res = await getUserInfoAPI(id)
    user.name = res.data.name || ''
    user.gender = res.data.gender ?? 1
    user.phone = res.data.phone || ''
    user.pic = res.data.pic || ''
    balance.value = (res.data.balance ?? 0).toFixed(2)
  } catch (error) {
    console.error('获取用户信息失败', error)
  }
}

const goLogin = () => {
  uni.navigateTo({ url: '/pages/login/login' })
}

const handleMenuClick = (type: string) => {
  if (!isLoggedIn.value) {
    uni.showToast({ title: '请先登录', icon: 'none' })
    setTimeout(() => goLogin(), 1000)
    return
  }

  const routes: Record<string, string> = {
    address: '/pages/address/address',
    history: '/pages/history/history',
    setting: '/pages/updateMy/updateMy',
  }
  if (routes[type]) {
    uni.navigateTo({ url: routes[type] })
  }
}

// 点击充值，直接+100
const handleRecharge = async () => {
  try {
    await rechargeAPI(100)
    uni.showToast({ title: '充值成功 +100', icon: 'success' })
    if (user.id) {
      await getUserInfo(user.id)
    }
  } catch (error) {
    console.error('充值失败', error)
  }
}

const handleLogout = () => {
  uni.showModal({
    title: '提示',
    content: '确定要退出登录吗？',
    success: (res) => {
      if (res.confirm) {
        userStore.clearProfile()
        isLoggedIn.value = false
        user.id = 0
        user.name = ''
        user.gender = 1
        user.phone = ''
        user.pic = ''
        balance.value = '0.00'
        uni.showToast({ title: '已退出登录', icon: 'success' })
      }
    }
  })
}
</script>

<style lang="less" scoped>
.page {
  min-height: 100vh;
  background-color: #f5f5f5;
}

.user-header {
  display: flex;
  align-items: center;
  padding: 50rpx 30rpx;
  background: linear-gradient(135deg, #00aaff 0%, #0088cc 100%);

  .avatar {
    width: 120rpx;
    height: 120rpx;
    border-radius: 50%;
    border: 4rpx solid rgba(255, 255, 255, 0.5);
    background-color: #fff;
    flex-shrink: 0;
  }

  .user-info {
    margin-left: 24rpx;
    flex: 1;

    .name-row {
      display: flex;
      align-items: center;

      .name {
        font-size: 34rpx;
        font-weight: 600;
        color: #fff;
      }

      .gender-icon {
        width: 32rpx;
        height: 32rpx;
        margin-left: 12rpx;
      }
    }

    .phone {
      display: block;
      margin-top: 12rpx;
      font-size: 26rpx;
      color: rgba(255, 255, 255, 0.8);
    }

    .login-text {
      display: block;
      font-size: 34rpx;
      font-weight: 600;
      color: #fff;
    }

    .login-hint {
      display: block;
      margin-top: 12rpx;
      font-size: 26rpx;
      color: rgba(255, 255, 255, 0.8);
    }
  }
}

.balance-card {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: -20rpx 20rpx 20rpx;
  padding: 30rpx;
  background-color: #fff;
  border-radius: 16rpx;
  box-shadow: 0 4rpx 20rpx rgba(0, 0, 0, 0.08);

  .balance-info {
    .balance-label {
      font-size: 26rpx;
      color: #999;
    }

    .balance-amount {
      display: flex;
      align-items: baseline;
      margin-top: 8rpx;

      .currency {
        font-size: 28rpx;
        color: #ff6600;
        font-weight: 600;
      }

      .amount {
        font-size: 44rpx;
        color: #ff6600;
        font-weight: 700;
        margin-left: 4rpx;
      }
    }
  }

  .recharge-btn {
    padding: 0 36rpx;
    height: 64rpx;
    line-height: 64rpx;
    background: linear-gradient(135deg, #ff6600 0%, #ff8800 100%);
    color: #fff;
    font-size: 28rpx;
    border-radius: 32rpx;
    border: none;
  }
}

.menu-card {
  margin: 20rpx;
  background-color: #fff;
  border-radius: 16rpx;
  overflow: hidden;

  .menu-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 32rpx 30rpx;
    border-bottom: 1rpx solid #f5f5f5;

    &:last-child {
      border-bottom: none;
    }

    .menu-left {
      display: flex;
      align-items: center;

      .menu-icon {
        width: 40rpx;
        height: 40rpx;
      }

      .menu-text {
        margin-left: 20rpx;
        font-size: 30rpx;
        color: #333;
      }
    }

    .arrow-icon {
      width: 24rpx;
      height: 24rpx;
      opacity: 0.4;
    }
  }
}

.logout-card {
  margin: 40rpx 20rpx;

  .logout-btn {
    width: 100%;
    height: 88rpx;
    line-height: 88rpx;
    background-color: #fff;
    color: #ff4d4f;
    font-size: 30rpx;
    border-radius: 16rpx;
    border: none;
  }
}
</style>
