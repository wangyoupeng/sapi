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

 Date: 27/06/2023 01:11:30
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
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `is_del` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (10000, '1111', '1111', 'http://localhost:3000/uploadimgs/upload_ea69f11bacde53872d25d20b9c247942.png', 11.00, 1111, 0, '2023-06-24 17:23:51', '2023-06-24 17:23:51', '', '');
INSERT INTO `goods` VALUES (10001, '1111', '1111', 'http://localhost:3000/uploadimgs/upload_ea69f11bacde53872d25d20b9c247942.png', 11.00, 1111, 0, '2023-06-24 17:28:41', '2023-06-24 17:28:41', '', '');
INSERT INTO `goods` VALUES (10002, '1111', '1111', 'http://localhost:3000/uploadimgs/upload_ea69f11bacde53872d25d20b9c247942.png', 11.00, 1111, 0, '2023-06-24 17:31:11', '2023-06-24 17:31:11', '', '');
INSERT INTO `goods` VALUES (10003, '1111', '1111', 'http://localhost:3000/uploadimgs/upload_ea69f11bacde53872d25d20b9c247942.png', 11.00, 1111, 0, '2023-06-24 17:31:54', '2023-06-24 17:31:54', '', '');
INSERT INTO `goods` VALUES (10004, '333', '333', 'http://localhost:3000/uploadimgs/upload_b7080f4584c873efac57616ec6490a91.png', 333.00, 333, 0, '2023-06-24 18:28:18', '2023-06-24 18:28:18', '', '');
INSERT INTO `goods` VALUES (10005, '4444', '4444', 'http://localhost:3000/uploadimgs/upload_7fddbfba6361dc0b002961b9f0dc4079.png', 44.00, 444, 0, '2023-06-24 18:30:53', '2023-06-24 18:30:53', '', '');
INSERT INTO `goods` VALUES (10006, '555', '555', 'http://localhost:3000/uploadimgs/upload_d22c95677e57398062781d273f7ca287.png', 55.00, 555, 0, '2023-06-24 18:34:01', '2023-06-24 18:34:01', '', '');
INSERT INTO `goods` VALUES (10007, '111333', '111', 'http://localhost:3000/uploadimgs/upload_bf3df3e9b051ca97d341520612caa36e.png', 11333.00, 111, 0, '2023-06-24 18:35:06', '2023-06-25 01:48:30', '', '');
COMMIT;

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
  `goods_id` int NOT NULL,
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `goods_version_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_del` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
