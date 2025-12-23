"use strict";
const common_vendor = require("../../common/vendor.js");
const api_window = require("../../api/window.js");
require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "index",
  setup(__props) {
    const windowList = common_vendor.ref([]);
    const getWindowList = async () => {
      try {
        const res = await api_window.getWindowListAPI();
        windowList.value = res.data || [];
      } catch (error) {
        console.error("获取窗口列表失败", error);
      }
    };
    const toWindowDetail = (item) => {
      if (item.status !== 1) {
        common_vendor.index.showToast({
          title: "该窗口暂未营业",
          icon: "none"
        });
        return;
      }
      common_vendor.index.navigateTo({
        url: `/pages/order/order?windowId=${item.id}&windowName=${item.name}`
      });
    };
    common_vendor.onShow(() => {
      getWindowList();
    });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.f(windowList.value, (item, k0, i0) => {
          var _a, _b;
          return {
            a: item.pic || "../../static/images/logo.png",
            b: common_vendor.t(item.name),
            c: common_vendor.t(item.description),
            d: common_vendor.t(item.location),
            e: common_vendor.t(item.status === 1 ? "营业中" : "休息中"),
            f: common_vendor.n(item.status === 1 ? "open" : "closed"),
            g: common_vendor.t((_a = item.openTime) == null ? void 0 : _a.slice(0, 5)),
            h: common_vendor.t((_b = item.closeTime) == null ? void 0 : _b.slice(0, 5)),
            i: item.id,
            j: common_vendor.o(($event) => toWindowDetail(item), item.id)
          };
        }),
        b: windowList.value.length === 0
      }, windowList.value.length === 0 ? {} : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-83a5a03c"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/index/index.vue"]]);
wx.createPage(MiniProgramPage);
