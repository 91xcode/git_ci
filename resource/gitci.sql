/*
Navicat MySQL Data Transfer

Source Server         : 192.168.182.132
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : gitci

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-06-17 17:43:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `my_admin`
-- ----------------------------
DROP TABLE IF EXISTS `my_admin`;
CREATE TABLE `my_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '' COMMENT '真名，登录后显示真名，没有昵称',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '唯一标示，用来登录',
  `email` varchar(64) NOT NULL DEFAULT '',
  `salt` varchar(6) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1男 2女',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0禁用 1启用 ',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像url',
  `phone_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机是否验证 1是 0 否',
  `email_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'email是否验证1是0否 ',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='用户基本信息�';

-- ----------------------------
-- Records of my_admin
-- ----------------------------
INSERT INTO `my_admin` VALUES ('125', 'admin', '', '', 'BsftsS', '12658b2d2a0949d046c79ddedb78a1d8', '1', '1', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `my_article`
-- ----------------------------
DROP TABLE IF EXISTS `my_article`;
CREATE TABLE `my_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` int(11) NOT NULL COMMENT '所属栏目ID',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `subtitle` varchar(200) DEFAULT '',
  `pic` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `focus_pic` varchar(200) DEFAULT NULL COMMENT 'banner',
  `source` varchar(200) DEFAULT NULL COMMENT '来源',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `resume` varchar(500) DEFAULT NULL COMMENT '摘要',
  `pubdate` varchar(40) NOT NULL DEFAULT '' COMMENT '发表日期',
  `content` text COMMENT '文章内容',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `created_by` varchar(50) NOT NULL COMMENT '创建者',
  `created_date` datetime NOT NULL COMMENT '创建时间',
  `weburl` varchar(255) NOT NULL,
  `delete_session_id` int(11) DEFAULT NULL COMMENT '删除人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_article
-- ----------------------------

-- ----------------------------
-- Table structure for `my_categories`
-- ----------------------------
DROP TABLE IF EXISTS `my_categories`;
CREATE TABLE `my_categories` (
  `cid` smallint(5) NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) NOT NULL DEFAULT '0',
  `cname` varchar(30) NOT NULL,
  `clevel` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of my_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `my_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `my_sessions`;
CREATE TABLE `my_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_sessions
-- ----------------------------
INSERT INTO `my_sessions` VALUES ('9195c9ea9965f0ae9c7a1f473e7360c2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:31.0) Gecko/20100101 Firefox/31.0', '1434533941', 'a:12:{s:2:\"id\";s:3:\"125\";s:8:\"username\";s:5:\"admin\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:4:\"salt\";s:6:\"BsftsS\";s:8:\"password\";s:32:\"12658b2d2a0949d046c79ddedb78a1d8\";s:3:\"sex\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"avatar\";s:0:\"\";s:14:\"phone_verified\";s:1:\"0\";s:14:\"email_verified\";s:1:\"0\";s:13:\"register_time\";s:1:\"0\";}');
