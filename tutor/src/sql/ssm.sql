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
# INSERT INTO `demand_publish` VALUES (1, 20, '语文', '高一', '周天', '帮我强化古诗词');
# INSERT INTO `demand_publish` VALUES (2, 21, '数学', '高二', '周一', '找数学专业的老师');
# INSERT INTO `demand_publish` VALUES (3, 22, '英语', '高三', '周二', '要求要有留学经历的老师');

-- ----------------------------
-- Records of demand_publish
-- ----------------------------
INSERT INTO `demand_publish` VALUES (1, 20, '语文', '高一', '周天', '需要一位有经验的语文老师，能帮助我提高作文水平和古诗词鉴赏能力，特别是对古诗词的韵律和意境的理解。联系电话15469784166');
INSERT INTO `demand_publish` VALUES (2, 21, '数学', '高二', '周一', '我希望找到一位擅长数学逻辑思维和几何证明的老师，能帮助我解决学习中遇到的难题。联系电话13649784566');
INSERT INTO `demand_publish` VALUES (3, 22, '英语', '高三', '周二', '寻找一位具有丰富英语教学经验的老师，能帮助我提高英语阅读和写作能力，特别是在准备高考英语方面。邮箱why@hit.edu.cn');
INSERT INTO `demand_publish` VALUES (4, 23, '物理', '高一', '周三', '希望找到一位擅长物理学的老师，能帮助我理解物理概念和解决实验题。座机84498466');
INSERT INTO `demand_publish` VALUES (5, 24, '化学', '高二', '周四', '寻找一位有化学实验经验的老师，能帮助我提高化学实验操作能力和理论知识。电话13649784566');
INSERT INTO `demand_publish` VALUES (6, 25, '生物', '高三', '周五', '希望找到一位擅长生物学的老师，能帮助我提高生物实验操作能力和理论知识。邮箱wzf@stu.hit.edu.cn');
INSERT INTO `demand_publish` VALUES (7, 26, '地理', '高一', '周六', '寻找一位擅长地理学的老师，能帮助我提高地理知识和解决地理题。电话18549874855');
INSERT INTO `demand_publish` VALUES (8, 27, '历史', '高二', '周六', '希望找到一位擅长历史学的老师，能帮助我提高历史知识和解决历史题。电话13498455111');
INSERT INTO `demand_publish` VALUES (9, 28, '政治', '高三', '周日', '寻找一位擅长政治学的老师，能帮助我提高政治知识和解决政治题。座机84591648');
INSERT INTO `demand_publish` VALUES (10, 29, '语文', '初一', '周天', '需要一位有经验的语文老师，能帮助我提高文学素养，特别是对文言文和散文的理解。座机86324598');
INSERT INTO `demand_publish` VALUES (11, 30, '数学', '初二', '周一', '我希望找到一位数学专业的女老师，能帮助我提高数学解题能力。座机84159846');
INSERT INTO `demand_publish` VALUES (12, 31, '英语', '初三', '周二', '寻找一位具有留学经历的老师，能帮助我提高英语口语。电话15984795486');
INSERT INTO `demand_publish` VALUES (13, 32, '物理', '初一', '周三', '希望找到一位物理实验能力强的老师，帮助我提高实验能力。邮箱3164978481@qq.com');
INSERT INTO `demand_publish` VALUES (14, 33, '化学', '初二', '周四', '寻找一位化学学科的老师，能帮助我提高化学解题能力。座机84987461');
INSERT INTO `demand_publish` VALUES (15, 34, '生物', '初三', '周五', '希望找到一位擅长生物学的老师，能帮助我了解生物学的基本知识并提高生物实验操作能力。电话15498746558');
INSERT INTO `demand_publish` VALUES (16, 35, '地理', '初一', '周六', '寻找一位擅长地理学的老师，能帮助我提高地理素养，为后续学习地理奠定基础。电话18498745699');
INSERT INTO `demand_publish` VALUES (17, 36, '历史', '初二', '周六', '希望找到一位擅长历史学的老师，能培养我历史学科的解题能力。座机88962564');
INSERT INTO `demand_publish` VALUES (18, 37, '政治', '初三', '周日', '寻找一位擅长政治学的老师，能帮助我提高政治素养。电话15498745699');


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
# INSERT INTO `info_publish` VALUES (1, 2, '数学', '高一', '高一数学', '星期一,星期三,星期五', '上午', '有责任心，从教5年。', '/uploads/teacher1.jpg');
# INSERT INTO `info_publish` VALUES (2, 2, '数学', '高二', '高二数学', '星期二,星期四,星期六', '上午', '有责任心，从教5年。', '/uploads/teacher2.jpg');
# INSERT INTO `info_publish` VALUES (3, 3, '语文', '高三', '高三语文', '星期一,星期三', '下午', '语文教学能手', '/uploads/teacher3.jpg');
# INSERT INTO `info_publish` VALUES (4, 5, '英语', '高三', '高三英语', '星期二,星期四', '下午', '英语教学能手', '/uploads/teacher4.jpg');
# INSERT INTO `info_publish` VALUES (5, 6, '生物', '高三', '高三生物', '星期三,星期五', '晚上', '高中生物速成', '/uploads/teacher5.jpg');


