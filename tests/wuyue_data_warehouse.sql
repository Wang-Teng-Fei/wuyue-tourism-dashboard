/*
 Navicat Premium Dump SQL

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : wuyue_data_warehouse

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 19/10/2025 21:45:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员姓名或用户名',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录邮箱，唯一',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码（加密存储）',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '管理员角色，super(超级管理员)，admin(普通管理员)',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '记住我或 API Token',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1=启用，0=禁用',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像 URL 或路径',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'superAdmin', 'superadmin@wuyue.com', '$2y$12$UKj24wX.Rbb8TMMREZyPvOXpaSsPrNinH.7hSTTaiX0D.pBO5RcPK', 'super', '727f9d36527a652f4c9cb4b7e30e8699d04da0d34bd1984a0bdf6e4c64c3632fcaa415268f28a47e', 1, '/storage/avatars/V0aj6dQBfJpATR552uCNkx5itZVPPzLaUSAlPD1B.png', '2025-10-30 21:39:41', '2025-09-24 20:25:58', '2025-10-15 15:54:32');
INSERT INTO `admins` VALUES (2, 'admin01', 'admin01@wuyue.com', '$2y$12$KXzkSDZxj.f1aPbGD1JTYenhtKsqNhj.bZkIkvSJCEIfRY29NVyvS', 'super', NULL, 1, '/storage/avatars/dIWLHrrD9t1pDsDzFS2j95Dsi2alIW1ZND5FR0uP.png', '2025-10-11 15:53:02', '2025-09-24 20:25:58', '2025-10-14 14:23:54');
INSERT INTO `admins` VALUES (3, 'Nice', 'admin02@wuyue.com', '$2y$12$2YX6dwWrx/TI1KpPKsKULefEG0LclO/kcdwTwsPx51yR056PebB66', 'super', '0106b5f6c5eff4e380140a1e3682119c49fd3c2ba8b1f48629510962460d7895d387af4eb772d54e', 1, '/storage/avatars/iO15M0kRYMTHZZk1ZVAU5pwWnHVPS3hVaLSiDxcI.jpg', '2025-10-15 14:12:49', '2025-09-24 20:25:58', '2025-10-15 14:12:49');
INSERT INTO `admins` VALUES (4, '粉红小萝莉', 'fenhongxiaoluoli@gmail.com', '$2y$12$AxaafplJW3ijQuYEXfm.x.HsTuV2tHh6p9By0k1KM6JInYDz9Y9VC', 'admin', '2a073a321ea07a09de02d68d0da8209e46f66bc537dc637b44b1e6294ecbe53238f313154a469251', 1, '/storage/avatars/eEDa2gemw32ZLBqQYe85cinpmaoh1pUjHKnG0qWG.png', '2025-10-12 23:51:50', '2025-09-25 16:03:54', '2025-10-12 23:51:50');
INSERT INTO `admins` VALUES (5, '张三1', 'zhangsan1@gmail.com', '$2y$12$cmkiY/xAnCZjQTF4ylHCDOUkZOKasYU5q0MKt5si34gXR61gbCnxW', 'admin', '2ea1d545c579b0b23e27ea9fefa8fc023797c1a8e1cbaeebe1a321506b7d896bbf11f50825a183ab', 0, '/storage/avatars/z1Qw8ZzvI2cnWdWcqseoXgduSHu7Q1gRov9svkLZ.png', '2025-10-12 23:15:26', '2025-09-25 16:03:54', '2025-10-12 23:15:36');
INSERT INTO `admins` VALUES (6, 'wtf', 'wtf@qq.com', '$2y$12$N0Ff6UuUJVUjhzFjKbKAr.pCy.ktXtprE5JTBKA/sEH28Zh4R59v2', 'admin', NULL, 1, '/storage/avatars/BavuIRgQVPoUZfNoJOu5Szk6HdkfeY1YNn9Mthso.jpg', '2025-10-12 14:18:32', '2025-10-11 19:40:09', '2025-10-12 17:04:25');
INSERT INTO `admins` VALUES (7, '一打七', 'yidaqi@gmail.com', '$2y$12$JCEvFS4bWbnZoTEQ4EUOGeQco8AVGUgKHHOwnQjtdmb0Py9LzLINO', 'admin', NULL, 1, '/storage/avatars/sc6E0LH3VAiHOnmP8yBAOl5uFnKkDQLvwv3QSoqN.png', '2025-10-12 18:06:09', '2025-10-11 19:43:14', '2025-10-12 17:04:36');
INSERT INTO `admins` VALUES (9, 'wtf1', 'wtf12@qq.com', '$2y$12$5lIaEsTb3Txs8F4z3kU7sOIDtu7dbBXEWju1YDIk2YnaXoMPcV4DW', 'admin', NULL, 1, '/storage/avatars/fzlZTZWUmBQkY6aquU4olStSmjh6A9NTDHdObGQl.jpg', '2025-10-12 14:21:41', '2025-10-11 20:37:25', '2025-10-12 17:01:37');

-- ----------------------------
-- Table structure for annual_stats
-- ----------------------------
DROP TABLE IF EXISTS `annual_stats`;
CREATE TABLE `annual_stats`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `mountain_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL COMMENT '年份 (数据所属年份)',
  `height` decimal(8, 2) NULL DEFAULT NULL COMMENT '山峰高度 (单位：米)',
  `vegetation_coverage` decimal(5, 2) NULL DEFAULT NULL COMMENT '植被覆盖率（0~100%)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_mountain_year`(`mountain_id` ASC, `year` ASC) USING BTREE,
  CONSTRAINT `annual_stats_mountain_id_foreign` FOREIGN KEY (`mountain_id`) REFERENCES `mountain_ids` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of annual_stats
-- ----------------------------
INSERT INTO `annual_stats` VALUES (1, 7, 2015, NULL, 76.00, '2025-09-27 14:04:53', '2025-10-11 13:52:48');
INSERT INTO `annual_stats` VALUES (3, 2, 2017, 1612.00, 63.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (4, 2, 2018, 1830.00, 89.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (5, 7, 2019, 2152.00, 71.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (9, 3, 2023, 2116.00, 83.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (10, 2, 2024, 2399.00, 68.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (11, 2, 2025, 2644.00, 40.00, '2025-09-27 14:04:53', '2025-10-15 15:44:40');
INSERT INTO `annual_stats` VALUES (14, 3, 2025, 3747.00, 65.00, '2025-09-27 14:04:53', '2025-09-27 14:04:53');
INSERT INTO `annual_stats` VALUES (15, 4, 2025, 5217.00, 62.00, '2025-09-27 14:04:53', '2025-10-12 16:47:04');
INSERT INTO `annual_stats` VALUES (17, 6, 2026, 5434.00, 45.00, '2025-10-01 21:44:55', '2025-10-09 21:44:59');
INSERT INTO `annual_stats` VALUES (21, 7, 2027, 24553.00, NULL, '2025-10-02 15:34:52', '2025-10-11 14:01:30');
INSERT INTO `annual_stats` VALUES (22, 7, 2026, 5434.00, 20.00, '2025-10-02 15:35:19', '2025-10-02 15:35:19');
INSERT INTO `annual_stats` VALUES (23, 1, 2027, 245532.00, 40.00, '2025-10-11 11:37:23', '2025-10-11 11:39:15');
INSERT INTO `annual_stats` VALUES (24, 1, 2026, 5434.00, 20.00, '2025-10-11 11:38:33', '2025-10-11 11:38:33');
INSERT INTO `annual_stats` VALUES (25, 18, 2025, 3242.00, NULL, '2025-10-11 13:29:50', '2025-10-11 13:29:50');
INSERT INTO `annual_stats` VALUES (26, 4, 2027, 5336.00, NULL, '2025-10-11 13:30:43', '2025-10-11 13:30:43');
INSERT INTO `annual_stats` VALUES (27, 19, 2026, 203232.00, 30.00, '2025-10-11 13:36:49', '2025-10-11 13:36:52');
INSERT INTO `annual_stats` VALUES (29, 20, 2028, 2321.21, 30.00, '2025-10-11 14:01:45', '2025-10-15 15:36:13');
INSERT INTO `annual_stats` VALUES (30, 1, 2025, 3242.00, 70.00, '2025-10-12 16:46:24', '2025-10-12 16:46:44');
INSERT INTO `annual_stats` VALUES (31, 112, 2015, 2370.00, 72.00, '2025-10-14 14:44:31', '2025-10-14 14:44:31');
INSERT INTO `annual_stats` VALUES (32, 20, 2016, 2458.00, 88.00, '2025-10-14 14:44:31', '2025-10-14 14:44:31');
INSERT INTO `annual_stats` VALUES (33, 6, 2017, 1569.00, 55.00, '2025-10-14 14:44:31', '2025-10-14 14:44:31');
INSERT INTO `annual_stats` VALUES (34, 5, 2018, 2317.00, 83.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (35, 6, 2019, 1190.00, 51.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (36, 2, 2020, 1069.00, 82.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (37, 1, 2021, 1429.00, 67.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (38, 17, 2022, 2271.00, 72.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (39, 7, 2023, 2393.00, 66.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (40, 115, 2024, 1192.00, 71.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (41, 21, 2025, 1634.00, 65.00, '2025-10-14 14:44:32', '2025-10-14 14:44:32');
INSERT INTO `annual_stats` VALUES (42, 5, 2015, 1511.00, 78.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (43, 22, 2016, 2033.00, 86.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (44, 23, 2017, 1393.00, 72.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (45, 23, 2018, 1069.00, 59.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (46, 5, 2019, 2488.00, 55.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (47, 18, 2020, 2102.00, 79.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (48, 3, 2021, 1141.00, 69.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (49, 114, 2022, 2458.00, 82.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (50, 113, 2023, 1965.00, 60.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (51, 113, 2024, 1816.00, 51.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');
INSERT INTO `annual_stats` VALUES (58, 5, 2025, 1816.00, 51.00, '2025-10-14 14:44:53', '2025-10-14 14:44:53');

-- ----------------------------
-- Table structure for flyline_center_points
-- ----------------------------
DROP TABLE IF EXISTS `flyline_center_points`;
CREATE TABLE `flyline_center_points`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '中心点名字',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '中心点图片路径',
  `width` int(10) UNSIGNED NOT NULL DEFAULT 30 COMMENT '图标宽度',
  `height` int(10) UNSIGNED NOT NULL DEFAULT 30 COMMENT '图标高度',
  `halo_config` json NULL COMMENT '光环配置',
  `text_config` json NULL COMMENT '文本配置',
  `extra_config` json NULL COMMENT '额外配置',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flyline_center_points_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyline_center_points
-- ----------------------------
INSERT INTO `flyline_center_points` VALUES (2, '南阳', '/storage/icons/center-nanyang.png', 28, 28, '{\"show\": true, \"color\": \"#37a2da\"}', '{\"show\": true, \"color\": \"#fff\"}', '{\"opacity\": 0.9}', '2025-09-27 14:05:30', '2025-09-27 14:05:30');
INSERT INTO `flyline_center_points` VALUES (5, '北京', '/storage/visualizations/center_points/E3D92Yiufr4WR97oZJLGV8jnLcPDNLiLnHLRHESA.png', 30, 30, '{\"show\": true, \"color\": \"#37a2da\"}', '{\"show\": true, \"color\": \"#fff\"}', '{\"opacity\": 0.9}', '2025-09-27 14:43:04', '2025-09-27 14:43:04');

-- ----------------------------
-- Table structure for flyline_charts
-- ----------------------------
DROP TABLE IF EXISTS `flyline_charts`;
CREATE TABLE `flyline_charts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞线图名称',
  `points` json NOT NULL COMMENT '坐标点数组',
  `lines` json NOT NULL COMMENT '飞线数组',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞线图描述',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主图',
  `sub_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附图，可以为空',
  `point_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '普通点图片路径',
  `extra_config` json NULL COMMENT '飞线图额外配置',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flyline_charts_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyline_charts
-- ----------------------------
INSERT INTO `flyline_charts` VALUES (1, '中国飞线图-1', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"/storage/visualizations/center_points/E3D92Yiufr4WR97oZJLGV8jnLcPDNLiLnHLRHESA.png\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/CiDbGe9yvRoWsGtE41IUktJgqyM4UBZiLpGc9Aei.png', '/storage/flylines/coLdRXs4FlgNfl2Ctj7oDmjAZxJcK9XtBJO0AboL.png', NULL, NULL, '2025-09-27 15:02:12', '2025-09-27 15:02:12');
INSERT INTO `flyline_charts` VALUES (2, '全国旅游流向1', '[{\"name\": \"北京\", \"coordinate\": [0.5, 0.4]}, {\"name\": \"上海\", \"coordinate\": [0.7, 0.5]}]', '[{\"source\": \"北京\", \"target\": \"上海\"}]', '主要城市间游客流向', '/storage/flylines/Zp7PE00U1JDnSEbcmCd21aDzIO5Y0pR9of680QI1.png', '/storage/flylines/6A5X06wenEXbRKnNvgnHY26TX8dnVFnLRaAh1RLW.jpg', '/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg', '{}', '2025-09-12 13:56:36', '2025-09-27 13:56:40');
INSERT INTO `flyline_charts` VALUES (3, '中国飞线图', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/kGL6HwH1GODB9KCQmEFV2UpOfAD1Mhv0hUVwcmih.png', '/storage/flylines/QggfnEOKc1lHL7Juyjb5clS7PwXdm99BztOPTMwJ.png', '/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg', '{}', '2025-09-18 13:56:42', '2025-09-25 13:56:47');
INSERT INTO `flyline_charts` VALUES (4, '中国飞线图1', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/iNn6VeusL4CuQeyWzG3qyxevJVn95MZMGlaiyApD.png', '/storage/flylines/j0m3kOf1qSl2jV34nv6HBvuJSqFlxhFoR8nrvzNh.png', NULL, NULL, '2025-09-27 14:58:57', '2025-09-27 14:58:57');
INSERT INTO `flyline_charts` VALUES (5, '中国飞线图2', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/bs9VminiXb7h1LXhhCxRGTOsc6iMyZpTDdhlasvk.png', '/storage/flylines/lICtToZfv6C5IqaSAjtCtbhDLQzPmAw7R98awCPt.png', NULL, NULL, '2025-09-27 15:00:25', '2025-09-27 15:00:25');
INSERT INTO `flyline_charts` VALUES (6, '中国飞线图3', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/CiDbGe9yvRoWsGtE41IUktJgqyM4UBZiLpGc9Aei.png', '/storage/flylines/coLdRXs4FlgNfl2Ctj7oDmjAZxJcK9XtBJO0AboL.png', NULL, NULL, '2025-09-27 15:02:12', '2025-09-27 15:02:12');
INSERT INTO `flyline_charts` VALUES (7, '中国飞线图5', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/JAjOn22Vlg8BTlT9nHo5ITd7Z3WDwjW7ooI3VOYG.png', '/storage/flylines/RTZLNTEhq6Da4GASLlXr0qCVa2DUb4PEtouTEEc0.png', NULL, NULL, '2025-09-27 15:02:21', '2025-09-27 15:02:21');
INSERT INTO `flyline_charts` VALUES (8, '全国旅游流向111', '[{\"name\": \"北京\", \"coordinate\": [0.5, 0.4]}, {\"name\": \"上海\", \"coordinate\": [0.7, 0.5]}]', '[{\"source\": \"北京\", \"target\": \"上海\"}]', '主要城市间游客流向111111', '/storage/flylines/zmpalI6MGHDVStM1d9xEStsy6IOOCSuJKDsPo5CH.png', '/storage/flylines/wt0PFexLmbwrJiATw9e9SCz796Ev8bUp1Aa9I3kG.jpg', '/storage/flylines/nGVmLUtXoaODThiBbiwSyYcGoN7NaXQcgZDDWG1S.png', NULL, '2025-09-27 15:03:54', '2025-09-27 15:10:31');
INSERT INTO `flyline_charts` VALUES (9, '中国飞线图7', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/RoMJTI79lBQfEhumLma18aRZB5zmDykVyR0Pvxq3.png', '/storage/flylines/zyFFLUhfieNMRuaNf4bCX7mcSfe1oVwfVwRXFsUx.png', '/storage/flylines/1NYpAozsa1ULyJEIBpxqdRH4Y6XdIXQczeYDh5ld.png', NULL, '2025-09-27 15:04:12', '2025-09-27 15:04:12');
INSERT INTO `flyline_charts` VALUES (10, '中国飞线图51', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/JAjOn22Vlg8BTlT9nHo5ITd7Z3WDwjW7ooI3VOYG.png', '/storage/flylines/RTZLNTEhq6Da4GASLlXr0qCVa2DUb4PEtouTEEc0.png', NULL, NULL, '2025-09-27 15:02:21', '2025-09-27 15:02:21');
INSERT INTO `flyline_charts` VALUES (11, '全国旅游流向11', '[{\"name\": \"北京\", \"coordinate\": [0.5, 0.4]}, {\"name\": \"上海\", \"coordinate\": [0.7, 0.5]}]', '[{\"source\": \"北京\", \"target\": \"上海\"}]', '主要城市间游客流向111111', '/storage/flylines/zmpalI6MGHDVStM1d9xEStsy6IOOCSuJKDsPo5CH.png', '/storage/flylines/wt0PFexLmbwrJiATw9e9SCz796Ev8bUp1Aa9I3kG.jpg', '/storage/flylines/nGVmLUtXoaODThiBbiwSyYcGoN7NaXQcgZDDWG1S.png', NULL, '2025-09-27 15:03:54', '2025-09-27 15:10:31');
INSERT INTO `flyline_charts` VALUES (12, '中国飞线图1111', '[{\"halo\": {\"show\": true, \"color\": \"#ff000077\"}, \"icon\": {\"src\": \"mapStar\", \"show\": true, \"width\": 10, \"height\": 10}, \"name\": \"北京\", \"coordinate\": [\"0.6574\", \"0.4387\"]}, {\"name\": \"新疆\", \"coordinate\": [\"0.2191\", \"0.4255\"]}, {\"name\": \"甘肃\", \"coordinate\": [\"0.3688\", \"0.4409\"]}, {\"name\": \"内蒙古\", \"coordinate\": [\"0.6821\", \"0.3197\"]}, {\"name\": \"青海\", \"coordinate\": [\"0.3627\", \"0.5622\"]}, {\"name\": \"西藏\", \"coordinate\": [\"0.2469\", \"0.6856\"]}, {\"name\": \"宁夏\", \"coordinate\": [\"0.5031\", \"0.5203\"]}, {\"name\": \"四川\", \"coordinate\": [\"0.4599\", \"0.6878\"]}, {\"name\": \"陕西\", \"coordinate\": [\"0.5525\", \"0.5952\"]}, {\"name\": \"山西\", \"coordinate\": [\"0.5988\", \"0.5093\"]}, {\"name\": \"河北\", \"coordinate\": [\"0.6404\", \"0.4762\"]}, {\"name\": \"天津\", \"coordinate\": [\"0.6682\", \"0.4740\"]}, {\"name\": \"山东\", \"coordinate\": [\"0.6713\", \"0.5379\"]}, {\"name\": \"河南\", \"coordinate\": [\"0.6142\", \"0.6195\"]}, {\"name\": \"江苏\", \"coordinate\": [\"0.7006\", \"0.6283\"]}, {\"name\": \"安徽\", \"coordinate\": [\"0.6682\", \"0.6680\"]}, {\"name\": \"上海\", \"coordinate\": [\"0.7269\", \"0.6834\"]}, {\"name\": \"浙江\", \"coordinate\": [\"0.7068\", \"0.7253\"]}, {\"name\": \"福建\", \"coordinate\": [\"0.6744\", \"0.8003\"]}, {\"name\": \"江西\", \"coordinate\": [\"0.6435\", \"0.7562\"]}, {\"name\": \"广东\", \"coordinate\": [\"0.6127\", \"0.8444\"]}, {\"name\": \"湖南\", \"coordinate\": [\"0.5833\", \"0.7584\"]}, {\"name\": \"湖北\", \"coordinate\": [\"0.5926\", \"0.6790\"]}, {\"name\": \"广西\", \"coordinate\": [\"0.5494\", \"0.8488\"]}, {\"name\": \"贵州\", \"coordinate\": [\"0.5170\", \"0.7804\"]}, {\"name\": \"云南\", \"coordinate\": [\"0.4336\", \"0.8311\"]}, {\"name\": \"重庆\", \"coordinate\": [\"0.5386\", \"0.6900\"]}, {\"name\": \"黑龙江\", \"coordinate\": [\"0.8241\", \"0.2227\"]}, {\"name\": \"吉林\", \"coordinate\": [\"0.7994\", \"0.3373\"]}, {\"name\": \"辽宁\", \"coordinate\": [\"0.7531\", \"0.4034\"]}, {\"name\": \"海南\", \"coordinate\": [\"0.5586\", \"0.9568\"]}, {\"name\": \"台湾\", \"coordinate\": [\"0.7160\", \"0.8766\"]}, {\"name\": \"澳门\", \"coordinate\": [\"0.6127\", \"0.9089\"]}, {\"name\": \"香港\", \"coordinate\": [\"0.6296\", \"0.8885\"]}]', '[{\"source\": \"甘肃\", \"target\": \"四川\"}, {\"source\": \"内蒙古\", \"target\": \"安徽\"}, {\"source\": \"贵州\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"福建\"}, {\"source\": \"浙江\", \"target\": \"四川\"}, {\"source\": \"北京\", \"target\": \"河南\"}, {\"source\": \"内蒙古\", \"target\": \"辽宁\"}, {\"source\": \"广东\", \"target\": \"上海\"}, {\"source\": \"浙江\", \"target\": \"黑龙江\"}, {\"source\": \"新疆\", \"target\": \"江西\"}, {\"source\": \"广西\", \"target\": \"宁夏\"}, {\"source\": \"天津\", \"target\": \"江西\"}, {\"source\": \"河南\", \"target\": \"江西\"}, {\"source\": \"山西\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"山西\"}, {\"source\": \"福建\", \"target\": \"新疆\"}, {\"source\": \"河北\", \"target\": \"香港\"}, {\"source\": \"河南\", \"target\": \"重庆\"}, {\"source\": \"海南\", \"target\": \"内蒙古\"}, {\"source\": \"云南\", \"target\": \"安徽\"}, {\"source\": \"安徽\", \"target\": \"福建\"}, {\"source\": \"吉林\", \"target\": \"吉林\"}, {\"source\": \"四川\", \"target\": \"内蒙古\"}, {\"source\": \"重庆\", \"target\": \"湖南\"}, {\"source\": \"山西\", \"target\": \"上海\"}, {\"source\": \"广西\", \"target\": \"江苏\"}, {\"source\": \"山东\", \"target\": \"山西\"}, {\"source\": \"江西\", \"target\": \"宁夏\"}, {\"source\": \"辽宁\", \"target\": \"新疆\"}, {\"source\": \"广东\", \"target\": \"江苏\"}, {\"source\": \"海南\", \"target\": \"上海\"}, {\"source\": \"北京\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"新疆\"}, {\"source\": \"西藏\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"广东\"}, {\"source\": \"海南\", \"target\": \"黑龙江\"}, {\"source\": \"天津\", \"target\": \"内蒙古\"}, {\"source\": \"浙江\", \"target\": \"西藏\"}, {\"source\": \"江西\", \"target\": \"重庆\"}, {\"source\": \"湖北\", \"target\": \"宁夏\"}, {\"source\": \"广西\", \"target\": \"河北\"}, {\"source\": \"江苏\", \"target\": \"甘肃\"}, {\"source\": \"云南\", \"target\": \"山东\"}, {\"source\": \"内蒙古\", \"target\": \"广东\"}, {\"source\": \"新疆\", \"target\": \"贵州\"}, {\"source\": \"浙江\", \"target\": \"贵州\"}, {\"source\": \"广东\", \"target\": \"广东\"}, {\"source\": \"青海\", \"target\": \"河南\"}, {\"color\": \"#ff0000\", \"source\": \"江西\", \"target\": \"北京\"}, {\"source\": \"广东\", \"target\": \"辽宁\"}, {\"source\": \"新疆\", \"target\": \"辽宁\"}, {\"source\": \"安徽\", \"target\": \"安徽\"}, {\"source\": \"澳门\", \"target\": \"吉林\"}, {\"source\": \"青海\", \"target\": \"天津\"}, {\"source\": \"广西\", \"target\": \"江西\"}, {\"source\": \"上海\", \"target\": \"天津\"}, {\"source\": \"山西\", \"target\": \"福建\"}, {\"source\": \"重庆\", \"target\": \"山东\"}, {\"color\": \"#ff0000\", \"source\": \"山西\", \"target\": \"北京\"}, {\"source\": \"湖南\", \"target\": \"青海\"}]', '中国旅游流向', '/storage/flylines/RoMJTI79lBQfEhumLma18aRZB5zmDykVyR0Pvxq3.png', '/storage/flylines/zyFFLUhfieNMRuaNf4bCX7mcSfe1oVwfVwRXFsUx.png', '/storage/flylines/1NYpAozsa1ULyJEIBpxqdRH4Y6XdIXQczeYDh5ld.png', NULL, '2025-09-27 15:04:12', '2025-09-27 15:04:12');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (66, '2025_09_13_161436_create_mountain_ids_table', 1);
INSERT INTO `migrations` VALUES (67, '2025_09_13_161506_create_monthly_stats_table', 1);
INSERT INTO `migrations` VALUES (68, '2025_09_13_161520_create_annual_stats_table', 1);
INSERT INTO `migrations` VALUES (69, '2025_09_13_163108_create_admins_table', 1);
INSERT INTO `migrations` VALUES (70, '2025_09_14_225126_create_flyline_charts_table', 1);
INSERT INTO `migrations` VALUES (71, '2025_09_16_144512_create_visualization_configs_table', 1);
INSERT INTO `migrations` VALUES (72, '2025_09_27_133613_create_flyline_center_points_table', 1);

-- ----------------------------
-- Table structure for monthly_stats
-- ----------------------------
DROP TABLE IF EXISTS `monthly_stats`;
CREATE TABLE `monthly_stats`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键，自增 ID',
  `mountain_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL COMMENT '年份 （数据所属年份）',
  `month` tinyint(3) UNSIGNED NOT NULL COMMENT '月份（1-12）',
  `tourist_count` int(11) NULL DEFAULT NULL COMMENT '当月游客人数',
  `income` decimal(15, 2) NULL DEFAULT NULL COMMENT '当月收入，单位元',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_mountain_year_month`(`mountain_id` ASC, `year` ASC, `month` ASC) USING BTREE,
  CONSTRAINT `monthly_tourist_stats_mountain_id_foreign` FOREIGN KEY (`mountain_id`) REFERENCES `mountain_ids` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1614 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monthly_stats
-- ----------------------------
INSERT INTO `monthly_stats` VALUES (531, 2, 2015, 1, 463022, 39944250.81, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (532, 2, 2015, 2, 465211, 22758868.02, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (533, 2, 2015, 3, 56726, 11444496.96, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (534, 2, 2015, 4, 273484, 37679677.44, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (535, 2, 2015, 5, 268739, 877237.19, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (536, 2, 2015, 6, 405227, 48108143.87, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (537, 2, 2015, 7, 82315, 36211230.16, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (538, 2, 2015, 8, 148552, 35319161.82, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (539, 2, 2015, 9, 264892, 43932542.93, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (540, 2, 2015, 10, 368715, 2992592.18, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (541, 2, 2015, 11, 424689, 8593300.07, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (542, 2, 2015, 12, 218985, 27086232.62, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (543, 2, 2016, 1, 364831, 14568780.69, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (544, 2, 2016, 2, 438374, 10230077.35, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (545, 2, 2016, 3, 323240, 9687785.14, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (546, 2, 2016, 4, 471327, 26728963.07, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (547, 2, 2016, 5, 176164, 10205863.95, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (548, 2, 2016, 6, 194207, 23783929.82, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (549, 2, 2016, 7, 176570, 37629198.80, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (550, 2, 2016, 8, 137270, 35679876.04, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (551, 2, 2016, 9, 280367, 22908049.94, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (552, 2, 2016, 10, 154244, 33863676.97, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (553, 2, 2016, 11, 190502, 23468151.65, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (554, 2, 2016, 12, 367995, 34015861.90, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (555, 2, 2017, 1, 472427, 7031646.29, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (556, 2, 2017, 2, 244564, 22981775.14, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (557, 2, 2017, 3, 392710, 32926677.19, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (558, 2, 2017, 4, 66666, 38192969.13, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (559, 2, 2017, 5, 165607, 6882154.18, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (560, 2, 2017, 6, 170567, 26744695.46, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (561, 2, 2017, 7, 442507, 23256881.50, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (562, 2, 2017, 8, 497557, 12032390.52, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (563, 2, 2017, 9, 338278, 21211396.59, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (564, 2, 2017, 10, 188809, 1781736.91, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (565, 2, 2017, 11, 237396, 18511364.22, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (566, 2, 2017, 12, 245350, 38899717.56, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (567, 2, 2018, 1, 371983, 9407798.40, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (568, 2, 2018, 2, 18918, 19010302.16, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (569, 2, 2018, 3, 308257, 4691824.83, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (570, 2, 2018, 4, 200929, 40076085.43, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (571, 2, 2018, 5, 94186, 3658683.79, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (572, 2, 2018, 6, 44756, 13199199.46, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (573, 2, 2018, 7, 494438, 19918443.07, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (574, 2, 2018, 8, 222490, 9581788.97, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (575, 2, 2018, 9, 265889, 531682.81, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (576, 2, 2018, 10, 408339, 24196231.79, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (577, 2, 2018, 11, 202129, 35367557.17, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (578, 2, 2018, 12, 134887, 39401046.34, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (579, 2, 2019, 1, 473396, 24183132.14, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (580, 2, 2019, 2, 135232, 42948396.50, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (581, 2, 2019, 3, 42049, 46137214.63, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (582, 2, 2019, 4, 329829, 43412003.77, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (583, 2, 2019, 5, 11475, 31483510.68, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (584, 2, 2019, 6, 473811, 47611912.81, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (585, 2, 2019, 7, 444738, 8251777.19, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (586, 2, 2019, 8, 378660, 33042800.54, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (587, 2, 2019, 9, 419547, 29366833.83, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (588, 2, 2019, 10, 19950, 45768817.66, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (589, 2, 2019, 11, 290009, 22913428.56, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (590, 2, 2019, 12, 45735, 3049545.61, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (591, 2, 2020, 1, 244413, 24419704.51, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (592, 2, 2020, 2, 19037, 38950599.27, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (593, 2, 2020, 3, 415043, 44152233.54, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (594, 2, 2020, 4, 358464, 628361.23, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (595, 2, 2020, 5, 395538, 18556441.56, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (596, 2, 2020, 6, 377620, 25274206.38, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (597, 2, 2020, 7, 349000, 25002516.34, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (598, 2, 2020, 8, 428924, 20655449.19, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (599, 2, 2020, 9, 384647, 30294119.08, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (600, 2, 2020, 10, 56729, 37709890.30, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (601, 2, 2020, 11, 274245, 23701154.59, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (602, 2, 2020, 12, 316634, 44789185.78, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (603, 2, 2021, 1, 362508, 46818866.51, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (604, 2, 2021, 2, 182666, 40673892.47, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (605, 2, 2021, 3, 371739, 9908343.08, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (606, 2, 2021, 4, 385330, 16700336.20, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (607, 2, 2021, 5, 87416, 7625597.86, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (608, 2, 2021, 6, 357954, 47988936.47, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (609, 2, 2021, 7, 348389, 27647036.16, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (610, 2, 2021, 8, 487560, 13546125.65, '2025-09-27 20:28:11', '2025-09-27 20:28:11');
INSERT INTO `monthly_stats` VALUES (611, 2, 2021, 9, 311105, 39633245.51, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (612, 2, 2021, 10, 239061, 45380578.34, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (613, 2, 2021, 11, 134471, 35279453.04, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (614, 2, 2021, 12, 160025, 27447234.92, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (615, 2, 2022, 1, 350264, 15501881.80, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (616, 2, 2022, 2, 75808, 43038223.76, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (617, 2, 2022, 3, 366909, 35442558.31, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (618, 2, 2022, 4, 306699, 11361797.08, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (619, 2, 2022, 5, 110539, 7533151.66, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (620, 2, 2022, 6, 468984, 16714839.65, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (621, 2, 2022, 7, 64794, 26323921.90, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (622, 2, 2022, 8, 124810, 30973036.44, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (623, 2, 2022, 9, 235491, 6096637.87, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (624, 2, 2022, 10, 51067, 35748973.67, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (625, 2, 2022, 11, 332036, 4909219.56, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (626, 2, 2022, 12, 463585, 20695199.24, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (627, 2, 2023, 1, 101072, 30596433.10, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (628, 2, 2023, 2, 13625, 37676082.36, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (629, 2, 2023, 3, 236500, 45613142.18, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (630, 2, 2023, 4, 230602, 39100421.84, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (631, 2, 2023, 5, 245513, 9540467.37, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (632, 2, 2023, 6, 483004, 4735004.73, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (633, 2, 2023, 7, 444469, 22927657.94, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (634, 2, 2023, 8, 322126, 12479525.60, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (635, 2, 2023, 9, 439718, 31131252.73, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (636, 2, 2023, 10, 19007, 27573882.13, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (637, 2, 2023, 11, 286847, 3288955.60, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (638, 2, 2023, 12, 19248, 41017643.61, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (639, 2, 2024, 1, 165207, 39914368.79, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (640, 2, 2024, 2, 304617, 5009417.39, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (641, 2, 2024, 3, 12942, 2550084.28, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (642, 2, 2024, 4, 407908, 11525584.30, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (643, 2, 2024, 5, 308146, 46159956.86, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (644, 2, 2024, 6, 26161, 8472774.14, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (645, 2, 2024, 7, 487270, 44503356.45, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (646, 2, 2024, 8, 242480, 16337512.29, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (647, 2, 2024, 9, 165975, 16221187.75, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (648, 2, 2024, 10, 289617, 12496747.57, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (649, 2, 2024, 11, 384172, 2753013.20, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (650, 2, 2024, 12, 102313, 26645616.05, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (651, 2, 2025, 1, 256245, 2406085.43, '2025-09-27 20:28:12', '2025-10-11 10:39:09');
INSERT INTO `monthly_stats` VALUES (652, 2, 2025, 2, 284397, 33998622.77, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (653, 2, 2025, 3, 87739, 30332136.80, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (654, 2, 2025, 4, 8899, 11179737.40, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (655, 2, 2025, 5, 474094, 48248413.48, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (656, 2, 2025, 6, 479651, 5911981.00, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (657, 2, 2025, 7, 248611, 5189964.40, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (658, 2, 2025, 8, 37961, 40558286.67, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (659, 2, 2025, 9, 238094, 39433915.92, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (660, 2, 2025, 10, 77022, 47084562.02, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (661, 2, 2025, 11, 237681, 6377272.15, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (662, 2, 2025, 12, 66101, 16284132.17, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (663, 3, 2015, 1, 245705, 33622785.86, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (664, 3, 2015, 2, 497843, 44305093.31, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (665, 3, 2015, 3, 344987, 30101282.47, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (666, 3, 2015, 4, 387519, 22779609.66, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (667, 3, 2015, 5, 282140, 49882178.87, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (668, 3, 2015, 6, 324699, 7465388.45, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (669, 3, 2015, 7, 463312, 42585061.55, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (670, 3, 2015, 8, 404045, 15652434.61, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (671, 3, 2015, 9, 92097, 26703346.13, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (672, 3, 2015, 10, 21308, 7064883.73, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (673, 3, 2015, 11, 468598, 18782782.39, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (674, 3, 2015, 12, 458111, 16545585.09, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (675, 3, 2016, 1, 304797, 31014111.53, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (676, 3, 2016, 2, 330195, 33449963.08, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (677, 3, 2016, 3, 176587, 26917289.52, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (678, 3, 2016, 4, 380271, 35983363.36, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (679, 3, 2016, 5, 391758, 1315796.49, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (680, 3, 2016, 6, 28444, 49636473.81, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (681, 3, 2016, 7, 313269, 33866388.58, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (682, 3, 2016, 8, 327114, 14408135.39, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (683, 3, 2016, 9, 371071, 34361768.50, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (684, 3, 2016, 10, 397672, 42068378.40, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (685, 3, 2016, 11, 336418, 6752033.25, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (686, 3, 2016, 12, 34033, 24189406.09, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (687, 3, 2017, 1, 210292, 11084354.64, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (688, 3, 2017, 2, 171810, 8258923.53, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (689, 3, 2017, 3, 271499, 12167192.89, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (690, 3, 2017, 4, 70556, 35951623.68, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (691, 3, 2017, 5, 461518, 34241449.99, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (692, 3, 2017, 6, 461802, 23033174.97, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (693, 3, 2017, 7, 418349, 30657085.29, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (694, 3, 2017, 8, 485370, 48154313.00, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (695, 3, 2017, 9, 306331, 8661231.60, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (696, 3, 2017, 10, 415363, 35073504.95, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (697, 3, 2017, 11, 281001, 42488209.32, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (698, 3, 2017, 12, 254369, 2930879.93, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (699, 3, 2018, 1, 408376, 36826217.84, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (700, 3, 2018, 2, 136781, 17631732.05, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (701, 3, 2018, 3, 226072, 21987733.22, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (702, 3, 2018, 4, 261184, 36094935.87, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (703, 3, 2018, 5, 84282, 29110440.61, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (704, 3, 2018, 6, 31613, 27813867.71, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (705, 3, 2018, 7, 278998, 28124843.72, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (706, 3, 2018, 8, 497773, 41916535.76, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (707, 3, 2018, 9, 306897, 24537964.02, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (708, 3, 2018, 10, 41444, 41919725.02, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (709, 3, 2018, 11, 308065, 11981963.49, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (710, 3, 2018, 12, 479903, 38098157.78, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (711, 3, 2019, 1, 154107, 4684750.78, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (712, 3, 2019, 2, 369686, 9199061.35, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (713, 3, 2019, 3, 223359, 23945549.92, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (714, 3, 2019, 4, 19869, 6995380.94, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (715, 3, 2019, 5, 103165, 33125924.79, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (716, 3, 2019, 6, 174572, 15426584.93, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (717, 3, 2019, 7, 284294, 20522705.16, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (718, 3, 2019, 8, 417682, 15205445.43, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (719, 3, 2019, 9, 116054, 4224111.40, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (720, 3, 2019, 10, 160756, 32140180.91, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (721, 3, 2019, 11, 343335, 7570642.24, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (722, 3, 2019, 12, 117850, 15842882.06, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (723, 3, 2020, 1, 39435, 27171291.61, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (724, 3, 2020, 2, 336154, 4854524.91, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (725, 3, 2020, 3, 447943, 836281.70, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (726, 3, 2020, 4, 231183, 21514992.84, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (727, 3, 2020, 5, 11404, 827892.25, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (728, 3, 2020, 6, 44656, 42309201.24, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (729, 3, 2020, 7, 351561, 35175585.75, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (730, 3, 2020, 8, 225498, 6242058.71, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (731, 3, 2020, 9, 235528, 8527054.90, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (732, 3, 2020, 10, 134226, 22170504.17, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (733, 3, 2020, 11, 198097, 7378736.95, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (734, 3, 2020, 12, 240523, 26976496.65, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (735, 3, 2021, 1, 9518, 21584290.98, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (736, 3, 2021, 2, 221813, 40825758.58, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (737, 3, 2021, 3, 142826, 27385520.78, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (738, 3, 2021, 4, 184179, 30777327.64, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (739, 3, 2021, 5, 360966, 25284536.35, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (740, 3, 2021, 6, 478480, 29121318.85, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (741, 3, 2021, 7, 384083, 253873.93, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (742, 3, 2021, 8, 198441, 19347040.62, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (743, 3, 2021, 9, 427159, 47715082.72, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (744, 3, 2021, 10, 329972, 30632489.39, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (745, 3, 2021, 11, 398322, 34255227.02, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (746, 3, 2021, 12, 127101, 1907328.23, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (747, 3, 2022, 1, 275528, 4627220.49, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (748, 3, 2022, 2, 283070, 10962778.38, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (749, 3, 2022, 3, 235595, 15313179.57, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (750, 3, 2022, 4, 489202, 11812883.50, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (751, 3, 2022, 5, 249461, 2968766.78, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (752, 3, 2022, 6, 11841, 41367434.96, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (753, 3, 2022, 7, 467567, 18374447.10, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (754, 3, 2022, 8, 307368, 1283607.67, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (755, 3, 2022, 9, 145212, 27023210.93, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (756, 3, 2022, 10, 413372, 42081773.96, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (757, 3, 2022, 11, 303047, 18509109.00, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (758, 3, 2022, 12, 355233, 43045315.19, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (759, 3, 2023, 1, 347093, 8891350.47, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (760, 3, 2023, 2, 437209, 49833490.18, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (761, 3, 2023, 3, 22975, 26040726.92, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (762, 3, 2023, 4, 166305, 4577803.92, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (763, 3, 2023, 5, 261271, 10551846.13, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (764, 3, 2023, 6, 91063, 33238351.27, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (765, 3, 2023, 7, 143143, 30790799.46, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (766, 3, 2023, 8, 218184, 28445289.21, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (767, 3, 2023, 9, 304759, 9448492.59, '2025-09-27 20:28:12', '2025-09-27 20:28:12');
INSERT INTO `monthly_stats` VALUES (768, 3, 2023, 10, 408109, 1102012.27, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (769, 3, 2023, 11, 314944, 20820752.50, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (770, 3, 2023, 12, 155528, 11103572.18, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (771, 3, 2024, 1, 139125, 45549007.19, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (772, 3, 2024, 2, 497837, 48284601.05, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (773, 3, 2024, 3, 94609, 38161177.77, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (774, 3, 2024, 4, 498414, 10901492.51, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (775, 3, 2024, 5, 408029, 11205403.27, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (776, 3, 2024, 6, 174559, 7806692.04, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (777, 3, 2024, 7, 335293, 23189988.59, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (778, 3, 2024, 8, 427727, 35238529.43, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (779, 3, 2024, 9, 408350, 22303312.22, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (780, 3, 2024, 10, 277826, 24763364.91, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (781, 3, 2024, 11, 48139, 27091756.86, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (782, 3, 2024, 12, 127863, 33864063.37, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (783, 3, 2025, 1, 455046, 15197934.39, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (784, 3, 2025, 2, 358300, 34705496.47, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (785, 3, 2025, 3, 258390, 20978852.29, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (786, 3, 2025, 4, 363752, 40684672.19, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (787, 3, 2025, 5, 371776, 45972619.52, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (788, 3, 2025, 6, 189271, 12756812.92, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (789, 3, 2025, 7, 487068, 30541593.94, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (790, 3, 2025, 8, 122709, 45666565.33, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (791, 3, 2025, 9, 427440, 8705435.46, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (792, 3, 2025, 10, 108185, 47644051.63, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (793, 3, 2025, 11, 419819, 12594920.45, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (794, 3, 2025, 12, 20940, 21637822.86, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (795, 4, 2015, 1, 275742, 18475602.90, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (796, 4, 2015, 2, 59447, 37418658.14, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (797, 4, 2015, 3, 288420, 17733607.34, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (798, 4, 2015, 4, 288423, 30234340.56, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (799, 4, 2015, 5, 37029, 30498564.83, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (800, 4, 2015, 6, 97628, 37697276.00, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (801, 4, 2015, 7, 369613, 48961640.08, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (802, 4, 2015, 8, 493916, 42422793.86, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (803, 4, 2015, 9, 305634, 10999987.52, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (804, 4, 2015, 10, 485287, 23197401.13, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (805, 4, 2015, 11, 101096, 20185092.35, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (806, 4, 2015, 12, 224528, 30526931.25, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (807, 4, 2016, 1, 218142, 46626572.75, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (808, 4, 2016, 2, 219822, 39522029.35, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (809, 4, 2016, 3, 301637, 29853166.72, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (810, 4, 2016, 4, 362261, 23999356.98, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (811, 4, 2016, 5, 46446, 35642406.44, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (812, 4, 2016, 6, 490605, 20746706.45, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (813, 4, 2016, 7, 38105, 10168170.86, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (814, 4, 2016, 8, 412585, 39171508.10, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (815, 4, 2016, 9, 364367, 22838221.15, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (816, 4, 2016, 10, 187239, 33600858.39, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (817, 4, 2016, 11, 55073, 41935040.87, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (818, 4, 2016, 12, 350637, 39090405.56, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (819, 4, 2017, 1, 336670, 49983161.39, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (820, 4, 2017, 2, 489613, 28644175.16, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (821, 4, 2017, 3, 312927, 27288117.89, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (822, 4, 2017, 4, 222931, 34343246.44, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (823, 4, 2017, 5, 45071, 17620625.47, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (824, 4, 2017, 6, 361132, 43135285.54, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (825, 4, 2017, 7, 201335, 2131531.91, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (826, 4, 2017, 8, 487874, 26315451.81, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (827, 4, 2017, 9, 315065, 39868350.56, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (828, 4, 2017, 10, 12356, 7107656.36, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (829, 4, 2017, 11, 17367, 42206891.61, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (830, 4, 2017, 12, 484038, 7431922.50, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (831, 4, 2018, 1, 253228, 39951285.41, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (832, 4, 2018, 2, 438315, 27690981.07, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (833, 4, 2018, 3, 457539, 1681130.01, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (834, 4, 2018, 4, 202239, 40187431.48, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (835, 4, 2018, 5, 37751, 45757598.14, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (836, 4, 2018, 6, 35938, 48865830.17, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (837, 4, 2018, 7, 91233, 37286667.69, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (838, 4, 2018, 8, 244046, 35319936.20, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (839, 4, 2018, 9, 99492, 19042292.66, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (840, 4, 2018, 10, 187629, 1625061.20, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (841, 4, 2018, 11, 460923, 24682267.07, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (842, 4, 2018, 12, 153890, 24271894.66, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (843, 4, 2019, 1, 25325, 23568648.73, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (844, 4, 2019, 2, 438557, 1093344.82, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (845, 4, 2019, 3, 498647, 49990883.95, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (846, 4, 2019, 4, 268017, 32548516.73, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (847, 4, 2019, 5, 58275, 39112627.11, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (848, 4, 2019, 6, 437744, 26425016.59, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (849, 4, 2019, 7, 208408, 22560757.93, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (850, 4, 2019, 8, 205627, 49021077.51, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (851, 4, 2019, 9, 140738, 10134307.99, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (852, 4, 2019, 10, 436782, 29524540.46, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (853, 4, 2019, 11, 433476, 19221687.70, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (854, 4, 2019, 12, 284081, 43051470.91, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (855, 4, 2020, 1, 148305, 14240297.91, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (856, 4, 2020, 2, 464931, 41034019.55, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (857, 4, 2020, 3, 315502, 28716046.55, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (858, 4, 2020, 4, 467939, 46033949.08, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (859, 4, 2020, 5, 152556, 29443598.79, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (860, 4, 2020, 6, 121736, 530729.14, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (861, 4, 2020, 7, 425078, 8534323.53, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (862, 4, 2020, 8, 126020, 34096015.25, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (863, 4, 2020, 9, 200019, 7764365.71, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (864, 4, 2020, 10, 83971, 25118262.69, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (865, 4, 2020, 11, 144418, 34049800.39, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (866, 4, 2020, 12, 147245, 49130534.34, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (867, 4, 2021, 1, 387590, 21451183.12, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (868, 4, 2021, 2, 464848, 36270853.15, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (869, 4, 2021, 3, 299307, 47776038.28, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (870, 4, 2021, 4, 71382, 14837607.78, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (871, 4, 2021, 5, 293672, 27414752.04, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (872, 4, 2021, 6, 118281, 27571883.87, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (873, 4, 2021, 7, 57451, 10360040.48, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (874, 4, 2021, 8, 265108, 2065352.41, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (875, 4, 2021, 9, 216133, 31488441.56, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (876, 4, 2021, 10, 120063, 17510295.05, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (877, 4, 2021, 11, 283984, 721239.70, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (878, 4, 2021, 12, 143563, 26457745.59, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (879, 4, 2022, 1, 191978, 1861665.01, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (880, 4, 2022, 2, 370476, 39588942.87, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (881, 4, 2022, 3, 485065, 24255468.97, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (882, 4, 2022, 4, 222614, 20664463.51, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (883, 4, 2022, 5, 222056, 38374599.17, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (884, 4, 2022, 6, 270620, 30362968.13, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (885, 4, 2022, 7, 296178, 34403278.46, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (886, 4, 2022, 8, 130413, 45827437.53, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (887, 4, 2022, 9, 277068, 27293053.00, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (888, 4, 2022, 10, 488644, 29913180.23, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (889, 4, 2022, 11, 496510, 46057354.25, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (890, 4, 2022, 12, 235289, 42326007.87, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (891, 4, 2023, 1, 371347, 17838985.12, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (892, 4, 2023, 2, 97806, 32741915.99, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (893, 4, 2023, 3, 18574, 17008352.94, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (894, 4, 2023, 4, 324169, 14113701.96, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (895, 4, 2023, 5, 250337, 19805674.35, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (896, 4, 2023, 6, 163547, 42494485.43, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (897, 4, 2023, 7, 161404, 40439117.70, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (898, 4, 2023, 8, 380575, 19096221.02, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (899, 4, 2023, 9, 129918, 13598484.29, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (900, 4, 2023, 10, 339639, 5431729.15, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (901, 4, 2023, 11, 334693, 35034753.24, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (902, 4, 2023, 12, 290844, 8060123.09, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (903, 4, 2024, 1, 404777, 46037979.31, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (904, 4, 2024, 2, 32679, 46669621.71, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (905, 4, 2024, 3, 224635, 13414443.02, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (906, 4, 2024, 4, 418198, 3074101.29, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (907, 4, 2024, 5, 44146, 32055685.47, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (908, 4, 2024, 6, 410682, 33357759.87, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (909, 4, 2024, 7, 247910, 34222630.98, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (910, 4, 2024, 8, 406673, 15052507.31, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (911, 4, 2024, 9, 107763, 6811868.49, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (912, 4, 2024, 10, 353932, 29913956.28, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (913, 4, 2024, 11, 249684, 29842767.60, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (914, 4, 2024, 12, 326696, 15921151.72, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (915, 4, 2025, 1, 249092, 44819640.21, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (916, 4, 2025, 2, 196305, 40758050.86, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (917, 4, 2025, 3, 165132, 42970652.05, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (918, 4, 2025, 4, 72770, 9476777.48, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (919, 4, 2025, 5, 344596, 7562568.44, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (920, 4, 2025, 6, 138802, 30013355.73, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (921, 4, 2025, 7, 75865, 42668177.14, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (922, 4, 2025, 8, 107845, 29205791.63, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (923, 4, 2025, 9, 139489, 37611588.97, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (924, 4, 2025, 10, 255353, 1246934.76, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (925, 4, 2025, 11, 296958, 38507279.37, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (926, 4, 2025, 12, 288814, 31812384.77, '2025-09-27 20:28:13', '2025-09-27 20:28:13');
INSERT INTO `monthly_stats` VALUES (1059, 6, 2015, 1, 316837, 28731505.98, '2025-09-27 20:28:14', '2025-09-27 20:28:14');
INSERT INTO `monthly_stats` VALUES (1060, 6, 2015, 2, 452310, 47068830.28, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1061, 6, 2015, 3, 407927, 16502527.37, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1062, 6, 2015, 4, 377300, 49258086.12, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1063, 6, 2015, 5, 445781, 10532978.91, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1064, 6, 2015, 6, 29231, 18149640.04, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1065, 6, 2015, 7, 215571, 14881448.48, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1066, 6, 2015, 8, 340168, 19717962.49, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1067, 6, 2015, 9, 472650, 9652897.54, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1068, 6, 2015, 10, 284436, 33917975.97, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1069, 6, 2015, 11, 457263, 470737.01, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1070, 6, 2015, 12, 255997, 31551355.12, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1071, 6, 2016, 1, 69138, 6460398.17, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1072, 6, 2016, 2, 403285, 35072093.99, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1073, 6, 2016, 3, 220577, 6487498.08, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1074, 6, 2016, 4, 169287, 39698616.56, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1075, 6, 2016, 5, 182699, 37752295.17, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1076, 6, 2016, 6, 143130, 36316633.61, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1077, 6, 2016, 7, 491743, 25330097.46, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1078, 6, 2016, 8, 202853, 14502682.26, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1079, 6, 2016, 9, 460595, 3673141.21, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1080, 6, 2016, 10, 222132, 25563707.05, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1081, 6, 2016, 11, 14670, 34308503.34, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1082, 6, 2016, 12, 306064, 31913468.60, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1083, 6, 2017, 1, 51293, 12189092.68, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1084, 6, 2017, 2, 479590, 7568796.00, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1085, 6, 2017, 3, 473543, 46402800.30, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1086, 6, 2017, 4, 156338, 38667461.05, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1087, 6, 2017, 5, 311071, 34568551.03, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1088, 6, 2017, 6, 235656, 4974576.35, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1089, 6, 2017, 7, 425620, 30754918.36, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1090, 6, 2017, 8, 449955, 29044836.33, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1091, 6, 2017, 9, 457491, 15639212.16, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1092, 6, 2017, 10, 220584, 13607532.02, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1093, 6, 2017, 11, 42162, 14005071.75, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1094, 6, 2017, 12, 315074, 23078158.00, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1095, 6, 2018, 1, 433694, 22530183.25, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1096, 6, 2018, 2, 61720, 32618194.06, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1097, 6, 2018, 3, 73268, 36799334.61, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1098, 6, 2018, 4, 5780, 4009857.43, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1099, 6, 2018, 5, 357614, 23541547.12, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1100, 6, 2018, 6, 56461, 43377270.57, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1101, 6, 2018, 7, 163692, 29985326.07, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1102, 6, 2018, 8, 319476, 49015235.04, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1103, 6, 2018, 9, 38030, 39799483.39, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1104, 6, 2018, 10, 47090, 10573926.87, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1105, 6, 2018, 11, 8145, 29387168.16, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1106, 6, 2018, 12, 406872, 36654046.27, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1107, 6, 2019, 1, 76844, 43442154.80, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1108, 6, 2019, 2, 129759, 46999835.54, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1109, 6, 2019, 3, 134859, 23296976.22, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1110, 6, 2019, 4, 61817, 44397062.34, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1111, 6, 2019, 5, 235062, 35858407.56, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1112, 6, 2019, 6, 277303, 49003914.22, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1113, 6, 2019, 7, 173257, 39762343.61, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1114, 6, 2019, 8, 262210, 6425039.75, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1115, 6, 2019, 9, 113323, 20219043.10, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1116, 6, 2019, 10, 299614, 27360777.35, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1117, 6, 2019, 11, 327384, 10051781.66, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1118, 6, 2019, 12, 112709, 23759448.22, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1119, 6, 2020, 1, 376773, 26887970.19, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1120, 6, 2020, 2, 6914, 12766142.16, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1121, 6, 2020, 3, 293903, 2282163.62, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1122, 6, 2020, 4, 277273, 47783568.82, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1123, 6, 2020, 5, 246035, 25780108.03, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1124, 6, 2020, 6, 402684, 30784624.29, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1125, 6, 2020, 7, 361902, 18696765.31, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1126, 6, 2020, 8, 329925, 7425373.13, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1127, 6, 2020, 9, 431126, 49594564.68, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1128, 6, 2020, 10, 139782, 556345.52, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1129, 6, 2020, 11, 156082, 43549304.73, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1130, 6, 2020, 12, 20329, 21091058.64, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1131, 6, 2021, 1, 147682, 7228933.29, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1132, 6, 2021, 2, 398383, 32396954.25, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1133, 6, 2021, 3, 348391, 48843649.19, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1134, 6, 2021, 4, 203206, 36505653.50, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1135, 6, 2021, 5, 151910, 5701805.55, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1136, 6, 2021, 6, 443811, 4085504.85, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1137, 6, 2021, 7, 353394, 16917926.00, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1138, 6, 2021, 8, 100797, 4912760.50, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1139, 6, 2021, 9, 134688, 49185456.52, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1140, 6, 2021, 10, 416376, 42413882.29, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1141, 6, 2021, 11, 42601, 24357265.39, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1142, 6, 2021, 12, 324502, 21266300.27, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1143, 6, 2022, 1, 487888, 11344412.18, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1144, 6, 2022, 2, 466835, 25536002.94, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1145, 6, 2022, 3, 148670, 6382697.20, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1146, 6, 2022, 4, 448553, 14896129.79, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1147, 6, 2022, 5, 313597, 43828357.21, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1148, 6, 2022, 6, 65341, 38598201.65, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1149, 6, 2022, 7, 88733, 4930362.01, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1150, 6, 2022, 8, 82456, 14471402.10, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1151, 6, 2022, 9, 330229, 31288038.54, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1152, 6, 2022, 10, 367626, 8741229.07, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1153, 6, 2022, 11, 162888, 15756652.58, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1154, 6, 2022, 12, 6122, 5121405.62, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1155, 6, 2023, 1, 96054, 46416649.02, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1156, 6, 2023, 2, 240689, 47169652.47, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1157, 6, 2023, 3, 228481, 4148078.48, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1158, 6, 2023, 4, 114624, 19616486.87, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1159, 6, 2023, 5, 229465, 8906574.00, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1160, 6, 2023, 6, 199074, 11498855.36, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1161, 6, 2023, 7, 492995, 24423124.81, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1162, 6, 2023, 8, 10605, 48814421.37, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1163, 6, 2023, 9, 397745, 32713238.78, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1164, 6, 2023, 10, 326884, 47322756.66, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1165, 6, 2023, 11, 112068, 41644817.21, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1166, 6, 2023, 12, 316279, 28218719.41, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1167, 6, 2024, 1, 375872, 12383330.92, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1168, 6, 2024, 2, 407101, 41861389.93, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1169, 6, 2024, 3, 132712, 46329582.60, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1170, 6, 2024, 4, 441995, 20259446.84, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1171, 6, 2024, 5, 292755, 22122823.71, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1172, 6, 2024, 6, 89838, 8501748.43, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1173, 6, 2024, 7, 119613, 27440360.61, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1174, 6, 2024, 8, 44631, 3278942.18, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1175, 6, 2024, 9, 488155, 112815.56, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1176, 6, 2024, 10, 358476, 34047151.41, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1177, 6, 2024, 11, 181637, 1243122.76, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1178, 6, 2024, 12, 66591, 46628671.05, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1179, 6, 2025, 1, 107685, 1586199.71, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1180, 6, 2025, 2, 83791, 27547554.65, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1181, 6, 2025, 3, 142825, 46470982.62, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1182, 6, 2025, 4, 447692, 40354611.67, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1183, 6, 2025, 5, 70794, 15093668.74, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1184, 6, 2025, 6, 137138, 8076752.76, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1185, 6, 2025, 7, 304075, 9227174.47, '2025-09-27 20:28:15', '2025-09-27 20:28:15');
INSERT INTO `monthly_stats` VALUES (1186, 6, 2025, 8, 40470, 37425071.41, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1187, 6, 2025, 9, 294114, 18750607.88, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1188, 6, 2025, 10, 474278, 1873511.25, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1189, 6, 2025, 11, 328079, 35219745.62, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1190, 6, 2025, 12, 304830, 17426228.25, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1191, 7, 2015, 1, 3890891, 32372289.73, '2025-09-27 20:28:16', '2025-10-10 17:53:26');
INSERT INTO `monthly_stats` VALUES (1192, 7, 2015, 2, 250411, 22598093.15, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1193, 7, 2015, 3, 130117, 18875094.86, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1194, 7, 2015, 4, 354703, 15087708.51, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1195, 7, 2015, 5, 207622, 48069232.70, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1196, 7, 2015, 6, 157328, 17771217.01, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1197, 7, 2015, 7, 274120, 26658137.71, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1198, 7, 2015, 8, 496852, 5299264.47, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1199, 7, 2015, 9, 462864, 5867900.41, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1200, 7, 2015, 10, 84659, 1719352.82, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1201, 7, 2015, 11, 222750, 33942508.07, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1202, 7, 2015, 12, 43477, 18785719.67, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1203, 7, 2016, 1, 112455, 48780313.44, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1204, 7, 2016, 2, 221411, 17655338.38, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1205, 7, 2016, 3, 142352, 37486629.47, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1206, 7, 2016, 4, 186585, 4924248.93, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1207, 7, 2016, 5, 301184, 11182362.84, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1208, 7, 2016, 6, 132481, 15234282.69, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1209, 7, 2016, 7, 254000, 18851421.79, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1210, 7, 2016, 8, 191369, 3282614.61, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1211, 7, 2016, 9, 414426, 37173679.15, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1212, 7, 2016, 10, 8923, 23108466.06, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1213, 7, 2016, 11, 348393, 17641270.10, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1214, 7, 2016, 12, 283129, 42881645.13, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1215, 7, 2017, 1, 398019, 25672306.31, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1216, 7, 2017, 2, 454374, 43130471.99, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1217, 7, 2017, 3, 86530, 40513415.06, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1218, 7, 2017, 4, 287295, 31919130.22, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1219, 7, 2017, 5, 498169, 17778940.96, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1220, 7, 2017, 6, 140672, 12730967.84, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1221, 7, 2017, 7, 262056, 47775696.78, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1222, 7, 2017, 8, 248637, 19885972.25, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1223, 7, 2017, 9, 439084, 14100409.80, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1224, 7, 2017, 10, 485490, 36142510.49, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1225, 7, 2017, 11, 347451, 22217177.33, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1226, 7, 2017, 12, 55916, 27082525.44, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1227, 7, 2018, 1, 256213, 32367384.00, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1228, 7, 2018, 2, 363562, 31657362.75, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1229, 7, 2018, 3, 38735, 16590114.94, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1230, 7, 2018, 4, 315668, 11540643.81, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1231, 7, 2018, 5, 358963, 17710169.27, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1232, 7, 2018, 6, 451228, 33374313.81, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1233, 7, 2018, 7, 24013, 27271303.77, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1234, 7, 2018, 8, 457241, 44840395.26, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1235, 7, 2018, 9, 12366, 7492821.97, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1236, 7, 2018, 10, 58426, 33981153.36, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1237, 7, 2018, 11, 40231, 27005352.45, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1238, 7, 2018, 12, 306738, 3809238.66, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1239, 7, 2019, 1, 407601, 42533857.12, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1240, 7, 2019, 2, 320441, 20363043.10, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1241, 7, 2019, 3, 52538, 17001649.98, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1242, 7, 2019, 4, 87675, 33850752.99, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1243, 7, 2019, 5, 489098, 49142883.79, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1244, 7, 2019, 6, 442693, 27311350.16, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1245, 7, 2019, 7, 452856, 44325683.86, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1246, 7, 2019, 8, 133972, 23490801.38, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1247, 7, 2019, 9, 256170, 11455510.20, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1248, 7, 2019, 10, 213992, 28066534.47, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1249, 7, 2019, 11, 235392, 20761020.34, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1250, 7, 2019, 12, 93027, 6860492.61, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1251, 7, 2020, 1, 407880, 35080590.92, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1252, 7, 2020, 2, 126456, 22074303.56, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1253, 7, 2020, 3, 412024, 42382581.49, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1254, 7, 2020, 4, 180293, 366696.79, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1255, 7, 2020, 5, 200843, 8290158.73, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1256, 7, 2020, 6, 256122, 9834545.61, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1257, 7, 2020, 7, 212913, 2866236.36, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1258, 7, 2020, 8, 454704, 9573217.22, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1259, 7, 2020, 9, 397442, 13885414.59, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1260, 7, 2020, 10, 97751, 22334233.16, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1261, 7, 2020, 11, 156999, 32950640.74, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1262, 7, 2020, 12, 51836, 32165267.64, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1263, 7, 2021, 1, 153896, 47689824.09, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1264, 7, 2021, 2, 152988, 16702492.08, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1265, 7, 2021, 3, 37192, 36889164.87, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1266, 7, 2021, 4, 151243, 37933025.44, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1267, 7, 2021, 5, 227400, 38409354.98, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1268, 7, 2021, 6, 312039, 5358885.63, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1269, 7, 2021, 7, 23633, 48901790.37, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1270, 7, 2021, 8, 325740, 34648941.60, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1271, 7, 2021, 9, 464327, 3314711.70, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1272, 7, 2021, 10, 334828, 20149543.97, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1273, 7, 2021, 11, 424397, 28401213.45, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1274, 7, 2021, 12, 36475, 13588953.84, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1275, 7, 2022, 1, 313294, 45023662.26, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1276, 7, 2022, 2, 260942, 38492803.24, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1277, 7, 2022, 3, 79411, 39728362.83, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1278, 7, 2022, 4, 284293, 1247865.91, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1279, 7, 2022, 5, 41433, 2537432.22, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1280, 7, 2022, 6, 22517, 16110918.65, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1281, 7, 2022, 7, 79174, 35190037.90, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1282, 7, 2022, 8, 388225, 41598257.55, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1283, 7, 2022, 9, 268566, 41296837.18, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1284, 7, 2022, 10, 185254, 14356420.52, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1285, 7, 2022, 11, 401999, 3811963.93, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1286, 7, 2022, 12, 96771, 26259969.55, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1287, 7, 2023, 1, 451239, 29091939.55, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1288, 7, 2023, 2, 198183, 49092662.77, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1289, 7, 2023, 3, 92350, 22814164.59, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1290, 7, 2023, 4, 318205, 37392534.04, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1291, 7, 2023, 5, 415322, 10934322.43, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1292, 7, 2023, 6, 426514, 18490165.23, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1293, 7, 2023, 7, 376149, 20852724.55, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1294, 7, 2023, 8, 253971, 44126146.78, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1295, 7, 2023, 9, 435059, 43359491.45, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1296, 7, 2023, 10, 285974, 29658434.39, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1297, 7, 2023, 11, 432630, 9750272.64, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1298, 7, 2023, 12, 55710, 48257738.75, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1299, 7, 2024, 1, 310450, 8289334.02, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1300, 7, 2024, 2, 423868, 30413087.51, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1301, 7, 2024, 3, 347771, 45618481.04, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1302, 7, 2024, 4, 126058, 15912704.67, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1303, 7, 2024, 5, 73516, 39444635.92, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1304, 7, 2024, 6, 315285, 5762571.92, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1305, 7, 2024, 7, 294945, 11559502.90, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1306, 7, 2024, 8, 91317, 18036810.12, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1307, 7, 2024, 9, 194013, 27221749.73, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1308, 7, 2024, 10, 319789, 32875818.89, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1309, 7, 2024, 11, 143543, 45803606.95, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1310, 7, 2024, 12, 17770, 23600449.39, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1311, 7, 2025, 1, 322285, 1997457.03, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1312, 7, 2025, 2, 301753, 45674937.23, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1313, 7, 2025, 3, 101176, 25703059.36, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1314, 7, 2025, 4, 497086, 20037937.67, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1315, 7, 2025, 5, 109796, 31707263.71, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1316, 7, 2025, 6, 138696, 47636270.77, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1317, 7, 2025, 7, 220509, 10231590.93, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1318, 7, 2025, 8, 34952, 1963703.63, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1319, 7, 2025, 9, 384438, 12669769.46, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1320, 7, 2025, 10, 306117, 42357151.10, '2025-09-27 20:28:16', '2025-09-27 20:28:16');
INSERT INTO `monthly_stats` VALUES (1321, 7, 2025, 11, 161948, 49564898.13, '2025-09-27 20:28:17', '2025-09-27 20:28:17');
INSERT INTO `monthly_stats` VALUES (1322, 7, 2025, 12, 400339, 1076032.01, '2025-09-27 20:28:17', '2025-09-27 20:28:17');
INSERT INTO `monthly_stats` VALUES (1323, 6, 2026, 1, NULL, 43443553.03, '2025-10-10 21:43:28', '2025-10-09 21:43:31');
INSERT INTO `monthly_stats` VALUES (1324, 4, 2026, 2, 433521, NULL, '2025-10-01 21:43:51', '2025-10-01 21:43:57');
INSERT INTO `monthly_stats` VALUES (1325, 7, 2026, 5, NULL, 17540102.91, '2025-10-02 10:23:21', '2025-10-02 14:46:11');
INSERT INTO `monthly_stats` VALUES (1326, 7, 2026, 9, 438341, 22222.00, '2025-10-02 10:26:32', '2025-10-02 10:51:30');
INSERT INTO `monthly_stats` VALUES (1332, 7, 2026, 10, NULL, 17540102.91, '2025-10-02 15:33:37', '2025-10-02 15:33:37');
INSERT INTO `monthly_stats` VALUES (1337, 2, 2027, 1, 303030, NULL, '2025-10-11 10:01:03', '2025-10-11 10:01:03');
INSERT INTO `monthly_stats` VALUES (1338, 2, 2027, 2, 4343435, NULL, '2025-10-11 10:01:48', '2025-10-11 10:01:48');
INSERT INTO `monthly_stats` VALUES (1339, 2, 2027, 3, 54324545, NULL, '2025-10-11 10:02:05', '2025-10-11 10:02:05');
INSERT INTO `monthly_stats` VALUES (1340, 2, 2027, 4, 4353522, NULL, '2025-10-11 10:02:27', '2025-10-11 10:02:27');
INSERT INTO `monthly_stats` VALUES (1341, 2, 2027, 6, 64523535, NULL, '2025-10-11 10:04:30', '2025-10-11 10:04:30');
INSERT INTO `monthly_stats` VALUES (1342, 2, 2027, 7, 4232423, NULL, '2025-10-11 10:09:47', '2025-10-11 10:09:47');
INSERT INTO `monthly_stats` VALUES (1345, 1, 2015, 1, 6653361, 6452454.00, '2025-10-11 10:44:09', '2025-10-15 15:40:13');
INSERT INTO `monthly_stats` VALUES (1346, 1, 2015, 2, 367182, 512860.01, '2025-10-11 10:44:09', '2025-10-15 15:40:41');
INSERT INTO `monthly_stats` VALUES (1347, 1, 2015, 3, 79316, 1023998.00, '2025-10-11 10:44:09', '2025-10-15 15:39:44');
INSERT INTO `monthly_stats` VALUES (1348, 1, 2015, 4, 616113, 23650342.10, '2025-10-11 10:44:09', '2025-10-11 10:46:11');
INSERT INTO `monthly_stats` VALUES (1349, 1, 2015, 5, 615687, 19038141.30, '2025-10-11 10:44:09', '2025-10-11 10:46:13');
INSERT INTO `monthly_stats` VALUES (1350, 1, 2015, 6, 146576, 37034620.65, '2025-10-11 10:44:09', '2025-10-11 10:46:14');
INSERT INTO `monthly_stats` VALUES (1351, 1, 2015, 7, 12418, 31846369.91, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1352, 1, 2015, 8, 273300, 43325333.98, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1353, 1, 2015, 9, 56762, 18131564.30, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1354, 1, 2015, 10, 40713, 41702619.61, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1355, 1, 2015, 11, 235413, 7471682.89, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1356, 1, 2015, 12, 194513, 19018008.87, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1357, 1, 2016, 1, 210930, 7906730.51, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1358, 1, 2016, 2, 223614, 23158397.62, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1359, 1, 2016, 3, 221849, 18642994.52, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1360, 1, 2016, 4, 66965, 28019072.18, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1361, 1, 2016, 5, 231767, 27091427.97, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1362, 1, 2016, 6, 66542, 29173338.96, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1363, 1, 2016, 7, 350283, 14211533.10, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1364, 1, 2016, 8, 282792, 38688763.43, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1365, 1, 2016, 9, 342261, 1586844.43, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1366, 1, 2016, 10, 49922, 32978645.78, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1367, 1, 2016, 11, 421458, 39536730.34, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1368, 1, 2016, 12, 471280, 2665807.25, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1369, 1, 2017, 1, 271280, 35610815.14, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1370, 1, 2017, 2, 196842, 21165862.11, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1371, 1, 2017, 3, 111678, 8782242.98, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1372, 1, 2017, 4, 186884, 11686123.78, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1373, 1, 2017, 5, 346856, 36325602.48, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1374, 1, 2017, 6, 352518, 44130391.48, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1375, 1, 2017, 7, 24867, 4692126.77, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1376, 1, 2017, 8, 43990, 33738762.29, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1377, 1, 2017, 9, 147238, 10494387.32, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1378, 1, 2017, 10, 229889, 2541857.35, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1379, 1, 2017, 11, 308467, 30254398.75, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1380, 1, 2017, 12, 436371, 10542612.69, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1381, 1, 2018, 1, 443586, 24329625.07, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1382, 1, 2018, 2, 498114, 6308745.97, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1383, 1, 2018, 3, 318841, 27363397.43, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1384, 1, 2018, 4, 31013, 19134120.96, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1385, 1, 2018, 5, 291510, 22123497.48, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1386, 1, 2018, 6, 31912, 9374151.65, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1387, 1, 2018, 7, 435419, 40793951.19, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1388, 1, 2018, 8, 9103, 49373292.94, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1389, 1, 2018, 9, 109631, 30528264.44, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1390, 1, 2018, 10, 6004, 1826198.02, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1391, 1, 2018, 11, 249303, 12488248.91, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1392, 1, 2018, 12, 486602, 32087920.61, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1393, 1, 2019, 1, 475645, 3991429.21, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1394, 1, 2019, 2, 61234, 17292408.82, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1395, 1, 2019, 3, 153733, 1206896.85, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1396, 1, 2019, 4, 467114, 23257526.64, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1397, 1, 2019, 5, 432416, 42069824.60, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1398, 1, 2019, 6, 399599, 14660490.71, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1399, 1, 2019, 7, 496589, 22364723.63, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1400, 1, 2019, 8, 66170, 44478847.80, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1401, 1, 2019, 9, 59119, 46866888.47, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1402, 1, 2019, 10, 385617, 12916129.74, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1403, 1, 2019, 11, 45722, 37596286.36, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1404, 1, 2019, 12, 272122, 8664344.82, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1405, 1, 2020, 1, 376336, 42101388.50, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1406, 1, 2020, 2, 459760, 43440942.20, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1407, 1, 2020, 3, 87324, 3510520.97, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1408, 1, 2020, 4, 356533, 8682224.05, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1409, 1, 2020, 5, 142033, 2459735.00, '2025-10-11 10:44:09', '2025-10-11 10:59:14');
INSERT INTO `monthly_stats` VALUES (1410, 1, 2020, 6, 43054, 4245235.00, '2025-10-11 10:44:09', '2025-10-11 11:00:39');
INSERT INTO `monthly_stats` VALUES (1411, 1, 2020, 7, 432626, 34867114.89, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1412, 1, 2020, 8, 288838, 17256540.70, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1413, 1, 2020, 9, 222388, 40213657.42, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1414, 1, 2020, 10, 475651, 22578584.69, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1415, 1, 2020, 11, 339776, 46513003.69, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1416, 1, 2020, 12, 233024, 27281037.80, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1417, 1, 2021, 1, 483517, 20978800.26, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1418, 1, 2021, 2, 301329, 37007126.11, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1419, 1, 2021, 3, 477268, 6563367.18, '2025-10-11 10:44:09', '2025-10-11 10:44:09');
INSERT INTO `monthly_stats` VALUES (1420, 1, 2021, 4, 399388, 17069313.50, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1421, 1, 2021, 5, 273815, 30949361.47, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1422, 1, 2021, 6, 484315, 41710514.30, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1423, 1, 2021, 7, 83556, 9980393.39, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1424, 1, 2021, 8, 350630, 15614630.33, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1425, 1, 2021, 9, 245089, 39056866.12, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1426, 1, 2021, 10, 154356, 21720444.18, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1427, 1, 2021, 11, 380073, 16855926.88, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1428, 1, 2021, 12, 345210, 29686432.14, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1429, 1, 2022, 1, 211424, 46463749.24, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1430, 1, 2022, 2, 313692, 37662378.17, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1431, 1, 2022, 3, 301082, 38199099.61, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1432, 1, 2022, 4, 317418, 9331804.03, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1433, 1, 2022, 5, 379478, 4474968.68, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1434, 1, 2022, 6, 479890, 6613854.63, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1435, 1, 2022, 7, 230185, 19901997.00, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1436, 1, 2022, 8, 126166, 16346178.34, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1437, 1, 2022, 9, 438151, 49512073.09, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1438, 1, 2022, 10, 219820, 31427571.53, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1439, 1, 2022, 11, 426792, 45804077.88, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1440, 1, 2022, 12, 281084, 34031101.14, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1441, 1, 2023, 1, 430153, 6838464.73, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1442, 1, 2023, 2, 114681, 23970705.77, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1443, 1, 2023, 3, 380318, 17907891.33, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1444, 1, 2023, 4, 211292, 14577756.23, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1445, 1, 2023, 5, 9328, 13795152.99, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1446, 1, 2023, 6, 126574, 44323016.29, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1447, 1, 2023, 7, 22593, 6394929.36, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1448, 1, 2023, 8, 329504, 29082208.55, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1449, 1, 2023, 9, 230253, 10872805.31, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1450, 1, 2023, 10, 205341, 46146095.55, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1451, 1, 2023, 11, 471601, 25895457.28, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1452, 1, 2023, 12, 466499, 33229254.11, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1453, 1, 2024, 1, 27708, 29427409.85, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1454, 1, 2024, 2, 436617, 40440319.80, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1455, 1, 2024, 3, 401984, 38814973.80, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1456, 1, 2024, 4, 317603, 11623490.94, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1457, 1, 2024, 5, 340733, 42708718.74, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1458, 1, 2024, 6, 207242, 44089428.91, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1459, 1, 2024, 7, 77704, 39353116.72, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1460, 1, 2024, 8, 358532, 29369359.43, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1461, 1, 2024, 9, 51689, 35387553.50, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1462, 1, 2024, 10, 306848, 34768648.49, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1463, 1, 2024, 11, 453947, 34377577.25, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1464, 1, 2024, 12, 78758, 12264653.40, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1465, 1, 2025, 1, 15456, 36683916.97, '2025-10-11 10:44:10', '2025-10-12 16:39:05');
INSERT INTO `monthly_stats` VALUES (1466, 1, 2025, 2, 273737, 14547504.42, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1467, 1, 2025, 3, 430587, 8185313.44, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1468, 1, 2025, 4, 270664, 37057998.89, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1469, 1, 2025, 5, 173161, 3628364.00, '2025-10-11 10:44:10', '2025-10-11 11:16:30');
INSERT INTO `monthly_stats` VALUES (1470, 1, 2025, 6, 324490, 18759295.10, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1471, 1, 2025, 7, 319844, 33468114.90, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1472, 1, 2025, 8, 194780, 4632995.11, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1473, 1, 2025, 9, 366085, 25459003.39, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1474, 1, 2025, 10, 482566, 40778497.84, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1475, 1, 2025, 11, 470476, 30482833.74, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1476, 1, 2025, 12, 407638, 36096856.02, '2025-10-11 10:44:10', '2025-10-11 10:44:10');
INSERT INTO `monthly_stats` VALUES (1478, 18, 2025, 1, NULL, 42411552.00, '2025-10-11 11:02:47', '2025-10-11 11:02:47');
INSERT INTO `monthly_stats` VALUES (1480, 18, 2026, 1, NULL, 435633.00, '2025-10-11 13:32:14', '2025-10-11 13:32:14');
INSERT INTO `monthly_stats` VALUES (1481, 23, 2025, 1, NULL, 4352535.00, '2025-10-11 14:53:36', '2025-10-11 14:53:36');
INSERT INTO `monthly_stats` VALUES (1482, 5, 2015, 1, 176123, 41591196.79, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1483, 5, 2015, 2, 487503, 13373768.46, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1484, 5, 2015, 3, 426206, 20523174.54, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1485, 5, 2015, 4, 440422, 29311233.63, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1486, 5, 2015, 5, 426007, 9808774.96, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1487, 5, 2015, 6, 26049, 6016826.08, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1488, 5, 2015, 7, 487275, 49083493.95, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1489, 5, 2015, 8, 42305, 46026052.13, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1490, 5, 2015, 9, 64671, 30940296.35, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1491, 5, 2015, 10, 273406, 26232026.69, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1492, 5, 2015, 11, 169795, 11289894.85, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1493, 5, 2015, 12, 215069, 46748863.98, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1494, 5, 2016, 1, 367094, 46001724.35, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1495, 5, 2016, 2, 118048, 47132815.95, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1496, 5, 2016, 3, 279462, 42328021.20, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1497, 5, 2016, 4, 47252, 45438412.68, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1498, 5, 2016, 5, 299717, 32475031.53, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1499, 5, 2016, 6, 198241, 4656311.77, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1500, 5, 2016, 7, 208570, 22191424.43, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1501, 5, 2016, 8, 234362, 33678618.50, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1502, 5, 2016, 9, 182878, 448286.48, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1503, 5, 2016, 10, 445566, 28631346.84, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1504, 5, 2016, 11, 191928, 34295120.19, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1505, 5, 2016, 12, 12246, 14978987.12, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1506, 5, 2017, 1, 289880, 32626054.48, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1507, 5, 2017, 2, 309928, 29205899.45, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1508, 5, 2017, 3, 396737, 36959367.93, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1509, 5, 2017, 4, 331267, 21617038.51, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1510, 5, 2017, 5, 193184, 15608645.05, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1511, 5, 2017, 6, 356429, 30637156.37, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1512, 5, 2017, 7, 21690, 2895437.20, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1513, 5, 2017, 8, 170336, 42598922.08, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1514, 5, 2017, 9, 60093, 21993923.54, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1515, 5, 2017, 10, 56286, 23339178.53, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1516, 5, 2017, 11, 62841, 31031574.80, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1517, 5, 2017, 12, 405240, 9628985.83, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1518, 5, 2018, 1, 337475, 23932649.57, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1519, 5, 2018, 2, 485548, 21395094.93, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1520, 5, 2018, 3, 380013, 18911998.90, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1521, 5, 2018, 4, 221803, 19751779.57, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1522, 5, 2018, 5, 421625, 15212875.86, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1523, 5, 2018, 6, 350641, 32172468.25, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1524, 5, 2018, 7, 196123, 12044832.92, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1525, 5, 2018, 8, 58958, 22658321.90, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1526, 5, 2018, 9, 280444, 22595922.03, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1527, 5, 2018, 10, 188251, 10269827.98, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1528, 5, 2018, 11, 421191, 40552555.13, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1529, 5, 2018, 12, 90813, 8866258.37, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1530, 5, 2019, 1, 160215, 14223457.21, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1531, 5, 2019, 2, 57127, 5114735.28, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1532, 5, 2019, 3, 361167, 8110827.18, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1533, 5, 2019, 4, 204844, 28755242.20, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1534, 5, 2019, 5, 456251, 17819394.96, '2025-10-15 13:30:17', '2025-10-15 13:30:17');
INSERT INTO `monthly_stats` VALUES (1535, 5, 2019, 6, 84096, 13786931.24, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1536, 5, 2019, 7, 231696, 25538596.74, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1537, 5, 2019, 8, 215313, 36327839.69, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1538, 5, 2019, 9, 202112, 22252974.36, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1539, 5, 2019, 10, 206297, 35030031.12, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1540, 5, 2019, 11, 318771, 40230518.99, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1541, 5, 2019, 12, 203274, 48198965.23, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1542, 5, 2020, 1, 99630, 3099498.76, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1543, 5, 2020, 2, 198623, 30545513.11, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1544, 5, 2020, 3, 18226, 31218535.23, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1545, 5, 2020, 4, 300669, 35611335.29, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1546, 5, 2020, 5, 23071, 34080190.48, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1547, 5, 2020, 6, 449206, 29324100.61, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1548, 5, 2020, 7, 478472, 22115789.07, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1549, 5, 2020, 8, 419761, 14038990.46, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1550, 5, 2020, 9, 69153, 13934933.19, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1551, 5, 2020, 10, 393085, 34650204.32, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1552, 5, 2020, 11, 168637, 33577848.31, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1553, 5, 2020, 12, 440078, 23194427.21, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1554, 5, 2021, 1, 252704, 547259.39, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1555, 5, 2021, 2, 319158, 3628988.73, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1556, 5, 2021, 3, 358821, 28548635.02, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1557, 5, 2021, 4, 226313, 43202585.32, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1558, 5, 2021, 5, 254059, 44648075.55, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1559, 5, 2021, 6, 351914, 41349595.04, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1560, 5, 2021, 7, 431146, 9105437.51, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1561, 5, 2021, 8, 115231, 11063730.74, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1562, 5, 2021, 9, 330907, 10704379.73, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1563, 5, 2021, 10, 387552, 38459990.28, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1564, 5, 2021, 11, 411630, 22940826.23, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1565, 5, 2021, 12, 133956, 12407637.29, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1566, 5, 2022, 1, 370896, 38899902.60, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1567, 5, 2022, 2, 141556, 43969102.42, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1568, 5, 2022, 3, 397504, 34986977.72, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1569, 5, 2022, 4, 488253, 21646887.00, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1570, 5, 2022, 5, 445533, 38461458.80, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1571, 5, 2022, 6, 300368, 40966245.27, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1572, 5, 2022, 7, 23727, 1626754.26, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1573, 5, 2022, 8, 28833, 41885069.25, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1574, 5, 2022, 9, 240322, 28396191.81, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1575, 5, 2022, 10, 428272, 10353750.76, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1576, 5, 2022, 11, 419871, 13163681.98, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1577, 5, 2022, 12, 352337, 28728876.65, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1578, 5, 2023, 1, 229247, 18662728.65, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1579, 5, 2023, 2, 71178, 16143866.84, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1580, 5, 2023, 3, 366691, 40506309.04, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1581, 5, 2023, 4, 186289, 11021443.28, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1582, 5, 2023, 5, 73981, 4218807.43, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1583, 5, 2023, 6, 439277, 28820683.55, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1584, 5, 2023, 7, 52302, 35401977.98, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1585, 5, 2023, 8, 356972, 46328042.72, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1586, 5, 2023, 9, 170269, 6388603.29, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1587, 5, 2023, 10, 359271, 42498673.94, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1588, 5, 2023, 11, 47037, 29953529.81, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1589, 5, 2023, 12, 405488, 22212665.27, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1590, 5, 2024, 1, 281163, 39081016.60, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1591, 5, 2024, 2, 261432, 49892364.85, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1592, 5, 2024, 3, 299717, 32274623.85, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1593, 5, 2024, 4, 121235, 42894030.16, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1594, 5, 2024, 5, 168228, 41377123.39, '2025-10-15 13:30:18', '2025-10-15 13:30:18');
INSERT INTO `monthly_stats` VALUES (1595, 5, 2024, 6, 469825, 33710236.47, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1596, 5, 2024, 7, 425919, 4043666.11, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1597, 5, 2024, 8, 68487, 18271491.47, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1598, 5, 2024, 9, 255531, 7832756.33, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1599, 5, 2024, 10, 121224, 24659134.62, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1600, 5, 2024, 11, 259942, 8655099.62, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1601, 5, 2024, 12, 476946, 44537595.50, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1602, 5, 2025, 1, 255240, 37567827.51, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1603, 5, 2025, 2, 61392, 37966683.88, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1604, 5, 2025, 3, 473235, 19132556.96, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1605, 5, 2025, 4, 432199, 12821053.80, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1606, 5, 2025, 5, 113730, 39014168.54, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1607, 5, 2025, 6, 437614, 7420206.50, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1608, 5, 2025, 7, 382907, 38152023.56, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1609, 5, 2025, 8, 403626, 4605133.64, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1610, 5, 2025, 9, 358993, 24594705.81, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1611, 5, 2025, 10, 353260, 3178027.50, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1612, 5, 2025, 11, 388077, 16062200.56, '2025-10-15 13:30:19', '2025-10-15 13:30:19');
INSERT INTO `monthly_stats` VALUES (1613, 5, 2025, 12, 408487, 7579542.44, '2025-10-15 13:30:19', '2025-10-15 13:30:19');

-- ----------------------------
-- Table structure for monthly_tourist_stats
-- ----------------------------
DROP TABLE IF EXISTS `monthly_tourist_stats`;
CREATE TABLE `monthly_tourist_stats`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键，自增 ID',
  `mountain_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL COMMENT '年份 （数据所属年份）',
  `month` tinyint(3) UNSIGNED NOT NULL COMMENT '月份（1-12）',
  `tourist_count` int(11) NULL DEFAULT NULL COMMENT '当月游客人数',
  `income` decimal(15, 2) NULL DEFAULT NULL COMMENT '当月收入，单位元',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monthly_tourist_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mountain_ids
-- ----------------------------
DROP TABLE IF EXISTS `mountain_ids`;
CREATE TABLE `mountain_ids`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID，自增，唯一标识一座山峰',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '山峰名称',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省份',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mountain_ids_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mountain_ids
-- ----------------------------
INSERT INTO `mountain_ids` VALUES (1, '西岳华山', '陕西', '2025-09-24 20:22:26', '2025-10-15 15:35:54');
INSERT INTO `mountain_ids` VALUES (2, '东岳泰山', '山东', '2025-09-24 20:22:26', '2025-10-10 15:12:56');
INSERT INTO `mountain_ids` VALUES (3, '南岳衡山', '湖南', '2025-09-24 20:22:26', '2025-10-07 17:35:08');
INSERT INTO `mountain_ids` VALUES (4, '北岳恒山', '山西', '2025-09-24 20:22:26', '2025-10-07 17:35:08');
INSERT INTO `mountain_ids` VALUES (5, '中岳嵩山', '河南', '2025-09-24 20:22:26', '2025-10-09 21:44:08');
INSERT INTO `mountain_ids` VALUES (6, '长白山', '吉林', '2025-09-25 19:37:10', '2025-10-09 20:02:37');
INSERT INTO `mountain_ids` VALUES (7, '黄山', '安徽', '2025-09-25 19:37:23', '2025-10-07 17:34:32');
INSERT INTO `mountain_ids` VALUES (17, '武夷山', '福建', '2025-10-07 16:50:22', '2025-10-07 17:34:32');
INSERT INTO `mountain_ids` VALUES (18, '五台山', '山西', '2025-10-07 16:57:36', '2025-10-07 17:33:32');
INSERT INTO `mountain_ids` VALUES (19, '太白山', '陕西', '2025-10-07 16:57:40', '2025-10-09 20:02:25');
INSERT INTO `mountain_ids` VALUES (20, '云台山', '河南', '2025-10-07 16:57:44', '2025-10-09 21:48:32');
INSERT INTO `mountain_ids` VALUES (21, '四姑娘山', '四川', '2025-10-07 16:57:51', '2025-10-07 17:12:05');
INSERT INTO `mountain_ids` VALUES (22, '稻城亚丁', '四川', '2025-10-07 16:57:56', '2025-10-07 17:14:29');
INSERT INTO `mountain_ids` VALUES (23, '梅里雪山', '云南', '2025-10-07 16:57:59', '2025-10-07 17:12:12');
INSERT INTO `mountain_ids` VALUES (112, '1', '1', '2025-10-11 14:52:09', '2025-10-11 14:52:09');
INSERT INTO `mountain_ids` VALUES (113, '2', '2', '2025-10-11 14:52:13', '2025-10-11 14:52:13');
INSERT INTO `mountain_ids` VALUES (114, '11', '11', '2025-10-11 14:52:16', '2025-10-11 14:52:16');
INSERT INTO `mountain_ids` VALUES (115, '22', '22', '2025-10-11 14:52:20', '2025-10-11 14:52:20');
INSERT INTO `mountain_ids` VALUES (117, '33', '3', '2025-10-11 14:52:39', '2025-10-11 14:52:39');

-- ----------------------------
-- Table structure for visualization_configs
-- ----------------------------
DROP TABLE IF EXISTS `visualization_configs`;
CREATE TABLE `visualization_configs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名称',
  `flyline_chart_id` bigint(20) UNSIGNED NOT NULL,
  `mountain_ids` json NOT NULL COMMENT '要展示的山脉 ID 数组',
  `year` int(11) NOT NULL COMMENT '数据年份',
  `background_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '背景图片路径或 URL',
  `config_json` json NULL COMMENT '额外配置，如颜色、大小、动画等',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用，0=禁用，1=启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `visualization_configs_name_unique`(`name` ASC) USING BTREE,
  INDEX `visualization_configs_flyline_chart_id_foreign`(`flyline_chart_id` ASC) USING BTREE,
  CONSTRAINT `visualization_configs_flyline_chart_id_foreign` FOREIGN KEY (`flyline_chart_id`) REFERENCES `flyline_charts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visualization_configs
-- ----------------------------
INSERT INTO `visualization_configs` VALUES (1, '五岳智游数据可视化', 1, '\"[1, 2, 3, 4, 5]\"', 2025, '/storage/visualizations/qFhtiw831xZV9gLnEn7dNWo8mhS22LrAbOp51wJ1.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 1, '2025-09-24 09:46:52', '2025-09-26 19:32:16');
INSERT INTO `visualization_configs` VALUES (2, '五岳智游数据可视化-数据二', 1, '\"[1, 2, 3]\"', 2025, '/storage/visualizations/qFhtiw831xZV9gLnEn7dNWo8mhS22LrAbOp51wJ1.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 09:46:52', '2025-09-26 19:32:16');
INSERT INTO `visualization_configs` VALUES (3, '五岳智游数据可化9', 1, '[1, 2, 3]', 2025, '/storage/visualizations/qFhtiw831xZV9gLnEn7dNWo8mhS22LrAbOp51wJ1.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 13:54:37', '2025-09-24 16:29:51');
INSERT INTO `visualization_configs` VALUES (4, '五岳智游数据可化1', 1, '[1, 2, 3]', 2025, '/storage/visualizations/qFhtiw831xZV9gLnEn7dNWo8mhS22LrAbOp51wJ1.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 13:54:37', '2025-09-24 16:29:51');
INSERT INTO `visualization_configs` VALUES (5, '五岳智游数据可化-2', 1, '\"[1, 2, 3]\"', 2025, '/storage/visualizations/qFhtiw831xZV9gLnEn7dNWo8mhS22LrAbOp51wJ1.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 21:50:48', '2025-09-25 19:15:02');
INSERT INTO `visualization_configs` VALUES (6, '五岳智游数据可化-3', 1, '\"[1, 2, 3, 5, 6]\"', 2025, '/storage/visualizations/n10dEKY6fcF6fcGYjgDYhvcHzt0RmhOsf4GyugkB.png', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 21:50:48', '2025-09-25 19:15:02');
INSERT INTO `visualization_configs` VALUES (7, '五岳智游数据可化-65', 1, '\"[1, 2, 3, 4]\"', 2025, '/storage/avatars/z1Qw8ZzvI2cnWdWcqseoXgduSHu7Q1gRov9svkLZ.png', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 21:50:48', '2025-09-25 19:15:02');
INSERT INTO `visualization_configs` VALUES (8, '五岳智游数据可化-632', 1, '\"[1, 2, 3]\"', 2025, '/storage/avatars/zQtV9pEypSZYdxJajao5HGcyCsOgh7siV94gfHA4.jpg', '{\"title\": \"五岳智游数据可视化\", \"borderColor\": [\"#4fd2dd\", \"#235fa7\"], \"echartsAnimationTime\": 1500}', 0, '2025-09-24 21:50:48', '2025-09-25 19:15:02');

SET FOREIGN_KEY_CHECKS = 1;
