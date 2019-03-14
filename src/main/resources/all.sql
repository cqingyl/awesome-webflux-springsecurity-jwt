
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单url',
  `is_url` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Y  是外部链接\nN 不是外部链接',
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A  应用菜单\nS  系统菜单',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NOT NULL COMMENT '状态设置时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_sys_menu_update_user`(`update_user_id`) USING BTREE,
  INDEX `foreignkey_sys_menu_create_user`(`create_user_id`) USING BTREE,
  CONSTRAINT `foreignkey_sys_menu_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_menu_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '用户管理', 'el-icon-setting', '/manage/user', 'Y', 'A', 'A', '2017-02-06 17:50:52', '2017-02-06 17:50:52', NULL, NULL, '0', NULL);
INSERT INTO `sys_menu` VALUES ('2', '角色权限', 'el-icon-goods', '/manage/role', 'Y', 'A', 'A', '2017-02-06 17:50:52', '2017-02-06 17:50:52', NULL, NULL, '0', NULL);
INSERT INTO `sys_menu` VALUES ('3', '分类管理', 'el-icon-edit-outline', '/manage/type', 'Y', 'A', 'A', '2017-02-06 17:50:52', '2017-02-06 17:50:52', NULL, NULL, '0', NULL);
INSERT INTO `sys_menu` VALUES ('4', '专题产品', 'el-icon-menu', '/manage/product', 'Y', 'A', 'A', '2017-07-12 09:32:43', '2017-07-12 09:32:43', NULL, NULL, '0', NULL);
INSERT INTO `sys_menu` VALUES ('5', '日志管理', 'el-icon-document', '/manage/log', 'Y', 'A', 'A', '2017-02-06 17:51:20', '2017-02-06 17:51:20', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单id',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int(3) NULL DEFAULT NULL COMMENT '权限类型（1：增，2：删，3：改，4：查，5：授权）',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NOT NULL COMMENT '设置状态时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_sys_permission_update_user`(`update_user_id`) USING BTREE,
  INDEX `foreignkey_sys_permission_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_sys_permission_menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `foreignkey_sys_permission_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_permission_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_permission_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('11', '用户新增', '1', 'ROLE_USER_CREATE', 1, '2019-02-25 17:15:23', '0', '2019-02-25 17:15:27', '0', 'A', '2019-02-25 17:15:34');
INSERT INTO `sys_permission` VALUES ('12', '用户删除', '1', 'ROLE_USER_DELETE', 2, '2019-02-25 17:16:27', '0', '2019-02-25 17:16:36', '0', 'A', '2019-02-25 17:16:43');
INSERT INTO `sys_permission` VALUES ('13', '用户修改', '1', 'ROLE_USER_UPDATE', 3, '2019-02-25 17:16:27', '0', '2019-02-25 17:16:36', '0', 'A', '2019-02-25 17:16:43');
INSERT INTO `sys_permission` VALUES ('14', '用户查询', '1', 'ROLE_USER_QUERY', 4, '2019-02-25 17:16:27', '0', '2019-02-25 17:16:36', '0', 'A', '2019-02-25 17:16:43');
INSERT INTO `sys_permission` VALUES ('15', '用户角色分配', '1', 'ROLE_USER_GRANT', 5, '2019-02-25 17:16:27', '0', '2019-02-25 17:16:36', '0', 'A', '2019-02-25 17:16:43');
INSERT INTO `sys_permission` VALUES ('21', '角色新增', '2', 'ROLE_ROLE_CREATE', 1, '2019-02-15 16:53:06', '0', '2019-02-15 16:53:06', '0', 'A', '2019-02-15 16:53:06');
INSERT INTO `sys_permission` VALUES ('22', '角色删除', '2', 'ROLE_ROLE_DELETE', 2, '2019-02-15 16:52:55', '0', '2019-02-15 17:04:31', '0', 'A', '2019-02-15 17:03:05');
INSERT INTO `sys_permission` VALUES ('23', '角色修改', '2', 'ROLE_ROLE_UPDATE', 3, '2019-02-15 16:53:42', '0', '2019-02-15 16:53:42', '0', 'A', '2019-02-15 16:53:42');
INSERT INTO `sys_permission` VALUES ('24', '角色查询', '2', 'ROLE_ROLE_QUERY', 4, '2019-02-15 16:53:34', '0', '2019-02-15 16:53:34', '0', 'A', '2019-02-15 16:53:34');
INSERT INTO `sys_permission` VALUES ('25', '角色权限分配', '2', 'ROLE_ROLE_GRANT', 5, '2019-02-15 16:53:34', '0', '2019-02-15 16:53:34', '0', 'A', '2019-02-15 16:53:34');
INSERT INTO `sys_permission` VALUES ('31', '分类新增', '3', 'ROLE_TPT_CREATE', 1, '2019-02-25 17:17:29', '0', '2019-02-25 17:17:31', '0', 'A', '2019-02-25 17:17:44');
INSERT INTO `sys_permission` VALUES ('32', '分类删除', '3', 'ROLE_TPT_DELETE', 2, '2019-02-25 17:17:29', '0', '2019-02-25 17:17:31', '0', 'A', '2019-02-25 17:17:44');
INSERT INTO `sys_permission` VALUES ('33', '分类修改', '3', 'ROLE_TPT_UPDATE', 3, '2019-02-25 17:17:29', '0', '2019-02-25 17:17:31', '0', 'A', '2019-02-25 17:17:44');
INSERT INTO `sys_permission` VALUES ('34', '分类查询', '3', 'ROLE_TPT_QUERY', 4, '2019-02-25 17:17:29', '0', '2019-02-25 17:17:31', '0', 'A', '2019-02-25 17:17:44');
INSERT INTO `sys_permission` VALUES ('41', '产品增添', '4', 'ROLE_PRO_CREATE', 1, '2019-02-15 16:53:06', '0', '2019-02-15 16:53:06', '0', 'A', '2019-02-15 16:53:06');
INSERT INTO `sys_permission` VALUES ('42', '产品删除', '4', 'ROLE_PRO_DELETE', 2, '2019-02-15 16:52:55', '0', '2019-02-15 16:52:55', '0', 'A', '2019-02-15 16:52:55');
INSERT INTO `sys_permission` VALUES ('43', '产品修改', '4', 'ROLE_PRO_UPDATE', 3, '2019-02-15 16:53:42', '0', '2019-02-15 16:53:42', '0', 'A', '2019-02-15 16:53:42');
INSERT INTO `sys_permission` VALUES ('44', '产品查询', '4', 'ROLE_PRO_QUERY', 4, '2019-02-15 16:53:34', '0', '2019-02-15 16:53:34', '0', 'A', '2019-02-15 16:53:34');
INSERT INTO `sys_permission` VALUES ('51', '日志查询', '5', 'ROLE_LOG_QUERY', 4, '2019-02-15 16:53:34', '0', '2019-02-15 16:53:34', '0', 'A', '2019-02-15 16:53:34');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NOT NULL COMMENT '设置状态时间',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_sys_role_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_sys_role_update_user`(`update_user_id`) USING BTREE,
  CONSTRAINT `foreignkey_sys_role_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_role_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1000', '超级管理员', 'ROLE_SYSTEM_ADMIN', 'A', '2017-02-07 17:50:29', '0', '2017-02-07 17:50:29', '0', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1010', '系统管理员', 'ROLE_ADMIN', 'A', '2017-02-12 10:38:58', '0', '2017-02-12 10:38:58', '0', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1071', '普通用户', 'ROLE_USER', 'A', '2017-06-21 10:08:38', '0', '2017-06-21 10:08:38', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NULL DEFAULT NULL COMMENT '设置状态时间',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_sys_role_permission_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_sys_role_permission_update_user`(`update_user_id`) USING BTREE,
  INDEX `foreignkey_sys_role_permission_role_id`(`role_id`) USING BTREE,
  INDEX `foreignkey_sys_role_permission_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `foreignkey_sys_role_permission_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_role_permission_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_role_permission_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_role_permission_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('04f3ac38962b4f1b9b4c4306ea8c39e4', '1000', '13', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '用户编辑');
INSERT INTO `sys_role_permission` VALUES ('295f45d051184e7d9013e740c32d971b', '1000', '12', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '用户删除');
INSERT INTO `sys_role_permission` VALUES ('39290348dee14d5fbad1456754d0e82b', '1000', '14', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '用户查询');
INSERT INTO `sys_role_permission` VALUES ('3c83b87804f14df8a33c36ac43b4d909', '1000', '31', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '分类新增');
INSERT INTO `sys_role_permission` VALUES ('60e8247073b140a79a6fd72bc8447ca8', '1000', '51', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '日志查询');
INSERT INTO `sys_role_permission` VALUES ('6fbca8ad1cea4ce99d7440066990bd55', '1000', '24', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '角色查询');
INSERT INTO `sys_role_permission` VALUES ('7598d4bca7914709b88524400de3cd30', '1000', '32', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '分类删除');
INSERT INTO `sys_role_permission` VALUES ('7643662e13fe4ab59a7926a2d1999160', '1000', '15', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '用户角色分配');
INSERT INTO `sys_role_permission` VALUES ('771ac6a24b064652976a1dc524c6df5c', '1000', '23', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '角色修改');
INSERT INTO `sys_role_permission` VALUES ('7fcfe8abc1054bc2bfe2f586ba3b2932', '1000', '21', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '角色新增');
INSERT INTO `sys_role_permission` VALUES ('8b589dc9263c44609852f5ae936bd9a8', '1000', '22', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '角色删除');
INSERT INTO `sys_role_permission` VALUES ('8f553214684d4b839ee7d39438632adc', '1000', '33', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '分类修改');
INSERT INTO `sys_role_permission` VALUES ('94a0339369aa4f60b4d7c2fa9c976094', '1000', '25', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '角色权限分配');
INSERT INTO `sys_role_permission` VALUES ('a35847b0f0b94456a359e2abc209a215', '1000', '11', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '用户新增');
INSERT INTO `sys_role_permission` VALUES ('b15b8870e90945ed95ebce720a90c06d', '1000', '41', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '产品增添');
INSERT INTO `sys_role_permission` VALUES ('ce943222f2e44e7895174388a8021b68', '1000', '42', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '产品删除');
INSERT INTO `sys_role_permission` VALUES ('d587fd7fe2b845ac8b768f6b205685fb', '1000', '44', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '产品查询');
INSERT INTO `sys_role_permission` VALUES ('d8440967facf486096cae5b519ac1f1d', '1000', '43', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '产品修改');
INSERT INTO `sys_role_permission` VALUES ('fe3b2fc0ab6d44818580df0bc032282a', '1000', '34', '0', '2019-02-28 09:27:45', '0', '2019-02-28 09:27:45', 'A', '2019-02-28 09:27:45', '分类查询');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `pwd_set_date` datetime(0) NOT NULL COMMENT '密码设置时间',
  `last_pwd` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次密码',
  `area_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在区域',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱地址',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NULL DEFAULT NULL COMMENT '设置状态时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `differentiation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'P 手机用户 S 系统用户',
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_SYS_USER_100`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0', 'admin', '系统管理员', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-01-09 00:00:00', NULL, '110000', '13300000000', '123@gmail.com', 'A', '2017-01-09 00:00:00', '2017-01-09 00:00:00', '', NULL, '', 'S', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1071', 'xiaohui', 'xiaohui', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-01-09 00:00:00', NULL, '110000', '13300000000', '123@gmail.com', 'A', '2017-01-09 00:00:00', '2017-01-09 00:00:00', '0', NULL, '0', 'S', NULL, NULL);
INSERT INTO `sys_user` VALUES ('6242', '18813183266', 'zhaiyayu', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-08-09 15:20:57', NULL, '110000', '13300000000', '123@gmail.com', 'P', '2019-02-26 17:20:14', '2017-08-09 15:20:57', '0', '2019-02-26 17:20:14', '0', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('6243', '13639395077', '宋清洁', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-08-09 16:16:48', NULL, '110000', '13300000000', '123@gmail.com', 'P', '2017-08-09 16:16:48', '2017-08-09 16:16:48', '0', NULL, '1391', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('6940', '15334801820', '吴宏军', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-08-27 11:25:06', NULL, '110000', '13300000000', '123@gmail.com', 'A', '2017-08-27 11:25:06', '2017-08-27 11:25:06', '0', NULL, '1391', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('6941', '18647069187', '朝鲁门图雅', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-08-27 12:10:32', NULL, '110000', '13300000000', '123@gmail.com', 'A', '2017-08-27 12:10:32', '2017-08-27 12:10:32', '0', NULL, '1391', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('7443', '13910803165', '辛晓平', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2018-05-09 09:44:19', NULL, '110000', '13300000000', '123@gmail.com', 'P', '2017-10-18 16:53:31', '2017-10-18 16:53:31', '0', NULL, '7443', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('7444', '15213980509', '杨老师', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-10-23 09:54:59', NULL, '120102', '13300000000', '123@gmail.com', 'A', '2017-10-23 09:54:59', '2017-10-23 09:54:59', '0', '2019-02-27 17:45:19', '0', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('7445', '18712033002', '毛平平', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-10-23 20:39:59', NULL, '110000', '13300000000', '123@gmail.com', 'P', '2019-02-26 17:25:32', '2017-10-23 20:39:59', '0', '2019-02-26 17:25:32', '0', 'P', NULL, NULL);
INSERT INTO `sys_user` VALUES ('7446', '15364877772', '崔岩', 'fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=', '2017-10-25 17:45:00', NULL, '110000', '13300000000', '123@gmail.com', 'P', '2017-10-25 17:45:00', '2017-10-25 17:45:00', '0', NULL, '0', 'P', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NULL DEFAULT NULL COMMENT '设置状态时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_sys_user_role_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_sys_user_role_update_user`(`update_user_id`) USING BTREE,
  INDEX `foreignkey_sys_user_role_role_id`(`role_id`) USING BTREE,
  INDEX `foreignkey_sys_user_role_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `foreignkey_sys_user_role_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_user_role_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_sys_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '0', '1000', '超级管理员', '0', '2019-02-26 14:41:18', '0', '2019-02-26 14:41:14', 'A', '2019-02-26 14:41:24');
