"use strict";
const utils_http = require("../utils/http.js");
const getCategoryAPI = () => {
  return utils_http.http({
    method: "GET",
    url: "/user/category/list"
  });
};
const getCategoryByWindowAPI = (windowId) => {
  return utils_http.http({
    method: "GET",
    url: `/user/category/list/${windowId}`
  });
};
exports.getCategoryAPI = getCategoryAPI;
exports.getCategoryByWindowAPI = getCategoryByWindowAPI;
