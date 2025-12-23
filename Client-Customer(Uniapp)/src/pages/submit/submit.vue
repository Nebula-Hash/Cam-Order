<template>
  <view class="order_content">
    <scroll-view class="order_content_box" scroll-y scroll-top="0rpx">
      <!-- 配送方式选择 -->
      <view class="delivery_type_box">
        <view class="delivery_type_title">配送方式</view>
        <view class="delivery_type_options">
          <view class="delivery_option" :class="{ active: deliveryType === 1 }" @click="setDeliveryType(1)">
            <view class="option_icon_text">🚴</view>
            <text class="option_text">配送</text>
            <text class="option_fee">￥6</text>
          </view>
          <view class="delivery_option" :class="{ active: deliveryType === 2 }" @click="setDeliveryType(2)">
            <view class="option_icon_text">🏪</view>
            <text class="option_text">自取</text>
            <text class="option_fee">免配送费</text>
          </view>
        </view>
      </view>

      <!-- 地址栏（仅配送时显示） -->
      <view class="new_address" v-if="deliveryType === 1">
        <view class="top" @click="goAddress">
          <view v-if="!address" class="address_name_disabled"> 请选择收货地址 </view>
          <view v-if="address" class="address_name">
            <view class="address">
              <text class="tag" :class="'tag' + trans(label as string)"> {{ label || '其他' }} </text>
              <text class="word">{{ address }}</text>
            </view>
            <view class="name">
              <text class="name_1">{{ consignee }}</text>
              <text class="name_2">{{ phoneNumber }}</text>
            </view>
          </view>
          <view class="address_image">
            <image class="to_right" src="../../static/icon/toRight.png"></image>
          </view>
        </view>
        <view class="bottom">
          <text class="word_bottom">预计{{ arrivalTime }}送达</text>
        </view>
      </view>

      <!-- 自取提示（仅自取时显示） -->
      <view class="pickup_info" v-if="deliveryType === 2">
        <view class="pickup_icon_text">📍</view>
        <view class="pickup_text">
          <view class="pickup_title">到店自取</view>
          <view class="pickup_desc">下单后请凭取餐码到窗口取餐</view>
        </view>
      </view>

      <!-- 订单列表 -->
      <view class="order_list_cont">
        <view class="order_list">
          <view class="word_text">
            <text class="word_style">订单明细</text>
          </view>
          <view class="order-type">
            <view class="type_item" v-for="(obj, index) in cartList" :key="index">
              <view class="dish_img">
                <image mode="aspectFill" :src="obj.pic" class="dish_img_url"></image>
              </view>
              <view class="dish_info">
                <view class="dish_name"> {{ obj.name }} </view>
                <view v-if="obj.dishFlavor" class="dish_flavor"> {{ obj.dishFlavor }} </view>
                <view class="dish_amount">
                  <text v-if="obj.number && obj.number > 0" class="dish_number">x {{ obj.number }}</text>
                </view>
                <view class="dish_price"> <text class="ico">￥</text> {{ obj.amount }} </view>
              </view>
            </view>
            <view class="word_text">
              <view class="word_left">打包费</view>
              <view class="word_right">￥{{ CartAllNumber }}</view>
            </view>
            <view class="word_text">
              <view class="word_left">配送费</view>
              <view class="word_right" :class="{ 'free_fee': deliveryType === 2 }">
                {{ deliveryType === 2 ? '免费' : '￥6' }}
              </view>
            </view>
            <view class="all_price">
              <text class="word_right">总价 ￥{{ CartAllPrice }}</text>
            </view>
          </view>
        </view>

        <!-- 备注+餐具份数+发票 -->
        <view class="order_list">
          <view class="bottom_text" @click="goRemark">
            <view class="text_left">备注</view>
            <view class="text_right">{{ remark || '选择口味等' }}</view>
            <view class="right_image">
              <image class="to_right" src="../../static/icon/toRight.png"></image>
            </view>
          </view>
          <view class="bottom_text" @click="chooseCooker">
            <view class="text_left">餐具份数</view>
            <view class="text_right">{{ getCookerInfo() }}</view>
            <view class="right_image">
              <image class="to_right" src="../../static/icon/toRight.png"></image>
            </view>
          </view>
          <view class="bottom_text">
            <view class="text_left">发票</view>
            <view class="text_right">本店不支持线上发票，请致电商家提供</view>
          </view>
        </view>
      </view>
      <view class="blank"></view>
    </scroll-view>

    <!-- 底部购物车 -->
    <view class="footer_order_buttom order_form">
      <view class="order_number">
        <image src="../../static/images/cart_active.png" class="order_number_icon"></image>
        <view class="order_dish_num"> {{ CartAllNumber }} </view>
      </view>
      <view class="order_price">
        <text class="ico">￥ </text> {{ parseFloat((Math.round(CartAllPrice * 100) / 100).toFixed(2)) }}
      </view>
      <view class="order_but">
        <view class="order_but_rit" @click="payOrderHandle()"> 去支付 </view>
      </view>
    </view>
    <view class="mask-box"></view>

    <!-- 选择餐具遮罩层 -->
    <view class="pop_mask" v-show="openCooker" @click="openCooker = !openCooker">
      <view class="cook_pop" @click.stop="openCooker = openCooker">
        <view class="top_title">
          <view class="title"> 选择餐具份数 </view>
          <view class="tips"> 应监管条例要求，商家不能主动提供一次性餐具 </view>
          <view class="close" @click="closeMask">
            <image src="../../static/icon/close.png" class="close_img" />
          </view>
        </view>
        <picker-view class="picker" indicator-style="height: 50px;" :value="cookers" @change="pickerChange">
          <picker-view-column>
            <view v-for="item in cookers" :key="item" style="line-height: 50px; text-align: center">
              {{ item === -1 ? '无需餐具' : item === 0 ? '商家依据餐量提供' : item === 11 ? '10份以上' : item + '份' }}
            </view>
          </picker-view-column>
        </picker-view>
        <view class="comfirm">
          <view class="after_action">
            <label class="checkbox">
              <radio class="radio" color="#00aaff" value="cb" :checked="radioStatus" @click="radioChange" />
              {{ cookerNum === -2 || cookerNum === -1 ? '以后都无需餐具' : '以后都需要餐具，商家依据餐量提供' }}
            </label>
            <button class="comfirm_btn" @click="openCooker = !openCooker">确定</button>
          </view>
        </view>
      </view>
    </view>

    <!-- 自取成功弹窗 -->
    <view class="pickup_success_modal" v-if="showPickupModal">
      <view class="modal_content">
        <view class="modal_title">下单成功</view>
        <view class="pickup_code_box">
          <view class="pickup_code_label">您的取餐码</view>
          <view class="pickup_code_value">{{ pickupCode }}</view>
        </view>
        <view class="modal_tips">请凭此取餐码到窗口取餐</view>
        <button class="modal_btn" @click="closePickupModal">我知道了</button>
      </view>
    </view>
  </view>
