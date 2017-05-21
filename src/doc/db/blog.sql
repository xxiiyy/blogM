/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2017-05-21 19:25:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_article_tag`;
CREATE TABLE `sys_article_tag` (
  `id` varchar(32) NOT NULL COMMENT '标签文章id',
  `tagId` varchar(32) NOT NULL COMMENT '标签id',
  `articleId` varchar(32) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`tagId`,`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_article_tag
-- ----------------------------
INSERT INTO `sys_article_tag` VALUES ('a27526dd56bd40e69f5844d85d368f69', '0db132f50809469abd7d49d08e1d9bdf', '629c015a01e94b4b91ab9ff1b9934c2e');
INSERT INTO `sys_article_tag` VALUES ('01c93ffe62dd41efb2a900cc73889543', '0db132f50809469abd7d49d08e1d9bdf', 'f03382a832294e05a9175b4b71bba278');
INSERT INTO `sys_article_tag` VALUES ('360180f0e1194cd89b915a839772c4de', '656297677a2d4399aac9eb668665473e', '629c015a01e94b4b91ab9ff1b9934c2e');
INSERT INTO `sys_article_tag` VALUES ('2c634a28fd5c48098c9f5da3a2e0e6fb', '656297677a2d4399aac9eb668665473e', 'fa262e80839a4ed99e3c94808ac6507a');
INSERT INTO `sys_article_tag` VALUES ('db59f49fd7644d5eb85d373273b87f43', 'edbbdb7b33634962924189bf2e75810a', '2e7265ef9eee455fa5e378abb93ecbcd');
INSERT INTO `sys_article_tag` VALUES ('8126990cf0754490aec70c702367e84b', 'edbbdb7b33634962924189bf2e75810a', '40bef2c8b9cd471985115d1507bf091d');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f27354a', 'edbbdb7b33634962924189bf2e75810a', 'b8d6cb51e1ca4e6aac509f86a360612e');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f273542', 'edbbdb7b33634962924189bf2e75810a', 'd38d4a395a2241058b60771b6cbe48d0');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f273543', 'fd9d69d01b43442ba240ab68048195b3', 'd38d4a395a2241058b60771b6cbe48d1');

