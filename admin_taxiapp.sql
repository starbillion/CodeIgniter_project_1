/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : admin_taxiapp

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-10 03:44:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rides_status` varchar(50) DEFAULT NULL,
  `rides_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of appointments
-- ----------------------------

-- ----------------------------
-- Table structure for availability
-- ----------------------------
DROP TABLE IF EXISTS `availability`;
CREATE TABLE `availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sunday_from` time DEFAULT NULL,
  `sunday_to` time DEFAULT NULL,
  `monday_from` time DEFAULT NULL,
  `monday_to` time DEFAULT NULL,
  `tuesday_from` time DEFAULT NULL,
  `tuesday_to` time DEFAULT NULL,
  `wednesday_from` time DEFAULT NULL,
  `wednesday_to` time DEFAULT NULL,
  `thursday_from` time DEFAULT NULL,
  `thursday_to` time DEFAULT NULL,
  `friday_from` time DEFAULT NULL,
  `friday_to` time DEFAULT NULL,
  `saturday_from` time DEFAULT NULL,
  `saturday_to` time DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of availability
-- ----------------------------
INSERT INTO `availability` VALUES ('1', '22:30:00', '22:30:00', '03:00:00', '01:30:00', '05:00:00', '02:30:00', '05:00:00', '02:30:00', '03:00:00', '01:00:00', '02:30:00', '00:30:00', '04:30:00', '02:00:00', '1', '2018-02-25 12:27:18', '2018-02-25 20:27:18', null);
INSERT INTO `availability` VALUES ('4', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '3', '2018-02-25 12:04:42', '2018-02-25 12:04:42', null);
INSERT INTO `availability` VALUES ('5', '01:30:00', '01:00:00', '04:00:00', '01:30:00', '06:30:00', '04:00:00', '11:00:00', '02:00:00', '20:00:00', '16:00:00', '11:00:00', '09:00:00', '21:30:00', '07:00:00', '5', '2018-02-25 12:32:59', '2018-02-25 20:32:59', null);
INSERT INTO `availability` VALUES ('6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '21', null, null, null);
INSERT INTO `availability` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '23', null, null, null);
INSERT INTO `availability` VALUES ('8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '24', null, null, null);
INSERT INTO `availability` VALUES ('9', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '25', null, null, null);
INSERT INTO `availability` VALUES ('10', '23:30:00', '17:00:00', '02:30:00', '00:30:00', '02:00:00', '01:00:00', '19:30:00', '02:30:00', '02:30:00', '01:30:00', '09:00:00', '08:00:00', '12:30:00', '00:00:00', '26', '2018-03-06 16:01:30', '2018-03-06 16:01:30', null);
INSERT INTO `availability` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '27', null, null, null);
INSERT INTO `availability` VALUES ('12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '28', null, null, null);
INSERT INTO `availability` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '29', null, null, null);

-- ----------------------------
-- Table structure for backups
-- ----------------------------
DROP TABLE IF EXISTS `backups`;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backups
-- ----------------------------

