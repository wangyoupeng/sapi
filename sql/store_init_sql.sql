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

 Date: 28/07/2023 17:53:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `attribute_values` VALUES (10001, 10006, '蓝色', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10002, 10006, '红色', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10003, 10006, '绿色', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10004, 10008, '大份', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10005, 10008, '中份', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10006, 10008, '小份', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10007, 10010, '1500ml', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10008, 10010, '600ml', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10009, 10010, '330ml', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10010, 10011, '微辣', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10011, 10011, '中辣', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attribute_values` VALUES (10012, 10011, '变态辣', NULL, '2023-07-27 17:38:23', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of attributes
-- ----------------------------
BEGIN;
INSERT INTO `attributes` VALUES (10006, '颜色', '2023-07-24 10:11:56', '2023-07-25 09:29:45', NULL, NULL, 0);
INSERT INTO `attributes` VALUES (10007, '尺寸', '2023-07-24 10:11:56', '2023-07-25 09:29:46', NULL, NULL, 0);
INSERT INTO `attributes` VALUES (10008, '大/中/小份', '2023-07-24 10:11:56', '2023-07-25 09:29:46', NULL, NULL, 0);
INSERT INTO `attributes` VALUES (10009, '重量', '2023-07-24 10:11:56', '2023-07-25 09:29:47', NULL, NULL, 0);
INSERT INTO `attributes` VALUES (10010, '容量规格', '2023-07-24 10:11:56', '2023-07-25 09:29:51', NULL, NULL, 0);
INSERT INTO `attributes` VALUES (10011, '辣度', NULL, NULL, NULL, NULL, 0);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=10165 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` VALUES (10152, 10000, 10015, 2, '2023-07-13 15:59:00', '2023-07-14 13:13:07', '', '');
INSERT INTO `carts` VALUES (10154, 10000, 10013, 1, '2023-07-13 16:06:00', '2023-07-13 16:06:00', '', '');
INSERT INTO `carts` VALUES (10155, 10000, 10009, 1, '2023-07-13 16:06:05', '2023-07-14 14:28:55', '', '');
INSERT INTO `carts` VALUES (10156, 10000, 10014, 1, '2023-07-14 13:13:08', '2023-07-14 13:13:08', '', '');
INSERT INTO `carts` VALUES (10157, 10004, 10014, 1, '2023-07-14 14:46:39', '2023-07-28 08:15:10', '', '');
INSERT INTO `carts` VALUES (10161, 10004, 10010, 2, '2023-07-14 17:22:00', '2023-07-27 19:43:30', '', '');
INSERT INTO `carts` VALUES (10163, 10004, 10019, 1, '2023-07-27 19:42:40', '2023-07-27 19:42:40', '', '');
INSERT INTO `carts` VALUES (10164, 10004, 10024, 1, '2023-07-28 10:56:44', '2023-07-28 10:56:44', '', '');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `father_category_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (10001, '盖饭类', '', '各种盖饭', 0, '2023-07-13 08:44:52', '2023-07-13 08:44:52', '', '');
INSERT INTO `categories` VALUES (10002, '面类', '', '各种面，很好吃', 0, '2023-07-13 09:33:27', '2023-07-13 09:33:27', '', '');
INSERT INTO `categories` VALUES (10003, '饮品', '', '各种水不带酒精', 0, '2023-07-13 10:29:50', '2023-07-25 09:10:21', '', '');
COMMIT;

-- ----------------------------
-- Table structure for chat_conversation_messages
-- ----------------------------
DROP TABLE IF EXISTS `chat_conversation_messages`;
CREATE TABLE `chat_conversation_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL DEFAULT '0',
  `sender_id` int NOT NULL DEFAULT '0',
  `receiver_id` int NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for chat_conversations
-- ----------------------------
DROP TABLE IF EXISTS `chat_conversations`;
CREATE TABLE `chat_conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ids_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`user_ids_key`) USING BTREE,
  UNIQUE KEY `user_ids_key_unikey_unique` (`user_ids_key`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chat_conversations
-- ----------------------------
BEGIN;
INSERT INTO `chat_conversations` VALUES (1, '1000410007', NULL, NULL, NULL, NULL, 0);
INSERT INTO `chat_conversations` VALUES (2, '1000410006', NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for chat_room_messages
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_messages`;
CREATE TABLE `chat_room_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL DEFAULT '0',
  `sender_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for chat_rooms
-- ----------------------------
DROP TABLE IF EXISTS `chat_rooms`;
CREATE TABLE `chat_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chat_rooms
-- ----------------------------
BEGIN;
INSERT INTO `chat_rooms` VALUES (1, '聊天群1', NULL, NULL, NULL, NULL, 0);
INSERT INTO `chat_rooms` VALUES (2, '聊天群2', NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for chat_user_conversation
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_conversation`;
CREATE TABLE `chat_user_conversation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `conversation_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chat_user_conversation
-- ----------------------------
BEGIN;
INSERT INTO `chat_user_conversation` VALUES (1, 10004, 1, '2023-07-18 11:31:41', '2023-07-18 11:31:41', NULL, NULL, 0);
INSERT INTO `chat_user_conversation` VALUES (2, 10004, 2, '2023-07-18 11:31:54', '2023-07-18 11:31:54', NULL, NULL, 0);
INSERT INTO `chat_user_conversation` VALUES (3, 10006, 1, '2023-07-18 11:32:08', '2023-07-18 11:32:08', NULL, NULL, 0);
INSERT INTO `chat_user_conversation` VALUES (4, 10007, 2, '2023-07-18 11:32:22', '2023-07-18 11:32:22', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for chat_user_room
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_room`;
CREATE TABLE `chat_user_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chat_user_room
-- ----------------------------
BEGIN;
INSERT INTO `chat_user_room` VALUES (1, 10004, 1, 0, '2023-07-18 11:24:35', '2023-07-18 11:24:35', NULL, NULL, 0);
INSERT INTO `chat_user_room` VALUES (2, 10006, 1, 0, '2023-07-18 11:26:12', '2023-07-18 11:26:12', NULL, NULL, 0);
INSERT INTO `chat_user_room` VALUES (3, 10007, 1, 0, '2023-07-18 11:26:27', '2023-07-18 11:26:27', NULL, NULL, 0);
INSERT INTO `chat_user_room` VALUES (4, 10004, 2, 0, '2023-07-18 11:28:13', '2023-07-18 11:28:13', NULL, NULL, 0);
INSERT INTO `chat_user_room` VALUES (5, 10005, 2, 0, '2023-07-18 11:28:34', '2023-07-18 11:28:34', NULL, NULL, 0);
INSERT INTO `chat_user_room` VALUES (6, 10006, 2, 0, '2023-07-18 11:28:46', '2023-07-18 11:28:50', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for group_spu
-- ----------------------------
DROP TABLE IF EXISTS `group_spu`;
CREATE TABLE `group_spu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `spu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_spu
-- ----------------------------
BEGIN;
INSERT INTO `group_spu` VALUES (2, 10003, 10001, '2023-07-14 16:32:02', '2023-07-14 16:32:02', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (3, 10003, 10002, '2023-07-14 16:32:57', '2023-07-14 16:32:57', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (6, 10004, 10003, '2023-07-14 16:34:36', '2023-07-14 16:34:36', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (7, 10004, 10004, '2023-07-14 16:34:48', '2023-07-14 16:35:04', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (10, 10005, 10010, '2023-07-14 16:35:52', '2023-07-14 16:35:52', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (11, 10005, 10013, '2023-07-14 16:36:02', '2023-07-14 16:36:02', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (12, 10006, 10014, '2023-07-14 16:36:40', '2023-07-14 16:36:40', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (13, 10007, 10000, '2023-07-14 16:37:28', '2023-07-14 16:37:28', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (14, 10007, 10003, '2023-07-14 16:38:03', '2023-07-14 16:38:03', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (15, 10007, 10008, '2023-07-14 16:38:17', '2023-07-14 16:38:17', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (18, 10008, 10001, '2023-07-14 16:38:35', '2023-07-14 16:38:35', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (19, 10005, 10001, '2023-07-26 14:34:40', '2023-07-26 14:34:40', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (20, 10006, 10008, '2023-07-26 14:37:07', '2023-07-26 14:37:07', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (21, 10006, 10014, '2023-07-26 14:37:14', '2023-07-26 14:38:51', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (22, 10007, 10012, '2023-07-26 14:37:26', '2023-07-26 14:38:54', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (23, 10007, 10003, '2023-07-26 14:37:31', '2023-07-26 14:37:31', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (24, 10008, 10001, '2023-07-26 14:37:54', '2023-07-26 14:37:54', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (25, 10008, 10002, '2023-07-26 14:37:58', '2023-07-26 14:37:58', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (26, 10008, 10004, '2023-07-26 14:38:01', '2023-07-26 14:38:01', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (27, 10008, 10005, '2023-07-26 14:38:03', '2023-07-26 14:38:03', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (28, 10008, 10006, '2023-07-26 14:38:06', '2023-07-26 14:38:06', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (29, 10008, 10007, '2023-07-26 14:38:11', '2023-07-26 14:38:11', NULL, NULL, 0);
INSERT INTO `group_spu` VALUES (30, 10008, 10008, '2023-07-26 14:38:19', '2023-07-26 14:38:19', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_shelf` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of groups
-- ----------------------------
BEGIN;
INSERT INTO `groups` VALUES (10003, '盖饭们', '', 0, '2023-07-13 10:32:26', '2023-07-13 10:32:26', '', '', 0);
INSERT INTO `groups` VALUES (10004, '陕味面食', '', 0, '2023-07-13 10:33:00', '2023-07-13 10:33:00', '', '', 0);
INSERT INTO `groups` VALUES (10005, '单人套餐', '', 0, '2023-07-13 10:33:29', '2023-07-13 10:33:29', '', '', 0);
INSERT INTO `groups` VALUES (10006, '双人套餐', '', 0, '2023-07-13 10:33:40', '2023-07-13 10:33:40', '', '', 0);
INSERT INTO `groups` VALUES (10007, '必点', '', 0, '2023-07-13 10:33:58', '2023-07-13 10:33:58', '', '', 0);
INSERT INTO `groups` VALUES (10008, '人气热卖', '', 0, '2023-07-13 10:34:12', '2023-07-13 10:34:12', '', '', 0);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES (146, 87, 10004, '1689317645786811', 10010, '盖饭1', NULL, 2, 100, 200, 0, '2023-07-14 14:54:05', '2023-07-14 14:54:05', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (147, 87, 10004, '1689317645786811', 10013, 'aaaaaaa', NULL, 2, 1111, 2222, 0, '2023-07-14 14:54:05', '2023-07-14 14:54:05', NULL, NULL, 0);
INSERT INTO `order_items` VALUES (148, 88, 10004, '1690513027428623', 10013, 'aaaaaaa', NULL, 1, 1111, 1111, 0, '2023-07-28 10:57:07', '2023-07-28 10:57:07', NULL, NULL, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (87, '1689317645786811', 10004, 2422, 0, '2023-07-14 14:54:05', '2023-07-14 14:54:05', NULL, NULL, 0);
INSERT INTO `orders` VALUES (88, '1690513027428623', 10004, 1111, 0, '2023-07-28 10:57:07', '2023-07-28 10:57:07', NULL, NULL, 0);
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
-- Table structure for sku_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `sku_attribute_values`;
CREATE TABLE `sku_attribute_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku_id` int NOT NULL,
  `attribute_value_id` int NOT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sku_attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `sku_attribute_values` VALUES (20, 10004, 10010, '微辣', '2023-07-27 17:28:28', '2023-07-27 17:39:35', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (21, 10004, 10004, '大份', '2023-07-27 17:28:48', '2023-07-27 17:51:58', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (22, 10018, 10010, '微辣', '2023-07-27 17:29:00', '2023-07-27 17:52:47', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (23, 10018, 10005, '中份', '2023-07-27 17:29:32', '2023-07-27 17:57:40', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (24, 10019, 10010, '微辣', '2023-07-27 17:30:05', '2023-07-27 17:53:01', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (25, 10019, 10006, '小份', '2023-07-27 17:30:34', '2023-07-27 17:47:55', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (26, 10020, 10011, '中辣', '2023-07-27 17:49:24', '2023-07-27 18:00:15', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (27, 10020, 10004, '大份', '2023-07-27 17:49:52', '2023-07-27 18:01:47', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (28, 10026, 10011, '中辣', '2023-07-27 17:50:33', '2023-07-27 19:11:48', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (29, 10026, 10005, '中份', '2023-07-27 17:54:04', '2023-07-27 19:11:51', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (30, 10022, 10011, '中辣', '2023-07-27 17:54:29', '2023-07-27 18:00:18', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (31, 10022, 10006, '小份', '2023-07-27 17:54:34', '2023-07-27 18:01:57', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (32, 10023, 10012, '变态辣', '2023-07-27 17:54:41', '2023-07-27 18:00:42', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (33, 10023, 10004, '大份', '2023-07-27 17:54:45', '2023-07-27 18:02:00', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (34, 10024, 10012, '变态辣', '2023-07-27 17:54:49', '2023-07-27 18:00:43', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (35, 10024, 10005, '中份', '2023-07-27 17:54:53', '2023-07-27 18:02:03', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (36, 10025, 10012, '变态辣', '2023-07-27 17:54:55', '2023-07-27 18:01:03', NULL, NULL, 0);
INSERT INTO `sku_attribute_values` VALUES (37, 10025, 10006, '小份', '2023-07-27 17:54:58', '2023-07-27 18:02:11', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sku_images
-- ----------------------------
DROP TABLE IF EXISTS `sku_images`;
CREATE TABLE `sku_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `md5` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sku_versions
-- ----------------------------
DROP TABLE IF EXISTS `sku_versions`;
CREATE TABLE `sku_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version_id` int NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `image_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `attributes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for skus
-- ----------------------------
DROP TABLE IF EXISTS `skus`;
CREATE TABLE `skus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `spu_id` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin,
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `is_shelf` int NOT NULL DEFAULT '0',
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `version_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10027 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of skus
-- ----------------------------
BEGIN;
INSERT INTO `skus` VALUES (10000, '经典盖饭-大份', 10001, '大份的s', 'http://localhost:3000/api/images/1688966688813_gaifan.png', 2000, 1997, 0, 0, '2023-06-24 17:23:51', '2023-07-28 17:47:37', '', '', 0);
INSERT INTO `skus` VALUES (10001, '经典盖饭', 10001, '1111', 'http://localhost:3000/api/images/1688966661775_gaifan.png', 1800, 1799, 0, 0, '2023-06-24 17:28:41', '2023-07-26 14:19:47', '', '', 0);
INSERT INTO `skus` VALUES (10002, '鱼香肉丝饭', 10002, '鱼香肉丝滑', 'http://localhost:3000/api/images/1688966637634_gaifan2.png', 2100, 2095, 0, 0, '2023-06-24 17:31:11', '2023-07-26 14:20:01', '', '', 0);
INSERT INTO `skus` VALUES (10003, '牛肉面-方便面', 10003, '小时候的味道', 'http://localhost:3000/api/images/1688966603011_fangbianmian.png', 500, 499, 0, 0, '2023-06-24 17:31:54', '2023-07-26 14:20:07', '', '', 0);
INSERT INTO `skus` VALUES (10004, '牛腩面', 10004, '非常方便，非常好吃d', 'http://localhost:3000/images/1688969865971_fangbianmian.png', 600, 598, 0, 0, '2023-06-24 18:28:18', '2023-07-28 17:50:40', '', '', 0);
INSERT INTO `skus` VALUES (10005, '5100矿泉水', 10005, '好喝', 'http://localhost:3000/api/images/1688966545924_WX20230630-233525.png', 500, 494, 0, 0, '2023-06-24 18:30:53', '2023-07-26 14:20:24', '', '', 0);
INSERT INTO `skus` VALUES (10006, '西红柿面', 10003, '很好吃', 'http://localhost:3000/api/images/1688966513887_fangbianmian.png', 1500, 1490, 0, 0, '2023-06-24 18:34:01', '2023-07-26 14:20:42', '', '', 0);
INSERT INTO `skus` VALUES (10007, '雪碧(冰)', 10006, '冰凉一夏', 'http://localhost:3000/api/images/1688966500427_shui.png', 500, 385, 0, 0, '2023-06-24 18:35:06', '2023-07-26 14:21:35', '', '', 0);
INSERT INTO `skus` VALUES (10008, '牛肉面', 10003, '牛肉超大', 'http://localhost:3000/api/images/1688966478206_fangbianmian.png', 2250, 2238, 0, 0, '2023-06-30 14:57:24', '2023-07-26 14:21:42', '', '', 0);
INSERT INTO `skus` VALUES (10009, '肉丝盖饭', 10002, '非常好吃的肉丝', 'http://localhost:3000/api/images/1688966443964_gaifan2.png', 2500, 48, 0, 0, '2023-07-04 19:14:51', '2023-07-26 14:21:50', '', '', 0);
INSERT INTO `skus` VALUES (10010, '盖饭1', 10001, 'dfsdfsdfsd', 'http://localhost:3000/api/images/1688966411905_gaifan.png', 100, 95, 0, 0, '2023-07-05 18:05:09', '2023-07-26 14:21:53', '', '', 0);
INSERT INTO `skus` VALUES (10011, '山泉-5100', 10005, '高山融水', 'http://localhost:3000/api/images/1688966369162_WX20230630-233525.png', 100000, 998, 0, 0, '2023-07-05 19:19:34', '2023-07-26 14:22:07', '', '', 0);
INSERT INTO `skus` VALUES (10013, 'aaaaaaa', 10001, 'aaaaa', 'http://localhost:3000/images/1688969478967_WX20230630-233525.png', 1111, 108, 0, 0, '2023-07-10 13:18:40', '2023-07-28 10:57:07', '', '', 0);
INSERT INTO `skus` VALUES (10014, '牛肉面【小份】', 10003, '【小份】牛肉面', 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1500, 12, 0, 0, '2023-07-10 13:29:05', '2023-07-26 14:22:21', '', '', 0);
INSERT INTO `skus` VALUES (10015, '盖饭无图商品', 10001, '没有图片显示默认图片', 'http://localhost:3000/images/xxxxxxxx.png', 0, 100, 0, 0, '2023-07-13 15:40:43', '2023-07-26 14:39:21', '', '', 0);
INSERT INTO `skus` VALUES (10016, '牛肉面', 10003, '中份', 'http://localhost:3000/images/1690335041371_fangbianmian.png', 1800, 100, 0, 0, '2023-07-26 09:31:16', '2023-07-27 17:34:30', '', '', 0);
INSERT INTO `skus` VALUES (10017, '牛肉面', 10003, '大份，加面不限量', 'http://localhost:3000/images/1690335133929_fangbianmian.png', 2000, 100, 0, 0, '2023-07-26 09:32:18', '2023-07-27 17:34:22', '', '', 0);
INSERT INTO `skus` VALUES (10018, '牛腩面', 10004, '中份', 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1300, 88, 0, 0, '2023-07-27 17:33:23', '2023-07-27 18:08:44', '', '', 0);
INSERT INTO `skus` VALUES (10019, '牛腩面', 10004, '大分', 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1500, 65, 0, 0, '2023-07-27 17:34:12', '2023-07-27 18:08:45', '', '', 0);
INSERT INTO `skus` VALUES (10020, '牛腩面', 10004, NULL, 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1400, 33, 0, 0, '2023-07-27 17:41:29', '2023-07-27 18:08:45', '', '', 0);
INSERT INTO `skus` VALUES (10022, '牛腩面', 10004, NULL, 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1450, 22, 0, 0, '2023-07-27 17:42:38', '2023-07-27 18:08:46', '', '', 0);
INSERT INTO `skus` VALUES (10023, '牛腩面', 10004, NULL, 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1750, 23, 0, 0, '2023-07-27 17:43:36', '2023-07-27 18:08:46', '', '', 0);
INSERT INTO `skus` VALUES (10024, '牛腩面', 10004, NULL, 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1650, 23, 0, 0, '2023-07-27 17:43:56', '2023-07-27 18:08:48', '', '', 0);
INSERT INTO `skus` VALUES (10025, '牛腩面', 10004, NULL, 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1600, 23, 0, 0, '2023-07-27 17:43:57', '2023-07-27 18:08:48', '', '', 0);
INSERT INTO `skus` VALUES (10026, '牛腩面', 10004, 'qqqqqqqq', 'http://localhost:3000/images/1688969865971_fangbianmian.png', 1600, 34, 0, 0, '2023-07-27 19:10:03', '2023-07-28 17:37:07', '', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for spu_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spu_attributes`;
CREATE TABLE `spu_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `spu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of spu_attributes
-- ----------------------------
BEGIN;
INSERT INTO `spu_attributes` VALUES (1, 10008, 10001, '2023-07-25 09:24:39', '2023-07-25 09:24:39', NULL, NULL, 0);
INSERT INTO `spu_attributes` VALUES (19, 10008, 10002, '2023-07-25 09:24:55', '2023-07-25 09:24:55', NULL, NULL, 0);
INSERT INTO `spu_attributes` VALUES (20, 10011, 10004, '2023-07-27 14:24:54', '2023-07-27 17:37:33', NULL, NULL, 0);
INSERT INTO `spu_attributes` VALUES (21, 10008, 10004, '2023-07-27 14:25:04', '2023-07-27 15:28:59', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for spus
-- ----------------------------
DROP TABLE IF EXISTS `spus`;
CREATE TABLE `spus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_ shelf` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of spus
-- ----------------------------
BEGIN;
INSERT INTO `spus` VALUES (10001, 10001, '红烧肉盖饭', '红红的烧肉', 'http://localhost:3000/api/images/1688966411905_gaifan.png', 0, '2023-07-25 09:04:50', '2023-07-25 09:04:50', '', '', 0);
INSERT INTO `spus` VALUES (10002, 10001, '鱼香肉丝盖饭', '非常香的鱼肉丝', 'http://localhost:3000/api/images/1688966443964_gaifan2.png', 0, '2023-07-25 09:08:41', '2023-07-25 09:08:59', '', '', 0);
INSERT INTO `spus` VALUES (10003, 10002, '西红柿面', '打卤面', 'http://localhost:3000/api/images/1688966513887_fangbianmian.png', 0, '2023-07-26 14:15:27', '2023-07-26 14:15:27', '', '', 0);
INSERT INTO `spus` VALUES (10004, 10002, '牛腩面', '大块牛肉', 'http://localhost:3000/api/images/1688966478206_fangbianmian.png', 0, '2023-07-26 14:16:14', '2023-07-27 17:46:08', '', '', 0);
INSERT INTO `spus` VALUES (10005, 10003, '山泉-5100', '高山融水', 'http://localhost:3000/api/images/1688966369162_WX20230630-233525.png', 0, '2023-07-26 14:17:50', '2023-07-26 14:18:17', '', '', 0);
INSERT INTO `spus` VALUES (10006, 10003, '雪碧', '雪碧', 'http://localhost:3000/api/images/1688966500427_shui.png', 0, '2023-07-26 14:21:21', '2023-07-26 14:21:21', '', '', 0);
COMMIT;

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
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (10000, 'wypxx', '', '', '123456', '', NULL, '2023-07-05 23:29:43', NULL, NULL, 0);
INSERT INTO `users` VALUES (10004, 'wyp', '', '', '28e4b2f4fac870dad3ccaa50cbdb71a1b33fa7b93f331b3b9f689ce04a4df2135bc3d6de9b6b6dc4cc131d9aaba9dd875ad1e667aa7362a47dfeef3ac3c12204', '4f2d5a0d647e03ae08605570b4ed7101', NULL, NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (10005, 'wyp1111', '', '', '58d2a50e08a6b44a4412bd329108e87e4729a0c5fb8c302e566c3dd57e4c10f0cc9c0cbdcce4692d882c9b296d414964bf58dd7c0dac6412b3486f472904cccc', '11defe354c673ac13d9cbee9b9e4203c', NULL, NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (10006, 'zhang', '', '', '9b66f8d36d4100640f0c531e4a737c1cafecd4835156a928b9d2d13d6801402e383e4b0b9f5ecf05783b7e5c6b1831985840456d705ed309a7c9adb799d118a6', '551ae03d063b3a20a4a9eeed55e73a41', NULL, NULL, NULL, NULL, 0);
INSERT INTO `users` VALUES (10007, 'wang', '', '', 'f490684bed039a5886f550e4aa10d79ae841087651556b2452243f61d67163fe29ca02c3e9178195e35e220332f63a375489160d67bb25b20c25688e782ffd33', 'de12f17178df7e6bc46e3f454f7e8445', NULL, NULL, NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
