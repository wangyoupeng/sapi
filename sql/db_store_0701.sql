/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 01/07/2023 08:14:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auths
-- ----------------------------
DROP TABLE IF EXISTS `auths`;
CREATE TABLE `auths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `auth_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent_auth_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `api_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `api_type` int NOT NULL DEFAULT '1',
  `descr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `goods_id` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10042 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for goods_version
-- ----------------------------
DROP TABLE IF EXISTS `goods_version`;
CREATE TABLE `goods_version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version_id` int NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `image_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `md5` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_id` int NOT NULL,
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `goods_version_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `price_total` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES (1, 24, 10000, '1688166359495648', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (2, 25, 10000, '1688166359501478', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (3, 24, 10000, '1688166359495648', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (4, 25, 10000, '1688166359501478', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (5, 24, 10000, '1688166359495648', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (6, 25, 10000, '1688166359501478', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (7, 24, 10000, '1688166359495648', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (8, 25, 10000, '1688166359501478', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (9, 26, 10000, '1688166638063176', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:10:38', '2023-07-01 07:10:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (10, 26, 10000, '1688166638063176', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:10:38', '2023-07-01 07:10:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (11, 26, 10000, '1688166638063176', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:10:38', '2023-07-01 07:10:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (12, 26, 10000, '1688166638063176', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:10:38', '2023-07-01 07:10:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (13, 27, 10000, '1688166698383713', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:11:38', '2023-07-01 07:11:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (14, 27, 10000, '1688166698383713', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:11:38', '2023-07-01 07:11:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (15, 27, 10000, '1688166698383713', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:11:38', '2023-07-01 07:11:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (16, 27, 10000, '1688166698383713', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:11:38', '2023-07-01 07:11:38', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (17, 28, 10000, '1688166752773135', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:12:32', '2023-07-01 07:12:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (18, 28, 10000, '1688166752773135', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:12:32', '2023-07-01 07:12:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (19, 28, 10000, '1688166752773135', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:12:32', '2023-07-01 07:12:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (20, 28, 10000, '1688166752773135', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:12:32', '2023-07-01 07:12:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (21, 29, 10000, '1688166832747751', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:13:52', '2023-07-01 07:13:52', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (22, 29, 10000, '1688166832747751', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:13:52', '2023-07-01 07:13:52', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (23, 29, 10000, '1688166832747751', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:13:52', '2023-07-01 07:13:52', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (24, 29, 10000, '1688166832747751', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:13:52', '2023-07-01 07:13:52', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (25, 30, 10000, '1688166906728237', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:15:06', '2023-07-01 07:15:06', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (26, 30, 10000, '1688166906728237', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:15:06', '2023-07-01 07:15:06', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (27, 30, 10000, '1688166906728237', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:15:06', '2023-07-01 07:15:06', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (28, 30, 10000, '1688166906728237', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:15:06', '2023-07-01 07:15:06', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (29, 31, 10000, '1688166950227658', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (30, 31, 10000, '1688166950227658', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (31, 31, 10000, '1688166950227658', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (32, 32, 10000, '1688166950240719', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (33, 31, 10000, '1688166950227658', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (34, 32, 10000, '1688166950240719', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (35, 32, 10000, '1688166950240719', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (36, 32, 10000, '1688166950240719', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (37, 33, 10000, '1688167052860587', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:17:32', '2023-07-01 07:17:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (38, 33, 10000, '1688167052860587', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:17:32', '2023-07-01 07:17:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (39, 33, 10000, '1688167052860587', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:17:32', '2023-07-01 07:17:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (40, 33, 10000, '1688167052860587', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:17:32', '2023-07-01 07:17:32', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (41, 34, 10000, '1688167100139227', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:18:20', '2023-07-01 07:18:20', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (42, 34, 10000, '1688167100139227', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:18:20', '2023-07-01 07:18:20', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (43, 34, 10000, '1688167100139227', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:18:20', '2023-07-01 07:18:20', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (44, 34, 10000, '1688167100139227', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:18:20', '2023-07-01 07:18:20', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (45, 35, 10000, '1688167141652319', 10001, '经典盖饭', NULL, 1, 11, 11, 0, '2023-07-01 07:19:01', '2023-07-01 07:19:01', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (46, 35, 10000, '1688167141652319', 10006, '555', NULL, 9, 55, 495, 0, '2023-07-01 07:19:01', '2023-07-01 07:19:01', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (47, 35, 10000, '1688167141652319', 10007, '111xxx', NULL, 8, 11333, 90664, 0, '2023-07-01 07:19:01', '2023-07-01 07:19:01', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (48, 35, 10000, '1688167141652319', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:19:01', '2023-07-01 07:19:01', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (49, 36, 10000, '1688167409295358', 10007, '111xxx', NULL, 1, 11333, 11333, 0, '2023-07-01 07:23:29', '2023-07-01 07:23:29', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (50, 36, 10000, '1688167409295358', 10008, 'aaa', NULL, 1, 0, 0, 0, '2023-07-01 07:23:29', '2023-07-01 07:23:29', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (51, 37, 10000, '1688167490908303', 10005, '4444', NULL, 1, 44, 44, 0, '2023-07-01 07:24:50', '2023-07-01 07:24:50', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (52, 38, 10000, '1688167579664994', 10007, '111xxx', NULL, 1, 11333, 11333, 0, '2023-07-01 07:26:19', '2023-07-01 07:26:19', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` int NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (1, '1688161364210625', 10000, 0, 0, '2023-07-01 05:42:44', '2023-07-01 05:42:44', NULL, NULL, 0);
INSERT INTO `orders` VALUES (2, '1688161364212773', 10000, 0, 0, '2023-07-01 05:42:44', '2023-07-01 05:42:44', NULL, NULL, 0);
INSERT INTO `orders` VALUES (3, '1688161390054340', 10000, 0, 0, '2023-07-01 05:43:10', '2023-07-01 05:43:10', NULL, NULL, 0);
INSERT INTO `orders` VALUES (4, '1688161504797253', 10000, 0, 0, '2023-07-01 05:45:04', '2023-07-01 05:45:04', NULL, NULL, 0);
INSERT INTO `orders` VALUES (5, '1688161593276651', 10000, 0, 0, '2023-07-01 05:46:33', '2023-07-01 05:46:33', NULL, NULL, 0);
INSERT INTO `orders` VALUES (6, '1688164204815131', 10000, 0, 0, '2023-07-01 06:30:04', '2023-07-01 06:30:04', NULL, NULL, 0);
INSERT INTO `orders` VALUES (7, '1688164264263401', 10000, 0, 0, '2023-07-01 06:31:04', '2023-07-01 06:31:04', NULL, NULL, 0);
INSERT INTO `orders` VALUES (8, '1688164264266721', 10000, 0, 0, '2023-07-01 06:31:04', '2023-07-01 06:31:04', NULL, NULL, 0);
INSERT INTO `orders` VALUES (9, '1688164509449285', 10000, 0, 0, '2023-07-01 06:35:09', '2023-07-01 06:35:09', NULL, NULL, 0);
INSERT INTO `orders` VALUES (10, '1688164565439533', 10000, 0, 0, '2023-07-01 06:36:05', '2023-07-01 06:36:05', NULL, NULL, 0);
INSERT INTO `orders` VALUES (11, '1688164597713282', 10000, 0, 0, '2023-07-01 06:36:37', '2023-07-01 06:36:37', NULL, NULL, 0);
INSERT INTO `orders` VALUES (12, '1688164973685701', 10000, 0, 0, '2023-07-01 06:42:53', '2023-07-01 06:42:53', NULL, NULL, 0);
INSERT INTO `orders` VALUES (13, '1688165066251315', 10000, 0, 0, '2023-07-01 06:44:26', '2023-07-01 06:44:26', NULL, NULL, 0);
INSERT INTO `orders` VALUES (14, '1688165143918745', 10000, 0, 0, '2023-07-01 06:45:43', '2023-07-01 06:45:43', NULL, NULL, 0);
INSERT INTO `orders` VALUES (15, '1688165353747304', 10000, 0, 0, '2023-07-01 06:49:13', '2023-07-01 06:49:13', NULL, NULL, 0);
INSERT INTO `orders` VALUES (16, '1688165467523800', 10000, 0, 0, '2023-07-01 06:51:07', '2023-07-01 06:51:07', NULL, NULL, 0);
INSERT INTO `orders` VALUES (17, '1688165651888708', 10000, 0, 0, '2023-07-01 06:54:11', '2023-07-01 06:54:11', NULL, NULL, 0);
INSERT INTO `orders` VALUES (18, '1688165773126739', 10000, 0, 0, '2023-07-01 06:56:13', '2023-07-01 06:56:13', NULL, NULL, 0);
INSERT INTO `orders` VALUES (19, '1688166020960490', 10000, 0, 0, '2023-07-01 07:00:20', '2023-07-01 07:00:20', NULL, NULL, 0);
INSERT INTO `orders` VALUES (20, '1688166115148809', 10000, 0, 0, '2023-07-01 07:01:55', '2023-07-01 07:01:55', NULL, NULL, 0);
INSERT INTO `orders` VALUES (21, '1688166253216705', 10000, 0, 0, '2023-07-01 07:04:13', '2023-07-01 07:04:13', NULL, NULL, 0);
INSERT INTO `orders` VALUES (22, '1688166312257302', 10000, 0, 0, '2023-07-01 07:05:12', '2023-07-01 07:05:12', NULL, NULL, 0);
INSERT INTO `orders` VALUES (23, '1688166312288929', 10000, 0, 0, '2023-07-01 07:05:12', '2023-07-01 07:05:12', NULL, NULL, 0);
INSERT INTO `orders` VALUES (24, '1688166359495648', 10000, 0, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `orders` VALUES (25, '1688166359501478', 10000, 0, 0, '2023-07-01 07:05:59', '2023-07-01 07:05:59', NULL, NULL, 0);
INSERT INTO `orders` VALUES (26, '1688166638063176', 10000, 0, 0, '2023-07-01 07:10:38', '2023-07-01 07:10:38', NULL, NULL, 0);
INSERT INTO `orders` VALUES (27, '1688166698383713', 10000, 0, 0, '2023-07-01 07:11:38', '2023-07-01 07:11:38', NULL, NULL, 0);
INSERT INTO `orders` VALUES (28, '1688166752773135', 10000, 0, 0, '2023-07-01 07:12:32', '2023-07-01 07:12:32', NULL, NULL, 0);
INSERT INTO `orders` VALUES (29, '1688166832747751', 10000, 0, 0, '2023-07-01 07:13:52', '2023-07-01 07:13:52', NULL, NULL, 0);
INSERT INTO `orders` VALUES (30, '1688166906728237', 10000, 0, 0, '2023-07-01 07:15:06', '2023-07-01 07:15:06', NULL, NULL, 0);
INSERT INTO `orders` VALUES (31, '1688166950227658', 10000, 0, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `orders` VALUES (32, '1688166950240719', 10000, 0, 0, '2023-07-01 07:15:50', '2023-07-01 07:15:50', NULL, NULL, 0);
INSERT INTO `orders` VALUES (33, '1688167052860587', 10000, 0, 0, '2023-07-01 07:17:32', '2023-07-01 07:17:32', NULL, NULL, 0);
INSERT INTO `orders` VALUES (34, '1688167100139227', 10000, 0, 0, '2023-07-01 07:18:20', '2023-07-01 07:18:20', NULL, NULL, 0);
INSERT INTO `orders` VALUES (35, '1688167141652319', 10000, 0, 0, '2023-07-01 07:19:01', '2023-07-01 07:19:01', NULL, NULL, 0);
INSERT INTO `orders` VALUES (36, '1688167409295358', 10000, 0, 0, '2023-07-01 07:23:29', '2023-07-01 07:23:29', NULL, NULL, 0);
INSERT INTO `orders` VALUES (37, '1688167490908303', 10000, 0, 0, '2023-07-01 07:24:50', '2023-07-01 07:24:50', NULL, NULL, 0);
INSERT INTO `orders` VALUES (38, '1688167579664994', 10000, 0, 0, '2023-07-01 07:26:19', '2023-07-01 07:26:19', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for role_auths
-- ----------------------------
DROP TABLE IF EXISTS `role_auths`;
CREATE TABLE `role_auths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auth_id` int NOT NULL,
  `role_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `descr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for skus
-- ----------------------------
DROP TABLE IF EXISTS `skus`;
CREATE TABLE `skus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sku_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `spu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `description` text COLLATE utf8_bin,
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `spu_id_sku_id_index` (`sku_id`,`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of skus
-- ----------------------------
BEGIN;
INSERT INTO `skus` VALUES (10000, '1111', '', '', '1111', 'http://localhost:3000/uploadimgs/upload_2bae4e368716c10b64fabf0eaed23251.png', 11.00, 1111, 1, '2023-06-24 17:23:51', '2023-07-01 02:18:17', '', '');
INSERT INTO `skus` VALUES (10001, '经典盖饭', '', '', '1111', 'http://localhost:3000/uploadimgs/upload_cd77573b47c305e7da0d7f7276fb61ec.png', 11.00, 1111, 0, '2023-06-24 17:28:41', '2023-07-01 02:20:19', '', '');
INSERT INTO `skus` VALUES (10002, '1111', '', '', '1111', 'http://localhost:3000/uploadimgs/upload_4fe8d81a0ed8d5637667816d777d75b6.png', 11.00, 1111, 0, '2023-06-24 17:31:11', '2023-07-01 01:40:29', '', '');
INSERT INTO `skus` VALUES (10003, '1111', '', '', '1111', 'http://localhost:3000/uploadimgs/upload_27d79c25b3fd6efee9dd961829ab96d8.png', 11.00, 1111, 0, '2023-06-24 17:31:54', '2023-07-01 01:41:10', '', '');
INSERT INTO `skus` VALUES (10004, '333', '', '', '333', 'http://localhost:3000/uploadimgs/upload_d72c281f491bcf654cfbf481c93259ed.png', 333.00, 333, 0, '2023-06-24 18:28:18', '2023-07-01 01:41:33', '', '');
INSERT INTO `skus` VALUES (10005, '4444', '', '', '4444', 'http://localhost:3000/uploadimgs/upload_c020b7339d4e0eb8cad2fbb0f07bf63e.png', 44.00, 444, 0, '2023-06-24 18:30:53', '2023-07-01 01:41:22', '', '');
INSERT INTO `skus` VALUES (10006, '555', '', '', '555', 'http://localhost:3000/uploadimgs/upload_ca76653599d783047c0728d1cafc4ceb.png', 55.00, 555, 0, '2023-06-24 18:34:01', '2023-07-01 01:18:40', '', '');
INSERT INTO `skus` VALUES (10007, '111xxx', '', '', '111', 'http://localhost:3000/uploadimgs/upload_5563dcc85cd3e942fe636b88a272f735.png', 11333.00, 111, 0, '2023-06-24 18:35:06', '2023-07-01 00:02:25', '', '');
INSERT INTO `skus` VALUES (10008, 'aaa', '', '', 'aaaaaa', 'http://localhost:3000/uploadimgs/upload_f83968b41ce731ef9c07b01359c275ae.png', 0.00, 22, 0, '2023-06-30 14:57:24', '2023-06-30 23:55:16', '', '');
COMMIT;

-- ----------------------------
-- Table structure for spus
-- ----------------------------
DROP TABLE IF EXISTS `spus`;
CREATE TABLE `spus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spu_id_index` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `stock` int DEFAULT '0',
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '123456',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (10000, 'wyp', '', '', 0, '123456', NULL, NULL, NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