INSERT INTO `info_publish` VALUES (1, 2, '数学', '高一', '高一数学', '星期一,星期三,星期五', '上午', '我是一名有责任心的数学老师，从教多年，擅长用生动有趣的方式讲解数学概念，帮助学生提高数学成绩。', '/uploads/teacher1.jpg');
INSERT INTO `info_publish` VALUES (2, 3, '语文', '高三', '高三语文', '星期一,星期三', '下午', '我是一名有责任心的语文老师，从教多年，擅长讲解语文知识点，帮助学生提高语文成绩。', '/uploads/teacher2.jpg');
INSERT INTO `info_publish` VALUES (3, 4, '英语', '高三', '高三英语', '星期二,星期四', '下午', '我是一名有责任心的英语老师，从教多年，擅长讲解英语知识点，帮助学生提高英语成绩。', '/uploads/teacher3.jpg');
INSERT INTO `info_publish` VALUES (4, 5, '生物', '高三', '高三生物', '星期三,星期五', '晚上', '我是一名有责任心的生物老师，从教多年，擅长讲解生物知识点，帮助学生提高生物成绩。', '/uploads/teacher4.jpg');
INSERT INTO `info_publish` VALUES (5, 6, '化学', '高一', '高一化学', '星期二,星期四', '下午', '我是一名有责任心的化学老师，从教多年，擅长讲解化学知识点，帮助学生提高化学成绩。', '/uploads/teacher5.jpg');
INSERT INTO `info_publish` VALUES (6, 7, '地理', '高二', '高二地理', '星期三,星期五', '晚上', '我是一名有责任心的地理老师，从教多年，擅长讲解地理知识点，帮助学生提高地理成绩。', '/uploads/teacher6.jpg');
INSERT INTO `info_publish` VALUES (7, 8, '物理', '高三', '高三物理', '星期一,星期三,星期五', '上午', '我是一名有责任心的物理老师，从教多年，擅长讲解物理知识点，帮助学生提高物理成绩。', '/uploads/teacher7.jpg');
INSERT INTO `info_publish` VALUES (8, 9, '历史', '高一', '高一历史', '星期二,星期四', '下午', '我是一名有责任心的历史老师，从教多年，擅长讲解历史知识点，帮助学生提高历史成绩。', '/uploads/teacher8.jpg');
INSERT INTO `info_publish` VALUES (9, 10, '政治', '高二', '高二政治', '星期三,星期五', '晚上', '我是一名有责任心的政治老师，从教多年，擅长讲解政治知识点，帮助学生提高政治成绩。', '/uploads/teacher9.jpg');
INSERT INTO `info_publish` VALUES (10, 11, '英语', '高三', '高三英语', '星期二,星期四', '下午', '我是一名有责任心的英语老师，从教多年，擅长讲解英语知识点，帮助学生提高英语成绩。', '/uploads/teacher10.jpg');
INSERT INTO `info_publish` VALUES (11, 12, '数学', '高一', '高一数学', '星期一,星期三,星期五', '上午', '我是一名有责任心的数学老师，从教多年，擅长用生动有趣的方式讲解数学概念，帮助学生提高数学成绩。', '/uploads/teacher1.jpg');
INSERT INTO `info_publish` VALUES (12, 13, '语文', '高三', '高三语文', '星期一,星期三', '下午', '我是一名有责任心的语文老师，从教多年，擅长讲解语文知识点，帮助学生提高语文成绩。', '/uploads/teacher2.jpg');
INSERT INTO `info_publish` VALUES (13, 14, '生物', '高三', '高三生物', '星期三,星期五', '晚上', '我是一名有责任心的生物老师，从教多年，擅长讲解生物知识点，帮助学生提高生物成绩。', '/uploads/teacher3.jpg');
INSERT INTO `info_publish` VALUES (14, 15, '化学', '高一', '高一化学', '星期二,星期四', '下午', '我是一名有责任心的化学老师，从教多年，擅长讲解化学知识点，帮助学生提高化学成绩。', '/uploads/teacher4.jpg');
INSERT INTO `info_publish` VALUES (15, 16, '地理', '高二', '高二地理', '星期三,星期五', '晚上', '我是一名有责任心的地理老师，从教多年，擅长讲解地理知识点，帮助学生提高地理成绩。', '/uploads/teacher5.jpg');
INSERT INTO `info_publish` VALUES (16, 17, '物理', '高三', '高三物理', '星期一,星期三,星期五', '上午', '我是一名有责任心的物理老师，从教多年，擅长讲解物理知识点，帮助学生提高物理成绩。', '/uploads/teacher6.jpg');
INSERT INTO `info_publish` VALUES (17, 18, '历史', '高一', '高一历史', '星期二,星期四', '下午', '我是一名有责任心的历史老师，从教多年，擅长讲解历史知识点，帮助学生提高历史成绩。', '/uploads/teacher7.jpg');
INSERT INTO `info_publish` VALUES (18, 19, '政治', '高二', '高二政治', '星期三,星期五', '晚上', '我是一名有责任心的政治老师，从教多年，擅长讲解政治知识点，帮助学生提高政治成绩。', '/uploads/teacher8.jpg');


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

