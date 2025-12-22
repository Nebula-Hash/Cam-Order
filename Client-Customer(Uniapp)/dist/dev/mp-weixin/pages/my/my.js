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
        console.log("用户信息", res);
        user.name = res.data.name;
        user.gender = res.data.gender ?? 1;
        user.phone = res.data.phone;
        user.pic = res.data.pic;
      } catch (error) {
        console.error("获取用户信息失败", error);
      }
    };
    const goLogin = () => {
      common_vendor.index.navigateTo({
        url: "/pages/login/login"
      });
    };
    const handleMenuClick = (type) => {
      if (!isLoggedIn.value) {
        common_vendor.index.showToast({ title: "请先登录", icon: "none" });
        setTimeout(() => {
          goLogin();
        }, 1e3);
        return;
      }
      switch (type) {
        case "address":
          common_vendor.index.navigateTo({ url: "/pages/address/address" });
          break;
        case "history":
          common_vendor.index.navigateTo({ url: "/pages/history/history" });
          break;
        case "setting":
          common_vendor.index.navigateTo({ url: "/pages/updateMy/updateMy" });
          break;
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
            common_vendor.index.showToast({ title: "已退出登录", icon: "success" });
          }
        }
      });
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: isLoggedIn.value
      }, isLoggedIn.value ? common_vendor.e({
        b: user.pic || "../../static/images/user_default.png",
        c: common_vendor.t(user.name || "未设置昵称"),
        d: user.gender === 0
      }, user.gender === 0 ? {} : {}, {
        e: common_vendor.t(user.phone || "未设置手机号")
      }) : {}, {
        f: common_vendor.o(($event) => !isLoggedIn.value && goLogin()),
        g: common_vendor.o(($event) => handleMenuClick("address")),
        h: common_vendor.o(($event) => handleMenuClick("history")),
        i: common_vendor.o(($event) => handleMenuClick("setting")),
        j: isLoggedIn.value
      }, isLoggedIn.value ? {
        k: common_vendor.o(handleLogout)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-d3687551"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/my/my.vue"]]);
wx.createPage(MiniProgramPage);
