"use strict";
const common_vendor = require("../../common/vendor.js");
const common_assets = require("../../common/assets.js");
const api_login = require("../../api/login.js");
const stores_modules_user = require("../../stores/modules/user.js");
require("../../utils/http.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "login",
  setup(__props) {
    const formData = common_vendor.reactive({
      account: "",
      password: ""
    });
    common_vendor.ref(false);
    const login = async () => {
      if (!formData.account.trim()) {
        common_vendor.index.showToast({ title: "请输入账号", icon: "none" });
        return;
      }
      if (!formData.password.trim()) {
        common_vendor.index.showToast({ title: "请输入密码", icon: "none" });
        return;
      }
      if (formData.password.length < 6) {
        common_vendor.index.showToast({ title: "密码至少6位", icon: "none" });
        return;
      }
      try {
        const res = await api_login.loginAPI(formData);
        console.log("登录结果", res);
        loginSuccess(res.data);
      } catch (error) {
        console.error("登录失败", error);
      }
    };
    const loginSuccess = (profile) => {
      const userStore = stores_modules_user.useUserStore();
      userStore.setProfile(profile);
      common_vendor.index.showToast({ icon: "success", title: "登录成功" });
      setTimeout(() => {
        common_vendor.index.switchTab({ url: "/pages/my/my" });
      }, 500);
    };
    const goRegister = () => {
      common_vendor.index.navigateTo({ url: "/pages/reg/reg" });
    };
    return (_ctx, _cache) => {
      return {
        a: common_assets._imports_0,
        b: formData.account,
        c: common_vendor.o(($event) => formData.account = $event.detail.value),
        d: formData.password,
        e: common_vendor.o(($event) => formData.password = $event.detail.value),
        f: common_vendor.o(login),
        g: common_vendor.o(goRegister)
      };
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-cdfe2409"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/login/login.vue"]]);
wx.createPage(MiniProgramPage);