-- ----------------------------
-- Table structure for sys_blog
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog`;
CREATE TABLE `sys_blog` (
  `id` varchar(32) NOT NULL COMMENT '文章主键',
  `title` varchar(20) NOT NULL COMMENT '文章标题',
  `content` varchar(50) NOT NULL COMMENT '文章内容',
  `subtitle` varchar(50) NOT NULL COMMENT '文章子标题',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `tagId` varchar(20) NOT NULL COMMENT '标签',
  `classifyId` varchar(32) NOT NULL COMMENT '分类',
  `click` int(11) NOT NULL COMMENT '点击量',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_blog
-- ----------------------------
INSERT INTO `sys_blog` VALUES ('2e7265ef9eee455fa5e378abb93ecbcd', 'maven环境配置', 'f:\\blog\\md\\2017\\4\\18\\1495108302395.md', 'maven环境配置', 'lhd', 'web', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-18 11:01:59', '2017-05-17 22:57:31', 'admin', 'admin', '/images/random/bg1.jpg');
INSERT INTO `sys_blog` VALUES ('40bef2c8b9cd471985115d1507bf091d', '312', 'f:\\blog\\md\\2017\\4\\18\\1495112618181.md', '321321', '321', 'web', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-18 21:03:38', '2017-05-18 21:03:38', 'admin', 'admin', '/images/random/bg9.jpg');
INSERT INTO `sys_blog` VALUES ('467d27e2182a40b99db44a1978e6915b', '321', 'f:\\blog\\d\\2017\\5\\19\\1495176128030.md', '123', '312', '312', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-19 14:42:08', '2017-05-19 14:42:08', 'admin', 'admin', '/images/random/bg2.jpg');
INSERT INTO `sys_blog` VALUES ('629c015a01e94b4b91ab9ff1b9934c2e', 'oracle数据库基本操作', 'f:\\blog\\md\\2017\\5\\19\\1495159066740.md', 'oracle数据库基本操作,创建数据库，增删改查', 'lhd', '数据库 java', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-19 14:04:32', '2017-05-17 22:56:19', 'admin', 'admin', '/images/random/bg2.jpg');
INSERT INTO `sys_blog` VALUES ('b8d6cb51e1ca4e6aac509f86a360612e', 'shiro基本配置', 'f:\\blog\\md\\2017\\4\\18\\1495108302395.md', 'shiro基本配置', 'lhd', '框架', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-17 22:58:21', '2017-05-17 22:58:21', 'admin', 'admin', '/images/random/bg3.jpg');
INSERT INTO `sys_blog` VALUES ('c53e236b258b47aaa3efe7f991ea864b', 'java修饰符final', 'f:\\blog\\md\\2017\\4\\18\\1495108302395.md', 'java修饰符final', 'lhd', 'java', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-17 22:54:49', '2017-05-15 08:56:31', 'admin', 'admin', '/images/random/bg4.jpg');
INSERT INTO `sys_blog` VALUES ('d38d4a395a2241058b60771b6cbe48d0', 'mybatis延迟加载', 'f:\\blog\\md\\2017\\4\\18\\1495108302395.md', 'mybatis延迟加载', 'lhd', '框架', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-17 22:53:45', '2017-05-17 22:34:53', 'admin', 'admin', '/images/random/bg6.jpg');
INSERT INTO `sys_blog` VALUES ('d38d4a395a2241058b60771b6cbe48d1', 'markdown栗子', 'f:\\blog\\md\\2017\\4\\18\\1495108302395.md', 'markdown简单教程', 'lhd', '编辑器', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-17 23:36:16', '2017-05-17 23:36:18', 'admin', 'admin', '/images/random/bg6.jpg');
INSERT INTO `sys_blog` VALUES ('f03382a832294e05a9175b4b71bba278', 'fa', 'f:\\blog\\md\\2017\\5\\19\\1495159276467.md', 'sdf', 'fad', 'java', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-19 10:01:16', '2017-05-19 10:01:16', 'admin', 'admin', '/images/random/bg7.jpg');
INSERT INTO `sys_blog` VALUES ('fa262e80839a4ed99e3c94808ac6507a', 'oracle基本操作', 'f:\\blog\\md\\2017\\5\\19\\1495159066740.md', '使用oracle实现基本的增删改查', 'lhd', '数据库', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-19 09:57:46', '2017-05-19 09:57:46', 'admin', 'admin', '/images/random/bg8.jpg');

-- ----------------------------
-- Table structure for sys_classify
-- ----------------------------
DROP TABLE IF EXISTS `sys_classify`;
CREATE TABLE `sys_classify` (
  `id` varchar(32) NOT NULL COMMENT '分类id',
  `classify` varchar(20) NOT NULL COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_classify
-- ----------------------------
INSERT INTO `sys_classify` VALUES ('1930d5688f8c4eb09a31e44166d52f14', 'java');
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabb084bd98033f12', '喜欢');
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabbxx4bd98033fca', 'web');

-- ----------------------------
-- Table structure for sys_friend
-- ----------------------------
DROP TABLE IF EXISTS `sys_friend`;
CREATE TABLE `sys_friend` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `friend` varchar(50) DEFAULT NULL COMMENT '朋友链接',
  `slogan` varchar(50) DEFAULT NULL COMMENT '朋友标语',
  `link` varchar(50) DEFAULT NULL COMMENT '朋友链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_friend
-- ----------------------------
INSERT INTO `sys_friend` VALUES ('0395cc4ac2c74caab7d035c82652da2f', '312', '3213', '312');
INSERT INTO `sys_friend` VALUES ('2560943013ac4a47b0f03036bd56499a', '452', '245', 'http://www.baidu.com');
INSERT INTO `sys_friend` VALUES ('30bea30609684d4488b73b4fd41ad63f', '5234', '52345', '54235');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT '菜单唯一标识',
  `pid` varchar(32) NOT NULL COMMENT '父菜单',
  `menuName` varchar(255) NOT NULL COMMENT '菜单名字',
  `href` varchar(255) NOT NULL COMMENT '菜单对应链接',
  `icon` varchar(255) NOT NULL COMMENT '菜单图标',
  `permission` varchar(255) DEFAULT NULL COMMENT '访问该菜单需要具有的权限',
  `useable` tinyint(1) NOT NULL COMMENT '是否开启使用·',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('100fce5cabc84687b25368291e410fdc', '0', '标签管理', '/tag/tag-list', 'fa fa-list-ol', null, '1', '2017-05-16 23:24:17', '2017-05-16 23:24:17', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('22cc064e2d0e4431bb5192fe56564fc1', '9c95d73235d54eab8a0d85bf70f8ae9e', '菜单列表', '/menu/menu-list', 'fa fa-th', null, '1', '2017-05-17 16:02:51', '2017-05-17 16:02:51', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('3e39a34b91c847649fd6ea9be46afe82', '9c95d73235d54eab8a0d85bf70f8ae9e', '菜单添加', '/menu/menu-add', 'fa fa-indent', null, '1', '2017-05-17 16:02:21', '2017-05-17 16:02:21', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('4278fff33c3741178545e91a7b8d07bc', 'fd433354452b4d10b8e4eb6544dc59dd', '用户添加', '/user/user-add', 'fa fa-user', null, '1', '2017-05-15 18:20:10', '2017-05-15 18:20:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('4a45e553ec96427388b1a656057dc10e', '0', 'test', '#', 'fa fa-user', null, '0', '2017-05-17 16:45:23', '2017-05-17 16:45:23', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('58e21637c0d04ffebe63dc9069be39d7', '0', '图标选择', '/icon', 'fa fa-adjust', null, '0', '2017-05-17 16:13:46', '2017-05-17 16:13:46', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('650626ffb10e451bbb02d717697905ef', 'fd433354452b4d10b8e4eb6544dc59dd', '用户列表', '/user/user-list', 'fa fa-user', null, '1', '2017-05-15 17:09:04', '2017-05-15 17:09:04', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('76e89fc3178744ac84f6dc5b70afa5f8', '0', '分组管理', '/classify/classify-list', 'fa fa-sort', null, '1', '2017-05-14 22:21:44', '2017-05-14 22:21:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('86e25c498bc642c084ee51bfd9544c2e', '0', '友链管理', '/friend/friend-list', 'fa fa-chain', null, '1', '2017-05-17 14:43:10', '2017-05-17 14:43:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('920e18c2c6e8465a89333b66c495d14f', 'fc65bb5abe5748c5a473db87760f231d', '文章列表', '/article/article-list', 'fa fa-th-list', null, '1', '2017-05-13 18:38:44', '2017-05-13 18:38:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('9c95d73235d54eab8a0d85bf70f8ae9e', '0', '菜单管理', '#', 'fa fa-suitcase', null, '1', '2017-05-17 15:27:44', '2017-05-17 15:27:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('c5dd65ea4c9042e6bc34fb5babff4d9a', 'fc65bb5abe5748c5a473db87760f231d', '文章添加', '/article/article-add', 'fa fa-plus', null, '1', '2017-05-13 18:38:57', '2017-05-13 18:38:57', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('d5f9cd9626c74de88237d0ec5ac39c67', '0', '权限管理', '/role/role-list', 'fa fa-plus-square-o', null, '1', '2017-05-13 17:43:14', '2017-05-13 17:43:14', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('e797d49e14ea49e19aae4c2b567b95ec', '0', '413', '4312', '4312', null, '0', '2017-05-19 13:27:02', '2017-05-19 13:27:02', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('fc65bb5abe5748c5a473db87760f231d', '0', '文章管理', '#', 'fa fa-file', null, '1', '2017-05-13 17:44:37', '2017-05-13 17:44:37', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('fd433354452b4d10b8e4eb6544dc59dd', '0', '用户管理', '#', 'fa fa-user', null, '1', '2017-05-13 17:42:51', '2017-05-13 17:42:51', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色唯一标识',
  `roleName` varchar(255) NOT NULL COMMENT '角色名字',
  `roleType` varchar(255) NOT NULL COMMENT '角色类别',
  `useable` tinyint(1) NOT NULL COMMENT '是否使用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更行者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4c3e861acaba449fa0103a7bad3c4ebw', '系统管理员', 'ROLE_ADMIN', '1', '2017-05-09 13:09:36', '2017-05-09 13:09:40', 'admin', 'admin');
INSERT INTO `sys_role` VALUES ('4d993aa0dba746beb357b030a9fc016b', '32', '32', '1', '2017-05-16 09:39:06', '2017-05-16 09:39:06', 'admin', 'admin');
INSERT INTO `sys_role` VALUES ('fbac9e745f514eedba531a64a39a0fe7', '12', '12', '0', '2017-05-15 22:26:41', '2017-05-15 22:26:41', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(32) NOT NULL COMMENT '菜单角色唯一标识',
  `roleId` varchar(32) NOT NULL COMMENT '角色id',
  `menuId` varchar(32) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`menuId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('ac8be905674e4e9ca912da494baf7558', '4c3e861acaba449fa0103a7bad3c4ebw', '100fce5cabc84687b25368291e410fdc');
