/*
Navicat MySQL Data Transfer

Source Server         : 192.168.182.132
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : gitci

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-06-23 16:51:37
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='用户基本信息�';

-- ----------------------------
-- Records of my_admin
-- ----------------------------
INSERT INTO `my_admin` VALUES ('125', 'admin', '', '', 'BsftsS', '12658b2d2a0949d046c79ddedb78a1d8', '1', '1', '', '0', '0', '0');
INSERT INTO `my_admin` VALUES ('126', 'liubing', '', '', 'BsftsS', '12658b2d2a0949d046c79ddedb78a1d8', '1', '1', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `my_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_group`;
CREATE TABLE `my_admin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '等级 1是超管组，0是普通组 默认0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_admin_group
-- ----------------------------
INSERT INTO `my_admin_group` VALUES ('5', '超管组', '1', '1');
INSERT INTO `my_admin_group` VALUES ('6', '测试组', '1', '0');

-- ----------------------------
-- Table structure for `my_admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_permission`;
CREATE TABLE `my_admin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `controller` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0禁用 1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='全局权限';

-- ----------------------------
-- Records of my_admin_permission
-- ----------------------------
INSERT INTO `my_admin_permission` VALUES ('1', ' 分类列表', 'cate', 'index', '1');
INSERT INTO `my_admin_permission` VALUES ('2', ' 用户列表', 'user', 'index', '1');
INSERT INTO `my_admin_permission` VALUES ('3', ' 权限列表', 'auth', 'index', '1');
INSERT INTO `my_admin_permission` VALUES ('4', ' 图片列表', 'picture', 'index', '1');
INSERT INTO `my_admin_permission` VALUES ('5', ' 保存图片到七牛', 'upload', 'saveQiNiu', '1');

-- ----------------------------
-- Table structure for `my_admin_permission_relation`
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_permission_relation`;
CREATE TABLE `my_admin_permission_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `permission_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_admin_permission_relation
-- ----------------------------
INSERT INTO `my_admin_permission_relation` VALUES ('1', '125', '5', '1');
INSERT INTO `my_admin_permission_relation` VALUES ('2', '125', '5', '2');
INSERT INTO `my_admin_permission_relation` VALUES ('3', '125', '5', '3');
INSERT INTO `my_admin_permission_relation` VALUES ('4', '125', '5', '4');
INSERT INTO `my_admin_permission_relation` VALUES ('5', '125', '5', '5');
INSERT INTO `my_admin_permission_relation` VALUES ('6', '126', '6', '1');

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
-- Table structure for `my_category`
-- ----------------------------
DROP TABLE IF EXISTS `my_category`;
CREATE TABLE `my_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL,
  `path` varchar(200) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of my_category
-- ----------------------------
INSERT INTO `my_category` VALUES ('1', '新闻', '0', '0', '1');
INSERT INTO `my_category` VALUES ('2', '中国新闻1', '1', '0-1', '1');
INSERT INTO `my_category` VALUES ('3', '美国新闻', '1', '0-1', '1');
INSERT INTO `my_category` VALUES ('4', '北京新闻', '2', '0-1-2', '1');
INSERT INTO `my_category` VALUES ('5', '华盛顿新闻', '3', '0-1-3', '1');
INSERT INTO `my_category` VALUES ('6', '海淀新闻', '4', '0-1-2-4', '1');
INSERT INTO `my_category` VALUES ('7', '上地新闻', '6', '0-1-2-4-6', '1');
INSERT INTO `my_category` VALUES ('8', '七街新闻', '7', '0-1-2-4-6-7', '1');
INSERT INTO `my_category` VALUES ('9', '9号楼新闻', '8', '0-1-2-4-6-7-8', '1');
INSERT INTO `my_category` VALUES ('11', '体育', '0', '0', '1');
INSERT INTO `my_category` VALUES ('12', '出错', '11', '0-11', '1');
INSERT INTO `my_category` VALUES ('13', '11', '12', '0-11-12', '1');

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
INSERT INTO `my_sessions` VALUES ('9b07d3669b03ac9cc6e8223125ec2557', '192.168.182.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', '1435049327', 'a:13:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:3:\"125\";s:8:\"username\";s:5:\"admin\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:4:\"salt\";s:6:\"BsftsS\";s:8:\"password\";s:32:\"12658b2d2a0949d046c79ddedb78a1d8\";s:3:\"sex\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"avatar\";s:0:\"\";s:14:\"phone_verified\";s:1:\"0\";s:14:\"email_verified\";s:1:\"0\";s:13:\"register_time\";s:1:\"0\";}');
INSERT INTO `my_sessions` VALUES ('59a6c4f8719417de4e6b43972dabb6f1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:31.0) Gecko/20100101 Firefox/31.0', '1435048570', 'a:13:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:3:\"125\";s:8:\"username\";s:5:\"admin\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:4:\"salt\";s:6:\"BsftsS\";s:8:\"password\";s:32:\"12658b2d2a0949d046c79ddedb78a1d8\";s:3:\"sex\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:6:\"avatar\";s:0:\"\";s:14:\"phone_verified\";s:1:\"0\";s:14:\"email_verified\";s:1:\"0\";s:13:\"register_time\";s:1:\"0\";}');

-- ----------------------------
-- Table structure for `my_upload`
-- ----------------------------
DROP TABLE IF EXISTS `my_upload`;
CREATE TABLE `my_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `type` int(10) NOT NULL DEFAULT '1' COMMENT '类型',
  `description` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_upload
-- ----------------------------
INSERT INTO `my_upload` VALUES ('21', 'source_20150620175208_iaTlqnF', '1', 'vol.006 蒋勋细说红楼梦');
INSERT INTO `my_upload` VALUES ('22', 'source_20150620175447_iKakAJl', '1', 'vol.005 永远的未央歌');
INSERT INTO `my_upload` VALUES ('23', 'source_20150620175521_ic2h95R', '1', 'vol.006 蒋勋细说红楼梦');
INSERT INTO `my_upload` VALUES ('24', 'source_20150620181506_imCd9vx', '1', '');

-- ----------------------------
-- Table structure for `my_user`
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `phone_mask` char(11) NOT NULL DEFAULT '',
  `email` varchar(90) NOT NULL DEFAULT '',
  `salt` char(6) NOT NULL DEFAULT '',
  `password` char(40) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0禁用,1启用',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0',
  `register_ip` bigint(10) unsigned NOT NULL DEFAULT '0',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0直接注册\n            1管理员创建',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像URI',
  `phone_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机是否验证0未验证1已验证',
  `email_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮件是否验证0未验证1已验证',
  `teach_priv` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认0不能授课 1可授课，用来标识老师身份',
  `reg_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '注册类型\n            1手机\n            2邮箱',
  `openid` varchar(40) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_nickname` (`nickname`),
  KEY `idx_teach_priv` (`teach_priv`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES ('1', 'liuhua', '186****4806', 'liuhua@tizi.com', 'HlwX7l', 'eb4e59d19c4f8ab12234b1dccb9859529bd26259', '1', '1403512501', '2130706433', '1', 'user_avartar_120140630172400_iyFjGfv', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('2', '刘老师', '138****4800', 'lh1571@hotmail.com', 'sJIpYl', 'ddc9987826e89ed3c981ece7f54d0f63709a25ae', '1', '1403514132', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('3', 'test', '', 'liuhua2@tizi.com', 'vrHAY8', 'fbc534308dc9945086cb0ce837fa0ac4c95a6b67', '0', '1403593270', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('4', 'KevinYan', '18612596890', 'answeryanjia@163.com', 'z3mC6o', '840dd4060bd66ecfb63d2864800e0d0123a1446b', '1', '1403597489', '2130706433', '1', 'user_avatar_420140710113534_iLK3vGL', '1', '0', '1', '2', '');
INSERT INTO `my_user` VALUES ('5', 'truth', '', 'test@qq.com', 'WMvfPK', 'cfd2023a2913ce000359bbdb00ce250f4f08ae1f', '1', '1403599013', '2130706433', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('6', 'the truth', '', 'test1@qq.com', 'zMazbz', 'a2c4fab6c5e41c526f050f0f26ab12ffaa3ee9a9', '1', '1403599168', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('7', 'liuhua1222', '', 'liuhua1@tizi.com', 'LXObjY', 'd12862d7ff84a31371ecf24cb9572bf0ec2fd617', '1', '1403600581', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('8', '夜雨寒天', '134****4147', 'xuexi2004@163.com', 'VSJ9AQ', 'aaccc95c9154fb7ad304f515fc64830122a1c2a7', '0', '1403600897', '3232239874', '1', 'user_avartar_820140624171757_iVsEklO', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('9', 'bingbing', '152****4504', 'test10@qq.com', '7DBQzx', '6e5e569380ae7c9b68c34369a819c98a2bef5e72', '1', '1403603410', '2130706433', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('10', '那好刘华', '186****4806', 'liuhua@qq.com', 'cIq0mc', 'e0b546fcdb35661e29b4ce7803b3822d43ac0861', '1', '1403608202', '3232239874', '0', 'user_avatar_1020140707111225_iGXqGdy', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('11', 'ie提交测试', '152****4503', 'liubing@tizi.com', 'xVEoKc', 'd32db0b671c274026f305148fb9fb8d78519d2d9', '1', '1403608855', '3232240238', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('12', 'frank', '136****2004', 'zhangyu@tizi.com', 'yfKOIR', 'b306ea356fbc283423c3088d136e635fb8ef022f', '1', '1403674827', '3232239874', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('14', '小妮子', '', 'dengdai_hard@sina.cn', '7Ldfx5', '6a624460d29036df6f5defb85159ed266589314d', '1', '1403680497', '3232239476', '0', 'user_avatar_1420140705164309_iXQ8zeZ', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('15', '店小二', '138****4084', '495861140@qq.com', 'XL8Y73', '885f96341d8397b27b2c32493d8f3852535be791', '1', '1403680778', '3232239874', '0', 'user_avartar_1520140627133351_i6zQuE9', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('17', '掌柜的', '134****1313', '709205580@qq.com', 'iOn3Na', '8ecff6e5717ee57e0ebdab63ee273dff96bbe47d', '1', '1403681640', '3232239874', '0', 'user_avartar_1720140628164010_iKrOGFE', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('18', 'candy001', '186****6753', 'luoqian@123.com', 'yl2zTT', '50d6783233f4bbd80cfac11ca48a5b53c4cb13d9', '1', '1403681920', '3232240042', '0', 'user_avartar_1820140625181601_iV45fDj', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('19', '贾立平', '133****1111', '12323213@123.com', 'RoVE2j', '7a68d99d25ccc2cd005b0bcc76ce230d5191013c', '1', '1403684145', '3232239874', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('20', '1359202521@qq.com', '156****3547', '1359202521@qq.com', 'LXJcvQ', '9fa543561657cd2bf82db7fe74edc16f4ac39d66', '1', '1403686350', '3232239476', '0', 'user_avartar_2020140627101208_isM4rv1', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('22', 'jessica', '186****2356', 'luoqian85976@qq.com', 'PlSSWh', 'c9b7b15bae3856f1e99658748189b84da048bdb1', '1', '1403747156', '3232239473', '1', 'user_avartar_2220140626095659_i2peNGX', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('24', '风一般的女子', '136****3333', 'huangyanan@tizi.com', '2aN3Gt', '084b7e032eb6b87da5ca82be3ffbe3a37540be9f', '1', '1403752239', '3232239476', '0', 'user_avartar_2420140704162955_isVOXSU', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('25', 'liuhua0626@tizi.com', '13810394806', 'liuhua0626@tizi.com', 'ep6out', '4de71623b61f13c54565bb6cbd6dbefb45f1a072', '1', '1403753985', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('26', 'zhangsan', '186****6751', '2880132968@qq.com', '9bUs43', 'cb6f57c662ab467445d781c482e1aa2e7965b32d', '1', '1403754956', '3232239476', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('27', 'liuhua0625@tizi.com', '13810394806', 'liuhua0625@tizi.com', 'k72D4k', '23c948171014cdf671ea9f857ed269bce1675707', '1', '1403754967', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('28', 'dddddd', '', 'liubing1@tizi.com', '6S176x', 'ca1de3f66f93ae4fce5cb63f351ce1871b87f9c1', '1', '1403755143', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('29', '138****4806', '138****4806', '', 'qLDS0c', '7a51c71053bfffab3effc9fbeb51d62f13a66f00', '1', '1403755198', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('30', 'lisi', '136****4493', 'xiaohuang@qq.com', '5WNBvG', '970f1bbcb276acd3e0cd9a34f18d41fbcb3a8e7b', '1', '1403755362', '3232239476', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('31', 'jason', '', 'song816746@163.com', '1jOr8V', 'ed56d3101ecd8a85fd94ed6d0c27cd945c0e20c1', '1', '1403755463', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('32', '1213', '157****4565', '123@tizi.com', 'YkBuLY', 'd6fe61ede1bdf6a69124b96324a6d197b6778dbc', '1', '1403759779', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('33', 'candy002', '', 'test3@qq.com', '1ioS9G', '3ebf27f804c4829f875deb05956392bd738bf83f', '1', '1403763634', '2130706433', '1', '', '0', '0', '1', '2', '');
INSERT INTO `my_user` VALUES ('34', '葡萄表妹', '156****1056', '564722306@qq.com', '5IhKeM', '71f288da0671f65f0b5436edf6d230f688c12790', '1', '1403763708', '3232239473', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('35', 'liuhua0624@tizi.com', '', 'liuhua0624@tizi.com', 'K1dJSb', 'bcacff0c8f959d888cb6d9787aecb8ca229806cc', '1', '1403763827', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('36', 'lh0626@qq.com', '', 'lh0626@qq.com', 'NIGCYV', 'e9e144e50978f4d501ae170de117ac24216d5e7e', '1', '1403764312', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('37', '138****4801', '138****4801', '', 'LnPg7l', '71866cbab2943e3934e14e798db5c01c0903c2fa', '1', '1403765007', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('38', 'shangshikai', '157****1872', '1336440240@qq.com', '561zHY', 'bdb0c3add3ba9a87623ffef0c80cfde4d05e1d9c', '1', '1403765838', '3232240233', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('39', 'aaaaa', '134****2332', '12222@tizi.com', 'RqzdH1', '7dfb090481ba8e544002d82819c0fa983280b242', '1', '1403765977', '3232240233', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('40', '123456', '132****1232', '124442@tizi.com', 'gGyG6m', 'fda3f6bebe465dcddde69087e8c039916aa5a79d', '1', '1403766305', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('41', 'shang', '132****1236', '2121@tizi.com', 'xSKQeK', '9983d266c6dd8abd75ca58870a8c232394a6605b', '1', '1403766866', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('42', 'shikai', '157****1873', '122@tizi.com', 'fKNr8U', 'd6ca4cb9e0f0f21a4675fc9b275ae9f3a9d15fa3', '1', '1403767062', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('43', 'wwww', '157****1871', '233@tizi.com', 'dfAPk1', '34932bf10309efaa02f29190c2953a457ad91ab5', '1', '1403767404', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('44', '变型金刚4', '134****6765', 'elevn702@163.com', 'xi0t1j', 'ac48c1c56bb1d15c64217aa0e6e236fe2b28b9d3', '1', '1403768515', '3232239488', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('45', '米罗', '133****4322', 'hao123@qq.com', '9SxnUj', 'd3a7b9d789ae3c5f27aa14a89c77d7f812dae948', '1', '1403770213', '3232239488', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('46', 'songweijun', '136****2147', 'songweijun@tizi.com', 'Zw16ap', '325d90a694cd5cf030455f435efc91654405c836', '1', '1403774788', '2130706433', '0', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('47', '154****3333', '154****3333', '', 'B6pQhK', 'b802cb873729140eb6093c1aebb5ac0cb4bbb2ff', '1', '1403775319', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('48', 'svdsdv@sa.com', '', 'svdsdv@sa.com', 'Uw3bxq', '926f1038ab3cfba2256f11d105fd5fdc70414c2e', '1', '1403776805', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('49', '西瓜表姐', '', 'luoqian85976@sina.com', '5TKfze', '6419ff6b5cd9380a05ae6c315ac8a062133d6170', '1', '1403832546', '3232239473', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('50', 'lily', '', 'zhangli@123.com', 'B30kG1', 'd0ed912cfbe54a2c881400bf67cf4da6a80d5bdc', '1', '1403833521', '3232239473', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('51', 'ewff@fsa.com', '', 'ewff@fsa.com', 'Z106Nh', 'da9842da2ed1241d7b6db42bd49a5b47a6012f85', '1', '1403833894', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('52', 'yeyu', '', 'zhangyu0468@hotmail.com', 'QTKzV0', 'c974e4801dee64d42952a1a45b3a88828bf7aafd', '1', '1403835045', '3232239874', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('53', '后来', '186****4714', 'dengdai_hard@sina.com', '1eOpcI', '30654709e2bf6e8c5709c0866747754251556fa2', '1', '1403836562', '3232239476', '0', 'user_avartar_5320140627134503_ia20ooh', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('54', 'yaoming@123.com', '13400999900', 'yaoming@123.com', 'wxo4vK', '9c43cd4f10c5f54853f76c7fcbc2330587ea8c31', '1', '1403836949', '3232239473', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('56', 'haha', '', 'test100@qq.com', 'fMMDTk', '50c431d4510cecf7ec025ed4b3df9b2ccbc60f61', '1', '1403837471', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('57', 'zhangjie', '', 'zhangjie@123.com', '8ZhUsK', 'fe22361d0dbf5015ba82c05d54b076e5b7e10e21', '1', '1403837631', '3232239473', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('58', '12234', '', 'test1001@qq.com', '5vOebC', '01f5b96f1c83cc23b6e2340ce43525864e6e4130', '1', '1403838714', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('59', '元宝', '183****3881', 'yaobao@123.com', 'f5nejT', '64aa64816eedefc0b1ce64c7683bcbb98dd2b964', '1', '1403838889', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('60', 'test1022', '', 'test1022@qq.com', 'REfHJh', '7fbb83e5e15297e50b06850f43a2e74f60df6543', '1', '1403838938', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('61', 'lh0627@qq.com', '', 'lh0627@qq.com', 'zULpwA', 'f2ca07b99966e0ab51c0199b3d7a378c7aa0b775', '1', '1403839040', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('62', 'lh0626@tizi.com', '', 'lh0626@tizi.com', 'NxESqp', '6fb735942a4d26986b592617554480e7256fc6a3', '1', '1403839687', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('63', 'lh0625@tizi.com', '', 'lh0625@tizi.com', 'GjwCf5', '1358598e78619eb6d61cc5db085fd959890e179e', '1', '1403839864', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('64', 'lh0624@tizi.com', '', 'lh0624@tizi.com', 'pGwefu', 'ff95f2d7c5cb36a1e71423da36d748bce41a4051', '1', '1403839948', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('65', 'lh0623@tizi.com', '', 'lh0623@tizi.com', 'y26z0w', 'e928d1808a8765cb91c1825cdf1c29a3e04e7c7f', '1', '1403840082', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('66', 'lh0622@tizi.com', '', 'lh0622@tizi.com', 'MgQyBn', '0c47811f242dff8709a3bc99948e077f24963002', '1', '1403840187', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('67', '138****4810', '138****4810', '', 'B9GLGJ', '9375942d237e4ab6ac10b3745e379f03ed1cf505', '1', '1403840240', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('68', 'kaikai', '', 'shangshikai@tizi.com', 'J7Yhhl', 'fbac5eebc6387aa57b71848726dd9423799fc83c', '1', '1403840653', '3232240233', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('69', '我二万人', '15735351872', '1222@tizi.com', 'osImjq', '93dc375881cc61b16db0293af0cc8305078ce667', '1', '1403840896', '3232240233', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('70', 'sdsv@fwsa.com', '', 'sdsv@fwsa.com', 'MQd7E8', '383028205656e8ae22dc345d449ff287b3d92f89', '1', '1403841264', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('71', '张三', '136****2222', 'zhangsan@qq.com', '09EQxT', '0607103e0cd95d1cfab12d2ec339a9356439baf2', '1', '1403852586', '3232239476', '1', 'user_avartar_7120140627152242_iakLehU', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('72', '121332', '157****4333', '2221@tizi.com', '8aQpbT', '4b33d3d5a2a5e6b179a9462a2ad938c2cf79cdeb', '1', '1403852741', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('73', '姚老师', '133****2222', 'yaoxin@123.com', 'iCT02D', 'b2bfb0acf6d7e299941e89f5b07fe55f9fdcfc06', '1', '1403854798', '3232239473', '1', 'user_avartar_7320140628100917_iM5PLBk', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('74', '赵老师', '186****9465', 'zhaoxin@123.com', 'j6Zz4m', 'b1c492ef5ca8049b15e4799a476f869421b37d38', '1', '1403857725', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('75', 'gyf@nahao.com', '', 'gyf@nahao.com', '8kr7e8', 'f7edaf0ebbb6321d6265bbdee4d7ec44233e6c0f', '1', '1403858206', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('76', 'ccj2@tizi.com', '', 'ccj2@tizi.com', 'GxNeMb', '90c138304dbff06591dfe1693ca943a1e00424a7', '1', '1403859646', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('77', '李闯', '152****2180', 'lichuang@tizi.com', 'ImQMdR', '779fcb7a4aaf46aeb53abcb40ead4ead47429901', '1', '1403863896', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('78', '123467', '132****1231', '12232@tizi.com', 'GyttT5', '55b9fc00c828922e2f9a2f8a155b2d2294eacf09', '1', '1403868084', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('79', '1234567', '134****2311', '1111@tizi.com', 'rKvomH', '079229ed43c50a34431d734334329532877a678c', '1', '1403868424', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('80', '12345678', '132****1111', '1333240@qq.com', '32AprC', '383800066105700e9bedc762f76078c136cd6150', '1', '1403868748', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('81', '1234', '132****1222', '133642240@qq.com', 'FgeO5b', 'c91885b59670f2c0c8970c5023673998ccbd3ad8', '1', '1403869928', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('82', '袁老师', '', 'yuanyuan@123.com', 'wfVLz0', '998c017890b40c26b2645be7f6019538798f76b2', '1', '1403918563', '3232239473', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('83', 'ccj1@tizi.com', '', 'ccj1@tizi.com', '1Ph0Hv', '8d2f3e6536d1d843d4501577d5d2c10a0cd95c73', '1', '1403918773', '3232240260', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('84', '1024', '', 'test1024@qq.com', 'aoSoPN', '9e981332a9d8b05afa334823bb29418ce912ea64', '1', '1403919551', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('85', '1025', '', 'test1025@qq.com', 'W4fnSm', '9eb6e68a6ca3630f654ef4e40316d822546f7730', '1', '1403920247', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('86', '孙老师', '136****4914', 'sundong@123.com', '7EYygS', '14fb041b24e689e5469ee312e5e0c747873a2ee8', '1', '1403926056', '3232239473', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('87', '卡妙', '132****1111', 'test2@qq.com', 'JkvvBz', '4ef8d83d53a7a552a8206571cea7cd3bace74857', '1', '1403937571', '3232239488', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('88', '修罗', '134****1111', 'test13@qq.com', 'QkdiLQ', '5bbfa8cb1c5f9222ef304f868d804926bc7de733', '1', '1403937918', '3232239488', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('89', 'lh0628@tizi.com', '', 'lh0628@tizi.com', '6s2OlU', '598b02593b8b9b306ee769d55c9bae88309c7bce', '1', '1403946340', '3232240026', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('90', '王佳', '', 'wangjia@123.com', '9QvN2v', '196e961214dcb6acb7c958826563970b3d016972', '1', '1404107388', '3232239473', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('91', '12345622', '134****2331', '1226662@tizi.com', 'BLYIjl', '1172723e9181d9a22616d8243f85b56eb96be47c', '1', '1404107715', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('92', '元彪', '136****4915', 'yuanbiao@123.com', '9x6PS2', '1425e4b5135e378f9d00a8e90b76a372c0eab772', '1', '1404108258', '3232239473', '0', 'user_avartar_9220140701200447_iktyUqQ', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('93', 'lh0630@qq.com', '13810394812', 'lh0630@qq.com', 'ltg73k', '8d6ce65041e98d7b6b09fc241c2b739f562824dc', '1', '1404112211', '3232240026', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('94', 'nahaonahao', '13811504084', 'nahaotest@qq.com', 'SdKixw', '837494690f11845243c545e88f98cb065d650f88', '1', '1404112612', '3232239488', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('95', 'yanhenjia', '152****4502', 'yanhenjia@tizi.com', 'NawUtC', 'd51ddc4dfd3e683d766c98c4a7f9eb410b5c1d53', '1', '1404113644', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('96', '4444', '', '333@tizi.com', 'WBQvNK', '2a6c6e7b29438d8aaecc6d7deb3876e3a7b5e0a1', '1', '1404113788', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('97', '泓七', '131****0987', 'sss@1oi.com', '77e4yX', '96b7af4d4bbea6ee2c138772fb94012c5320ba7b', '1', '1404114634', '3232239874', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('98', 'wangli1', '152****4501', 'wangli1@123.com', '1vRSsi', 'd6e48c6532bc449480dbf63a0c84ec60d034b2da', '1', '1404115802', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('99', 'ddddd', '152****4503', '444@qq.com', '3h75JE', '16006703a0c0a57b2cf44daf3398415ab1348d43', '1', '1404116184', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('100', 'eeee', '152****4504', 'kk@qq.com', '9XWdr0', '8eee11f867703f41dd37f033528389838444f4f5', '1', '1404118067', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('101', '1234423432', '132****1239', '1336430240@qq.com', 'WrVdYJ', '76a02f2b381bb12a4a2b07ae5a9d98e942152138', '1', '1404118651', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('102', 'wanglili', '', 'wanglili@123.com', 'LWk7wr', 'c96ace8d504807bde9d8ca411686eb52ce76e8ea', '1', '1404118714', '3232239473', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('103', 'mmdads', '152****4509', 'mm@qq.com', 'rjDDqq', '86d4c970757d30e1fd0d2a2e474eacf241b0d3e4', '1', '1404121445', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('104', 'dasdas', '152****1111', 'as@qq.com', 'qosall', '21c5b9185e423cde3d764bf6b0254f73126bd45e', '1', '1404122223', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('105', 'ccj3@tizi.com', '', 'ccj3@tizi.com', 'r2TIqu', '032e5a466c61b9829bcbb703f6f571dc402af93a', '1', '1404122753', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('106', '巴老师', '134****2222', 'test15@qq.com', '1F6lkP', '1c80ee7cd4dfa63b640aeedc4c132e733df6749d', '1', '1404177096', '3232239488', '1', 'user_avartar_10620140701141610_iMSeU2S', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('107', '谢谢', '152****4504', 'xiexie@123.com', 'Knw2CE', '57c095168d088fcaab7890ecc7f1060878014831', '1', '1404180353', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('108', '丫丫', '134****7878', 'test16@qq.com', '54KEPB', '599bd6b5456821bdb26d5de3901a365880db2bfb', '1', '1404197136', '3232239488', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('109', '再见', '136****4915', 'zaijian@123.com', 'vhkvIJ', 'eed71a2d2de85789713af89cb9be49ad81c3c128', '1', '1404207181', '3232239473', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('110', '夜雨', '13344445555', '123123@123.com', 'jmvMtI', '63d2380e11fcc483924de6de54baed14c67b46be', '1', '1404207581', '3232239874', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('111', '马道长', '18612596890', 'test1026@qq.com', '3gTEYB', '1c5a39516c28cd990e4ed6eef0870dee64ae442f', '1', '1404215097', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('112', '詹姆斯.罗德里格斯', '135****6666', 'test17@qq.com', 'DdcEhM', 'ecd6f6b802070f6881c12646bd7cba76e04b3d05', '1', '1404283057', '3232239488', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('113', 'xuexi2004@163.com', '', 'xuexi2004@163.com', 'oqh1Zx', '0712b65aa202153d42dec6b98b3f3d0d00d510e9', '1', '1404288077', '3232239874', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('114', 'zhangjie1', '13533332222', 'zhangjie1@123.com', 'cZgwXH', 'f6284ae5682614cd8da21bb7e4701d92f0b950a0', '1', '1404305495', '3232240252', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('115', '凯凯', '134****1234', '133@tizi.com', 'eU4cDd', 'b24a0924896320c68dd0b1de23a0e105e271ab9b', '1', '1404307749', '3232240233', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('116', '凯凯', '134****1235', '323@tizi.com', 'U1egOU', 'd18f602a6d1e1db9df835568405ce5e3b2f7a35c', '0', '1404310697', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('117', 'zhangxin@123.com', '', 'zhangxin@123.com', 'VHLtTc', '3cc45183f86c47b5af9055e35142b41bdb0669fe', '1', '1404358835', '3232240252', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('118', 'test18', '136****8767', 'test18@qq.com', 'UWFbbB', 'a329886ba91b8c42e886a95ba76d5ad035460ee2', '1', '1404368513', '3232239488', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('119', '夜雨寒天', '133****2222', 'zozem@163.com', 'pSYxec', '9c7d40e6a236e9990addb5e94746bf51e178cb89', '1', '1404371732', '3232240312', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('120', 'mmmmm', '152****4507', 'mmm@qq.com', '5Z7pdU', '5b0474beec52ca8235b265cd3547849281b3dc16', '1', '1404379898', '3232240238', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('121', '小二', '18612206753', '1638887396@qq.com', 'ggJnL8', '38e8cb5f9643886304510b794533ae5fc4022949', '1', '1404437205', '3232239476', '1', 'user_avartar_12120140704093928_iCQUpjq', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('122', '156****3547', '', 'xiaohuang1@qq.com', '2LVzNM', '89955504467ee2ac92c771d189567459ec168970', '1', '1404457321', '3232239476', '0', 'user_avartar_12220140704174330_iF9xqnm', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('123', 'zhenshi', '133****2224', 'zhenshi@163.com', 'bKJ1Qd', '097cb61f3ac4843a4ed0520b7124025f2773abbb', '1', '1404459562', '3232239874', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('124', 'wqeqw', '139****1708', '132@tizi.com', 'JaeMZd', '9539eab0b67ee8950322d9602f390942a8e5685d', '1', '1404460379', '3232240233', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('125', 'nn@qq.com', '152****2222', 'nn@qq.com', '3e0Qh8', '0e448d65200cd32dcbf091e9b85d76cbcc22cbad', '1', '1404524976', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('126', 'liuhua2@tizi.com', '138****1001', 'liuhua2@tizi.com', 'qLwYO5', '4f25d13deae26523e4ee902d66df695c4faa25a4', '1', '1404528768', '3232240273', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('127', 'liuhua3@tizi.com', '138****1002', 'liuhua3@tizi.com', 'EBDpq3', '5e3ec9e7802bc790ca20e11497f8c95b973e58aa', '1', '1404529125', '3232240273', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('128', 'liuhua4@tizi.com', '138****1003', 'liuhua4@tizi.com', '38jUcl', '7db8bf023b6a15639475df7ffd04ef994f142ecd', '1', '1404529274', '3232240273', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('129', 'liuhua5@tizi.com', '', 'liuhua5@tizi.com', 'H7ZLbQ', '8a513dd8b24b0367ac6451d8d67bb8dcab5bdd0f', '1', '1404530594', '3232240273', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('130', 'ccj4@tizi.com', '152****4444', 'ccj4@tizi.com', 'xc0MyR', 'e2f91a094b024b4ea36f2887865be260142723f9', '1', '1404531185', '2130706433', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('131', 'ccj5@tizi.com', '152****2222', 'ccj5@tizi.com', 'VcuSeZ', 'e6c201a1d843a5c637c67f2346287dbf9265bf46', '1', '1404531956', '2130706433', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('132', '7788@qq.com', '152****5555', '7788@qq.com', 'H1Pudw', '9569586cf7425d925e97156868a15419c81cd74f', '1', '1404541888', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('133', 'luoqian@tizi.com', '', 'luoqian@tizi.com', '9HTBJ9', '5f3991a97b04ee007e1384f470bd71349e50f40b', '1', '1404546786', '3232239473', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('134', '小黄', '136****4808', 'xiaohuang2@qq.com', 'GzpVxJ', '443025a346445e35a9c531a261fa7e5fbd79983e', '1', '1404550664', '3232239476', '0', 'user_avatar_13420140705170050_iJUWSmr', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('135', 'jj@qq.com', '152****4598', 'jj@qq.com', 'rU5snB', '9b25e716c4c7cd359f379561c707c36f360164f6', '1', '1404550809', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('136', '123123213', '134****1232', '123@av.com', 'eilC3H', 'ffdeb1cc77f0a2549517f25b9c4ba359c2eb56e3', '1', '1404552099', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('137', '123qwe4', '134****1231', '123@axv.com', 'y4ebil', '251bc113d0a338389d7d7279f42411d1862bc6fb', '1', '1404552417', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('138', '223456', '134****1222', '131@tizi.com', 'lGZeTm', 'e75957b88e7113ba47d1e6864e5bc22e1e912008', '1', '1404552704', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('139', '1232142', '134****1244', '122@ab.com', 'S5KPQY', 'ab5c8236c97d303b6b31000f7b3b2b94419c3480', '1', '1404552982', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('140', '1234567555', '134****1211', '133@i.com', 'ZaCgH3', 'd88676a1aa3615da31b4fdf31f5a8040006c87b8', '1', '1404553082', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('141', 'qwer', '134****1111', '133@ti.com', 'Q3JzRE', 'a28de59afc31c1a04e062e6f946eb5c7ea3e4efe', '1', '1404553165', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('142', 'qweqewq', '134****1322', '133@t4.com', 'abZLxC', '83a06011788dae29abeb70113fcc1978acf3ea42', '1', '1404553574', '2130706433', '1', 'teacher_20140705174054_title_auth_itJgs2X.png', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('143', 'asdssdfg', '134****1333', '1333@ti.com', 'q6tnU5', '222a6c4bbe68cc029534995a3ec9e1d6ff3ec8cf', '1', '1404553977', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('144', 'weweqw', '134****2222', '13666@tizi.com', 'DFjEhv', '41c0d80d1b3139431bff8a98ff386a96da5f9235', '1', '1404554116', '2130706433', '1', 'user_avatar_14420140705175522_irZbmWt', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('145', 'dd@qq.com', '152****4555', 'dd@qq.com', '2EXzwU', '8d4d22e3666c1ca0a96bd2c6dda23f435c64e8c6', '1', '1404555392', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('146', 'xx@qq.com', '152****8888', 'xx@qq.com', 'gIUyhv', '267c2571e7406d4f05394e917a7c032e6bfb73bc', '1', '1404555952', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('147', 'kaika', '157****1875', '1336@qq.com', 'bXQjNm', 'a0de2605d851525a51f7aebd7e5289cf1b601380', '0', '1404556190', '2130706433', '1', 'user_avatar_14720140708172218_iVnqJmF', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('148', 'qwqew', '157****1879', '136@qq.com', 'MmvP6E', '50dfbabd619dc8983b92eeed9eccd97b207fb835', '0', '1404783862', '2130706433', '1', 'user_avatar_14820140708164609_iHurdCm', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('149', 'qqqqq', '133****1122', '1346@qq.com', 'DTdh5g', '03f97fa17f399c6d7a46242eb881dc45e59c7600', '0', '1404891574', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('150', '324324', '157****1870', '1326@qq.com', '8ZQc5R', '40ab238d9f0c027a33651d3aef249a8e405c351b', '0', '1404891618', '2130706433', '1', 'teacher_20140709153942_title_auth_i6NIyhr.png', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('151', 'ff@qq.com', '152****4506', 'ff@qq.com', 'TUggFN', '55749627b89fa26ddb1eb169828a0da7726317ca', '1', '1404895110', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('152', 'kaikai2', '', 'shangshi@tizi.com', 'GYlxOA', '1af09aad637c104fa825504d20c41cfa278f40d5', '0', '1404897280', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('153', '234535', '134****2345', '132@q.com', '5rEtuv', 'da5b62bcb6931685c76843d543f737007d035d6e', '0', '1404965137', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('154', '123r4t5', '134****2343', '133332@q.com', 'GtDUOB', '3b2d6cf749cbb3974d91abf59a84d5fd1e3c2199', '1', '1404973569', '3232240233', '1', 'teacher_20140710142525_title_auth_iL0Lhg6.png', '1', '1', '0', '1', '');
INSERT INTO `my_user` VALUES ('155', '13333333@qq.com', '134****2349', '13333333@qq.com', 'A4hi4R', '8d919b43f7c5dd4e59fcf5ba795bc2c987c40509', '1', '1404974431', '2130706433', '0', '', '1', '1', '0', '1', '');
INSERT INTO `my_user` VALUES ('156', '12323232', '134****2340', '1333333@qq.com', 'Wuy8g7', '6723e9dc7b1a0be053efd9845a34d52a841a862c', '0', '1404975054', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('157', '13333@qq.com', '', '13333@qq.com', 'mViz7T', '4f89512998075f70905924197263af08cee5028b', '0', '1404975161', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('158', '1333233@qq.com', '', '1333233@qq.com', 'v1fMdb', '262348facda1103e6710788a7961a318e32f4f96', '0', '1404975828', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('159', 'wfdsfds', '', '13444333@qq.com', 'szxcpJ', 'caac92f964005697935d2d0c5ea46f40f2905e5a', '0', '1404976310', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('160', '132333@qq.com', '', '132333@qq.com', 'GrGNEK', '99e842fae8fcceab778169c6b890fd5f1dd8ee1e', '0', '1404976993', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('161', 'shuaiqi', '186****4476', '331209881@163.com', 'sLNtCe', '31e2a77774e1f733b69e2fc9ecf083553e000e1e', '1', '1404977357', '3232243969', '0', 'user_avatar_16120140710160857_iJNRO9P', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('162', 'rewrwer', '', '1333v3@qq.com', 'vLQnPi', 'a9a1964a17cb8e128329e89a2aeee5e316780d4d', '0', '1404978142', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('163', '133433@qq.com', '', '133433@qq.com', '3NM2k8', '2fd52ab4d61c55ee6127bf06092b637300bdaa8d', '0', '1404978569', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('164', '1355333@qq.com', '', '1355333@qq.com', 'ngOiqE', '5091e1f249f2b8eed57ab723d56b9fed2bab32da', '1', '1404978907', '2130706433', '0', '', '1', '1', '0', '2', '');
INSERT INTO `my_user` VALUES ('165', '132444333@qq.com', '', '132444333@qq.com', '5Yn6E9', 'f882e737216afed433ce033ee76731a7c763cd07', '1', '1404981039', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('166', '133r33@qq.com', '', '133r33@qq.com', 'q5JHB4', '1e751ee75a1495efbc05d6729942ba9611543942', '1', '1404982543', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('167', '13fff333@qq.com', '', '13fff333@qq.com', '7ZBOgz', '3bf1b0870e824ec63361f77c0bfa5aff384d7878', '1', '1404982867', '2130706433', '0', '', '1', '1', '0', '2', '');
INSERT INTO `my_user` VALUES ('168', 'liu@tizi.com', '', 'liu@tizi.com', 'XJhUyH', '84dbf51ad8d41bcb9ec5114f4a8c2f0bfee402c4', '1', '1404986930', '3232240238', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('169', '234e', '', '1337733@qq.com', 'TaWEgo', '0626b5a573e9767fb92e37c8cc63acccfeae88b7', '1', '1404987782', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('170', '1335533@qq.com', '', '1335533@qq.com', 'Qxa37E', '18904a5470a134558ef2934bf0ff9a5083b923ef', '1', '1404988049', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('171', 'qwerdd', '134****1212', '1212@tii.com', 'eElO1W', 'ad192c55a46a12011744791159cac5111a37a444', '1', '1404990277', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('172', '1333r3@qq.com', '', '1333r3@qq.com', 'dM5DHm', '12f35086cc7a421d8dce42873c12b9486d8e5109', '0', '1404991821', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('173', '133fff33@qq.com', '', '133fff33@qq.com', 'SLu2od', '1b2063e17824dd9b2262f67d8882dff930eb1b80', '1', '1405042228', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('174', 'wqwqq', '134****1266', '23@e.com', 'jFGadO', '93b8c9aa7bedb25b135ea65a74209bdd4d134f88', '1', '1405042816', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('175', '1333r3@qq.com', '134****1267', '133fff3@qq.com', 'Z44oTs', 'b3231140e83ef76794bb67d7920623accd83bbc9', '1', '1405046076', '2130706433', '1', 'user_avatar_17520140711153951_iBQ4TYL', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('176', '138****1000', '138****1000', '', 'L910RY', 'e8c02e5aba8bb84ed516ad3cf5b0f4bad25c77b0', '1', '1405050219', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('177', '138****1000', '138****1000', '', 'Cl8qq2', '3be1bbc96ea907c96be15c90b6babd819c449243', '0', '1405072700', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('178', '138****1000', '138****1000', '', 'AB86E2', 'b57630851ebb3516e539d60044d112ec8daae64f', '0', '1405072753', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('179', '138****1001', '138****1001', '', 'T168RC', '10ad91251558de7a138ad1b8f5b18741c295e0ee', '0', '1405073162', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('180', '138****1004', '138****1004', '', '0jqIXc', 'd517a6ac28a7b3ea5dc0a369556f19e32ec44161', '1', '1405075994', '2130706433', '1', '', '1', '0', '0', '1', '');
INSERT INTO `my_user` VALUES ('181', 'ccj7@tizi.com', '', 'ccj7@tizi.com', 'v4amo6', '924819fde5cc48ff74011212cc89781c0f7888bc', '1', '1405077276', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('182', 'ccj8@tizi.com', '', 'ccj8@tizi.com', 'fUHGZw', '31269ac48fac28e4f54aa3e18d1240572ee7af1e', '1', '1405077396', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('183', 'ccj9@tizi.com', '', 'ccj9@tizi.com', '1twe5s', '38c13fb171f8a28f93f276ecc8a7f4cdaadce7b8', '1', '1405077473', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('184', 'ccj11@tizi.com', '', 'ccj11@tizi.com', 'OYEEfi', '23cb1d3ebc5479000519c2eb907d7d32a7715af2', '1', '1405077511', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('185', 'ccj99@tizi.com', '', 'ccj99@tizi.com', 'EwdaoS', 'be0fd8499e7903088cfa0ccaf322275f7a4c6115', '1', '1405156767', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('186', '123321', '136****5454', '134@qq.com', 'z2yonp', 'c7ede3b247a1ad2eabeb8a9b0ac2a42fdc623925', '1', '1405167904', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('187', 'jjyy@qq.com', '152****4500', 'jjyy@qq.com', 'OxXuOU', 'e3492c463ae18e46abac70dd9185391a5bc9a9c7', '1', '1405566213', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('188', 'jjyy1@qq.com', '', 'jjyy1@qq.com', 'Cfw3S6', '866ee452efae4f6a9e782e1e09fd709337f19fc9', '1', '1405566248', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('189', 'asdf@qq.com', '', 'asdf@qq.com', 'EPsNZE', '8638c86042ab983e8c7cc99250ab7ffd7989a89e', '1', '1405566290', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('190', 'abcd@qq.com', '', 'abcd@qq.com', 'JlNTuy', '6a7fadce963a44a5fe3833e5a260255e783ece1c', '1', '1405566422', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('191', 'kaikaikaikai', '134****2340', '130979879878@qq.com', 'j1pBvw', 'b6625adb4665056cc75a9a2bed04c92a6d9f1498', '1', '1405567234', '2130706433', '1', '', '1', '1', '1', '1', '');
INSERT INTO `my_user` VALUES ('192', 'liubing10@qq.com', '152****3333', 'liubing10@qq.com', '3kyM7m', '3da6a05c26eb6ec00a242c93af78ad227479d538', '1', '1405996216', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('193', 'liubing11@qq.com', '152****2222', 'liubing11@qq.com', 'lm1Bd2', '1dca51cf500b85afb78d6c21e35ca42b025242d8', '1', '1405996495', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('194', 'lh0722@qq.com', '138****1111', 'lh0722@qq.com', '6kr4WO', '57005d99cad6add445caa34a64cdcfddebea74de', '1', '1406000281', '2130706433', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('195', 'ak@qq.com', '152****4444', 'ak@qq.com', 'SXYspf', '61916382a9f85318f59c6e487bd67748dee5d7c3', '1', '1406708441', '0', '1', '', '1', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('196', 'll@qq.com', '', 'll@qq.com', 'tgz4zb', 'd838d39b94d253fb9a72128f9f8f24a02db3d149', '1', '1406716773', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('197', '八戒', '', 'shanghongliang@tizi.com', 'YlTILf', 'e4f8b53c13b3e649dad6170ad1910456ec41e34f', '1', '1406886178', '2130706433', '1', '', '0', '0', '1', '2', '');
INSERT INTO `my_user` VALUES ('198', 'xx11@qq.com', '', 'xx11@qq.com', 'ngNiFx', 'b9b1ede11edcbbf6f22faf87c5b57c1b62810cf4', '1', '1407207616', '0', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('199', 'shang5@tizi.com', '', 'shang5@tizi.com', 'nDkAMk', 'e1c1816a657e0fc6294cd8da93ca81764936890d', '1', '1407226112', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('200', 'shang6@tizi.com', '', 'shang6@tizi.com', 'CwZwZ6', 'dc86cb43ec52a48c49ac2c586c38e3f1b6f4199a', '1', '1407226237', '2130706433', '0', '', '1', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('201', '331209881@qq.com', '', '331209881@qq.com', 'RoHDyI', '34d0ef2b3f47039f40eb66c543408b153f5f9385', '1', '1407226975', '3232243969', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('202', 'shang7@tizi.com', '', 'shang7@tizi.com', 'HCAjaa', '040f5fbdf8c3c1592d41d1a9f0a03ec757ca6579', '1', '1407227034', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('203', 'shang8@tizi.com', '', 'shang8@tizi.com', 'eF5mU5', 'b07517d0ad4427b22316e93e1d76de77bd208e3b', '1', '1407227209', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('204', 'shang89@tizi.com', '', 'shang89@tizi.com', '7MS2w7', '4bd3ef28b532e14f54eff92d3d1d7a801ff4f94a', '1', '1407227735', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('205', 'yanrui@nahao.com', '', 'yanrui@nahao.com', '4qFQHr', 'ad2ce113c618488e9d2902148d1b41eed3b550d5', '1', '1407228156', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('206', 'shang445@tizi.com', '', 'shang445@tizi.com', 'hL8Ssu', '4365c8c0581b37d050d4c28f1a4a57a8bd9afb9b', '1', '1407228268', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('207', 'shang18@tizi.com', '', 'shang18@tizi.com', '7kTbZr', 'badac36a4081ec6438775fdb5a0438267b9d50b5', '1', '1407289565', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('208', 'shang58@tizi.com', '', 'shang58@tizi.com', 'KIif0I', '5cf2e71cf11b1971971e5e4616bc850c98b7f02a', '1', '1407291536', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('209', 'shang28@tizi.com', '', 'shang28@tizi.com', 'pNaPg1', '18c1b45def24dfc3a12f770b4de249dbcad0dee6', '1', '1407292066', '2130706433', '0', '', '0', '1', '1', '2', '');
INSERT INTO `my_user` VALUES ('210', 'shang256@tizi.com', '', 'shang256@tizi.com', 'oxNN2O', '7a5f2f9051072c15feaa028a214cc67ee5156feb', '1', '1407297567', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('211', 'shang88@tizi.com', '', 'shang88@tizi.com', 'JyNgwW', 'af0fee86a7e62b27c7ce8e8701bd04f37cd3b451', '1', '1407298222', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('212', 'shang108@tizi.com', '', 'shang108@tizi.com', 'QP43fd', '199199d638489db3cf2d65a4f348ad54a7c67953', '1', '1407307085', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('213', 'philo', '', 'linjie_chang@163.com', 'OyEXgg', '881247946db6ea9cb2343d44ba04fa6113700798', '1', '1407380377', '2130706433', '1', '', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('214', 'liuhua11@163.com', '13312341234', 'liuhua11@163.com', 'VOn7Y8', 'b116ca10cd0f6ef5de5377eb5e693722da126de9', '1', '1407381650', '2130706433', '1', 'user_avatar_21420140807112239_iDGXiYM', '0', '0', '0', '2', '');
INSERT INTO `my_user` VALUES ('216', 'chang', '', '', '', '', '1', '1407727736', '2130706433', '0', '', '0', '0', '0', '3', 'b7042fda56cd1979144416c1406bbf05');
