/*
 Navicat Premium Data Transfer

 Source Server         : Mac本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost
 Source Database       : gitci

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : utf-8

 Date: 06/18/2015 22:41:38 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `my_category`
-- ----------------------------
DROP TABLE IF EXISTS `my_category`;
CREATE TABLE `my_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL,
  `path` varchar(200) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
--  Records of `my_category`
-- ----------------------------
BEGIN;
INSERT INTO `my_category` VALUES ('1', '新闻', '0', '0', '1'), ('2', '中国新闻1', '1', '0-1', '1'), ('3', '美国新闻', '1', '0-1', '1'), ('4', '北京新闻', '2', '0-1-2', '1'), ('5', '华盛顿新闻', '3', '0-1-3', '1'), ('6', '海淀新闻', '4', '0-1-2-4', '1'), ('7', '上地新闻', '6', '0-1-2-4-6', '1'), ('8', '七街新闻', '7', '0-1-2-4-6-7', '1'), ('9', '9号楼新闻', '8', '0-1-2-4-6-7-8', '1'), ('11', '体育', '0', '0', '1'), ('12', '出错', '11', '0-11', '1'), ('13', '11', '12', '0-11-12', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
