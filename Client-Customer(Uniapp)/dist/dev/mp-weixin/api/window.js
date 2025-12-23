"use strict";
const utils_http = require("../utils/http.js");
const getWindowListAPI = () => {
  return utils_http.http({
    method: "GET",
    url: "/client/window/list"
  });
};
const getWindowByIdAPI = (id) => {
  return utils_http.http({
    method: "GET",
    url: `/client/window/${id}`
  });
};
exports.getWindowByIdAPI = getWindowByIdAPI;
exports.getWindowListAPI = getWindowListAPI;