# -- ----------------------------
# -- Records of user
# -- ----------------------------
# INSERT INTO `user` VALUES (1, 'admin', '教学管理员', '123', 18, 1, '15946284922', 0, 'Y');
# INSERT INTO `user` VALUES (2, 'zhangsan', '张三', '123456', 22, 1, '15529782988', 1, 'Y');
# INSERT INTO `user` VALUES (3, 'user1', '章三', 'password1', 25, 1, '13800138000', 1, 'Y');
# INSERT INTO `user` VALUES (4, 'user2', '李四', 'password2', 30, 0, '13900139000', 2, 'Y');
# INSERT INTO `user` VALUES (5, 'user3', '王五', 'password3', 22, 1, '13700137000', 1, 'Y');
# INSERT INTO `user` VALUES (6, 'user4', '赵六', 'password4', 35, 0, '13600136000', 1, 'Y');
# INSERT INTO `user` VALUES (7, 'user5', '孙七', 'password5', 28, 1, '13500135000', 2, 'Y');
# INSERT INTO `user` VALUES (8, 'user6', '周八', 'password6', 29, 0, '13400134000', 2, 'Y');
# INSERT INTO `user` VALUES (9, 'user7', '吴九', 'password7', 33, 1, '13300133000', 1, 'Y');
# INSERT INTO `user` VALUES (10, 'user8', '郑十', 'password8', 24, 0, '13200132000', 2, 'Y');
# INSERT INTO `user` VALUES (11, 'user9', '陈十一', 'password9', 31, 1, '13100131000', 2, 'Y');
# INSERT INTO `user` VALUES (12, 'user10', '钱十二', 'password10', 27, 0, '13000130000', 2, 'Y');
# INSERT INTO `user` VALUES (13, 'boboppp', '波波', '123456', 24, 1, '18898899988', 2, 'Y');

