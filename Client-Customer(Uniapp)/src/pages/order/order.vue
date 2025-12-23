<template>
  <!-- 自定义导航栏 -->
  <view class="navbar">
    <view class="navbar-left" @tap="goBack">
      <text class="back-icon">‹</text>
    </view>
    <view class="navbar-title">{{ windowName }}</view>
    <view class="navbar-right"></view>
  </view>

  <view class="viewport">
    <!-- 分类 -->
    <view class="categories">
      <!-- 左侧：分类列表 -->
      <scroll-view class="primary" scroll-y>
        <view v-for="(item, index) in categoryList" :key="item.id" class="item"
          :class="{ active: index === activeIndex }" @tap="getDishOrSetmealList(index)">
          <text class="name"> {{ item.name }} </text>
        </view>
      </scroll-view>
      <!-- 右侧：菜品/套餐列表 -->
      <scroll-view class="secondary" scroll-y>
        <view class="section">
          <navigator v-for="dish in dishList" :key="dish.id" class="dish" hover-class="none"
            :url="`/pages/detail/detail?windowId=${windowId}&${categoryList[activeIndex]?.type === 1 ? 'dishId' : 'setmealId'}=${dish.id}`">
            <image class="image" :src="dish.pic || '../../static/images/logo.png'" mode="aspectFill"></image>
            <view class="dishinfo">
              <view class="name ellipsis">{{ dish.name }}</view>
              <view class="detail ellipsis">{{ dish.detail }}</view>
              <view class="price">
                <text class="symbol">¥</text>
                <text class="number">{{ dish.price }}</text>
              </view>
              <!-- 1、选择规格(口味) -->
              <image v-if="'flavors' in dish && dish.flavors && dish.flavors.length > 0" class="choosenorm"
                src="../../static/images/选择规格.png" @tap.stop="chooseNorm(dish)" mode="scaleToFill" />
              <!-- 2、加减菜品 -->
              <view v-else class="sub_add">
                <image v-if="getCopies(dish) > 0" src="../../static/icon/sub.png" @tap.stop="subDishAction(dish, '普通')"
                  class="sub"></image>
                <text v-if="getCopies(dish) > 0" class="dish_number">{{ getCopies(dish) }}</text>
                <image src="../../static/icon/add.png" @tap.stop="addDishAction(dish, '普通')" class="add" />
              </view>
            </view>
          </navigator>
        </view>
      </scroll-view>
    </view>
  </view>

  <!-- 菜品口味选择dialog弹窗 -->
  <view class="dialog" v-show="visible">
    <view class="flavor_pop">
      <view class="title">选择规格</view>
      <scroll-view class="scroll" scroll-y>
        <view v-for="flavor in flavors" :key="flavor.name" class="flavor">
          <view class="flavor-name">{{ flavor.name }}</view>
          <view class="flavor-options">
            <view :class="{ flavorItem: true, active: chosedflavors.findIndex((it) => item === it) !== -1 }"
              v-for="(item, index) in JSON.parse(flavor.list)" :key="index"
              @tap="chooseFlavor(JSON.parse(flavor.list), item)">
              {{ item }}
            </view>
          </view>
        </view>
      </scroll-view>
      <view class="addToCart" @tap="addToCart(dialogDish as DishToCartItem)">加入购物车</view>
    </view>
    <view class="close_dialog" @click="visible = false">×</view>
  </view>

  <!-- 底部购物车栏 -->
  <view class="footer_order_buttom" v-if="cartList.length === 0">
    <view class="order_number">
      <image src="../../static/images/cart_empty.png" class="order_number_icon"></image>
    </view>
    <view class="order_price"> <text class="ico">￥</text> 0 </view>
    <view class="order_btn"> ￥0起送 </view>
  </view>
  <view class="footer_order_buttom" @click="() => (openCartList = !openCartList)" v-else>
    <view class="order_number">
      <image src="../../static/images/cart_active.png" class="order_number_icon"></image>
      <view class="order_dish_num"> {{ CartAllNumber }} </view>
    </view>
    <view class="order_price">
      <text class="ico">￥ </text> {{ parseFloat((Math.round(CartAllPrice * 100) / 100).toFixed(2)) }}
    </view>
    <view class="order_btn_active" @click.stop="submitOrder()"> 去结算 </view>
  </view>

  <!-- 底部购物车菜品列表 -->
  <view class="pop_mask" v-show="openCartList" @click="openCartList = !openCartList">
    <view class="cart_pop" @click.stop>
      <view class="top_title">
        <view class="tit"> 购物车 </view>
        <view class="clear" @click.stop="clearCart()">
          <image class="clear_icon" src="../../static/icon/clear.png"></image>
          <text class="clear-des">清空 </text>
        </view>
      </view>
      <scroll-view class="card_order_list" scroll-y>
        <view class="type_item" v-for="(obj, index) in cartList" :key="index">
          <view class="dish_img">
            <image mode="aspectFill" :src="obj.pic || '../../static/images/logo.png'" class="dish_img_url"></image>
          </view>
          <view class="dish_info">
            <view class="dish_name"> {{ obj.name }} </view>
            <view class="dish_price"> <text class="ico">￥</text> {{ obj.amount }} </view>
            <view class="dish_flavor"> {{ obj.dishFlavor }} </view>
            <view class="dish_active">
              <image v-if="obj.number && obj.number > 0" src="../../static/icon/sub.png"
                @click.stop="subDishAction(obj, '购物车')" class="dish_sub"></image>
              <text v-if="obj.number && obj.number > 0" class="dish_number">{{ obj.number }}</text>
              <image src="../../static/icon/add.png" class="dish_add" @click.stop="addDishAction(obj, '购物车')">
              </image>
            </view>
          </view>
        </view>
        <view class="seize_seat"></view>
      </scroll-view>
    </view>
  </view>

  <view v-if="!status" class="close" @click="goBack">
    <view class="text">本窗口已打烊</view>
  </view>
