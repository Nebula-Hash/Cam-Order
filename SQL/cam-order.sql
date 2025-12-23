/*
 Navicat Premium Dump SQL

 Source Server         : Local_MySQL
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : cam-order

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 23/12/2025 09:33:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `consignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收餐人姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `dormitory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宿舍楼号（如：12栋305）',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签（宿舍、教室等）',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认：0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地址簿' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1, 1, '张三', '15800000001', '1栋305', '宿舍', 1);
INSERT INTO `address_book` VALUES (2, 1, '张三', '15800000001', '教学楼A301', '教室', 0);
INSERT INTO `address_book` VALUES (3, 2, '李四', '15800000002', '2栋418', '宿舍', 1);
INSERT INTO `address_book` VALUES (4, 3, '王五', '15800000003', '3栋201', '宿舍', 1);
INSERT INTO `address_book` VALUES (5, 4, '赵六', '15800000004', '4栋512', '宿舍', 1);
INSERT INTO `address_book` VALUES (6, 5, '钱七', '15800000005', '5栋108', '宿舍', 1);
INSERT INTO `address_book` VALUES (7, 6, '孙八', '15800000006', '6栋320', '宿舍', 1);
INSERT INTO `address_book` VALUES (8, 7, '周九', '15800000007', '7栋215', '宿舍', 1);
INSERT INTO `address_book` VALUES (9, 8, '吴十', '15800000008', '8栋401', '宿舍', 1);
INSERT INTO `address_book` VALUES (10, 9, '陈老师', '15800000009', '教师公寓A栋302', '住宅', 1);
INSERT INTO `address_book` VALUES (11, 10, '林老师', '15800000010', '教师公寓B栋105', '住宅', 1);
INSERT INTO `address_book` VALUES (12, 11, '小明', '15800000011', '12栋440', '宿舍', 1);
INSERT INTO `address_book` VALUES (13, 12, '小红', '15800000012', '6栋189', '宿舍', 1);
INSERT INTO `address_book` VALUES (14, 13, '小刚', '15800000013', '7栋231', '宿舍', 1);
INSERT INTO `address_book` VALUES (15, 14, '小丽', '15800000014', '8栋296', '宿舍', 1);
INSERT INTO `address_book` VALUES (16, 15, '小强', '15800000015', '1栋145', '宿舍', 1);
INSERT INTO `address_book` VALUES (17, 16, '小芳', '15800000016', '4栋199', '宿舍', 1);
INSERT INTO `address_book` VALUES (18, 17, '小伟', '15800000017', '2栋586', '宿舍', 1);
INSERT INTO `address_book` VALUES (19, 18, '小娟', '15800000018', '7栋444', '宿舍', 1);
INSERT INTO `address_book` VALUES (20, 19, '小军', '15800000019', '11栋265', '宿舍', 1);
INSERT INTO `address_book` VALUES (21, 20, '小燕', '15800000020', '1栋144', '宿舍', 1);
INSERT INTO `address_book` VALUES (22, 21, '小磊', '15800000021', '5栋449', '宿舍', 1);
INSERT INTO `address_book` VALUES (23, 22, '小雪', '15800000022', '4栋349', '宿舍', 1);
INSERT INTO `address_book` VALUES (24, 23, '小峰', '15800000023', '7栋194', '宿舍', 1);
INSERT INTO `address_book` VALUES (25, 24, '小云', '15800000024', '4栋145', '宿舍', 1);
INSERT INTO `address_book` VALUES (26, 25, '小龙', '15800000025', '6栋118', '宿舍', 1);
INSERT INTO `address_book` VALUES (27, 1, '张三', '15800000001', '3栋375', '宿舍', 1);
INSERT INTO `address_book` VALUES (28, 2, '李四', '15800000002', '3栋223', '宿舍', 1);
INSERT INTO `address_book` VALUES (29, 3, '王五', '15800000003', '9栋459', '宿舍', 1);
INSERT INTO `address_book` VALUES (30, 4, '赵六', '15800000004', '7栋314', '宿舍', 1);
INSERT INTO `address_book` VALUES (31, 5, '钱七', '15800000005', '8栋452', '宿舍', 1);
INSERT INTO `address_book` VALUES (32, 6, '孙八', '15800000006', '9栋358', '宿舍', 1);
INSERT INTO `address_book` VALUES (33, 7, '周九', '15800000007', '5栋340', '宿舍', 1);
INSERT INTO `address_book` VALUES (34, 8, '吴十', '15800000008', '3栋343', '宿舍', 1);
INSERT INTO `address_book` VALUES (35, 11, '小明', '15800000011', '11栋558', '宿舍', 1);
INSERT INTO `address_book` VALUES (36, 12, '小红', '15800000012', '12栋118', '宿舍', 1);
INSERT INTO `address_book` VALUES (37, 13, '小刚', '15800000013', '4栋332', '宿舍', 1);
INSERT INTO `address_book` VALUES (38, 14, '小丽', '15800000014', '5栋341', '宿舍', 1);
INSERT INTO `address_book` VALUES (39, 15, '小强', '15800000015', '4栋597', '宿舍', 1);
INSERT INTO `address_book` VALUES (40, 16, '小芳', '15800000016', '2栋386', '宿舍', 1);
INSERT INTO `address_book` VALUES (41, 17, '小伟', '15800000017', '7栋565', '宿舍', 1);
INSERT INTO `address_book` VALUES (42, 18, '小娟', '15800000018', '1栋357', '宿舍', 1);
INSERT INTO `address_book` VALUES (43, 19, '小军', '15800000019', '5栋309', '宿舍', 1);
INSERT INTO `address_book` VALUES (44, 20, '小燕', '15800000020', '11栋257', '宿舍', 1);
INSERT INTO `address_book` VALUES (45, 21, '小磊', '15800000021', '11栋211', '宿舍', 1);
INSERT INTO `address_book` VALUES (46, 22, '小雪', '15800000022', '8栋302', '宿舍', 1);
INSERT INTO `address_book` VALUES (47, 23, '小峰', '15800000023', '3栋436', '宿舍', 1);
INSERT INTO `address_book` VALUES (48, 24, '小云', '15800000024', '11栋182', '宿舍', 1);
INSERT INTO `address_book` VALUES (49, 25, '小龙', '15800000025', '4栋137', '宿舍', 1);
INSERT INTO `address_book` VALUES (58, 71, 'aee', '17613761018', 'asdasd', NULL, 1);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `window_id` int NOT NULL COMMENT '窗口ID',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品ID',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '单价',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_window_id`(`window_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1, 1, NULL, '麻婆豆腐', NULL, '中辣', 1, 15.00, '2025-12-23 05:21:52');
INSERT INTO `cart` VALUES (2, 1, 1, 2, NULL, '宫保鸡丁', NULL, '微辣', 2, 18.00, '2025-12-23 05:21:52');
INSERT INTO `cart` VALUES (3, 2, 2, 10, NULL, '红烧牛肉面', NULL, '宽面,微辣', 1, 16.00, '2025-12-23 05:21:52');
INSERT INTO `cart` VALUES (4, 3, 3, 19, NULL, '红烧排骨饭', NULL, '正常', 1, 18.00, '2025-12-23 05:21:52');
INSERT INTO `cart` VALUES (5, 3, 3, 24, NULL, '蛋炒饭', NULL, '加蛋', 1, 10.00, '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `window_id` int NOT NULL COMMENT '所属窗口ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `type` tinyint NOT NULL COMMENT '类型：1-菜品分类 2-套餐分类',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
  `create_user` int NOT NULL COMMENT '创建人',
  `update_user` int NOT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_window_name`(`window_id` ASC, `name` ASC) USING BTREE,
  INDEX `idx_window_id`(`window_id` ASC) USING BTREE,
  CONSTRAINT `fk_category_window` FOREIGN KEY (`window_id`) REFERENCES `window` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, '招牌川菜', 1, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (2, 1, '凉菜小吃', 1, 2, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (3, 1, '川味套餐', 2, 3, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (4, 2, '汤面系列', 1, 1, 1, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (5, 2, '拌面系列', 1, 2, 1, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (6, 2, '面食套餐', 2, 3, 1, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (7, 3, '盖浇饭', 1, 1, 1, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (8, 3, '炒饭炒面', 1, 2, 1, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `category` VALUES (9, 3, '简餐套餐', 2, 3, 1, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品名称',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-停售 1-起售',
  `category_id` int NOT NULL COMMENT '分类ID',
  `create_user` int NOT NULL COMMENT '创建人',
  `update_user` int NOT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_dish_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, '麻婆豆腐', NULL, '经典川菜，麻辣鲜香，豆腐嫩滑', 15.00, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (2, '宫保鸡丁', NULL, '花生酥脆，鸡肉嫩滑，微辣回甜', 18.00, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (3, '水煮肉片', NULL, '肉片嫩滑，麻辣过瘾', 22.00, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (4, '鱼香肉丝', NULL, '酸甜微辣，下饭神器', 16.00, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (5, '回锅肉', NULL, '肥而不腻，蒜苗飘香', 20.00, 1, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (6, '口水鸡', NULL, '麻辣鲜香，口感嫩滑', 18.00, 1, 2, 2, 2, '2025-12-23 05:21:52', '2025-12-23 06:07:50');
INSERT INTO `dish` VALUES (7, '夫妻肺片', NULL, '红油飘香，麻辣爽口', 16.00, 1, 2, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (8, '凉拌黄瓜', NULL, '清爽解腻，开胃小菜', 8.00, 1, 2, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (9, '蒜泥白肉', NULL, '蒜香浓郁，肉片薄嫩', 15.00, 1, 2, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (10, '红烧牛肉面', NULL, '牛肉软烂，汤浓味美', 16.00, 1, 4, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (11, '番茄鸡蛋面', NULL, '酸甜可口，营养丰富', 12.00, 1, 4, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (12, '酸菜肉丝面', NULL, '酸爽开胃，肉丝嫩滑', 14.00, 1, 4, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (13, '排骨面', NULL, '排骨酥烂，汤鲜味浓', 18.00, 1, 4, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (14, '三鲜面', NULL, '海鲜丰富，鲜美可口', 15.00, 1, 4, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (15, '葱油拌面', NULL, '葱香四溢，简单美味', 10.00, 1, 5, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (16, '炸酱面', NULL, '酱香浓郁，配菜丰富', 13.00, 1, 5, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (17, '麻辣拌面', NULL, '麻辣过瘾，劲道爽滑', 12.00, 1, 5, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (18, '鸡丝凉面', NULL, '清凉爽口，夏日首选', 11.00, 1, 5, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (19, '红烧排骨饭', NULL, '排骨酥烂，酱香浓郁', 18.00, 1, 7, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (20, '糖醋里脊饭', NULL, '酸甜可口，外酥里嫩', 16.00, 1, 7, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (21, '土豆烧鸡饭', NULL, '土豆软糯，鸡肉入味', 15.00, 1, 7, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (22, '青椒肉丝饭', NULL, '青椒脆嫩，肉丝滑嫩', 14.00, 1, 7, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (23, '咖喱鸡肉饭', NULL, '咖喱浓郁，鸡肉嫩滑', 16.00, 1, 7, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (24, '蛋炒饭', NULL, '粒粒分明，蛋香浓郁', 10.00, 1, 8, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (25, '扬州炒饭', NULL, '配料丰富，色香味全', 14.00, 1, 8, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (26, '虾仁炒饭', NULL, '虾仁Q弹，鲜香可口', 16.00, 1, 8, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (27, '炒河粉', NULL, '河粉爽滑，镬气十足', 12.00, 1, 8, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `dish` VALUES (28, '炒米粉', NULL, '米粉细滑，配菜丰富', 11.00, 1, 8, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_id` int NOT NULL COMMENT '菜品ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '口味名称（如：辣度、甜度）',
  `list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '口味选项JSON（如：[\"不辣\",\"微辣\",\"中辣\",\"特辣\"]）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dish_id`(`dish_id` ASC) USING BTREE,
  CONSTRAINT `fk_flavor_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜品口味表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1, 1, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"特辣\"]');
INSERT INTO `dish_flavor` VALUES (2, 2, '辣度', '[\"微辣\",\"中辣\",\"特辣\"]');
INSERT INTO `dish_flavor` VALUES (3, 3, '辣度', '[\"中辣\",\"特辣\",\"变态辣\"]');
INSERT INTO `dish_flavor` VALUES (4, 4, '甜度', '[\"正常甜\",\"少糖\",\"多糖\"]');
INSERT INTO `dish_flavor` VALUES (5, 5, '辣度', '[\"微辣\",\"中辣\"]');
INSERT INTO `dish_flavor` VALUES (6, 6, '辣度', '[\"微辣\",\"中辣\",\"特辣\"]');
INSERT INTO `dish_flavor` VALUES (7, 7, '辣度', '[\"微辣\",\"中辣\",\"特辣\"]');
INSERT INTO `dish_flavor` VALUES (8, 10, '面条', '[\"细面\",\"宽面\",\"刀削面\"]');
INSERT INTO `dish_flavor` VALUES (9, 10, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]');
INSERT INTO `dish_flavor` VALUES (10, 11, '面条', '[\"细面\",\"宽面\"]');
INSERT INTO `dish_flavor` VALUES (11, 12, '面条', '[\"细面\",\"宽面\",\"刀削面\"]');
INSERT INTO `dish_flavor` VALUES (12, 12, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (13, 13, '面条', '[\"细面\",\"宽面\"]');
INSERT INTO `dish_flavor` VALUES (14, 14, '面条', '[\"细面\",\"宽面\"]');
INSERT INTO `dish_flavor` VALUES (15, 15, '葱量', '[\"正常\",\"多葱\",\"少葱\"]');
INSERT INTO `dish_flavor` VALUES (16, 16, '配菜', '[\"黄瓜丝\",\"豆芽\",\"胡萝卜丝\"]');
INSERT INTO `dish_flavor` VALUES (17, 17, '辣度', '[\"微辣\",\"中辣\",\"特辣\"]');
INSERT INTO `dish_flavor` VALUES (18, 19, '米饭', '[\"正常\",\"多饭\",\"少饭\"]');
INSERT INTO `dish_flavor` VALUES (19, 20, '米饭', '[\"正常\",\"多饭\",\"少饭\"]');
INSERT INTO `dish_flavor` VALUES (20, 21, '米饭', '[\"正常\",\"多饭\",\"少饭\"]');
INSERT INTO `dish_flavor` VALUES (21, 22, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (22, 23, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]');
INSERT INTO `dish_flavor` VALUES (23, 24, '加料', '[\"加蛋\",\"加火腿\",\"加青菜\"]');
INSERT INTO `dish_flavor` VALUES (24, 25, '加料', '[\"加蛋\",\"加虾仁\"]');
INSERT INTO `dish_flavor` VALUES (25, 26, '加料', '[\"加蛋\",\"多虾仁\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '员工' COMMENT '姓名',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别：0-女 1-男',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '头像',
  `role` tinyint NOT NULL DEFAULT 0 COMMENT '角色：0-窗口员工 1-窗口管理员 2-超级管理员',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
  `create_user` int NOT NULL COMMENT '创建人',
  `update_user` int NOT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '超级管理员', 'admin', '123456', '13800000000', 35, 1, 'data:image/jpeg;base64,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', 2, 1, 1, 1, '2025-12-23 05:21:52', '2025-12-23 05:28:23');
INSERT INTO `employee` VALUES (2, '张经理', 'zhangmgr', '123456', '13800000001', 32, 1, NULL, 1, 1, 1, 1, '2025-12-23 05:21:52', '2025-12-23 06:26:44');
INSERT INTO `employee` VALUES (3, '李经理', 'limgr', '123456', '13800000002', 28, 0, NULL, 1, 1, 1, 1, '2025-12-23 05:21:52', '2025-12-23 06:26:34');
INSERT INTO `employee` VALUES (4, '王经理', 'wangmgr', '123456', '13800000003', 30, 1, NULL, 1, 1, 1, 1, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (5, '赵师傅', 'zhaostaff', '123456', '13800000004', 45, 1, NULL, 0, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (6, '钱师傅', 'qianstaff', '123456', '13800000005', 38, 1, NULL, 0, 1, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (7, '孙师傅', 'sunstaff', '123456', '13800000006', 42, 0, NULL, 0, 1, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (8, '周师傅', 'zhoustaff', '123456', '13800000007', 35, 1, NULL, 0, 1, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (9, '吴师傅', 'wustaff', '123456', '13800000008', 40, 1, NULL, 0, 1, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `employee` VALUES (10, '郑师傅', 'zhengstaff', '123456', '13800000009', 33, 0, NULL, 0, 1, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for employee_window
-- ----------------------------
DROP TABLE IF EXISTS `employee_window`;
CREATE TABLE `employee_window`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL COMMENT '员工ID',
  `window_id` int NOT NULL COMMENT '窗口ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp_win`(`employee_id` ASC, `window_id` ASC) USING BTREE,
  INDEX `idx_employee_id`(`employee_id` ASC) USING BTREE,
  INDEX `idx_window_id`(`window_id` ASC) USING BTREE,
  CONSTRAINT `fk_ew_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ew_window` FOREIGN KEY (`window_id`) REFERENCES `window` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工窗口关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee_window
-- ----------------------------
INSERT INTO `employee_window` VALUES (1, 2, 1, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (2, 5, 1, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (3, 6, 1, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (4, 3, 2, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (5, 7, 2, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (6, 8, 2, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (7, 4, 3, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (8, 9, 3, '2025-12-23 05:21:52');
INSERT INTO `employee_window` VALUES (9, 10, 3, '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '主订单ID（冗余字段，方便查询）',
  `order_sub_id` bigint NOT NULL COMMENT '子订单ID',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品ID',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_order_sub_id`(`order_sub_id` ASC) USING BTREE,
  CONSTRAINT `fk_detail_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_sub` FOREIGN KEY (`order_sub_id`) REFERENCES `order_sub` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 546 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 1, 1, NULL, '麻婆豆腐', NULL, '中辣', 1, 15.00);
INSERT INTO `order_detail` VALUES (2, 1, 1, 2, NULL, '宫保鸡丁', NULL, '微辣', 1, 18.00);
INSERT INTO `order_detail` VALUES (3, 2, 2, 10, NULL, '红烧牛肉面', NULL, '宽面,微辣', 1, 16.00);
INSERT INTO `order_detail` VALUES (4, 2, 2, 15, NULL, '葱油拌面', NULL, '多葱', 1, 10.00);
INSERT INTO `order_detail` VALUES (5, 2, 2, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (6, 3, 3, NULL, 1, '川味双人套餐', NULL, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (7, 4, 4, NULL, 2, '面食超值套餐', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (8, 5, 5, 6, NULL, '口水鸡', NULL, '中辣', 1, 18.00);
INSERT INTO `order_detail` VALUES (9, 5, 6, 19, NULL, '红烧排骨饭', NULL, '正常', 1, 18.00);
INSERT INTO `order_detail` VALUES (10, 5, 6, 24, NULL, '蛋炒饭', NULL, '加蛋', 1, 10.00);
INSERT INTO `order_detail` VALUES (11, 6, 7, NULL, 3, '简餐商务套餐', NULL, NULL, 1, 25.00);
INSERT INTO `order_detail` VALUES (12, 7, 8, 3, NULL, '水煮肉片', NULL, '特辣', 1, 22.00);
INSERT INTO `order_detail` VALUES (13, 7, 8, 4, NULL, '鱼香肉丝', NULL, '正常甜', 1, 16.00);
INSERT INTO `order_detail` VALUES (14, 8, 9, 13, NULL, '排骨面', NULL, '宽面', 1, 18.00);
INSERT INTO `order_detail` VALUES (15, 8, 9, 17, NULL, '麻辣拌面', NULL, '中辣', 1, 12.00);
INSERT INTO `order_detail` VALUES (16, 9, 10, 5, NULL, '回锅肉', NULL, '微辣', 1, 20.00);
INSERT INTO `order_detail` VALUES (17, 9, 10, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (18, 9, 11, 10, NULL, '红烧牛肉面', NULL, '细面,中辣', 1, 16.00);
INSERT INTO `order_detail` VALUES (19, 9, 11, 16, NULL, '炸酱面', NULL, '黄瓜丝', 1, 13.00);
INSERT INTO `order_detail` VALUES (20, 10, 12, 20, NULL, '糖醋里脊饭', NULL, '正常', 1, 16.00);
INSERT INTO `order_detail` VALUES (21, 10, 12, 26, NULL, '虾仁炒饭', NULL, '加蛋', 1, 16.00);
INSERT INTO `order_detail` VALUES (22, 11, 13, 11, NULL, '番茄鸡蛋面', NULL, '细面', 1, 12.00);
INSERT INTO `order_detail` VALUES (23, 11, 13, 10, NULL, '红烧牛肉面', NULL, '宽面,微辣', 1, 16.00);
INSERT INTO `order_detail` VALUES (24, 12, 14, 5, NULL, '回锅肉', NULL, '中辣', 1, 20.00);
INSERT INTO `order_detail` VALUES (25, 13, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (26, 14, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (27, 15, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (28, 16, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (29, 17, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (30, 18, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (31, 19, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (32, 20, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (33, 21, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (34, 22, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (35, 23, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (36, 24, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (37, 25, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (38, 26, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (39, 27, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (40, 28, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (41, 29, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (42, 30, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (43, 31, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (44, 32, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (45, 33, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (46, 34, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (47, 35, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (48, 36, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (49, 37, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (50, 38, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (51, 39, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (52, 40, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (53, 41, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (54, 42, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (55, 43, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (56, 44, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (57, 45, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (58, 46, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (59, 47, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (60, 48, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (61, 49, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (62, 50, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (63, 51, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (64, 52, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (65, 53, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (66, 54, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (67, 55, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (68, 56, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (69, 57, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (70, 58, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (71, 59, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (72, 60, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (73, 61, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (74, 62, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (75, 63, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (76, 64, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (77, 65, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (78, 66, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (79, 67, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (80, 68, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (81, 69, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (82, 70, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (83, 71, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (84, 72, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (85, 73, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (86, 74, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (87, 75, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (88, 76, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (89, 77, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (90, 78, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (91, 79, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (92, 80, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (93, 81, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (94, 82, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (95, 83, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (96, 84, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (97, 85, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (98, 86, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (99, 87, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (100, 88, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (101, 89, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (102, 90, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (103, 91, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (104, 92, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (105, 93, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (106, 94, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (107, 95, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (108, 96, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (109, 97, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (110, 98, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (111, 99, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (112, 100, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (113, 101, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (114, 102, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (115, 103, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (116, 104, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (117, 105, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (118, 106, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (119, 107, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (120, 108, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (121, 109, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (122, 110, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (123, 111, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (124, 112, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (125, 113, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (126, 114, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (127, 115, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (128, 116, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (129, 117, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (130, 118, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (131, 119, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (132, 120, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (133, 121, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (134, 122, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (135, 123, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (136, 124, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (137, 125, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (138, 126, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (139, 127, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (140, 128, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (141, 129, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (142, 130, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (143, 131, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (144, 132, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (145, 133, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (146, 134, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (147, 135, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (148, 136, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (149, 137, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (150, 138, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (151, 139, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (152, 140, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (153, 141, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (154, 142, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (155, 143, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (156, 144, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (157, 145, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (158, 146, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (159, 147, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (160, 148, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (161, 149, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (162, 150, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (163, 151, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (164, 152, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (165, 153, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (166, 154, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (167, 155, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (168, 156, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (169, 157, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (170, 158, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (171, 159, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (172, 160, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (173, 161, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (174, 162, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (175, 163, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (176, 164, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (177, 165, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (178, 166, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (179, 167, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (180, 168, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (181, 169, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (182, 170, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (183, 171, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (184, 172, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (185, 173, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (186, 174, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (187, 175, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (188, 176, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (189, 177, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (190, 178, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (191, 179, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (192, 180, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (193, 181, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (194, 182, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (195, 183, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (196, 184, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (197, 185, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (198, 186, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (199, 187, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (200, 188, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (201, 189, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (202, 190, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (203, 191, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (204, 192, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (205, 193, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (206, 194, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (207, 195, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (208, 196, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (209, 197, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (210, 198, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (211, 199, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (212, 200, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (213, 201, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (214, 202, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (215, 203, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (216, 204, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (217, 205, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (218, 206, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (219, 207, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (220, 208, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (221, 209, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (222, 210, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (223, 211, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (224, 212, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (225, 213, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (226, 214, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (227, 215, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (228, 216, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (229, 217, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (230, 218, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (231, 219, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (232, 220, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (233, 221, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (234, 222, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (235, 223, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (236, 224, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (237, 225, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (238, 226, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (239, 227, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (240, 228, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (241, 229, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (242, 230, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (243, 231, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (244, 232, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (245, 233, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (246, 234, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (247, 235, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (248, 236, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (249, 237, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (250, 238, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (251, 239, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (252, 240, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (253, 241, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (254, 242, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (255, 243, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (256, 244, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (257, 245, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (258, 246, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (259, 247, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (260, 248, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (261, 249, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (262, 250, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (263, 251, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (264, 252, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (265, 253, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (266, 254, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (267, 255, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (268, 256, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (269, 257, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (270, 258, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (271, 259, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (272, 260, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (273, 261, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (274, 262, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (275, 263, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (276, 264, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (277, 265, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (278, 266, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (279, 267, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (280, 268, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (281, 269, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (282, 270, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (283, 271, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (284, 272, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (285, 273, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (286, 274, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (287, 275, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (288, 276, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (289, 277, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (290, 278, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (291, 279, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (292, 280, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (293, 281, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (294, 282, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (295, 283, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (296, 284, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (297, 285, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (298, 286, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (299, 287, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (300, 288, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (301, 289, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (302, 290, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (303, 291, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (304, 292, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (305, 293, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (306, 294, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (307, 295, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (308, 296, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (309, 297, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (310, 298, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (311, 299, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (312, 300, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (313, 301, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (314, 302, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (315, 303, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (316, 304, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (317, 305, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (318, 306, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (319, 307, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (320, 308, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (321, 309, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (322, 310, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (323, 311, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (324, 312, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (325, 313, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (326, 314, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (327, 315, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (328, 316, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (329, 317, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (330, 318, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (331, 319, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (332, 320, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (333, 321, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (334, 322, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (335, 323, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (336, 324, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (337, 325, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (338, 326, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (339, 327, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (340, 328, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (341, 329, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (342, 330, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (343, 331, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (344, 332, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (345, 333, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (346, 334, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (347, 335, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (348, 336, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (349, 337, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (350, 338, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (351, 339, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (352, 340, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (353, 341, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (354, 342, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (355, 343, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (356, 344, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (357, 345, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (358, 346, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (359, 347, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (360, 348, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (361, 349, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (362, 350, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (363, 351, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (364, 352, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (365, 353, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (366, 354, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (367, 355, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (368, 356, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (369, 357, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (370, 358, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (371, 359, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (372, 360, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (373, 361, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (374, 362, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (375, 363, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (376, 364, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (377, 365, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (378, 366, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (379, 367, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (380, 368, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (381, 369, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (382, 370, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (383, 371, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (384, 372, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (385, 373, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (386, 374, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (387, 375, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (388, 376, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (389, 377, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (390, 378, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (391, 379, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (392, 380, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (393, 381, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (394, 382, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (395, 383, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (396, 384, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (397, 385, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (398, 386, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (399, 387, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (400, 388, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (401, 389, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (402, 390, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (403, 391, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (404, 392, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (405, 393, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (406, 394, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (407, 395, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (408, 396, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (409, 397, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (410, 398, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (411, 399, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (412, 400, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (413, 401, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (414, 402, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (415, 403, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (416, 404, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (417, 405, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (418, 406, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (419, 407, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (420, 408, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (421, 409, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (422, 410, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (423, 411, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (424, 412, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (425, 413, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (426, 414, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (427, 415, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (428, 416, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (429, 417, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (430, 418, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (431, 419, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (432, 420, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (433, 421, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (434, 422, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (435, 423, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (436, 424, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (437, 425, 1, 12, NULL, '酸菜肉丝面', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (438, 426, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (439, 427, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (440, 428, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (441, 429, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (442, 430, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (443, 431, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (444, 432, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (445, 433, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (446, 434, 1, 2, NULL, '宫保鸡丁', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (447, 435, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (448, 436, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (449, 437, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (450, 438, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (451, 439, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (452, 440, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (453, 441, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (454, 442, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (455, 443, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (456, 444, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (457, 445, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (458, 446, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (459, 447, 1, 4, NULL, '鱼香肉丝', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (460, 448, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (461, 449, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (462, 450, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (463, 451, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (464, 452, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (465, 453, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (466, 454, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (467, 455, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (468, 456, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (469, 457, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (470, 458, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (471, 459, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (472, 460, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (473, 461, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (474, 462, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (475, 463, 1, 8, NULL, '凉拌黄瓜', NULL, NULL, 1, 8.00);
INSERT INTO `order_detail` VALUES (476, 464, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (477, 465, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (478, 466, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (479, 467, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (480, 468, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (481, 469, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (482, 470, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (483, 471, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (484, 472, 1, 25, NULL, '扬州炒饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (485, 473, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (486, 474, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (487, 475, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (488, 476, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (489, 477, 1, 16, NULL, '炸酱面', NULL, NULL, 1, 13.00);
INSERT INTO `order_detail` VALUES (490, 478, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (491, 479, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (492, 480, 1, 27, NULL, '炒河粉', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (493, 481, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (494, 482, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (495, 483, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (496, 484, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (497, 485, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (498, 486, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (499, 487, 1, 11, NULL, '番茄鸡蛋面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (500, 488, 1, 15, NULL, '葱油拌面', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (501, 489, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (502, 490, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (503, 491, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (504, 492, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (505, 493, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (506, 494, 1, 10, NULL, '红烧牛肉面', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (507, 495, 1, 14, NULL, '三鲜面', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (508, 496, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (509, 497, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (510, 498, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (511, 499, 1, 17, NULL, '麻辣拌面', NULL, NULL, 1, 12.00);
INSERT INTO `order_detail` VALUES (512, 500, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (513, 501, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (514, 502, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (515, 503, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (516, 504, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (517, 505, 1, 26, NULL, '虾仁炒饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (518, 506, 1, 1, NULL, '麻婆豆腐', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (519, 507, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (520, 508, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (521, 509, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (522, 510, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (523, 511, 1, 20, NULL, '糖醋里脊饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (524, 512, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (525, 513, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (526, 514, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (527, 515, 1, 3, NULL, '水煮肉片', NULL, NULL, 1, 22.00);
INSERT INTO `order_detail` VALUES (528, 516, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (529, 517, 1, 22, NULL, '青椒肉丝饭', NULL, NULL, 1, 14.00);
INSERT INTO `order_detail` VALUES (530, 518, 1, 18, NULL, '鸡丝凉面', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (531, 519, 1, 24, NULL, '蛋炒饭', NULL, NULL, 1, 10.00);
INSERT INTO `order_detail` VALUES (532, 520, 1, 19, NULL, '红烧排骨饭', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (533, 521, 1, 13, NULL, '排骨面', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (534, 522, 1, 6, NULL, '口水鸡', NULL, NULL, 1, 18.00);
INSERT INTO `order_detail` VALUES (535, 523, 1, 5, NULL, '回锅肉', NULL, NULL, 1, 20.00);
INSERT INTO `order_detail` VALUES (536, 524, 1, 9, NULL, '蒜泥白肉', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (537, 525, 1, 23, NULL, '咖喱鸡肉饭', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (538, 526, 1, 28, NULL, '炒米粉', NULL, NULL, 1, 11.00);
INSERT INTO `order_detail` VALUES (539, 527, 1, 21, NULL, '土豆烧鸡饭', NULL, NULL, 1, 15.00);
INSERT INTO `order_detail` VALUES (540, 528, 1, 7, NULL, '夫妻肺片', NULL, NULL, 1, 16.00);
INSERT INTO `order_detail` VALUES (541, 531, 531, NULL, NULL, '鱼香肉丝', NULL, '少糖', 1, 16.00);
INSERT INTO `order_detail` VALUES (542, 532, 532, NULL, NULL, '鱼香肉丝', NULL, '多糖', 1, 16.00);
INSERT INTO `order_detail` VALUES (543, 533, 533, NULL, NULL, '水煮肉片', NULL, '中辣', 1, 22.00);
INSERT INTO `order_detail` VALUES (544, 534, 534, NULL, NULL, '咖喱鸡肉饭', NULL, '不辣', 1, 16.00);
INSERT INTO `order_detail` VALUES (545, 535, 535, NULL, NULL, '鱼香肉丝', NULL, '多糖', 1, 16.00);

-- ----------------------------
-- Table structure for order_sub
-- ----------------------------
DROP TABLE IF EXISTS `order_sub`;
CREATE TABLE `order_sub`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '主订单ID',
  `window_id` int NOT NULL COMMENT '窗口ID',
  `window_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '窗口名称（冗余）',
  `status` int NOT NULL DEFAULT 2 COMMENT '子订单状态：2-待制作 3-制作中 4-待取餐 5-已完成',
  `amount` decimal(10, 2) NOT NULL COMMENT '该窗口金额',
  `estimated_time` int NULL DEFAULT NULL COMMENT '预计制作时间(分钟)',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始制作时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `pickup_time` datetime NULL DEFAULT NULL COMMENT '取餐时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_window_id`(`window_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_sub_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sub_window` FOREIGN KEY (`window_id`) REFERENCES `window` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 536 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '子订单表（按窗口拆分）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_sub
-- ----------------------------
INSERT INTO `order_sub` VALUES (1, 1, 1, '川香阁', 5, 33.00, 15, '2023-12-20 11:32:00', '2023-12-20 11:47:00', '2023-12-20 11:50:00');
INSERT INTO `order_sub` VALUES (2, 2, 2, '面面俱到', 5, 28.00, 10, '2023-12-20 12:02:00', '2023-12-20 12:12:00', '2023-12-20 12:15:00');
INSERT INTO `order_sub` VALUES (3, 3, 1, '川香阁', 5, 35.00, 15, '2023-12-20 12:17:00', '2023-12-20 12:32:00', '2023-12-20 12:35:00');
INSERT INTO `order_sub` VALUES (4, 4, 2, '面面俱到', 5, 22.00, 10, '2023-12-21 11:47:00', '2023-12-21 11:57:00', '2023-12-21 12:00:00');
INSERT INTO `order_sub` VALUES (5, 5, 1, '川香阁', 5, 18.00, 12, '2023-12-21 12:32:00', '2023-12-21 12:44:00', '2023-12-21 12:47:00');
INSERT INTO `order_sub` VALUES (6, 5, 3, '快乐简餐', 5, 28.00, 10, '2023-12-21 12:32:00', '2023-12-21 12:42:00', '2023-12-21 12:45:00');
INSERT INTO `order_sub` VALUES (7, 6, 3, '快乐简餐', 5, 25.00, 8, '2023-12-22 11:22:00', '2023-12-22 11:30:00', '2023-12-22 11:33:00');
INSERT INTO `order_sub` VALUES (8, 7, 1, '川香阁', 5, 38.00, 15, '2023-12-22 18:02:00', '2023-12-22 18:17:00', '2023-12-22 18:20:00');
INSERT INTO `order_sub` VALUES (9, 8, 2, '面面俱到', 5, 30.00, 12, '2023-12-22 18:32:00', '2023-12-22 18:44:00', '2023-12-22 18:47:00');
INSERT INTO `order_sub` VALUES (10, 9, 1, '川香阁', 3, 22.00, 15, '2025-12-23 05:21:52', NULL, NULL);
INSERT INTO `order_sub` VALUES (11, 9, 2, '面面俱到', 4, 29.00, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (12, 10, 3, '快乐简餐', 2, 32.00, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (13, 11, 2, '面面俱到', 2, 28.00, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (14, 12, 1, '川香阁', 5, 20.00, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (15, 13, 3, '快乐简餐', 5, 21.79, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (16, 14, 2, '面面俱到', 5, 54.03, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (17, 15, 1, '川香阁', 5, 17.20, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (18, 16, 2, '面面俱到', 5, 49.29, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (19, 17, 3, '快乐简餐', 5, 59.01, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (20, 18, 3, '快乐简餐', 2, 57.38, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (21, 19, 3, '快乐简餐', 5, 18.06, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (22, 20, 1, '川香阁', 2, 28.58, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (23, 21, 1, '川香阁', 5, 41.62, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (24, 22, 2, '面面俱到', 5, 77.29, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (25, 23, 2, '面面俱到', 5, 42.23, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (26, 24, 3, '快乐简餐', 5, 59.33, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (27, 25, 2, '面面俱到', 5, 53.23, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (28, 26, 3, '快乐简餐', 5, 27.59, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (29, 27, 3, '快乐简餐', 5, 24.80, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (30, 28, 3, '快乐简餐', 5, 47.56, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (31, 29, 3, '快乐简餐', 5, 78.08, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (32, 30, 3, '快乐简餐', 5, 33.96, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (33, 31, 2, '面面俱到', 5, 73.25, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (34, 32, 2, '面面俱到', 5, 45.86, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (35, 33, 2, '面面俱到', 5, 17.73, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (36, 34, 3, '快乐简餐', 5, 53.33, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (37, 35, 1, '川香阁', 5, 17.08, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (38, 36, 2, '面面俱到', 5, 29.62, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (39, 37, 3, '快乐简餐', 5, 67.96, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (40, 38, 2, '面面俱到', 5, 15.80, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (41, 39, 1, '川香阁', 5, 70.31, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (42, 40, 2, '面面俱到', 5, 68.29, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (43, 41, 3, '快乐简餐', 5, 31.53, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (44, 42, 1, '川香阁', 5, 51.57, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (45, 43, 3, '快乐简餐', 5, 29.82, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (46, 44, 1, '川香阁', 5, 50.44, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (47, 45, 3, '快乐简餐', 5, 34.92, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (48, 46, 3, '快乐简餐', 5, 54.18, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (49, 47, 2, '面面俱到', 5, 55.10, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (50, 48, 2, '面面俱到', 2, 58.58, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (51, 49, 3, '快乐简餐', 5, 30.79, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (52, 50, 3, '快乐简餐', 5, 40.66, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (53, 51, 3, '快乐简餐', 5, 77.07, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (54, 52, 2, '面面俱到', 2, 79.01, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (55, 53, 1, '川香阁', 5, 41.80, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (56, 54, 2, '面面俱到', 5, 54.19, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (57, 55, 3, '快乐简餐', 5, 41.35, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (58, 56, 1, '川香阁', 5, 62.68, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (59, 57, 1, '川香阁', 5, 58.73, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (60, 58, 3, '快乐简餐', 5, 57.66, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (61, 59, 1, '川香阁', 5, 21.84, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (62, 60, 3, '快乐简餐', 5, 47.62, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (63, 61, 1, '川香阁', 5, 65.01, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (64, 62, 1, '川香阁', 2, 61.09, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (65, 63, 2, '面面俱到', 5, 45.94, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (66, 64, 1, '川香阁', 5, 51.36, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (67, 65, 1, '川香阁', 5, 19.39, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (68, 66, 3, '快乐简餐', 2, 35.92, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (69, 67, 2, '面面俱到', 5, 76.90, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (70, 68, 3, '快乐简餐', 5, 31.71, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (71, 69, 1, '川香阁', 5, 27.51, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (72, 70, 3, '快乐简餐', 5, 56.98, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (73, 71, 2, '面面俱到', 5, 59.09, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (74, 72, 2, '面面俱到', 5, 35.09, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (75, 73, 2, '面面俱到', 5, 79.67, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (76, 74, 2, '面面俱到', 5, 63.15, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (77, 75, 3, '快乐简餐', 5, 74.37, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (78, 76, 3, '快乐简餐', 5, 61.18, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (79, 77, 1, '川香阁', 5, 61.80, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (80, 78, 3, '快乐简餐', 5, 76.79, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (81, 79, 3, '快乐简餐', 5, 75.05, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (82, 80, 2, '面面俱到', 2, 63.59, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (83, 81, 2, '面面俱到', 5, 42.84, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (84, 82, 3, '快乐简餐', 5, 28.55, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (85, 83, 2, '面面俱到', 5, 71.21, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (86, 84, 1, '川香阁', 5, 45.19, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (87, 85, 1, '川香阁', 5, 50.03, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (88, 86, 2, '面面俱到', 5, 73.08, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (89, 87, 3, '快乐简餐', 5, 78.42, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (90, 88, 3, '快乐简餐', 2, 23.46, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (91, 89, 2, '面面俱到', 2, 73.22, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (92, 90, 3, '快乐简餐', 5, 69.46, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (93, 91, 3, '快乐简餐', 5, 57.17, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (94, 92, 3, '快乐简餐', 5, 38.98, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (95, 93, 1, '川香阁', 5, 38.39, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (96, 94, 2, '面面俱到', 5, 61.14, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (97, 95, 1, '川香阁', 5, 52.53, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (98, 96, 2, '面面俱到', 5, 35.01, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (99, 97, 2, '面面俱到', 5, 73.53, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (100, 98, 1, '川香阁', 5, 18.41, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (101, 99, 3, '快乐简餐', 5, 33.86, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (102, 100, 2, '面面俱到', 5, 47.50, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (103, 101, 1, '川香阁', 5, 35.76, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (104, 102, 3, '快乐简餐', 5, 59.03, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (105, 103, 1, '川香阁', 5, 21.54, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (106, 104, 2, '面面俱到', 5, 58.95, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (107, 105, 1, '川香阁', 5, 43.39, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (108, 106, 2, '面面俱到', 5, 23.69, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (109, 107, 3, '快乐简餐', 5, 21.09, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (110, 108, 3, '快乐简餐', 5, 72.24, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (111, 109, 2, '面面俱到', 5, 71.67, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (112, 110, 3, '快乐简餐', 5, 55.61, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (113, 111, 3, '快乐简餐', 5, 62.36, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (114, 112, 3, '快乐简餐', 5, 64.50, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (115, 113, 1, '川香阁', 5, 74.09, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (116, 114, 2, '面面俱到', 5, 52.63, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (117, 115, 1, '川香阁', 5, 64.83, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (118, 116, 1, '川香阁', 5, 78.42, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (119, 117, 3, '快乐简餐', 5, 29.49, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (120, 118, 3, '快乐简餐', 5, 18.93, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (121, 119, 1, '川香阁', 5, 57.81, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (122, 120, 1, '川香阁', 5, 47.19, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (123, 121, 2, '面面俱到', 5, 49.07, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (124, 122, 2, '面面俱到', 5, 22.82, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (125, 123, 3, '快乐简餐', 2, 57.25, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (126, 124, 3, '快乐简餐', 2, 36.20, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (127, 125, 2, '面面俱到', 5, 66.67, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (128, 126, 3, '快乐简餐', 5, 35.53, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (129, 127, 1, '川香阁', 5, 45.93, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (130, 128, 3, '快乐简餐', 5, 64.30, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (131, 129, 3, '快乐简餐', 5, 53.85, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (132, 130, 2, '面面俱到', 5, 42.54, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (133, 131, 2, '面面俱到', 5, 26.07, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (134, 132, 1, '川香阁', 5, 78.59, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (135, 133, 2, '面面俱到', 5, 69.73, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (136, 134, 2, '面面俱到', 5, 23.62, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (137, 135, 3, '快乐简餐', 5, 16.94, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (138, 136, 2, '面面俱到', 2, 19.94, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (139, 137, 2, '面面俱到', 5, 37.92, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (140, 138, 2, '面面俱到', 5, 79.80, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (141, 139, 1, '川香阁', 5, 27.47, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (142, 140, 2, '面面俱到', 5, 55.04, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (143, 141, 1, '川香阁', 5, 77.87, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (144, 142, 3, '快乐简餐', 2, 72.30, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (145, 143, 2, '面面俱到', 5, 16.07, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (146, 144, 3, '快乐简餐', 5, 33.66, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (147, 145, 3, '快乐简餐', 5, 66.71, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (148, 146, 3, '快乐简餐', 5, 32.68, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (149, 147, 3, '快乐简餐', 5, 50.44, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (150, 148, 3, '快乐简餐', 5, 68.29, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (151, 149, 2, '面面俱到', 5, 30.13, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (152, 150, 3, '快乐简餐', 5, 45.16, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (153, 151, 3, '快乐简餐', 5, 18.37, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (154, 152, 2, '面面俱到', 5, 17.80, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (155, 153, 2, '面面俱到', 5, 53.10, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (156, 154, 2, '面面俱到', 5, 78.04, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (157, 155, 3, '快乐简餐', 5, 18.97, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (158, 156, 2, '面面俱到', 5, 42.16, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (159, 157, 2, '面面俱到', 5, 35.35, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (160, 158, 3, '快乐简餐', 5, 48.41, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (161, 159, 3, '快乐简餐', 5, 22.32, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (162, 160, 2, '面面俱到', 2, 59.32, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (163, 161, 3, '快乐简餐', 5, 63.63, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (164, 162, 2, '面面俱到', 5, 19.42, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (165, 163, 3, '快乐简餐', 5, 53.55, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (166, 164, 3, '快乐简餐', 5, 76.77, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (167, 165, 1, '川香阁', 2, 72.06, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (168, 166, 1, '川香阁', 5, 65.63, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (169, 167, 3, '快乐简餐', 5, 28.19, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (170, 168, 1, '川香阁', 5, 18.74, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (171, 169, 1, '川香阁', 5, 73.18, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (172, 170, 2, '面面俱到', 5, 59.71, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (173, 171, 1, '川香阁', 5, 60.50, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (174, 172, 1, '川香阁', 5, 25.02, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (175, 173, 1, '川香阁', 5, 40.82, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (176, 174, 2, '面面俱到', 5, 61.85, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (177, 175, 1, '川香阁', 2, 22.75, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (178, 176, 2, '面面俱到', 5, 54.49, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (179, 177, 1, '川香阁', 5, 38.88, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (180, 178, 2, '面面俱到', 5, 19.82, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (181, 179, 3, '快乐简餐', 5, 16.63, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (182, 180, 2, '面面俱到', 5, 28.39, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (183, 181, 2, '面面俱到', 5, 74.61, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (184, 182, 3, '快乐简餐', 5, 70.59, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (185, 183, 3, '快乐简餐', 5, 29.02, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (186, 184, 3, '快乐简餐', 5, 62.66, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (187, 185, 2, '面面俱到', 5, 35.31, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (188, 186, 2, '面面俱到', 5, 26.22, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (189, 187, 2, '面面俱到', 5, 40.00, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (190, 188, 1, '川香阁', 5, 33.71, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (191, 189, 1, '川香阁', 5, 34.41, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (192, 190, 2, '面面俱到', 5, 77.65, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (193, 191, 2, '面面俱到', 5, 72.53, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (194, 192, 2, '面面俱到', 5, 74.33, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (195, 193, 3, '快乐简餐', 5, 41.50, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (196, 194, 2, '面面俱到', 5, 48.65, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (197, 195, 2, '面面俱到', 5, 36.08, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (198, 196, 2, '面面俱到', 2, 37.24, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (199, 197, 2, '面面俱到', 5, 17.31, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (200, 198, 2, '面面俱到', 5, 46.94, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (201, 199, 1, '川香阁', 5, 28.20, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (202, 200, 1, '川香阁', 5, 32.84, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (203, 201, 2, '面面俱到', 5, 30.93, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (204, 202, 2, '面面俱到', 5, 20.04, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (205, 203, 3, '快乐简餐', 5, 26.49, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (206, 204, 3, '快乐简餐', 5, 53.43, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (207, 205, 3, '快乐简餐', 5, 20.14, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (208, 206, 2, '面面俱到', 5, 79.97, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (209, 207, 1, '川香阁', 5, 16.75, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (210, 208, 2, '面面俱到', 5, 58.14, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (211, 209, 1, '川香阁', 5, 73.22, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (212, 210, 3, '快乐简餐', 5, 56.88, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (213, 211, 3, '快乐简餐', 5, 40.35, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (214, 212, 1, '川香阁', 5, 44.70, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (215, 213, 1, '川香阁', 5, 21.04, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (216, 214, 2, '面面俱到', 5, 73.04, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (217, 215, 3, '快乐简餐', 2, 23.86, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (218, 216, 1, '川香阁', 5, 49.70, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (219, 217, 2, '面面俱到', 5, 60.61, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (220, 218, 1, '川香阁', 5, 26.46, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (221, 219, 2, '面面俱到', 5, 41.22, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (222, 220, 3, '快乐简餐', 2, 72.56, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (223, 221, 2, '面面俱到', 5, 56.54, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (224, 222, 3, '快乐简餐', 5, 63.41, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (225, 223, 2, '面面俱到', 5, 62.75, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (226, 224, 1, '川香阁', 5, 16.27, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (227, 225, 3, '快乐简餐', 5, 55.24, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (228, 226, 3, '快乐简餐', 2, 65.29, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (229, 227, 2, '面面俱到', 5, 57.65, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (230, 228, 3, '快乐简餐', 5, 15.28, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (231, 229, 3, '快乐简餐', 5, 25.23, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (232, 230, 3, '快乐简餐', 5, 18.62, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (233, 231, 1, '川香阁', 5, 30.76, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (234, 232, 3, '快乐简餐', 5, 19.25, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (235, 233, 2, '面面俱到', 2, 22.74, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (236, 234, 3, '快乐简餐', 5, 51.59, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (237, 235, 2, '面面俱到', 5, 45.10, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (238, 236, 3, '快乐简餐', 5, 68.31, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (239, 237, 2, '面面俱到', 5, 52.60, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (240, 238, 1, '川香阁', 5, 50.90, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (241, 239, 3, '快乐简餐', 5, 39.71, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (242, 240, 3, '快乐简餐', 5, 18.72, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (243, 241, 1, '川香阁', 5, 40.79, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (244, 242, 3, '快乐简餐', 5, 44.62, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (245, 243, 3, '快乐简餐', 5, 71.07, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (246, 244, 3, '快乐简餐', 5, 69.96, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (247, 245, 3, '快乐简餐', 5, 74.74, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (248, 246, 3, '快乐简餐', 5, 77.28, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (249, 247, 3, '快乐简餐', 5, 72.10, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (250, 248, 3, '快乐简餐', 5, 22.78, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (251, 249, 3, '快乐简餐', 5, 73.39, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (252, 250, 3, '快乐简餐', 5, 30.99, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (253, 251, 2, '面面俱到', 5, 45.83, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (254, 252, 1, '川香阁', 5, 54.22, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (255, 253, 3, '快乐简餐', 5, 31.58, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (256, 254, 3, '快乐简餐', 5, 55.21, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (257, 255, 3, '快乐简餐', 2, 68.33, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (258, 256, 1, '川香阁', 5, 25.85, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (259, 257, 3, '快乐简餐', 5, 59.24, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (260, 258, 2, '面面俱到', 2, 50.50, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (261, 259, 3, '快乐简餐', 5, 61.77, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (262, 260, 1, '川香阁', 5, 54.89, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (263, 261, 1, '川香阁', 5, 44.78, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (264, 262, 2, '面面俱到', 5, 53.36, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (265, 263, 1, '川香阁', 5, 31.60, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (266, 264, 3, '快乐简餐', 5, 68.24, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (267, 265, 2, '面面俱到', 5, 42.62, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (268, 266, 1, '川香阁', 5, 16.98, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (269, 267, 2, '面面俱到', 5, 37.50, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (270, 268, 1, '川香阁', 5, 79.11, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (271, 269, 2, '面面俱到', 5, 30.12, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (272, 270, 2, '面面俱到', 5, 68.86, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (273, 271, 2, '面面俱到', 5, 23.01, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (274, 272, 3, '快乐简餐', 5, 73.67, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (275, 273, 2, '面面俱到', 5, 64.17, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (276, 274, 3, '快乐简餐', 5, 63.94, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (277, 275, 3, '快乐简餐', 5, 27.69, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (278, 276, 2, '面面俱到', 5, 61.07, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (279, 277, 2, '面面俱到', 5, 36.72, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (280, 278, 2, '面面俱到', 5, 66.68, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (281, 279, 2, '面面俱到', 5, 50.93, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (282, 280, 3, '快乐简餐', 5, 76.17, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (283, 281, 1, '川香阁', 5, 49.64, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (284, 282, 3, '快乐简餐', 5, 48.85, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (285, 283, 1, '川香阁', 5, 53.33, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (286, 284, 2, '面面俱到', 5, 76.27, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (287, 285, 3, '快乐简餐', 5, 79.17, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (288, 286, 1, '川香阁', 5, 43.10, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (289, 287, 3, '快乐简餐', 5, 70.39, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (290, 288, 3, '快乐简餐', 5, 50.92, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (291, 289, 3, '快乐简餐', 5, 54.60, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (292, 290, 2, '面面俱到', 5, 60.09, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (293, 291, 2, '面面俱到', 5, 46.15, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (294, 292, 2, '面面俱到', 5, 26.45, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (295, 293, 2, '面面俱到', 2, 50.54, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (296, 294, 3, '快乐简餐', 2, 71.93, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (297, 295, 1, '川香阁', 5, 65.46, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (298, 296, 3, '快乐简餐', 5, 72.60, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (299, 297, 2, '面面俱到', 5, 26.78, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (300, 298, 3, '快乐简餐', 5, 33.66, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (301, 299, 2, '面面俱到', 5, 38.41, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (302, 300, 3, '快乐简餐', 5, 35.56, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (303, 301, 3, '快乐简餐', 5, 37.67, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (304, 302, 3, '快乐简餐', 5, 40.46, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (305, 303, 2, '面面俱到', 2, 38.15, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (306, 304, 3, '快乐简餐', 5, 17.00, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (307, 305, 3, '快乐简餐', 5, 38.87, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (308, 306, 2, '面面俱到', 2, 72.13, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (309, 307, 2, '面面俱到', 5, 74.23, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (310, 308, 3, '快乐简餐', 5, 19.49, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (311, 309, 3, '快乐简餐', 5, 66.63, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (312, 310, 2, '面面俱到', 5, 37.93, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (313, 311, 1, '川香阁', 5, 29.94, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (314, 312, 3, '快乐简餐', 5, 30.74, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (315, 313, 2, '面面俱到', 5, 28.17, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (316, 314, 3, '快乐简餐', 5, 49.62, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (317, 315, 1, '川香阁', 5, 15.23, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (318, 316, 1, '川香阁', 5, 53.25, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (319, 317, 2, '面面俱到', 5, 27.61, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (320, 318, 1, '川香阁', 5, 67.91, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (321, 319, 1, '川香阁', 5, 39.50, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (322, 320, 3, '快乐简餐', 5, 34.81, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (323, 321, 2, '面面俱到', 5, 29.30, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (324, 322, 3, '快乐简餐', 5, 44.37, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (325, 323, 3, '快乐简餐', 5, 35.03, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (326, 324, 1, '川香阁', 5, 65.19, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (327, 325, 1, '川香阁', 5, 78.25, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (328, 326, 1, '川香阁', 5, 44.48, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (329, 327, 2, '面面俱到', 2, 52.15, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (330, 328, 3, '快乐简餐', 5, 52.14, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (331, 329, 2, '面面俱到', 2, 75.50, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (332, 330, 2, '面面俱到', 5, 62.29, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (333, 331, 1, '川香阁', 5, 30.81, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (334, 332, 2, '面面俱到', 5, 61.21, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (335, 333, 1, '川香阁', 5, 15.73, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (336, 334, 1, '川香阁', 5, 30.81, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (337, 335, 2, '面面俱到', 5, 48.33, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (338, 336, 2, '面面俱到', 5, 69.56, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (339, 337, 1, '川香阁', 5, 47.11, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (340, 338, 1, '川香阁', 5, 31.47, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (341, 339, 2, '面面俱到', 5, 36.19, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (342, 340, 3, '快乐简餐', 5, 49.67, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (343, 341, 2, '面面俱到', 5, 34.94, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (344, 342, 3, '快乐简餐', 5, 20.40, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (345, 343, 1, '川香阁', 5, 58.62, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (346, 344, 3, '快乐简餐', 5, 68.73, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (347, 345, 2, '面面俱到', 5, 39.71, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (348, 346, 1, '川香阁', 5, 66.31, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (349, 347, 3, '快乐简餐', 5, 34.30, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (350, 348, 2, '面面俱到', 5, 20.95, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (351, 349, 3, '快乐简餐', 5, 49.93, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (352, 350, 1, '川香阁', 5, 33.74, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (353, 351, 3, '快乐简餐', 5, 34.31, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (354, 352, 1, '川香阁', 5, 76.90, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (355, 353, 2, '面面俱到', 5, 48.50, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (356, 354, 3, '快乐简餐', 5, 52.61, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (357, 355, 2, '面面俱到', 5, 31.40, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (358, 356, 1, '川香阁', 5, 59.16, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (359, 357, 1, '川香阁', 5, 30.56, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (360, 358, 2, '面面俱到', 5, 54.91, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (361, 359, 3, '快乐简餐', 5, 16.14, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (362, 360, 1, '川香阁', 5, 79.39, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (363, 361, 2, '面面俱到', 5, 24.83, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (364, 362, 2, '面面俱到', 5, 40.96, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (365, 363, 2, '面面俱到', 5, 56.11, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (366, 364, 2, '面面俱到', 5, 22.67, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (367, 365, 2, '面面俱到', 5, 25.09, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (368, 366, 3, '快乐简餐', 5, 71.32, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (369, 367, 1, '川香阁', 5, 20.61, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (370, 368, 2, '面面俱到', 5, 43.95, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (371, 369, 1, '川香阁', 5, 47.14, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (372, 370, 3, '快乐简餐', 5, 73.16, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (373, 371, 1, '川香阁', 5, 37.01, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (374, 372, 2, '面面俱到', 5, 24.91, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (375, 373, 2, '面面俱到', 5, 47.44, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (376, 374, 1, '川香阁', 5, 45.19, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (377, 375, 2, '面面俱到', 5, 44.52, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (378, 376, 2, '面面俱到', 5, 15.39, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (379, 377, 2, '面面俱到', 2, 75.25, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (380, 378, 2, '面面俱到', 2, 65.48, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (381, 379, 2, '面面俱到', 5, 55.73, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (382, 380, 1, '川香阁', 5, 50.26, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (383, 381, 1, '川香阁', 2, 19.48, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (384, 382, 2, '面面俱到', 5, 65.10, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (385, 383, 3, '快乐简餐', 5, 39.45, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (386, 384, 1, '川香阁', 5, 60.61, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (387, 385, 3, '快乐简餐', 5, 59.51, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (388, 386, 1, '川香阁', 5, 62.47, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (389, 387, 3, '快乐简餐', 5, 45.55, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (390, 388, 2, '面面俱到', 5, 48.32, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (391, 389, 3, '快乐简餐', 5, 29.88, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (392, 390, 3, '快乐简餐', 2, 76.78, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (393, 391, 2, '面面俱到', 5, 77.83, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (394, 392, 3, '快乐简餐', 2, 77.39, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (395, 393, 1, '川香阁', 2, 66.16, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (396, 394, 2, '面面俱到', 5, 57.44, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (397, 395, 3, '快乐简餐', 5, 44.68, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (398, 396, 1, '川香阁', 5, 43.11, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (399, 397, 1, '川香阁', 5, 48.82, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (400, 398, 1, '川香阁', 5, 32.17, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (401, 399, 3, '快乐简餐', 5, 47.96, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (402, 400, 3, '快乐简餐', 5, 69.41, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (403, 401, 2, '面面俱到', 5, 65.65, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (404, 402, 3, '快乐简餐', 2, 68.84, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (405, 403, 3, '快乐简餐', 5, 66.44, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (406, 404, 1, '川香阁', 5, 78.03, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (407, 405, 1, '川香阁', 2, 16.64, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (408, 406, 1, '川香阁', 2, 37.80, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (409, 407, 3, '快乐简餐', 5, 48.29, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (410, 408, 2, '面面俱到', 2, 75.31, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (411, 409, 1, '川香阁', 5, 32.93, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (412, 410, 2, '面面俱到', 5, 40.56, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (413, 411, 3, '快乐简餐', 5, 72.49, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (414, 412, 2, '面面俱到', 5, 47.93, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (415, 413, 2, '面面俱到', 5, 79.94, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (416, 414, 2, '面面俱到', 5, 39.24, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (417, 415, 1, '川香阁', 5, 55.26, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (418, 416, 3, '快乐简餐', 5, 57.91, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (419, 417, 1, '川香阁', 5, 30.58, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (420, 418, 3, '快乐简餐', 5, 31.10, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (421, 419, 1, '川香阁', 5, 44.62, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (422, 420, 1, '川香阁', 5, 39.83, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (423, 421, 3, '快乐简餐', 5, 31.64, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (424, 422, 3, '快乐简餐', 5, 43.93, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (425, 423, 1, '川香阁', 5, 74.43, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (426, 424, 1, '川香阁', 5, 57.43, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (427, 425, 1, '川香阁', 5, 59.49, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (428, 426, 2, '面面俱到', 5, 72.00, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (429, 427, 3, '快乐简餐', 5, 17.45, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (430, 428, 1, '川香阁', 5, 40.98, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (431, 429, 3, '快乐简餐', 5, 30.61, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (432, 430, 1, '川香阁', 5, 44.67, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (433, 431, 2, '面面俱到', 5, 69.99, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (434, 432, 2, '面面俱到', 5, 58.85, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (435, 433, 2, '面面俱到', 5, 65.77, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (436, 434, 3, '快乐简餐', 2, 28.10, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (437, 435, 1, '川香阁', 5, 77.48, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (438, 436, 2, '面面俱到', 5, 21.81, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (439, 437, 3, '快乐简餐', 5, 56.73, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (440, 438, 2, '面面俱到', 5, 23.74, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (441, 439, 3, '快乐简餐', 5, 60.86, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (442, 440, 3, '快乐简餐', 5, 75.14, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (443, 441, 2, '面面俱到', 5, 49.03, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (444, 442, 2, '面面俱到', 5, 37.33, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (445, 443, 1, '川香阁', 5, 22.64, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (446, 444, 2, '面面俱到', 5, 64.44, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (447, 445, 1, '川香阁', 2, 55.29, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (448, 446, 1, '川香阁', 5, 45.18, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (449, 447, 3, '快乐简餐', 5, 39.00, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (450, 448, 2, '面面俱到', 5, 62.22, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (451, 449, 2, '面面俱到', 5, 18.92, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (452, 450, 3, '快乐简餐', 5, 64.52, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (453, 451, 1, '川香阁', 5, 50.24, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (454, 452, 3, '快乐简餐', 5, 70.22, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (455, 453, 1, '川香阁', 5, 39.92, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (456, 454, 2, '面面俱到', 5, 51.30, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (457, 455, 3, '快乐简餐', 5, 56.55, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (458, 456, 2, '面面俱到', 5, 23.61, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (459, 457, 2, '面面俱到', 2, 74.35, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (460, 458, 3, '快乐简餐', 5, 28.79, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (461, 459, 1, '川香阁', 5, 51.61, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (462, 460, 2, '面面俱到', 5, 42.45, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (463, 461, 1, '川香阁', 5, 65.37, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (464, 462, 3, '快乐简餐', 5, 74.76, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (465, 463, 1, '川香阁', 5, 76.78, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (466, 464, 2, '面面俱到', 5, 79.20, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (467, 465, 3, '快乐简餐', 5, 18.16, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (468, 466, 2, '面面俱到', 5, 21.62, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (469, 467, 3, '快乐简餐', 2, 72.03, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (470, 468, 2, '面面俱到', 5, 60.07, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (471, 469, 2, '面面俱到', 5, 49.01, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (472, 470, 2, '面面俱到', 5, 47.87, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (473, 471, 1, '川香阁', 5, 56.36, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (474, 472, 2, '面面俱到', 5, 63.61, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (475, 473, 1, '川香阁', 5, 26.61, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (476, 474, 1, '川香阁', 2, 21.26, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (477, 475, 1, '川香阁', 5, 31.17, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (478, 476, 3, '快乐简餐', 5, 49.92, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (479, 477, 2, '面面俱到', 5, 44.97, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (480, 478, 3, '快乐简餐', 5, 40.15, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (481, 479, 1, '川香阁', 5, 46.61, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (482, 480, 3, '快乐简餐', 5, 61.36, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (483, 481, 2, '面面俱到', 5, 25.23, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (484, 482, 3, '快乐简餐', 5, 35.59, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (485, 483, 2, '面面俱到', 5, 18.65, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (486, 484, 2, '面面俱到', 2, 66.97, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (487, 485, 2, '面面俱到', 5, 72.75, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (488, 486, 3, '快乐简餐', 5, 21.67, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (489, 487, 2, '面面俱到', 5, 75.30, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (490, 488, 2, '面面俱到', 2, 17.23, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (491, 489, 2, '面面俱到', 5, 18.85, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (492, 490, 3, '快乐简餐', 5, 21.49, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (493, 491, 3, '快乐简餐', 5, 24.98, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (494, 492, 2, '面面俱到', 5, 49.09, 12, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (495, 493, 1, '川香阁', 5, 26.98, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (496, 494, 3, '快乐简餐', 2, 57.57, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (497, 495, 2, '面面俱到', 5, 17.76, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (498, 496, 2, '面面俱到', 5, 38.75, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (499, 497, 2, '面面俱到', 5, 68.23, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (500, 498, 2, '面面俱到', 5, 46.80, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (501, 499, 3, '快乐简餐', 5, 32.57, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (502, 500, 1, '川香阁', 5, 49.24, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (503, 501, 3, '快乐简餐', 5, 31.14, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (504, 502, 3, '快乐简餐', 5, 73.22, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (505, 503, 1, '川香阁', 5, 75.27, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (506, 504, 3, '快乐简餐', 5, 43.25, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (507, 505, 1, '川香阁', 5, 56.29, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (508, 506, 3, '快乐简餐', 5, 20.56, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (509, 507, 3, '快乐简餐', 2, 61.39, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (510, 508, 2, '面面俱到', 5, 17.02, 11, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (511, 509, 1, '川香阁', 5, 21.49, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (512, 510, 1, '川香阁', 5, 74.34, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (513, 511, 1, '川香阁', 5, 59.98, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (514, 512, 1, '川香阁', 2, 75.52, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (515, 513, 1, '川香阁', 5, 66.48, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (516, 514, 1, '川香阁', 5, 79.71, 14, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (517, 515, 1, '川香阁', 5, 31.91, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (518, 516, 2, '面面俱到', 5, 66.84, 18, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (519, 517, 2, '面面俱到', 5, 39.11, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (520, 518, 3, '快乐简餐', 5, 45.40, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (521, 519, 3, '快乐简餐', 5, 39.75, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (522, 520, 3, '快乐简餐', 5, 52.65, 8, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (523, 521, 2, '面面俱到', 5, 42.90, 16, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (524, 522, 3, '快乐简餐', 2, 30.20, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (525, 523, 2, '面面俱到', 5, 56.60, 13, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (526, 524, 2, '面面俱到', 2, 23.18, 9, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (527, 525, 2, '面面俱到', 5, 79.57, 19, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (528, 526, 1, '川香阁', 5, 33.51, 10, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (529, 527, 1, '川香阁', 5, 69.13, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (530, 528, 1, '川香阁', 5, 35.21, 17, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (531, 531, 1, '川香阁', 2, 16.00, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (532, 532, 1, '川香阁', 2, 16.00, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (533, 533, 1, '川香阁', 2, 22.00, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (534, 534, 3, '快乐简餐', 2, 16.00, 15, NULL, NULL, NULL);
INSERT INTO `order_sub` VALUES (535, 535, 1, '川香阁', 2, 16.00, 15, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `pickup_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统一取餐码',
  `delivery_type` tinyint NOT NULL DEFAULT 1 COMMENT '配送方式：1-配送 2-自取',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态：1-待付款 2-已付款 3-部分完成 4-已完成 5-已取消 6-退款中 7-已退款',
  `user_id` bigint NOT NULL COMMENT '下单用户ID',
  `address_book_id` bigint NULL DEFAULT NULL COMMENT '地址ID',
  `consignee` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收餐人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `dormitory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '宿舍楼号',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式：1-微信 2-支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态：0-未支付 1-已支付 2-已退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '总金额',
  `delivery_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '配送费',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '取消原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_number`(`number` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_order_time`(`order_time` ASC) USING BTREE,
  INDEX `idx_delivery_type`(`delivery_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 536 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '202312200001', 'A001', 1, 4, 1, 1, '张三', '15800000001', '1栋305', '2023-12-20 11:30:00', '2023-12-20 11:30:15', 1, 1, 33.00, 6.00, '不要香菜', NULL, NULL, '2023-12-20 11:55:00');
INSERT INTO `orders` VALUES (2, '202312200002', 'A002', 1, 4, 2, 3, '李四', '15800000002', '2栋418', '2023-12-20 12:00:00', '2023-12-20 12:00:20', 1, 1, 28.00, 6.00, NULL, NULL, NULL, '2023-12-20 12:25:00');
INSERT INTO `orders` VALUES (3, '202312200003', 'A003', 1, 4, 3, 4, '王五', '15800000003', '3栋201', '2023-12-20 12:15:00', '2023-12-20 12:15:10', 2, 1, 35.00, 6.00, '多放辣', NULL, NULL, '2023-12-20 12:40:00');
INSERT INTO `orders` VALUES (4, '202312210001', 'B001', 1, 4, 4, 5, '赵六', '15800000004', '4栋512', '2023-12-21 11:45:00', '2023-12-21 11:45:30', 1, 1, 22.00, 6.00, NULL, NULL, NULL, '2023-12-21 12:10:00');
INSERT INTO `orders` VALUES (5, '202312210002', 'B002', 1, 4, 5, 6, '钱七', '15800000005', '5栋108', '2023-12-21 12:30:00', '2023-12-21 12:30:25', 1, 1, 46.00, 6.00, NULL, NULL, NULL, '2023-12-21 12:55:00');
INSERT INTO `orders` VALUES (6, '202312220001', 'C001', 1, 4, 6, 7, '孙八', '15800000006', '6栋320', '2023-12-22 11:20:00', '2023-12-22 11:20:18', 2, 1, 25.00, 6.00, '少油', NULL, NULL, '2023-12-22 11:45:00');
INSERT INTO `orders` VALUES (7, '202312220002', 'C002', 1, 4, 1, 1, '张三', '15800000001', '1栋305', '2023-12-22 18:00:00', '2023-12-22 18:00:22', 1, 1, 38.00, 6.00, NULL, NULL, NULL, '2023-12-22 18:25:00');
INSERT INTO `orders` VALUES (8, '202312220003', 'C003', 1, 4, 7, 8, '周九', '15800000007', '7栋215', '2023-12-22 18:30:00', '2023-12-22 18:30:15', 1, 1, 30.00, 6.00, NULL, NULL, NULL, '2023-12-22 18:55:00');
INSERT INTO `orders` VALUES (9, '202312230001', 'D001', 1, 2, 8, 9, '吴十', '15800000008', '8栋401', '2023-12-23 11:00:00', '2023-12-23 11:00:10', 1, 1, 51.00, 6.00, '尽快送达', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (10, '202312230002', 'D002', 1, 4, 9, 10, '陈老师', '15800000009', '教师公寓A栋302', '2023-12-23 11:15:00', '2023-12-23 11:15:08', 1, 1, 32.00, 6.00, NULL, NULL, NULL, '2025-12-23 05:23:00');
INSERT INTO `orders` VALUES (11, '202312230003', 'D003', 1, 5, 10, 11, '林老师', '15800000010', '教师公寓B栋105', '2023-12-23 11:30:00', NULL, 1, 0, 28.00, 6.00, NULL, '支付超时，自动取消', '2025-12-23 05:22:00', NULL);
INSERT INTO `orders` VALUES (12, '202312190001', 'X001', 1, 5, 2, 3, '李四', '15800000002', '2栋418', '2023-12-19 12:00:00', NULL, 1, 0, 20.00, 6.00, NULL, '用户主动取消', '2023-12-19 12:05:00', NULL);
INSERT INTO `orders` VALUES (13, '202512231317', 'J345', 1, 4, 11, NULL, '小明', '15800000011', '9栋289', '2025-12-23 12:40:43', '2025-12-23 12:41:13', 2, 1, 21.79, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (14, '202512235546', 'L628', 1, 4, 20, NULL, '小燕', '15800000020', '10栋580', '2025-12-23 12:41:51', '2025-12-23 12:42:21', 1, 1, 54.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (15, '202512234372', 'W992', 1, 4, 23, NULL, '小峰', '15800000023', '5栋573', '2025-12-23 12:44:33', '2025-12-23 12:45:03', 2, 1, 17.20, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (16, '202512232349', 'C819', 1, 4, 25, NULL, '小龙', '15800000025', '10栋334', '2025-12-23 07:18:12', '2025-12-23 07:18:42', 2, 1, 49.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (17, '202512233138', 'P954', 1, 4, 13, NULL, '小刚', '15800000013', '1栋265', '2025-12-23 15:37:22', '2025-12-23 15:37:52', 2, 1, 59.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (18, '202512239489', 'V255', 1, 2, 13, NULL, '小刚', '15800000013', '10栋256', '2025-12-23 19:40:26', '2025-12-23 19:40:56', 1, 1, 57.38, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (19, '202512238677', 'R790', 1, 4, 25, NULL, '小龙', '15800000025', '12栋209', '2025-12-23 14:11:38', '2025-12-23 14:12:08', 1, 1, 18.06, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (20, '202512235792', 'X849', 1, 5, 4, NULL, '赵六', '15800000004', '6栋570', '2025-12-23 19:54:30', '2025-12-23 19:55:00', 1, 1, 28.58, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (21, '202512232209', 'T102', 1, 4, 8, NULL, '吴十', '15800000008', '4栋582', '2025-12-23 17:11:29', '2025-12-23 17:11:59', 1, 1, 41.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (22, '202512231495', 'F642', 1, 4, 21, NULL, '小磊', '15800000021', '7栋540', '2025-12-23 17:57:40', '2025-12-23 17:58:10', 2, 1, 77.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (23, '202512234481', 'F732', 1, 4, 17, NULL, '小伟', '15800000017', '1栋547', '2025-12-23 11:26:39', '2025-12-23 11:27:09', 1, 1, 42.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (24, '202512236805', 'D576', 1, 4, 25, NULL, '小龙', '15800000025', '7栋517', '2025-12-23 08:12:39', '2025-12-23 08:13:09', 2, 1, 59.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (25, '202512238851', 'A366', 1, 4, 12, NULL, '小红', '15800000012', '10栋596', '2025-12-23 08:49:39', '2025-12-23 08:50:09', 2, 1, 53.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (26, '202512233297', 'E878', 1, 4, 17, NULL, '小伟', '15800000017', '11栋471', '2025-12-23 13:23:35', '2025-12-23 13:24:05', 1, 1, 27.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (27, '202512232881', 'M580', 1, 4, 18, NULL, '小娟', '15800000018', '6栋320', '2025-12-23 11:07:28', '2025-12-23 11:07:58', 2, 1, 24.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (28, '202512231590', 'B773', 1, 4, 25, NULL, '小龙', '15800000025', '9栋244', '2025-12-23 18:53:40', '2025-12-23 18:54:10', 1, 1, 47.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (29, '202512225468', 'G577', 1, 4, 21, NULL, '小磊', '15800000021', '2栋130', '2025-12-22 17:47:36', '2025-12-22 17:48:06', 2, 1, 78.08, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (30, '202512220910', 'A816', 1, 4, 8, NULL, '吴十', '15800000008', '1栋459', '2025-12-22 08:53:40', '2025-12-22 08:54:10', 1, 1, 33.96, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (31, '202512224403', 'E463', 1, 4, 11, NULL, '小明', '15800000011', '11栋522', '2025-12-22 11:31:42', '2025-12-22 11:32:12', 2, 1, 73.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (32, '202512222964', 'Y755', 1, 4, 20, NULL, '小燕', '15800000020', '12栋449', '2025-12-22 18:03:50', '2025-12-22 18:04:20', 2, 1, 45.86, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (33, '202512226816', 'O796', 1, 4, 13, NULL, '小刚', '15800000013', '4栋105', '2025-12-22 10:38:26', '2025-12-22 10:38:56', 1, 1, 17.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (34, '202512223201', 'Q298', 1, 4, 6, NULL, '孙八', '15800000006', '7栋502', '2025-12-22 11:06:45', '2025-12-22 11:07:15', 1, 1, 53.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (35, '202512220949', 'V823', 1, 4, 24, NULL, '小云', '15800000024', '8栋506', '2025-12-22 18:29:43', '2025-12-22 18:30:13', 1, 1, 17.08, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (36, '202512225041', 'H900', 1, 4, 7, NULL, '周九', '15800000007', '8栋398', '2025-12-22 16:41:52', '2025-12-22 16:42:22', 1, 1, 29.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (37, '202512228041', 'K602', 1, 4, 8, NULL, '吴十', '15800000008', '10栋211', '2025-12-22 14:00:38', '2025-12-22 14:01:08', 2, 1, 67.96, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (38, '202512228622', 'F458', 1, 4, 7, NULL, '周九', '15800000007', '8栋577', '2025-12-22 07:26:38', '2025-12-22 07:27:08', 2, 1, 15.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (39, '202512221508', 'T228', 1, 4, 9, NULL, '陈老师', '15800000009', '12栋597', '2025-12-22 11:24:40', '2025-12-22 11:25:10', 1, 1, 70.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (40, '202512221954', 'E338', 1, 4, 24, NULL, '小云', '15800000024', '2栋438', '2025-12-22 10:26:00', '2025-12-22 10:26:30', 2, 1, 68.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (41, '202512222049', 'R724', 1, 4, 7, NULL, '周九', '15800000007', '8栋567', '2025-12-22 08:32:49', '2025-12-22 08:33:19', 2, 1, 31.53, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (42, '202512229131', 'K314', 1, 4, 17, NULL, '小伟', '15800000017', '5栋478', '2025-12-22 16:20:26', '2025-12-22 16:20:56', 2, 1, 51.57, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (43, '202512226540', 'S587', 1, 4, 22, NULL, '小雪', '15800000022', '10栋245', '2025-12-22 09:25:46', '2025-12-22 09:26:16', 1, 1, 29.82, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (44, '202512228334', 'U437', 1, 4, 8, NULL, '吴十', '15800000008', '10栋507', '2025-12-22 08:38:48', '2025-12-22 08:39:18', 2, 1, 50.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (45, '202512229440', 'L470', 1, 4, 10, NULL, '林老师', '15800000010', '12栋324', '2025-12-22 16:47:34', '2025-12-22 16:48:04', 1, 1, 34.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (46, '202512228083', 'P584', 1, 4, 20, NULL, '小燕', '15800000020', '2栋517', '2025-12-22 13:14:25', '2025-12-22 13:14:55', 2, 1, 54.18, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (47, '202512221454', 'D222', 1, 4, 21, NULL, '小磊', '15800000021', '9栋563', '2025-12-22 13:54:50', '2025-12-22 13:55:20', 1, 1, 55.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (48, '202512215574', 'R661', 1, 5, 19, NULL, '小军', '15800000019', '4栋379', '2025-12-21 16:11:24', '2025-12-21 16:11:54', 2, 1, 58.58, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (49, '202512215653', 'U150', 1, 4, 14, NULL, '小丽', '15800000014', '6栋484', '2025-12-21 07:14:58', '2025-12-21 07:15:28', 2, 1, 30.79, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (50, '202512215762', 'X820', 1, 4, 5, NULL, '钱七', '15800000005', '5栋304', '2025-12-21 11:12:36', '2025-12-21 11:13:06', 2, 1, 40.66, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (51, '202512216050', 'X710', 1, 4, 7, NULL, '周九', '15800000007', '11栋135', '2025-12-21 16:11:14', '2025-12-21 16:11:44', 2, 1, 77.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (52, '202512210455', 'Y510', 1, 5, 15, NULL, '小强', '15800000015', '10栋246', '2025-12-21 08:17:34', '2025-12-21 08:18:04', 1, 1, 79.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (53, '202512212695', 'S691', 1, 4, 23, NULL, '小峰', '15800000023', '5栋458', '2025-12-21 18:28:22', '2025-12-21 18:28:52', 2, 1, 41.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (54, '202512217635', 'O585', 1, 4, 24, NULL, '小云', '15800000024', '3栋228', '2025-12-21 12:23:07', '2025-12-21 12:23:37', 2, 1, 54.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (55, '202512214579', 'L765', 1, 4, 11, NULL, '小明', '15800000011', '7栋318', '2025-12-21 19:24:09', '2025-12-21 19:24:39', 2, 1, 41.35, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (56, '202512211141', 'N165', 1, 4, 17, NULL, '小伟', '15800000017', '4栋158', '2025-12-21 11:37:59', '2025-12-21 11:38:29', 2, 1, 62.68, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (57, '202512210150', 'R406', 1, 4, 17, NULL, '小伟', '15800000017', '12栋398', '2025-12-21 13:00:01', '2025-12-21 13:00:31', 1, 1, 58.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (58, '202512213536', 'Z778', 1, 4, 15, NULL, '小强', '15800000015', '12栋406', '2025-12-21 10:28:07', '2025-12-21 10:28:37', 1, 1, 57.66, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (59, '202512218350', 'S093', 1, 4, 21, NULL, '小磊', '15800000021', '4栋230', '2025-12-21 08:58:34', '2025-12-21 08:59:04', 1, 1, 21.84, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (60, '202512213058', 'F223', 1, 4, 25, NULL, '小龙', '15800000025', '6栋350', '2025-12-21 08:18:19', '2025-12-21 08:18:49', 1, 1, 47.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (61, '202512211211', 'L895', 1, 4, 10, NULL, '林老师', '15800000010', '2栋569', '2025-12-21 07:40:00', '2025-12-21 07:40:30', 1, 1, 65.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (62, '202512216014', 'C648', 1, 5, 22, NULL, '小雪', '15800000022', '12栋561', '2025-12-21 10:58:20', '2025-12-21 10:58:50', 2, 1, 61.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (63, '202512214018', 'N451', 1, 4, 4, NULL, '赵六', '15800000004', '8栋588', '2025-12-21 13:24:14', '2025-12-21 13:24:44', 2, 1, 45.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (64, '202512211475', 'M953', 1, 4, 1, NULL, '张三', '15800000001', '4栋498', '2025-12-21 12:27:12', '2025-12-21 12:27:42', 2, 1, 51.36, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (65, '202512210729', 'N393', 1, 4, 23, NULL, '小峰', '15800000023', '5栋510', '2025-12-21 10:38:56', '2025-12-21 10:39:26', 2, 1, 19.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (66, '202512218698', 'X950', 1, 5, 7, NULL, '周九', '15800000007', '1栋228', '2025-12-21 17:33:43', '2025-12-21 17:34:13', 1, 1, 35.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (67, '202512218680', 'V460', 1, 4, 3, NULL, '王五', '15800000003', '11栋576', '2025-12-21 13:37:08', '2025-12-21 13:37:38', 1, 1, 76.90, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (68, '202512211535', 'T302', 1, 4, 25, NULL, '小龙', '15800000025', '4栋283', '2025-12-21 07:03:59', '2025-12-21 07:04:29', 1, 1, 31.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (69, '202512215414', 'E308', 1, 4, 19, NULL, '小军', '15800000019', '12栋599', '2025-12-21 13:35:23', '2025-12-21 13:35:53', 1, 1, 27.51, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (70, '202512214939', 'H914', 1, 4, 11, NULL, '小明', '15800000011', '9栋570', '2025-12-21 16:29:32', '2025-12-21 16:30:02', 1, 1, 56.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (71, '202512212824', 'M581', 1, 4, 21, NULL, '小磊', '15800000021', '6栋361', '2025-12-21 19:40:52', '2025-12-21 19:41:22', 1, 1, 59.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (72, '202512203099', 'O894', 1, 4, 9, NULL, '陈老师', '15800000009', '10栋215', '2025-12-20 19:56:00', '2025-12-20 19:56:30', 2, 1, 35.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (73, '202512201827', 'J276', 1, 4, 19, NULL, '小军', '15800000019', '4栋402', '2025-12-20 09:22:43', '2025-12-20 09:23:13', 1, 1, 79.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (74, '202512206942', 'X341', 1, 4, 16, NULL, '小芳', '15800000016', '1栋226', '2025-12-20 18:12:32', '2025-12-20 18:13:02', 1, 1, 63.15, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (75, '202512208593', 'S941', 1, 4, 20, NULL, '小燕', '15800000020', '8栋189', '2025-12-20 18:14:07', '2025-12-20 18:14:37', 1, 1, 74.37, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (76, '202512201085', 'R020', 1, 4, 24, NULL, '小云', '15800000024', '2栋307', '2025-12-20 15:07:05', '2025-12-20 15:07:35', 2, 1, 61.18, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (77, '202512200660', 'O516', 1, 4, 2, NULL, '李四', '15800000002', '12栋215', '2025-12-20 10:24:43', '2025-12-20 10:25:13', 1, 1, 61.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (78, '202512205967', 'F306', 1, 4, 21, NULL, '小磊', '15800000021', '11栋329', '2025-12-20 14:38:45', '2025-12-20 14:39:15', 2, 1, 76.79, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (79, '202512208793', 'W633', 1, 4, 14, NULL, '小丽', '15800000014', '8栋169', '2025-12-20 09:21:05', '2025-12-20 09:21:35', 2, 1, 75.05, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (80, '202512206475', 'P969', 1, 5, 17, NULL, '小伟', '15800000017', '2栋402', '2025-12-20 14:10:24', '2025-12-20 14:10:54', 2, 1, 63.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (81, '202512205372', 'K395', 1, 4, 19, NULL, '小军', '15800000019', '10栋441', '2025-12-20 12:34:04', '2025-12-20 12:34:34', 1, 1, 42.84, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (82, '202512199465', 'A244', 1, 4, 4, NULL, '赵六', '15800000004', '3栋163', '2025-12-19 14:26:14', '2025-12-19 14:26:44', 1, 1, 28.55, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (83, '202512192894', 'I687', 1, 4, 14, NULL, '小丽', '15800000014', '7栋338', '2025-12-19 11:55:23', '2025-12-19 11:55:53', 2, 1, 71.21, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (84, '202512191240', 'C016', 1, 4, 5, NULL, '钱七', '15800000005', '11栋194', '2025-12-19 18:01:08', '2025-12-19 18:01:38', 1, 1, 45.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (85, '202512191924', 'C920', 1, 4, 2, NULL, '李四', '15800000002', '4栋490', '2025-12-19 10:44:16', '2025-12-19 10:44:46', 2, 1, 50.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (86, '202512195370', 'I027', 1, 4, 7, NULL, '周九', '15800000007', '2栋445', '2025-12-19 17:12:57', '2025-12-19 17:13:27', 2, 1, 73.08, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (87, '202512190094', 'U949', 1, 4, 7, NULL, '周九', '15800000007', '5栋587', '2025-12-19 12:25:21', '2025-12-19 12:25:51', 2, 1, 78.42, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (88, '202512192362', 'E180', 1, 5, 4, NULL, '赵六', '15800000004', '5栋251', '2025-12-19 15:40:55', '2025-12-19 15:41:25', 1, 1, 23.46, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (89, '202512199283', 'O018', 1, 5, 2, NULL, '李四', '15800000002', '5栋101', '2025-12-19 11:41:09', '2025-12-19 11:41:39', 2, 1, 73.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (90, '202512199985', 'I614', 1, 4, 13, NULL, '小刚', '15800000013', '2栋452', '2025-12-19 14:14:28', '2025-12-19 14:14:58', 1, 1, 69.46, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (91, '202512198929', 'W557', 1, 4, 12, NULL, '小红', '15800000012', '3栋380', '2025-12-19 09:40:35', '2025-12-19 09:41:05', 1, 1, 57.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (92, '202512190973', 'F806', 1, 4, 20, NULL, '小燕', '15800000020', '5栋327', '2025-12-19 16:49:25', '2025-12-19 16:49:55', 1, 1, 38.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (93, '202512193569', 'H418', 1, 4, 11, NULL, '小明', '15800000011', '3栋471', '2025-12-19 09:06:34', '2025-12-19 09:07:04', 1, 1, 38.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (94, '202512192291', 'Y950', 1, 4, 6, NULL, '孙八', '15800000006', '12栋107', '2025-12-19 16:36:39', '2025-12-19 16:37:09', 1, 1, 61.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (95, '202512196478', 'S659', 1, 4, 8, NULL, '吴十', '15800000008', '2栋455', '2025-12-19 17:54:55', '2025-12-19 17:55:25', 1, 1, 52.53, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (96, '202512193005', 'Q257', 1, 4, 24, NULL, '小云', '15800000024', '5栋195', '2025-12-19 15:06:27', '2025-12-19 15:06:57', 2, 1, 35.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (97, '202512189310', 'H675', 1, 4, 14, NULL, '小丽', '15800000014', '7栋336', '2025-12-18 12:54:01', '2025-12-18 12:54:31', 2, 1, 73.53, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (98, '202512183714', 'L152', 1, 4, 2, NULL, '李四', '15800000002', '5栋374', '2025-12-18 17:25:05', '2025-12-18 17:25:35', 2, 1, 18.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (99, '202512186367', 'U976', 1, 4, 19, NULL, '小军', '15800000019', '7栋523', '2025-12-18 17:25:40', '2025-12-18 17:26:10', 2, 1, 33.86, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (100, '202512187859', 'H158', 1, 4, 16, NULL, '小芳', '15800000016', '11栋571', '2025-12-18 09:42:54', '2025-12-18 09:43:24', 1, 1, 47.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (101, '202512187222', 'Q961', 1, 4, 10, NULL, '林老师', '15800000010', '12栋494', '2025-12-18 15:36:18', '2025-12-18 15:36:48', 1, 1, 35.76, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (102, '202512186525', 'L216', 1, 4, 14, NULL, '小丽', '15800000014', '10栋221', '2025-12-18 14:55:17', '2025-12-18 14:55:47', 2, 1, 59.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (103, '202512180895', 'S276', 1, 4, 15, NULL, '小强', '15800000015', '4栋326', '2025-12-18 18:52:06', '2025-12-18 18:52:36', 1, 1, 21.54, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (104, '202512183214', 'O856', 1, 4, 3, NULL, '王五', '15800000003', '8栋294', '2025-12-18 15:51:11', '2025-12-18 15:51:41', 1, 1, 58.95, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (105, '202512187348', 'V840', 1, 4, 16, NULL, '小芳', '15800000016', '10栋284', '2025-12-18 15:05:02', '2025-12-18 15:05:32', 2, 1, 43.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (106, '202512185827', 'L450', 1, 4, 17, NULL, '小伟', '15800000017', '12栋262', '2025-12-18 09:03:19', '2025-12-18 09:03:49', 2, 1, 23.69, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (107, '202512174322', 'Z573', 1, 4, 17, NULL, '小伟', '15800000017', '12栋106', '2025-12-17 07:48:44', '2025-12-17 07:49:14', 1, 1, 21.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (108, '202512178440', 'R747', 1, 4, 21, NULL, '小磊', '15800000021', '10栋405', '2025-12-17 13:46:45', '2025-12-17 13:47:15', 2, 1, 72.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (109, '202512172071', 'B650', 1, 4, 16, NULL, '小芳', '15800000016', '2栋356', '2025-12-17 11:15:09', '2025-12-17 11:15:39', 1, 1, 71.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (110, '202512174847', 'F594', 1, 4, 15, NULL, '小强', '15800000015', '5栋573', '2025-12-17 16:35:39', '2025-12-17 16:36:09', 2, 1, 55.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (111, '202512172075', 'Q565', 1, 4, 14, NULL, '小丽', '15800000014', '11栋542', '2025-12-17 17:24:00', '2025-12-17 17:24:30', 2, 1, 62.36, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (112, '202512174228', 'R042', 1, 4, 7, NULL, '周九', '15800000007', '3栋103', '2025-12-17 08:57:30', '2025-12-17 08:58:00', 1, 1, 64.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (113, '202512175741', 'J045', 1, 4, 21, NULL, '小磊', '15800000021', '3栋450', '2025-12-17 09:14:32', '2025-12-17 09:15:02', 1, 1, 74.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (114, '202512177669', 'J470', 1, 4, 8, NULL, '吴十', '15800000008', '4栋121', '2025-12-17 09:04:59', '2025-12-17 09:05:29', 1, 1, 52.63, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (115, '202512171694', 'A535', 1, 4, 21, NULL, '小磊', '15800000021', '8栋431', '2025-12-17 19:17:57', '2025-12-17 19:18:27', 1, 1, 64.83, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (116, '202512175894', 'A283', 1, 4, 4, NULL, '赵六', '15800000004', '5栋140', '2025-12-17 15:23:41', '2025-12-17 15:24:11', 1, 1, 78.42, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (117, '202512175421', 'E155', 1, 4, 18, NULL, '小娟', '15800000018', '4栋142', '2025-12-17 13:44:09', '2025-12-17 13:44:39', 1, 1, 29.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (118, '202512176837', 'T754', 1, 4, 15, NULL, '小强', '15800000015', '6栋201', '2025-12-17 18:30:56', '2025-12-17 18:31:26', 2, 1, 18.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (119, '202512175584', 'W576', 1, 4, 13, NULL, '小刚', '15800000013', '5栋569', '2025-12-17 11:04:52', '2025-12-17 11:05:22', 2, 1, 57.81, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (120, '202512170606', 'X255', 1, 4, 25, NULL, '小龙', '15800000025', '8栋252', '2025-12-17 08:48:06', '2025-12-17 08:48:36', 2, 1, 47.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (121, '202512170013', 'F118', 1, 4, 11, NULL, '小明', '15800000011', '12栋220', '2025-12-17 14:43:23', '2025-12-17 14:43:53', 1, 1, 49.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (122, '202512175528', 'A345', 1, 4, 13, NULL, '小刚', '15800000013', '9栋395', '2025-12-17 10:18:32', '2025-12-17 10:19:02', 2, 1, 22.82, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (123, '202512162684', 'V291', 1, 5, 24, NULL, '小云', '15800000024', '12栋159', '2025-12-16 17:55:57', '2025-12-16 17:56:27', 2, 1, 57.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (124, '202512165591', 'K360', 1, 5, 1, NULL, '张三', '15800000001', '7栋509', '2025-12-16 13:01:00', '2025-12-16 13:01:30', 1, 1, 36.20, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (125, '202512163852', 'P830', 1, 4, 5, NULL, '钱七', '15800000005', '5栋265', '2025-12-16 12:45:30', '2025-12-16 12:46:00', 2, 1, 66.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (126, '202512161395', 'V798', 1, 4, 7, NULL, '周九', '15800000007', '6栋560', '2025-12-16 10:42:09', '2025-12-16 10:42:39', 1, 1, 35.53, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (127, '202512166258', 'B384', 1, 4, 25, NULL, '小龙', '15800000025', '10栋440', '2025-12-16 07:20:01', '2025-12-16 07:20:31', 1, 1, 45.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (128, '202512165161', 'E411', 1, 4, 20, NULL, '小燕', '15800000020', '6栋191', '2025-12-16 13:01:04', '2025-12-16 13:01:34', 1, 1, 64.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (129, '202512169933', 'M350', 1, 4, 6, NULL, '孙八', '15800000006', '5栋461', '2025-12-16 09:10:17', '2025-12-16 09:10:47', 2, 1, 53.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (130, '202512169561', 'P158', 1, 4, 9, NULL, '陈老师', '15800000009', '12栋306', '2025-12-16 07:45:38', '2025-12-16 07:46:08', 1, 1, 42.54, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (131, '202512160455', 'J777', 1, 4, 7, NULL, '周九', '15800000007', '9栋288', '2025-12-16 14:59:36', '2025-12-16 15:00:06', 2, 1, 26.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (132, '202512168067', 'P519', 1, 4, 14, NULL, '小丽', '15800000014', '11栋406', '2025-12-16 08:55:57', '2025-12-16 08:56:27', 2, 1, 78.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (133, '202512158318', 'A522', 1, 4, 2, NULL, '李四', '15800000002', '8栋324', '2025-12-15 16:20:29', '2025-12-15 16:20:59', 1, 1, 69.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (134, '202512156914', 'Z849', 1, 4, 5, NULL, '钱七', '15800000005', '4栋568', '2025-12-15 13:22:51', '2025-12-15 13:23:21', 2, 1, 23.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (135, '202512159896', 'C520', 1, 4, 4, NULL, '赵六', '15800000004', '4栋592', '2025-12-15 15:01:13', '2025-12-15 15:01:43', 2, 1, 16.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (136, '202512157834', 'L794', 1, 5, 17, NULL, '小伟', '15800000017', '9栋132', '2025-12-15 17:47:01', '2025-12-15 17:47:31', 1, 1, 19.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (137, '202512156459', 'G362', 1, 4, 25, NULL, '小龙', '15800000025', '1栋142', '2025-12-15 11:12:09', '2025-12-15 11:12:39', 1, 1, 37.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (138, '202512150174', 'K990', 1, 4, 17, NULL, '小伟', '15800000017', '9栋439', '2025-12-15 18:36:25', '2025-12-15 18:36:55', 1, 1, 79.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (139, '202512151185', 'O381', 1, 4, 7, NULL, '周九', '15800000007', '4栋195', '2025-12-15 11:31:44', '2025-12-15 11:32:14', 1, 1, 27.47, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (140, '202512157908', 'W930', 1, 4, 11, NULL, '小明', '15800000011', '1栋389', '2025-12-15 11:44:24', '2025-12-15 11:44:54', 2, 1, 55.04, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (141, '202512156348', 'G398', 1, 4, 14, NULL, '小丽', '15800000014', '3栋535', '2025-12-15 19:37:31', '2025-12-15 19:38:01', 2, 1, 77.87, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (142, '202512159938', 'N680', 1, 5, 10, NULL, '林老师', '15800000010', '10栋100', '2025-12-15 08:53:39', '2025-12-15 08:54:09', 2, 1, 72.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (143, '202512155165', 'V673', 1, 4, 12, NULL, '小红', '15800000012', '11栋181', '2025-12-15 18:51:55', '2025-12-15 18:52:25', 1, 1, 16.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (144, '202512153085', 'C502', 1, 4, 2, NULL, '李四', '15800000002', '4栋489', '2025-12-15 13:18:49', '2025-12-15 13:19:19', 1, 1, 33.66, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (145, '202512159008', 'D987', 1, 4, 13, NULL, '小刚', '15800000013', '7栋433', '2025-12-15 08:35:20', '2025-12-15 08:35:50', 2, 1, 66.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (146, '202512154643', 'H024', 1, 4, 13, NULL, '小刚', '15800000013', '4栋244', '2025-12-15 11:29:58', '2025-12-15 11:30:28', 2, 1, 32.68, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (147, '202512150969', 'B051', 1, 4, 4, NULL, '赵六', '15800000004', '1栋152', '2025-12-15 17:28:14', '2025-12-15 17:28:44', 1, 1, 50.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (148, '202512155955', 'X728', 1, 4, 25, NULL, '小龙', '15800000025', '12栋346', '2025-12-15 11:39:25', '2025-12-15 11:39:55', 2, 1, 68.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (149, '202512156191', 'O965', 1, 4, 25, NULL, '小龙', '15800000025', '2栋492', '2025-12-15 09:18:08', '2025-12-15 09:18:38', 2, 1, 30.13, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (150, '202512151401', 'N137', 1, 4, 10, NULL, '林老师', '15800000010', '2栋276', '2025-12-15 16:29:13', '2025-12-15 16:29:43', 1, 1, 45.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (151, '202512158032', 'R937', 1, 4, 21, NULL, '小磊', '15800000021', '9栋402', '2025-12-15 08:30:10', '2025-12-15 08:30:40', 2, 1, 18.37, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (152, '202512158003', 'G871', 1, 4, 8, NULL, '吴十', '15800000008', '8栋281', '2025-12-15 14:34:21', '2025-12-15 14:34:51', 1, 1, 17.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (153, '202512159831', 'O799', 1, 4, 9, NULL, '陈老师', '15800000009', '5栋278', '2025-12-15 08:35:15', '2025-12-15 08:35:45', 2, 1, 53.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (154, '202512141227', 'T323', 1, 4, 10, NULL, '林老师', '15800000010', '5栋123', '2025-12-14 10:47:34', '2025-12-14 10:48:04', 1, 1, 78.04, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (155, '202512143423', 'G259', 1, 4, 6, NULL, '孙八', '15800000006', '7栋531', '2025-12-14 17:38:09', '2025-12-14 17:38:39', 2, 1, 18.97, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (156, '202512140543', 'A019', 1, 4, 16, NULL, '小芳', '15800000016', '12栋536', '2025-12-14 08:01:14', '2025-12-14 08:01:44', 1, 1, 42.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (157, '202512145611', 'L545', 1, 4, 9, NULL, '陈老师', '15800000009', '5栋263', '2025-12-14 17:13:37', '2025-12-14 17:14:07', 1, 1, 35.35, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (158, '202512146172', 'C536', 1, 4, 10, NULL, '林老师', '15800000010', '6栋424', '2025-12-14 07:02:19', '2025-12-14 07:02:49', 2, 1, 48.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (159, '202512146888', 'Q084', 1, 4, 7, NULL, '周九', '15800000007', '7栋307', '2025-12-14 10:31:43', '2025-12-14 10:32:13', 1, 1, 22.32, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (160, '202512148718', 'E232', 1, 5, 22, NULL, '小雪', '15800000022', '8栋383', '2025-12-14 12:09:25', '2025-12-14 12:09:55', 2, 1, 59.32, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (161, '202512144578', 'O400', 1, 4, 13, NULL, '小刚', '15800000013', '5栋346', '2025-12-14 18:50:58', '2025-12-14 18:51:28', 1, 1, 63.63, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (162, '202512148824', 'X876', 1, 4, 15, NULL, '小强', '15800000015', '9栋467', '2025-12-14 09:11:59', '2025-12-14 09:12:29', 2, 1, 19.42, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (163, '202512147359', 'N409', 1, 4, 10, NULL, '林老师', '15800000010', '6栋186', '2025-12-14 12:00:41', '2025-12-14 12:01:11', 1, 1, 53.55, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (164, '202512144576', 'P568', 1, 4, 9, NULL, '陈老师', '15800000009', '1栋443', '2025-12-14 10:02:01', '2025-12-14 10:02:31', 1, 1, 76.77, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (165, '202512147658', 'N306', 1, 5, 14, NULL, '小丽', '15800000014', '12栋564', '2025-12-14 12:40:18', '2025-12-14 12:40:48', 2, 1, 72.06, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (166, '202512148761', 'F367', 1, 4, 1, NULL, '张三', '15800000001', '3栋155', '2025-12-14 16:27:14', '2025-12-14 16:27:44', 2, 1, 65.63, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (167, '202512148426', 'D063', 1, 4, 10, NULL, '林老师', '15800000010', '12栋409', '2025-12-14 07:24:46', '2025-12-14 07:25:16', 1, 1, 28.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (168, '202512149254', 'T980', 1, 4, 25, NULL, '小龙', '15800000025', '8栋254', '2025-12-14 10:47:49', '2025-12-14 10:48:19', 2, 1, 18.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (169, '202512144607', 'S158', 1, 4, 1, NULL, '张三', '15800000001', '9栋529', '2025-12-14 13:54:54', '2025-12-14 13:55:24', 1, 1, 73.18, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (170, '202512136588', 'D770', 1, 4, 2, NULL, '李四', '15800000002', '5栋458', '2025-12-13 07:37:44', '2025-12-13 07:38:14', 1, 1, 59.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (171, '202512130075', 'J854', 1, 4, 20, NULL, '小燕', '15800000020', '2栋189', '2025-12-13 14:12:12', '2025-12-13 14:12:42', 1, 1, 60.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (172, '202512138866', 'F419', 1, 4, 17, NULL, '小伟', '15800000017', '6栋598', '2025-12-13 12:16:33', '2025-12-13 12:17:03', 2, 1, 25.02, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (173, '202512132845', 'Q380', 1, 4, 18, NULL, '小娟', '15800000018', '12栋437', '2025-12-13 19:01:48', '2025-12-13 19:02:18', 1, 1, 40.82, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (174, '202512132342', 'Y022', 1, 4, 17, NULL, '小伟', '15800000017', '4栋255', '2025-12-13 16:38:50', '2025-12-13 16:39:20', 2, 1, 61.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (175, '202512130287', 'L201', 1, 5, 5, NULL, '钱七', '15800000005', '8栋387', '2025-12-13 18:38:23', '2025-12-13 18:38:53', 2, 1, 22.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (176, '202512137467', 'X222', 1, 4, 24, NULL, '小云', '15800000024', '6栋352', '2025-12-13 14:58:49', '2025-12-13 14:59:19', 1, 1, 54.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (177, '202512136324', 'D745', 1, 4, 11, NULL, '小明', '15800000011', '5栋338', '2025-12-13 15:48:49', '2025-12-13 15:49:19', 1, 1, 38.88, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (178, '202512136134', 'V300', 1, 4, 21, NULL, '小磊', '15800000021', '1栋199', '2025-12-13 16:42:14', '2025-12-13 16:42:44', 2, 1, 19.82, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (179, '202512134179', 'G072', 1, 4, 19, NULL, '小军', '15800000019', '7栋407', '2025-12-13 19:14:25', '2025-12-13 19:14:55', 1, 1, 16.63, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (180, '202512130200', 'X543', 1, 4, 4, NULL, '赵六', '15800000004', '12栋181', '2025-12-13 07:46:40', '2025-12-13 07:47:10', 2, 1, 28.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (181, '202512136660', 'W416', 1, 4, 12, NULL, '小红', '15800000012', '6栋565', '2025-12-13 17:36:21', '2025-12-13 17:36:51', 1, 1, 74.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (182, '202512137134', 'S377', 1, 4, 14, NULL, '小丽', '15800000014', '10栋475', '2025-12-13 15:04:37', '2025-12-13 15:05:07', 1, 1, 70.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (183, '202512134478', 'Y308', 1, 4, 5, NULL, '钱七', '15800000005', '10栋520', '2025-12-13 12:40:20', '2025-12-13 12:40:50', 2, 1, 29.02, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (184, '202512138341', 'T341', 1, 4, 23, NULL, '小峰', '15800000023', '5栋595', '2025-12-13 13:04:33', '2025-12-13 13:05:03', 2, 1, 62.66, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (185, '202512132427', 'D953', 1, 4, 25, NULL, '小龙', '15800000025', '5栋571', '2025-12-13 11:40:06', '2025-12-13 11:40:36', 2, 1, 35.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (186, '202512137726', 'Z630', 1, 4, 24, NULL, '小云', '15800000024', '3栋122', '2025-12-13 19:27:11', '2025-12-13 19:27:41', 2, 1, 26.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (187, '202512131508', 'C985', 1, 4, 17, NULL, '小伟', '15800000017', '9栋291', '2025-12-13 18:33:20', '2025-12-13 18:33:50', 2, 1, 40.00, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (188, '202512133730', 'K933', 1, 4, 2, NULL, '李四', '15800000002', '6栋302', '2025-12-13 08:58:15', '2025-12-13 08:58:45', 2, 1, 33.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (189, '202512122675', 'M513', 1, 4, 9, NULL, '陈老师', '15800000009', '3栋282', '2025-12-12 10:47:20', '2025-12-12 10:47:50', 1, 1, 34.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (190, '202512125611', 'B598', 1, 4, 10, NULL, '林老师', '15800000010', '10栋267', '2025-12-12 10:14:53', '2025-12-12 10:15:23', 1, 1, 77.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (191, '202512129011', 'T031', 1, 4, 2, NULL, '李四', '15800000002', '11栋341', '2025-12-12 10:17:24', '2025-12-12 10:17:54', 2, 1, 72.53, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (192, '202512129975', 'Y708', 1, 4, 20, NULL, '小燕', '15800000020', '9栋344', '2025-12-12 07:12:25', '2025-12-12 07:12:55', 1, 1, 74.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (193, '202512125981', 'P265', 1, 4, 15, NULL, '小强', '15800000015', '6栋436', '2025-12-12 08:38:30', '2025-12-12 08:39:00', 2, 1, 41.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (194, '202512121004', 'X234', 1, 4, 5, NULL, '钱七', '15800000005', '6栋379', '2025-12-12 09:34:39', '2025-12-12 09:35:09', 1, 1, 48.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (195, '202512121025', 'K763', 1, 4, 21, NULL, '小磊', '15800000021', '7栋394', '2025-12-12 11:45:35', '2025-12-12 11:46:05', 1, 1, 36.08, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (196, '202512125812', 'W674', 1, 5, 24, NULL, '小云', '15800000024', '9栋400', '2025-12-12 11:25:54', '2025-12-12 11:26:24', 2, 1, 37.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (197, '202512126464', 'L197', 1, 4, 20, NULL, '小燕', '15800000020', '9栋568', '2025-12-12 19:09:20', '2025-12-12 19:09:50', 2, 1, 17.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (198, '202512120558', 'B193', 1, 4, 23, NULL, '小峰', '15800000023', '9栋185', '2025-12-12 16:33:49', '2025-12-12 16:34:19', 2, 1, 46.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (199, '202512125430', 'W667', 1, 4, 16, NULL, '小芳', '15800000016', '10栋500', '2025-12-12 19:22:34', '2025-12-12 19:23:04', 2, 1, 28.20, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (200, '202512116862', 'O637', 1, 4, 21, NULL, '小磊', '15800000021', '7栋574', '2025-12-11 19:32:00', '2025-12-11 19:32:30', 1, 1, 32.84, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (201, '202512114583', 'U646', 1, 4, 13, NULL, '小刚', '15800000013', '10栋180', '2025-12-11 09:06:43', '2025-12-11 09:07:13', 1, 1, 30.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (202, '202512117556', 'A869', 1, 4, 24, NULL, '小云', '15800000024', '4栋466', '2025-12-11 10:15:21', '2025-12-11 10:15:51', 2, 1, 20.04, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (203, '202512113119', 'T818', 1, 4, 17, NULL, '小伟', '15800000017', '11栋482', '2025-12-11 14:50:15', '2025-12-11 14:50:45', 1, 1, 26.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (204, '202512112346', 'Y081', 1, 4, 17, NULL, '小伟', '15800000017', '7栋319', '2025-12-11 07:56:13', '2025-12-11 07:56:43', 2, 1, 53.43, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (205, '202512112403', 'G593', 1, 4, 22, NULL, '小雪', '15800000022', '3栋163', '2025-12-11 15:24:05', '2025-12-11 15:24:35', 1, 1, 20.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (206, '202512112831', 'R597', 1, 4, 11, NULL, '小明', '15800000011', '12栋504', '2025-12-11 18:48:55', '2025-12-11 18:49:25', 1, 1, 79.97, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (207, '202512110427', 'T656', 1, 4, 13, NULL, '小刚', '15800000013', '1栋151', '2025-12-11 13:18:42', '2025-12-11 13:19:12', 1, 1, 16.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (208, '202512112964', 'R517', 1, 4, 24, NULL, '小云', '15800000024', '7栋187', '2025-12-11 14:48:13', '2025-12-11 14:48:43', 1, 1, 58.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (209, '202512116128', 'H654', 1, 4, 25, NULL, '小龙', '15800000025', '5栋568', '2025-12-11 10:19:05', '2025-12-11 10:19:35', 2, 1, 73.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (210, '202512117428', 'S234', 1, 4, 10, NULL, '林老师', '15800000010', '2栋488', '2025-12-11 07:05:38', '2025-12-11 07:06:08', 2, 1, 56.88, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (211, '202512115632', 'C745', 1, 4, 5, NULL, '钱七', '15800000005', '6栋155', '2025-12-11 10:09:35', '2025-12-11 10:10:05', 1, 1, 40.35, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (212, '202512112234', 'Z226', 1, 4, 4, NULL, '赵六', '15800000004', '3栋244', '2025-12-11 07:35:56', '2025-12-11 07:36:26', 2, 1, 44.70, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (213, '202512116609', 'G267', 1, 4, 9, NULL, '陈老师', '15800000009', '8栋165', '2025-12-11 07:14:15', '2025-12-11 07:14:45', 2, 1, 21.04, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (214, '202512116798', 'E851', 1, 4, 13, NULL, '小刚', '15800000013', '9栋141', '2025-12-11 16:37:29', '2025-12-11 16:37:59', 1, 1, 73.04, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (215, '202512118399', 'P490', 1, 5, 15, NULL, '小强', '15800000015', '8栋483', '2025-12-11 09:35:29', '2025-12-11 09:35:59', 2, 1, 23.86, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (216, '202512118662', 'E226', 1, 4, 6, NULL, '孙八', '15800000006', '8栋351', '2025-12-11 16:23:18', '2025-12-11 16:23:48', 2, 1, 49.70, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (217, '202512110632', 'P798', 1, 4, 23, NULL, '小峰', '15800000023', '3栋413', '2025-12-11 10:06:44', '2025-12-11 10:07:14', 2, 1, 60.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (218, '202512111570', 'X037', 1, 4, 13, NULL, '小刚', '15800000013', '6栋244', '2025-12-11 10:49:48', '2025-12-11 10:50:18', 1, 1, 26.46, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (219, '202512118810', 'C919', 1, 4, 19, NULL, '小军', '15800000019', '4栋381', '2025-12-11 16:56:09', '2025-12-11 16:56:39', 1, 1, 41.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (220, '202512112719', 'U100', 1, 5, 16, NULL, '小芳', '15800000016', '2栋331', '2025-12-11 18:09:53', '2025-12-11 18:10:23', 2, 1, 72.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (221, '202512101545', 'F519', 1, 4, 5, NULL, '钱七', '15800000005', '1栋345', '2025-12-10 13:49:44', '2025-12-10 13:50:14', 1, 1, 56.54, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (222, '202512107395', 'O633', 1, 4, 23, NULL, '小峰', '15800000023', '6栋296', '2025-12-10 07:33:07', '2025-12-10 07:33:37', 2, 1, 63.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (223, '202512104289', 'S352', 1, 4, 8, NULL, '吴十', '15800000008', '7栋518', '2025-12-10 17:28:26', '2025-12-10 17:28:56', 1, 1, 62.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (224, '202512103280', 'J899', 1, 4, 7, NULL, '周九', '15800000007', '5栋182', '2025-12-10 08:08:25', '2025-12-10 08:08:55', 2, 1, 16.27, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (225, '202512103682', 'F018', 1, 4, 6, NULL, '孙八', '15800000006', '6栋120', '2025-12-10 14:00:18', '2025-12-10 14:00:48', 2, 1, 55.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (226, '202512109681', 'T795', 1, 5, 15, NULL, '小强', '15800000015', '10栋308', '2025-12-10 07:26:18', '2025-12-10 07:26:48', 2, 1, 65.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (227, '202512106735', 'I635', 1, 4, 23, NULL, '小峰', '15800000023', '3栋109', '2025-12-10 11:29:32', '2025-12-10 11:30:02', 2, 1, 57.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (228, '202512100884', 'W091', 1, 4, 19, NULL, '小军', '15800000019', '11栋569', '2025-12-10 13:48:23', '2025-12-10 13:48:53', 1, 1, 15.28, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (229, '202512100871', 'Y474', 1, 4, 11, NULL, '小明', '15800000011', '7栋216', '2025-12-10 17:46:59', '2025-12-10 17:47:29', 2, 1, 25.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (230, '202512100582', 'A928', 1, 4, 8, NULL, '吴十', '15800000008', '7栋163', '2025-12-10 12:30:20', '2025-12-10 12:30:50', 2, 1, 18.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (231, '202512107297', 'N468', 1, 4, 3, NULL, '王五', '15800000003', '9栋270', '2025-12-10 11:50:33', '2025-12-10 11:51:03', 1, 1, 30.76, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (232, '202512106447', 'K157', 1, 4, 22, NULL, '小雪', '15800000022', '7栋191', '2025-12-10 10:29:27', '2025-12-10 10:29:57', 1, 1, 19.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (233, '202512106243', 'P087', 1, 5, 18, NULL, '小娟', '15800000018', '8栋123', '2025-12-10 17:57:46', '2025-12-10 17:58:16', 1, 1, 22.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (234, '202512103396', 'N524', 1, 4, 19, NULL, '小军', '15800000019', '2栋554', '2025-12-10 16:29:19', '2025-12-10 16:29:49', 1, 1, 51.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (235, '202512109225', 'O051', 1, 4, 8, NULL, '吴十', '15800000008', '7栋440', '2025-12-10 07:12:48', '2025-12-10 07:13:18', 2, 1, 45.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (236, '202512104022', 'D501', 1, 4, 11, NULL, '小明', '15800000011', '2栋556', '2025-12-10 15:06:05', '2025-12-10 15:06:35', 1, 1, 68.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (237, '202512108544', 'B629', 1, 4, 5, NULL, '钱七', '15800000005', '1栋238', '2025-12-10 16:40:48', '2025-12-10 16:41:18', 1, 1, 52.60, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (238, '202512102612', 'M528', 1, 4, 5, NULL, '钱七', '15800000005', '4栋450', '2025-12-10 10:39:25', '2025-12-10 10:39:55', 2, 1, 50.90, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (239, '202512105115', 'G720', 1, 4, 12, NULL, '小红', '15800000012', '11栋149', '2025-12-10 16:59:45', '2025-12-10 17:00:15', 2, 1, 39.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (240, '202512101715', 'M951', 1, 4, 25, NULL, '小龙', '15800000025', '4栋379', '2025-12-10 08:34:42', '2025-12-10 08:35:12', 2, 1, 18.72, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (241, '202512106285', 'Q323', 1, 4, 21, NULL, '小磊', '15800000021', '9栋344', '2025-12-10 13:30:19', '2025-12-10 13:30:49', 1, 1, 40.79, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (242, '202512094619', 'Z503', 1, 4, 11, NULL, '小明', '15800000011', '8栋310', '2025-12-09 12:46:17', '2025-12-09 12:46:47', 1, 1, 44.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (243, '202512099211', 'H727', 1, 4, 19, NULL, '小军', '15800000019', '9栋374', '2025-12-09 16:59:58', '2025-12-09 17:00:28', 2, 1, 71.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (244, '202512093881', 'A860', 1, 4, 6, NULL, '孙八', '15800000006', '4栋536', '2025-12-09 19:43:15', '2025-12-09 19:43:45', 1, 1, 69.96, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (245, '202512098144', 'U434', 1, 4, 10, NULL, '林老师', '15800000010', '11栋569', '2025-12-09 08:17:11', '2025-12-09 08:17:41', 1, 1, 74.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (246, '202512092134', 'A432', 1, 4, 2, NULL, '李四', '15800000002', '2栋254', '2025-12-09 15:53:38', '2025-12-09 15:54:08', 1, 1, 77.28, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (247, '202512099223', 'M546', 1, 4, 12, NULL, '小红', '15800000012', '5栋147', '2025-12-09 16:18:48', '2025-12-09 16:19:18', 1, 1, 72.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (248, '202512097445', 'X197', 1, 4, 4, NULL, '赵六', '15800000004', '4栋123', '2025-12-09 14:57:33', '2025-12-09 14:58:03', 1, 1, 22.78, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (249, '202512095531', 'L605', 1, 4, 19, NULL, '小军', '15800000019', '9栋372', '2025-12-09 17:01:21', '2025-12-09 17:01:51', 2, 1, 73.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (250, '202512092366', 'F285', 1, 4, 22, NULL, '小雪', '15800000022', '10栋253', '2025-12-09 19:55:52', '2025-12-09 19:56:22', 1, 1, 30.99, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (251, '202512095664', 'Z213', 1, 4, 6, NULL, '孙八', '15800000006', '2栋584', '2025-12-09 15:00:54', '2025-12-09 15:01:24', 1, 1, 45.83, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (252, '202512088115', 'R920', 1, 4, 22, NULL, '小雪', '15800000022', '8栋202', '2025-12-08 13:00:34', '2025-12-08 13:01:04', 1, 1, 54.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (253, '202512089926', 'D732', 1, 4, 16, NULL, '小芳', '15800000016', '3栋596', '2025-12-08 19:13:35', '2025-12-08 19:14:05', 1, 1, 31.58, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (254, '202512087750', 'H207', 1, 4, 24, NULL, '小云', '15800000024', '2栋586', '2025-12-08 18:07:57', '2025-12-08 18:08:27', 2, 1, 55.21, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (255, '202512084272', 'H218', 1, 5, 15, NULL, '小强', '15800000015', '3栋252', '2025-12-08 14:57:25', '2025-12-08 14:57:55', 2, 1, 68.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (256, '202512089543', 'X685', 1, 4, 5, NULL, '钱七', '15800000005', '9栋319', '2025-12-08 19:24:10', '2025-12-08 19:24:40', 1, 1, 25.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (257, '202512081410', 'T331', 1, 4, 3, NULL, '王五', '15800000003', '5栋117', '2025-12-08 19:48:07', '2025-12-08 19:48:37', 2, 1, 59.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (258, '202512088841', 'P416', 1, 5, 10, NULL, '林老师', '15800000010', '3栋581', '2025-12-08 14:49:52', '2025-12-08 14:50:22', 1, 1, 50.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (259, '202512088482', 'K456', 1, 4, 9, NULL, '陈老师', '15800000009', '1栋121', '2025-12-08 19:18:46', '2025-12-08 19:19:16', 2, 1, 61.77, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (260, '202512086844', 'Z807', 1, 4, 3, NULL, '王五', '15800000003', '2栋202', '2025-12-08 08:57:03', '2025-12-08 08:57:33', 2, 1, 54.89, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (261, '202512080605', 'I399', 1, 4, 7, NULL, '周九', '15800000007', '1栋127', '2025-12-08 11:16:29', '2025-12-08 11:16:59', 1, 1, 44.78, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (262, '202512083460', 'Q158', 1, 4, 8, NULL, '吴十', '15800000008', '11栋547', '2025-12-08 16:03:42', '2025-12-08 16:04:12', 2, 1, 53.36, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (263, '202512088763', 'C843', 1, 4, 5, NULL, '钱七', '15800000005', '12栋175', '2025-12-08 08:14:43', '2025-12-08 08:15:13', 2, 1, 31.60, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (264, '202512089697', 'U061', 1, 4, 6, NULL, '孙八', '15800000006', '12栋320', '2025-12-08 11:34:20', '2025-12-08 11:34:50', 1, 1, 68.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (265, '202512080247', 'Y614', 1, 4, 6, NULL, '孙八', '15800000006', '4栋335', '2025-12-08 07:48:18', '2025-12-08 07:48:48', 2, 1, 42.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (266, '202512081363', 'K602', 1, 4, 5, NULL, '钱七', '15800000005', '10栋217', '2025-12-08 08:12:35', '2025-12-08 08:13:05', 2, 1, 16.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (267, '202512087293', 'K843', 1, 4, 6, NULL, '孙八', '15800000006', '1栋335', '2025-12-08 16:42:36', '2025-12-08 16:43:06', 1, 1, 37.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (268, '202512084276', 'V800', 1, 4, 12, NULL, '小红', '15800000012', '7栋289', '2025-12-08 17:03:38', '2025-12-08 17:04:08', 1, 1, 79.11, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (269, '202512089821', 'J806', 1, 4, 24, NULL, '小云', '15800000024', '12栋349', '2025-12-08 18:05:39', '2025-12-08 18:06:09', 2, 1, 30.12, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (270, '202512083080', 'V273', 1, 4, 18, NULL, '小娟', '15800000018', '11栋318', '2025-12-08 14:22:08', '2025-12-08 14:22:38', 2, 1, 68.86, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (271, '202512085131', 'Z408', 1, 4, 18, NULL, '小娟', '15800000018', '1栋173', '2025-12-08 09:29:51', '2025-12-08 09:30:21', 2, 1, 23.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (272, '202512071936', 'J204', 1, 4, 4, NULL, '赵六', '15800000004', '12栋172', '2025-12-07 09:38:54', '2025-12-07 09:39:24', 2, 1, 73.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (273, '202512075945', 'F228', 1, 4, 2, NULL, '李四', '15800000002', '7栋595', '2025-12-07 19:00:21', '2025-12-07 19:00:51', 1, 1, 64.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (274, '202512070570', 'L069', 1, 4, 11, NULL, '小明', '15800000011', '1栋504', '2025-12-07 19:17:39', '2025-12-07 19:18:09', 1, 1, 63.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (275, '202512072660', 'M575', 1, 4, 15, NULL, '小强', '15800000015', '6栋373', '2025-12-07 19:22:26', '2025-12-07 19:22:56', 1, 1, 27.69, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (276, '202512071091', 'L838', 1, 4, 22, NULL, '小雪', '15800000022', '11栋580', '2025-12-07 07:29:15', '2025-12-07 07:29:45', 1, 1, 61.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (277, '202512070621', 'D556', 1, 4, 9, NULL, '陈老师', '15800000009', '5栋109', '2025-12-07 12:02:10', '2025-12-07 12:02:40', 1, 1, 36.72, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (278, '202512078553', 'X953', 1, 4, 12, NULL, '小红', '15800000012', '1栋320', '2025-12-07 12:56:55', '2025-12-07 12:57:25', 1, 1, 66.68, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (279, '202512077853', 'K680', 1, 4, 3, NULL, '王五', '15800000003', '3栋539', '2025-12-07 09:15:07', '2025-12-07 09:15:37', 2, 1, 50.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (280, '202512076019', 'A351', 1, 4, 7, NULL, '周九', '15800000007', '8栋234', '2025-12-07 19:54:21', '2025-12-07 19:54:51', 1, 1, 76.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (281, '202512071746', 'L758', 1, 4, 21, NULL, '小磊', '15800000021', '6栋530', '2025-12-07 17:28:21', '2025-12-07 17:28:51', 1, 1, 49.64, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (282, '202512074655', 'J406', 1, 4, 21, NULL, '小磊', '15800000021', '12栋367', '2025-12-07 15:31:27', '2025-12-07 15:31:57', 2, 1, 48.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (283, '202512077143', 'D538', 1, 4, 22, NULL, '小雪', '15800000022', '4栋506', '2025-12-07 08:53:16', '2025-12-07 08:53:46', 1, 1, 53.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (284, '202512070489', 'G057', 1, 4, 12, NULL, '小红', '15800000012', '7栋427', '2025-12-07 11:20:57', '2025-12-07 11:21:27', 2, 1, 76.27, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (285, '202512071415', 'M026', 1, 4, 19, NULL, '小军', '15800000019', '8栋211', '2025-12-07 07:56:37', '2025-12-07 07:57:07', 1, 1, 79.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (286, '202512078865', 'T054', 1, 4, 12, NULL, '小红', '15800000012', '1栋124', '2025-12-07 18:39:30', '2025-12-07 18:40:00', 1, 1, 43.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (287, '202512076356', 'L228', 1, 4, 21, NULL, '小磊', '15800000021', '11栋413', '2025-12-07 18:55:18', '2025-12-07 18:55:48', 2, 1, 70.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (288, '202512077155', 'M232', 1, 4, 23, NULL, '小峰', '15800000023', '9栋590', '2025-12-07 07:26:33', '2025-12-07 07:27:03', 2, 1, 50.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (289, '202512070825', 'L927', 1, 4, 10, NULL, '林老师', '15800000010', '5栋546', '2025-12-07 11:14:12', '2025-12-07 11:14:42', 1, 1, 54.60, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (290, '202512077462', 'S403', 1, 4, 12, NULL, '小红', '15800000012', '11栋582', '2025-12-07 11:20:46', '2025-12-07 11:21:16', 1, 1, 60.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (291, '202512078104', 'K516', 1, 4, 11, NULL, '小明', '15800000011', '6栋366', '2025-12-07 18:32:23', '2025-12-07 18:32:53', 1, 1, 46.15, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (292, '202512075784', 'S917', 1, 4, 1, NULL, '张三', '15800000001', '5栋216', '2025-12-07 16:22:07', '2025-12-07 16:22:37', 2, 1, 26.45, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (293, '202512076605', 'M500', 1, 5, 13, NULL, '小刚', '15800000013', '1栋391', '2025-12-07 14:49:43', '2025-12-07 14:50:13', 2, 1, 50.54, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (294, '202512070662', 'P690', 1, 5, 11, NULL, '小明', '15800000011', '9栋365', '2025-12-07 18:55:52', '2025-12-07 18:56:22', 1, 1, 71.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (295, '202512065597', 'R756', 1, 4, 24, NULL, '小云', '15800000024', '9栋273', '2025-12-06 07:29:03', '2025-12-06 07:29:33', 2, 1, 65.46, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (296, '202512062020', 'Z338', 1, 4, 3, NULL, '王五', '15800000003', '9栋414', '2025-12-06 07:05:33', '2025-12-06 07:06:03', 2, 1, 72.60, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (297, '202512064763', 'A674', 1, 4, 23, NULL, '小峰', '15800000023', '4栋369', '2025-12-06 12:53:53', '2025-12-06 12:54:23', 2, 1, 26.78, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (298, '202512062045', 'P406', 1, 4, 1, NULL, '张三', '15800000001', '3栋546', '2025-12-06 08:48:53', '2025-12-06 08:49:23', 2, 1, 33.66, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (299, '202512063451', 'D645', 1, 4, 18, NULL, '小娟', '15800000018', '10栋183', '2025-12-06 13:53:17', '2025-12-06 13:53:47', 1, 1, 38.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (300, '202512069845', 'A058', 1, 4, 20, NULL, '小燕', '15800000020', '4栋227', '2025-12-06 15:19:19', '2025-12-06 15:19:49', 1, 1, 35.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (301, '202512064911', 'U557', 1, 4, 4, NULL, '赵六', '15800000004', '5栋188', '2025-12-06 09:48:57', '2025-12-06 09:49:27', 2, 1, 37.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (302, '202512060637', 'Y497', 1, 4, 9, NULL, '陈老师', '15800000009', '9栋544', '2025-12-06 12:59:04', '2025-12-06 12:59:34', 1, 1, 40.46, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (303, '202512065450', 'I058', 1, 5, 15, NULL, '小强', '15800000015', '4栋202', '2025-12-06 17:20:32', '2025-12-06 17:21:02', 1, 1, 38.15, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (304, '202512068843', 'Q488', 1, 4, 1, NULL, '张三', '15800000001', '7栋269', '2025-12-06 19:06:22', '2025-12-06 19:06:52', 1, 1, 17.00, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (305, '202512063703', 'G104', 1, 4, 7, NULL, '周九', '15800000007', '10栋423', '2025-12-06 09:38:18', '2025-12-06 09:38:48', 2, 1, 38.87, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (306, '202512063165', 'R485', 1, 5, 14, NULL, '小丽', '15800000014', '5栋290', '2025-12-06 15:12:53', '2025-12-06 15:13:23', 2, 1, 72.13, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (307, '202512060532', 'O689', 1, 4, 19, NULL, '小军', '15800000019', '9栋419', '2025-12-06 10:00:58', '2025-12-06 10:01:28', 2, 1, 74.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (308, '202512069633', 'W524', 1, 4, 7, NULL, '周九', '15800000007', '12栋252', '2025-12-06 15:22:52', '2025-12-06 15:23:22', 2, 1, 19.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (309, '202512066962', 'X357', 1, 4, 5, NULL, '钱七', '15800000005', '2栋363', '2025-12-06 18:14:00', '2025-12-06 18:14:30', 1, 1, 66.63, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (310, '202512065785', 'I818', 1, 4, 5, NULL, '钱七', '15800000005', '2栋276', '2025-12-06 09:31:22', '2025-12-06 09:31:52', 1, 1, 37.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (311, '202512060866', 'E635', 1, 4, 18, NULL, '小娟', '15800000018', '8栋256', '2025-12-06 12:26:03', '2025-12-06 12:26:33', 2, 1, 29.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (312, '202512065064', 'H868', 1, 4, 24, NULL, '小云', '15800000024', '7栋575', '2025-12-06 16:46:15', '2025-12-06 16:46:45', 1, 1, 30.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (313, '202512066629', 'X529', 1, 4, 5, NULL, '钱七', '15800000005', '12栋151', '2025-12-06 13:06:58', '2025-12-06 13:07:28', 2, 1, 28.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (314, '202512057104', 'H312', 1, 4, 15, NULL, '小强', '15800000015', '9栋372', '2025-12-05 16:48:32', '2025-12-05 16:49:02', 2, 1, 49.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (315, '202512050700', 'L036', 1, 4, 12, NULL, '小红', '15800000012', '11栋135', '2025-12-05 19:34:10', '2025-12-05 19:34:40', 2, 1, 15.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (316, '202512050902', 'M071', 1, 4, 5, NULL, '钱七', '15800000005', '12栋369', '2025-12-05 11:15:32', '2025-12-05 11:16:02', 2, 1, 53.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (317, '202512052248', 'D047', 1, 4, 21, NULL, '小磊', '15800000021', '10栋537', '2025-12-05 11:14:47', '2025-12-05 11:15:17', 2, 1, 27.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (318, '202512055225', 'F525', 1, 4, 7, NULL, '周九', '15800000007', '12栋246', '2025-12-05 17:22:29', '2025-12-05 17:22:59', 2, 1, 67.91, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (319, '202512051973', 'D006', 1, 4, 11, NULL, '小明', '15800000011', '9栋269', '2025-12-05 10:45:29', '2025-12-05 10:45:59', 2, 1, 39.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (320, '202512052177', 'I918', 1, 4, 1, NULL, '张三', '15800000001', '8栋352', '2025-12-05 19:01:22', '2025-12-05 19:01:52', 2, 1, 34.81, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (321, '202512058939', 'Y113', 1, 4, 21, NULL, '小磊', '15800000021', '9栋159', '2025-12-05 09:12:50', '2025-12-05 09:13:20', 2, 1, 29.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (322, '202512057750', 'S198', 1, 4, 15, NULL, '小强', '15800000015', '11栋501', '2025-12-05 12:04:22', '2025-12-05 12:04:52', 1, 1, 44.37, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (323, '202512055259', 'V557', 1, 4, 23, NULL, '小峰', '15800000023', '4栋529', '2025-12-05 10:28:48', '2025-12-05 10:29:18', 1, 1, 35.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (324, '202512058744', 'D020', 1, 4, 19, NULL, '小军', '15800000019', '9栋362', '2025-12-05 16:43:22', '2025-12-05 16:43:52', 1, 1, 65.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (325, '202512053634', 'Z726', 1, 4, 14, NULL, '小丽', '15800000014', '9栋376', '2025-12-05 15:01:57', '2025-12-05 15:02:27', 2, 1, 78.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (326, '202512053941', 'A987', 1, 4, 3, NULL, '王五', '15800000003', '11栋214', '2025-12-05 15:23:34', '2025-12-05 15:24:04', 2, 1, 44.48, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (327, '202512055455', 'N967', 1, 5, 11, NULL, '小明', '15800000011', '4栋344', '2025-12-05 16:33:51', '2025-12-05 16:34:21', 2, 1, 52.15, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (328, '202512052482', 'N871', 1, 4, 4, NULL, '赵六', '15800000004', '10栋268', '2025-12-05 14:26:36', '2025-12-05 14:27:06', 1, 1, 52.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (329, '202512054408', 'I332', 1, 5, 15, NULL, '小强', '15800000015', '9栋282', '2025-12-05 10:47:01', '2025-12-05 10:47:31', 2, 1, 75.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (330, '202512055919', 'R539', 1, 4, 8, NULL, '吴十', '15800000008', '9栋562', '2025-12-05 12:37:08', '2025-12-05 12:37:38', 2, 1, 62.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (331, '202512055834', 'E059', 1, 4, 1, NULL, '张三', '15800000001', '10栋541', '2025-12-05 10:16:23', '2025-12-05 10:16:53', 2, 1, 30.81, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (332, '202512057137', 'X473', 1, 4, 5, NULL, '钱七', '15800000005', '8栋388', '2025-12-05 14:07:58', '2025-12-05 14:08:28', 1, 1, 61.21, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (333, '202512053399', 'L264', 1, 4, 14, NULL, '小丽', '15800000014', '12栋584', '2025-12-05 16:43:08', '2025-12-05 16:43:38', 2, 1, 15.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (334, '202512053870', 'H364', 1, 4, 14, NULL, '小丽', '15800000014', '11栋324', '2025-12-05 09:43:50', '2025-12-05 09:44:20', 2, 1, 30.81, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (335, '202512059354', 'F265', 1, 4, 15, NULL, '小强', '15800000015', '9栋413', '2025-12-05 13:20:28', '2025-12-05 13:20:58', 1, 1, 48.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (336, '202512058674', 'Z221', 1, 4, 24, NULL, '小云', '15800000024', '3栋306', '2025-12-05 17:16:52', '2025-12-05 17:17:22', 1, 1, 69.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (337, '202512041552', 'U505', 1, 4, 12, NULL, '小红', '15800000012', '2栋206', '2025-12-04 19:55:22', '2025-12-04 19:55:52', 2, 1, 47.11, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (338, '202512045250', 'T198', 1, 4, 18, NULL, '小娟', '15800000018', '9栋127', '2025-12-04 10:46:20', '2025-12-04 10:46:50', 1, 1, 31.47, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (339, '202512046893', 'U931', 1, 4, 21, NULL, '小磊', '15800000021', '4栋355', '2025-12-04 09:48:11', '2025-12-04 09:48:41', 2, 1, 36.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (340, '202512042963', 'V264', 1, 4, 1, NULL, '张三', '15800000001', '10栋282', '2025-12-04 18:29:15', '2025-12-04 18:29:45', 1, 1, 49.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (341, '202512042959', 'S746', 1, 4, 6, NULL, '孙八', '15800000006', '7栋363', '2025-12-04 18:55:47', '2025-12-04 18:56:17', 2, 1, 34.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (342, '202512047316', 'G031', 1, 4, 15, NULL, '小强', '15800000015', '6栋109', '2025-12-04 17:27:28', '2025-12-04 17:27:58', 2, 1, 20.40, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (343, '202512045125', 'S931', 1, 4, 5, NULL, '钱七', '15800000005', '7栋154', '2025-12-04 15:05:51', '2025-12-04 15:06:21', 2, 1, 58.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (344, '202512046570', 'S500', 1, 4, 15, NULL, '小强', '15800000015', '6栋398', '2025-12-04 18:13:41', '2025-12-04 18:14:11', 2, 1, 68.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (345, '202512041020', 'C152', 1, 4, 24, NULL, '小云', '15800000024', '6栋593', '2025-12-04 13:08:49', '2025-12-04 13:09:19', 1, 1, 39.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (346, '202512048737', 'Z372', 1, 4, 25, NULL, '小龙', '15800000025', '11栋209', '2025-12-04 17:16:20', '2025-12-04 17:16:50', 1, 1, 66.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (347, '202512049106', 'U130', 1, 4, 8, NULL, '吴十', '15800000008', '5栋244', '2025-12-04 19:03:08', '2025-12-04 19:03:38', 1, 1, 34.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (348, '202512044828', 'N152', 1, 4, 23, NULL, '小峰', '15800000023', '3栋375', '2025-12-04 19:32:28', '2025-12-04 19:32:58', 1, 1, 20.95, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (349, '202512042980', 'V231', 1, 4, 13, NULL, '小刚', '15800000013', '9栋458', '2025-12-04 18:32:54', '2025-12-04 18:33:24', 2, 1, 49.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (350, '202512048312', 'V690', 1, 4, 17, NULL, '小伟', '15800000017', '12栋429', '2025-12-04 12:43:05', '2025-12-04 12:43:35', 1, 1, 33.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (351, '202512048023', 'E552', 1, 4, 4, NULL, '赵六', '15800000004', '3栋238', '2025-12-04 10:33:13', '2025-12-04 10:33:43', 2, 1, 34.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (352, '202512037893', 'U502', 1, 4, 18, NULL, '小娟', '15800000018', '3栋323', '2025-12-03 16:24:57', '2025-12-03 16:25:27', 2, 1, 76.90, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (353, '202512036555', 'M487', 1, 4, 1, NULL, '张三', '15800000001', '12栋281', '2025-12-03 10:24:41', '2025-12-03 10:25:11', 2, 1, 48.50, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (354, '202512033202', 'H438', 1, 4, 3, NULL, '王五', '15800000003', '5栋324', '2025-12-03 17:03:38', '2025-12-03 17:04:08', 1, 1, 52.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (355, '202512031482', 'O427', 1, 4, 12, NULL, '小红', '15800000012', '5栋497', '2025-12-03 16:23:23', '2025-12-03 16:23:53', 2, 1, 31.40, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (356, '202512030498', 'G057', 1, 4, 20, NULL, '小燕', '15800000020', '7栋420', '2025-12-03 07:02:04', '2025-12-03 07:02:34', 2, 1, 59.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (357, '202512039606', 'G455', 1, 4, 11, NULL, '小明', '15800000011', '6栋109', '2025-12-03 17:59:20', '2025-12-03 17:59:50', 2, 1, 30.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (358, '202512030044', 'K077', 1, 4, 7, NULL, '周九', '15800000007', '2栋318', '2025-12-03 13:57:04', '2025-12-03 13:57:34', 2, 1, 54.91, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (359, '202512034829', 'U452', 1, 4, 3, NULL, '王五', '15800000003', '12栋234', '2025-12-03 14:04:56', '2025-12-03 14:05:26', 2, 1, 16.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (360, '202512033258', 'O864', 1, 4, 19, NULL, '小军', '15800000019', '8栋357', '2025-12-03 11:35:47', '2025-12-03 11:36:17', 2, 1, 79.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (361, '202512038501', 'O242', 1, 4, 21, NULL, '小磊', '15800000021', '7栋582', '2025-12-03 18:40:00', '2025-12-03 18:40:30', 1, 1, 24.83, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (362, '202512037666', 'I316', 1, 4, 4, NULL, '赵六', '15800000004', '8栋159', '2025-12-03 17:52:40', '2025-12-03 17:53:10', 2, 1, 40.96, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (363, '202512032847', 'B423', 1, 4, 9, NULL, '陈老师', '15800000009', '12栋348', '2025-12-03 12:55:41', '2025-12-03 12:56:11', 2, 1, 56.11, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (364, '202512032906', 'W481', 1, 4, 22, NULL, '小雪', '15800000022', '10栋375', '2025-12-03 18:11:27', '2025-12-03 18:11:57', 1, 1, 22.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (365, '202512038543', 'X029', 1, 4, 17, NULL, '小伟', '15800000017', '5栋532', '2025-12-03 12:52:00', '2025-12-03 12:52:30', 1, 1, 25.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (366, '202512032750', 'N703', 1, 4, 5, NULL, '钱七', '15800000005', '1栋552', '2025-12-03 15:06:06', '2025-12-03 15:06:36', 2, 1, 71.32, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (367, '202512034361', 'N203', 1, 4, 2, NULL, '李四', '15800000002', '7栋571', '2025-12-03 09:56:23', '2025-12-03 09:56:53', 1, 1, 20.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (368, '202512035966', 'W588', 1, 4, 20, NULL, '小燕', '15800000020', '4栋514', '2025-12-03 16:07:56', '2025-12-03 16:08:26', 1, 1, 43.95, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (369, '202512030316', 'L036', 1, 4, 16, NULL, '小芳', '15800000016', '11栋305', '2025-12-03 14:30:15', '2025-12-03 14:30:45', 1, 1, 47.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (370, '202512032246', 'K406', 1, 4, 18, NULL, '小娟', '15800000018', '10栋456', '2025-12-03 14:23:52', '2025-12-03 14:24:22', 1, 1, 73.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (371, '202512034581', 'K555', 1, 4, 11, NULL, '小明', '15800000011', '8栋319', '2025-12-03 10:55:15', '2025-12-03 10:55:45', 1, 1, 37.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (372, '202512033689', 'O715', 1, 4, 14, NULL, '小丽', '15800000014', '11栋247', '2025-12-03 08:12:50', '2025-12-03 08:13:20', 2, 1, 24.91, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (373, '202512024182', 'V939', 1, 4, 5, NULL, '钱七', '15800000005', '3栋151', '2025-12-02 16:45:39', '2025-12-02 16:46:09', 2, 1, 47.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (374, '202512022954', 'Z933', 1, 4, 2, NULL, '李四', '15800000002', '10栋149', '2025-12-02 09:13:28', '2025-12-02 09:13:58', 1, 1, 45.19, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (375, '202512024107', 'D436', 1, 4, 14, NULL, '小丽', '15800000014', '10栋399', '2025-12-02 10:59:11', '2025-12-02 10:59:41', 2, 1, 44.52, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (376, '202512026132', 'P232', 1, 4, 22, NULL, '小雪', '15800000022', '4栋549', '2025-12-02 17:37:34', '2025-12-02 17:38:04', 2, 1, 15.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (377, '202512024024', 'X257', 1, 5, 25, NULL, '小龙', '15800000025', '8栋238', '2025-12-02 16:11:02', '2025-12-02 16:11:32', 2, 1, 75.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (378, '202512027910', 'X232', 1, 5, 2, NULL, '李四', '15800000002', '5栋254', '2025-12-02 11:28:53', '2025-12-02 11:29:23', 1, 1, 65.48, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (379, '202512026088', 'S776', 1, 4, 9, NULL, '陈老师', '15800000009', '9栋248', '2025-12-02 17:04:06', '2025-12-02 17:04:36', 1, 1, 55.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (380, '202512024719', 'K579', 1, 4, 22, NULL, '小雪', '15800000022', '9栋488', '2025-12-02 19:49:49', '2025-12-02 19:50:19', 2, 1, 50.26, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (381, '202512024282', 'T540', 1, 5, 11, NULL, '小明', '15800000011', '5栋308', '2025-12-02 17:17:48', '2025-12-02 17:18:18', 2, 1, 19.48, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (382, '202512023556', 'X512', 1, 4, 14, NULL, '小丽', '15800000014', '10栋373', '2025-12-02 10:44:15', '2025-12-02 10:44:45', 1, 1, 65.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (383, '202512026729', 'G140', 1, 4, 15, NULL, '小强', '15800000015', '1栋406', '2025-12-02 07:34:37', '2025-12-02 07:35:07', 1, 1, 39.45, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (384, '202512023466', 'O786', 1, 4, 17, NULL, '小伟', '15800000017', '3栋515', '2025-12-02 16:23:38', '2025-12-02 16:24:08', 1, 1, 60.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (385, '202512027497', 'Y502', 1, 4, 9, NULL, '陈老师', '15800000009', '8栋500', '2025-12-02 10:27:41', '2025-12-02 10:28:11', 1, 1, 59.51, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (386, '202512016922', 'W213', 1, 4, 18, NULL, '小娟', '15800000018', '6栋511', '2025-12-01 09:36:57', '2025-12-01 09:37:27', 2, 1, 62.47, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (387, '202512011953', 'X016', 1, 4, 14, NULL, '小丽', '15800000014', '4栋379', '2025-12-01 07:14:36', '2025-12-01 07:15:06', 2, 1, 45.55, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (388, '202512013046', 'T807', 1, 4, 5, NULL, '钱七', '15800000005', '10栋410', '2025-12-01 19:02:28', '2025-12-01 19:02:58', 2, 1, 48.32, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (389, '202512010015', 'W293', 1, 4, 15, NULL, '小强', '15800000015', '11栋386', '2025-12-01 16:18:29', '2025-12-01 16:18:59', 1, 1, 29.88, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (390, '202512017260', 'M164', 1, 5, 7, NULL, '周九', '15800000007', '6栋400', '2025-12-01 12:02:08', '2025-12-01 12:02:38', 2, 1, 76.78, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (391, '202512012095', 'X950', 1, 4, 23, NULL, '小峰', '15800000023', '1栋192', '2025-12-01 16:14:17', '2025-12-01 16:14:47', 2, 1, 77.83, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (392, '202512018348', 'H986', 1, 5, 18, NULL, '小娟', '15800000018', '1栋227', '2025-12-01 15:07:48', '2025-12-01 15:08:18', 1, 1, 77.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (393, '202512013792', 'X308', 1, 5, 21, NULL, '小磊', '15800000021', '11栋325', '2025-12-01 07:01:53', '2025-12-01 07:02:23', 2, 1, 66.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (394, '202512013476', 'Z919', 1, 4, 13, NULL, '小刚', '15800000013', '8栋282', '2025-12-01 18:53:49', '2025-12-01 18:54:19', 2, 1, 57.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (395, '202512013032', 'Q352', 1, 4, 22, NULL, '小雪', '15800000022', '10栋590', '2025-12-01 15:04:34', '2025-12-01 15:05:04', 1, 1, 44.68, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (396, '202512017885', 'E420', 1, 4, 22, NULL, '小雪', '15800000022', '8栋553', '2025-12-01 19:04:16', '2025-12-01 19:04:46', 2, 1, 43.11, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (397, '202512016222', 'Z099', 1, 4, 13, NULL, '小刚', '15800000013', '7栋242', '2025-12-01 11:50:45', '2025-12-01 11:51:15', 2, 1, 48.82, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (398, '202512012593', 'X736', 1, 4, 8, NULL, '吴十', '15800000008', '12栋439', '2025-12-01 08:42:22', '2025-12-01 08:42:52', 1, 1, 32.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (399, '202512018150', 'Z513', 1, 4, 19, NULL, '小军', '15800000019', '8栋314', '2025-12-01 07:21:48', '2025-12-01 07:22:18', 1, 1, 47.96, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (400, '202512012956', 'Y883', 1, 4, 5, NULL, '钱七', '15800000005', '7栋173', '2025-12-01 09:16:18', '2025-12-01 09:16:48', 1, 1, 69.41, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (401, '202512014896', 'A591', 1, 4, 15, NULL, '小强', '15800000015', '12栋523', '2025-12-01 08:53:23', '2025-12-01 08:53:53', 1, 1, 65.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (402, '202512011102', 'U680', 1, 5, 14, NULL, '小丽', '15800000014', '12栋572', '2025-12-01 18:54:46', '2025-12-01 18:55:16', 2, 1, 68.84, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (403, '202512012689', 'Y927', 1, 4, 19, NULL, '小军', '15800000019', '10栋209', '2025-12-01 13:03:28', '2025-12-01 13:03:58', 2, 1, 66.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (404, '202512017269', 'D576', 1, 4, 14, NULL, '小丽', '15800000014', '6栋314', '2025-12-01 09:05:42', '2025-12-01 09:06:12', 2, 1, 78.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (405, '202512013751', 'C298', 1, 5, 5, NULL, '钱七', '15800000005', '3栋250', '2025-12-01 19:05:43', '2025-12-01 19:06:13', 2, 1, 16.64, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (406, '202512012288', 'Z259', 1, 5, 18, NULL, '小娟', '15800000018', '4栋539', '2025-12-01 07:40:19', '2025-12-01 07:40:49', 1, 1, 37.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (407, '202512016704', 'V031', 1, 4, 4, NULL, '赵六', '15800000004', '9栋384', '2025-12-01 09:21:24', '2025-12-01 09:21:54', 2, 1, 48.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (408, '202512017877', 'A804', 1, 5, 16, NULL, '小芳', '15800000016', '12栋210', '2025-12-01 10:55:21', '2025-12-01 10:55:51', 1, 1, 75.31, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (409, '202512011004', 'E656', 1, 4, 7, NULL, '周九', '15800000007', '9栋394', '2025-12-01 08:20:43', '2025-12-01 08:21:13', 2, 1, 32.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (410, '202511300160', 'S431', 1, 4, 24, NULL, '小云', '15800000024', '1栋133', '2025-11-30 12:59:56', '2025-11-30 13:00:26', 1, 1, 40.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (411, '202511305940', 'Q415', 1, 4, 25, NULL, '小龙', '15800000025', '2栋379', '2025-11-30 17:05:58', '2025-11-30 17:06:28', 1, 1, 72.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (412, '202511303975', 'D520', 1, 4, 13, NULL, '小刚', '15800000013', '3栋263', '2025-11-30 19:19:42', '2025-11-30 19:20:12', 1, 1, 47.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (413, '202511303377', 'J768', 1, 4, 24, NULL, '小云', '15800000024', '10栋387', '2025-11-30 12:46:27', '2025-11-30 12:46:57', 2, 1, 79.94, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (414, '202511308140', 'U535', 1, 4, 13, NULL, '小刚', '15800000013', '4栋526', '2025-11-30 16:51:32', '2025-11-30 16:52:02', 1, 1, 39.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (415, '202511309043', 'F398', 1, 4, 19, NULL, '小军', '15800000019', '4栋315', '2025-11-30 08:17:58', '2025-11-30 08:18:28', 1, 1, 55.26, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (416, '202511308482', 'H961', 1, 4, 10, NULL, '林老师', '15800000010', '11栋424', '2025-11-30 15:24:26', '2025-11-30 15:24:56', 2, 1, 57.91, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (417, '202511306703', 'R448', 1, 4, 20, NULL, '小燕', '15800000020', '3栋344', '2025-11-30 18:31:39', '2025-11-30 18:32:09', 2, 1, 30.58, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (418, '202511308950', 'Q491', 1, 4, 22, NULL, '小雪', '15800000022', '7栋249', '2025-11-30 14:58:27', '2025-11-30 14:58:57', 2, 1, 31.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (419, '202511303809', 'Q013', 1, 4, 7, NULL, '周九', '15800000007', '3栋509', '2025-11-30 08:11:10', '2025-11-30 08:11:40', 2, 1, 44.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (420, '202511306223', 'U093', 1, 4, 18, NULL, '小娟', '15800000018', '2栋184', '2025-11-30 17:03:12', '2025-11-30 17:03:42', 2, 1, 39.83, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (421, '202511302816', 'I790', 1, 4, 10, NULL, '林老师', '15800000010', '12栋346', '2025-11-30 16:01:06', '2025-11-30 16:01:36', 2, 1, 31.64, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (422, '202511302035', 'O153', 1, 4, 22, NULL, '小雪', '15800000022', '2栋148', '2025-11-30 09:00:51', '2025-11-30 09:01:21', 1, 1, 43.93, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (423, '202511305826', 'U123', 1, 4, 15, NULL, '小强', '15800000015', '4栋153', '2025-11-30 07:36:09', '2025-11-30 07:36:39', 2, 1, 74.43, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (424, '202511309834', 'Z992', 1, 4, 14, NULL, '小丽', '15800000014', '1栋115', '2025-11-30 19:41:26', '2025-11-30 19:41:56', 1, 1, 57.43, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (425, '202511300775', 'N419', 1, 4, 16, NULL, '小芳', '15800000016', '7栋243', '2025-11-30 19:22:50', '2025-11-30 19:23:20', 2, 1, 59.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (426, '202511300178', 'D709', 1, 4, 1, NULL, '张三', '15800000001', '2栋264', '2025-11-30 19:43:27', '2025-11-30 19:43:57', 1, 1, 72.00, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (427, '202511308900', 'H849', 1, 4, 22, NULL, '小雪', '15800000022', '5栋170', '2025-11-30 07:38:09', '2025-11-30 07:38:39', 2, 1, 17.45, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (428, '202511301792', 'M831', 1, 4, 15, NULL, '小强', '15800000015', '9栋202', '2025-11-30 17:29:50', '2025-11-30 17:30:20', 2, 1, 40.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (429, '202511304618', 'A783', 1, 4, 10, NULL, '林老师', '15800000010', '10栋476', '2025-11-30 08:11:33', '2025-11-30 08:12:03', 1, 1, 30.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (430, '202511304477', 'J468', 1, 4, 3, NULL, '王五', '15800000003', '4栋538', '2025-11-30 10:47:56', '2025-11-30 10:48:26', 2, 1, 44.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (431, '202511300132', 'W210', 1, 4, 5, NULL, '钱七', '15800000005', '7栋540', '2025-11-30 07:56:09', '2025-11-30 07:56:39', 2, 1, 69.99, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (432, '202511300158', 'M318', 1, 4, 9, NULL, '陈老师', '15800000009', '3栋561', '2025-11-30 13:57:30', '2025-11-30 13:58:00', 1, 1, 58.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (433, '202511291151', 'E435', 1, 4, 8, NULL, '吴十', '15800000008', '9栋223', '2025-11-29 13:09:06', '2025-11-29 13:09:36', 1, 1, 65.77, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (434, '202511295186', 'J232', 1, 5, 3, NULL, '王五', '15800000003', '2栋476', '2025-11-29 12:21:14', '2025-11-29 12:21:44', 1, 1, 28.10, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (435, '202511298237', 'V578', 1, 4, 10, NULL, '林老师', '15800000010', '6栋394', '2025-11-29 17:00:20', '2025-11-29 17:00:50', 2, 1, 77.48, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (436, '202511294165', 'W035', 1, 4, 18, NULL, '小娟', '15800000018', '8栋558', '2025-11-29 16:38:45', '2025-11-29 16:39:15', 2, 1, 21.81, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (437, '202511295763', 'U136', 1, 4, 1, NULL, '张三', '15800000001', '5栋307', '2025-11-29 11:48:15', '2025-11-29 11:48:45', 2, 1, 56.73, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (438, '202511294565', 'L883', 1, 4, 17, NULL, '小伟', '15800000017', '1栋444', '2025-11-29 19:16:23', '2025-11-29 19:16:53', 1, 1, 23.74, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (439, '202511290307', 'S454', 1, 4, 17, NULL, '小伟', '15800000017', '2栋278', '2025-11-29 08:55:35', '2025-11-29 08:56:05', 1, 1, 60.86, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (440, '202511293822', 'O568', 1, 4, 22, NULL, '小雪', '15800000022', '3栋285', '2025-11-29 12:55:47', '2025-11-29 12:56:17', 1, 1, 75.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (441, '202511290887', 'A810', 1, 4, 12, NULL, '小红', '15800000012', '1栋411', '2025-11-29 13:11:19', '2025-11-29 13:11:49', 1, 1, 49.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (442, '202511296549', 'V245', 1, 4, 16, NULL, '小芳', '15800000016', '9栋482', '2025-11-29 08:52:36', '2025-11-29 08:53:06', 2, 1, 37.33, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (443, '202511299567', 'G339', 1, 4, 3, NULL, '王五', '15800000003', '12栋525', '2025-11-29 09:20:54', '2025-11-29 09:21:24', 1, 1, 22.64, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (444, '202511293982', 'Z692', 1, 4, 6, NULL, '孙八', '15800000006', '7栋389', '2025-11-29 07:03:39', '2025-11-29 07:04:09', 1, 1, 64.44, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (445, '202511296143', 'W424', 1, 5, 22, NULL, '小雪', '15800000022', '7栋374', '2025-11-29 07:56:46', '2025-11-29 07:57:16', 1, 1, 55.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (446, '202511289576', 'A258', 1, 4, 23, NULL, '小峰', '15800000023', '3栋252', '2025-11-28 14:38:09', '2025-11-28 14:38:39', 2, 1, 45.18, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (447, '202511286091', 'W509', 1, 4, 13, NULL, '小刚', '15800000013', '12栋204', '2025-11-28 16:26:22', '2025-11-28 16:26:52', 1, 1, 39.00, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (448, '202511283180', 'Q278', 1, 4, 4, NULL, '赵六', '15800000004', '6栋316', '2025-11-28 11:05:20', '2025-11-28 11:05:50', 2, 1, 62.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (449, '202511282227', 'P298', 1, 4, 13, NULL, '小刚', '15800000013', '9栋435', '2025-11-28 13:35:17', '2025-11-28 13:35:47', 1, 1, 18.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (450, '202511286405', 'R409', 1, 4, 23, NULL, '小峰', '15800000023', '1栋111', '2025-11-28 17:59:35', '2025-11-28 18:00:05', 2, 1, 64.52, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (451, '202511280367', 'K989', 1, 4, 15, NULL, '小强', '15800000015', '9栋348', '2025-11-28 10:18:28', '2025-11-28 10:18:58', 1, 1, 50.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (452, '202511284074', 'R157', 1, 4, 9, NULL, '陈老师', '15800000009', '10栋264', '2025-11-28 17:14:00', '2025-11-28 17:14:30', 1, 1, 70.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (453, '202511289988', 'M440', 1, 4, 20, NULL, '小燕', '15800000020', '9栋293', '2025-11-28 17:51:54', '2025-11-28 17:52:24', 2, 1, 39.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (454, '202511288882', 'I957', 1, 4, 24, NULL, '小云', '15800000024', '10栋210', '2025-11-28 16:10:23', '2025-11-28 16:10:53', 2, 1, 51.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (455, '202511285478', 'L523', 1, 4, 14, NULL, '小丽', '15800000014', '4栋109', '2025-11-28 16:59:32', '2025-11-28 17:00:02', 1, 1, 56.55, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (456, '202511280903', 'Q821', 1, 4, 22, NULL, '小雪', '15800000022', '4栋508', '2025-11-28 14:56:35', '2025-11-28 14:57:05', 1, 1, 23.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (457, '202511284970', 'E354', 1, 5, 9, NULL, '陈老师', '15800000009', '4栋234', '2025-11-28 12:42:10', '2025-11-28 12:42:40', 2, 1, 74.35, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (458, '202511286254', 'W525', 1, 4, 11, NULL, '小明', '15800000011', '12栋282', '2025-11-28 12:24:17', '2025-11-28 12:24:47', 2, 1, 28.79, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (459, '202511284965', 'F654', 1, 4, 3, NULL, '王五', '15800000003', '8栋585', '2025-11-28 12:26:05', '2025-11-28 12:26:35', 1, 1, 51.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (460, '202511288176', 'A568', 1, 4, 9, NULL, '陈老师', '15800000009', '10栋324', '2025-11-28 11:41:55', '2025-11-28 11:42:25', 2, 1, 42.45, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (461, '202511277890', 'L799', 1, 4, 18, NULL, '小娟', '15800000018', '9栋152', '2025-11-27 17:53:11', '2025-11-27 17:53:41', 1, 1, 65.37, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (462, '202511272102', 'R694', 1, 4, 1, NULL, '张三', '15800000001', '6栋262', '2025-11-27 08:40:24', '2025-11-27 08:40:54', 1, 1, 74.76, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (463, '202511273367', 'Z835', 1, 4, 7, NULL, '周九', '15800000007', '4栋533', '2025-11-27 14:25:48', '2025-11-27 14:26:18', 2, 1, 76.78, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (464, '202511271249', 'C018', 1, 4, 10, NULL, '林老师', '15800000010', '11栋209', '2025-11-27 18:02:01', '2025-11-27 18:02:31', 2, 1, 79.20, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (465, '202511275172', 'V557', 1, 4, 13, NULL, '小刚', '15800000013', '4栋575', '2025-11-27 18:58:43', '2025-11-27 18:59:13', 2, 1, 18.16, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (466, '202511275381', 'E261', 1, 4, 20, NULL, '小燕', '15800000020', '10栋164', '2025-11-27 13:34:07', '2025-11-27 13:34:37', 1, 1, 21.62, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (467, '202511272511', 'D893', 1, 2, 20, NULL, '小燕', '15800000020', '1栋466', '2025-11-27 07:32:52', '2025-11-27 07:33:22', 1, 1, 72.03, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (468, '202511271615', 'S032', 1, 4, 16, NULL, '小芳', '15800000016', '1栋178', '2025-11-27 16:07:09', '2025-11-27 16:07:39', 2, 1, 60.07, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (469, '202511273328', 'E832', 1, 4, 19, NULL, '小军', '15800000019', '9栋521', '2025-11-27 13:29:28', '2025-11-27 13:29:58', 1, 1, 49.01, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (470, '202511272205', 'O088', 1, 4, 15, NULL, '小强', '15800000015', '10栋450', '2025-11-27 09:23:40', '2025-11-27 09:24:10', 1, 1, 47.87, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (471, '202511276185', 'O906', 1, 4, 12, NULL, '小红', '15800000012', '11栋436', '2025-11-27 09:20:28', '2025-11-27 09:20:58', 2, 1, 56.36, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (472, '202511272936', 'G374', 1, 4, 8, NULL, '吴十', '15800000008', '2栋340', '2025-11-27 07:56:31', '2025-11-27 07:57:01', 1, 1, 63.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (473, '202511276875', 'M288', 1, 4, 3, NULL, '王五', '15800000003', '1栋252', '2025-11-27 15:31:35', '2025-11-27 15:32:05', 1, 1, 26.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (474, '202511276561', 'U020', 1, 5, 16, NULL, '小芳', '15800000016', '9栋344', '2025-11-27 13:25:39', '2025-11-27 13:26:09', 1, 1, 21.26, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (475, '202511275378', 'Z355', 1, 4, 5, NULL, '钱七', '15800000005', '10栋559', '2025-11-27 10:00:48', '2025-11-27 10:01:18', 1, 1, 31.17, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (476, '202511268267', 'F598', 1, 4, 16, NULL, '小芳', '15800000016', '5栋571', '2025-11-26 15:18:45', '2025-11-26 15:19:15', 2, 1, 49.92, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (477, '202511266364', 'K179', 1, 4, 5, NULL, '钱七', '15800000005', '8栋444', '2025-11-26 10:18:48', '2025-11-26 10:19:18', 2, 1, 44.97, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (478, '202511260616', 'J695', 1, 4, 5, NULL, '钱七', '15800000005', '5栋432', '2025-11-26 15:22:20', '2025-11-26 15:22:50', 1, 1, 40.15, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (479, '202511260337', 'A049', 1, 4, 21, NULL, '小磊', '15800000021', '2栋413', '2025-11-26 16:16:06', '2025-11-26 16:16:36', 2, 1, 46.61, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (480, '202511265204', 'F518', 1, 4, 18, NULL, '小娟', '15800000018', '12栋189', '2025-11-26 13:00:26', '2025-11-26 13:00:56', 1, 1, 61.36, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (481, '202511264075', 'E598', 1, 4, 23, NULL, '小峰', '15800000023', '7栋456', '2025-11-26 10:47:05', '2025-11-26 10:47:35', 1, 1, 25.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (482, '202511269907', 'C598', 1, 4, 1, NULL, '张三', '15800000001', '8栋329', '2025-11-26 19:18:25', '2025-11-26 19:18:55', 1, 1, 35.59, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (483, '202511262327', 'Z289', 1, 4, 22, NULL, '小雪', '15800000022', '6栋301', '2025-11-26 12:03:16', '2025-11-26 12:03:46', 2, 1, 18.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (484, '202511263852', 'J589', 1, 2, 18, NULL, '小娟', '15800000018', '11栋471', '2025-11-26 18:10:02', '2025-11-26 18:10:32', 1, 1, 66.97, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (485, '202511265653', 'F441', 1, 4, 16, NULL, '小芳', '15800000016', '7栋254', '2025-11-26 13:55:47', '2025-11-26 13:56:17', 2, 1, 72.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (486, '202511266161', 'U009', 1, 4, 23, NULL, '小峰', '15800000023', '9栋420', '2025-11-26 17:00:25', '2025-11-26 17:00:55', 1, 1, 21.67, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (487, '202511263787', 'J683', 1, 4, 23, NULL, '小峰', '15800000023', '4栋391', '2025-11-26 09:17:46', '2025-11-26 09:18:16', 2, 1, 75.30, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (488, '202511267267', 'N432', 1, 5, 7, NULL, '周九', '15800000007', '8栋440', '2025-11-26 07:28:59', '2025-11-26 07:29:29', 2, 1, 17.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (489, '202511262268', 'B521', 1, 4, 9, NULL, '陈老师', '15800000009', '6栋541', '2025-11-26 11:44:22', '2025-11-26 11:44:52', 2, 1, 18.85, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (490, '202511261267', 'S084', 1, 4, 21, NULL, '小磊', '15800000021', '5栋333', '2025-11-26 15:24:34', '2025-11-26 15:25:04', 1, 1, 21.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (491, '202511268492', 'M923', 1, 4, 17, NULL, '小伟', '15800000017', '2栋559', '2025-11-26 18:55:37', '2025-11-26 18:56:07', 1, 1, 24.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (492, '202511251754', 'Q705', 1, 4, 5, NULL, '钱七', '15800000005', '8栋517', '2025-11-25 12:20:00', '2025-11-25 12:20:30', 1, 1, 49.09, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (493, '202511253972', 'X318', 1, 4, 1, NULL, '张三', '15800000001', '11栋338', '2025-11-25 11:41:53', '2025-11-25 11:42:23', 2, 1, 26.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (494, '202511251417', 'Y272', 1, 5, 21, NULL, '小磊', '15800000021', '7栋550', '2025-11-25 19:00:01', '2025-11-25 19:00:31', 2, 1, 57.57, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (495, '202511255666', 'K246', 1, 4, 22, NULL, '小雪', '15800000022', '1栋396', '2025-11-25 17:35:27', '2025-11-25 17:35:57', 2, 1, 17.76, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (496, '202511257306', 'G971', 1, 4, 7, NULL, '周九', '15800000007', '2栋550', '2025-11-25 08:49:20', '2025-11-25 08:49:50', 1, 1, 38.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (497, '202511254778', 'X029', 1, 4, 15, NULL, '小强', '15800000015', '6栋233', '2025-11-25 17:49:07', '2025-11-25 17:49:37', 2, 1, 68.23, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (498, '202511255259', 'V486', 1, 4, 3, NULL, '王五', '15800000003', '12栋359', '2025-11-25 19:12:22', '2025-11-25 19:12:52', 2, 1, 46.80, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (499, '202511256729', 'V023', 1, 4, 25, NULL, '小龙', '15800000025', '9栋296', '2025-11-25 09:24:41', '2025-11-25 09:25:11', 2, 1, 32.57, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (500, '202511251919', 'T208', 1, 4, 22, NULL, '小雪', '15800000022', '10栋215', '2025-11-25 16:32:46', '2025-11-25 16:33:16', 2, 1, 49.24, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (501, '202511254367', 'M011', 1, 4, 20, NULL, '小燕', '15800000020', '8栋240', '2025-11-25 14:27:04', '2025-11-25 14:27:34', 1, 1, 31.14, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (502, '202511256765', 'A015', 1, 4, 24, NULL, '小云', '15800000024', '1栋206', '2025-11-25 12:57:13', '2025-11-25 12:57:43', 2, 1, 73.22, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (503, '202511257685', 'X301', 1, 4, 3, NULL, '王五', '15800000003', '9栋511', '2025-11-25 10:59:35', '2025-11-25 11:00:05', 2, 1, 75.27, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (504, '202511250305', 'J663', 1, 4, 9, NULL, '陈老师', '15800000009', '4栋268', '2025-11-25 10:28:26', '2025-11-25 10:28:56', 2, 1, 43.25, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (505, '202511253979', 'T592', 1, 4, 25, NULL, '小龙', '15800000025', '9栋441', '2025-11-25 12:20:30', '2025-11-25 12:21:00', 1, 1, 56.29, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (506, '202511255775', 'V306', 1, 4, 21, NULL, '小磊', '15800000021', '2栋411', '2025-11-25 07:20:48', '2025-11-25 07:21:18', 2, 1, 20.56, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (507, '202511254984', 'Z468', 1, 5, 14, NULL, '小丽', '15800000014', '5栋308', '2025-11-25 17:49:56', '2025-11-25 17:50:26', 2, 1, 61.39, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (508, '202511251603', 'L673', 1, 4, 13, NULL, '小刚', '15800000013', '1栋286', '2025-11-25 17:16:21', '2025-11-25 17:16:51', 2, 1, 17.02, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (509, '202511255523', 'S870', 1, 4, 20, NULL, '小燕', '15800000020', '3栋387', '2025-11-25 15:54:42', '2025-11-25 15:55:12', 1, 1, 21.49, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (510, '202511248059', 'T388', 1, 4, 7, NULL, '周九', '15800000007', '8栋163', '2025-11-24 12:29:51', '2025-11-24 12:30:21', 2, 1, 74.34, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (511, '202511249917', 'J769', 1, 4, 17, NULL, '小伟', '15800000017', '10栋458', '2025-11-24 18:18:33', '2025-11-24 18:19:03', 1, 1, 59.98, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (512, '202511244852', 'R839', 1, 5, 14, NULL, '小丽', '15800000014', '3栋402', '2025-11-24 10:19:28', '2025-11-24 10:19:58', 1, 1, 75.52, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (513, '202511244001', 'B991', 1, 4, 20, NULL, '小燕', '15800000020', '11栋224', '2025-11-24 19:50:10', '2025-11-24 19:50:40', 2, 1, 66.48, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (514, '202511248551', 'N114', 1, 4, 22, NULL, '小雪', '15800000022', '12栋337', '2025-11-24 10:12:26', '2025-11-24 10:12:56', 1, 1, 79.71, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (515, '202511248247', 'Q693', 1, 4, 4, NULL, '赵六', '15800000004', '7栋481', '2025-11-24 13:27:33', '2025-11-24 13:28:03', 1, 1, 31.91, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (516, '202511246144', 'B431', 1, 4, 2, NULL, '李四', '15800000002', '12栋433', '2025-11-24 15:44:37', '2025-11-24 15:45:07', 1, 1, 66.84, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (517, '202511249445', 'H629', 1, 4, 9, NULL, '陈老师', '15800000009', '4栋338', '2025-11-24 08:51:53', '2025-11-24 08:52:23', 2, 1, 39.11, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (518, '202511242516', 'S722', 1, 4, 11, NULL, '小明', '15800000011', '7栋336', '2025-11-24 09:26:20', '2025-11-24 09:26:50', 2, 1, 45.40, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (519, '202511240039', 'F062', 1, 4, 6, NULL, '孙八', '15800000006', '9栋177', '2025-11-24 10:29:15', '2025-11-24 10:29:45', 2, 1, 39.75, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (520, '202511240171', 'D605', 1, 4, 24, NULL, '小云', '15800000024', '8栋285', '2025-11-24 15:28:04', '2025-11-24 15:28:34', 2, 1, 52.65, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (521, '202511245629', 'L509', 1, 4, 11, NULL, '小明', '15800000011', '3栋416', '2025-11-24 12:57:29', '2025-11-24 12:57:59', 1, 1, 42.90, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (522, '202511247477', 'S343', 1, 5, 1, NULL, '张三', '15800000001', '7栋503', '2025-11-24 07:05:36', '2025-11-24 07:06:06', 1, 1, 30.20, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (523, '202511245365', 'N049', 1, 4, 11, NULL, '小明', '15800000011', '8栋154', '2025-11-24 16:19:15', '2025-11-24 16:19:45', 2, 1, 56.60, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (524, '202511249970', 'P892', 1, 5, 23, NULL, '小峰', '15800000023', '9栋104', '2025-11-24 13:06:15', '2025-11-24 13:06:45', 2, 1, 23.18, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (525, '202511240966', 'L969', 1, 4, 10, NULL, '林老师', '15800000010', '6栋382', '2025-11-24 15:48:04', '2025-11-24 15:48:34', 1, 1, 79.57, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (526, '202511244435', 'R942', 1, 4, 8, NULL, '吴十', '15800000008', '10栋567', '2025-11-24 13:46:22', '2025-11-24 13:46:52', 1, 1, 33.51, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (527, '202511249149', 'Y988', 1, 4, 15, NULL, '小强', '15800000015', '2栋382', '2025-11-24 14:03:24', '2025-11-24 14:03:54', 2, 1, 69.13, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (528, '202511245873', 'J124', 1, 4, 12, NULL, '小红', '15800000012', '6栋137', '2025-11-24 13:45:31', '2025-11-24 13:46:01', 2, 1, 35.21, 6.00, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (531, '1766451327424', '7324', 1, 5, 71, 58, 'aee', '17613761018', 'asdasd', '2025-12-23 08:55:27', NULL, 1, 0, 16.00, 6.00, '', '用户取消', '2025-12-23 09:00:35', NULL);
INSERT INTO `orders` VALUES (532, '1766451659198', '2719', 1, 2, 71, 58, 'aee', '17613761018', 'asdasd', '2025-12-23 09:00:59', '2025-12-23 09:00:59', 1, 1, 16.00, 6.00, '', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (533, '1766451762884', '0588', 1, 2, 71, 58, 'aee', '17613761018', 'asdasd', '2025-12-23 09:02:43', '2025-12-23 09:02:43', 1, 1, 22.00, 6.00, '', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (534, '1766453062749', '1595', 1, 5, 71, 58, 'aee', '17613761018', 'asdasd', '2025-12-23 09:24:23', '2025-12-23 09:24:23', 1, 2, 22.00, 6.00, '', '用户取消', '2025-12-23 09:24:33', NULL);
INSERT INTO `orders` VALUES (535, '1766453097490', '0438', 2, 2, 71, NULL, NULL, NULL, NULL, '2025-12-23 09:24:57', '2025-12-23 09:24:58', 1, 1, 16.00, 0.00, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '套餐名称',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-停售 1-起售',
  `category_id` int NOT NULL COMMENT '分类ID',
  `create_user` int NOT NULL COMMENT '创建人',
  `update_user` int NOT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_setmeal_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '套餐表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1, '川味双人套餐', NULL, '宫保鸡丁+麻婆豆腐+米饭2份，超值双人餐', 35.00, 1, 3, 2, 2, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `setmeal` VALUES (2, '面食超值套餐', NULL, '红烧牛肉面+凉拌黄瓜+豆浆', 22.00, 1, 6, 3, 3, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `setmeal` VALUES (3, '简餐商务套餐', NULL, '红烧排骨饭+例汤+饮料', 25.00, 1, 9, 4, 4, '2025-12-23 05:21:52', '2025-12-23 05:21:52');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `setmeal_id` int NOT NULL COMMENT '套餐ID',
  `dish_id` int NOT NULL COMMENT '菜品ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品名称（冗余）',
  `price` decimal(10, 2) NOT NULL COMMENT '菜品单价（冗余）',
  `copies` int NOT NULL DEFAULT 1 COMMENT '份数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_setmeal_id`(`setmeal_id` ASC) USING BTREE,
  INDEX `idx_dish_id`(`dish_id` ASC) USING BTREE,
  CONSTRAINT `fk_sd_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sd_setmeal` FOREIGN KEY (`setmeal_id`) REFERENCES `setmeal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '套餐菜品关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1, 1, 2, '宫保鸡丁', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (2, 1, 1, '麻婆豆腐', 15.00, 1);
INSERT INTO `setmeal_dish` VALUES (3, 2, 10, '红烧牛肉面', 16.00, 1);
INSERT INTO `setmeal_dish` VALUES (4, 2, 8, '凉拌黄瓜', 8.00, 1);
INSERT INTO `setmeal_dish` VALUES (5, 3, 19, '红烧排骨饭', 18.00, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别：0-女 1-男',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '头像',
  `balance` decimal(10, 2) NOT NULL DEFAULT 100.00 COMMENT '账户余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'student001', '123456', '张三', '15800000001', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (2, 'student002', '123456', '李四', '15800000002', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (3, 'student003', '123456', '王五', '15800000003', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (4, 'student004', '123456', '赵六', '15800000004', 0, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (5, 'student005', '123456', '钱七', '15800000005', 0, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (6, 'student006', '123456', '孙八', '15800000006', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (7, 'student007', '123456', '周九', '15800000007', 0, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (8, 'student008', '123456', '吴十', '15800000008', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (9, 'teacher001', '123456', '陈老师', '15800000009', 1, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (10, 'teacher002', '123456', '林老师', '15800000010', 0, NULL, 100.00, '2025-12-23 05:21:52');
INSERT INTO `user` VALUES (11, 'student011', '123456', '小明', '15800000011', 1, NULL, 100.00, '2025-11-25 06:12:35');
INSERT INTO `user` VALUES (12, 'student012', '123456', '小红', '15800000012', 0, NULL, 100.00, '2025-11-26 06:12:35');
INSERT INTO `user` VALUES (13, 'student013', '123456', '小刚', '15800000013', 1, NULL, 100.00, '2025-11-28 06:12:35');
INSERT INTO `user` VALUES (14, 'student014', '123456', '小丽', '15800000014', 0, NULL, 100.00, '2025-11-29 06:12:35');
INSERT INTO `user` VALUES (15, 'student015', '123456', '小强', '15800000015', 1, NULL, 100.00, '2025-12-01 06:12:35');
INSERT INTO `user` VALUES (16, 'student016', '123456', '小芳', '15800000016', 0, NULL, 100.00, '2025-12-03 06:12:35');
INSERT INTO `user` VALUES (17, 'student017', '123456', '小伟', '15800000017', 1, NULL, 100.00, '2025-12-05 06:12:35');
INSERT INTO `user` VALUES (18, 'student018', '123456', '小娟', '15800000018', 0, NULL, 100.00, '2025-12-08 06:12:35');
INSERT INTO `user` VALUES (19, 'student019', '123456', '小军', '15800000019', 1, NULL, 100.00, '2025-12-11 06:12:35');
INSERT INTO `user` VALUES (20, 'student020', '123456', '小燕', '15800000020', 0, NULL, 100.00, '2025-12-13 06:12:35');
INSERT INTO `user` VALUES (21, 'student021', '123456', '小磊', '15800000021', 1, NULL, 100.00, '2025-12-15 06:12:35');
INSERT INTO `user` VALUES (22, 'student022', '123456', '小雪', '15800000022', 0, NULL, 100.00, '2025-12-17 06:12:35');
INSERT INTO `user` VALUES (23, 'student023', '123456', '小峰', '15800000023', 1, NULL, 100.00, '2025-12-19 06:12:35');
INSERT INTO `user` VALUES (24, 'student024', '123456', '小云', '15800000024', 0, NULL, 100.00, '2025-12-21 06:12:35');
INSERT INTO `user` VALUES (25, 'student025', '123456', '小龙', '15800000025', 1, NULL, 100.00, '2025-12-22 06:12:35');
INSERT INTO `user` VALUES (71, '123456', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 324.00, '2025-12-23 07:44:30');

-- ----------------------------
-- Table structure for window
-- ----------------------------
DROP TABLE IF EXISTS `window`;
CREATE TABLE `window`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '窗口ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '窗口名称',
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '窗口图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '窗口描述',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '窗口位置（如：一楼A区）',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '营业状态：0-休息中 1-营业中',
  `open_time` time NULL DEFAULT NULL COMMENT '营业开始时间',
  `close_time` time NULL DEFAULT NULL COMMENT '营业结束时间',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_user` int NOT NULL COMMENT '创建人',
  `update_user` int NOT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '餐厅窗口表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of window
-- ----------------------------
INSERT INTO `window` VALUES (1, '川香阁', NULL, '正宗川菜，麻辣鲜香', '一楼A区', 1, '07:00:00', '21:00:00', 1, 1, 1, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `window` VALUES (2, '面面俱到', NULL, '各式面食，手工现做', '一楼B区', 1, '06:30:00', '20:30:00', 2, 1, 1, '2025-12-23 05:21:52', '2025-12-23 05:21:52');
INSERT INTO `window` VALUES (3, '快乐简餐', NULL, '营养快餐，方便快捷', '二楼A区', 1, '07:00:00', '20:00:00', 3, 1, 1, '2025-12-23 05:21:52', '2025-12-23 05:21:52');

SET FOREIGN_KEY_CHECKS = 1;
