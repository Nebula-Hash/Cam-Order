"use strict";
const common_vendor = require("../../common/vendor.js");
const api_cart = require("../../api/cart.js");
const utils_http = require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "cart",
  setup(__props) {
    const cartList = common_vendor.ref([]);
    const isLogin = common_vendor.ref(false);
    const groupedCart = common_vendor.computed(() => {
      const groups = {};
      cartList.value.forEach((item) => {
        const windowId = item.windowId || 0;
        if (!groups[windowId]) {
          groups[windowId] = {
            windowName: item.windowName || "未知窗口",
            items: []
          };
        }
        groups[windowId].items.push(item);
      });
      return groups;
    });
    const totalCount = common_vendor.computed(() => {
      return cartList.value.reduce((acc, cur) => acc + cur.number, 0);
    });
    const totalPrice = common_vendor.computed(() => {
      return cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0);
    });
    const getCartList = async () => {
      if (!utils_http.isLoggedIn()) {
        isLogin.value = false;
        cartList.value = [];
        return;
      }
      isLogin.value = true;
      try {
        const res = await api_cart.getCartAPI();
        cartList.value = res.data || [];
      } catch (error) {
        console.error("获取购物车失败", error);
        cartList.value = [];
      }
    };
    const addItem = async (item) => {
      const dto = {
        dishId: item.dishId,
        setmealId: item.setmealId,
        dishFlavor: item.dishFlavor
      };
      await api_cart.addToCartAPI(dto);
      await getCartList();
    };
    const subItem = async (item) => {
      const dto = {
        dishId: item.dishId,
        setmealId: item.setmealId,
        dishFlavor: item.dishFlavor
      };
      await api_cart.subCartAPI(dto);
      await getCartList();
    };
    const clearCart = async () => {
      common_vendor.index.showModal({
        title: "提示",
        content: "确定要清空购物车吗？",
        success: async (res) => {
          if (res.confirm) {
            await api_cart.cleanCartAPI();
            await getCartList();
          }
        }
      });
    };
    const submitOrder = () => {
      common_vendor.index.navigateTo({
        url: "/pages/submit/submit"
      });
    };
    const goIndex = () => {
      common_vendor.index.switchTab({
        url: "/pages/index/index"
      });
    };
    const goLogin = () => {
      common_vendor.index.navigateTo({
        url: "/pages/login/login"
      });
    };
    common_vendor.onShow(() => {
      getCartList();
    });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: !isLogin.value
      }, !isLogin.value ? {
        b: common_vendor.o(goLogin)
      } : cartList.value.length === 0 ? {
        d: common_vendor.o(goIndex)
      } : {
        e: common_vendor.f(groupedCart.value, (group, windowId, i0) => {
          return {
            a: common_vendor.t(group.windowName || "窗口"),
            b: common_vendor.f(group.items, (item, k1, i1) => {
              return common_vendor.e({
                a: item.pic || "../../static/images/logo.png",
                b: common_vendor.t(item.name),
                c: item.dishFlavor
              }, item.dishFlavor ? {
                d: common_vendor.t(item.dishFlavor)
              } : {}, {
                e: common_vendor.t(item.amount),
                f: common_vendor.o(($event) => subItem(item), item.id),
                g: common_vendor.t(item.number),
                h: common_vendor.o(($event) => addItem(item), item.id),
                i: item.id
              });
            }),
            c: windowId
          };
        }),
        f: common_vendor.o(clearCart)
      }, {
        c: cartList.value.length === 0,
        g: isLogin.value && cartList.value.length > 0
      }, isLogin.value && cartList.value.length > 0 ? {
        h: common_vendor.t(totalPrice.value.toFixed(2)),
        i: common_vendor.t(totalCount.value),
        j: common_vendor.o(submitOrder)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-fb6ea9e5"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/cart/cart.vue"]]);
wx.createPage(MiniProgramPage);
