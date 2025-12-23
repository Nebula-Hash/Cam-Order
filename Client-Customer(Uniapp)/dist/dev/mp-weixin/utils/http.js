"use strict";
const common_vendor = require("../common/vendor.js");
const stores_modules_user = require("../stores/modules/user.js");
const baseURL = "http://localhost:8081";
let isNavigatingToLogin = false;
const httpInterceptor = {
  // 拦截前触发
  invoke(options) {
    var _a;
    if (!options.url.startsWith("http")) {
      options.url = baseURL + options.url;
    }
    options.timeout = 1e4;
    options.header = {
      "source-client": "miniapp",
      ...options.header
    };
    const userStore = stores_modules_user.useUserStore();
    const token = (_a = userStore.profile) == null ? void 0 : _a.token;
    console.log("token", token);
    if (token) {
      options.header.Authorization = token;
    }
  }
};
common_vendor.index.addInterceptor("request", httpInterceptor);
const http = (options) => {
  return new Promise((resolve, reject) => {
    common_vendor.index.request({
      ...options,
      // 响应成功
      success(res) {
        console.log("响应  ", res);
        if (res.statusCode >= 200 && res.statusCode < 300) {
          const data = res.data;
          if (data.code === 1) {
            resolve(data);
          } else {
            common_vendor.index.showToast({
              title: data.msg || "操作失败",
              icon: "none"
            });
            reject(data);
          }
        } else if (res.statusCode === 401) {
          const userStore = stores_modules_user.useUserStore();
          userStore.clearProfile();
          if (!isNavigatingToLogin) {
            isNavigatingToLogin = true;
            common_vendor.index.showToast({
              title: "请先登录",
              icon: "none"
            });
            setTimeout(() => {
              common_vendor.index.navigateTo({
                url: "/pages/login/login",
                complete: () => {
                  setTimeout(() => {
                    isNavigatingToLogin = false;
                  }, 1e3);
                }
              });
            }, 500);
          }
          reject(res);
        } else {
          common_vendor.index.showToast({
            title: res.data.msg || "请求失败",
            icon: "none"
          });
          reject(res);
        }
      },
      // 响应失败
      fail(err) {
        common_vendor.index.showToast({
          title: "网络不行，换个试试？",
          icon: "none"
          // mask: true,
        });
        reject(err);
      }
    });
  });
};
const isLoggedIn = () => {
  var _a;
  const userStore = stores_modules_user.useUserStore();
  return !!((_a = userStore.profile) == null ? void 0 : _a.token);
};
exports.http = http;
exports.isLoggedIn = isLoggedIn;
