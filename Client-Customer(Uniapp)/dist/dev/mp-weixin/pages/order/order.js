"use strict";
const common_vendor = require("../../common/vendor.js");
const api_category = require("../../api/category.js");
const api_dish = require("../../api/dish.js");
const api_setmeal = require("../../api/setmeal.js");
const api_cart = require("../../api/cart.js");
const api_window = require("../../api/window.js");
require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "order",
  setup(__props) {
    const windowId = common_vendor.ref(0);
    const windowName = common_vendor.ref("");
    const status = common_vendor.ref(true);
    const categoryList = common_vendor.ref([]);
    const activeIndex = common_vendor.ref(0);
    const dishList = common_vendor.ref([]);
    const openCartList = common_vendor.ref(false);
    const cartList = common_vendor.ref([]);
    const CartAllNumber = common_vendor.ref(0);
    const CartAllPrice = common_vendor.ref(0);
    const visible = common_vendor.ref(false);
    const dialogDish = common_vendor.ref();
    const flavors = common_vendor.ref([]);
    const chosedflavors = common_vendor.ref([]);
    const goBack = () => {
      common_vendor.index.navigateBack();
    };
    const getCategoryData = async () => {
      const res = await api_category.getCategoryByWindowAPI(windowId.value);
      categoryList.value = res.data || [];
    };
    const getDishOrSetmealList = async (index) => {
      activeIndex.value = index;
      if (!categoryList.value[index])
        return;
      let res;
      if (categoryList.value[index].type === 1) {
        res = await api_dish.getDishListAPI(categoryList.value[index].id);
      } else {
        res = await api_setmeal.getSetmealListAPI(categoryList.value[index].id);
      }
      dishList.value = res.data || [];
    };
    const getCartList = async () => {
      const res = await api_cart.getCartAPI();
      cartList.value = (res.data || []).filter((item) => item.windowId === windowId.value);
      CartAllNumber.value = cartList.value.reduce((acc, cur) => acc + cur.number, 0);
      CartAllPrice.value = cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0);
      if (cartList.value.length === 0) {
        openCartList.value = false;
      }
    };
    const chooseNorm = async (dish) => {
      flavors.value = dish.flavors;
      const tmpdish = Object.assign({}, dish);
      delete tmpdish.flavors;
      dialogDish.value = tmpdish;
      const moreNormdata = dish.flavors.map((obj) => ({ ...obj, list: JSON.parse(obj.list) }));
      chosedflavors.value = [];
      moreNormdata.forEach((item) => {
        if (item.list && item.list.length > 0) {
          chosedflavors.value.push(item.list[0]);
        }
      });
      visible.value = true;
    };
    const chooseFlavor = (obj, flavor) => {
      let ind = -1;
      let findst = obj.some((n) => {
        ind = chosedflavors.value.findIndex((o) => o == n);
        return ind != -1;
      });
      const indexInChosed = chosedflavors.value.findIndex((it) => it == flavor);
      if (indexInChosed == -1 && !findst) {
        chosedflavors.value.push(flavor);
      } else if (indexInChosed == -1 && findst && ind >= 0) {
        chosedflavors.value.splice(ind, 1);
        chosedflavors.value.push(flavor);
      } else {
        chosedflavors.value.splice(indexInChosed, 1);
      }
      dialogDish.value.flavors = chosedflavors.value.join(",");
    };
    const getCopies = (dish) => {
      var _a, _b;
      if (!categoryList.value[activeIndex.value])
        return 0;
      if (categoryList.value[activeIndex.value].type === 1) {
        return ((_a = cartList.value.find((item) => item.dishId === dish.id)) == null ? void 0 : _a.number) || 0;
      } else {
        return ((_b = cartList.value.find((item) => item.setmealId === dish.id)) == null ? void 0 : _b.number) || 0;
      }
    };
    const addToCart = async (dish) => {
      if (!chosedflavors.value || chosedflavors.value.length <= 0) {
        common_vendor.index.showToast({ title: "请选择规格", icon: "none" });
        return false;
      }
      const partialCart = { dishId: dish.id, dishFlavor: chosedflavors.value.join(","), windowId: windowId.value };
      await api_cart.addToCartAPI(partialCart);
      await getCartList();
      chosedflavors.value = [];
      visible.value = false;
    };
    const addDishAction = async (item, form) => {
      var _a;
      if (form == "购物车") {
        const partialCart = {
          dishId: item.dishId,
          setmealId: item.setmealId,
          dishFlavor: item.dishFlavor,
          windowId: windowId.value
        };
        await api_cart.addToCartAPI(partialCart);
      } else {
        if (((_a = categoryList.value[activeIndex.value]) == null ? void 0 : _a.type) === 1) {
          const partialCart = { dishId: item.id, windowId: windowId.value };
          await api_cart.addToCartAPI(partialCart);
        } else {
          const partialCart = { setmealId: item.id, windowId: windowId.value };
          await api_cart.addToCartAPI(partialCart);
        }
      }
      await getCartList();
    };
    const subDishAction = async (item, form) => {
      var _a;
      if (form == "购物车") {
        const partialCart = {
          dishId: item.dishId,
          setmealId: item.setmealId,
          dishFlavor: item.dishFlavor
        };
        await api_cart.subCartAPI(partialCart);
      } else {
        if (((_a = categoryList.value[activeIndex.value]) == null ? void 0 : _a.type) === 1) {
          const partialCart = { dishId: item.id };
          await api_cart.subCartAPI(partialCart);
        } else {
          const partialCart = { setmealId: item.id };
          await api_cart.subCartAPI(partialCart);
        }
      }
      await getCartList();
    };
    const clearCart = async () => {
      await api_cart.cleanCartAPI();
      await getCartList();
      openCartList.value = false;
    };
    const submitOrder = () => {
      common_vendor.index.navigateTo({ url: "/pages/submit/submit" });
    };
    common_vendor.onLoad(async (options) => {
      var _a, _b, _c;
      if (options == null ? void 0 : options.windowId) {
        windowId.value = Number(options.windowId);
        windowName.value = options.windowName || "点餐";
      }
      try {
        const res = await api_window.getWindowByIdAPI(windowId.value);
        console.log("窗口详情返回:", res);
        console.log("窗口status值:", (_a = res.data) == null ? void 0 : _a.status, "类型:", typeof ((_b = res.data) == null ? void 0 : _b.status));
        status.value = ((_c = res.data) == null ? void 0 : _c.status) == 1;
        console.log("status.value 赋值后:", status.value);
      } catch (e) {
        console.error("获取窗口状态失败:", e);
        status.value = true;
      }
      await getCategoryData();
      if (categoryList.value.length > 0) {
        await getDishOrSetmealList(0);
      }
      await getCartList();
    });
    common_vendor.onShow(async () => {
      await getCartList();
    });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.o(goBack),
        b: common_vendor.t(windowName.value),
        c: common_vendor.f(categoryList.value, (item, index, i0) => {
          return {
            a: common_vendor.t(item.name),
            b: item.id,
            c: index === activeIndex.value ? 1 : "",
            d: common_vendor.o(($event) => getDishOrSetmealList(index), item.id)
          };
        }),
        d: common_vendor.f(dishList.value, (dish, k0, i0) => {
          var _a;
          return common_vendor.e({
            a: dish.pic || "../../static/images/logo.png",
            b: common_vendor.t(dish.name),
            c: common_vendor.t(dish.detail),
            d: common_vendor.t(dish.price),
            e: "flavors" in dish && dish.flavors && dish.flavors.length > 0
          }, "flavors" in dish && dish.flavors && dish.flavors.length > 0 ? {
            f: common_vendor.o(($event) => chooseNorm(dish), dish.id)
          } : common_vendor.e({
            g: getCopies(dish) > 0
          }, getCopies(dish) > 0 ? {
            h: common_vendor.o(($event) => subDishAction(dish, "普通"), dish.id)
          } : {}, {
            i: getCopies(dish) > 0
          }, getCopies(dish) > 0 ? {
            j: common_vendor.t(getCopies(dish))
          } : {}, {
            k: common_vendor.o(($event) => addDishAction(dish, "普通"), dish.id)
          }), {
            l: dish.id,
            m: `/pages/detail/detail?windowId=${windowId.value}&${((_a = categoryList.value[activeIndex.value]) == null ? void 0 : _a.type) === 1 ? "dishId" : "setmealId"}=${dish.id}`
          });
        }),
        e: common_vendor.f(flavors.value, (flavor, k0, i0) => {
          return {
            a: common_vendor.t(flavor.name),
            b: common_vendor.f(JSON.parse(flavor.list), (item, index, i1) => {
              return {
                a: common_vendor.t(item),
                b: chosedflavors.value.findIndex((it) => item === it) !== -1 ? 1 : "",
                c: index,
                d: common_vendor.o(($event) => chooseFlavor(JSON.parse(flavor.list), item), index)
              };
            }),
            c: flavor.name
          };
        }),
        f: common_vendor.o(($event) => addToCart(dialogDish.value)),
        g: common_vendor.o(($event) => visible.value = false),
        h: visible.value,
        i: cartList.value.length === 0
      }, cartList.value.length === 0 ? {} : {
        j: common_vendor.t(CartAllNumber.value),
        k: common_vendor.t(parseFloat((Math.round(CartAllPrice.value * 100) / 100).toFixed(2))),
        l: common_vendor.o(($event) => submitOrder()),
        m: common_vendor.o(() => openCartList.value = !openCartList.value)
      }, {
        n: common_vendor.o(($event) => clearCart()),
        o: common_vendor.f(cartList.value, (obj, index, i0) => {
          return common_vendor.e({
            a: obj.pic || "../../static/images/logo.png",
            b: common_vendor.t(obj.name),
            c: common_vendor.t(obj.amount),
            d: common_vendor.t(obj.dishFlavor),
            e: obj.number && obj.number > 0
          }, obj.number && obj.number > 0 ? {
            f: common_vendor.o(($event) => subDishAction(obj, "购物车"), index)
          } : {}, {
            g: obj.number && obj.number > 0
          }, obj.number && obj.number > 0 ? {
            h: common_vendor.t(obj.number)
          } : {}, {
            i: common_vendor.o(($event) => addDishAction(obj, "购物车"), index),
            j: index
          });
        }),
        p: common_vendor.o(() => {
        }),
        q: openCartList.value,
        r: common_vendor.o(($event) => openCartList.value = !openCartList.value),
        s: !status.value
      }, !status.value ? {
        t: common_vendor.o(goBack)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-88bf5328"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/order/order.vue"]]);
wx.createPage(MiniProgramPage);
