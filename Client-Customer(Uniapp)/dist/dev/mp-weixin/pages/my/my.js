"use strict";
const common_vendor = require("../../common/vendor.js");
const stores_modules_user = require("../../stores/modules/user.js");
const api_user = require("../../api/user.js");
require("../../utils/http.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "my",
  setup(__props) {
    var _a;
    const userStore = stores_modules_user.useUserStore();
    const isLoggedIn = common_vendor.ref(!!userStore.profile);
    const balance = common_vendor.ref("0.00");
    const user = common_vendor.reactive({
      id: ((_a = userStore.profile) == null ? void 0 : _a.id) ?? 0,
      name: "",
      gender: 1,
      phone: "",
      pic: ""
    });
    common_vendor.onShow(async () => {
      var _a2;
      isLoggedIn.value = !!userStore.profile;
      user.id = ((_a2 = userStore.profile) == null ? void 0 : _a2.id) ?? 0;
      if (isLoggedIn.value && user.id) {
        await getUserInfo(user.id);
      }
    });
    const getUserInfo = async (id) => {
      try {
        const res = await api_user.getUserInfoAPI(id);
        user.name = res.data.name || "";
        user.gender = res.data.gender ?? 1;
        user.phone = res.data.phone || "";
        user.pic = res.data.pic || "";
        balance.value = (res.data.balance ?? 0).toFixed(2);
      } catch (error) {
        console.error("获取用户信息失败", error);
      }
    };
    const goLogin = () => {
      common_vendor.index.navigateTo({ url: "/pages/login/login" });
    };
    const handleMenuClick = (type) => {
      if (!isLoggedIn.value) {
        common_vendor.index.showToast({ title: "请先登录", icon: "none" });
        setTimeout(() => goLogin(), 1e3);
        return;
      }
      const routes = {
        address: "/pages/address/address",
        history: "/pages/history/history",
        setting: "/pages/updateMy/updateMy"
      };
      if (routes[type]) {
        common_vendor.index.navigateTo({ url: routes[type] });
      }
    };
    const handleRecharge = async () => {
      try {
        await api_user.rechargeAPI(100);
        common_vendor.index.showToast({ title: "充值成功 +100", icon: "success" });
        if (user.id) {
          await getUserInfo(user.id);
        }
      } catch (error) {
        console.error("充值失败", error);
      }
    };
    const handleLogout = () => {
      common_vendor.index.showModal({
        title: "提示",
        content: "确定要退出登录吗？",
        success: (res) => {
          if (res.confirm) {
            userStore.clearProfile();
            isLoggedIn.value = false;
            user.id = 0;
            user.name = "";
            user.gender = 1;
            user.phone = "";
            user.pic = "";
            balance.value = "0.00";
            common_vendor.index.showToast({ title: "已退出登录", icon: "success" });
          }
        }
      });
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: user.pic || "../../static/images/user_default.png",
        b: isLoggedIn.value
      }, isLoggedIn.value ? common_vendor.e({
        c: common_vendor.t(user.name || "未设置昵称"),
        d: user.gender === 0
      }, user.gender === 0 ? {} : {}, {
        e: common_vendor.t(user.phone || "未设置手机号")
      }) : {}, {
        f: common_vendor.o(($event) => !isLoggedIn.value && goLogin()),
        g: isLoggedIn.value
      }, isLoggedIn.value ? {
        h: common_vendor.t(balance.value),
        i: common_vendor.o(handleRecharge)
      } : {}, {
        j: common_vendor.o(($event) => handleMenuClick("address")),
        k: common_vendor.o(($event) => handleMenuClick("history")),
        l: common_vendor.o(($event) => handleMenuClick("setting")),
        m: isLoggedIn.value
      }, isLoggedIn.value ? {
        n: common_vendor.o(handleLogout)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-d3687551"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/my/my.vue"]]);
wx.createPage(MiniProgramPage);
