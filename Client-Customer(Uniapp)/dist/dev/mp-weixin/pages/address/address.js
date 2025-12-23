"use strict";
const common_vendor = require("../../common/vendor.js");
const api_address = require("../../api/address.js");
const stores_modules_address = require("../../stores/modules/address.js");
require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "address",
  setup(__props) {
    const store = stores_modules_address.useAddressStore();
    const addressList = common_vendor.ref([]);
    const addressBackUrl = store.addressBackUrl;
    common_vendor.onShow(() => {
      getAddressList();
    });
    const getAddressList = async () => {
      try {
        const res = await api_address.getAddressListAPI();
        if (res.code === 1) {
          addressList.value = res.data || [];
        }
      } catch (e) {
        console.error("获取地址列表失败", e);
      }
    };
    const addAddress = () => {
      common_vendor.index.navigateTo({
        url: "/pages/addOrEditAddress/addOrEditAddress"
      });
    };
    const editAddress = (item) => {
      common_vendor.index.navigateTo({
        url: `/pages/addOrEditAddress/addOrEditAddress?id=${item.id}`
      });
    };
    const choseAddress = (item) => {
      if (addressBackUrl === "/pages/submit/submit") {
        common_vendor.index.redirectTo({
          url: "/pages/submit/submit?address=" + JSON.stringify(item)
        });
      }
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: addressList.value && addressList.value.length > 0
      }, addressList.value && addressList.value.length > 0 ? {
        b: common_vendor.f(addressList.value, (item, k0, i0) => {
          return common_vendor.e({
            a: common_vendor.t(item.dormitory),
            b: common_vendor.t(item.consignee),
            c: common_vendor.t(item.phone),
            d: item.isDefault === 1
          }, item.isDefault === 1 ? {} : {}, {
            e: common_vendor.o(($event) => editAddress(item), item.id),
            f: item.id,
            g: common_vendor.o(($event) => choseAddress(item), item.id)
          });
        })
      } : {}, {
        c: common_vendor.o(addAddress)
      });
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-2312e3da"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/address/address.vue"]]);
wx.createPage(MiniProgramPage);