</template>

<script setup lang="ts">
import { getCategoryByWindowAPI } from '@/api/category'
import { getDishListAPI } from '@/api/dish'
import { getSetmealListAPI } from '@/api/setmeal'
import { addToCartAPI, subCartAPI, getCartAPI, cleanCartAPI } from '@/api/cart'
import { getWindowByIdAPI } from '@/api/window'
import type { CategoryItem } from '@/types/category'
import type { DishItem, FlavorItem, DishToCartItem } from '@/types/dish'
import type { SetmealItem } from '@/types/setmeal'
import type { CartDTO, CartItem } from '@/types/cart'
import { onLoad, onShow } from '@dcloudio/uni-app'
import { ref } from 'vue'

// 窗口信息
const windowId = ref<number>(0)
const windowName = ref<string>('')
const status = ref(true)

// 左侧分类列表
const categoryList = ref<CategoryItem[]>([])
const activeIndex = ref(0)
// 菜品/套餐列表
const dishList = ref<(DishItem | SetmealItem)[]>([])
// 购物车相关
const openCartList = ref(false)
const cartList = ref<CartItem[]>([])
const CartAllNumber = ref(0)
const CartAllPrice = ref(0)
// 口味弹窗相关
const visible = ref(false)
const dialogDish = ref<DishToCartItem>()
const flavors = ref<FlavorItem[]>([])
const chosedflavors = ref<string[]>([])

const goBack = () => {
  uni.navigateBack()
}

const getCategoryData = async () => {
  const res = await getCategoryByWindowAPI(windowId.value)
  categoryList.value = res.data || []
}

const getDishOrSetmealList = async (index: number) => {
  activeIndex.value = index
  if (!categoryList.value[index]) return
  let res
  if (categoryList.value[index].type === 1) {
    res = await getDishListAPI(categoryList.value[index].id)
  } else {
    res = await getSetmealListAPI(categoryList.value[index].id)
  }
  dishList.value = res.data || []
}

const getCartList = async () => {
  const res = await getCartAPI()
  // 只显示当前窗口的购物车
  cartList.value = (res.data || []).filter((item: CartItem) => item.windowId === windowId.value)
  CartAllNumber.value = cartList.value.reduce((acc, cur) => acc + cur.number, 0)
  CartAllPrice.value = cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0)
  if (cartList.value.length === 0) {
    openCartList.value = false
  }
}