-- ----------------------------
-- Table structure for booking_time_slot
-- ----------------------------
DROP TABLE IF EXISTS `booking_time_slot`;
CREATE TABLE `booking_time_slot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `date_time_slot` date DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `fare_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of booking_time_slot
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_name` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '2018-02-22 06:50:38', 'Audi', '2018-02-21 23:50:38', '2018-02-27 06:50:38');
INSERT INTO `categories` VALUES ('2', '2018-02-22 06:50:43', 'BMW', '2018-02-21 23:50:43', '2018-02-27 06:50:43');
INSERT INTO `categories` VALUES ('3', null, 'Uplift_X', '2018-02-22 06:50:56', '2018-02-27 06:50:56');
INSERT INTO `categories` VALUES ('4', null, 'Uplift_Lux', '2018-02-22 06:51:06', '2018-02-27 06:51:06');
INSERT INTO `categories` VALUES ('5', '2018-02-23 07:48:38', 'Uplift_Suv', '2018-02-23 00:48:38', '2018-02-27 07:48:38');
INSERT INTO `categories` VALUES ('6', null, 'Uplift_XL', '2018-02-23 07:48:53', '2018-02-27 07:48:53');
INSERT INTO `categories` VALUES ('7', null, 'Uplift_Exec', '2018-02-23 07:49:08', '2018-02-27 07:49:08');
INSERT INTO `categories` VALUES ('8', null, 'Uplift_WAV', '2018-02-23 07:49:30', '2018-02-27 07:49:30');

-- ----------------------------
-- Table structure for client_details
-- ----------------------------
DROP TABLE IF EXISTS `client_details`;
CREATE TABLE `client_details` (
  `client_id` int(255) NOT NULL,
  `client_first_name` varchar(255) DEFAULT NULL,
  `client_last_name` varchar(255) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client_details
-- ----------------------------
INSERT INTO `client_details` VALUES ('0', null, null, null, null, null, '2018-02-22 00:12:58', '2018-02-22 08:12:58', '2018-02-22 08:12:58');

-- ----------------------------
-- Table structure for colours
-- ----------------------------
DROP TABLE IF EXISTS `colours`;
CREATE TABLE `colours` (
  `colours_id` int(11) NOT NULL AUTO_INCREMENT,
  `colours_name` varchar(256) DEFAULT NULL,
  `make_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`colours_id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of colours
-- ----------------------------
INSERT INTO `colours` VALUES ('1', 'green', '4', '2018-02-23 00:53:31', '2018-02-23 07:53:31', '2018-02-23 07:53:31');
INSERT INTO `colours` VALUES ('2', 'blue', '4', '2018-02-23 00:53:37', '2018-02-23 07:53:37', '2018-02-23 07:53:37');
INSERT INTO `colours` VALUES ('3', 'white', '4', '2018-02-23 00:53:42', '2018-02-23 07:53:42', '2018-02-23 07:53:42');
INSERT INTO `colours` VALUES ('4', 'Pink', '5', '2018-02-23 00:53:47', '2018-02-23 07:53:47', '2018-02-23 07:53:47');
INSERT INTO `colours` VALUES ('5', 'Tst_coor', '5', '2018-02-23 00:53:51', '2018-02-23 07:53:51', '2018-02-23 07:53:51');
INSERT INTO `colours` VALUES ('6', 'Ibis White', '5', '2018-02-26 17:36:55', '2018-02-27 00:36:55', null);
INSERT INTO `colours` VALUES ('7', 'Mythos Black Metallic', '4', '2018-02-23 07:54:23', '2018-02-23 07:54:23', null);
INSERT INTO `colours` VALUES ('8', 'Floret Silver Metallic', '4', '2018-02-23 08:00:21', '2018-02-23 08:00:21', null);
INSERT INTO `colours` VALUES ('9', 'Brilliant Black', '4', '2018-02-24 00:10:07', '2018-02-24 00:10:07', null);
INSERT INTO `colours` VALUES ('10', 'Argus Brown', '4', '2018-02-24 00:10:27', '2018-02-24 00:10:27', null);
INSERT INTO `colours` VALUES ('11', 'Cuvée Silver', '4', '2018-02-24 00:10:43', '2018-02-24 00:10:43', null);
INSERT INTO `colours` VALUES ('12', 'Glacier White', '4', '2018-02-24 00:10:59', '2018-02-24 00:10:59', null);
INSERT INTO `colours` VALUES ('13', 'Gotland Green', '4', '2018-02-24 00:11:15', '2018-02-24 00:11:15', null);
INSERT INTO `colours` VALUES ('14', 'Manhattan Grey', '4', '2018-02-24 00:11:27', '2018-02-24 00:11:27', null);
INSERT INTO `colours` VALUES ('15', 'Matador Red', '4', '2018-02-24 00:11:39', '2018-02-24 00:11:39', null);
INSERT INTO `colours` VALUES ('16', 'Monsoon Grey', '4', '2018-02-24 00:12:02', '2018-02-24 00:12:02', null);
INSERT INTO `colours` VALUES ('17', 'Moonlight Blue', '4', '2018-02-24 00:12:16', '2018-02-24 00:12:16', null);
INSERT INTO `colours` VALUES ('18', 'Scuba Blue', '4', '2018-02-24 00:12:43', '2018-02-24 00:12:43', null);
INSERT INTO `colours` VALUES ('19', 'Tango Red', '4', '2018-02-24 00:12:56', '2018-02-24 00:12:56', null);
INSERT INTO `colours` VALUES ('20', 'Daytona Grey Pearl', '4', '2018-02-24 00:13:11', '2018-02-24 00:13:11', null);
INSERT INTO `colours` VALUES ('21', 'Black', '42', '2018-02-24 00:14:26', '2018-02-24 00:14:26', null);
INSERT INTO `colours` VALUES ('22', 'Polar White', '42', '2018-02-24 00:14:46', '2018-02-24 00:14:46', null);
INSERT INTO `colours` VALUES ('23', 'Tenorite Grey', '42', '2018-02-24 00:15:04', '2018-02-24 00:15:04', null);
INSERT INTO `colours` VALUES ('24', 'Obsidian Black', '42', '2018-02-24 00:15:19', '2018-02-24 00:15:19', null);
INSERT INTO `colours` VALUES ('25', 'Diamond Silver', '42', '2018-02-24 00:15:37', '2018-02-24 00:15:37', null);
INSERT INTO `colours` VALUES ('26', 'Palladium Silver', '42', '2018-02-24 00:15:52', '2018-02-24 00:15:52', null);
INSERT INTO `colours` VALUES ('27', 'Iridium Silver', '42', '2018-02-24 00:16:07', '2018-02-24 00:16:07', null);
INSERT INTO `colours` VALUES ('28', 'Cavansite Blue', '42', '2018-02-24 00:16:25', '2018-02-24 00:16:25', null);
INSERT INTO `colours` VALUES ('29', 'Hyacinth Red ‘Designo’ ', '42', '2018-02-24 00:16:41', '2018-02-24 00:16:41', null);
INSERT INTO `colours` VALUES ('30', 'Diamond White', '42', '2018-02-24 00:16:59', '2018-02-24 00:16:59', null);
INSERT INTO `colours` VALUES ('31', 'Anthracite', '7', '2018-02-24 00:51:15', '2018-02-24 00:51:15', null);
INSERT INTO `colours` VALUES ('32', 'Anthracite Satin', '7', '2018-02-24 00:51:37', '2018-02-24 00:51:37', null);
INSERT INTO `colours` VALUES ('33', 'Beluga (Solid)', '7', '2018-02-24 00:52:00', '2018-02-24 00:52:00', null);
INSERT INTO `colours` VALUES ('34', 'Black Crystal', '7', '2018-02-24 00:52:20', '2018-02-24 00:52:20', null);
INSERT INTO `colours` VALUES ('35', 'Light Onyx', '7', '2018-02-24 20:27:29', '2018-02-24 20:27:29', null);
INSERT INTO `colours` VALUES ('36', 'Onyx', '7', '2018-02-24 20:27:46', '2018-02-24 20:27:46', null);
INSERT INTO `colours` VALUES ('37', 'Royal Ebony', '7', '2018-02-24 20:28:01', '2018-02-24 20:28:01', null);
INSERT INTO `colours` VALUES ('38', 'Spectre', '7', '2018-02-24 20:28:15', '2018-02-24 20:28:15', null);
INSERT INTO `colours` VALUES ('39', 'Storm Grey', '7', '2018-02-24 20:28:30', '2018-02-24 20:28:30', null);
INSERT INTO `colours` VALUES ('40', 'Titan Grey', '7', '2018-02-24 20:28:44', '2018-02-24 20:28:44', null);
INSERT INTO `colours` VALUES ('41', 'Aquamarine', '7', '2018-02-24 20:29:08', '2018-02-24 20:29:08', null);
INSERT INTO `colours` VALUES ('42', 'Black Sapphire', '7', '2018-02-24 20:29:35', '2018-02-24 20:29:35', null);
INSERT INTO `colours` VALUES ('43', 'Blue Crystal', '7', '2018-02-24 20:29:49', '2018-02-24 20:29:49', null);
INSERT INTO `colours` VALUES ('44', 'Dark Sapphire', '7', '2018-02-24 20:30:10', '2018-02-24 20:30:10', null);
INSERT INTO `colours` VALUES ('45', 'Fountain Blue', '7', '2018-02-24 20:30:31', '2018-02-24 20:30:31', null);
INSERT INTO `colours` VALUES ('46', 'Glacier Blue (Solid)', '7', '2018-02-24 20:30:47', '2018-02-24 20:30:47', null);
INSERT INTO `colours` VALUES ('47', 'Jetstream II', '7', '2018-02-24 20:31:14', '2018-02-24 20:31:14', null);
INSERT INTO `colours` VALUES ('48', 'Kingfisher', '7', '2018-02-24 20:31:37', '2018-02-24 20:31:37', null);
INSERT INTO `colours` VALUES ('49', 'Light Sapphire', '7', '2018-02-24 20:32:02', '2018-02-24 20:32:02', null);
INSERT INTO `colours` VALUES ('50', 'Light Windsor Blue', '7', '2018-02-24 20:33:56', '2018-02-24 20:33:56', null);
INSERT INTO `colours` VALUES ('51', 'Marlin', '7', '2018-02-24 20:34:10', '2018-02-24 20:34:10', null);
INSERT INTO `colours` VALUES ('52', 'Meteor', '7', '2018-02-24 20:34:24', '2018-02-24 20:34:24', null);
INSERT INTO `colours` VALUES ('53', 'Moroccan Blue', '7', '2018-02-24 20:34:38', '2018-02-24 20:34:38', null);
INSERT INTO `colours` VALUES ('54', 'Neptune', '7', '2018-02-24 20:34:55', '2018-02-24 20:34:55', null);
INSERT INTO `colours` VALUES ('55', 'Oxford Blue (Solid)', '7', '2018-02-24 20:35:11', '2018-02-24 20:35:11', null);
INSERT INTO `colours` VALUES ('56', 'Pale Sapphire', '7', '2018-02-24 20:35:31', '2018-02-24 20:35:31', null);
INSERT INTO `colours` VALUES ('57', 'Peacock', '7', '2018-02-24 20:35:50', '2018-02-24 20:35:50', null);
INSERT INTO `colours` VALUES ('58', 'Portofino', '7', '2018-02-24 20:38:03', '2018-02-24 20:38:03', null);
INSERT INTO `colours` VALUES ('59', 'Sequin Blue', '7', '2018-02-24 20:38:21', '2018-02-24 20:38:21', null);
INSERT INTO `colours` VALUES ('60', 'Silverlake', '7', '2018-02-24 20:38:36', '2018-02-24 20:38:36', null);
INSERT INTO `colours` VALUES ('61', 'Thunder', '7', '2018-02-24 20:38:57', '2018-02-24 20:38:57', null);
INSERT INTO `colours` VALUES ('62', 'Windsor Blue', '7', '2018-02-24 20:39:12', '2018-02-24 20:39:12', null);
INSERT INTO `colours` VALUES ('63', 'Amber', '7', '2018-02-24 20:39:36', '2018-02-24 20:39:36', null);
INSERT INTO `colours` VALUES ('64', 'Arabica', '7', '2018-02-24 20:39:52', '2018-02-24 20:39:52', null);
INSERT INTO `colours` VALUES ('65', 'Bentayga Bronze', '7', '2018-02-24 20:40:09', '2018-02-24 20:40:09', null);
INSERT INTO `colours` VALUES ('66', 'Brodgar', '7', '2018-02-24 20:40:25', '2018-02-24 20:40:25', null);
INSERT INTO `colours` VALUES ('67', 'Bronze', '7', '2018-02-24 20:40:44', '2018-02-24 20:40:44', null);
INSERT INTO `colours` VALUES ('68', 'Burnt Oak', '7', '2018-02-24 20:40:59', '2018-02-24 20:40:59', null);
INSERT INTO `colours` VALUES ('69', 'Burnt Orange', '7', '2018-02-24 20:41:13', '2018-02-24 20:41:13', null);
INSERT INTO `colours` VALUES ('70', 'Camel', '7', '2018-02-24 20:41:36', '2018-02-24 20:41:36', null);
INSERT INTO `colours` VALUES ('71', 'Dark Cashmere', '7', '2018-02-24 20:41:53', '2018-02-24 20:41:53', null);
INSERT INTO `colours` VALUES ('72', 'Gazelle', '7', '2018-02-24 20:42:10', '2018-02-24 20:42:10', null);
INSERT INTO `colours` VALUES ('73', 'Havana', '7', '2018-02-24 20:42:25', '2018-02-24 20:42:25', null);
INSERT INTO `colours` VALUES ('74', 'Khamun', '7', '2018-02-24 20:42:44', '2018-02-24 20:42:44', null);
INSERT INTO `colours` VALUES ('75', 'Light Gazelle', '7', '2018-02-24 20:42:59', '2018-02-24 20:42:59', null);
INSERT INTO `colours` VALUES ('76', 'Orange Flame', '7', '2018-02-24 20:43:15', '2018-02-24 20:43:15', null);
INSERT INTO `colours` VALUES ('77', 'Pale Brodgar', '7', '2018-02-24 20:43:29', '2018-02-24 20:43:29', null);
INSERT INTO `colours` VALUES ('78', 'Rose Gold', '7', '2018-02-24 20:43:50', '2018-02-24 20:43:50', null);
INSERT INTO `colours` VALUES ('79', 'Sandstone', '7', '2018-02-24 20:44:11', '2018-02-24 20:44:11', null);
INSERT INTO `colours` VALUES ('80', 'Sunburst Gold', '7', '2018-02-24 20:44:39', '2018-02-24 20:44:39', null);
INSERT INTO `colours` VALUES ('81', 'Alpine Green', '7', '2018-02-24 20:45:07', '2018-02-24 20:45:07', null);
INSERT INTO `colours` VALUES ('82', 'Apple Green', '7', '2018-02-24 20:45:21', '2018-02-24 20:45:21', null);
INSERT INTO `colours` VALUES ('83', 'Barnato (Solid)', '7', '2018-02-24 20:45:35', '2018-02-24 20:45:35', null);
INSERT INTO `colours` VALUES ('84', 'British Racing Green 4 (Solid)', '7', '2018-02-24 20:45:51', '2018-02-24 20:45:51', null);
INSERT INTO `colours` VALUES ('85', 'Cumbrian Green', '7', '2018-02-24 20:46:19', '2018-02-24 20:46:19', null);
INSERT INTO `colours` VALUES ('86', 'Cypress', '7', '2018-02-24 20:46:42', '2018-02-24 20:46:42', null);
INSERT INTO `colours` VALUES ('87', 'Light Emerald', '7', '2018-02-24 20:46:57', '2018-02-24 20:46:57', null);
INSERT INTO `colours` VALUES ('88', 'Midnight Emerald', '7', '2018-02-24 20:47:11', '2018-02-24 20:47:11', null);
INSERT INTO `colours` VALUES ('89', 'Radium', '7', '2018-02-24 20:47:32', '2018-02-24 20:47:32', null);
INSERT INTO `colours` VALUES ('90', 'Spruce', '7', '2018-02-24 20:47:45', '2018-02-24 20:47:45', null);
INSERT INTO `colours` VALUES ('91', 'Verdant', '7', '2018-02-24 20:48:06', '2018-02-24 20:48:06', null);
INSERT INTO `colours` VALUES ('92', 'Azure Purple', '7', '2018-02-24 21:08:36', '2018-02-24 21:08:36', null);
INSERT INTO `colours` VALUES ('93', 'Black Velvet', '7', '2018-02-24 21:08:55', '2018-02-24 21:08:55', null);
INSERT INTO `colours` VALUES ('94', 'Burgundy', '7', '2018-02-24 21:09:08', '2018-02-24 21:09:08', null);
INSERT INTO `colours` VALUES ('95', 'Candy Red', '7', '2018-02-24 21:09:22', '2018-02-24 21:09:22', null);
INSERT INTO `colours` VALUES ('96', 'Claret', '7', '2018-02-24 21:09:35', '2018-02-24 21:09:35', null);
INSERT INTO `colours` VALUES ('97', 'Damson', '7', '2018-02-24 21:10:05', '2018-02-24 21:10:05', null);
INSERT INTO `colours` VALUES ('98', 'Dragon Red II', '7', '2018-02-24 21:10:20', '2018-02-24 21:10:20', null);
INSERT INTO `colours` VALUES ('99', 'Grey Violet', '7', '2018-02-24 21:10:37', '2018-02-24 21:10:37', null);
INSERT INTO `colours` VALUES ('100', 'Magenta', '7', '2018-02-24 21:10:55', '2018-02-24 21:10:55', null);
INSERT INTO `colours` VALUES ('101', 'Pale Velvet', '7', '2018-02-24 21:11:12', '2018-02-24 21:11:12', null);
INSERT INTO `colours` VALUES ('102', 'Passion Pink', '7', '2018-02-24 21:11:27', '2018-02-24 21:11:27', null);
INSERT INTO `colours` VALUES ('103', 'Rubino Red', '7', '2018-02-24 21:11:41', '2018-02-24 21:11:41', null);
INSERT INTO `colours` VALUES ('104', 'St James Red (Pearlescent)', '7', '2018-02-24 21:11:57', '2018-02-24 21:11:57', null);
INSERT INTO `colours` VALUES ('105', 'St James Red (Solid)', '7', '2018-02-24 21:12:11', '2018-02-24 21:12:11', null);
INSERT INTO `colours` VALUES ('106', 'Sunset', '7', '2018-02-24 21:12:26', '2018-02-24 21:12:26', null);
INSERT INTO `colours` VALUES ('107', 'Violette', '7', '2018-02-24 21:12:43', '2018-02-24 21:12:43', null);
INSERT INTO `colours` VALUES ('108', 'Breeze', '7', '2018-02-24 21:13:22', '2018-02-24 21:13:22', null);
INSERT INTO `colours` VALUES ('109', 'Extreme Silver', '7', '2018-02-24 21:14:08', '2018-02-24 21:14:08', null);
INSERT INTO `colours` VALUES ('110', 'Extreme Silver Satin', '7', '2018-02-24 21:14:24', '2018-02-24 21:14:24', null);
INSERT INTO `colours` VALUES ('111', 'Dark Grey Satin', '7', '2018-02-24 21:14:43', '2018-02-24 21:14:43', null);
INSERT INTO `colours` VALUES ('112', 'Granite', '7', '2018-02-24 21:14:58', '2018-02-24 21:14:58', null);
INSERT INTO `colours` VALUES ('113', 'Hallmark', '7', '2018-02-24 21:15:14', '2018-02-24 21:15:14', null);
INSERT INTO `colours` VALUES ('114', 'Ice', '7', '2018-02-24 21:15:27', '2018-02-24 21:15:27', null);
INSERT INTO `colours` VALUES ('115', 'Light Grey Satin', '7', '2018-02-24 21:15:41', '2018-02-24 21:15:41', null);
INSERT INTO `colours` VALUES ('116', 'Magnetic', '7', '2018-02-24 21:16:09', '2018-02-24 21:16:09', null);
INSERT INTO `colours` VALUES ('117', 'Moonbeam', '7', '2018-02-24 21:16:30', '2018-02-24 21:16:30', null);
INSERT INTO `colours` VALUES ('118', 'Silver Frost', '7', '2018-02-24 21:16:46', '2018-02-24 21:16:46', null);
INSERT INTO `colours` VALUES ('119', 'Silver Storm', '7', '2018-02-24 21:17:02', '2018-02-24 21:17:02', null);
INSERT INTO `colours` VALUES ('120', 'Silver Taupe', '7', '2018-02-24 21:17:16', '2018-02-24 21:17:16', null);
INSERT INTO `colours` VALUES ('121', 'Tungsten', '7', '2018-02-24 21:17:29', '2018-02-24 21:17:29', null);
INSERT INTO `colours` VALUES ('122', 'Venusian Grey', '7', '2018-02-24 21:17:42', '2018-02-24 21:17:42', null);
INSERT INTO `colours` VALUES ('123', 'Arctica (Solid)', '7', '2018-02-24 21:18:02', '2018-02-24 21:18:02', null);
INSERT INTO `colours` VALUES ('124', 'Dove Grey (Solid)', '7', '2018-02-24 21:18:16', '2018-02-24 21:18:16', null);
INSERT INTO `colours` VALUES ('125', 'Glacier White (Solid)', '7', '2018-02-24 21:18:32', '2018-02-24 21:18:32', null);
INSERT INTO `colours` VALUES ('126', 'Ghost White (Pearlescent)', '7', '2018-02-24 21:18:52', '2018-02-24 21:18:52', null);
INSERT INTO `colours` VALUES ('127', 'Julep', '7', '2018-02-24 21:19:06', '2018-02-24 21:19:06', null);
INSERT INTO `colours` VALUES ('128', 'Magnolia (Solid)', '7', '2018-02-24 21:19:19', '2018-02-24 21:19:19', null);
INSERT INTO `colours` VALUES ('129', 'Monaco Yellow (Solid)', '7', '2018-02-24 21:19:33', '2018-02-24 21:19:33', null);
INSERT INTO `colours` VALUES ('130', 'Old English White (Solid)', '7', '2018-02-24 21:19:48', '2018-02-24 21:19:48', null);
INSERT INTO `colours` VALUES ('131', 'Porcelain', '7', '2018-02-24 21:20:06', '2018-02-24 21:20:06', null);
INSERT INTO `colours` VALUES ('132', 'Special Magnolia (Pearlescent)', '7', '2018-02-24 21:20:21', '2018-02-24 21:20:21', null);
INSERT INTO `colours` VALUES ('133', 'Special Magnolia (Solid)', '7', '2018-02-24 21:20:57', '2018-02-24 21:20:57', null);
INSERT INTO `colours` VALUES ('134', 'White Sand', '7', '2018-02-24 21:21:12', '2018-02-24 21:21:12', null);
INSERT INTO `colours` VALUES ('135', 'White Satin', '7', '2018-02-24 21:21:27', '2018-02-24 21:21:27', null);
INSERT INTO `colours` VALUES ('136', 'Billet Silver Metallic ', '16', '2018-02-24 21:40:17', '2018-02-24 21:40:17', null);
INSERT INTO `colours` VALUES ('137', 'Jazz Blue Pearl', '16', '2018-02-24 21:40:33', '2018-02-24 21:40:33', null);
INSERT INTO `colours` VALUES ('138', 'Molten Silver', '16', '2018-02-24 21:40:47', '2018-02-24 21:40:47', null);
INSERT INTO `colours` VALUES ('139', 'Bright White Clear Coat', '16', '2018-02-24 21:41:11', '2018-02-24 21:41:11', null);
INSERT INTO `colours` VALUES ('140', 'Brilliant Black Crystal Pearl', '16', '2018-02-24 21:42:02', '2018-02-24 21:42:02', null);
INSERT INTO `colours` VALUES ('141', 'Granite Crystal Metallic', '16', '2018-02-24 21:42:17', '2018-02-24 21:42:17', null);
INSERT INTO `colours` VALUES ('142', 'Velvet Red', '16', '2018-02-24 21:42:39', '2018-02-24 21:42:39', null);
INSERT INTO `colours` VALUES ('143', 'Dark Cordovan', '16', '2018-02-24 21:42:57', '2018-02-24 21:42:57', null);
INSERT INTO `colours` VALUES ('144', 'Tusk White Pearl Coat', '16', '2018-02-24 21:43:12', '2018-02-24 21:43:12', null);
INSERT INTO `colours` VALUES ('145', 'Alpine White', '6', '2018-02-24 21:45:08', '2018-02-24 21:45:08', null);
INSERT INTO `colours` VALUES ('146', 'Jet Black', '6', '2018-02-24 21:45:28', '2018-02-24 21:45:28', null);
INSERT INTO `colours` VALUES ('147', 'Mineral White', '6', '2018-02-24 21:45:44', '2018-02-24 21:45:44', null);
INSERT INTO `colours` VALUES ('148', 'Black Sapphire', '6', '2018-02-24 21:45:58', '2018-02-24 21:45:58', null);
INSERT INTO `colours` VALUES ('149', 'Glacier Silver', '6', '2018-02-24 21:46:14', '2018-02-24 21:46:14', null);
INSERT INTO `colours` VALUES ('150', 'Mineral Grey', '6', '2018-02-24 21:46:30', '2018-02-24 21:46:30', null);
INSERT INTO `colours` VALUES ('151', 'Melbourne Red Metallic', '6', '2018-02-24 21:46:44', '2018-02-24 21:46:44', null);
INSERT INTO `colours` VALUES ('152', 'Imperial Blue Xirallic', '6', '2018-02-24 21:46:58', '2018-02-24 21:46:58', null);
INSERT INTO `colours` VALUES ('153', 'Jatoba', '6', '2018-02-24 21:47:13', '2018-02-24 21:47:13', null);
INSERT INTO `colours` VALUES ('154', 'Platinum Silver', '6', '2018-02-24 21:47:28', '2018-02-24 21:47:28', null);
INSERT INTO `colours` VALUES ('155', 'Mediterranean Blue', '6', '2018-02-24 21:47:42', '2018-02-24 21:47:42', null);
INSERT INTO `colours` VALUES ('156', 'Estoril Blue', '6', '2018-02-24 21:47:58', '2018-02-24 21:47:58', null);
INSERT INTO `colours` VALUES ('157', 'Citrine black', '6', '2018-02-24 21:48:14', '2018-02-24 21:48:14', null);
INSERT INTO `colours` VALUES ('158', 'Champagne Quartz', '6', '2018-02-24 21:48:29', '2018-02-24 21:48:29', null);
INSERT INTO `colours` VALUES ('159', 'Tanzanite Blue', '6', '2018-02-24 21:48:45', '2018-02-24 21:48:45', null);
INSERT INTO `colours` VALUES ('160', 'Smoked Topaz', '6', '2018-02-24 21:49:00', '2018-02-24 21:49:00', null);
INSERT INTO `colours` VALUES ('161', 'Polar White', '50', '2018-02-24 21:59:47', '2018-02-24 21:59:47', null);
INSERT INTO `colours` VALUES ('162', 'Onyx Black', '50', '2018-02-24 22:00:03', '2018-02-24 22:00:03', null);
INSERT INTO `colours` VALUES ('163', 'Ruby Red', '50', '2018-02-24 22:00:20', '2018-02-24 22:00:20', null);
INSERT INTO `colours` VALUES ('164', 'Cumulus Grey', '50', '2018-02-24 22:00:36', '2018-02-24 22:00:36', null);
INSERT INTO `colours` VALUES ('165', 'Lazuli Blue', '50', '2018-02-24 22:00:52', '2018-02-24 22:00:52', null);
INSERT INTO `colours` VALUES ('166', 'Soft Sand', '50', '2018-02-24 22:01:10', '2018-02-24 22:01:10', null);
INSERT INTO `colours` VALUES ('167', 'Shark Grey Metallic', '50', '2018-02-24 22:01:28', '2018-02-24 22:01:28', null);
INSERT INTO `colours` VALUES ('168', 'Glacier White', '51', '2018-02-24 22:03:09', '2018-02-24 22:03:09', null);
INSERT INTO `colours` VALUES ('169', 'Azurite Blue', '51', '2018-02-24 22:03:26', '2018-02-24 22:03:26', null);
INSERT INTO `colours` VALUES ('170', 'Cinder Red', '51', '2018-02-24 22:03:42', '2018-02-24 22:03:42', null);
INSERT INTO `colours` VALUES ('171', 'Pearl Black', '51', '2018-02-24 22:03:59', '2018-02-24 22:03:59', null);
INSERT INTO `colours` VALUES ('172', 'Mercury Grey', '51', '2018-02-24 22:04:15', '2018-02-24 22:04:15', null);
INSERT INTO `colours` VALUES ('173', 'Cosmos Blue', '51', '2018-02-24 22:04:31', '2018-02-24 22:04:31', null);
INSERT INTO `colours` VALUES ('174', 'Stone', '51', '2018-02-24 22:04:46', '2018-02-24 22:04:46', null);
INSERT INTO `colours` VALUES ('175', 'Blazer Blue', '18', '2018-02-24 22:26:23', '2018-02-24 22:26:23', null);
INSERT INTO `colours` VALUES ('176', 'Race Red', '18', '2018-02-24 22:26:45', '2018-02-24 22:26:45', null);
INSERT INTO `colours` VALUES ('177', 'Frozen White', '18', '2018-02-24 22:27:03', '2018-02-24 22:27:03', null);
INSERT INTO `colours` VALUES ('178', 'Deep Impact Blue', '18', '2018-02-24 22:27:21', '2018-02-24 22:27:21', null);
INSERT INTO `colours` VALUES ('179', 'Moondust Silver', '18', '2018-02-24 22:27:48', '2018-02-24 22:27:48', null);
INSERT INTO `colours` VALUES ('180', 'Magnetic', '18', '2018-02-24 22:28:39', '2018-02-24 22:28:39', null);
INSERT INTO `colours` VALUES ('181', 'Shadow Black', '18', '2018-02-24 22:28:57', '2018-02-24 22:28:57', null);
INSERT INTO `colours` VALUES ('182', 'Blue Wave', '18', '2018-02-24 22:29:19', '2018-02-24 22:29:19', null);
INSERT INTO `colours` VALUES ('183', 'Ruby Red', '18', '2018-02-24 22:29:45', '2018-02-24 22:29:45', null);
INSERT INTO `colours` VALUES ('184', 'Chrome Copper', '18', '2018-02-24 22:30:03', '2018-02-24 22:30:03', null);
INSERT INTO `colours` VALUES ('185', 'Bohai Bay Mint', '18', '2018-02-24 22:30:22', '2018-02-24 22:30:22', null);
INSERT INTO `colours` VALUES ('186', 'Deep Ocean Blue', '20', '2018-02-25 04:36:33', '2018-02-25 04:36:33', null);
INSERT INTO `colours` VALUES ('187', 'Alabaster Silver', '20', '2018-02-25 06:38:17', '2018-02-25 13:38:17', null);
INSERT INTO `colours` VALUES ('188', 'Golden Bronze', '20', '2018-02-25 04:37:06', '2018-02-25 04:37:06', null);
INSERT INTO `colours` VALUES ('189', 'Polished Metal', '20', '2018-02-25 04:37:22', '2018-02-25 04:37:22', null);
INSERT INTO `colours` VALUES ('190', 'Twilight Blue', '20', '2018-02-25 04:37:39', '2018-02-25 04:37:39', null);
INSERT INTO `colours` VALUES ('191', 'Urban Titanium', '20', '2018-02-25 04:37:57', '2018-02-25 04:37:57', null);
INSERT INTO `colours` VALUES ('192', 'Crystal Black', '20', '2018-02-25 04:38:15', '2018-02-25 04:38:15', null);
INSERT INTO `colours` VALUES ('193', 'Passion Red', '20', '2018-02-25 04:38:31', '2018-02-25 04:38:31', null);
INSERT INTO `colours` VALUES ('194', 'White Orchid', '20', '2018-02-25 04:38:48', '2018-02-25 04:38:48', null);
INSERT INTO `colours` VALUES ('195', 'Polar White', '21', '2018-02-25 04:42:23', '2018-02-25 04:42:23', null);
INSERT INTO `colours` VALUES ('196', 'Ara Blue', '21', '2018-02-25 04:42:39', '2018-02-25 04:42:39', null);
INSERT INTO `colours` VALUES ('197', 'Platinum Silver', '21', '2018-02-25 04:42:56', '2018-02-25 04:42:56', null);
INSERT INTO `colours` VALUES ('198', 'White Sand', '21', '2018-02-25 04:43:14', '2018-02-25 04:43:14', null);
INSERT INTO `colours` VALUES ('199', 'Ash Blue', '21', '2018-02-25 04:43:34', '2018-02-25 04:43:34', null);
INSERT INTO `colours` VALUES ('200', 'Ultimate Red', '21', '2018-02-25 04:43:52', '2018-02-25 04:43:52', null);
INSERT INTO `colours` VALUES ('201', 'Ruby Wine', '21', '2018-02-25 04:44:08', '2018-02-25 04:44:08', null);
INSERT INTO `colours` VALUES ('202', 'Moon Rock', '21', '2018-02-25 04:44:24', '2018-02-25 04:44:24', null);
INSERT INTO `colours` VALUES ('203', 'Thunder Grey', '21', '2018-02-25 04:44:44', '2018-02-25 04:44:44', null);
INSERT INTO `colours` VALUES ('204', 'Phantom Black', '21', '2018-02-25 04:45:00', '2018-02-25 04:45:00', null);
INSERT INTO `colours` VALUES ('205', 'Pure White', '21', '2018-02-25 04:45:32', '2018-02-25 04:45:32', null);
INSERT INTO `colours` VALUES ('206', 'Morning Blue', '21', '2018-02-25 04:46:13', '2018-02-25 04:46:13', null);
INSERT INTO `colours` VALUES ('207', 'Sleek Silver', '21', '2018-02-25 04:46:29', '2018-02-25 04:46:29', null);
INSERT INTO `colours` VALUES ('208', 'Stardust Grey', '21', '2018-02-25 04:46:45', '2018-02-25 04:46:45', null);
INSERT INTO `colours` VALUES ('209', 'Black Diamond', '21', '2018-02-25 04:47:00', '2018-02-25 04:47:00', null);
INSERT INTO `colours` VALUES ('210', 'Aqua sparkling', '21', '2018-02-25 04:47:19', '2018-02-25 04:47:19', null);
INSERT INTO `colours` VALUES ('211', 'Iced coffee', '21', '2018-02-25 04:47:36', '2018-02-25 04:47:36', null);
INSERT INTO `colours` VALUES ('212', 'Passion red', '21', '2018-02-25 04:48:52', '2018-02-25 04:48:52', null);
INSERT INTO `colours` VALUES ('213', 'Phantom black', '21', '2018-02-25 04:49:13', '2018-02-25 04:49:13', null);
INSERT INTO `colours` VALUES ('214', ' MOONLIGHT WHITE', '22', '2018-02-25 04:53:51', '2018-02-25 04:53:51', null);
INSERT INTO `colours` VALUES ('215', 'BLADE SILVER', '22', '2018-02-25 04:54:08', '2018-02-25 04:54:08', null);
INSERT INTO `colours` VALUES ('216', 'GRAPHITE SHADOW', '22', '2018-02-25 04:54:22', '2018-02-25 04:54:22', null);
INSERT INTO `colours` VALUES ('217', 'MALBEC BLACK', '22', '2018-02-25 04:54:37', '2018-02-25 04:54:37', null);
INSERT INTO `colours` VALUES ('218', 'MAGNETIC RED', '22', '2018-02-25 04:54:52', '2018-02-25 04:54:52', null);
INSERT INTO `colours` VALUES ('219', 'CHESTNUT BRONZE', '22', '2018-02-25 04:55:06', '2018-02-25 04:55:06', null);
INSERT INTO `colours` VALUES ('220', 'INK BLUE', '22', '2018-02-25 04:55:21', '2018-02-25 04:55:21', null);
INSERT INTO `colours` VALUES ('221', 'LIQUID COPPER', '22', '2018-02-25 04:55:35', '2018-02-25 04:55:35', null);
INSERT INTO `colours` VALUES ('222', 'BLACK OBSIDIAN', '22', '2018-02-25 04:55:49', '2018-02-25 04:55:49', null);
INSERT INTO `colours` VALUES ('223', 'Ebony Black', '25', '2018-02-25 05:11:04', '2018-02-25 05:11:04', null);
INSERT INTO `colours` VALUES ('224', 'Horizon Blue', '25', '2018-02-25 05:15:15', '2018-02-25 05:15:15', null);
INSERT INTO `colours` VALUES ('225', ' Remington Red', '25', '2018-02-25 05:15:31', '2018-02-25 05:15:31', null);
INSERT INTO `colours` VALUES ('226', 'Sangria', '25', '2018-02-25 05:15:47', '2018-02-25 05:15:47', null);
INSERT INTO `colours` VALUES ('227', 'Smokey Blue', '25', '2018-02-25 05:16:12', '2018-02-25 05:16:12', null);
INSERT INTO `colours` VALUES ('228', 'Snow White Pearl', '25', '2018-02-25 05:17:12', '2018-02-25 05:17:12', null);
INSERT INTO `colours` VALUES ('229', 'Sparkling Silver', '25', '2018-02-25 05:17:48', '2018-02-25 05:17:48', null);
INSERT INTO `colours` VALUES ('230', 'Titanium Silver', '25', '2018-02-25 05:18:13', '2018-02-25 05:18:13', null);
INSERT INTO `colours` VALUES ('231', 'Clear White', '25', '2018-02-25 05:19:40', '2018-02-25 05:19:40', null);
INSERT INTO `colours` VALUES ('232', 'Hyper Red', '25', '2018-02-25 05:20:34', '2018-02-25 05:20:34', null);
INSERT INTO `colours` VALUES ('233', 'Burnished Copper', '25', '2018-02-25 05:21:25', '2018-02-25 05:21:25', null);
INSERT INTO `colours` VALUES ('234', 'Pacific Blue', '25', '2018-02-25 05:23:17', '2018-02-25 05:23:17', null);
INSERT INTO `colours` VALUES ('235', 'Mineral Silver', '25', '2018-02-25 05:23:38', '2018-02-25 05:23:38', null);
INSERT INTO `colours` VALUES ('236', ' Black Cherry', '25', '2018-02-25 05:23:55', '2018-02-25 05:23:55', null);
INSERT INTO `colours` VALUES ('237', 'Appletree Green', '5', '2018-02-25 13:46:14', '2018-02-25 13:46:14', null);
INSERT INTO `colours` VALUES ('238', 'Concours Blue', '5', '2018-02-25 13:46:41', '2018-02-25 13:46:41', null);
INSERT INTO `colours` VALUES ('239', 'Kopi Bronze', '5', '2018-02-25 13:47:03', '2018-02-25 13:47:03', null);
INSERT INTO `colours` VALUES ('240', 'Hammerhead Silver', '5', '2018-02-25 13:47:17', '2018-02-25 13:47:17', null);
INSERT INTO `colours` VALUES ('241', 'Selene Bronze', '5', '2018-02-25 13:47:56', '2018-02-25 13:47:56', null);
INSERT INTO `colours` VALUES ('242', 'Lightning Silver', '5', '2018-02-25 13:48:16', '2018-02-25 13:48:16', null);
INSERT INTO `colours` VALUES ('243', 'Mariana Blue', '5', '2018-02-25 13:48:28', '2018-02-25 13:48:28', null);
INSERT INTO `colours` VALUES ('244', 'Marron Black', '5', '2018-02-25 13:48:50', '2018-02-25 13:48:50', null);
INSERT INTO `colours` VALUES ('245', 'Onyx Black', '5', '2018-02-25 13:49:03', '2018-02-25 13:49:03', null);
INSERT INTO `colours` VALUES ('246', 'Quantum Silver', '5', '2018-02-25 13:49:22', '2018-02-25 13:49:22', null);
INSERT INTO `colours` VALUES ('247', 'Silver Blonde', '5', '2018-02-25 13:49:42', '2018-02-25 13:49:42', null);
INSERT INTO `colours` VALUES ('248', 'Stratus White', '5', '2018-02-25 13:49:54', '2018-02-25 13:49:54', null);
INSERT INTO `colours` VALUES ('249', 'Volcano Red', '5', '2018-02-25 13:50:14', '2018-02-25 13:50:14', null);
INSERT INTO `colours` VALUES ('250', 'Arizona Bronze', '5', '2018-02-25 13:50:30', '2018-02-25 13:50:30', null);
INSERT INTO `colours` VALUES ('251', 'Ocellus Teal', '5', '2018-02-25 13:50:49', '2018-02-25 13:50:49', null);
INSERT INTO `colours` VALUES ('252', 'Divine Red', '5', '2018-02-25 13:51:05', '2018-02-25 13:51:05', null);
INSERT INTO `colours` VALUES ('253', 'Sea Storm', '5', '2018-02-25 13:51:23', '2018-02-25 13:51:23', null);
INSERT INTO `colours` VALUES ('254', 'Arden Green', '5', '2018-02-25 13:51:34', '2018-02-25 13:51:34', null);
INSERT INTO `colours` VALUES ('255', 'Intense Blue', '5', '2018-02-25 13:51:48', '2018-02-25 13:51:48', null);
INSERT INTO `colours` VALUES ('256', 'Jet Black', '5', '2018-02-25 13:52:15', '2018-02-25 13:52:15', null);
INSERT INTO `colours` VALUES ('257', 'Midnight Blue', '5', '2018-02-25 13:52:27', '2018-02-25 13:52:27', null);
INSERT INTO `colours` VALUES ('258', 'Silver Fox', '5', '2018-02-25 13:52:38', '2018-02-25 13:52:38', null);
INSERT INTO `colours` VALUES ('259', 'China Grey', '5', '2018-02-25 13:52:48', '2018-02-25 13:52:48', null);
INSERT INTO `colours` VALUES ('260', 'Magnetic Silver', '5', '2018-02-25 13:53:01', '2018-02-25 13:53:01', null);
INSERT INTO `colours` VALUES ('261', 'Lunar White', '5', '2018-02-25 13:53:13', '2018-02-25 13:53:13', null);
INSERT INTO `colours` VALUES ('262', 'Morning Frost White', '5', '2018-02-25 13:53:33', '2018-02-25 13:53:33', null);
INSERT INTO `colours` VALUES ('263', 'Skyfall Silver', '5', '2018-02-25 13:53:49', '2018-02-25 13:53:49', null);
INSERT INTO `colours` VALUES ('264', 'Ultramarine Black', '5', '2018-02-25 13:54:11', '2018-02-25 13:54:11', null);
INSERT INTO `colours` VALUES ('265', 'Sunburst Yellow', '5', '2018-02-25 13:54:26', '2018-02-25 13:54:26', null);
INSERT INTO `colours` VALUES ('266', 'Yellow Tang', '5', '2018-02-25 13:54:40', '2018-02-25 13:54:40', null);
INSERT INTO `colours` VALUES ('267', 'Diavolo Red', '5', '2018-02-25 13:54:57', '2018-02-25 13:54:57', null);
INSERT INTO `colours` VALUES ('271', 'Narvik Black', '26', '2018-02-27 03:29:21', '2018-02-27 03:29:21', null);
INSERT INTO `colours` VALUES ('272', 'Fuji White', '26', '2018-02-27 03:29:25', '2018-02-27 03:29:25', null);
INSERT INTO `colours` VALUES ('273', 'Santorini Black', '26', '2018-02-27 03:29:28', '2018-02-27 03:29:28', null);
INSERT INTO `colours` VALUES ('274', 'Yulong White', '26', '2018-02-27 03:29:12', '2018-02-27 03:29:12', null);
INSERT INTO `colours` VALUES ('275', 'Corris Grey', '26', '2018-02-27 03:29:10', '2018-02-27 03:29:10', null);
INSERT INTO `colours` VALUES ('276', 'Indus Silver', '26', '2018-02-27 03:29:07', '2018-02-27 03:29:07', null);
INSERT INTO `colours` VALUES ('277', 'Loire Blue', '26', '2018-02-27 03:29:05', '2018-02-27 03:29:05', null);
INSERT INTO `colours` VALUES ('278', 'Rossello Red', '26', '2018-02-27 03:29:02', '2018-02-27 03:29:02', null);
INSERT INTO `colours` VALUES ('279', 'Byron Blue', '26', '2018-02-27 03:29:00', '2018-02-27 03:29:00', null);
INSERT INTO `colours` VALUES ('280', 'Aruba', '26', '2018-02-27 03:28:58', '2018-02-27 03:28:58', null);
INSERT INTO `colours` VALUES ('281', 'Carpathian Grey', '26', '2018-02-27 03:28:54', '2018-02-27 03:28:54', null);
INSERT INTO `colours` VALUES ('282', 'Silicon Silver', '26', '2018-02-27 03:28:51', '2018-02-27 03:28:51', null);
INSERT INTO `colours` VALUES ('283', 'Borealis Black - Ultra Metallic', '26', '2018-02-27 03:28:49', '2018-02-27 03:28:49', null);
INSERT INTO `colours` VALUES ('284', 'Bosphorus Grey - Ultra Metallic', '26', '2018-02-27 03:28:47', '2018-02-27 03:28:47', null);
INSERT INTO `colours` VALUES ('285', 'British Racing Green - Ultra Metallic', '26', '2018-02-27 03:28:44', '2018-02-27 03:28:44', null);
INSERT INTO `colours` VALUES ('286', 'Ligurian Black - Ultra Metallic', '26', '2018-02-27 03:28:42', '2018-02-27 03:28:42', null);
INSERT INTO `colours` VALUES ('287', 'Desire - Ultra Metallic', '26', '2018-02-27 03:28:40', '2018-02-27 03:28:40', null);
INSERT INTO `colours` VALUES ('288', 'Ethereal - Ultra Metallic', '26', '2018-02-27 03:28:36', '2018-02-27 03:28:36', null);
INSERT INTO `colours` VALUES ('289', 'Flux - Ultra Metallic', '26', '2018-02-27 03:28:34', '2018-02-27 03:28:34', null);
INSERT INTO `colours` VALUES ('290', 'Verbier Silver - Ultra Metallic', '26', '2018-02-27 03:28:31', '2018-02-27 03:28:31', null);
INSERT INTO `colours` VALUES ('291', 'Windward Grey - Ultra Metallic', '26', '2018-02-27 03:28:29', '2018-02-27 03:28:29', null);
INSERT INTO `colours` VALUES ('292', 'Mescalito Black - Ultra Metallic', '26', '2018-02-27 03:28:26', '2018-02-27 03:28:26', null);
INSERT INTO `colours` VALUES ('293', 'Rio Gold - Ultra Metallic', '26', '2018-02-27 03:28:24', '2018-02-27 03:28:24', null);
INSERT INTO `colours` VALUES ('294', 'Scafell Grey - Ultra Metallic', '26', '2018-02-27 03:28:21', '2018-02-27 03:28:21', null);
INSERT INTO `colours` VALUES ('295', 'Madagascar Orange - Ultra Metallic', '26', '2018-02-27 03:28:19', '2018-02-27 03:28:19', null);
INSERT INTO `colours` VALUES ('296', 'Balmoral Blue - Ultra Metallic', '26', '2018-02-27 03:28:16', '2018-02-27 03:28:16', null);
INSERT INTO `colours` VALUES ('297', 'Velocity - Ultra Metallic', '26', '2018-02-27 03:28:13', '2018-02-27 03:28:13', null);
INSERT INTO `colours` VALUES ('298', 'Meribel White Pearl - Pearlescent', '26', '2018-02-27 03:28:11', '2018-02-27 03:28:11', null);
INSERT INTO `colours` VALUES ('299', 'Valloire White Pearl - Pearlescent', '26', '2018-02-27 03:28:08', '2018-02-27 03:28:08', null);
INSERT INTO `colours` VALUES ('300', 'Spectral Blue - ChromaFlair', '26', '2018-02-27 03:28:05', '2018-02-27 03:28:05', null);
INSERT INTO `colours` VALUES ('302', 'Spectral British Racing Green - ChromaFlair', '26', '2018-02-27 18:58:18', '2018-02-27 18:58:18', null);
INSERT INTO `colours` VALUES ('303', 'Spectral Racing Red - ChromaFlair', '26', '2018-02-27 18:59:29', '2018-02-27 18:59:29', null);
INSERT INTO `colours` VALUES ('304', 'STORM WHITE', '32', '2018-02-27 19:30:41', '2018-02-27 19:30:41', null);
INSERT INTO `colours` VALUES ('305', 'UNIVERSAL SILVER', '32', '2018-02-27 19:30:58', '2018-02-27 19:30:58', null);
INSERT INTO `colours` VALUES ('306', 'GUN METALLIC', '32', '2018-02-27 19:31:18', '2018-02-27 19:31:18', null);
INSERT INTO `colours` VALUES ('307', 'EBISU BLACK', '32', '2018-02-27 19:31:35', '2018-02-27 19:31:35', null);
INSERT INTO `colours` VALUES ('308', 'PALATIAL RUBY', '32', '2018-02-27 19:32:02', '2018-02-27 19:32:02', null);
INSERT INTO `colours` VALUES ('309', 'TITANIUM OLIVE', '32', '2018-02-27 19:32:22', '2018-02-27 19:32:22', null);
INSERT INTO `colours` VALUES ('310', 'PICADOR BROWN', '32', '2018-02-27 19:32:55', '2018-02-27 19:32:55', null);
INSERT INTO `colours` VALUES ('311', 'SAPPHIRE BLUE', '32', '2018-02-27 19:33:10', '2018-02-27 19:33:10', null);
INSERT INTO `colours` VALUES ('312', 'MONARCH ORANGE', '32', '2018-02-27 19:33:26', '2018-02-27 19:33:26', null);
INSERT INTO `colours` VALUES ('313', 'CHILLI PEPPER', '32', '2018-02-27 19:33:44', '2018-02-27 19:33:44', null);
INSERT INTO `colours` VALUES ('314', 'ARCTIC WHITE', '32', '2018-02-27 19:36:17', '2018-02-27 19:36:17', null);
INSERT INTO `colours` VALUES ('315', 'CHESTNUT BRONZE', '32', '2018-02-27 19:37:28', '2018-02-27 19:37:28', null);
INSERT INTO `colours` VALUES ('316', 'BLADE SILVER', '32', '2018-02-27 19:39:19', '2018-02-27 19:39:19', null);
INSERT INTO `colours` VALUES ('317', 'MAGNETIC RED', '32', '2018-02-27 19:39:38', '2018-02-27 19:39:38', null);
INSERT INTO `colours` VALUES ('318', 'FLAME RED', '32', '2018-02-27 19:41:52', '2018-02-27 19:41:52', null);
INSERT INTO `colours` VALUES ('319', 'VIVID BLUE', '32', '2018-02-27 19:42:15', '2018-02-27 19:42:15', null);
INSERT INTO `colours` VALUES ('320', 'PEARL BLACK', '32', '2018-02-27 19:42:41', '2018-02-27 19:42:41', null);
INSERT INTO `colours` VALUES ('321', 'INK BLUE', '32', '2018-02-27 19:43:19', '2018-02-27 19:43:19', null);
INSERT INTO `colours` VALUES ('322', 'NIGHTSHADE', '32', '2018-02-27 19:43:45', '2018-02-27 19:43:45', null);
INSERT INTO `colours` VALUES ('323', 'SUNRISE ORANGE', '31', '2018-02-27 19:51:23', '2018-02-27 19:51:23', null);
INSERT INTO `colours` VALUES ('324', 'WHITE', '31', '2018-02-27 19:51:44', '2018-02-27 19:51:44', null);
INSERT INTO `colours` VALUES ('325', 'WINE RED', '31', '2018-02-27 19:52:02', '2018-02-27 19:52:02', null);
INSERT INTO `colours` VALUES ('326', 'CYBER BLUE', '31', '2018-02-27 19:52:17', '2018-02-27 19:52:17', null);
INSERT INTO `colours` VALUES ('327', 'RED PLANET', '31', '2018-02-27 19:52:33', '2018-02-27 19:52:33', null);
INSERT INTO `colours` VALUES ('328', 'BLACK', '31', '2018-02-27 19:52:51', '2018-02-27 19:52:51', null);
INSERT INTO `colours` VALUES ('329', 'WHITE SOLID', '31', '2018-02-27 19:53:32', '2018-02-27 19:53:32', null);
INSERT INTO `colours` VALUES ('330', 'STARLIGHT', '31', '2018-02-27 19:53:48', '2018-02-27 19:53:48', null);
INSERT INTO `colours` VALUES ('331', 'STERLING SILVER', '31', '2018-02-27 19:54:03', '2018-02-27 19:54:03', null);
INSERT INTO `colours` VALUES ('332', 'RED', '31', '2018-02-27 19:54:21', '2018-02-27 19:54:21', null);
INSERT INTO `colours` VALUES ('333', 'IRONBARK', '31', '2018-02-27 19:54:40', '2018-02-27 19:54:40', null);
INSERT INTO `colours` VALUES ('334', 'TITANIUM', '31', '2018-02-27 19:54:59', '2018-02-27 19:54:59', null);
INSERT INTO `colours` VALUES ('335', 'Frost White', '32', '2018-02-27 13:35:13', '2018-02-27 20:35:13', '2018-02-27 20:35:13');
INSERT INTO `colours` VALUES ('336', 'Frost White', '31', '2018-02-27 20:35:35', '2018-02-27 20:35:35', null);
INSERT INTO `colours` VALUES ('337', 'Cool Silver', '31', '2018-02-27 20:36:01', '2018-02-27 20:36:01', null);
INSERT INTO `colours` VALUES ('338', 'Granite Brown', '31', '2018-02-27 20:36:18', '2018-02-27 20:36:18', null);
INSERT INTO `colours` VALUES ('339', 'Orient Red', '31', '2018-02-27 20:36:38', '2018-02-27 20:36:38', null);
INSERT INTO `colours` VALUES ('340', 'Atlantic Grey', '31', '2018-02-27 20:36:58', '2018-02-27 20:36:58', null);
INSERT INTO `colours` VALUES ('341', 'White Pearl', '31', '2018-02-27 20:37:21', '2018-02-27 20:37:21', null);
INSERT INTO `colours` VALUES ('342', 'Amethyst Black', '31', '2018-02-27 20:37:44', '2018-02-27 20:37:44', null);
INSERT INTO `colours` VALUES ('343', 'Frost WhiteTanzanite Blue', '31', '2018-02-27 20:39:00', '2018-02-27 20:39:00', null);
INSERT INTO `colours` VALUES ('344', 'test', '11', '2018-03-01 02:14:23', '2018-03-01 10:14:23', '2018-03-01 10:14:23');
INSERT INTO `colours` VALUES ('345', 'test', '4', '2018-02-28 19:20:53', '2018-03-01 02:20:53', '2018-03-01 02:20:53');
INSERT INTO `colours` VALUES ('346', 'test111', '7', '2018-03-01 00:49:12', '2018-03-01 07:49:12', '2018-03-01 07:49:12');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Administration', '[]', '#000', null, '2018-01-30 21:40:22', '2018-01-30 21:40:22');

-- ----------------------------
-- Table structure for drivers
-- ----------------------------
DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(10) unsigned NOT NULL,
  `mobile_number` int(10) unsigned NOT NULL,
  `profile_pic` int(11) NOT NULL,
  `make` int(10) unsigned NOT NULL DEFAULT '1',
  `model` int(10) unsigned NOT NULL DEFAULT '1',
  `colour` int(11) NOT NULL,
  `registration` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `upload_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `upload_mot_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `license` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `pco_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `insurance_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_3` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` decimal(50,0) DEFAULT NULL,
  `country_code` decimal(50,0) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `mot_issue_date` date DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` int(11) DEFAULT NULL,
  `county` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypt_user_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`profile_pic`),
  UNIQUE KEY `drivers_email_unique` (`email`),
  KEY `drivers_make_foreign` (`make`),
  KEY `drivers_model_foreign` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of drivers
