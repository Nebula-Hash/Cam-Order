<template>
  <view class="viewport">
    <view class="logo">
      <image src="@/static/images/login.png"></image>
    </view>
    <view class="login">
      <!-- 账号密码登录表单 -->
      <view class="form">
        <input class="input" type="text" v-model="formData.account" placeholder="请输入账号" maxlength="20" />
        <input class="input" type="password" v-model="formData.password" placeholder="请输入密码" maxlength="20" />
      </view>
      <button class="button" @tap="login">登 录</button>
      <view class="extra">
        <view class="caption">
          <text>还没有账号？</text>
        </view>
        <view class="options">
          <button class="small_btn" @tap="goRegister">立即注册</button>
        </view>
      </view>
      <view class="tips">登录/注册即视为你同意《服务条款》和《学食界外卖隐私协议》</view>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { ref, reactive } from 'vue'
import { loginAPI, registerAPI } from '@/api/login'
import { useUserStore } from '@/stores/modules/user'
import type { LoginResult } from '@/types/user'
import type { LoginParams } from '@/types/login'

// 表单数据
const formData = reactive<LoginParams>({
  account: '',
  password: '',
})

// 是否为注册模式
const isRegister = ref(false)

// 登录
const login = async () => {
  // 表单校验
  if (!formData.account.trim()) {
    uni.showToast({ title: '请输入账号', icon: 'none' })
    return
  }
  if (!formData.password.trim()) {
    uni.showToast({ title: '请输入密码', icon: 'none' })
    return
  }
  if (formData.password.length < 6) {
    uni.showToast({ title: '密码至少6位', icon: 'none' })
    return
  }

  try {
    const res = await loginAPI(formData)
    console.log('登录结果', res)
    loginSuccess(res.data)
  } catch (error) {
    console.error('登录失败', error)
  }
}

// 登录成功处理
const loginSuccess = (profile: LoginResult) => {
  // 保存会员信息
  const userStore = useUserStore()
  userStore.setProfile(profile)
  // 成功提示
  uni.showToast({ icon: 'success', title: '登录成功' })
  setTimeout(() => {
    // 页面跳转
    uni.switchTab({ url: '/pages/my/my' })
  }, 500)
}

// 跳转到注册页面
const goRegister = () => {
  uni.navigateTo({ url: '/pages/reg/reg' })
}
</script>

<style lang="less" scoped>
page {
  height: 100%;
}

.viewport {
  display: flex;
  flex-direction: column;
  height: 100%;
  padding: 20rpx 40rpx;
}

.logo {
  flex: 1;
  text-align: center;

  image {
    width: 220rpx;
    height: 220rpx;
    margin-top: 15vh;
  }
}

.login {
  display: flex;
  flex-direction: column;
  height: 60vh;
  padding: 40rpx 20rpx 20rpx;

  .form {
    margin-bottom: 40rpx;
  }

  .input {
    width: 100%;
    height: 88rpx;
    font-size: 28rpx;
    border-radius: 44rpx;
    border: 1px solid #ddd;
    padding-left: 40rpx;
    margin-bottom: 24rpx;
    background-color: #f8f8f8;
  }

  .button {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 88rpx;
    font-size: 32rpx;
    border-radius: 44rpx;
    background-color: #22ccff;
    color: #fff;
    font-weight: 500;
  }

  .extra {
    flex: 1;
    padding: 60rpx 70rpx 0;

    .caption {
      text-align: center;
      font-size: 26rpx;
      color: #999;
      margin-bottom: 30rpx;
    }

    .options {
      display: flex;
      justify-content: center;
      align-items: center;

      button {
        padding: 0;
        background-color: transparent;
      }

      .small_btn {
        width: 240rpx;
        height: 72rpx;
        font-size: 28rpx;
        border-radius: 36rpx;
        color: #22ccff;
        border: #22ccff solid 2rpx;
        line-height: 72rpx;
      }
    }
  }
}

.tips {
  position: absolute;
  bottom: 80rpx;
  left: 20rpx;
  right: 20rpx;
  font-size: 22rpx;
  color: #999;
  text-align: center;
}
</style>
