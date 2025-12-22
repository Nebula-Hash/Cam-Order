"use strict";
const common_vendor = require("../../common/vendor.js");
const common_assets = require("../../common/assets.js");
const api_login = require("../../api/login.js");
require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "reg",
  setup(__props) {
    const formData = common_vendor.reactive({
      account: "",
      password: ""
    });
    const confirmPassword = common_vendor.ref("");
    const register = async () => {
      if (!formData.account.trim()) {
        common_vendor.index.showToast({ title: "请输入账号", icon: "none" });
        return;
      }
      if (formData.account.length < 3) {
        common_vendor.index.showToast({ title: "账号至少3位", icon: "none" });
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
      if (formData.password !== confirmPassword.value) {
        common_vendor.index.showToast({ title: "两次密码不一致", icon: "none" });
        return;
      }
      try {
        await api_login.registerAPI(formData);
        common_vendor.index.showToast({ icon: "success", title: "注册成功" });
        setTimeout(() => {
          common_vendor.index.navigateBack();
        }, 1e3);
      } catch (error) {
        console.error("注册失败", error);
      }
    };
    const goLogin = () => {
      common_vendor.index.navigateBack();
    };
    return (_ctx, _cache) => {
      return {
        a: common_assets._imports_0,
        b: formData.account,
        c: common_vendor.o(($event) => formData.account = $event.detail.value),
        d: formData.password,
        e: common_vendor.o(($event) => formData.password = $event.detail.value),
        f: confirmPassword.value,
        g: common_vendor.o(($event) => confirmPassword.value = $event.detail.value),
        h: common_vendor.o(register),
        i: common_vendor.o(goLogin)
      };
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-4dc59264"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/reg/reg.vue"]]);
wx.createPage(MiniProgramPage);