INSERT INTO `sys_role_menu` VALUES ('2c4d7d88d6ff4a01899a5d1b137de8db', '4c3e861acaba449fa0103a7bad3c4ebw', '22cc064e2d0e4431bb5192fe56564fc1');
INSERT INTO `sys_role_menu` VALUES ('4394a8654f6f4323a464c4b1393617d3', '4c3e861acaba449fa0103a7bad3c4ebw', '3e39a34b91c847649fd6ea9be46afe82');
INSERT INTO `sys_role_menu` VALUES ('72c3550f23ed4c60bd317e91ad4d9801', '4c3e861acaba449fa0103a7bad3c4ebw', '4278fff33c3741178545e91a7b8d07bc');
INSERT INTO `sys_role_menu` VALUES ('2896d13416354f5fbbf51dec6251cf78', '4c3e861acaba449fa0103a7bad3c4ebw', '4a45e553ec96427388b1a656057dc10e');
INSERT INTO `sys_role_menu` VALUES ('7290e48f78664d04830188a908cc8c8e', '4c3e861acaba449fa0103a7bad3c4ebw', '58e21637c0d04ffebe63dc9069be39d7');
INSERT INTO `sys_role_menu` VALUES ('56844161badb480988a776041b5a419e', '4c3e861acaba449fa0103a7bad3c4ebw', '650626ffb10e451bbb02d717697905ef');
INSERT INTO `sys_role_menu` VALUES ('b305509f0ac84b85ba9a62179f43ff4f', '4c3e861acaba449fa0103a7bad3c4ebw', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('6969674194d94814ab07631628148582', '4d993aa0dba746beb357b030a9fc016b', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('7d0cf9e31ee24378b07eb2cc605780a5', 'fbac9e745f514eedba531a64a39a0fe7', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('53b91ec0ed4f43c98dcdc84a36645cdc', '4c3e861acaba449fa0103a7bad3c4ebw', '86e25c498bc642c084ee51bfd9544c2e');
INSERT INTO `sys_role_menu` VALUES ('2ee4eeece48748819ded99710aea55a5', '4c3e861acaba449fa0103a7bad3c4ebw', '920e18c2c6e8465a89333b66c495d14f');
INSERT INTO `sys_role_menu` VALUES ('13c4bd65b0004937b1a7543b5b2eadf1', '4c3e861acaba449fa0103a7bad3c4ebw', '9c95d73235d54eab8a0d85bf70f8ae9e');
INSERT INTO `sys_role_menu` VALUES ('58d9d95f3cab4acf96ee7471440d42c3', '4c3e861acaba449fa0103a7bad3c4ebw', 'c5dd65ea4c9042e6bc34fb5babff4d9a');
INSERT INTO `sys_role_menu` VALUES ('029e98bc4e2644ab80ce2d3e6ba63898', '4c3e861acaba449fa0103a7bad3c4ebw', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('1c99fdf903cb4db48ef3778789360f59', '4d993aa0dba746beb357b030a9fc016b', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('558f461db4824dfcbe83432f3100f675', 'fbac9e745f514eedba531a64a39a0fe7', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('417f867be6524a6aa27df01ab3b1a0c3', '4c3e861acaba449fa0103a7bad3c4ebw', 'e797d49e14ea49e19aae4c2b567b95ec');
INSERT INTO `sys_role_menu` VALUES ('699645926ce447a596b34935221aa77c', '4c3e861acaba449fa0103a7bad3c4ebw', 'fc65bb5abe5748c5a473db87760f231d');
INSERT INTO `sys_role_menu` VALUES ('f93cf763c88344e9bbac7cb2439f7300', '4c3e861acaba449fa0103a7bad3c4ebw', 'fd433354452b4d10b8e4eb6544dc59dd');

-- ----------------------------
-- Table structure for sys_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_tag`;
CREATE TABLE `sys_tag` (
  `id` varchar(32) NOT NULL COMMENT '标签id',
  `tagName` varchar(20) DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_tag
-- ----------------------------
INSERT INTO `sys_tag` VALUES ('0db132f50809469abd7d49d08e1d9bdf', 'java');
INSERT INTO `sys_tag` VALUES ('656297677a2d4399aac9eb668665473e', '数据库');
INSERT INTO `sys_tag` VALUES ('edbbdb7b33634962924189bf2e75810a', 'web');
INSERT INTO `sys_tag` VALUES ('f3d7536535264b26a09f7b01dc76f53f', '框架');
INSERT INTO `sys_tag` VALUES ('fd9d69d01b43442ba240ab68048195b3', '编辑器');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '系统用户主键',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `description` varchar(200) NOT NULL COMMENT '用户描述',
  `email` varchar(20) NOT NULL COMMENT '用户邮箱',
  `icon` varchar(20) NOT NULL COMMENT '头像',
  `address` varchar(50) NOT NULL COMMENT '用户地址',
  `introduce` varchar(500) NOT NULL COMMENT '简介',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('31ec9796a4914404a50fb64b4f62edbe', 'lhd', '321', '212', '4133123000@qq.com', '', '中国-江西-赣州-xx路-341000', '4131', '2017-05-19 13:26:38', '2017-05-15 19:33:48', 'admin', 'admin', '1', '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('4c3e861acaba449fa0103a7bad3c4ebq', 'admin', '6c5de1b510e8bdd0bc40eff99dcd03f8', '111', '444', '', '11-1-1-1-1', '321', '2017-05-15 23:42:25', '2017-05-09 13:08:07', 'admin', 'admin', '1', '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('d25e8644e27642b7a292fa0d3c25b94a', '321', '321', '321', '321', '', '321-321-321-312-321', '312', '2017-05-16 00:11:01', '2017-05-16 00:05:29', 'admin', 'admin', '1', '4c3e861acaba449fa0103a7bad3c4ebw');
