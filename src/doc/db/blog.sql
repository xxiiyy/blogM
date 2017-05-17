/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2017-05-17 14:56:36
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

-- ----------------------------
-- Table structure for sys_blog
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog`;
CREATE TABLE `sys_blog` (
  `id` varchar(32) NOT NULL COMMENT '文章主键',
  `title` varchar(20) NOT NULL COMMENT '文章标题',
  `content` varchar(2000) NOT NULL COMMENT '文章内容',
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
INSERT INTO `sys_blog` VALUES ('007e11c56dc44bf29ea2757fc838c2d2', '111z1', '#asd\r\n1\r\n##1123\r\n![](/resources/upload/u=2402350486,4194130541&fm=21&gp=0.jpg)', 'asd', 'das', 'das', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-16 18:16:34', '2017-05-15 10:34:50', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg14.jpg');
INSERT INTO `sys_blog` VALUES ('2d4ad71bfc0f477c85faf4b0797685d2', '414', '[TOC]\r\n\r\n#### Disabled options\r\n\r\n- TeX (Based on KaTeX);\r\n- Emoji;\r\n- Task lists;\r\n- HTML tags decode;\r\n- Flowchart and Sequence Diagram;\r\n\r\n#### Editor.md directory\r\n\r\n    editor.md/\r\n            lib/\r\n            css/\r\n            scss/\r\n            tests/\r\n            fonts/\r\n            images/\r\n            plugins/\r\n            examples/\r\n            languages/     \r\n            editormd.js\r\n            ...\r\n\r\n```html\r\n<!-- English -->\r\n<script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n<!-- 繁體中文 -->\r\n<script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n```', '2345', '425', '524', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-15 11:09:49', '2017-05-15 11:09:49', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg11.jpg');
INSERT INTO `sys_blog` VALUES ('685312b87d9843248ba89d86d098956a', '114', '3123', '114', '114', '114', '61a2375dbcb046fbabb084bd98033f12', '0', '2017-05-15 08:56:18', '2017-05-15 08:56:18', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg2.jpg');
INSERT INTO `sys_blog` VALUES ('7347cf864ffe4c029814b7fec635ed39', '111', '111', '111', '111', '111', '61a2375dbcb046fbabb084bd98033f12', '0', '2017-05-15 08:55:50', '2017-05-15 08:55:50', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg13.jpg');
INSERT INTO `sys_blog` VALUES ('7c599c2636fd4296a08a759f7da55393', '412', '#fdsf\r\n##fsdf', '431', '413', '413', '61a2375dbcb046fbabb084bd98033f12', '0', '2017-05-15 10:35:04', '2017-05-15 10:35:04', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg5.jpg');
INSERT INTO `sys_blog` VALUES ('8344097dd7794bc884e8a62878bca7a8', '116', '#616\r\nfasdfa', '116', '116', '116', '61a2375dbcb046fbabb084bd98033f12', '0', '2017-05-16 18:16:44', '2017-05-15 08:58:09', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg2.jpg');
INSERT INTO `sys_blog` VALUES ('9db8c7ca30fa402fa994b8dbc28a6cf5', '312', '#test\r\n###ii\r\nsdlfjalkjdf', '312', '43', '513', '61a2375dbcb046fbabb084bd98033fca', '0', '2017-05-16 18:10:03', '2017-05-16 18:03:54', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg4.jpg');
INSERT INTO `sys_blog` VALUES ('bea7c8e1066a48aa982772761c10b298', '3212', '321', '321321', '312', '312', '61a2375dbcb046fbabb084bd98033fca', '0', '2017-05-16 23:13:06', '2017-05-16 23:13:06', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg5.jpg');
INSERT INTO `sys_blog` VALUES ('c53e236b258b47aaa3efe7f991ea864b', '115', '1551', '115', '115', '115', '61a2375dbcb046fbabb084bd98033f12', '0', '2017-05-15 08:56:31', '2017-05-15 08:56:31', 'admin', 'admin', 'https://moumao.moumaobuchiyu.com/images/random/bg6.jpg');

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
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabb084bd98033f12', '喜欢');
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabb084bd98033fca', '432');
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
INSERT INTO `sys_friend` VALUES ('2560943013ac4a47b0f03036bd56499a', '452', '245', 'www.baidu.com');

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
INSERT INTO `sys_menu` VALUES ('4278fff33c3741178545e91a7b8d07bc', 'fd433354452b4d10b8e4eb6544dc59dd', '用户添加', '/user/user-add', 'fa fa-user', null, '1', '2017-05-15 18:20:10', '2017-05-15 18:20:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('650626ffb10e451bbb02d717697905ef', 'fd433354452b4d10b8e4eb6544dc59dd', '用户列表', '/user/user-list', 'fa fa-user', null, '1', '2017-05-15 17:09:04', '2017-05-15 17:09:04', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('76e89fc3178744ac84f6dc5b70afa5f8', '0', '分组管理', '/classify/classify-list', 'fa fa-sort', null, '1', '2017-05-14 22:21:44', '2017-05-14 22:21:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('86e25c498bc642c084ee51bfd9544c2e', '0', '友链管理', '/friend/friend-list', 'fa fa-chain', null, '1', '2017-05-17 14:43:10', '2017-05-17 14:43:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('920e18c2c6e8465a89333b66c495d14f', 'fc65bb5abe5748c5a473db87760f231d', '文章列表', '/article/article-list', 'fa fa-th-list', null, '1', '2017-05-13 18:38:44', '2017-05-13 18:38:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('c5dd65ea4c9042e6bc34fb5babff4d9a', 'fc65bb5abe5748c5a473db87760f231d', '文章添加', '/article/article-add', 'fa fa-indent', null, '1', '2017-05-13 18:38:57', '2017-05-13 18:38:57', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('d5f9cd9626c74de88237d0ec5ac39c67', '0', '权限管理', '/role/role-list', 'fa fa-plus-square-o', null, '1', '2017-05-13 17:43:14', '2017-05-13 17:43:14', 'admin', 'admin');
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
INSERT INTO `sys_role` VALUES ('4c3e861acaba449fa0103a7bad3c4ebw', '系统管理员', 'admin', '1', '2017-05-09 13:09:36', '2017-05-09 13:09:40', 'admin', 'admin');
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
INSERT INTO `sys_role_menu` VALUES ('b8b5c0d1df69495286c2cbd949e9a7b2', '4c3e861acaba449fa0103a7bad3c4ebw', '100fce5cabc84687b25368291e410fdc');
INSERT INTO `sys_role_menu` VALUES ('f6b81474c04b4670b4bb788bc6b0ab4d', '4c3e861acaba449fa0103a7bad3c4ebw', '4278fff33c3741178545e91a7b8d07bc');
INSERT INTO `sys_role_menu` VALUES ('4816938fa7db4ae79902c7c36e60a9ec', '4c3e861acaba449fa0103a7bad3c4ebw', '650626ffb10e451bbb02d717697905ef');
INSERT INTO `sys_role_menu` VALUES ('b3203054c6d34311927550378f0b9712', '4c3e861acaba449fa0103a7bad3c4ebw', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('6969674194d94814ab07631628148582', '4d993aa0dba746beb357b030a9fc016b', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('7d0cf9e31ee24378b07eb2cc605780a5', 'fbac9e745f514eedba531a64a39a0fe7', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('882a9b314e9043eb8882560c9e5afcfa', '4c3e861acaba449fa0103a7bad3c4ebw', '86e25c498bc642c084ee51bfd9544c2e');
INSERT INTO `sys_role_menu` VALUES ('968b574a5ead43939e670571e92ec3bb', '4c3e861acaba449fa0103a7bad3c4ebw', '920e18c2c6e8465a89333b66c495d14f');
INSERT INTO `sys_role_menu` VALUES ('be7a4655276c47bdb553b8c883b9bcb2', '4c3e861acaba449fa0103a7bad3c4ebw', 'c5dd65ea4c9042e6bc34fb5babff4d9a');
INSERT INTO `sys_role_menu` VALUES ('22b6a2fccbac42efb2e9ad9326b03fb2', '4c3e861acaba449fa0103a7bad3c4ebw', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('1c99fdf903cb4db48ef3778789360f59', '4d993aa0dba746beb357b030a9fc016b', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('558f461db4824dfcbe83432f3100f675', 'fbac9e745f514eedba531a64a39a0fe7', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('622e9bc2a7564825b5cf1aafd274140f', '4c3e861acaba449fa0103a7bad3c4ebw', 'fc65bb5abe5748c5a473db87760f231d');
INSERT INTO `sys_role_menu` VALUES ('15858d25dec849008893546beba77842', '4c3e861acaba449fa0103a7bad3c4ebw', 'fd433354452b4d10b8e4eb6544dc59dd');

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
INSERT INTO `sys_tag` VALUES ('2a90f91c67b94e22ad2618f1684908bb', '1231');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '系统用户主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
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
INSERT INTO `sys_user` VALUES ('31ec9796a4914404a50fb64b4f62edbe', 'lhd', '321', '212', '4133123000@qq.com', '', '中国-江西-赣州-xx路-341000', '413', '2017-05-15 23:41:21', '2017-05-15 19:33:48', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('4c3e861acaba449fa0103a7bad3c4ebq', 'admin', 'admin', '111', '444', '', '11-1-1-1-1', '321', '2017-05-15 23:42:25', '2017-05-09 13:08:07', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('d25e8644e27642b7a292fa0d3c25b94a', '321', '321', '321', '321', '', '321-321-321-312-321', '312', '2017-05-16 00:11:01', '2017-05-16 00:05:29', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
