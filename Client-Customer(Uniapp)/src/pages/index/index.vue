<template>
  <view class="container">
    <!-- 顶部轮播图 -->
    <swiper :autoplay="true" :circular="true" :indicator-dots="true" indicator-color="#ffffff"
      indicator-active-color="#00aaff" :interval="3000">
      <swiper-item>
        <image mode="aspectFill" src="../../static/images/swp1.png" />
      </swiper-item>
      <swiper-item>
        <image mode="aspectFill" src="../../static/images/swp2.png" />
      </swiper-item>
      <swiper-item>
        <image mode="aspectFill" src="../../static/images/swp3.png" />
      </swiper-item>
    </swiper>

    <!-- 窗口列表标题 -->
    <view class="section-title">
      <text class="title-text">食堂窗口</text>
      <text class="title-desc">选择窗口开始点餐</text>
    </view>

    <!-- 窗口列表 -->
    <view class="window-list">
      <view v-for="item in windowList" :key="item.id" class="window-item" @tap="toWindowDetail(item)">
        <image class="window-image" :src="item.pic || '../../static/images/logo.png'" mode="aspectFill" />
        <view class="window-info">
          <view class="window-name">{{ item.name }}</view>
          <view class="window-desc">{{ item.description }}</view>
          <view class="window-meta">
            <text class="location">📍 {{ item.location }}</text>
            <text :class="['status', item.status === 1 ? 'open' : 'closed']">
              {{ item.status === 1 ? '营业中' : '休息中' }}
            </text>
          </view>
          <view class="window-time">
            🕐 {{ item.openTime?.slice(0, 5) }} - {{ item.closeTime?.slice(0, 5) }}
          </view>
        </view>
        <view class="arrow">›</view>
      </view>
    </view>

    <!-- 空状态 -->
    <view v-if="windowList.length === 0" class="empty">
      <image src="../../static/images/table_empty.png" mode="aspectFit" />
      <text>暂无营业窗口</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { getWindowListAPI } from '@/api/window'
import type { WindowItem } from '@/types/window'

const windowList = ref<WindowItem[]>([])

const getWindowList = async () => {
  try {
    const res = await getWindowListAPI()
    windowList.value = res.data || []
  } catch (error) {
    console.error('获取窗口列表失败', error)
  }
}

const toWindowDetail = (item: WindowItem) => {
  if (item.status !== 1) {
    uni.showToast({
      title: '该窗口暂未营业',
      icon: 'none',
    })
    return
  }
  uni.navigateTo({
    url: `/pages/order/order?windowId=${item.id}&windowName=${item.name}`,
  })
}

onShow(() => {
  getWindowList()
})
</script>

<style lang="less" scoped>
.container {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 120rpx;
}

swiper {
  width: 100%;
  height: 320rpx;

  image {
    width: 100%;
    height: 100%;
  }
}

.section-title {
  padding: 30rpx;
  background-color: #fff;
  margin-top: 20rpx;

  .title-text {
    font-size: 36rpx;
    font-weight: bold;
    color: #333;
  }

  .title-desc {
    font-size: 24rpx;
    color: #999;
    margin-left: 20rpx;
  }
}

.window-list {
  padding: 0 20rpx;

  .window-item {
    display: flex;
    align-items: center;
    background-color: #fff;
    border-radius: 16rpx;
    padding: 24rpx;
    margin-top: 20rpx;
    box-shadow: 0 2rpx 10rpx rgba(0, 0, 0, 0.05);

    .window-image {
      width: 160rpx;
      height: 160rpx;
      border-radius: 12rpx;
      flex-shrink: 0;
    }

    .window-info {
      flex: 1;
      margin-left: 24rpx;
      overflow: hidden;

      .window-name {
        font-size: 32rpx;
        font-weight: bold;
        color: #333;
        margin-bottom: 8rpx;
      }

      .window-desc {
        font-size: 24rpx;
        color: #666;
        margin-bottom: 12rpx;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .window-meta {
        display: flex;
        align-items: center;
        margin-bottom: 8rpx;

        .location {
          font-size: 22rpx;
          color: #999;
          margin-right: 20rpx;
        }

        .status {
          font-size: 20rpx;
          padding: 4rpx 12rpx;
          border-radius: 20rpx;

          &.open {
            background-color: #e8f5e9;
            color: #4caf50;
          }

          &.closed {
            background-color: #ffebee;
            color: #f44336;
          }
        }
      }

      .window-time {
        font-size: 22rpx;
        color: #999;
      }
    }

    .arrow {
      font-size: 40rpx;
      color: #ccc;
      margin-left: 10rpx;
    }
  }
}

.empty {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 100rpx 0;

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
</style>