INSERT INTO `sys_user_role` VALUES ('2', '0', '1010', '系统管理员', '0', '2019-02-26 14:41:18', '0', '2019-02-26 14:41:14', 'A', '2019-02-26 14:41:24');
INSERT INTO `sys_user_role` VALUES ('3', '0', '1071', '普通用户', '0', '2019-02-26 14:41:18', '0', '2019-02-26 14:41:14', 'A', '2019-02-26 14:41:24');
INSERT INTO `sys_user_role` VALUES ('7388533d1ce84e7bad38b7c4d7d2e874', '6940', '1010', '系统管理员', '0', '2019-02-27 17:33:25', '0', '2019-02-27 17:33:25', 'A', '2019-02-27 17:33:25');
INSERT INTO `sys_user_role` VALUES ('e9e05242a2804436acc05ebeec964884', '7444', '1010', '系统管理员', '0', '2019-02-27 17:33:20', '0', '2019-02-27 17:33:20', 'A', '2019-02-27 17:33:20');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `product_type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型。NPP,AGB,F00，长势，旱情',
  `product_area_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域id',
  `product_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品批次 1 日产品 2 月产品 3 年产品',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  `sts` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NULL DEFAULT NULL COMMENT '设置状态时间',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_product_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_product_update_user`(`update_user_id`) USING BTREE,
  INDEX `foreignkey_product_type_id`(`product_type_id`) USING BTREE,
  INDEX `foreignkey_product_area_id`(`product_area_id`) USING BTREE,
  CONSTRAINT `foreignkey_product_area_id` FOREIGN KEY (`product_area_id`) REFERENCES `sys_area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_product_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_product_type_id` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_product_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('13b6ca52607d4e4e832de7970769106a', '基于CASA模型计算NPP2019年2月28日波密县专题图', '4c1124323a3811e99f5d6c4b9004cbb8', '542625', '1', NULL, '2019-02-28 14:16:46', '0', '2019-02-28 14:25:06', NULL, 'A', NULL, '114.717729191435,38.7210613171803,114.817511007247,38.7828794975303');
