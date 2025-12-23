"use strict";
const common_vendor = require("../../common/vendor.js");
const api_address = require("../../api/address.js");
const api_cart = require("../../api/cart.js");
const api_order = require("../../api/order.js");
const api_user = require("../../api/user.js");
const stores_modules_address = require("../../stores/modules/address.js");
const stores_modules_user = require("../../stores/modules/user.js");
require("../../utils/http.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "submit",
  setup(__props, { expose: __expose }) {
    const store = stores_modules_address.useAddressStore();
    const userStore = stores_modules_user.useUserStore();
    const deliveryType = common_vendor.ref(1);
    const cartList = common_vendor.ref([]);
    const CartAllNumber = common_vendor.ref(0);
    const CartAllPrice = common_vendor.computed(() => {
      const dishTotal = cartList.value.reduce((acc, cur) => acc + cur.amount * cur.number, 0);
      const packFee = CartAllNumber.value;
      const deliveryFee = deliveryType.value === 1 ? 6 : 0;
      return dishTotal + packFee + deliveryFee;
    });
    const userBalance = common_vendor.ref(0);
    const address = common_vendor.ref("");
    const label = common_vendor.ref("");
    const consignee = common_vendor.ref("");
    const phoneNumber = common_vendor.ref("");
    const addressId = common_vendor.ref(0);
    const estimatedDeliveryTime = common_vendor.ref("");
    const arrivalTime = common_vendor.ref("");
    const openCooker = common_vendor.ref(false);
    const cookerNum = common_vendor.ref(-2);
    const cookers = common_vendor.ref([-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
    const radioStatus = common_vendor.ref(false);
    const remark = common_vendor.ref("");
    const showPickupModal = common_vendor.ref(false);
    const pickupCode = common_vendor.ref("");
    const setDeliveryType = (type) => {
      deliveryType.value = type;
    };
    const getUserBalance = async () => {
      var _a;
      const userId = (_a = userStore.profile) == null ? void 0 : _a.id;
      if (userId) {
        try {
          const res = await api_user.getUserInfoAPI(userId);
          userBalance.value = res.data.balance ?? 0;
        } catch (e) {
          console.error("获取余额失败", e);
        }
      }
    };
    const getCartList = async () => {
      const res = await api_cart.getCartAPI();
      cartList.value = res.data;
      CartAllNumber.value = cartList.value.reduce((acc, cur) => acc + cur.number, 0);
    };
    common_vendor.onLoad(async (options) => {
      await getAddressBookDefault();
      await getUserBalance();
      if (options.address) {
        const addressObj = JSON.parse(options.address);
        addressId.value = addressObj.id;
        label.value = addressObj.label;
        address.value = addressObj.dormitory || "";
        phoneNumber.value = addressObj.phone;
        consignee.value = addressObj.consignee;
      } else if (options.remark) {
        remark.value = options.remark;
      }
      await getCartList();
      getHarfAnOur();
      if (store.defaultCook === "无需餐具") {
        cookerNum.value = -1;
      } else if (store.defaultCook === "商家依据餐量提供") {
        cookerNum.value = 0;
      }
    });
    common_vendor.onShow(async () => {
      await getCartList();
    });
    const DateToStr = (date) => {
      const year = date.getFullYear();
      const month = date.getMonth();
      const day = date.getDate();
      const hours = date.getHours();
      const min = date.getMinutes();
      const second = date.getSeconds();
      return year + "-" + (month + 1 > 9 ? month + 1 : "0" + (month + 1)) + "-" + (day > 9 ? day : "0" + day) + " " + (hours > 9 ? hours : "0" + hours) + ":" + (min > 9 ? min : "0" + min) + ":" + (second > 9 ? second : "0" + second);
    };
    const getHarfAnOur = () => {
      const date = /* @__PURE__ */ new Date();
      date.setTime(date.getTime() + 36e5);
      estimatedDeliveryTime.value = DateToStr(date);
      let hours = date.getHours().toString();
      let minutes = date.getMinutes().toString();
      if (hours.length === 1)
        hours = "0" + hours;
      if (minutes.length === 1)
        minutes = "0" + minutes;
      arrivalTime.value = hours + ":" + minutes;
    };
    const getAddressBookDefault = async () => {
      try {
        const res = await api_address.getDefaultAddressAPI();
        if (res.code === 1 && res.data) {
          address.value = res.data.dormitory || "";
          phoneNumber.value = res.data.phone;
          consignee.value = res.data.consignee;
          addressId.value = res.data.id;
          label.value = res.data.label || "";
        }
      } catch (e) {
        console.log("没有默认地址");
      }
    };
    const trans = (item) => {
      switch (item) {
        case "公司":
          return "1";
        case "家":
          return "2";
        case "学校":
          return "3";
        default:
          return "4";
      }
    };
    const goAddress = () => {
      store.addressBackUrl = "/pages/submit/submit";
      common_vendor.index.redirectTo({ url: "/pages/address/address" });
    };
    const goRemark = () => {
      common_vendor.index.navigateTo({ url: "/pages/remark/remark" });
    };
    const chooseCooker = () => {
      openCooker.value = true;
    };
    const getCookerInfo = () => {
      if (cookerNum.value === -2)
        return "请依据实际情况填写，避免浪费";
      else if (cookerNum.value === -1)
        return "无需餐具";
      else if (cookerNum.value === 0)
        return "商家依据餐量提供";
      else if (cookerNum.value === 11)
        return "10份以上";
      else
        return cookerNum.value + "份";
    };
    const pickerChange = (ev) => {
      cookerNum.value = ev.detail.value[0] - 1;
    };
    const radioChange = () => {
      radioStatus.value = !radioStatus.value;
      if (radioStatus.value) {
        store.defaultCook = cookerNum.value === -1 ? "无需餐具" : "商家依据餐量提供";
      } else {
        store.defaultCook = "请依据实际情况填写，避免浪费";
      }
    };
    const closeMask = () => {
      openCooker.value = false;
    };
    const closePickupModal = () => {
      showPickupModal.value = false;
      common_vendor.index.redirectTo({ url: "/pages/history/history" });
    };
    const payOrderHandle = async () => {
      const unPayRes = await api_order.getUnPayOrderAPI();
      if (unPayRes.data !== 0) {
        common_vendor.index.showToast({ title: "有未支付订单，请先支付或取消！", icon: "none" });
        return false;
      }
      if (deliveryType.value === 1 && !address.value) {
        common_vendor.index.showToast({ title: "请选择收货地址", icon: "none" });
        return false;
      }
      if (cookerNum.value === -2) {
        common_vendor.index.showToast({ title: "请选择餐具份数", icon: "none" });
        return false;
      }
      if (userBalance.value < CartAllPrice.value) {
        common_vendor.index.showToast({ title: `余额不足，当前余额￥${userBalance.value}`, icon: "none" });
        return false;
      }
      const deliveryText = deliveryType.value === 1 ? "配送" : "自取";
      common_vendor.index.showModal({
        title: "确认支付",
        content: `配送方式：${deliveryText}
订单金额：￥${CartAllPrice.value}
当前余额：￥${userBalance.value}
支付后余额：￥${(userBalance.value - CartAllPrice.value).toFixed(2)}`,
        confirmText: "确认支付",
        cancelText: "取消",
        success: async (modalRes) => {
          if (modalRes.confirm) {
            await doSubmitAndPay();
          }
        }
      });
    };
    const doSubmitAndPay = async () => {
      const params = {
        payMethod: 1,
        addressId: deliveryType.value === 1 ? addressId.value : null,
        remark: remark.value,
        deliveryType: deliveryType.value,
        tablewareNumber: cookerNum.value,
        tablewareStatus: cookerNum.value === 0 ? 1 : 0,
        packAmount: CartAllNumber.value,
        amount: CartAllPrice.value
      };
      try {
        const res = await api_order.submitOrderAPI(params);
        if (res.code === 1 && res.data && res.data.orderNumber) {
          const payRes = await api_order.payOrderAPI({
            orderNumber: res.data.orderNumber,
            payMethod: 1
          });
          if (payRes.code === 1) {
            if (deliveryType.value === 2 && res.data.pickupCode) {
              pickupCode.value = res.data.pickupCode;
              showPickupModal.value = true;
              common_vendor.index.showToast({ title: "支付成功", icon: "success" });
            } else {
              common_vendor.index.showToast({ title: "支付成功", icon: "success" });
              setTimeout(() => {
                common_vendor.index.redirectTo({ url: "/pages/history/history" });
              }, 1500);
            }
          } else {
            common_vendor.index.showToast({ title: payRes.msg || "支付失败", icon: "none" });
          }
        } else {
          common_vendor.index.showToast({ title: res.msg || "订单创建失败", icon: "none" });
        }
      } catch (e) {
        console.error("支付异常", e);
        common_vendor.index.showToast({ title: "支付异常，请重试", icon: "none" });
      }
    };
    __expose({ remark });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: deliveryType.value === 1 ? 1 : "",
        b: common_vendor.o(($event) => setDeliveryType(1)),
        c: deliveryType.value === 2 ? 1 : "",
        d: common_vendor.o(($event) => setDeliveryType(2)),
        e: deliveryType.value === 1
      }, deliveryType.value === 1 ? common_vendor.e({
        f: !address.value
      }, !address.value ? {} : {}, {
        g: address.value
      }, address.value ? {
        h: common_vendor.t(label.value || "其他"),
        i: common_vendor.n("tag" + trans(label.value)),
        j: common_vendor.t(address.value),
        k: common_vendor.t(consignee.value),
        l: common_vendor.t(phoneNumber.value)
      } : {}, {
        m: common_vendor.o(goAddress),
        n: common_vendor.t(arrivalTime.value)
      }) : {}, {
        o: deliveryType.value === 2
      }, deliveryType.value === 2 ? {} : {}, {
        p: common_vendor.f(cartList.value, (obj, index, i0) => {
          return common_vendor.e({
            a: obj.pic,
            b: common_vendor.t(obj.name),
            c: obj.dishFlavor
          }, obj.dishFlavor ? {
            d: common_vendor.t(obj.dishFlavor)
          } : {}, {
            e: obj.number && obj.number > 0
          }, obj.number && obj.number > 0 ? {
            f: common_vendor.t(obj.number)
          } : {}, {
            g: common_vendor.t(obj.amount),
            h: index
          });
        }),
        q: common_vendor.t(CartAllNumber.value),
        r: common_vendor.t(deliveryType.value === 2 ? "免费" : "￥6"),
        s: deliveryType.value === 2 ? 1 : "",
        t: common_vendor.t(CartAllPrice.value),
        v: common_vendor.t(remark.value || "选择口味等"),
        w: common_vendor.o(goRemark),
        x: common_vendor.t(getCookerInfo()),
        y: common_vendor.o(chooseCooker),
        z: common_vendor.t(CartAllNumber.value),
        A: common_vendor.t(parseFloat((Math.round(CartAllPrice.value * 100) / 100).toFixed(2))),
        B: common_vendor.o(($event) => payOrderHandle()),
        C: common_vendor.o(closeMask),
        D: common_vendor.f(cookers.value, (item, k0, i0) => {
          return {
            a: common_vendor.t(item === -1 ? "无需餐具" : item === 0 ? "商家依据餐量提供" : item === 11 ? "10份以上" : item + "份"),
            b: item
          };
        }),
        E: cookers.value,
        F: common_vendor.o(pickerChange),
        G: radioStatus.value,
        H: common_vendor.o(radioChange),
        I: common_vendor.t(cookerNum.value === -2 || cookerNum.value === -1 ? "以后都无需餐具" : "以后都需要餐具，商家依据餐量提供"),
        J: common_vendor.o(($event) => openCooker.value = !openCooker.value),
        K: common_vendor.o(($event) => openCooker.value = openCooker.value),
        L: openCooker.value,
        M: common_vendor.o(($event) => openCooker.value = !openCooker.value),
        N: showPickupModal.value
      }, showPickupModal.value ? {
        O: common_vendor.t(pickupCode.value),
        P: common_vendor.o(closePickupModal)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-fb87e98c"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/submit/submit.vue"]]);
wx.createPage(MiniProgramPage);