const chooseNorm = async (dish: DishItem) => {
  flavors.value = dish.flavors
  const tmpdish = Object.assign({}, dish) as unknown as DishToCartItem
  delete tmpdish.flavors
  dialogDish.value = tmpdish
  const moreNormdata = dish.flavors.map((obj) => ({ ...obj, list: JSON.parse(obj.list) }))
  chosedflavors.value = []
  moreNormdata.forEach((item) => {
    if (item.list && item.list.length > 0) {
      chosedflavors.value.push(item.list[0])
    }
  })
  visible.value = true
}

const chooseFlavor = (obj: string[], flavor: string) => {
  let ind = -1
  let findst = obj.some((n) => {
    ind = chosedflavors.value.findIndex((o) => o == n)
    return ind != -1
  })
  const indexInChosed = chosedflavors.value.findIndex((it) => it == flavor)
  if (indexInChosed == -1 && !findst) {
    chosedflavors.value.push(flavor)
  } else if (indexInChosed == -1 && findst && ind >= 0) {
    chosedflavors.value.splice(ind, 1)
    chosedflavors.value.push(flavor)
  } else {
    chosedflavors.value.splice(indexInChosed, 1)
  }
  dialogDish.value!.flavors = chosedflavors.value.join(',')
}

const getCopies = (dish: DishItem | SetmealItem) => {
  if (!categoryList.value[activeIndex.value]) return 0
  if (categoryList.value[activeIndex.value].type === 1) {
    return cartList.value.find((item) => item.dishId === dish.id)?.number || 0
  } else {
    return cartList.value.find((item) => item.setmealId === dish.id)?.number || 0
  }
}

const addToCart = async (dish: DishToCartItem) => {
  if (!chosedflavors.value || chosedflavors.value.length <= 0) {
    uni.showToast({ title: '请选择规格', icon: 'none' })
    return false
  }
  const partialCart: Partial<CartDTO> = { dishId: dish.id, dishFlavor: chosedflavors.value.join(','), windowId: windowId.value }
  await addToCartAPI(partialCart)
  await getCartList()
  chosedflavors.value = []
  visible.value = false
}

const addDishAction = async (item: any, form: string) => {
  if (form == '购物车') {
    const partialCart: Partial<CartDTO> = {
      dishId: item.dishId,
      setmealId: item.setmealId,
      dishFlavor: item.dishFlavor,
      windowId: windowId.value,
    }
    await addToCartAPI(partialCart)
  } else {
    if (categoryList.value[activeIndex.value]?.type === 1) {
      const partialCart: Partial<CartDTO> = { dishId: item.id, windowId: windowId.value }
      await addToCartAPI(partialCart)
    } else {
      const partialCart: Partial<CartDTO> = { setmealId: item.id, windowId: windowId.value }
      await addToCartAPI(partialCart)
    }
  }
  await getCartList()
}

const subDishAction = async (item: any, form: string) => {
  if (form == '购物车') {
    const partialCart: Partial<CartDTO> = {
      dishId: item.dishId,
      setmealId: item.setmealId,
      dishFlavor: item.dishFlavor,
    }
    await subCartAPI(partialCart)
  } else {
    if (categoryList.value[activeIndex.value]?.type === 1) {
      const partialCart: Partial<CartDTO> = { dishId: item.id }
      await subCartAPI(partialCart)
    } else {
      const partialCart: Partial<CartDTO> = { setmealId: item.id }
      await subCartAPI(partialCart)
    }
  }
  await getCartList()
}

const clearCart = async () => {
  await cleanCartAPI()
  await getCartList()
  openCartList.value = false
}

const submitOrder = () => {
  uni.navigateTo({ url: '/pages/submit/submit' })
}

onLoad(async (options) => {
  if (options?.windowId) {
    windowId.value = Number(options.windowId)
    windowName.value = options.windowName || '点餐'
  }
  // 获取窗口状态
  try {
    const res = await getWindowByIdAPI(windowId.value)
    console.log('窗口详情返回:', res)
    console.log('窗口status值:', res.data?.status, '类型:', typeof res.data?.status)
    // 兼容字符串和数字类型的 status
    status.value = res.data?.status == 1
    console.log('status.value 赋值后:', status.value)
  } catch (e) {
    console.error('获取窗口状态失败:', e)
    status.value = true
  }
  await getCategoryData()
  if (categoryList.value.length > 0) {
    await getDishOrSetmealList(0)
  }
  await getCartList()
})