INSERT INTO `user` VALUES (1, 'admin', '教学管理员', '123', 18, 1, '15946284922', 0, 'Y');
INSERT INTO `user` VALUES (2, 'user2', '张三', 'password2', 22, 1, '15529782988', 1, 'Y');
INSERT INTO `user` VALUES (3, 'user3', '李四', 'password3', 30, 1, '13900139000', 1, 'Y');
INSERT INTO `user` VALUES (4, 'user4', '王五', 'password4', 22, 1, '13700137000', 1, 'Y');
INSERT INTO `user` VALUES (5, 'user5', '赵六', 'password5', 35, 0, '13600136000', 1, 'Y');
INSERT INTO `user` VALUES (6, 'user6', '孙七', 'password6', 28, 0, '13500135000', 1, 'Y');
INSERT INTO `user` VALUES (7, 'user7', '周八', 'password7', 29, 1, '13400134000', 1, 'Y');
INSERT INTO `user` VALUES (8, 'user8', '吴九', 'password8', 33, 0, '13300133000', 1, 'Y');
INSERT INTO `user` VALUES (9, 'user9', '郑十', 'password9', 24, 0, '13200132000', 1, 'Y');
INSERT INTO `user` VALUES (10, 'user10', '陈十一', 'password10', 31, 1, '13100131000', 1, 'Y');
INSERT INTO `user` VALUES (11, 'user11', '钱十二', 'password12', 27, 0, '13000130000', 1, 'Y');
INSERT INTO `user` VALUES (12, 'user12', '用户十二', 'password12', 26, 0, '18698699966', 1, 'Y');
INSERT INTO `user` VALUES (13, 'user13', '用户十三', 'password13', 32, 1, '18598599955', 1, 'Y');
INSERT INTO `user` VALUES (14, 'user14', '用户十四', 'password14', 21, 0, '18498499944', 1, 'Y');
INSERT INTO `user` VALUES (15, 'user15', '用户十五', 'password15', 34, 1, '18398399933', 1, 'Y');
INSERT INTO `user` VALUES (16, 'user16', '用户十六', 'password16', 29, 0, '18298299922', 1, 'Y');
INSERT INTO `user` VALUES (17, 'user17', '用户十七', 'password17', 36, 1, '18198199911', 1, 'Y');
INSERT INTO `user` VALUES (18, 'user18', '用户十八', 'password18', 25, 0, '18098099900', 1, 'Y');
INSERT INTO `user` VALUES (19, 'user19', '用户十九', 'password19', 33, 1, '17998999888', 1, 'Y');
INSERT INTO `user` VALUES (20, 'user20', '用户二十', 'password20', 22, 0, '17898899877', 2, 'Y');
INSERT INTO `user` VALUES (21, 'user21', '用户二十一', 'password21', 31, 0, '17798799866', 2, 'Y');
INSERT INTO `user` VALUES (22, 'user22', '用户二十二', 'password22', 28, 0, '17698699855', 2, 'Y');
INSERT INTO `user` VALUES (23, 'user23', '用户二十三', 'password23', 35, 1, '17598599844', 2, 'Y');
INSERT INTO `user` VALUES (24, 'user24', '用户二十四', 'password24', 27, 0, '17498499833', 2, 'Y');
INSERT INTO `user` VALUES (25, 'user25', '用户二十五', 'password25', 34, 1, '17398399822', 2, 'Y');
INSERT INTO `user` VALUES (26, 'user26', '用户二十六', 'password26', 22, 1, '17298299811', 2, 'Y');
INSERT INTO `user` VALUES (27, 'user27', '用户二十七', 'password27', 31, 1, '17198199800', 2, 'Y');
INSERT INTO `user` VALUES (28, 'user28', '用户二十八', 'password28', 28, 0, '17098099799', 2, 'Y');
INSERT INTO `user` VALUES (29, 'user29', '用户二十九', 'password29', 35, 1, '16998999788', 2, 'Y');
INSERT INTO `user` VALUES (30, 'user30', '用户三十', 'password30', 27, 0, '16898899777', 2, 'Y');
INSERT INTO `user` VALUES (31, 'user31', '用户三十一', 'password31', 34, 1, '16798799766', 2, 'Y');
INSERT INTO `user` VALUES (32, 'user32', '用户三十二', 'password32', 23, 0, '16698699755', 2, 'Y');
INSERT INTO `user` VALUES (33, 'user33', '用户三十三', 'password33', 32, 1, '16598599744', 2, 'Y');
INSERT INTO `user` VALUES (34, 'user34', '用户三十四', 'password34', 29, 1, '16498499733', 2, 'Y');
INSERT INTO `user` VALUES (35, 'user35', '用户三十五', 'password35', 36, 1, '16398399722', 2, 'Y');
INSERT INTO `user` VALUES (36, 'user36', '用户三十六', 'password36', 22, 0, '16298299711', 2, 'Y');
INSERT INTO `user` VALUES (37, 'user37', '用户三十七', 'password37', 31, 1, '16198199700', 2, 'Y');


SET FOREIGN_KEY_CHECKS = 1;