-- ----------------------------

-- ----------------------------
-- Table structure for dri_admin
-- ----------------------------
DROP TABLE IF EXISTS `dri_admin`;
CREATE TABLE `dri_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `basic_pwd` varchar(255) DEFAULT NULL,
  `right` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dri_admin
-- ----------------------------
INSERT INTO `dri_admin` VALUES ('1', 'aaa@gmail.com', 'James', '31e9fb146377ca1ec73f07bf68382acb', 'admin1987', '2');

-- ----------------------------
-- Table structure for dri_users
-- ----------------------------
DROP TABLE IF EXISTS `dri_users`;
CREATE TABLE `dri_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `colour` varchar(255) DEFAULT NULL,
  `registration` varchar(255) DEFAULT NULL,
  `upload_doc` varchar(255) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `upload_mot_doc` varchar(255) DEFAULT NULL,
  `mot_expire_date` date DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_doc` varchar(255) DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_doc` varchar(255) DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dri_users
-- ----------------------------
INSERT INTO `dri_users` VALUES ('5', 'demo', 'demo', 'demo@demo.com', '123, demo test ', '', '', 'London', 'London', 'UK ', '123456', '123 4567 8901', '44', '123 4567 8901', null, '1', 'Select', 'red', '12345-33444555', null, '0000-00-00', null, '0000-00-00', 'UPLIFT_logo_white_SML.png', '2022-09-09', null, '0000-00-00', null, '0000-00-00', null, 'demo', '31e9fb146377ca1ec73f07bf68382acb');
INSERT INTO `dri_users` VALUES ('7', 'hello', 'hello', 'helo@hello.com', '123, hello', '', '', 'london', 'london', 'UK ', '123456', '123 4567 8901', '44', '123 4568 7890', null, '1', 'Select', 'black', '123456', null, '0000-00-00', null, '0000-00-00', '11.png', '2019-02-14', null, '0000-00-00', null, '0000-00-00', null, 'demo', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('8', 'Marc', 'Francis', 'marc.francis@uplft.com', '76 Garth Close', 'Morden', '', 'Morden', 'London', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Chewie.PNG', '1', 'Select', 'Silver', 'KV64 HMF', 'Screenshot_20170714-150308.png', '2022-03-07', 'Screenshot_20170714-1503081.png', '2022-03-07', 'Map_1.PNG', '2018-05-07', 'Map_11.PNG', '0000-00-00', 'Map_12.PNG', '0000-00-00', 'Map_13.PNG', 'Chewie', 'b5ea768836b9af523455d374ca897e07');
INSERT INTO `dri_users` VALUES ('9', 'ccc', 'bbb', 'aaa@gmail.com', 'asdfasdfsadf', '', '', '', '', '', 'sdf', '', '44', '123 4562 1354', 'car12.jpg', '1', 'Select', 'red', 'aaaaaaaaaaaaa', null, '0000-00-00', null, '0000-00-00', 'car3.jpg', '2018-02-06', null, '0000-00-00', null, '0000-00-00', null, 'admin', '31e9fb146377ca1ec73f07bf68382acb');
INSERT INTO `dri_users` VALUES ('10', 'name', 'name', 'name@name.com', '123, demo test ', '', '', 'london', 'london', '', '123456', '123 4567 8901', '44', '123 4567 8901', null, '1', 'Select', 'black', '123456', null, '0000-00-00', null, '0000-00-00', '111.png', '2222-02-04', null, '0000-00-00', null, '0000-00-00', null, 'hello', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('11', 'ccc', 'vvv', 'ccc@gmail.com', 'asdf', '', '', '', '', '', 'dsf', '', '44', '123 4562 1354', 'car4.jpg', '1', 'Select', 'red', 'adfasdf', null, '0000-00-00', null, '0000-00-00', '175422122.jpg', '2018-02-09', null, '0000-00-00', null, '0000-00-00', null, 'ccc', 'c1f68ec06b490b3ecb4066b1b13a9ee9');
INSERT INTO `dri_users` VALUES ('12', 'sdf', 'aaaaaa', 'dd@gmail.com', 'sdf', '', '', '', '', '', 'sdf', '', '44', '234 5678 6543', null, '3', 'Select', 'red', 'asdfdsf', null, '0000-00-00', null, '0000-00-00', 'car6.jpg', '2018-02-03', null, '0000-00-00', null, '0000-00-00', 'background1.jpg', 'ddd', '980ac217c6b51e7dc41040bec1edfec8');
INSERT INTO `dri_users` VALUES ('13', 'helllo', 'helllo', 'helloo@hello.com', '123, demo test ', '', '', '', '', '', '123456', '123 4567 8901', '44', '123 4567 8901', null, '2', 'Select', 'red', '123456', null, '0000-00-00', null, '0000-00-00', '112.png', '2222-11-12', null, '0000-00-00', null, '0000-00-00', null, 'demo1', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('14', 'Han', 'Solo', 'han@uplift.vip', '76', 'Garth Close', '', 'Morden', 'Surrey', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Han_Solo.PNG', '2', 'Select', 'Silver', 'KV64HMF', 'Uplift_Summary_Booking_Screen.PNG', '0000-00-00', 'Uplift_Summary_Booking_Screen1.PNG', '0000-00-00', 'Uplift_Summary_Booking_Screen2.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen3.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen4.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen5.PNG', 'Han', '1cde4d8666b28f667ceb4c1945de8417');
INSERT INTO `dri_users` VALUES ('15', 'helloo', 'helloo', 'helloo@helloo.com', '123, hello ', '', '', 'london', 'london', '', '123456', '123 4567 8901', '44', '123 4567 8901', null, '2', 'Select', 'white', '123456', null, '0000-00-00', null, '0000-00-00', '113.png', '2222-12-11', null, '0000-00-00', null, '0000-00-00', null, 'helloo', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('16', 'Luke', 'Skywalker', 'luke@uplift.vip', '76', 'Garth Close', '', 'Morden', 'London', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Luke.PNG', '1', 'Select', 'White', 'KV64 HMF', 'Uplift_Calendar_Screen.PNG', '2020-02-10', 'Uplift_Calendar_Screen1.PNG', '2020-02-10', 'Uplift_Calendar_Screen2.PNG', '2019-02-10', 'Uplift_Calendar_Screen3.PNG', '2019-02-10', 'Uplift_Calendar_Screen4.PNG', '2019-02-10', 'Uplift_Calendar_Screen5.PNG', 'Luke', '43d1d16186fc5752e1b04afa71ae450a');
INSERT INTO `dri_users` VALUES ('18', 'first ', 'last', 'demo1@demo.com', '123, demo test ', '', '', 'London', 'london', 'UK ', '12345', '123 4567 8901', '44', '123 4567 8901', '114.png', '1', 'Select', 'black', '123456', null, '0000-00-00', null, '0000-00-00', '1111.png', '2222-01-01', null, '0000-00-00', null, '0000-00-00', null, 'hello', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('20', 'd', 'd', 'demo1@demo.com', 'd', '', '', 'd', 'd', 'd', '222222', '', '44', '123 4567 8901', null, '2', 'Select', 'grey', '123456', null, '0000-00-00', null, '0000-00-00', '11111.png', '2222-11-02', null, '0000-00-00', null, '0000-00-00', null, 'd', '13e7dc1e3cace50a7ef377856b95206e');
INSERT INTO `dri_users` VALUES ('22', 'ggg', 'ggg', 'ggg@gmail.com', 'ggggggggggggggggg', '', '', '', '', '', 'ggg', '', '44', '123 4567 8901', 'b_ba2.png', '5', '134', '249', 'gggggggggggggg', null, '0000-00-00', null, '0000-00-00', 'back.jpg', '2018-02-23', null, '0000-00-00', null, '0000-00-00', null, 'ggg', '9cafeef08db2dd477098a0293e71f90a');
INSERT INTO `dri_users` VALUES ('23', 'aaaa', 'aaaa', 'aaaa@gmail.com', '123, demo test ', '', '', '', '', '', '123456', '', '44', '123 4567 8901', null, '4', '18', '7', '123456', null, '0000-00-00', null, '0000-00-00', '1114.png', '2222-02-22', null, '0000-00-00', null, '0000-00-00', null, 'aaaaaa', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('24', 'qqqqqq', 'qqqqqqq', 'qqqq@gmail.com', '111, demo street ', '', '', '', '', '', '123456', '', '44', '123 4567 8901', null, '6', '25', '153', '123456', null, '0000-00-00', null, '0000-00-00', '1115.png', '2222-11-11', null, '0000-00-00', null, '0000-00-00', null, 'qqq@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('25', 'Darth', 'Vader', 'darth@uplift.vip', '1', 'Death Star', 'Alderaan', 'London', 'London', 'London', 'WC1', '', '44', '077 3917 5985', 'Darth.PNG', '5', '134', '249', 'KV64 HMF', 'Screenshot_20170714-1503082.png', '2018-02-28', 'Screenshot_20170714-1503083.png', '2018-02-28', 'Screenshot_20170714-1503084.png', '2018-02-28', 'Screenshot_20170714-1503085.png', '2018-02-28', 'Screenshot_20170714-1503086.png', '2018-02-28', 'Screenshot_20170714-1503087.png', 'Lord', 'f560c458a3ba89e606a43be070bf7566');
INSERT INTO `dri_users` VALUES ('26', 'demo', 'demo', 'demo@gmail.com', '123456', '1234566', '1234566', 'London', 'London', 'UK', '45656236', '888 8888 8888', '44', '888 8888 8888', null, '4', '16', '16', '123456', null, '0000-00-00', null, '0000-00-00', '1488847670_WORLD.png', '2022-02-02', null, '0000-00-00', null, '0000-00-00', '1488847670_WORLD1.png', 'miller ', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('27', 'Ben', 'P', 'ei20323@gmail.com', 'fdfsf', 'eerr', 'erer', 'Phnom Pehn', 'PP', 'Cam', '120000', '182 8848 4844', '44', '889 9848 8488', 'banner-ad-fail-11.jpg', '4', '6', '18', 'ewrwerewr', 'banner-ad-fail-111.jpg', '0000-00-00', 'banner-ad-fail-112.jpg', '0000-00-00', 'banner-ad-fail-113.jpg', '1984-12-31', 'banner-ad-fail-114.jpg', '1998-12-23', 'banner-ad-fail-115.jpg', '2014-12-04', 'banner-ad-fail-116.jpg', 'Ben', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `dri_users` VALUES ('28', 'today ', 'today ', 'today@gmail.com', '123, demo test ', '', '', '', '', '', '123456', '', '44', '123 4567 8901', null, '7', '30', '34', '123456', null, '0000-00-00', null, '0000-00-00', '118.png', '2222-02-22', null, '0000-00-00', null, '0000-00-00', null, 'today', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for dri_user_amount
-- ----------------------------
DROP TABLE IF EXISTS `dri_user_amount`;
CREATE TABLE `dri_user_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `amount` float(10,0) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dri_user_amount
-- ----------------------------
INSERT INTO `dri_user_amount` VALUES ('4', '12', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('5', '15', '24', 'Standard', '2', '0');
INSERT INTO `dri_user_amount` VALUES ('6', '16', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('7', '18', '24', 'Standard', '2', '0');
INSERT INTO `dri_user_amount` VALUES ('8', '21', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('9', '23', '24', 'Standard', '2', '0');
INSERT INTO `dri_user_amount` VALUES ('10', '24', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('11', '25', '36', 'Platinum', '3', '0');
INSERT INTO `dri_user_amount` VALUES ('12', '26', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('13', '27', '12', 'Basic', '1', '0');
INSERT INTO `dri_user_amount` VALUES ('14', '28', '24', 'Standard', '2', '0');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'Marc Francis', 'Super Admin', 'Male', '8888888888', '', 'marc.francis@uplift.vip', '1', 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2018-01-30', '2018-01-30', '2018-01-30', '0.000', null, '2018-01-30 22:30:57', '2018-01-30 22:30:57');

-- ----------------------------
-- Table structure for fare
-- ----------------------------
DROP TABLE IF EXISTS `fare`;
CREATE TABLE `fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `fare_name` varchar(256) DEFAULT NULL,
  `fare_price` decimal(10,0) DEFAULT NULL,
  `fare_duration` int(11) DEFAULT NULL,
  `fare_status` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fare
-- ----------------------------
INSERT INTO `fare` VALUES ('12', '21', '0', '4', 'plan_test', '10', '0', 'duration', null);
INSERT INTO `fare` VALUES ('13', '23', '0', '1', 'Plan', '50', '0', 'duration', null);
INSERT INTO `fare` VALUES ('14', '23', '0', '2', 'vacation', '120', '0', 'mile', null);
INSERT INTO `fare` VALUES ('15', '23', '0', '3', 'business', '15', '0', 'mile', null);
INSERT INTO `fare` VALUES ('16', '23', '0', '4', 'plan_test', '10', '0', 'duration', null);
INSERT INTO `fare` VALUES ('17', '23', '0', '5', 'A to B', '30', '0', 'duration', null);
INSERT INTO `fare` VALUES ('18', '23', '0', '6', 'test', '12', '0', 'duration', null);
INSERT INTO `fare` VALUES ('19', '24', '0', '1', 'Plan', '50', '0', 'duration', null);
INSERT INTO `fare` VALUES ('20', '24', '0', '5', 'A to B', '30', '0', 'duration', null);
INSERT INTO `fare` VALUES ('21', '25', '0', '1', 'Plan', '50', '0', 'duration', null);
INSERT INTO `fare` VALUES ('22', '25', '0', '5', 'A to B', '30', '0', 'duration', null);
INSERT INTO `fare` VALUES ('29', '26', '0', '23', 'Plan', '10', '1000', 'duration', null);
INSERT INTO `fare` VALUES ('30', '26', '0', '24', 'A to B', '0', '1000', 'duration', null);
INSERT INTO `fare` VALUES ('31', '27', '0', '4', 'plan_test', '10', '20', 'duration', null);
INSERT INTO `fare` VALUES ('32', '28', '0', '4', 'plan_test', '10', '20', 'duration', null);
INSERT INTO `fare` VALUES ('33', '29', '0', '4', 'plan_test', '10', '20', 'duration', null);

-- ----------------------------
-- Table structure for home_page_messages
-- ----------------------------
DROP TABLE IF EXISTS `home_page_messages`;
CREATE TABLE `home_page_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `welcome_title` varchar(500) DEFAULT NULL,
  `welcome_message` varchar(5000) DEFAULT NULL,
  `quote_title` varchar(500) DEFAULT NULL,
  `update_title` varchar(500) DEFAULT NULL,
  `update_message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `quote_message` varchar(500) DEFAULT NULL,
  `welcome_logo` varchar(11) DEFAULT NULL,
  `quote_logo` varchar(11) DEFAULT NULL,
  `welcome_footer` varchar(50) DEFAULT NULL,
  `update_footer` varchar(50) DEFAULT NULL,
  `quote_footer` varchar(50) DEFAULT NULL,
  `update_logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of home_page_messages
-- ----------------------------
INSERT INTO `home_page_messages` VALUES ('1', 'welcomeTitle123', 'welcome message1', 'quote title1', 'update title1', 'update message1', '2018-02-24 01:48:20', '2018-02-24 01:48:20', null, 'qutoe message1', '0', '0', '', '', 'quote_footer', '');
INSERT INTO `home_page_messages` VALUES ('2', 'welcome title', 'welcome message', 'quote title', 'update title', 'update message', '2018-02-24 09:50:41', '2018-02-24 09:50:41', null, 'quote message', 'new welcome', 'quote logo', 'welcome footer', 'update footer', 'new quote', 'update logo');

-- ----------------------------
-- Table structure for information_cards
-- ----------------------------
DROP TABLE IF EXISTS `information_cards`;
CREATE TABLE `information_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_subject` varchar(256) DEFAULT NULL,
  `card_message` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of information_cards
-- ----------------------------
INSERT INTO `information_cards` VALUES ('1', 'a', 'asd', '2018-02-23 14:05:14', '2018-02-23 06:05:14', '2018-02-23 14:05:14');
INSERT INTO `information_cards` VALUES ('2', 'corve', 'enter', '2018-02-24 07:44:16', '2018-02-23 23:44:16', '2018-02-24 07:44:16');
INSERT INTO `information_cards` VALUES ('3', 'asd', 'asdasdasd', '2018-02-24 07:44:29', '2018-02-24 07:44:29', null);

-- ----------------------------
-- Table structure for la_configs
-- ----------------------------
DROP TABLE IF EXISTS `la_configs`;
CREATE TABLE `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of la_configs
-- ----------------------------
INSERT INTO `la_configs` VALUES ('1', 'sitename', '', 'Uplift 1.0', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('2', 'sitename_part1', '', 'Lara', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('3', 'sitename_part2', '', 'Admin 1.0', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('4', 'sitename_short', '', 'LA', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('5', 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('6', 'sidebar_search', '', '1', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('7', 'show_messages', '', '1', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('8', 'show_notifications', '', '1', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('9', 'show_tasks', '', '1', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('10', 'show_rightsidebar', '', '1', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('11', 'skin', '', 'skin-white', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('12', 'layout', '', 'fixed', '2018-01-30 21:40:23', '2018-01-30 21:40:23');
INSERT INTO `la_configs` VALUES ('13', 'default_email', '', 'test@example.com', '2018-01-30 21:40:23', '2018-01-30 21:40:23');

-- ----------------------------
-- Table structure for la_menus
-- ----------------------------
DROP TABLE IF EXISTS `la_menus`;
CREATE TABLE `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of la_menus
-- ----------------------------
INSERT INTO `la_menus` VALUES ('1', 'Team', '#', 'fa-group', 'custom', '0', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('2', 'Users', 'users', 'fa-group', 'module', '1', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('3', 'Uploads', 'uploads', 'fa-files-o', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('4', 'Departments', 'departments', 'fa-tags', 'module', '1', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('5', 'Employees', 'employees', 'fa-group', 'module', '1', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('6', 'Roles', 'roles', 'fa-user-plus', 'module', '1', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('7', 'Organizations', 'organizations', 'fa-university', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('8', 'Permissions', 'permissions', 'fa-magic', 'module', '1', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('9', 'Drivers', 'drivers', 'fa-cube', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('10', 'Plans_names', 'plans_names', 'fa-cube', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('11', 'User_roles', 'user_roles', 'fa-cube', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('12', 'User_registrations', 'user_registrations', 'fa-cube', 'module', '0', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `la_menus` VALUES ('13', 'Categories', 'categories', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:24');
INSERT INTO `la_menus` VALUES ('14', 'Models', 'modelns', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:45');
INSERT INTO `la_menus` VALUES ('15', 'Makes', 'makes', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('16', 'Home_Page_Messages', 'home_page_messages', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('17', 'Passengers', 'passengers', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('18', 'Information_Cards', 'information_cards', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('19', 'Colours', 'colours', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('20', 'Overtime_Hourly_Fares', 'overtime_hourly_fares', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('21', 'Passenger_Subscriptions', 'passenger_subscriptions', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('22', 'Passenger_Taxes', 'passenger_taxes', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');
INSERT INTO `la_menus` VALUES ('23', 'Subcriptions', 'subcriptions', 'fa-cube', 'module', '0', '0', '2018-02-19 12:54:20', '2018-02-19 12:54:20');

-- ----------------------------
-- Table structure for make
-- ----------------------------
DROP TABLE IF EXISTS `make`;
CREATE TABLE `make` (
  `make_id` int(11) NOT NULL AUTO_INCREMENT,
  `make_name` varchar(256) DEFAULT NULL,
  `make_value` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`make_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of make
-- ----------------------------
INSERT INTO `make` VALUES ('1', 'asdf1', 'asdasdads', '2018-02-22 06:51:30', '2018-02-21 23:51:30', '2018-02-22 06:51:30');
INSERT INTO `make` VALUES ('2', 'sadf', '1234', '2018-02-22 06:51:35', '2018-02-21 23:51:35', '2018-02-22 06:51:35');
INSERT INTO `make` VALUES ('3', 'asd', 'asda', '2018-02-22 06:51:40', '2018-02-21 23:51:40', '2018-02-22 06:51:40');
INSERT INTO `make` VALUES ('4', 'AUDI', '1', '2018-02-26 19:14:40', '2018-02-26 19:14:40', null);
INSERT INTO `make` VALUES ('5', 'ASTON MARTIN', '2', '2018-02-22 06:52:11', '2018-02-22 06:52:11', null);
INSERT INTO `make` VALUES ('6', 'BMW', '3', '2018-02-22 06:52:26', '2018-02-22 06:52:26', null);
INSERT INTO `make` VALUES ('7', 'BENTLEY', '4', '2018-02-22 06:52:43', '2018-02-22 06:52:43', null);
INSERT INTO `make` VALUES ('8', 'BUGATTI', '5', '2018-03-01 02:16:08', '2018-03-01 02:16:08', null);
INSERT INTO `make` VALUES ('9', 'CADILLAC', '6', '2018-03-01 02:16:10', '2018-03-01 02:16:10', null);
INSERT INTO `make` VALUES ('10', 'CHEVROLET', '7', '2018-03-01 02:16:11', '2018-03-01 02:16:11', null);
INSERT INTO `make` VALUES ('11', 'Jaguar', '8', '2018-02-24 00:00:17', '2018-02-24 00:00:17', null);
INSERT INTO `make` VALUES ('12', 'ROLLS ROYCE', '9', '2018-02-24 00:00:47', '2018-02-24 00:00:47', null);
INSERT INTO `make` VALUES ('13', 'MCLAREN', '10', '2018-02-24 00:01:09', '2018-02-24 00:01:09', null);
INSERT INTO `make` VALUES ('14', 'Dodge', '11', '2018-02-24 00:01:35', '2018-02-24 00:01:35', null);
INSERT INTO `make` VALUES ('15', 'Ferrari', '12', '2018-02-24 00:01:53', '2018-02-24 00:01:53', null);
INSERT INTO `make` VALUES ('16', 'Chrysler', '13', '2018-02-24 00:02:16', '2018-02-24 00:02:16', null);
INSERT INTO `make` VALUES ('17', 'FIAT', '14', '2018-03-01 02:16:13', '2018-03-01 02:16:13', null);
INSERT INTO `make` VALUES ('18', 'Ford', '14', '2018-02-24 00:02:50', '2018-02-24 00:02:50', null);
INSERT INTO `make` VALUES ('19', 'GMC', '', '2018-02-24 00:03:20', '2018-02-24 00:03:20', null);
INSERT INTO `make` VALUES ('20', 'Honda', '', '2018-02-24 00:03:42', '2018-02-24 00:03:42', null);
INSERT INTO `make` VALUES ('21', 'Hyundai', '', '2018-02-24 00:03:54', '2018-02-24 00:03:54', null);
INSERT INTO `make` VALUES ('22', 'Infiniti', '', '2018-02-24 00:04:05', '2018-02-24 00:04:05', null);
INSERT INTO `make` VALUES ('23', 'Jeep', '', '2018-02-24 00:04:15', '2018-02-24 00:04:15', null);
INSERT INTO `make` VALUES ('24', 'Lamborghini', '', '2018-02-24 00:04:25', '2018-02-24 00:04:25', null);
INSERT INTO `make` VALUES ('25', 'Kia', '', '2018-02-24 00:04:35', '2018-02-24 00:04:35', null);
INSERT INTO `make` VALUES ('26', 'Land Rover', '', '2018-02-24 00:04:46', '2018-02-24 00:04:46', null);
INSERT INTO `make` VALUES ('27', 'Lexus', '', '2018-02-24 00:04:58', '2018-02-24 00:04:58', null);
INSERT INTO `make` VALUES ('28', 'Maserati', '', '2018-02-24 00:05:08', '2018-02-24 00:05:08', null);
INSERT INTO `make` VALUES ('29', 'Mazda', '', '2018-02-24 00:05:18', '2018-02-24 00:05:18', null);
INSERT INTO `make` VALUES ('30', 'Mini', '', '2018-02-24 00:05:29', '2018-02-24 00:05:29', null);
INSERT INTO `make` VALUES ('31', 'Mitsubishi', '', '2018-02-24 00:05:41', '2018-02-24 00:05:41', null);
INSERT INTO `make` VALUES ('32', 'Nissan', '', '2018-02-24 00:05:51', '2018-02-24 00:05:51', null);
INSERT INTO `make` VALUES ('33', 'Peugeot', '', '2018-02-24 00:06:03', '2018-02-24 00:06:03', null);
INSERT INTO `make` VALUES ('34', 'Porsche', '', '2018-02-24 00:06:13', '2018-02-24 00:06:13', null);
INSERT INTO `make` VALUES ('35', 'Renault', '', '2018-02-24 00:06:25', '2018-02-24 00:06:25', null);
INSERT INTO `make` VALUES ('36', 'Saab', '', '2018-02-24 00:06:33', '2018-02-24 00:06:33', null);
INSERT INTO `make` VALUES ('37', 'Suzuki', '', '2018-02-24 00:06:44', '2018-02-24 00:06:44', null);
INSERT INTO `make` VALUES ('38', 'Toyota', '', '2018-02-24 00:06:54', '2018-02-24 00:06:54', null);
INSERT INTO `make` VALUES ('39', 'Volkswagen', '', '2018-02-24 00:07:02', '2018-02-24 00:07:02', null);
INSERT INTO `make` VALUES ('40', 'Volvo', '', '2018-02-24 00:07:12', '2018-02-24 00:07:12', null);
INSERT INTO `make` VALUES ('41', 'Tesla', '', '2018-02-24 00:07:28', '2018-02-24 00:07:28', null);
INSERT INTO `make` VALUES ('42', 'Mercedes', '', '2018-02-24 00:14:07', '2018-02-24 00:14:07', null);
INSERT INTO `make` VALUES ('43', 'SUBARU', '', '2018-02-24 01:07:45', '2018-02-24 01:07:45', null);
INSERT INTO `make` VALUES ('44', 'VAUXHALL', '', '2018-02-24 01:09:39', '2018-02-24 01:09:39', null);
INSERT INTO `make` VALUES ('45', 'SSANGYONG', '', '2018-02-24 01:16:09', '2018-02-24 01:16:09', null);
INSERT INTO `make` VALUES ('46', 'SKODA', '', '2018-02-24 01:19:05', '2018-02-24 01:19:05', null);
INSERT INTO `make` VALUES ('47', 'SEAT', '', '2018-02-24 01:22:04', '2018-02-24 01:22:04', null);
INSERT INTO `make` VALUES ('48', 'ROVER', '', '2018-02-24 01:26:24', '2018-02-24 01:26:24', null);
INSERT INTO `make` VALUES ('49', 'PROTON', '', '2018-02-24 01:40:12', '2018-02-24 01:40:12', null);
INSERT INTO `make` VALUES ('50', 'CITROEN', '', '2018-02-24 21:59:22', '2018-02-24 21:59:22', null);
INSERT INTO `make` VALUES ('51', 'DACIA', '', '2018-02-24 22:02:12', '2018-02-24 22:02:12', null);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_05_26_050000_create_modules_table', '1');
INSERT INTO `migrations` VALUES ('2014_05_26_055000_create_module_field_types_table', '1');
INSERT INTO `migrations` VALUES ('2014_05_26_060000_create_module_fields_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_01_000000_create_uploads_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064006_create_departments_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064007_create_employees_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064446_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_05_115343_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_06_140637_create_organizations_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_07_134058_create_backups_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_07_134058_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_10_163337_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_10_163520_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_22_105958_role_module_fields_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_22_110008_role_module_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_06_115413_create_la_configs_table', '1');
INSERT INTO `migrations` VALUES ('2017_07_25_070930_create_drivers_table', '1');
INSERT INTO `migrations` VALUES ('2017_09_05_122711_create_plans_names_table', '1');
INSERT INTO `migrations` VALUES ('2017_09_08_093033_create_user_roles_table', '1');
INSERT INTO `migrations` VALUES ('2017_09_08_114420_create_user_registrations_table', '1');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `model_id` int(255) NOT NULL AUTO_INCREMENT,
  `make_id` int(255) DEFAULT NULL,
  `category` varchar(256) DEFAULT NULL,
  `model_name` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('6', '4', '4', 'Audi A1', '2018-02-23 10:00:57', '2018-02-23 17:00:57', '2018-02-23 17:00:57');
INSERT INTO `model` VALUES ('7', '4', '4', 'Audi A1 Sports ', '2018-02-23 10:01:03', '2018-02-23 17:01:03', '2018-02-23 17:01:03');
INSERT INTO `model` VALUES ('8', '6', '5', 'X5', '2018-02-24 00:22:30', '2018-02-24 07:22:30', '2018-02-24 07:22:30');
INSERT INTO `model` VALUES ('9', '7', '4', 'FLYING SPUR', '2018-02-24 00:22:38', '2018-02-24 07:22:38', '2018-02-24 07:22:38');
INSERT INTO `model` VALUES ('10', '7', '4', 'MULSANNE', '2018-02-24 00:22:47', '2018-02-24 07:22:47', '2018-02-24 07:22:47');
INSERT INTO `model` VALUES ('11', '6', '3', '2 SERIES ACTIVE TOURER', '2018-02-23 10:13:33', '2018-02-23 17:13:33', '2018-02-23 10:13:33');
INSERT INTO `model` VALUES ('12', '6', '3', '2 SERIES GRAN TOURER', '2018-02-23 10:12:39', '2018-02-23 17:12:39', '2018-02-23 10:12:39');
INSERT INTO `model` VALUES ('13', '10', '3', 'CAPTIVA', '2018-02-24 00:22:23', '2018-02-24 07:22:23', '2018-02-24 07:22:23');
INSERT INTO `model` VALUES ('14', '5', '3', 'A4', '2018-02-28 16:49:04', '2018-02-28 23:49:04', null);
INSERT INTO `model` VALUES ('15', '4', '3', 'A5 Sportback', '2018-02-23 17:04:12', '2018-02-23 17:04:12', null);
INSERT INTO `model` VALUES ('16', '4', '7', 'A6', '2018-02-23 17:04:37', '2018-02-23 17:04:37', null);
INSERT INTO `model` VALUES ('17', '4', '7', 'A7', '2018-02-23 17:06:43', '2018-02-23 17:06:43', null);
INSERT INTO `model` VALUES ('18', '4', '4', 'A8', '2018-02-23 17:07:25', '2018-02-23 17:07:25', null);
INSERT INTO `model` VALUES ('19', '4', '3', 'Q3', '2018-02-23 17:08:42', '2018-02-23 17:08:42', null);
INSERT INTO `model` VALUES ('20', '4', '3', 'Q5', '2018-02-23 17:09:15', '2018-02-23 17:09:15', null);
INSERT INTO `model` VALUES ('21', '4', '3', 'Q7', '2018-02-23 17:09:52', '2018-02-23 17:09:52', null);
INSERT INTO `model` VALUES ('22', '6', '3', '3 Series', '2018-02-23 17:11:18', '2018-02-23 17:11:18', null);
INSERT INTO `model` VALUES ('23', '6', '3', '4 Series', '2018-02-23 17:11:42', '2018-02-23 17:11:42', null);
INSERT INTO `model` VALUES ('24', '6', '7', '5 Series', '2018-02-23 17:12:05', '2018-02-23 17:12:05', null);
INSERT INTO `model` VALUES ('25', '6', '3', '2 SERIES ACTIVE TOURER', '2018-02-23 17:14:34', '2018-02-23 17:14:34', null);
INSERT INTO `model` VALUES ('26', '6', '3', '2 SERIES GRAN TOURER', '2018-02-23 17:14:54', '2018-02-23 17:14:54', null);
INSERT INTO `model` VALUES ('27', '6', '7', '6 Series', '2018-02-23 17:16:02', '2018-02-23 17:16:02', null);
INSERT INTO `model` VALUES ('28', '6', '4', '7 Series', '2018-02-23 17:16:19', '2018-02-23 17:16:19', null);
INSERT INTO `model` VALUES ('29', '4', '3', 'Q5', '2018-02-24 07:22:06', '2018-02-24 07:22:06', null);
INSERT INTO `model` VALUES ('30', '7', '4', 'FLYING SPUR', '2018-02-24 07:24:46', '2018-02-24 07:24:46', null);
INSERT INTO `model` VALUES ('31', '7', '4', 'MULSANNE', '2018-02-24 07:25:04', '2018-02-24 07:25:04', null);
INSERT INTO `model` VALUES ('32', '6', '3', 'X1', '2018-02-24 07:26:31', '2018-02-24 07:26:31', null);
INSERT INTO `model` VALUES ('33', '6', '3', 'X3', '2018-02-24 07:32:07', '2018-02-24 07:32:07', null);
INSERT INTO `model` VALUES ('34', '6', '6', 'X5', '2018-02-24 07:32:26', '2018-02-24 07:32:26', null);
INSERT INTO `model` VALUES ('35', '6', '7', 'X6', '2018-02-24 07:35:46', '2018-02-24 07:35:46', null);
INSERT INTO `model` VALUES ('36', '10', '3', 'CAPTIVA', '2018-02-24 07:36:16', '2018-02-24 07:36:16', null);
INSERT INTO `model` VALUES ('37', '10', '3', 'CRUZE', '2018-02-24 07:36:38', '2018-02-24 07:36:38', null);
INSERT INTO `model` VALUES ('38', '10', '3', 'EPICA', '2018-02-24 07:37:06', '2018-02-24 07:37:06', null);
INSERT INTO `model` VALUES ('39', '10', '6', 'ORLANDO', '2018-02-24 07:37:37', '2018-02-24 07:37:37', null);
INSERT INTO `model` VALUES ('40', '16', '6', 'GRAND VOYAGER', '2018-02-24 07:38:30', '2018-02-24 07:38:30', null);
INSERT INTO `model` VALUES ('41', '40', '3', 'XC90', '2018-02-24 07:42:22', '2018-02-24 07:42:22', null);
INSERT INTO `model` VALUES ('42', '40', '3', 'XC60', '2018-02-24 07:43:12', '2018-02-24 07:43:12', null);
INSERT INTO `model` VALUES ('43', '40', '4', 'V90', '2018-02-24 07:43:49', '2018-02-24 07:43:49', null);
INSERT INTO `model` VALUES ('44', '40', '7', 'V60', '2018-02-24 07:44:31', '2018-02-24 07:44:31', null);
INSERT INTO `model` VALUES ('45', '40', '3', 'V50', '2018-02-24 07:45:06', '2018-02-24 07:45:06', null);
INSERT INTO `model` VALUES ('46', '40', '3', 'V40', '2018-02-24 07:45:28', '2018-02-24 07:45:28', null);
INSERT INTO `model` VALUES ('47', '40', '4', 'S90', '2018-02-24 07:46:06', '2018-02-24 07:46:06', null);
INSERT INTO `model` VALUES ('48', '40', '7', 'S80', '2018-02-24 07:46:38', '2018-02-24 07:46:38', null);
INSERT INTO `model` VALUES ('49', '40', '3', 'S60', '2018-02-24 07:47:10', '2018-02-24 07:47:10', null);
INSERT INTO `model` VALUES ('50', '40', '3', 'S40', '2018-02-24 07:47:35', '2018-02-24 07:47:35', null);
INSERT INTO `model` VALUES ('51', '39', '6', 'TRANSPORTER', '2018-02-24 07:48:03', '2018-02-24 07:48:03', null);
INSERT INTO `model` VALUES ('52', '39', '6', 'TOURAN', '2018-02-24 07:48:35', '2018-02-24 07:48:35', null);
INSERT INTO `model` VALUES ('53', '39', '3', 'TOUAREG', '2018-02-24 07:49:24', '2018-02-24 07:49:24', null);
INSERT INTO `model` VALUES ('54', '39', '3', 'TIGUAN', '2018-02-24 07:49:52', '2018-02-24 07:49:52', null);
INSERT INTO `model` VALUES ('55', '39', '6', 'SURAN', '2018-02-24 07:50:19', '2018-02-24 07:50:19', null);
INSERT INTO `model` VALUES ('56', '39', '6', 'SHARAN', '2018-02-24 07:50:44', '2018-02-24 07:50:44', null);
INSERT INTO `model` VALUES ('57', '39', '4', 'PHAETON', '2018-02-24 07:51:05', '2018-02-24 07:51:05', null);
INSERT INTO `model` VALUES ('58', '39', '7', 'PASSAT ', '2018-02-24 07:52:02', '2018-02-24 07:52:02', null);
INSERT INTO `model` VALUES ('59', '39', '3', 'JETTA', '2018-02-24 07:52:35', '2018-02-24 07:52:35', null);
INSERT INTO `model` VALUES ('60', '39', '3', 'GOLF SPORTWAGEN', '2018-02-24 07:53:14', '2018-02-24 07:53:14', null);
INSERT INTO `model` VALUES ('61', '39', '3', 'GOLF ESTATE', '2018-02-24 07:53:45', '2018-02-24 07:53:45', null);
INSERT INTO `model` VALUES ('62', '39', '7', 'CC', '2018-02-24 07:54:06', '2018-02-24 07:54:06', null);
INSERT INTO `model` VALUES ('63', '39', '6', 'CARAVELLE', '2018-02-24 07:54:49', '2018-02-24 07:54:49', null);
INSERT INTO `model` VALUES ('64', '39', '8', 'CADDY', '2018-02-24 07:55:09', '2018-02-24 07:55:09', null);
INSERT INTO `model` VALUES ('65', '39', '3', 'BORA', '2018-02-24 07:55:36', '2018-02-24 07:55:36', null);
INSERT INTO `model` VALUES ('66', '38', '3', 'VERSO', '2018-02-24 07:56:43', '2018-02-24 07:56:43', null);
INSERT INTO `model` VALUES ('67', '38', '3', 'RAV4', '2018-02-24 07:57:08', '2018-02-24 07:57:08', null);
INSERT INTO `model` VALUES ('68', '38', '6', 'PROACE', '2018-02-24 07:57:39', '2018-02-24 07:57:39', null);
INSERT INTO `model` VALUES ('69', '38', '3', 'PRIUS+', '2018-02-24 07:58:13', '2018-02-24 07:58:13', null);
INSERT INTO `model` VALUES ('70', '38', '3', 'PRIUS', '2018-02-24 07:58:35', '2018-02-24 07:58:35', null);
INSERT INTO `model` VALUES ('71', '38', '6', 'PREVIA', '2018-02-24 07:58:56', '2018-02-24 07:58:56', null);
INSERT INTO `model` VALUES ('72', '38', '6', 'ESTIMA', '2018-02-24 07:59:21', '2018-02-24 07:59:21', null);
INSERT INTO `model` VALUES ('73', '38', '3', 'CAMRY', '2018-02-24 07:59:41', '2018-02-24 07:59:41', null);
INSERT INTO `model` VALUES ('74', '38', '3', 'AVENSIS', '2018-02-24 08:00:07', '2018-02-24 08:00:07', null);
INSERT INTO `model` VALUES ('75', '38', '3', 'AURIS TOURING SPORTS', '2018-02-24 08:00:31', '2018-02-24 08:00:31', null);
INSERT INTO `model` VALUES ('76', '38', '3', 'AURIS ', '2018-02-24 08:01:37', '2018-02-24 08:01:37', null);
INSERT INTO `model` VALUES ('77', '41', '6', 'MODEL X', '2018-02-24 08:02:17', '2018-02-24 08:02:17', null);
INSERT INTO `model` VALUES ('78', '41', '3', 'MODEL 3', '2018-02-24 08:04:01', '2018-02-24 08:04:01', null);
INSERT INTO `model` VALUES ('79', '41', '7', 'MODEL S', '2018-02-24 08:04:53', '2018-02-24 08:04:53', null);
INSERT INTO `model` VALUES ('80', '43', '3', 'LEGACY', '2018-02-24 08:10:42', '2018-02-24 08:10:42', null);
INSERT INTO `model` VALUES ('81', '44', '3', 'ANTARA', '2018-02-24 08:12:09', '2018-02-24 08:12:09', null);
INSERT INTO `model` VALUES ('82', '44', '3', 'ASTRA', '2018-02-24 08:12:35', '2018-02-24 08:12:35', null);
INSERT INTO `model` VALUES ('83', '44', '3', 'SIGNUM', '2018-02-24 08:13:36', '2018-02-24 08:13:36', null);
INSERT INTO `model` VALUES ('84', '44', '3', 'VECTRA', '2018-02-24 08:13:54', '2018-02-24 08:13:54', null);
INSERT INTO `model` VALUES ('85', '44', '6', 'VIVARO', '2018-02-24 08:14:28', '2018-02-24 08:14:28', null);
INSERT INTO `model` VALUES ('86', '44', '6', 'ZAFIRA', '2018-02-24 08:14:47', '2018-02-24 08:14:47', null);
INSERT INTO `model` VALUES ('87', '45', '6', 'TURISMO', '2018-02-24 08:16:43', '2018-02-24 08:16:43', null);
INSERT INTO `model` VALUES ('88', '45', '6', 'RODIUS', '2018-02-24 08:17:54', '2018-02-24 08:17:54', null);
INSERT INTO `model` VALUES ('89', '46', '7', 'SUPERB', '2018-02-24 08:19:26', '2018-02-24 08:19:26', null);
INSERT INTO `model` VALUES ('90', '46', '3', 'RAPID SPACEBACK', '2018-02-24 08:20:08', '2018-02-24 08:20:08', null);
INSERT INTO `model` VALUES ('91', '46', '3', 'RAPID', '2018-02-24 08:20:33', '2018-02-24 08:20:33', null);
INSERT INTO `model` VALUES ('92', '46', '3', 'OCTAVIA', '2018-02-24 08:20:55', '2018-02-24 08:20:55', null);
INSERT INTO `model` VALUES ('93', '46', '3', 'KODIAQ', '2018-02-24 08:21:28', '2018-02-24 08:21:28', null);
INSERT INTO `model` VALUES ('94', '47', '6', 'X-PERIENCE', '2018-02-24 08:22:41', '2018-02-24 08:22:41', null);
INSERT INTO `model` VALUES ('95', '47', '6', 'TOLEDO', '2018-02-24 08:23:06', '2018-02-24 08:23:06', null);
INSERT INTO `model` VALUES ('96', '47', '3', 'LEON ST', '2018-02-24 08:23:47', '2018-02-24 08:23:47', null);
INSERT INTO `model` VALUES ('97', '47', '6', 'EXEO', '2018-02-24 08:24:12', '2018-02-24 08:24:12', null);
INSERT INTO `model` VALUES ('98', '47', '3', 'ALTEA XL', '2018-02-24 08:24:59', '2018-02-24 08:24:59', null);
INSERT INTO `model` VALUES ('99', '47', '6', 'ALHAMBRA', '2018-02-24 08:25:17', '2018-02-24 08:25:17', null);
INSERT INTO `model` VALUES ('100', '48', '3', '75', '2018-02-24 08:27:29', '2018-02-24 08:27:29', null);
INSERT INTO `model` VALUES ('101', '12', '4', 'PHANTOM', '2018-02-24 08:27:52', '2018-02-24 08:27:52', null);
INSERT INTO `model` VALUES ('102', '12', '4', 'GHOST', '2018-02-24 08:28:12', '2018-02-24 08:28:12', null);
INSERT INTO `model` VALUES ('103', '35', '6', 'TRAFIC', '2018-02-24 08:29:06', '2018-02-24 08:29:06', null);
INSERT INTO `model` VALUES ('104', '35', '3', 'MEGANE ESTATE', '2018-02-24 08:30:01', '2018-02-24 08:30:01', null);
INSERT INTO `model` VALUES ('105', '35', '3', 'MEGANE ESTATE', '2018-02-24 01:32:03', '2018-02-24 08:32:03', '2018-02-24 08:32:03');
INSERT INTO `model` VALUES ('106', '35', '3', 'MEGANE ESTATE', '2018-02-24 01:31:48', '2018-02-24 08:31:48', '2018-02-24 08:31:48');
INSERT INTO `model` VALUES ('107', '35', '3', 'MEGANE', '2018-02-24 08:31:17', '2018-02-24 08:31:17', null);
INSERT INTO `model` VALUES ('108', '35', '3', 'LAGUNA', '2018-02-24 08:33:24', '2018-02-24 08:33:24', null);
INSERT INTO `model` VALUES ('109', '35', '6', 'GRAND SCENIC', '2018-02-24 08:35:33', '2018-02-24 08:35:33', null);
INSERT INTO `model` VALUES ('110', '35', '3', 'FLUENCE', '2018-02-24 08:38:40', '2018-02-24 08:38:40', null);
INSERT INTO `model` VALUES ('111', '35', '6', 'ESPACE', '2018-02-24 08:39:03', '2018-02-24 08:39:03', null);
INSERT INTO `model` VALUES ('112', '49', '3', 'PERSONA', '2018-02-24 08:40:42', '2018-02-24 08:40:42', null);
INSERT INTO `model` VALUES ('113', '49', '3', 'GEN-2', '2018-02-24 08:41:17', '2018-02-24 08:41:17', null);
INSERT INTO `model` VALUES ('114', '34', '4', 'PANAMERA', '2018-02-24 08:41:54', '2018-02-24 08:41:54', null);
INSERT INTO `model` VALUES ('115', '34', '3', 'MACAN', '2018-02-24 08:42:40', '2018-02-24 08:42:40', null);
INSERT INTO `model` VALUES ('116', '34', '3', 'CAYENNE', '2018-02-24 08:43:16', '2018-02-24 08:43:16', null);
INSERT INTO `model` VALUES ('117', '33', '6', 'TRAVELLER', '2018-02-24 08:43:46', '2018-02-24 08:43:46', null);
INSERT INTO `model` VALUES ('118', '33', '8', 'PARTNER', '2018-02-24 08:44:52', '2018-02-24 08:44:52', null);
INSERT INTO `model` VALUES ('119', '33', '6', 'EXPERT TEPEE', '2018-02-24 08:45:30', '2018-02-24 08:45:30', null);
INSERT INTO `model` VALUES ('120', '33', '6', 'EXPERT', '2018-02-24 08:46:00', '2018-02-24 08:46:00', null);
INSERT INTO `model` VALUES ('121', '33', '6', 'EUROBUS', '2018-02-24 08:46:15', '2018-02-24 08:46:15', null);
INSERT INTO `model` VALUES ('122', '33', '8', 'E7', '2018-02-24 08:46:46', '2018-02-24 08:46:46', null);
INSERT INTO `model` VALUES ('123', '33', '8', 'BIPPER', '2018-02-24 08:47:06', '2018-02-24 08:47:06', null);
INSERT INTO `model` VALUES ('124', '33', '6', '807', '2018-02-24 08:47:29', '2018-02-24 08:47:29', null);
INSERT INTO `model` VALUES ('125', '33', '7', '607', '2018-02-24 08:47:54', '2018-02-24 08:47:54', null);
INSERT INTO `model` VALUES ('126', '33', '3', '508 SW', '2018-02-24 08:48:25', '2018-02-24 08:48:25', null);
INSERT INTO `model` VALUES ('127', '33', '7', '508', '2018-02-24 08:49:01', '2018-02-24 08:49:01', null);
INSERT INTO `model` VALUES ('128', '33', '6', '5008', '2018-02-24 08:49:23', '2018-02-24 08:49:23', null);
INSERT INTO `model` VALUES ('129', '33', '3', '407', '2018-02-24 08:49:53', '2018-02-24 08:49:53', null);
INSERT INTO `model` VALUES ('130', '33', '3', '4007', '2018-02-24 08:50:19', '2018-02-24 08:50:19', null);
INSERT INTO `model` VALUES ('131', '33', '3', '308 SW', '2018-02-24 08:50:38', '2018-02-24 08:50:38', null);
INSERT INTO `model` VALUES ('132', '33', '3', '308', '2018-02-24 08:51:03', '2018-02-24 08:51:03', null);
INSERT INTO `model` VALUES ('133', '33', '3', '3008', '2018-02-24 08:51:20', '2018-02-24 08:51:20', null);
INSERT INTO `model` VALUES ('134', '5', '4', 'Rapide S', '2018-02-25 20:44:31', '2018-02-25 20:44:31', null);
INSERT INTO `model` VALUES ('138', '9', '4', 'test', '2018-02-28 16:51:11', '2018-02-28 23:51:11', '2018-02-28 23:51:11');
INSERT INTO `model` VALUES ('139', '8', '7', 'test', '2018-03-01 01:01:29', '2018-03-01 08:01:29', '2018-03-01 08:01:29');

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('2', 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('3', 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('4', 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('5', 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('6', 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('7', 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('8', 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('9', 'Drivers', 'Drivers', 'drivers', 'password', 'Driver', 'DriversController', 'fa-cube', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('10', 'Plans_names', 'Plans_names', 'plans_names', 'plan_price', 'Plans_name', 'Plans_namesController', 'fa-cube', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('11', 'User_roles', 'User_roles', 'user_roles', 'name', 'User_role', 'User_rolesController', 'fa-cube', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('12', 'User_registrations', 'User_registrations', 'user_registrations', 'password', 'User_registration', 'User_registrationsController', 'fa-cube', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:23');
INSERT INTO `modules` VALUES ('13', 'Categories', 'Categories', 'categories', 'password', 'Category', 'CategoriesController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:51');
INSERT INTO `modules` VALUES ('14', 'Modelns', 'Modelns', 'model', 'name', 'Modeln', 'ModelnsController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:51');
INSERT INTO `modules` VALUES ('15', 'Makes', 'Makes', 'make', 'name', 'Make', 'MakesController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:51');
INSERT INTO `modules` VALUES ('16', 'Home_Page_Messages', 'Home_Page_Messages', 'home_page_messages', 'name', 'Home_Page_Message', 'Home_Page_MessagesController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:51');
INSERT INTO `modules` VALUES ('17', 'Passengers', 'Passengers', 'client_details', 'name', 'Passenger', 'PassengersController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('18', 'Information_Cards', 'Information_Cards', 'information_cards', 'name', 'Information_card', 'Information_cardsController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('19', 'Colours', 'Colours', 'colours', 'name', 'Colour', 'ColoursController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('20', 'Overtime_Hourly_Fares', 'Overtime_Hourly_Fares', 'overtime_hourly_fares', 'overtime_price', 'Overtime_Hourly_fare', 'Overtime_Hourly_faresController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('21', 'Passenger_Subscriptions', 'Passenger_Subscriptions', 'passenger_subscriptions', 'subscription_driver', 'Passenger_Subscription', 'Passenger_SubscriptionsController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('22', 'Passenger_Taxes', 'Passenger_Taxes', 'passenger_taxes', 'vat', 'Passenger_Tax', 'Passenger_TaxesController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');
INSERT INTO `modules` VALUES ('23', 'Subcriptions', 'Subcriptions', 'subcriptions', 'subscription_name', 'Subscription', 'SubcriptionsController', 'fa-cube', '1', '2018-02-19 11:55:42', '2018-02-19 11:55:42');

-- ----------------------------
-- Table structure for module_fields
-- ----------------------------
DROP TABLE IF EXISTS `module_fields`;
CREATE TABLE `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module_fields
-- ----------------------------
INSERT INTO `module_fields` VALUES ('1', 'name', 'Name', '1', '16', '0', '', '5', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('2', 'context_id', 'Context', '1', '13', '0', '0', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('3', 'email', 'Email', '1', '8', '1', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('4', 'password', 'Password', '1', '17', '0', '', '6', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('5', 'type', 'User Type', '1', '7', '0', 'Employee', '0', '0', '0', '[\"Employee\",\"Client\"]', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('6', 'name', 'Name', '2', '16', '0', '', '5', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('7', 'path', 'Path', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('8', 'extension', 'Extension', '2', '19', '0', '', '0', '20', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('9', 'caption', 'Caption', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('10', 'user_id', 'Owner', '2', '7', '0', '1', '0', '0', '0', '@users', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('11', 'hash', 'Hash', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('12', 'public', 'Is Public', '2', '2', '0', '0', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('13', 'name', 'Name', '3', '16', '1', '', '1', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('14', 'tags', 'Tags', '3', '20', '0', '[]', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('15', 'color', 'Color', '3', '19', '0', '', '0', '50', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('16', 'name', 'Name', '4', '16', '0', '', '5', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('17', 'designation', 'Designation', '4', '19', '0', '', '0', '50', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('18', 'gender', 'Gender', '4', '18', '0', 'Male', '0', '0', '1', '[\"Male\",\"Female\"]', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('19', 'mobile', 'Mobile', '4', '14', '0', '', '10', '20', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('20', 'mobile2', 'Alternative Mobile', '4', '14', '0', '', '10', '20', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('21', 'email', 'Email', '4', '8', '1', '', '5', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('22', 'dept', 'Department', '4', '7', '0', '0', '0', '0', '1', '@departments', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('23', 'city', 'City', '4', '19', '0', '', '0', '50', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('24', 'address', 'Address', '4', '1', '0', '', '0', '1000', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('25', 'about', 'About', '4', '19', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('26', 'date_birth', 'Date of Birth', '4', '4', '0', '1990-01-01', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('27', 'date_hire', 'Hiring Date', '4', '4', '0', 'date(\'Y-m-d\')', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('28', 'date_left', 'Resignation Date', '4', '4', '0', '1990-01-01', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('29', 'salary_cur', 'Current Salary', '4', '6', '0', '0.0', '0', '2', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('30', 'name', 'Name', '5', '16', '1', '', '1', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('31', 'display_name', 'Display Name', '5', '19', '0', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('32', 'description', 'Description', '5', '21', '0', '', '0', '1000', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('33', 'parent', 'Parent Role', '5', '7', '0', '1', '0', '0', '0', '@roles', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('34', 'dept', 'Department', '5', '7', '0', '1', '0', '0', '0', '@departments', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('35', 'name', 'Name', '6', '16', '1', '', '5', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('36', 'email', 'Email', '6', '8', '1', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('37', 'phone', 'Phone', '6', '14', '0', '', '0', '20', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('38', 'website', 'Website', '6', '23', '0', 'http://', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('39', 'assigned_to', 'Assigned to', '6', '7', '0', '0', '0', '0', '0', '@employees', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('40', 'connect_since', 'Connected Since', '6', '4', '0', 'date(\'Y-m-d\')', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('41', 'address', 'Address', '6', '1', '0', '', '0', '1000', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('42', 'city', 'City', '6', '19', '0', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('43', 'description', 'Description', '6', '21', '0', '', '0', '1000', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('44', 'profile_image', 'Profile Image', '6', '12', '0', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('45', 'profile', 'Company Profile', '6', '9', '0', '', '0', '250', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('46', 'name', 'Name', '7', '16', '1', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('47', 'file_name', 'File Name', '7', '19', '1', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('48', 'backup_size', 'File Size', '7', '19', '0', '0', '0', '10', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('49', 'name', 'Name', '8', '16', '1', '', '1', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('50', 'display_name', 'Display Name', '8', '19', '0', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('51', 'description', 'Description', '8', '21', '0', '', '0', '1000', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('52', 'first_name', 'FirstName', '9', '22', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('53', 'email', 'Email', '9', '8', '1', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('54', 'country', 'Country', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('55', 'telephone', 'Telephone Number', '9', '13', '0', '', '0', '11', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('56', 'mobile_number', 'Mobile Number', '9', '13', '0', '', '0', '11', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('57', 'profile_pic', 'Upload Photo', '9', '12', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('58', 'make', 'Make', '9', '7', '0', '', '0', '0', '1', '@make', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('59', 'model', 'Model', '9', '7', '0', '', '0', '0', '1', '@model', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('60', 'colour', 'Colour\r\n\r\n\r\n', '9', '7', '0', '', '0', '0', '1', '@colours', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('61', 'registration', 'Registration', '9', '22', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('62', 'upload_doc', 'Upload PHV Doc', '9', '24', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('63', 'upload_mot_doc', 'Upload M.O.T. Doc', '9', '24', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('64', 'license', 'Driver\'s Licence', '9', '24', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('65', 'pco_doc', 'Driver’s PCO doc', '9', '24', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('66', 'insurance_doc', 'Driver insurance doc', '9', '24', '0', '', '0', '0', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('67', 'last_name', 'LastName', '9', '22', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('68', 'password', 'Password', '9', '17', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('69', 'plan_name', 'Plan Name', '10', '22', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('70', 'hour_ride', 'Hourly Ride', '10', '22', '0', '', '0', '11', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('71', 'type', 'Type', '10', '7', '0', '', '0', '0', '1', '[\"duration\",\"mile\"]', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('72', 'plan_price', 'Price', '10', '3', '0', '', '0', '11', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('73', 'user_role', 'Name', '11', '19', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('74', 'first_name', 'First Name', '12', '19', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('75', 'last_name', 'Last Name', '12', '19', '0', '', '0', '256', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('76', 'email', 'Email', '12', '19', '1', '', '0', '250', '1', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('77', 'phone', 'Phone', '12', '13', '0', '', '0', '11', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('78', 'user_role', 'User Role', '12', '7', '0', '', '0', '0', '1', '@user_roles', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('79', 'password', 'Password', '12', '17', '0', '', '0', '256', '0', '', '0', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_fields` VALUES ('80', 'status', 'Status', '9', '7', '0', 'Reject', '0', '256', '0', '[\"Approved\",\"Reject\",\"Suspend\"]', '0', '2018-02-19 01:52:33', '2018-02-19 01:52:39');
INSERT INTO `module_fields` VALUES ('81', 'address_line_1', 'Address_Line_1', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:25');
INSERT INTO `module_fields` VALUES ('82', 'address_line_2', 'Address_Line_2', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:25');
INSERT INTO `module_fields` VALUES ('83', 'address_line_3', 'Address_Line_3', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('84', 'town', 'Town', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('85', 'city', 'City', '9', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('86', 'postcode', 'PostCode', '9', '6', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('87', 'country_code', 'CountryCode', '9', '6', '0', '', '0', '5', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('88', 'phv_expire_date', 'ExpireDate', '9', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('89', 'mot_issue_date', 'IssueDate', '9', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('90', 'license_expire_date', 'LicenseExpireDate', '9', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('91', 'pco_expire_date', 'PCOExpireDate', '9', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('92', 'insurance_expire_date', 'InsuranceExpireDate', '9', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('93', 'license_pic', 'LicensePic', '9', '12', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('94', 'name', 'Name', '9', '22', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('95', 'category_name', 'CategoryName', '13', '22', '0', '', '1', '256', '1', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('96', 'model_value', 'Model Name', '14', '22', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('164', 'quote_footer', 'Quote Footer', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('98', 'category', 'Category', '14', '7', '0', '', '0', '0', '0', '@categories', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('99', 'category', 'Category', '10', '7', '0', '', '0', '0', '0', '@categories', '1', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('100', 'hour_ride', 'Hour_ride', '10', '22', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('167', 'license', 'Driver\'s License', '1', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('102', 'type', 'Type', '10', '7', '0', '', '0', '256', '0', '[\"duration\",\"mile\"]', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('103', 'make_id', 'MakeName', '14', '7', '0', '', '0', '256', '0', '@make', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('160', 'welcome_logo', 'Welcome Logo', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('106', 'make_name', 'MakeName', '15', '22', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('162', 'welcome_footer', 'WelcomeFooter', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('111', 'welcome_title', 'Welcome Title', '16', '22', '0', '', '0', '500', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('112', 'welcome_message', 'Welcome Message', '16', '22', '0', '', '0', '5000', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('113', 'quote_title', 'Quote_title', '16', '22', '0', '', '0', '500', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('114', 'quote_message', 'Quote_Message', '16', '22', '0', '', '0', '500', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('115', 'update_title', 'Update Title', '16', '22', '0', '', '0', '500', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('116', 'update_message', 'Update Message', '16', '22', '0', '', '0', '500', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('117', 'client_first_name', 'First name', '17', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('118', 'client_last_name', 'Client_Last_Name', '17', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('119', 'client_email', 'Client_Email', '17', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('120', 'client_phone', 'Client_Phone', '17', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('122', 'country_code', 'Country_Code', '17', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('123', 'status', 'Status', '1', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('124', 'county', 'County', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('125', 'county', 'County', '9', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('126', 'encrypt_user_id', 'EncryptUserID', '9', '19', '0', '', '0', '256', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('127', 'address_line_1', 'Address_Line_1', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('128', 'address_line_2', 'Address_Line_2', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('129', 'address_line_3', 'Address_Line_3', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('130', 'country', 'Country', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('131', 'first_name', 'FirstName', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('132', 'last_name', 'LastName', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('133', 'town', 'Town', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('134', 'city', 'City', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('135', 'postcode', 'PostCode', '1', '6', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('136', 'telephone', 'Telephone Number', '1', '13', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('137', 'mobile_number', 'MobileNumber', '1', '13', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('138', 'country_code', 'CountryCode', '1', '6', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('139', 'profile_pic', 'UploadPhoto', '1', '12', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('140', 'make', 'Make', '1', '7', '0', '', '0', '50', '0', '@make', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('141', 'model', 'Model', '1', '7', '0', '', '0', '50', '0', '@model', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('142', 'colour', 'Colour', '1', '7', '0', '', '0', '50', '0', '@colours', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('143', 'registration', 'Registration', '1', '19', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('144', 'upload_doc', 'Upload PHV Doc', '1', '9', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('145', 'upload_mot_doc', 'Upload M.O.T. Doc', '1', '24', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('146', 'licence', 'Driver\'s Licence', '1', '24', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('147', 'pco_doc', 'Driver’s PCO doc', '1', '24', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('148', 'insurance_doc', 'Driver insurance doc', '1', '24', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('149', 'license_pic', 'LicensePic', '1', '12', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('150', 'phv_expire_date', 'ExpireDate', '1', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('151', 'mot_issue_date', 'IssueDate', '1', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('152', 'license_expire_date', 'LicenseExpireDate', '1', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('153', 'pco_expire_date', 'PCOExpireDate', '1', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('154', 'insurance_expire_date', 'InsuranceExpireDate', '1', '4', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('156', 'card_subject', 'Subject', '18', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('157', 'card_message', 'Message', '18', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('158', 'colour_name', 'Colour', '19', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('159', 'make_name', 'MakeName', '19', '7', '0', '', '0', '50', '0', '@make', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('163', 'quote_logo', 'Quote Logo', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('165', 'update_logo', 'Update Logo', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('166', 'update_footer', 'Update Footer', '16', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('168', 'overtime_hourly_fare', 'Overtime_Hourly_Fare', '20', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('169', 'overtime_price', 'Overtime_Price', '20', '10', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('170', 'subscription_price', 'Subscription_Price', '21', '6', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('171', 'subscription_driver', 'Subscription_Driver', '21', '6', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('172', 'vat', 'Vat(%)', '22', '10', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('173', 'subscription_name', 'Subscription_Name', '23', '22', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('174', 'commission', 'Commission', '23', '10', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('175', 'subscription_amount', 'Subscription_Price', '23', '10', '0', '', '0', '0', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('176', 'make_id', 'Make', '14', '7', '0', '', '0', '0', '0', '@make', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('177', 'make_id', 'Make', '19', '7', '0', '', '0', '0', '0', '@make', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('179', 'driver_id', 'Driver ID', '24', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('180', 'plan_id', 'Plan Name', '24', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('181', 'plan_amount', 'Plan Amount', '24', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('182', 'transaction_id', 'Transaction ID', '24', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');
INSERT INTO `module_fields` VALUES ('183', 'expire_date', 'Expire Date', '24', '22', '0', '', '0', '50', '0', '', '0', '2018-02-19 13:00:22', '2018-02-19 13:00:22');

-- ----------------------------
-- Table structure for module_field_types
-- ----------------------------
DROP TABLE IF EXISTS `module_field_types`;
CREATE TABLE `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module_field_types
-- ----------------------------
INSERT INTO `module_field_types` VALUES ('1', 'Address', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('2', 'Checkbox', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('3', 'Currency', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('4', 'Date', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('5', 'Datetime', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('6', 'Decimal', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('7', 'Dropdown', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('8', 'Email', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('9', 'File', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('10', 'Float', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('11', 'HTML', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('12', 'Image', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('13', 'Integer', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('14', 'Mobile', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('15', 'Multiselect', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('16', 'Name', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('17', 'Password', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('18', 'Radio', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('19', 'String', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('20', 'Taginput', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('21', 'Textarea', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('22', 'TextField', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('23', 'URL', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `module_field_types` VALUES ('24', 'Files', '2018-01-30 21:40:22', '2018-01-30 21:40:22');

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `profile` blob NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organizations
-- ----------------------------
INSERT INTO `organizations` VALUES ('1', 'aasdasd', 'asd@asdasd.coim', '123123123', 'http://www.www', '1', '2018-02-19', 'asdasdasdasd', 'asdasdasd', 'asdasdasd', 'Penguins.jpg', 0x30, null, '2018-02-20 11:11:16', '2018-02-25 13:03:57');
INSERT INTO `organizations` VALUES ('2', 'asdasd', 'asd@a', '123123', 'http://wwww.asdasd', '1', '2018-02-19', 'asdasd', 'asdasd', 'asdasdasd', 'Koala.jpg', 0x30, '2018-02-25 13:04:03', '2018-02-20 15:55:54', '2018-02-25 13:04:03');
INSERT INTO `organizations` VALUES ('3', 'name123', 'email@email', '123456', 'http://www.www', '1', '2018-02-09', 'addressadsf', 'city', 'asdf', 'Koala.jpg', 0x30, null, '2018-02-24 09:51:57', '2018-02-24 09:54:03');

-- ----------------------------
-- Table structure for overtime_hourly_fares
-- ----------------------------
DROP TABLE IF EXISTS `overtime_hourly_fares`;
CREATE TABLE `overtime_hourly_fares` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `overtime_hourly_fare` int(20) NOT NULL,
  `overtime_price` float(20,2) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of overtime_hourly_fares
-- ----------------------------
INSERT INTO `overtime_hourly_fares` VALUES ('1', '1', '2.00', '2018-02-25 00:07:35', '2018-02-25 00:07:35', null);
INSERT INTO `overtime_hourly_fares` VALUES ('2', '1', '2.00', '2018-02-25 08:12:09', '2018-02-25 08:12:09', null);
INSERT INTO `overtime_hourly_fares` VALUES ('3', '123', '123.00', '2018-02-25 08:16:56', '2018-02-25 00:16:56', null);

-- ----------------------------
-- Table structure for passenger_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `passenger_subscriptions`;
CREATE TABLE `passenger_subscriptions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subscription_price` float(20,2) NOT NULL,
  `subscription_driver` int(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of passenger_subscriptions
-- ----------------------------
INSERT INTO `passenger_subscriptions` VALUES ('1', '123.00', '1', '2018-02-25 12:18:21', '2018-02-25 04:18:21', null);
INSERT INTO `passenger_subscriptions` VALUES ('2', '3.00', '3', '2018-02-26 17:25:25', '2018-02-26 17:25:25', null);

-- ----------------------------
-- Table structure for passenger_taxes
-- ----------------------------
DROP TABLE IF EXISTS `passenger_taxes`;
CREATE TABLE `passenger_taxes` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `vat` float(20,2) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of passenger_taxes
-- ----------------------------
INSERT INTO `passenger_taxes` VALUES ('1', '35.00', '2018-02-26 04:05:28', '2018-02-25 21:05:28', null);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_amount` float(11,2) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', null, '2018-01-30 21:40:23', '2018-01-30 21:40:23');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('1', '2');

-- ----------------------------
-- Table structure for plans_names
-- ----------------------------
DROP TABLE IF EXISTS `plans_names`;
CREATE TABLE `plans_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour_ride` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plan_price` double(15,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of plans_names
-- ----------------------------
INSERT INTO `plans_names` VALUES ('1', 'Plan', '1000', 'duration', '50.00', null, '2018-02-20 11:46:12', '2018-02-24 23:12:22', '4');
INSERT INTO `plans_names` VALUES ('2', 'vacation', '160', 'mile', '120.00', null, '2018-02-20 11:49:13', '2018-02-24 14:07:59', '6');
INSERT INTO `plans_names` VALUES ('3', 'business', '10', 'mile', '15.00', null, '2018-02-24 14:09:05', '2018-02-24 14:09:05', '6');
INSERT INTO `plans_names` VALUES ('4', 'plan_test', '20', 'duration', '10.00', null, '2018-02-24 14:52:51', '2018-02-25 11:31:24', '3');
INSERT INTO `plans_names` VALUES ('5', 'A to B', '1000', 'duration', '30.00', null, '2018-02-25 11:32:37', '2018-02-25 11:33:10', '4');
INSERT INTO `plans_names` VALUES ('6', 'test', '12', 'duration', '12.00', null, '2018-02-25 21:13:06', '2018-02-25 21:13:16', '6');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT '1',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', '1', '1', null, '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `roles` VALUES ('2', 'ASDASD', 'asd', 'asd', '1', '1', null, '2018-02-20 15:58:19', '2018-02-20 15:58:32');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES ('1', '1', '1', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('2', '1', '2', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('3', '1', '3', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('4', '1', '4', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('5', '1', '5', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('6', '1', '6', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('7', '1', '7', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('8', '1', '8', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('9', '1', '9', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('10', '1', '10', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('11', '1', '11', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('12', '1', '12', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('13', '1', '13', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('14', '1', '14', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('15', '1', '15', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('16', '1', '16', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('17', '1', '17', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('18', '1', '18', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('19', '1', '19', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('20', '1', '20', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('21', '1', '21', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('22', '1', '22', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module` VALUES ('23', '1', '23', '1', '1', '1', '1', '2018-01-30 21:40:22', '2018-01-30 21:40:22');

-- ----------------------------
-- Table structure for role_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `role_module_fields`;
CREATE TABLE `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_module_fields
-- ----------------------------
INSERT INTO `role_module_fields` VALUES ('1', '1', '1', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('2', '1', '2', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('3', '1', '3', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('4', '1', '4', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('5', '1', '5', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('6', '1', '6', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('7', '1', '7', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('8', '1', '8', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('9', '1', '9', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('10', '1', '10', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('11', '1', '11', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('12', '1', '12', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('13', '1', '13', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('14', '1', '14', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('15', '1', '15', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('16', '1', '16', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('17', '1', '17', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('18', '1', '18', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('19', '1', '19', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('20', '1', '20', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('21', '1', '21', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('22', '1', '22', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('23', '1', '23', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('24', '1', '24', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('25', '1', '25', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('26', '1', '26', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('27', '1', '27', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('28', '1', '28', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('29', '1', '29', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('30', '1', '30', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('31', '1', '31', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('32', '1', '32', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('33', '1', '33', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('34', '1', '34', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('35', '1', '35', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('36', '1', '36', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('37', '1', '37', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('38', '1', '38', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('39', '1', '39', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('40', '1', '40', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('41', '1', '41', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('42', '1', '42', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('43', '1', '43', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('44', '1', '44', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('45', '1', '45', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('46', '1', '46', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('47', '1', '47', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('48', '1', '48', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('49', '1', '49', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('50', '1', '50', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('51', '1', '51', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('52', '1', '52', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('53', '1', '53', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('54', '1', '54', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('55', '1', '55', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('56', '1', '56', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('57', '1', '57', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('58', '1', '58', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('59', '1', '59', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('60', '1', '60', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('61', '1', '61', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('62', '1', '62', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('63', '1', '63', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('64', '1', '64', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('65', '1', '65', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('66', '1', '66', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('67', '1', '67', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('68', '1', '68', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('69', '1', '69', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('70', '1', '70', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('71', '1', '71', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('72', '1', '72', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('73', '1', '73', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('74', '1', '74', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('75', '1', '75', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('76', '1', '76', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('77', '1', '77', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('78', '1', '78', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('79', '1', '79', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('80', '1', '95', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('81', '1', '99', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('82', '1', '100', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('84', '1', '102', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('85', '1', '103', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('242', '1', '98', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('87', '1', '105', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('88', '1', '106', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('89', '1', '96', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('91', '1', '110', 'write', '2018-01-30 21:40:22', '2018-01-30 21:40:22');
INSERT INTO `role_module_fields` VALUES ('92', '2', '1', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('93', '2', '2', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('94', '2', '3', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('95', '2', '4', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('96', '2', '5', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('97', '2', '6', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('98', '2', '7', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('99', '2', '8', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('100', '2', '9', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('101', '2', '10', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('102', '2', '11', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('103', '2', '12', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('104', '2', '13', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('105', '2', '14', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('106', '2', '15', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('107', '2', '16', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('108', '2', '17', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('109', '2', '18', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('110', '2', '19', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('111', '2', '20', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('112', '2', '21', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('113', '2', '22', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('114', '2', '23', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('115', '2', '24', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('116', '2', '25', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('117', '2', '26', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('118', '2', '27', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('119', '2', '28', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('120', '2', '29', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('121', '2', '30', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('251', '1', '168', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('252', '1', '169', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('253', '1', '170', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('254', '1', '171', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('255', '1', '172', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('256', '1', '173', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('257', '1', '174', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('258', '1', '175', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('144', '2', '53', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('243', '1', '160', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('250', '1', '167', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('160', '1', '80', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('161', '1', '81', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('162', '1', '82', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('163', '1', '83', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('164', '1', '84', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('165', '1', '85', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('166', '1', '86', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('167', '1', '87', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('168', '1', '88', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('169', '1', '89', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('170', '1', '90', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('171', '1', '91', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('172', '1', '92', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('173', '1', '93', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('174', '1', '94', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('176', '2', '100', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('177', '1', '102', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('178', '1', '101', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('179', '1', '99', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('187', '1', '95', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('188', '1', '96', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('189', '1', '103', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('190', '1', '105', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('191', '1', '104', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('192', '1', '106', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('193', '1', '110', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('194', '1', '111', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('195', '1', '112', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('196', '1', '113', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('197', '1', '114', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('198', '1', '115', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('199', '1', '116', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('201', '1', '117', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('202', '1', '118', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('203', '1', '119', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('204', '1', '120', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('205', '1', '121', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('206', '1', '123', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('207', '1', '124', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('208', '1', '125', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('209', '1', '126', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('210', '1', '127', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('211', '1', '128', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('212', '1', '129', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('213', '1', '130', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('214', '1', '131', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('215', '1', '132', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('216', '1', '133', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('217', '1', '134', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('218', '1', '135', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('219', '1', '136', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('220', '1', '137', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('221', '1', '138', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('222', '1', '139', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('223', '1', '140', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('224', '1', '141', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('225', '1', '142', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('226', '1', '143', 'write', '0000-00-00 00:00:00', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('227', '1', '144', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('228', '1', '145', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('229', '1', '146', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('230', '1', '147', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('231', '1', '148', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('232', '1', '149', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('233', '1', '150', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('234', '1', '151', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('235', '1', '152', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('236', '1', '153', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('237', '1', '156', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('238', '1', '157', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('240', '1', '158', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('241', '1', '159', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('244', '1', '161', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('245', '1', '162', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('246', '1', '163', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('247', '1', '164', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('248', '1', '165', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('249', '1', '166', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('259', '1', '176', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('260', '1', '177', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('261', '1', '179', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('262', '1', '180', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('263', '1', '181', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('264', '1', '182', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');
INSERT INTO `role_module_fields` VALUES ('265', '1', '183', 'write', '2018-02-20 15:58:19', '2018-02-20 15:58:19');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1', null, null);

-- ----------------------------
-- Table structure for set_availabilities
-- ----------------------------
DROP TABLE IF EXISTS `set_availabilities`;
CREATE TABLE `set_availabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sunday_to` time DEFAULT NULL,
  `sunday_from` time DEFAULT NULL,
  `monday_to` time DEFAULT NULL,
  `monday_from` time DEFAULT NULL,
  `tuesday_to` time DEFAULT NULL,
  `tuesday_from` time DEFAULT NULL,
  `wednesday_to` time DEFAULT NULL,
  `wednesday_from` time DEFAULT NULL,
  `thursday_to` time DEFAULT NULL,
  `thursday_from` time DEFAULT NULL,
  `friday_to` time DEFAULT NULL,
  `friday_from` time DEFAULT NULL,
  `saturday_to` time DEFAULT NULL,
  `saturday_from` time DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_availabilities
-- ----------------------------

-- ----------------------------
-- Table structure for subcriptions
-- ----------------------------
DROP TABLE IF EXISTS `subcriptions`;
CREATE TABLE `subcriptions` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_name` varchar(256) NOT NULL,
  `commission` int(20) NOT NULL,
  `subscription_amount` int(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subscription_valid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subcriptions
-- ----------------------------
INSERT INTO `subcriptions` VALUES ('3', 'Basic', '0', '12', null, null, null, null);
INSERT INTO `subcriptions` VALUES ('4', 'Standard', '0', '24', null, null, null, null);
INSERT INTO `subcriptions` VALUES ('5', 'Platinum', '0', '36', null, null, null, null);

-- ----------------------------
-- Table structure for subscription
-- ----------------------------
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plan_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_amount` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `subs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subscription
-- ----------------------------
INSERT INTO `subscription` VALUES ('1', '0x34qpbk', 'Basic', '3', '12', '26', '2018-03-07 00:00:00', '3');
INSERT INTO `subscription` VALUES ('2', 'az14ha0n', 'Platinum', '5', '36', '26', '2018-03-09 00:00:00', '5');

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', 'Koala.jpg', 'D:\\xampp\\htdocs\\uplift\\storage\\uploads\\2018-02-19-090442-Koala.jpg', 'jpg', '', '1', 'ohrzqxqyqmszne200qcn', '0', null, '2018-02-19 23:04:42', '2018-02-19 23:04:42');
INSERT INTO `uploads` VALUES ('2', 'Penguins.jpg', 'D:\\xampp\\htdocs\\uplift\\storage\\uploads\\2018-02-21-194648-Penguins.jpg', 'jpg', '', '1', 'wdlhpyioineunruwb33v', '0', null, '2018-02-22 09:46:48', '2018-02-22 09:46:49');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `make` int(200) DEFAULT NULL,
  `model` int(200) DEFAULT NULL,
  `colour` int(11) DEFAULT NULL,
  `registration` varchar(255) DEFAULT NULL,
  `upload_doc` varchar(255) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `upload_mot_doc` varchar(255) DEFAULT NULL,
  `mot_expire_date` date DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_doc` varchar(255) DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_doc` varchar(255) DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `encrypt_user_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(256) DEFAULT NULL,
  `mot_issue_date` timestamp NULL DEFAULT NULL,
  `password_mobile` varchar(50) DEFAULT NULL,
  `registrationId` varchar(100) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Marc', 'Francis', 'marc.francis@uplift.vip', '76 Garth Close', 'Morden', '', 'Morden', 'London', 'Surrey', '', '', '44', '', 'Chewie.PNG', '5', '134', '237', 'KV64 HMF', '[]', '2022-03-07', '[]', '2022-03-07', '[]', '2018-05-07', '[]', '0000-00-00', '[]', '0000-00-00', 'Map_13.PNG', 'Chewie', '$2y$10$GBdsGPhdtZZzwo/ZzL5aueoCp6Huzy7JURAqln78lKcXIswqnRXNq', null, null, null, '123', 'Reject', '12312', null, '2018-03-02 10:54:04', '2018-03-02 03:54:04', 'Pp8yPpq5oL4ZiumsjJjvnTCfmZtvta0VD3U2u9SeBBJluXL3nxt75NTt0zIX', '2018-02-21 15:00:00', null, null, '1');
INSERT INTO `users` VALUES ('5', 'demo', 'demo', 'demo@demo.com', 'Demo_address_line_1', '', '', 'London', 'London', 'demo_uk', '123456', '000000000', '44', '000000000', 'Han_Solo.PNG', '5', '9', '6', '12345-33444555', '[]', '0000-00-00', '[]', '2018-02-21', '[]', '2022-09-09', '[]', '0000-00-00', '[]', '0000-00-00', '', 'demo_name', '$2y$10$HN78j6isz3fprVv.9GAl9.h/cpTGTM1vid2Z8vwkzDKlnRtqrO81K', null, null, null, 'dfads', 'Approved', '123123', null, '2018-02-28 23:37:29', '2018-02-28 23:37:29', null, '2018-02-22 14:00:00', '1234567890', null, '2');
INSERT INTO `users` VALUES ('7', 'hello_first', 'hello_last', 'hello@email.com', '123, hello', 'line2_hello', 'line3_hello', 'hello_town', 'hello_city', 'hello_uk', '012345', '123456789', '42', '789456123', 'Han_Solo.PNG', '7', '9', '31', '654321', '[]', '2018-02-01', '[]', '2018-02-24', '[]', '2019-02-01', '[]', '2018-02-01', '[]', '2018-02-01', 'Koala.jpg', 'hello_name', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'hello_country', 'Approved', '12312', null, '2018-03-01 00:33:44', '2018-03-01 00:33:44', null, '2018-02-21 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('9', 'ccc', 'bbb', 'aaa@gmail.com', 'asdfasdfsadf', '', '', '', '', '', '', '', '44', '123 4567 8912', 'car12.jpg', '6', '23', '150', 'aaaaaaaaaaaaa', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-06', '[]', '0000-00-00', '[]', '0000-00-00', '', 'admin', '$10$6Yv/HvWWAL0wkrIRflmwW.TL27RP9osNK1RhNjSXDq.Yg.9BB9d8m', null, null, null, 'asdfa', 'Approved', '2312', null, '2018-03-06 15:21:02', '2018-03-06 15:21:02', null, '2018-02-21 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('10', 'name', 'name', 'name@name.com', '123, demo test ', '', '', 'london', 'london', '', '123456', '', '44', '', '', '4', '29', '19', '123456', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'hello', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'adsfa', 'Approved', '12312321', null, '2018-02-28 14:55:35', '2018-02-28 14:55:35', null, '2018-02-21 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('11', 'ccc', 'vvv', 'ccc@gmail.com', 'asdf', '', '', '', '', 'country', '', '', '44', '', 'car4.jpg', '1', '13', '8', 'adfasdf', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-09', '[]', '0000-00-00', '[]', '0000-00-00', '', 'name_updated', 'c1f68ec06b490b3ecb4066b1b13a9ee9', null, null, null, 'asdfas', 'Approved', '123', null, '2018-02-28 14:55:36', '2018-02-28 14:55:36', null, '2018-02-22 14:00:00', null, null, '2');
INSERT INTO `users` VALUES ('12', 'sdf', 'aaaaaa', 'dd@gmail.com', 'sdf', '', '', '', '', '', '', '', '44', '', '', '4', '6', '7', 'asdfdsf', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-03', '[]', '0000-00-00', '[]', '0000-00-00', 'background1.jpg', 'ddd6876876', '980ac217c6b51e7dc41040bec1edfec8', null, null, null, 'asdf', 'Suspend', '1231', null, '2018-02-28 14:55:36', '2018-02-28 14:55:36', null, '2018-02-21 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('13', 'helll', 'helllo', 'helloo@hello.com', '123, demo test ', '', '', '', '', '', '123456', '', '44', '', '', '4', '6', '6', '123456', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'demo1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'asdf', 'Approved', '23123', null, '2018-02-28 14:55:36', '2018-02-28 14:55:36', null, '2018-02-22 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('14', 'Han', 'Solo', 'han@uplift.vip', '76', 'Garth Close', '', 'Morden', 'Surrey', 'Surrey', '', '', '44', '', 'Han_Solo.PNG', '4', '6', '6', 'KV64HMF', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2020-02-08', '[]', '2020-02-08', '[]', '2020-02-08', 'Uplift_Summary_Booking_Screen5.PNG', 'Han_123', '1cde4d8666b28f667ceb4c1945de8417', null, null, null, 'asdf', 'Approved', '1231', null, '2018-02-28 14:55:36', '2018-02-28 14:55:36', null, '2018-02-22 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('15', 'hello', 'hello', 'helloo@helloo.com', '123, hello ', '', '', 'london', 'london', '', '123456', '', '44', '', '', '4', '6', '6', '123456', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'helloo', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'asdf', 'Approved', '1231', null, '2018-02-28 14:55:37', '2018-02-28 14:55:37', null, '2018-02-22 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('16', 'Luke', 'Skywalker', 'luke@uplift.vip', '76', 'Garth Close', '', 'Morden', 'London', 'Surrey', '', '', '44', '', 'Luke.PNG', '4', '6', '6', 'KV64 HMF', '[]', '2020-02-10', '[]', '2018-02-23', '[]', '2019-02-10', '[]', '2019-02-10', '[]', '2019-02-10', 'Uplift_Calendar_Screen5.PNG', 'Luke12', '43d1d16186fc5752e1b04afa71ae450a', null, null, null, 'adf', 'Approved', '123', null, '2018-02-28 14:55:38', '2018-02-28 14:55:38', null, '2018-02-22 15:00:00', null, null, '2');
INSERT INTO `users` VALUES ('17', 'today ', 'today ', 'today@gmail.com', '123, demo test ', '', '', '', '', '', '123456', '', '44', '', '', '7', '31', '36', '222222222', '[]', '0000-00-00', '[]', '0000-00-00', '[]', '2222-02-22', '[]', '0000-00-00', '[]', '0000-00-00', '', 'today', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', 'Approved', null, null, '2018-03-04 02:05:25', '2018-03-03 19:05:25', null, '0000-00-00 00:00:00', null, null, null);
INSERT INTO `users` VALUES ('18', 'bbb', 'ccc', 'ccc@afasdf', 'cccc', '', '', '', '', '', 'cccc', '', '44', '123 4567 8901', 'ipmsgclip_r_1519986514_0.png', '2', '0', '0', 'asdfasdf', null, '0000-00-00', null, '0000-00-00', 'httpswww_ukrainedate_com.png', '2018-03-16', null, '0000-00-00', null, '0000-00-00', null, 'bbb', '875f26fdb1cecf20ceb4ca028263dec6', null, null, null, null, null, null, null, '2018-03-04 11:43:57', '2018-03-04 11:43:57', null, null, null, null, null);
INSERT INTO `users` VALUES ('19', 'ggg', 'ggg', 'ggg@gmail.com', 'gggggggggg', '', '', '', '', '', 'gggg', '', '44', '123 4567 8901', null, '5', '14', '249', 'ggggggggggggggggggggg', 'httpwww_next_uaen.png', '0000-00-00', null, '0000-00-00', 'ipmsgclip_r_1519961910_0.png', '2018-03-09', null, '0000-00-00', null, '0000-00-00', null, 'ggg', '9cafeef08db2dd477098a0293e71f90a', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('20', 'admin', 'local', 'admin@gmail.com', 'admin address test', '', '', '', '', '', 'werew', '', '44', '12345678901', 'chainimage-shield-with-check-mark-download-royalty-free-vector-clipart-eps_1520239301.jpg', '6', '11', '150', 'admin test registration', null, '0000-00-00', null, '0000-00-00', 'images_1520239301.jpg', '2018-03-09', null, '0000-00-00', null, '0000-00-00', 'back_1520239301.jpg', 'admin_admin', '$2y$10$1qXuXg.E0g0rGZZaMX5VtOudGzcRS7AV5vXLoh.A.8wri.cPyNab.', '1', '0', null, 'United Kingdom', 'Pending', null, null, null, null, null, null, '$2y$10$1qXuXg.E0g0rGZZaMX5VtOudGzcRS7AV5vXLoh.A.8w', null, '0');
INSERT INTO `users` VALUES ('21', 'admin', 'local', 'admin@gmail.com', 'admin address test', '', '', '', '', '', 'werew', '', '44', '12345678901', 'chainimage-shield-with-check-mark-download-royalty-free-vector-clipart-eps_1520239763.jpg', '6', '11', '150', 'admin test registration', null, '0000-00-00', null, '0000-00-00', 'images_1520239763.jpg', '2018-03-09', null, '0000-00-00', null, '0000-00-00', 'back_1520239763.jpg', 'admin_admin', '$2y$10$ipLQ8lhkIXIW3C45KqU7EumicQPATegGoEIXce2juYfHPIJlGBneS', '1', '0', null, 'United Kingdom', 'Pending', null, null, null, null, null, null, '$2y$10$ipLQ8lhkIXIW3C45KqU7EumicQPATegGoEIXce2juYf', null, '0');
INSERT INTO `users` VALUES ('23', 'vvv', 'vvv', 'vvv@gmail.com', 'vvvvvvvvvvvvvv', '', '', '', '', '', 'vvv', '', '44', '12345678912', null, '5', '0', '247', 'vvvvvvvvvvvvvvv', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520245014.jpg', '2018-03-08', null, '0000-00-00', null, '0000-00-00', 'images (2)_1520245014.jpg', 'vvv', '$2y$10$Gbw9TgCSAyl/wamO/DaleO050AyezaYxPS3PqUayLSBLwYq9KN1OC', '1', '0', null, 'United Kingdom', 'Pending', null, null, null, null, null, null, '$2y$10$Gbw9TgCSAyl/wamO/DaleO050AyezaYxPS3PqUayLSB', null, '0');
INSERT INTO `users` VALUES ('24', 'aaa', 'aaa', 'avc@gmail.com', 'adfasdfasdf', '', '', '', '', '', 'asdfsd', '', '44', '12345678901', null, '5', '134', '246', 'sdafasdfasdfasdf', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520271153.jpg', '2018-03-09', null, '0000-00-00', null, '0000-00-00', 'back_1520271153.jpg', 'abc', '$2y$10$MOBCraJC3xLdiUAMnZBEseKUfxXTSOiPfYSIV98nHCST1axc4.4bG', '1', '0', null, 'United Kingdom', 'Pending', null, null, null, null, null, null, '$2y$10$MOBCraJC3xLdiUAMnZBEseKUfxXTSOiPfYSIV98nHCS', null, '0');
INSERT INTO `users` VALUES ('25', 'aaaaa', 'aaaaa', 'aaaaa@gmail.com', 'aaaaa', '', '', '', '', '', 'aaaaa', '', '44', '12345678901', null, '4', '6', '1', 'aaaaa', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520276389.jpg', '2018-03-06', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520276389.jpg', 'aaaaa', '$2y$10$lHONLAWnwJllsbas0VfyRu81oDMSXf4phxlHUScCB2CfZfV7QxOJq', '1', '0', null, 'United Kingdom', 'Pending', null, null, null, null, null, null, '$2y$10$lHONLAWnwJllsbas0VfyRu81oDMSXf4phxlHUScCB2C', null, '0');
INSERT INTO `users` VALUES ('26', 'nnn', 'nnnvvv', 'nnn@gmail.com', 'nnn', '', '', '', '', '', 'nnn', '02434567892', '44', '12345678901', 'chainimage-shield-with-check-mark-download-royalty-free-vector-clipart-eps_1520279364.jpg', '6', '10', '146', 'nnn', 'back_1520319954.jpg', '0000-00-00', '', '0000-00-00', '555853422e9351b_1520276684.jpg', '2018-03-07', 'car1_1520289038.jpg', '2018-03-07', '', '2018-03-08', '', 'nnn', '$2y$10$6Yv/HvWWAL0wkrIRflmwW.TL27RP9osNK1RhNjSXDq.Yg.9BB9d8m', '1', '0', '26', 'United Kingdom', 'Approved', '617se', null, '2018-03-07 00:31:50', '2018-03-07 00:31:50', null, null, '$2y$10$6Yv/HvWWAL0wkrIRflmwW.TL27RP9osNK1RhNjSXDq.', null, '0');
INSERT INTO `users` VALUES ('28', 'www', 'www', 'www@gmail.com', 'www', '', '', '', '', '', 'www', '', '44', '12345678901', null, '5', '14', '237', 'www', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520357884.jpg', '2018-03-08', null, '0000-00-00', null, '0000-00-00', 'back_1520357884.jpg', 'www', 'd785c99d298a4e9e6e13fe99e602ef42', '1', '0', '28', 'United Kingdom', 'Pending', '78xhly', null, '2018-03-07 01:38:04', '2018-03-07 01:38:04', null, null, 'd785c99d298a4e9e6e13fe99e602ef42', null, '0');
INSERT INTO `users` VALUES ('29', 'www', 'www', 'www@gmail.com', 'www', '', '', '', '', '', 'www', '', '44', '12345678901', null, '5', '14', '237', 'www', null, '0000-00-00', null, '0000-00-00', '555853422e9351b_1520357907.jpg', '2018-03-08', null, '0000-00-00', null, '0000-00-00', 'back_1520357907.jpg', 'www', 'd785c99d298a4e9e6e13fe99e602ef42', '1', '0', '29', 'United Kingdom', 'Pending', '867jco', null, '2018-03-07 01:38:27', '2018-03-07 01:38:27', null, null, 'd785c99d298a4e9e6e13fe99e602ef42', null, '0');

-- ----------------------------
-- Table structure for users_old
-- ----------------------------
DROP TABLE IF EXISTS `users_old`;
CREATE TABLE `users_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypt_user_id` int(11) DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_old
-- ----------------------------
INSERT INTO `users_old` VALUES ('1', 'Marc Francis', '1', 'marc.francis@uplift.vip', '$2y$10$GBdsGPhdtZZzwo/ZzL5aueoCp6Huzy7JURAqln78lKcXIswqnRXNq', 'Employee', 'WXzEHpjGmkkVxUq8eaCzaS7xm6gxVqfjFHDWhff0WGPTk5qSR2CaF94BQkTx', null, '2018-01-30 22:30:57', '2018-02-20 20:42:12', null, null, null, null, null, null);
INSERT INTO `users_old` VALUES ('2', '', '0', '', '', 'Employee', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_amount
-- ----------------------------
DROP TABLE IF EXISTS `user_amount`;
CREATE TABLE `user_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `amount` float(10,0) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_amount
-- ----------------------------
INSERT INTO `user_amount` VALUES ('4', '12', '12', 'Basic', '1', '0');
INSERT INTO `user_amount` VALUES ('5', '15', '24', 'Standard', '2', '0');
INSERT INTO `user_amount` VALUES ('6', '16', '12', 'Basic', '1', '0');
INSERT INTO `user_amount` VALUES ('7', '18', '24', 'Standard', '2', '0');
INSERT INTO `user_amount` VALUES ('8', '19', '12', 'Basic', '1', '0');
INSERT INTO `user_amount` VALUES ('9', '25', '24', 'Standard', '2', '0');
INSERT INTO `user_amount` VALUES ('10', '26', '36', 'Platinum', '3', '0');
INSERT INTO `user_amount` VALUES ('11', '17', '24', 'Standard', '2', '0');
INSERT INTO `user_amount` VALUES ('12', '10', '24', 'Standard', '2', '0');
INSERT INTO `user_amount` VALUES ('13', '18', '12', 'Basic', '1', '0');

-- ----------------------------
-- Table structure for user_registrations
-- ----------------------------
DROP TABLE IF EXISTS `user_registrations`;
CREATE TABLE `user_registrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_mobile` int(10) unsigned NOT NULL,
  `user_role` int(10) unsigned NOT NULL DEFAULT '1',
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_registrations_email_unique` (`email`),
  KEY `user_registrations_user_role_foreign` (`user_role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_registrations
-- ----------------------------
INSERT INTO `user_registrations` VALUES ('1', 'adsfad', 'adfasdf', 'asdf@asdf1', '0', '2', '$2y$10$uCC4Flll1KXfIgbgKm26zer0u8moC/qvElXsaJID5QevGN0RQOupq', null, '2018-02-20 11:56:58', '2018-02-20 11:57:21', '2147483647');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_role` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', 'asdasd', null, '2018-02-20 11:19:39', '2018-02-20 11:19:44');
INSERT INTO `user_roles` VALUES ('2', 'aSD', null, '2018-02-20 11:53:48', '2018-02-20 11:53:48');
