"use strict";
const utils_http = require("../utils/http.js");
const loginAPI = (data) => {
  return utils_http.http({
    method: "POST",
    url: "/user/user/login",
    data
  });
};
const registerAPI = (data) => {
  return utils_http.http({
    method: "POST",
    url: "/user/user/register",
    data
  });
};
exports.loginAPI = loginAPI;
exports.registerAPI = registerAPI;
