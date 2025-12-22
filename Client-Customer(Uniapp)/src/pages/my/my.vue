<template>
  <view class="page">
    <!-- 1、个人信息区域 -->
    <view class="my_info" @click="!isLoggedIn && goLogin()">
      <!-- 已登录：显示用户信息 -->
      <template v-if="isLoggedIn">
        <view class="head">
          <image class="head_image" :src="user.pic || '../../static/images/user_default.png'"></image>
        </view>
        <view class="phone_name">
          <view class="name">
            <text class="name_text">{{ user.name || '未设置昵称' }}</text>
            <image v-if="user.gender === 0" class="name_type" src="../../static/icon/girl.png"></image>
            <image v-else class="name_type" src="../../static/icon/boy.png"></image>
          </view>
          <view class="phone">
            <text class="phone_text">{{ user.phone || '未设置手机号' }}</text>
          </view>
        </view>
      </template>
      <!-- 未登录：显示登录引导 -->
      <template v-else>
        <view class="head">
          <image class="head_image" src="../../static/images/user_default.png"></image>
        </view>
        <view class="login_guide">
          <text class="login_text">点击登录</text>
          <text class="login_hint">登录后享受更多服务</text>
        </view>
      </template>
    </view>

    <!-- 2、功能菜单列表 -->
    <view class="white_box">
      <view class="bottom_text" @click="handleMenuClick('address')">
        <image class="icon" src="../../static/icon/address.png"></image>
        <view class="text_left">地址管理</view>
        <view class="right_image">
          <image class="to_right" src="../../static/icon/toRight.png"></image>
        </view>
      </view>
      <view class="bottom_text" @click="handleMenuClick('history')">
        <image class="icon" src="../../static/icon/history.png"></image>
        <view class="text_left">历史订单</view>
        <view class="right_image">
          <image class="to_right" src="../../static/icon/toRight.png"></image>
        </view>
      </view>
      <view class="bottom_text" @click="handleMenuClick('setting')">
        <image class="icon" src="../../static/icon/my.png"></image>
        <view class="text_left">信息设置</view>
        <view class="right_image">
          <image class="to_right" src="../../static/icon/toRight.png"></image>
        </view>
      </view>
    </view>

    <!-- 3、退出登录按钮 -->
    <view class="white_box" v-if="isLoggedIn">
      <view class="bottom_text logout_btn" @click="handleLogout">
        <view class="text_center">退出登录</view>
      </view>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { ref, reactive } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/modules/user'
import { getUserInfoAPI } from '@/api/user'

const userStore = useUserStore()

// 检查用户是否登录
const isLoggedIn = ref(!!userStore.profile)

const user = reactive({
  id: userStore.profile?.id ?? 0,
  name: '',
  gender: 1,
  phone: '',
  pic: '',
})

// 使用 onShow 而不是 onLoad，因为 TabBar 页面切换时不会触发 onLoad
onShow(async () => {
  // 每次页面显示时重新检查登录状态
  isLoggedIn.value = !!userStore.profile
  user.id = userStore.profile?.id ?? 0

  // 已登录则获取用户信息
  if (isLoggedIn.value && user.id) {
    await getUserInfo(user.id)
  }
})

const getUserInfo = async (id: number) => {
  try {
    const res = await getUserInfoAPI(id)
    console.log('用户信息', res)
    user.name = res.data.name as string
    user.gender = res.data.gender ?? 1
    user.phone = res.data.phone as string
    user.pic = res.data.pic as string
  } catch (error) {
    console.error('获取用户信息失败', error)
  }
}

// 跳转到登录页
const goLogin = () => {
  uni.navigateTo({
    url: '/pages/login/login',
  })
}

// 菜单点击处理（需要登录的功能）
const handleMenuClick = (type: string) => {
  if (!isLoggedIn.value) {
    uni.showToast({ title: '请先登录', icon: 'none' })
    setTimeout(() => {
      goLogin()
    }, 1000)
    return
  }

  switch (type) {
    case 'address':
      uni.navigateTo({ url: '/pages/address/address' })
      break
    case 'history':
      uni.navigateTo({ url: '/pages/history/history' })
      break
    case 'setting':
      uni.navigateTo({ url: '/pages/updateMy/updateMy' })
      break
  }
}

// 退出登录
const handleLogout = () => {
  uni.showModal({
    title: '提示',
    content: '确定要退出登录吗？',
    success: (res) => {
      if (res.confirm) {
        // 清除用户信息
        userStore.clearProfile()
        isLoggedIn.value = false
        // 重置用户数据
        user.id = 0
        user.name = ''
        user.gender = 1
        user.phone = ''
        user.pic = ''
        uni.showToast({ title: '已退出登录', icon: 'success' })
      }
    }
  })
}
</script>

<style lang="less" scoped>
.my_info {
  height: 200rpx;
  width: 750rpx;
  background-color: #cceeff;
  display: flex;
  align-items: center;

  .head {
    width: 200rpx;
    height: 200rpx;
    display: flex;
    align-items: center;
    justify-content: center;

    .head_image {
      width: 120rpx;
      height: 120rpx;
      border-radius: 50%;
      background-color: #fff;
    }
  }

  .phone_name {
    flex: 1;

    .name {
      display: flex;
      align-items: center;

      .name_text {
        font-size: 32rpx;
        font-weight: 550;
        color: #333333;
        margin-right: 12rpx;
      }

      .name_type {
        width: 32rpx;
        height: 32rpx;
      }
    }

    .phone {
      margin-top: 10rpx;

      .phone_text {
        font-size: 28rpx;
        color: #666666;
      }
    }
  }

  .login_guide {
    flex: 1;

    .login_text {
      display: block;
      font-size: 36rpx;
      font-weight: 600;
      color: #333333;
    }

    .login_hint {
      display: block;
      margin-top: 10rpx;
      font-size: 26rpx;
      color: #666666;
    }
  }
}

.white_box {
  margin: 20rpx;
  background-color: #fff;
  border-radius: 20rpx;

  .bottom_text {
    display: flex;
    align-items: center;
    margin: 0 20rpx 0 30rpx;
    height: 100rpx;
    line-height: 100rpx;

    .icon {
      width: 50rpx;
      height: 45rpx;
      padding: 8rpx 20rpx 0 0;
      vertical-align: middle;
    }

    .text_left {
      flex: 1;
      font-size: 32rpx;
      color: #333333;
    }

    .text_center {
      flex: 1;
      font-size: 32rpx;
      color: #ff4d4f;
      text-align: center;
    }

    .right_image {
      width: 30rpx;
      height: 100%;
      position: relative;

      .to_right {
        width: 30rpx;
        height: 30rpx;
        position: absolute;
        top: 50%;
        right: 6rpx;
        transform: translateY(-50%);
      }
    }
  }

  .logout_btn {
    justify-content: center;
  }
}
</style>

<style>
page {
  background-color: #f8f8f8;
}
</style>
