"use strict";
const utils_http = require("../utils/http.js");
const getUserInfoAPI = (id) => {
  return utils_http.http({
    url: `/user/user/${id}`,
    method: "GET"
  });
};
const updateUserAPI = (params) => {
  return utils_http.http({
    url: "/user/user",
    method: "PUT",
    data: params
  });
};
const rechargeAPI = (amount) => {
  return utils_http.http({
    url: "/user/user/recharge",
    method: "POST",
    data: { amount }
  });
};
exports.getUserInfoAPI = getUserInfoAPI;
exports.rechargeAPI = rechargeAPI;
exports.updateUserAPI = updateUserAPI;
