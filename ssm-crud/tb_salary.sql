/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 06/07/2023 10:17:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_salary
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary`;
CREATE TABLE `tb_salary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bonus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `card_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `final_salary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `tb_salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `tb_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_salary
-- ----------------------------
INSERT INTO `tb_salary` VALUES (1, 5, '2023.12.12', '10000', '100', '622848-0342704708110', '10100', '张三');
INSERT INTO `tb_salary` VALUES (2, 6, '2023.12.12', '4000', '100', '622848-0342704708110', '4100', '李四');
INSERT INTO `tb_salary` VALUES (3, 5, '2023.12.12', '7000', '100', '622848-0342704708110', '7100', '王五');
INSERT INTO `tb_salary` VALUES (4, 12, '2023.12.12', '10100', '100', '622848-0342704708110', '10200', '老六');
INSERT INTO `tb_salary` VALUES (5, 13, '2023.12.12', '8000', '150', '622848-0342704708110', '8150', '小明');
INSERT INTO `tb_salary` VALUES (6, 14, '2023.12.12', '9500', '150', '622848-0342704708110', '9650', '喜羊羊');
INSERT INTO `tb_salary` VALUES (7, 15, '2023.12.12', '5600', '200', '622848-0342704708110', '5800', '美羊羊');
INSERT INTO `tb_salary` VALUES (8, 16, '2023.12.12', '4800', '300', '622848-0342704708110', '5100', '懒羊羊');
INSERT INTO `tb_salary` VALUES (9, 12, '2023.12.12', '8700', '50', '622848-0342704708110', '8750', '沸羊羊');
INSERT INTO `tb_salary` VALUES (10, 17, '2023.12.12', '6900', '50', '622848-0342704708110', '6950', '灰太狼');
INSERT INTO `tb_salary` VALUES (11, 18, '2023.12.12', '6666', '0', NULL, '6666', '测试');

SET FOREIGN_KEY_CHECKS = 1;