</template>


<script lang="ts" setup>
import { getDefaultAddressAPI } from '@/api/address'
import { getCartAPI } from '@/api/cart'
import { submitOrderAPI, getUnPayOrderAPI, payOrderAPI } from '@/api/order'
import { getUserInfoAPI } from '@/api/user'
import type { CartItem } from '@/types/cart'
import { useAddressStore } from '@/stores/modules/address'
import { useUserStore } from '@/stores/modules/user'
import { onLoad, onShow } from '@dcloudio/uni-app'
import { ref, computed } from 'vue'

// store
const store = useAddressStore()
const userStore = useUserStore()

// 配送方式：1-配送 2-自取
const deliveryType = ref(1)

// 购物车列表
const cartList = ref<CartItem[]>([])
const CartAllNumber = ref(0)

// 计算总价（根据配送方式动态计算）
const CartAllPrice = computed(() => {
  const dishTotal = cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0)
  const packFee = CartAllNumber.value // 打包费
  const deliveryFee = deliveryType.value === 1 ? 6 : 0 // 配送费
  return dishTotal + packFee + deliveryFee
})

// 用户余额
const userBalance = ref(0)

// 收货地址信息
const address = ref('')
const label = ref('')
const consignee = ref('')
const phoneNumber = ref('')
const addressId = ref(0)

// 预计送达时间
const estimatedDeliveryTime = ref('')
const arrivalTime = ref('')

