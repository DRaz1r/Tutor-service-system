/*
 Navicat Premium Data Transfer

 Source Server         : 本地Mysql
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 20/06/2024 23:28:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demand_publish
-- ----------------------------
DROP TABLE IF EXISTS `demand_publish`;
CREATE TABLE `demand_publish`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户ID，关联用户ID',
  `subjects` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科目',
  `grades` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级',
  `available_times` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  `requirement` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '家教需求，针对学生',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `demand_publish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demand_publish
-- ----------------------------
INSERT INTO `demand_publish` VALUES (1, 11, '语文', '高一', '周天', '帮我强化古诗词');
INSERT INTO `demand_publish` VALUES (2, 4, '数学', '高二', '周一', '找数学专业的老师');
INSERT INTO `demand_publish` VALUES (3, 7, '英语', '高三', '周二', '要求要有留学经历的老师');

-- ----------------------------
-- Table structure for info_publish
-- ----------------------------
DROP TABLE IF EXISTS `info_publish`;
CREATE TABLE `info_publish`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户ID，关联用户ID',
  `subjects` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科目',
  `grades` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `days` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '星期几',
  `periods` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间段',
  `introduction` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '个人简介或其他信息',
  `image_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `info_publish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info_publish
-- ----------------------------
INSERT INTO `info_publish` VALUES (1, 2, '数学', '高一', '高一数学', '星期一,星期三,星期五', '上午', '有责任心，从教5年。', '/uploads/1717848365924_OIP.jpg');
INSERT INTO `info_publish` VALUES (2, 2, '数学', '高二', '高二数学', '星期二,星期四,星期六', '上午', '有责任心，从教5年。', '/uploads/1717848365924_OIP.jpg');
INSERT INTO `info_publish` VALUES (3, 3, '语文', '高三', '高三语文', '星期一,星期三', '下午', '语文教学能手', '/uploads/1717848365924_OIP.jpg');
INSERT INTO `info_publish` VALUES (4, 5, '英语', '高三', '高三英语', '星期二,星期四', '下午', '英语教学能手', '/uploads/1717848365924_OIP.jpg');
INSERT INTO `info_publish` VALUES (5, 6, '生物', '高三', '高三生物', '星期三,星期五', '晚上', '高中生物速成', '/uploads/1717848365924_OIP.jpg');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL,
  `menuCode` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `menuLevel` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单级别',
  `menuParentCode` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单的父code',
  `menuClick` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '点击触发的函数',
  `menuRight` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限 0超级管理员，1表示老师，2表示学生，可以用逗号组合使用',
  `menuComponent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `menuIcon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '001', '教师管理', '1', NULL, 'Teacher', '0', 'TeacherManage', 'el-icon-s-custom');
INSERT INTO `menu` VALUES (2, '002', '学生管理', '1', NULL, 'User', '0', 'UserManage', 'el-icon-user-solid');
INSERT INTO `menu` VALUES (3, '003', '家教信息', '1', NULL, 'InfoPublish', '0,1,2', 'InfoPublishManage', 'el-icon-takeaway-box');
INSERT INTO `menu` VALUES (4, '004', '学生信息', '1', NULL, 'DemandPublish', '0,1,2', 'DemandPublishManage', 'el-icon-takeaway-box');
INSERT INTO `menu` VALUES (5, '005', '评价反馈', '1', NULL, 'Review', '0,1,2', 'ReviewManage', 'el-icon-office-building');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评价人',
  `remark` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, 'why', '系统简洁易用，赞！');
INSERT INTO `review` VALUES (2, '张三', '太棒了！');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名字',
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `age` int NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role_id` int NULL DEFAULT NULL COMMENT '角色 0超级管理员，1老师，2学生',
  `isValid` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'Y' COMMENT '是否有效，Y有效，其他无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '教学管理员', '123', 18, 1, '15946284922', 0, 'Y');
INSERT INTO `user` VALUES (2, 'zhangsan', '张三', '123456', 22, 1, '15529782988', 1, 'Y');
INSERT INTO `user` VALUES (3, 'user1', '章三', 'password1', 25, 1, '13800138000', 1, 'Y');
INSERT INTO `user` VALUES (4, 'user2', '李四', 'password2', 30, 0, '13900139000', 2, 'Y');
INSERT INTO `user` VALUES (5, 'user3', '王五', 'password3', 22, 1, '13700137000', 1, 'Y');
INSERT INTO `user` VALUES (6, 'user4', '赵六', 'password4', 35, 0, '13600136000', 1, 'Y');
INSERT INTO `user` VALUES (7, 'user5', '孙七', 'password5', 28, 1, '13500135000', 2, 'Y');
INSERT INTO `user` VALUES (8, 'user6', '周八', 'password6', 29, 0, '13400134000', 2, 'Y');
INSERT INTO `user` VALUES (9, 'user7', '吴九', 'password7', 33, 1, '13300133000', 1, 'Y');
INSERT INTO `user` VALUES (10, 'user8', '郑十', 'password8', 24, 0, '13200132000', 2, 'Y');
INSERT INTO `user` VALUES (11, 'user9', '陈十一', 'password9', 31, 1, '13100131000', 2, 'Y');
INSERT INTO `user` VALUES (12, 'user10', '钱十二', 'password10', 27, 0, '13000130000', 2, 'Y');
INSERT INTO `user` VALUES (13, 'boboppp', '波波', '123456', 24, 1, '18898899988', 2, 'Y');

SET FOREIGN_KEY_CHECKS = 1;
