"use strict";
const common_vendor = require("../../common/vendor.js");
const api_address = require("../../api/address.js");
require("../../utils/http.js");
require("../../stores/modules/user.js");
const _sfc_main = /* @__PURE__ */ common_vendor.defineComponent({
  __name: "addOrEditAddress",
  setup(__props) {
    const isEdit = common_vendor.ref(false);
    const addressId = common_vendor.ref();
    const form = common_vendor.reactive({
      consignee: "",
      phone: "",
      dormitory: "",
      isDefault: 0
    });
    common_vendor.onLoad(async (options) => {
      if (options == null ? void 0 : options.id) {
        isEdit.value = true;
        addressId.value = Number(options.id);
        common_vendor.index.setNavigationBarTitle({ title: "编辑地址" });
        await loadAddress(addressId.value);
      } else {
        common_vendor.index.setNavigationBarTitle({ title: "新增地址" });
      }
    });
    const loadAddress = async (id) => {
      const res = await api_address.getAddressByIdAPI(id);
      if (res.code === 1 && res.data) {
        form.consignee = res.data.consignee || "";
        form.phone = res.data.phone || "";
        form.dormitory = res.data.dormitory || "";
        form.isDefault = res.data.isDefault || 0;
      }
    };
    const onDefaultChange = (e) => {
      form.isDefault = e.detail.value ? 1 : 0;
    };
    const saveAddress = async () => {
      var _a, _b, _c;
      if (!((_a = form.consignee) == null ? void 0 : _a.trim())) {
        return common_vendor.index.showToast({ title: "请输入联系人", icon: "none" });
      }
      if (!((_b = form.phone) == null ? void 0 : _b.trim())) {
        return common_vendor.index.showToast({ title: "请输入手机号", icon: "none" });
      }
      const phoneReg = /^1[3-9]\d{9}$/;
      if (!phoneReg.test(form.phone)) {
        return common_vendor.index.showToast({ title: "手机号格式不正确", icon: "none" });
      }
      if (!((_c = form.dormitory) == null ? void 0 : _c.trim())) {
        return common_vendor.index.showToast({ title: "请输入地址", icon: "none" });
      }
      try {
        if (isEdit.value) {
          await api_address.updateAddressAPI({ ...form, id: addressId.value });
        } else {
          await api_address.addAddressAPI(form);
        }
        common_vendor.index.showToast({ title: "保存成功", icon: "success" });
        setTimeout(() => {
          common_vendor.index.navigateBack();
        }, 1e3);
      } catch (e) {
        console.error("保存地址失败", e);
      }
    };
    const deleteAddress = async () => {
      common_vendor.index.showModal({
        title: "提示",
        content: "确定删除该地址吗？",
        success: async (res) => {
          if (res.confirm && addressId.value) {
            await api_address.deleteAddressAPI(addressId.value);
            common_vendor.index.showToast({ title: "删除成功", icon: "success" });
            setTimeout(() => {
              common_vendor.index.navigateBack();
            }, 1e3);
          }
        }
      });
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: form.consignee,
        b: common_vendor.o(($event) => form.consignee = $event.detail.value),
        c: form.phone,
        d: common_vendor.o(($event) => form.phone = $event.detail.value),
        e: form.dormitory,
        f: common_vendor.o(($event) => form.dormitory = $event.detail.value),
        g: form.isDefault === 1,
        h: common_vendor.o(onDefaultChange),
        i: common_vendor.o(saveAddress),
        j: isEdit.value
      }, isEdit.value ? {
        k: common_vendor.o(deleteAddress)
      } : {});
    };
  }
});
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-06210029"], ["__file", "D:/Desktop/Cam-Order/Client-Customer(Uniapp)/src/pages/addOrEditAddress/addOrEditAddress.vue"]]);
wx.createPage(MiniProgramPage);