INSERT INTO `product` VALUES ('14d8cae3b4f946ed8b7f5f061fdd9ba5', '距平模型草地长势监测2019年2月仁布县专题图', '98ca2b7f3a3811e99f5d6c4b9004cbb8', '542330', '2', NULL, '2019-02-28 11:15:16', NULL, NULL, NULL, 'A', NULL, '114.717729191435,38.7210613171803,114.817511007247,38.7828794975303');
INSERT INTO `product` VALUES ('15122af025d7423492a3ae4410d6cac8', '草地长势等级划分2019年2月曲水县专题图', 'a013370b3a3811e99f5d6c4b9004cbb8', '540124', '2', NULL, '2019-02-28 11:13:58', NULL, NULL, NULL, 'A', NULL, '114.717729191435,38.7210613171803,114.817511007247,38.7828794975303');
INSERT INTO `product` VALUES ('2f3770dff23843b7bd142bcf46a9a460', '草地分区统计2019年西藏自治区专题图', 'c1fad2a83a3811e99f5d6c4b9004cbb8', '540000', '3', NULL, '2019-02-28 11:33:41', NULL, NULL, NULL, 'A', NULL, '114.665365556395,38.6909522270318,114.894892823323,38.8585158591625');
INSERT INTO `product` VALUES ('423532e57823442e8d7043364378f09c', '基于遥感植被指数估算产草量2019年2月琼结县专题图', '668de1f73a3811e99f5d6c4b9004cbb8', '542225', '2', NULL, '2019-02-28 10:51:33', NULL, NULL, NULL, 'A', NULL, '114.665365556395,38.6909522270318,114.894892823323,38.8585158591625');
INSERT INTO `product` VALUES ('8f765c833b2211e99f5d6c4b9004cbb8', '产品保存测试1111', '1213b4c13a3811e99f5d6c4b9004cbb8', '110000', '1', '0', '2019-02-28 14:32:01', '0', '2019-02-28 14:32:01', NULL, 'A', '2019-02-28 14:32:01', NULL);
INSERT INTO `product` VALUES ('9c7a4679ed694543a9921f7d0f617faa', '基于遥感植被指数估算产草量2019年2月28日林芝市本级专题图', '668de1f73a3811e99f5d6c4b9004cbb8', '542699', '1', NULL, '2019-02-28 13:55:02', NULL, NULL, NULL, 'A', NULL, '114.717729191435,38.7210613171803,114.817511007247,38.7828794975303');
INSERT INTO `product` VALUES ('abdfb7063b2211e99f5d6c4b9004cbb8', '测试', '43f5435b3a3811e99f5d6c4b9004cbb8', '110101', '1', '0', '2019-02-28 14:32:49', '0', '2019-02-28 14:32:49', NULL, 'A', '2019-02-28 14:32:49', NULL);
INSERT INTO `product` VALUES ('e2549e09e4864701b1fbc6bab8a8658f', '基于生产力估算产草量2019年2月28日米林县专题图', '61bb915e3a3811e99f5d6c4b9004cbb8', '542623', '1', NULL, '2019-02-28 14:31:54', NULL, NULL, NULL, 'A', NULL, '114.717729191435,38.7210613171803,114.817511007247,38.7828794975303');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type_class_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型父类id 0表示一级类型',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `sts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'A  ACTIVE  在用\nP  PAUSE   停用',
  `sts_date` datetime(0) NULL DEFAULT NULL COMMENT '设置状态时间',
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  `descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreignkey_product_type_create_user`(`create_user_id`) USING BTREE,
  INDEX `foreignkey_product_type_update_user`(`update_user_id`) USING BTREE,
  CONSTRAINT `foreignkey_product_type_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreignkey_product_type_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('037c3ede3b3411e99f5d6c4b9004cbb8', '12313', '2019-02-28 16:37:01', '0', '0', '2019-02-28 17:11:05', '0', 'P', '2019-02-28 17:11:05', NULL, '123123');
INSERT INTO `product_type` VALUES ('09b823ec3b3411e99f5d6c4b9004cbb8', '123123123', '2019-02-28 16:37:11', '037c3ede3b3411e99f5d6c4b9004cbb8', '0', '2019-02-28 17:11:05', '0', 'P', '2019-02-28 17:11:05', NULL, '123122343');
INSERT INTO `product_type` VALUES ('1213b4c13a3811e99f5d6c4b9004cbb8', '草地生产力', '2019-02-19 17:42:21', '0', '1071', '2019-02-28 16:53:12', '0', 'A', '2019-02-19 17:42:36', 1, '123');
INSERT INTO `product_type` VALUES ('17fd46b63a3811e99f5d6c4b9004cbb8', '草地产草量', '2019-02-19 17:42:21', '0', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('1b96f9373a3811e99f5d6c4b9004cbb8', '草畜平衡', '2019-02-19 17:42:21', '0', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('2032705e3a3811e99f5d6c4b9004cbb8', '草地长势', '2019-02-19 17:42:21', '0', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('25cde2243a3811e99f5d6c4b9004cbb8', '草地旱情', '2019-02-19 17:42:21', '0', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('29a7164b3a3811e99f5d6c4b9004cbb8', '空间分析', '2019-02-19 17:42:21', '0', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('43f5435b3a3811e99f5d6c4b9004cbb8', '基于气候模型计算NPP', '2019-02-19 17:42:21', '1213b4c13a3811e99f5d6c4b9004cbb8', '1071', '2019-02-28 16:53:21', '0', 'A', '2019-02-19 17:42:36', 1, '123');
INSERT INTO `product_type` VALUES ('4c1124323a3811e99f5d6c4b9004cbb8', '基于CASA模型计算NPP', '2019-02-19 17:42:21', '1213b4c13a3811e99f5d6c4b9004cbb8', '1071', '2019-02-28 16:53:32', '0', 'A', '2019-02-19 17:42:36', 1, '123');
INSERT INTO `product_type` VALUES ('61bb915e3a3811e99f5d6c4b9004cbb8', '基于生产力估算产草量', '2019-02-19 17:42:21', '17fd46b63a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('6647c6733b3a11e99f5d6c4b9004cbb8', '测试测试', '2019-02-28 17:22:44', '0', '0', '2019-02-28 17:22:44', '0', 'A', '2019-02-28 17:22:44', NULL, '侧挖');
INSERT INTO `product_type` VALUES ('668de1f73a3811e99f5d6c4b9004cbb8', '基于遥感植被指数估算产草量', '2019-02-19 17:42:21', '17fd46b63a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('6a609d833a3811e99f5d6c4b9004cbb8', '基于BP神经网络估算产草量', '2019-02-19 17:42:21', '17fd46b63a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('6d72a63e3b3311e99f5d6c4b9004cbb8', '测试', '2019-02-28 16:32:49', '0', '0', '2019-02-28 17:19:44', '0', 'A', '2019-02-28 17:19:44', NULL, '测');
INSERT INTO `product_type` VALUES ('7d938aeb3a3811e99f5d6c4b9004cbb8', '以草定畜', '2019-02-19 17:42:21', '1b96f9373a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('7f949d383a3811e99f5d6c4b9004cbb8', '以畜定草', '2019-02-19 17:42:21', '1b96f9373a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('83d384483a3811e99f5d6c4b9004cbb8', '草畜平衡', '2019-02-19 17:42:21', '1b96f9373a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('94979c743a3811e99f5d6c4b9004cbb8', '逐年比较模型草地长势监测', '2019-02-19 17:42:21', '2032705e3a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('98ca2b7f3a3811e99f5d6c4b9004cbb8', '距平模型草地长势监测', '2019-02-19 17:42:21', '2032705e3a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('9c55d02a3a3811e99f5d6c4b9004cbb8', '极值模型草地长势监测', '2019-02-19 17:42:21', '2032705e3a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('9d99ac523b3311e99f5d6c4b9004cbb8', '123123', '2019-02-28 16:34:10', '6d72a63e3b3311e99f5d6c4b9004cbb8', '0', '2019-02-28 17:15:49', '0', 'P', '2019-02-28 17:15:49', NULL, '123123');
INSERT INTO `product_type` VALUES ('a013370b3a3811e99f5d6c4b9004cbb8', '草地长势等级划分', '2019-02-19 17:42:21', '2032705e3a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('ad9072a13a3811e99f5d6c4b9004cbb8', '温度植被干旱指数草地旱情监测', '2019-02-19 17:42:21', '25cde2243a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('b16aa54d3a3811e99f5d6c4b9004cbb8', '植被状态指数草地旱情监测', '2019-02-19 17:42:21', '25cde2243a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('b4d9a1ab3a3811e99f5d6c4b9004cbb8', '草地旱情等级划分', '2019-02-19 17:42:21', '25cde2243a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('c08892963b3811e99f5d6c4b9004cbb8', 'CES', '2019-02-28 17:10:56', '0', '0', '2019-02-28 17:15:49', '0', 'P', '2019-02-28 17:15:49', NULL, 'CES');
INSERT INTO `product_type` VALUES ('c1fad2a83a3811e99f5d6c4b9004cbb8', '草地分区统计', '2019-02-19 17:42:21', '29a7164b3a3811e99f5d6c4b9004cbb8', '1071', '2019-02-19 17:42:28', '1071', 'A', '2019-02-19 17:42:36', 1, '1');
INSERT INTO `product_type` VALUES ('cad9afb63b3811e99f5d6c4b9004cbb8', '12312', '2019-02-28 17:11:13', 'c08892963b3811e99f5d6c4b9004cbb8', '0', '2019-02-28 17:15:49', '0', 'P', '2019-02-28 17:15:49', NULL, '3123');