// 餐具相关
const openCooker = ref(false)
const cookerNum = ref(-2)
const cookers = ref([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
const radioStatus = ref(false)

// 备注
const remark = ref('')

// 自取成功弹窗
const showPickupModal = ref(false)
const pickupCode = ref('')

// 设置配送方式
const setDeliveryType = (type: number) => {
  deliveryType.value = type
}

// 获取用户余额
const getUserBalance = async () => {
  const userId = userStore.profile?.id
  if (userId) {
    try {
      const res = await getUserInfoAPI(userId)
      userBalance.value = res.data.balance ?? 0
    } catch (e) {
      console.error('获取余额失败', e)
    }
  }
}

// 查询获取购物车列表
const getCartList = async () => {
  const res = await getCartAPI()
  cartList.value = res.data
  CartAllNumber.value = cartList.value.reduce((acc, cur) => acc + cur.number, 0)
}

onLoad(async (options: any) => {
  await getAddressBookDefault()
  await getUserBalance()

  if (options.address) {
    const addressObj = JSON.parse(options.address)
    addressId.value = addressObj.id
    label.value = addressObj.label
    address.value = addressObj.dormitory || ''
    phoneNumber.value = addressObj.phone
    consignee.value = addressObj.consignee
  } else if (options.remark) {
    remark.value = options.remark
  }

  await getCartList()
  getHarfAnOur()

  if (store.defaultCook === '无需餐具') {
    cookerNum.value = -1
  } else if (store.defaultCook === '商家依据餐量提供') {
    cookerNum.value = 0
  }
})

onShow(async () => {
  await getCartList()
})

// 日期转字符串格式
const DateToStr = (date: Date) => {
  const year = date.getFullYear()
  const month = date.getMonth()
  const day = date.getDate()
  const hours = date.getHours()
  const min = date.getMinutes()
  const second = date.getSeconds()
  return (
    year + '-' + (month + 1 > 9 ? month + 1 : '0' + (month + 1)) + '-' +
    (day > 9 ? day : '0' + day) + ' ' +
    (hours > 9 ? hours : '0' + hours) + ':' +
    (min > 9 ? min : '0' + min) + ':' +
    (second > 9 ? second : '0' + second)
  )
}

// 获取一小时以后的时间
const getHarfAnOur = () => {
  const date = new Date()
  date.setTime(date.getTime() + 3600000)
  estimatedDeliveryTime.value = DateToStr(date)
  let hours = date.getHours().toString()
  let minutes = date.getMinutes().toString()
  if (hours.length === 1) hours = '0' + hours
  if (minutes.length === 1) minutes = '0' + minutes
  arrivalTime.value = hours + ':' + minutes
}

// 默认地址查询
const getAddressBookDefault = async () => {
  try {
    const res = await getDefaultAddressAPI()
    if (res.code === 1 && res.data) {
      address.value = res.data.dormitory || ''
      phoneNumber.value = res.data.phone as string
      consignee.value = res.data.consignee as string
      addressId.value = res.data.id as number
      label.value = res.data.label || ''
    }
  } catch (e) {
    console.log('没有默认地址')
  }
}

// 标签文字转数字
const trans = (item: string) => {
  switch (item) {
    case '公司': return '1'
    case '家': return '2'
    case '学校': return '3'
    default: return '4'
  }
}

// 去地址页面
const goAddress = () => {
  store.addressBackUrl = '/pages/submit/submit'
  uni.redirectTo({ url: '/pages/address/address' })
}

// 去备注页面
const goRemark = () => {
  uni.navigateTo({ url: '/pages/remark/remark' })
}

// 选择餐具
const chooseCooker = () => {
  openCooker.value = true
}

// 餐具对应信息
const getCookerInfo = () => {
  if (cookerNum.value === -2) return '请依据实际情况填写，避免浪费'
  else if (cookerNum.value === -1) return '无需餐具'
  else if (cookerNum.value === 0) return '商家依据餐量提供'
  else if (cookerNum.value === 11) return '10份以上'
  else return cookerNum.value + '份'
}

const pickerChange = (ev: any) => {
  cookerNum.value = ev.detail.value[0] - 1
}

const radioChange = () => {
  radioStatus.value = !radioStatus.value
  if (radioStatus.value) {
    store.defaultCook = cookerNum.value === -1 ? '无需餐具' : '商家依据餐量提供'
  } else {
    store.defaultCook = '请依据实际情况填写，避免浪费'
  }
}

const closeMask = () => {
  openCooker.value = false
}

// 关闭自取成功弹窗
const closePickupModal = () => {
  showPickupModal.value = false
  uni.redirectTo({ url: '/pages/history/history' })
}

// 支付下单
const payOrderHandle = async () => {
  const unPayRes = await getUnPayOrderAPI()
  if (unPayRes.data !== 0) {
    uni.showToast({ title: '有未支付订单，请先支付或取消！', icon: 'none' })
    return false
  }

  // 配送时需要地址
  if (deliveryType.value === 1 && !address.value) {
    uni.showToast({ title: '请选择收货地址', icon: 'none' })
    return false
  }

  if (cookerNum.value === -2) {
    uni.showToast({ title: '请选择餐具份数', icon: 'none' })
    return false
  }

  if (userBalance.value < CartAllPrice.value) {
    uni.showToast({ title: `余额不足，当前余额￥${userBalance.value}`, icon: 'none' })
    return false
  }

  const deliveryText = deliveryType.value === 1 ? '配送' : '自取'
  uni.showModal({
    title: '确认支付',
    content: `配送方式：${deliveryText}\n订单金额：￥${CartAllPrice.value}\n当前余额：￥${userBalance.value}\n支付后余额：￥${(userBalance.value - CartAllPrice.value).toFixed(2)}`,
    confirmText: '确认支付',
    cancelText: '取消',
    success: async (modalRes) => {
      if (modalRes.confirm) {
        await doSubmitAndPay()
      }
    }
  })
}

// 提交订单并支付
const doSubmitAndPay = async () => {
  const params = {
    payMethod: 1,
    addressId: deliveryType.value === 1 ? addressId.value : null,
    remark: remark.value,
    deliveryType: deliveryType.value,
    tablewareNumber: cookerNum.value,
    tablewareStatus: cookerNum.value === 0 ? 1 : 0,
    packAmount: CartAllNumber.value,
    amount: CartAllPrice.value,
  }

  try {
    const res = await submitOrderAPI(params)
    if (res.code === 1 && res.data && res.data.orderNumber) {
      const payRes = await payOrderAPI({
        orderNumber: res.data.orderNumber,
        payMethod: 1
      })

      if (payRes.code === 1) {
        // 自取时显示取餐码弹窗
        if (deliveryType.value === 2 && res.data.pickupCode) {
          pickupCode.value = res.data.pickupCode
          showPickupModal.value = true
          uni.showToast({ title: '支付成功', icon: 'success' })
        } else {
          uni.showToast({ title: '支付成功', icon: 'success' })
          setTimeout(() => {
            uni.redirectTo({ url: '/pages/history/history' })
          }, 1500)
        }
      } else {
        uni.showToast({ title: payRes.msg || '支付失败', icon: 'none' })
      }
    } else {
      uni.showToast({ title: res.msg || '订单创建失败', icon: 'none' })
    }
  } catch (e) {
    console.error('支付异常', e)
    uni.showToast({ title: '支付异常，请重试', icon: 'none' })
  }
}

defineExpose({ remark })
</script>


<style lang="less" scoped>
.order_content {
  height: 100vh;
  display: flex;
  flex-direction: column;
  padding: 20rpx 0 0 0;
  position: relative;
  background-color: #cceeff;

  .order_content_box {
    width: 100%;
    height: 100%;

    .blank {
      height: 1rpx;
    }
  }

  // 配送方式选择
  .delivery_type_box {
    width: 730rpx;
    margin: 0 auto 20rpx;
    background-color: #fff;
    border-radius: 12rpx;
    padding: 24rpx 30rpx;
    box-sizing: border-box;

    .delivery_type_title {
      font-size: 30rpx;
      font-weight: bold;
      color: #333;
      margin-bottom: 20rpx;
    }

    .delivery_type_options {
      display: flex;
      gap: 20rpx;

      .delivery_option {
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 24rpx 0;
        border: 2rpx solid #e5e5e5;
        border-radius: 12rpx;
        transition: all 0.3s;

        &.active {
          border-color: #00aaff;
          background-color: #e6f7ff;
        }

        .option_icon {
          width: 60rpx;
          height: 60rpx;
          margin-bottom: 12rpx;
        }

        .option_icon_text {
          font-size: 50rpx;
          margin-bottom: 12rpx;
        }

        .option_text {
          font-size: 28rpx;
          color: #333;
          font-weight: 500;
        }

        .option_fee {
          font-size: 24rpx;
          color: #999;
          margin-top: 8rpx;
        }
      }
    }
  }

  // 自取提示
  .pickup_info {
    width: 730rpx;
    margin: 0 auto 20rpx;
    background-color: #fff7e6;
    border-radius: 12rpx;
    padding: 30rpx;
    box-sizing: border-box;
    display: flex;
    align-items: center;

    .pickup_icon {
      width: 80rpx;
      height: 80rpx;
      margin-right: 20rpx;

      image {
        width: 100%;
        height: 100%;
      }
    }

    .pickup_icon_text {
      font-size: 60rpx;
      margin-right: 20rpx;
    }

    .pickup_text {
      .pickup_title {
        font-size: 30rpx;
        font-weight: bold;
        color: #fa8c16;
      }

      .pickup_desc {
        font-size: 24rpx;
        color: #999;
        margin-top: 8rpx;
      }
    }
  }

  // 地址栏
  .new_address {
    width: 730rpx;
    height: 240rpx;
    background-color: #fff;
    margin: 0 auto 20rpx;
    border-radius: 12rpx;
    display: flex;
    flex-direction: column;

    .top {
      margin: 0 22rpx 0 30rpx;
      flex: 1;
      display: flex;

      .address_name {
        flex: 1;
        overflow: hidden;

        .address {
          height: 50rpx;
          line-height: 50rpx;
          margin-top: 22rpx;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;

          .tag {
            display: inline-block;
            width: 70rpx;
            height: 45rpx;
            border-radius: 4rpx;
            margin-right: 20rpx;
            font-size: 25rpx;
            line-height: 45rpx;
            color: #333;
            text-align: center;
            background: #e1f1fe;
          }

          .tag2 {
            background: #fef8e7;
          }

          .tag3 {
            background: #e7fef8;
          }

          .tag4 {
            background: #fee7e7;
          }

          .word {
            vertical-align: middle;
            font-size: 32rpx;
            font-weight: 550;
            color: #20232a;
          }
        }

        .name {
          height: 34rpx;
          line-height: 34rpx;
          margin-top: 8rpx;

          .name_1,
          .name_2 {
            font-size: 26rpx;
            color: #333;
          }

          .name_2 {
            margin-left: 10rpx;
          }
        }
      }

      .address_name_disabled {
        flex: 1;
        font-size: 32rpx;
        color: #bdbdbd;
        align-self: center;
      }

      .address_image {
        width: 80rpx;
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

    .bottom {
      margin: 0 28rpx;
      height: 94rpx;
      border-top: 1px dashed #ebebeb;

      .word_bottom {
        font-size: 26rpx;
        color: #333;
        height: 34rpx;
        line-height: 34rpx;
        margin-top: 24rpx;
        display: inline-block;
      }
    }
  }

  // 订单列表容器
  .order_list_cont {
    width: 730rpx;
    margin: 0 auto;

    .order_list {
      border-radius: 15rpx;
      background-color: #fff;
      width: 100%;
      margin-bottom: 20rpx;

      &:last-child {
        margin-bottom: 176rpx;
      }

      .order-type {
        padding: 40rpx 0 10rpx 0;

        .type_item {
          display: flex;
          margin-bottom: 30rpx;

          .dish_img {
            width: 100rpx;
            margin: 0 20rpx 0 32rpx;

            .dish_img_url {
              display: block;
              width: 100rpx;
              height: 100rpx;
              border-radius: 8rpx;
            }
          }

          .dish_info {
            position: relative;
            flex: 1;
            margin-right: 20rpx;

            .dish_name {
              font-size: 30rpx;
              font-weight: bold;
              color: #20232a;
            }

            .dish_flavor {
              font-size: 24rpx;
              color: #818693;
              margin-top: 10rpx;
            }

            .dish_amount {
              font-size: 24rpx;
              color: #818693;
              margin-top: 10rpx;
            }

            .dish_price {
              position: absolute;
              right: 20rpx;
              bottom: 40rpx;
              font-size: 32rpx;
              color: #e94e3c;

              .ico {
                font-size: 24rpx;
              }
            }
          }
        }
      }

      .word_text {
        display: flex;
        align-items: center;
        margin: 0 20rpx 0 30rpx;
        border-bottom: 1px solid #efefef;
        height: 120rpx;

        .word_left,
        .word_right {
          width: 50%;
          font-size: 32rpx;
          color: #333;
        }

        .word_right {
          text-align: right;
          padding-right: 20rpx;
        }

        .free_fee {
          color: #52c41a;
        }
      }

      .all_price {
        margin: 0 16rpx 0 22rpx;
        height: 120rpx;
        line-height: 120rpx;

        .word_right {
          font-size: 32rpx;
          color: #333;
          padding-left: 500rpx;
        }
      }

      .bottom_text {
        display: flex;
        align-items: center;
        margin: 0 20rpx 0 30rpx;
        height: 100rpx;

        .text_left {
          width: 30%;
          font-size: 32rpx;
          color: #333;
        }

        .text_right {
          width: 70%;
          font-size: 24rpx;
          color: #666;
          text-align: right;
          padding-right: 20rpx;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .right_image {
          width: 30rpx;

          .to_right {
            width: 30rpx;
            height: 30rpx;
          }
        }
      }
    }
  }

  // 底部栏
  .footer_order_buttom {
    position: fixed;
    display: flex;
    bottom: 48rpx;
    width: calc(100% - 60rpx);
    height: 88rpx;
    margin: 0 auto;
    background: rgba(0, 0, 0, 0.9);
    border-radius: 50rpx;
    box-shadow: 0px 6rpx 10rpx 0px rgba(0, 0, 0, 0.25);
    z-index: 999;
    padding: 0rpx 10rpx;

    .order_number {
      position: relative;
      width: 120rpx;

      .order_number_icon {
        position: absolute;
        width: 120rpx;
        height: 118rpx;
        left: 12rpx;
        bottom: 0;
      }

      .order_dish_num {
        position: absolute;
        z-index: 9;
        min-width: 12rpx;
        height: 36rpx;
        line-height: 36rpx;
        padding: 0 12rpx;
        left: 92rpx;
        font-size: 24rpx;
        top: -8rpx;
        border-radius: 20rpx;
        background-color: #e94e3c;
        color: #fff;
      }
    }

    .order_price {
      flex: 1;
      color: #fff;
      line-height: 88rpx;
      padding-left: 34rpx;
      font-size: 36rpx;
      font-weight: bold;

      .ico {
        font-size: 24rpx;
      }
    }

    .order_but {
      height: 72rpx;
      line-height: 72rpx;
      margin-top: 8rpx;

      .order_but_rit {
        width: 200rpx;
        border-radius: 72rpx;
        background: #22bbff;
        font-size: 30rpx;
        color: #fff;
        text-align: center;
      }
    }
  }

  // 餐具选择弹窗
  .pop_mask {
    position: fixed;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 999;
    background-color: rgba(0, 0, 0, 0.4);

    .cook_pop {
      width: 100%;
      height: 60vh;
      position: absolute;
      bottom: 0;
      background-color: #fff;
      border-radius: 20rpx 20rpx 0 0;
      padding: 20rpx 30rpx 30rpx;

      .top_title {
        position: relative;
        border-bottom: solid 1px #ebeef5;
        padding-bottom: 20rpx;

        .title {
          text-align: center;
          font-size: 30rpx;
          font-weight: bold;
        }

        .tips {
          text-align: center;
          font-size: 20rpx;
          color: #999;
        }

        .close {
          position: absolute;
          top: 20rpx;
          right: 0;

          .close_img {
            width: 40rpx;
            height: 40rpx;
          }
        }
      }

      .picker {
        width: 100%;
        height: 400rpx;
      }

      .comfirm {
        width: 600rpx;
        margin: 20rpx auto;
        background-color: #fea;
        border-radius: 10rpx 10rpx 30rpx 30rpx;

        .after_action {
          font-size: 24rpx;
          color: #999;

          .comfirm_btn {
            width: 600rpx;
            height: 80rpx;
            line-height: 80rpx;
            border-radius: 40rpx;
            background: #00aaff;
            color: #fff;
            font-size: 30rpx;
          }
        }
      }
    }
  }

  // 自取成功弹窗
  .pickup_success_modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    z-index: 1000;
    display: flex;
    align-items: center;
    justify-content: center;

    .modal_content {
      width: 600rpx;
      background-color: #fff;
      border-radius: 24rpx;
      padding: 50rpx 40rpx;
      text-align: center;

      .modal_title {
        font-size: 36rpx;
        font-weight: bold;
        color: #333;
        margin-bottom: 40rpx;
      }

      .pickup_code_box {
        background: linear-gradient(135deg, #00aaff, #0088cc);
        border-radius: 16rpx;
        padding: 40rpx;
        margin-bottom: 30rpx;

        .pickup_code_label {
          font-size: 26rpx;
          color: rgba(255, 255, 255, 0.8);
          margin-bottom: 16rpx;
        }

        .pickup_code_value {
          font-size: 80rpx;
          font-weight: bold;
          color: #fff;
          letter-spacing: 20rpx;
        }
      }

      .modal_tips {
        font-size: 26rpx;
        color: #999;
        margin-bottom: 40rpx;
      }

      .modal_btn {
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
  }

  .mask-box {
    position: absolute;
    height: 176rpx;
    width: 100%;
    bottom: 0;
    background-color: #f6f6f6;
    opacity: 0.5;
  }
}
</style>