onShow(async () => {
  await getCartList()
})
</script>

<style lang="less" scoped>
.navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 88rpx;
  padding: 0 30rpx;
  padding-top: var(--status-bar-height);
  background-color: #00aaff;

  .navbar-left {
    width: 60rpx;

    .back-icon {
      font-size: 50rpx;
      color: #fff;
    }
  }

  .navbar-title {
    flex: 1;
    text-align: center;
    font-size: 34rpx;
    font-weight: bold;
    color: #fff;
  }

  .navbar-right {
    width: 60rpx;
  }
}

.dialog {
  position: fixed;
  width: 100%;
  height: 100%;
  z-index: 1000;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.6);

  .flavor_pop {
    position: relative;
    top: 50%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    padding: 40rpx;
    border-radius: 20rpx;
    width: 70%;
    max-height: 60%;
    background-color: #fff;

    .title {
      font-size: 36rpx;
      font-weight: bold;
      margin-bottom: 20rpx;
    }

    .scroll {
      max-height: 400rpx;
      padding-bottom: 80rpx;
    }

    .flavor {
      padding: 20rpx 0;
      border-bottom: 1rpx solid #f0f0f0;

      .flavor-name {
        font-size: 26rpx;
        color: #666;
        margin-bottom: 16rpx;
      }

      .flavor-options {
        display: flex;
        flex-wrap: wrap;
      }
    }

    .flavorItem {
      margin: 8rpx 16rpx 8rpx 0;
      padding: 12rpx 24rpx;
      display: inline-block;
      border: 2rpx solid #00aaff;
      border-radius: 30rpx;
      font-size: 24rpx;
      color: #00aaff;
    }

    .active {
      background-color: #00aaff;
      color: #fff;
    }

    .addToCart {
      position: absolute;
      bottom: 30rpx;
      right: 40rpx;
      padding: 16rpx 40rpx;
      background-color: #00aaff;
      color: #fff;
      font-size: 26rpx;
      border-radius: 30rpx;
    }
  }

  .close_dialog {
    position: fixed;
    top: 75%;
    left: 50%;
    transform: translateX(-50%);
    width: 60rpx;
    height: 60rpx;
    border-radius: 30rpx;
    background-color: rgba(255, 255, 255, 0.3);
    color: #fff;
    font-size: 40rpx;
    text-align: center;
    line-height: 60rpx;
  }
}

.viewport {
  height: calc(100vh - 88rpx - var(--status-bar-height) - 136rpx);
  display: flex;
  flex-direction: column;
}

.categories {
  flex: 1;
  display: flex;
}

.primary {
  width: 180rpx;
  flex: none;
  background-color: #f6f6f6;

  .item {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 96rpx;
    font-size: 26rpx;
    color: #595c63;
    position: relative;

    &::after {
      content: '';
      position: absolute;
      left: 42rpx;
      bottom: 0;
      width: 96rpx;
      border-top: 1rpx solid #e3e4e7;
    }
  }

  .active {
    background-color: #fff;

    &::after {
      display: none;
    }
  }

  .item:last-child::after {
    display: none;
  }
}

