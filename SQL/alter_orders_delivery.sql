-- =====================================================
-- 订单表新增配送方式相关字段
-- 执行此SQL以支持"自取/配送"功能
-- =====================================================

-- 1. 添加配送方式字段
ALTER TABLE `orders` 
ADD COLUMN `delivery_type` TINYINT NOT NULL DEFAULT 1 COMMENT '配送方式：1-配送 2-自取' AFTER `pickup_code`,
ADD COLUMN `delivery_fee` DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '配送费' AFTER `amount`;

-- 2. 更新现有数据（将现有订单默认设为配送，配送费6元）
UPDATE `orders` SET `delivery_type` = 1, `delivery_fee` = 6.00 WHERE `delivery_type` IS NULL OR `delivery_type` = 0;

-- 3. 添加索引以优化查询
ALTER TABLE `orders` ADD INDEX `idx_delivery_type`(`delivery_type` ASC);

-- =====================================================
-- 说明：
-- delivery_type = 1 表示配送：需要地址、有配送费、无需取餐码展示
-- delivery_type = 2 表示自取：不需要地址、无配送费、展示取餐码
-- pickup_code 字段已存在，自取时用于展示给顾客
-- =====================================================