.secondary {
  flex: 1;
  background-color: #fff;

  .section {
    padding: 20rpx;

    .dish {
      display: flex;
      padding: 20rpx 0;
      border-bottom: 1rpx solid #f5f5f5;

      .image {
        width: 150rpx;
        height: 150rpx;
        border-radius: 12rpx;
        flex-shrink: 0;
      }

      .dishinfo {
        flex: 1;
        margin-left: 20rpx;
        position: relative;

        .ellipsis {
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .name {
          font-size: 28rpx;
          color: #333;
          margin-bottom: 8rpx;
        }

        .detail {
          font-size: 22rpx;
          color: #999;
          margin-bottom: 12rpx;
        }

        .price {
          color: #e94e3c;

          .symbol {
            font-size: 22rpx;
          }

          .number {
            font-size: 30rpx;
            font-weight: bold;
          }
        }

        .choosenorm {
          position: absolute;
          right: 0;
          bottom: 0;
          width: 120rpx;
          height: 48rpx;
        }

        .sub_add {
          display: flex;
          align-items: center;
          position: absolute;
          right: 0;
          bottom: 0;

          .sub,
          .add {
            width: 44rpx;
            height: 44rpx;
          }

          .dish_number {
            min-width: 50rpx;
            text-align: center;
            font-size: 26rpx;
          }
        }
      }
    }
  }
}

.footer_order_buttom {
  position: fixed;
  display: flex;
  bottom: 48rpx;
  width: calc(100% - 60rpx);
  height: 88rpx;
  margin: 0 30rpx;
  background: rgba(0, 0, 0, 0.9);
  border-radius: 50rpx;
  box-shadow: 0px 6rpx 10rpx 0px rgba(0, 0, 0, 0.25);
  z-index: 100;
  padding: 0rpx 10rpx;
  box-sizing: border-box;

  .order_number {
    position: relative;
    width: 120rpx;

    .order_number_icon {
      position: absolute;
      display: block;
      width: 120rpx;
      height: 120rpx;
      left: 12rpx;
      bottom: 0px;
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
      font-weight: 500;
    }
  }

  .order_price {
    flex: 1;
    text-align: left;
    color: #fff;
    line-height: 88rpx;
    padding-left: 34rpx;
    font-size: 36rpx;
    font-weight: 500;

    .ico {
      font-size: 24rpx;
    }
  }

  .order_btn {
    background-color: #d8d8d8;
    width: 204rpx;
    height: 72rpx;
    line-height: 72rpx;
    border-radius: 72rpx;
    color: #fff;
    text-align: center;
    font-weight: bold;
    margin-top: 8rpx;
  }

  .order_btn_active {
    width: 204rpx;
    height: 72rpx;
    line-height: 72rpx;
    border-radius: 72rpx;
    color: #fff;
    text-align: center;
    font-weight: bold;
    margin-top: 8rpx;
    background: #00aaff;
  }
}

.pop_mask {
  position: fixed;
  width: 100%;
  height: 100vh;
  top: 0;
  left: 0;
  z-index: 500;
  background-color: rgba(0, 0, 0, 0.4);

  .cart_pop {
    width: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    height: 60vh;
    background-color: #fff;
    border-radius: 20rpx 20rpx 0 0;
    padding: 20rpx 30rpx 30rpx 30rpx;
    box-sizing: border-box;

    .top_title {
      display: flex;
      justify-content: space-between;
      border-bottom: solid 1px #ebeef5;
      padding-bottom: 20rpx;

      .tit {
        font-size: 36rpx;
        font-weight: bold;
        color: #333;
      }

      .clear {
        color: #999;
        font-size: 26rpx;
        display: flex;
        align-items: center;

        .clear_icon {
          width: 28rpx;
          height: 28rpx;
          margin-right: 8rpx;
        }
      }
    }

    .card_order_list {
      height: calc(100% - 80rpx);
      padding-top: 20rpx;

      .type_item {
        display: flex;
        padding: 20rpx 0;
        border-bottom: 1rpx solid #f5f5f5;

        .dish_img {
          .dish_img_url {
            width: 120rpx;
            height: 120rpx;
            border-radius: 8rpx;
          }
        }

        .dish_info {
          flex: 1;
          margin-left: 20rpx;
          position: relative;

          .dish_name {
            font-size: 28rpx;
            color: #333;
          }

          .dish_price {
            font-size: 30rpx;
            color: #e94e3c;
            font-weight: bold;

            .ico {
              font-size: 22rpx;
            }
          }

          .dish_flavor {
            font-size: 22rpx;
            color: #999;
          }

          .dish_active {
            position: absolute;
            right: 0;
            bottom: 0;
            display: flex;
            align-items: center;

            .dish_add,
            .dish_sub {
              width: 44rpx;
              height: 44rpx;
            }

            .dish_number {
              min-width: 50rpx;
              text-align: center;
              font-size: 26rpx;
            }
          }
        }
      }

      .seize_seat {
        height: 120rpx;
      }
    }
  }
}

.close {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 999;

  .text {
    color: #fff;
    font-size: 36rpx;
    padding: 30rpx 60rpx;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 20rpx;
  }
}
</style>
