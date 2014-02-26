/*
Navicat MySQL Data Transfer

Source Server         : root@localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : waretech_grandt

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2009-11-16 13:09:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', 'Primera A');
INSERT INTO `category` VALUES ('2', '0', 'Nacional B');

-- ----------------------------
-- Table structure for `club`
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Club_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of club
-- ----------------------------
INSERT INTO `club` VALUES ('27', '0', 'Vélez Sarsfield');
INSERT INTO `club` VALUES ('28', '0', 'San Lorenzo');
INSERT INTO `club` VALUES ('29', '0', 'River Plate');
INSERT INTO `club` VALUES ('30', '0', 'Newell\'s Old Boys');
INSERT INTO `club` VALUES ('31', '0', 'Lanús');
INSERT INTO `club` VALUES ('32', '0', 'Huracán');
INSERT INTO `club` VALUES ('33', '0', 'Estudiantes (La Plata)');
INSERT INTO `club` VALUES ('34', '0', 'Colón (Santa Fé)');
INSERT INTO `club` VALUES ('35', '0', 'Boca Jrs.');
INSERT INTO `club` VALUES ('36', '0', 'Tigre');
INSERT INTO `club` VALUES ('37', '0', 'Rosario Central');
INSERT INTO `club` VALUES ('38', '0', 'Racing Club');
INSERT INTO `club` VALUES ('39', '0', 'Independiente');
INSERT INTO `club` VALUES ('40', '0', 'Godoy Cruz (Mendoza)');
INSERT INTO `club` VALUES ('41', '0', 'Gimnasia y Esgrima (La Plata)');
INSERT INTO `club` VALUES ('42', '0', 'Chacarita Jrs.');
INSERT INTO `club` VALUES ('43', '0', 'Banfield');
INSERT INTO `club` VALUES ('44', '0', 'Atletico Tucumán');
INSERT INTO `club` VALUES ('45', '0', 'Arsenal');
INSERT INTO `club` VALUES ('46', '0', 'Argentinos Jrs.');

-- ----------------------------
-- Table structure for `match_`
-- ----------------------------
DROP TABLE IF EXISTS `match_`;
CREATE TABLE `match_` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `week` bigint(20) NOT NULL,
  `homeClub` bigint(20) NOT NULL,
  `awayClub` bigint(20) NOT NULL,
  `homeGoals` int(11) default NULL,
  `awayGoals` int(11) default NULL,
  `date` date default NULL,
  `time` time default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Match_week` (`week`),
  KEY `FK_Match_homeClub` (`homeClub`),
  KEY `FK_Match_awayClub` (`awayClub`),
  CONSTRAINT `FK_Match_awayClub` FOREIGN KEY (`awayClub`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Match_homeClub` FOREIGN KEY (`homeClub`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Match_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of match_
-- ----------------------------
INSERT INTO `match_` VALUES ('1', '0', '1', '41', '40', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('2', '0', '1', '39', '30', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('3', '0', '1', '28', '44', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('4', '0', '1', '42', '36', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('5', '0', '1', '45', '33', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('6', '0', '1', '37', '38', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('7', '0', '1', '32', '31', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('8', '0', '1', '35', '46', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('9', '0', '1', '43', '29', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('10', '0', '1', '34', '27', null, null, '2009-08-16', null);
INSERT INTO `match_` VALUES ('11', '0', '2', '38', '34', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('12', '0', '2', '36', '37', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('13', '0', '2', '29', '42', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('14', '0', '2', '46', '43', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('15', '0', '2', '31', '35', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('16', '0', '2', '30', '32', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('17', '0', '2', '44', '39', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('18', '0', '2', '40', '28', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('19', '0', '2', '33', '41', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('20', '0', '2', '27', '45', null, null, '2009-08-23', null);
INSERT INTO `match_` VALUES ('21', '0', '3', '39', '40', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('22', '0', '3', '32', '44', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('23', '0', '3', '35', '30', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('24', '0', '3', '46', '31', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('25', '0', '3', '43', '42', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('26', '0', '3', '37', '29', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('27', '0', '3', '34', '36', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('28', '0', '3', '45', '38', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('29', '0', '3', '41', '27', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('30', '0', '3', '28', '33', null, null, '2009-08-30', null);
INSERT INTO `match_` VALUES ('31', '0', '4', '38', '41', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('32', '0', '4', '36', '45', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('33', '0', '4', '29', '34', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('34', '0', '4', '42', '37', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('35', '0', '4', '31', '43', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('36', '0', '4', '30', '46', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('37', '0', '4', '44', '35', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('38', '0', '4', '40', '32', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('39', '0', '4', '33', '39', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('40', '0', '4', '27', '28', null, null, '2009-09-02', null);
INSERT INTO `match_` VALUES ('41', '0', '5', '39', '27', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('42', '0', '5', '32', '33', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('43', '0', '5', '35', '40', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('44', '0', '5', '46', '44', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('45', '0', '5', '31', '30', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('46', '0', '5', '37', '43', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('47', '0', '5', '34', '42', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('48', '0', '5', '45', '29', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('49', '0', '5', '41', '36', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('50', '0', '5', '28', '38', null, null, '2009-09-13', null);
INSERT INTO `match_` VALUES ('51', '0', '6', '38', '39', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('52', '0', '6', '36', '28', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('53', '0', '6', '29', '41', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('54', '0', '6', '42', '45', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('55', '0', '6', '43', '30', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('56', '0', '6', '37', '34', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('57', '0', '6', '44', '31', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('58', '0', '6', '40', '46', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('59', '0', '6', '33', '35', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('60', '0', '6', '27', '32', null, null, '2009-09-20', null);
INSERT INTO `match_` VALUES ('61', '0', '7', '39', '36', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('62', '0', '7', '32', '38', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('63', '0', '7', '35', '27', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('64', '0', '7', '46', '33', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('65', '0', '7', '31', '40', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('66', '0', '7', '30', '44', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('67', '0', '7', '34', '43', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('68', '0', '7', '45', '37', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('69', '0', '7', '41', '42', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('70', '0', '7', '28', '29', null, null, '2009-09-27', null);
INSERT INTO `match_` VALUES ('71', '0', '8', '38', '35', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('72', '0', '8', '36', '32', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('73', '0', '8', '29', '39', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('74', '0', '8', '42', '28', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('75', '0', '8', '43', '44', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('76', '0', '8', '37', '41', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('77', '0', '8', '34', '45', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('78', '0', '8', '40', '30', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('79', '0', '8', '33', '31', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('80', '0', '8', '27', '46', null, null, '2009-10-04', null);
INSERT INTO `match_` VALUES ('81', '0', '9', '39', '42', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('82', '0', '9', '32', '29', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('83', '0', '9', '35', '36', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('84', '0', '9', '46', '38', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('85', '0', '9', '31', '27', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('86', '0', '9', '30', '33', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('87', '0', '9', '44', '40', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('88', '0', '9', '45', '43', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('89', '0', '9', '41', '34', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('90', '0', '9', '28', '28', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('91', '0', '9', '37', '37', null, null, '2009-10-07', null);
INSERT INTO `match_` VALUES ('92', '0', '10', '38', '31', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('93', '0', '10', '36', '46', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('94', '0', '10', '29', '35', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('95', '0', '10', '42', '32', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('96', '0', '10', '43', '40', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('97', '0', '10', '37', '39', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('98', '0', '10', '34', '28', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('99', '0', '10', '45', '41', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('100', '0', '10', '33', '44', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('101', '0', '10', '27', '30', null, null, '2009-10-18', null);
INSERT INTO `match_` VALUES ('102', '0', '11', '39', '34', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('103', '0', '11', '32', '37', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('104', '0', '11', '35', '42', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('105', '0', '11', '46', '29', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('106', '0', '11', '31', '36', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('107', '0', '11', '30', '38', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('108', '0', '11', '44', '27', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('109', '0', '11', '40', '33', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('110', '0', '11', '41', '43', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('111', '0', '11', '28', '45', null, null, '2009-10-25', null);
INSERT INTO `match_` VALUES ('112', '1', '12', '38', '44', '4', '0', '2009-10-28', null);
INSERT INTO `match_` VALUES ('113', '6', '12', '36', '30', '1', '2', '2009-10-28', null);
INSERT INTO `match_` VALUES ('114', '3', '12', '29', '31', '0', '1', '2009-10-28', null);
INSERT INTO `match_` VALUES ('115', '2', '12', '42', '46', '2', '2', '2009-10-28', null);
INSERT INTO `match_` VALUES ('116', '3', '12', '43', '33', '2', '1', '2009-10-28', null);
INSERT INTO `match_` VALUES ('117', '3', '12', '37', '35', '2', '1', '2009-10-28', null);
INSERT INTO `match_` VALUES ('118', '2', '12', '34', '32', '3', '0', '2009-10-28', null);
INSERT INTO `match_` VALUES ('119', '1', '12', '45', '39', '1', '0', '2009-10-28', null);
INSERT INTO `match_` VALUES ('120', '1', '12', '41', '28', '2', '2', '2009-10-28', null);
INSERT INTO `match_` VALUES ('121', '2', '12', '27', '40', '2', '0', '2009-10-28', null);
INSERT INTO `match_` VALUES ('122', '2', '13', '39', '41', '1', '0', '2009-11-01', null);
INSERT INTO `match_` VALUES ('123', '2', '13', '32', '45', '1', '1', '2009-11-01', null);
INSERT INTO `match_` VALUES ('124', '2', '13', '35', '34', '0', '0', '2009-11-01', null);
INSERT INTO `match_` VALUES ('125', '4', '13', '46', '37', '1', '1', '2009-11-01', null);
INSERT INTO `match_` VALUES ('126', '2', '13', '31', '42', '0', '3', '2009-11-01', null);
INSERT INTO `match_` VALUES ('127', '2', '13', '30', '29', '2', '1', '2009-11-01', null);
INSERT INTO `match_` VALUES ('128', '3', '13', '44', '36', '4', '2', '2009-11-01', null);
INSERT INTO `match_` VALUES ('129', '3', '13', '40', '38', '3', '1', '2009-11-01', null);
INSERT INTO `match_` VALUES ('130', '3', '13', '33', '27', '3', '0', '2009-11-01', null);
INSERT INTO `match_` VALUES ('131', '4', '13', '28', '43', '0', '1', '2009-11-01', null);
INSERT INTO `match_` VALUES ('132', '0', '14', '38', '33', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('133', '0', '14', '36', '40', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('134', '0', '14', '29', '44', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('135', '0', '14', '42', '30', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('136', '0', '14', '43', '27', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('137', '0', '14', '37', '31', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('138', '0', '14', '34', '46', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('139', '0', '14', '45', '35', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('140', '0', '14', '41', '32', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('141', '0', '14', '28', '39', null, null, '2009-11-08', null);
INSERT INTO `match_` VALUES ('142', '0', '15', '39', '43', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('143', '0', '15', '32', '28', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('144', '0', '15', '35', '41', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('145', '0', '15', '46', '45', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('146', '0', '15', '31', '34', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('147', '0', '15', '30', '37', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('148', '0', '15', '44', '42', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('149', '0', '15', '40', '29', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('150', '0', '15', '33', '36', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('151', '0', '15', '27', '38', null, null, '2009-11-15', null);
INSERT INTO `match_` VALUES ('152', '0', '16', '39', '32', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('153', '0', '16', '36', '27', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('154', '0', '16', '29', '33', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('155', '0', '16', '42', '40', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('156', '0', '16', '43', '38', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('157', '0', '16', '37', '44', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('158', '0', '16', '34', '30', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('159', '0', '16', '45', '31', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('160', '0', '16', '41', '46', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('161', '0', '16', '28', '35', null, null, '2009-11-22', null);
INSERT INTO `match_` VALUES ('162', '0', '17', '38', '36', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('163', '0', '17', '32', '43', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('164', '0', '17', '35', '39', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('165', '0', '17', '46', '28', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('166', '0', '17', '31', '41', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('167', '0', '17', '30', '45', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('168', '0', '17', '44', '34', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('169', '0', '17', '40', '37', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('170', '0', '17', '33', '42', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('171', '0', '17', '27', '29', null, null, '2009-11-29', null);
INSERT INTO `match_` VALUES ('172', '0', '18', '39', '46', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('173', '0', '18', '32', '35', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('174', '0', '18', '29', '38', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('175', '0', '18', '42', '27', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('176', '0', '18', '43', '36', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('177', '0', '18', '37', '33', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('178', '0', '18', '34', '40', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('179', '0', '18', '45', '44', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('180', '0', '18', '41', '30', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('181', '0', '18', '28', '31', null, null, '2009-12-06', null);
INSERT INTO `match_` VALUES ('182', '0', '19', '38', '42', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('183', '0', '19', '36', '29', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('184', '0', '19', '35', '43', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('185', '0', '19', '46', '32', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('186', '0', '19', '31', '39', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('187', '0', '19', '30', '28', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('188', '0', '19', '44', '41', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('189', '0', '19', '40', '45', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('190', '0', '19', '33', '34', null, null, '2009-12-13', null);
INSERT INTO `match_` VALUES ('191', '0', '19', '27', '37', null, null, '2009-12-13', null);

-- ----------------------------
-- Table structure for `player`
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `number` int(2) default NULL,
  `club` bigint(20) NOT NULL,
  `position` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `selected` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_Player_club` (`club`),
  KEY `FK_Player_position` (`position`),
  CONSTRAINT `FK_Player_club` FOREIGN KEY (`club`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Player_position` FOREIGN KEY (`position`) REFERENCES `playerposition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('1', '0', 'Maximiliano', 'Moralez', null, '27', '3', '3', '1');
INSERT INTO `player` VALUES ('2', '0', 'Hernán', 'López', null, '27', '4', '3', '0');
INSERT INTO `player` VALUES ('3', '0', 'Nicolás', 'Otamendi', null, '27', '2', '3', '1');
INSERT INTO `player` VALUES ('4', '0', 'Sebastián', 'Domínguez', null, '27', '2', '3', '0');
INSERT INTO `player` VALUES ('5', '0', 'Leandro', 'Somoza', null, '27', '3', '3', '0');
INSERT INTO `player` VALUES ('6', '0', 'Leandro', 'Romagnoli', null, '28', '3', '3', '1');
INSERT INTO `player` VALUES ('7', '0', 'Alejandro', 'Gómez', null, '28', '3', '3', '0');
INSERT INTO `player` VALUES ('8', '0', 'Marcelo', 'Gallardo', null, '29', '3', '3', '0');
INSERT INTO `player` VALUES ('9', '0', 'Ariel', 'Ortega', null, '29', '4', '3', '1');
INSERT INTO `player` VALUES ('10', '0', 'Diego', 'Buonanotte', null, '29', '3', '3', '0');
INSERT INTO `player` VALUES ('11', '0', 'Rolando', 'Schiavi', null, '30', '2', '3', '0');
INSERT INTO `player` VALUES ('12', '0', 'Sebastián', 'Blanco', null, '31', '3', '3', '0');
INSERT INTO `player` VALUES ('13', '0', 'Eduardo', 'Salvio', null, '31', '3', '3', '1');
INSERT INTO `player` VALUES ('14', '0', 'Mario', 'Bolatti', null, '32', '3', '3', '1');
INSERT INTO `player` VALUES ('15', '0', 'Juan Sebastián', 'Verón', null, '33', '3', '3', '1');
INSERT INTO `player` VALUES ('16', '0', 'Mauro', 'Boselli', null, '33', '4', '3', '1');
INSERT INTO `player` VALUES ('17', '0', 'Enzo', 'Pérez', null, '33', '3', '2', '1');
INSERT INTO `player` VALUES ('18', '0', 'Esteban', 'Fuertes', null, '34', '4', '3', '1');
INSERT INTO `player` VALUES ('19', '0', 'Martín', 'Palermo', null, '35', '4', '3', '0');
INSERT INTO `player` VALUES ('20', '0', 'Juan Román', 'Riquelme', null, '35', '3', '3', '1');
INSERT INTO `player` VALUES ('21', '0', 'Sebastián', 'Battaglia', null, '35', '3', '3', '1');
INSERT INTO `player` VALUES ('22', '0', 'Federico', 'Insúa', null, '35', '3', '3', '0');
INSERT INTO `player` VALUES ('23', '0', 'Víctor', 'Zapata', null, '27', '3', '2', '1');
INSERT INTO `player` VALUES ('24', '0', 'Germán', 'Montoya', null, '27', '1', '3', '0');
INSERT INTO `player` VALUES ('25', '0', 'Leandro', 'Caruso', null, '27', '4', '2', '1');
INSERT INTO `player` VALUES ('26', '0', 'Emiliano', 'Papa', null, '27', '2', '2', '1');
INSERT INTO `player` VALUES ('27', '0', 'Fabián', 'Cubero', null, '27', '3', '2', '1');
INSERT INTO `player` VALUES ('28', '0', 'Jonathan', 'Cristaldo', null, '27', '4', '2', '0');
INSERT INTO `player` VALUES ('29', '0', 'Waldo', 'Ponce', null, '27', '2', '2', '0');
INSERT INTO `player` VALUES ('30', '0', 'Juan M.', 'Martínez', null, '27', '4', '2', '0');
INSERT INTO `player` VALUES ('31', '0', 'Rolando', 'Zárate', null, '27', '4', '2', '0');
INSERT INTO `player` VALUES ('32', '0', 'Pablo', 'Lima', null, '27', '2', '1', '0');
INSERT INTO `player` VALUES ('33', '0', 'Franco', 'Razzotti', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('34', '0', 'Nicolás', 'Cabrera', null, '27', '3', '2', '0');
INSERT INTO `player` VALUES ('35', '0', 'Marcelo', 'Barovero', null, '27', '1', '2', '0');
INSERT INTO `player` VALUES ('36', '0', 'Leandro', 'Velázquez', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('37', '0', 'Gastón', 'Díaz', null, '27', '2', '1', '0');
INSERT INTO `player` VALUES ('38', '0', 'Leandro', 'Coronel', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('39', '0', 'Alejandro', 'Cabral', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('40', '0', 'Fernando', 'Tobio', null, '27', '2', '1', '0');
INSERT INTO `player` VALUES ('41', '0', 'Iván', 'Bella', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('42', '0', 'Marco', 'Torsiglieri', null, '27', '2', '1', '0');
INSERT INTO `player` VALUES ('43', '0', 'Javier', 'Robles', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('44', '0', 'Andrés', 'Guzmán', null, '27', '4', '1', '0');
INSERT INTO `player` VALUES ('45', '0', 'Pablo', 'Despósito', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('46', '0', 'Maximiliano', 'Timpanaro', null, '27', '4', '1', '0');
INSERT INTO `player` VALUES ('47', '0', 'Ezequiel', 'Cacace', null, '27', '1', '1', '0');
INSERT INTO `player` VALUES ('48', '0', 'Ricardo', 'Alvarez', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('49', '0', 'Mariano', 'Bittolo', null, '27', '2', '1', '0');
INSERT INTO `player` VALUES ('50', '0', 'Leonardo', 'Piris', null, '27', '4', '1', '0');
INSERT INTO `player` VALUES ('51', '0', 'Luciano', 'Cigno', null, '27', '3', '1', '0');
INSERT INTO `player` VALUES ('52', '0', 'Martín', 'Morel', null, '36', '3', '2', '1');
INSERT INTO `player` VALUES ('53', '0', 'Carlos', 'Luna', null, '36', '4', '2', '1');
INSERT INTO `player` VALUES ('54', '0', 'Daniel', 'Islas', null, '36', '1', '2', '1');
INSERT INTO `player` VALUES ('55', '0', 'Leandro', 'Lazzaro', null, '36', '4', '2', '0');
INSERT INTO `player` VALUES ('56', '0', 'Matías', 'Giménez', null, '36', '3', '2', '0');
INSERT INTO `player` VALUES ('57', '0', 'Diego', 'Castaño', null, '36', '3', '2', '0');
INSERT INTO `player` VALUES ('58', '0', 'Rodolfo', 'Arruabarrena', null, '36', '2', '2', '0');
INSERT INTO `player` VALUES ('59', '0', 'Julio', 'Manzur', null, '36', '2', '2', '1');
INSERT INTO `player` VALUES ('60', '0', 'José', 'Montiel', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('61', '0', 'Norberto', 'Paparatto', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('62', '0', 'Julio', 'Aguilar', null, '36', '4', '1', '0');
INSERT INTO `player` VALUES ('63', '0', 'Guillermo', 'Suárez', null, '36', '4', '1', '0');
INSERT INTO `player` VALUES ('64', '0', 'Lucas', 'Oviedo', null, '36', '3', '1', '1');
INSERT INTO `player` VALUES ('65', '0', 'Ramiro', 'Leone', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('66', '0', 'Cristian', 'Bardaro', null, '36', '4', '1', '0');
INSERT INTO `player` VALUES ('67', '0', 'Damián', 'Leyes', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('68', '0', 'José Ignacio', 'San Román', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('69', '0', 'Jonathan', 'Blanco', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('70', '0', 'Fabio', 'Pieters', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('71', '0', 'Juan Pablo', 'Garat', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('72', '0', 'Mariano', 'Pasini', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('73', '0', 'Carlos', 'Fondacaro', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('74', '0', 'Luis', 'Ardente', null, '36', '1', '1', '0');
INSERT INTO `player` VALUES ('75', '0', 'Maximiliano', 'Oliva', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('76', '0', 'Diego', 'Ferreyra', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('77', '0', 'Gregorio', 'Abregú', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('78', '0', 'Rubén', 'Botta', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('79', '0', 'Facundo', 'Pumpido', null, '36', '4', '1', '0');
INSERT INTO `player` VALUES ('80', '0', 'Emiliano', 'Cincotta', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('81', '0', 'Lucas', 'Abud', null, '36', '1', '1', '1');
INSERT INTO `player` VALUES ('82', '0', 'Hernán', 'Castria', null, '36', '2', '1', '0');
INSERT INTO `player` VALUES ('83', '0', 'Milton', 'Blanco', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('84', '0', 'Juan Miguel', 'Maldonado', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('85', '0', 'Walter', 'Sánchez', null, '36', '3', '1', '0');
INSERT INTO `player` VALUES ('86', '0', 'Jeremías Pablo', 'Attadia', null, '36', '4', '1', '0');
INSERT INTO `player` VALUES ('87', '0', 'Pablo', 'Migliore', null, '28', '1', '2', '1');
INSERT INTO `player` VALUES ('88', '0', 'Agustín', 'Orion', null, '28', '1', '2', '0');
INSERT INTO `player` VALUES ('89', '0', 'Juan Manuel', 'Torres', null, '28', '3', '2', '0');
INSERT INTO `player` VALUES ('90', '0', 'Jonathan', 'Bottinelli', null, '28', '2', '2', '1');
INSERT INTO `player` VALUES ('91', '0', 'Cristian', 'González', null, '28', '3', '2', '0');
INSERT INTO `player` VALUES ('92', '0', 'Gastón', 'Aguirre', null, '28', '2', '2', '1');
INSERT INTO `player` VALUES ('93', '0', 'Aureliano', 'Torres', null, '28', '2', '2', '1');
INSERT INTO `player` VALUES ('94', '0', 'Diego', 'Rivero', null, '28', '3', '2', '1');
INSERT INTO `player` VALUES ('95', '0', 'Cristian', 'Leiva', null, '28', '3', '2', '0');
INSERT INTO `player` VALUES ('96', '0', 'Bernardo', 'Romeo', null, '28', '4', '2', '0');
INSERT INTO `player` VALUES ('97', '0', 'Renato', 'Civelli', null, '28', '2', '2', '0');
INSERT INTO `player` VALUES ('98', '0', 'Juan Carlos', 'Menseguez', null, '28', '4', '2', '0');
INSERT INTO `player` VALUES ('99', '0', 'Pablo', 'Pintos', null, '28', '2', '2', '1');
INSERT INTO `player` VALUES ('100', '0', 'Nicolás', 'Bianchi Arce', null, '28', '2', '2', '0');
INSERT INTO `player` VALUES ('101', '0', 'Germán', 'Voboril', null, '28', '2', '1', '0');
INSERT INTO `player` VALUES ('102', '0', 'Fabián', 'Bordagaray', null, '28', '4', '1', '0');
INSERT INTO `player` VALUES ('103', '0', 'Gustavo', 'Campagnuolo', null, '28', '1', '1', '0');
INSERT INTO `player` VALUES ('104', '0', 'Sebastián', 'Luna', null, '28', '3', '2', '0');
INSERT INTO `player` VALUES ('105', '0', 'Nereo', 'Champagne', null, '28', '1', '1', '0');
INSERT INTO `player` VALUES ('106', '0', 'Félix', 'Orode', null, '28', '4', '1', '0');
INSERT INTO `player` VALUES ('107', '0', 'Fernando', 'Meza', null, '28', '2', '1', '0');
INSERT INTO `player` VALUES ('108', '0', 'Axel', 'Juárez', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('109', '0', 'Damián', 'Martínez', null, '28', '2', '1', '0');
INSERT INTO `player` VALUES ('110', '0', 'Sebastián', 'González', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('111', '0', 'Salvador', 'Reynoso', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('112', '0', 'Bruno', 'Centeno', null, '28', '1', '1', '0');
INSERT INTO `player` VALUES ('113', '0', 'Juan Martín', 'Cadelago', null, '28', '2', '1', '0');
INSERT INTO `player` VALUES ('114', '0', 'Leonel', 'Rinaldi', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('115', '0', 'Gonzalo', 'Bazán', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('116', '0', 'Nahuel', 'De Vico', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('117', '0', 'José Luis', 'Palomino', null, '28', '2', '1', '0');
INSERT INTO `player` VALUES ('118', '0', 'Santiago', 'Prim', null, '28', '3', '1', '0');
INSERT INTO `player` VALUES ('119', '0', 'Jorge', 'Broun', null, '37', '1', '2', '1');
INSERT INTO `player` VALUES ('120', '0', 'Emilio', 'Zelaya', null, '37', '4', '2', '1');
INSERT INTO `player` VALUES ('121', '0', 'Andrés', 'Franzoia', null, '37', '4', '2', '0');
INSERT INTO `player` VALUES ('122', '0', 'Martín', 'Astudillo', null, '37', '3', '2', '0');
INSERT INTO `player` VALUES ('123', '0', 'Jesús', 'Méndez', null, '37', '3', '2', '1');
INSERT INTO `player` VALUES ('124', '0', 'Milton', 'Caraglio', null, '37', '4', '1', '0');
INSERT INTO `player` VALUES ('125', '0', 'Gonzalo', 'Choy González', null, '37', '3', '2', '0');
INSERT INTO `player` VALUES ('126', '0', 'Diego', 'Chitzoff', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('127', '0', 'Darío', 'Ocampo', null, '37', '3', '2', '0');
INSERT INTO `player` VALUES ('128', '0', 'Diego', 'Braghieri', null, '37', '2', '1', '1');
INSERT INTO `player` VALUES ('129', '0', 'Guillermo', 'Burdisso', null, '37', '2', '2', '1');
INSERT INTO `player` VALUES ('130', '0', 'Alexis', 'Danelón', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('131', '0', 'Gervasio', 'Núñez', null, '37', '3', '1', '1');
INSERT INTO `player` VALUES ('132', '0', 'Paul', 'Ambrossi', null, '37', '2', '2', '0');
INSERT INTO `player` VALUES ('133', '0', 'Ignacio', 'Bogino', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('134', '0', 'Mario', 'Paglialunga', null, '37', '3', '1', '1');
INSERT INTO `player` VALUES ('135', '0', 'Nahuel', 'Valentini', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('136', '0', 'Hernán', 'Galíndez', null, '37', '1', '1', '1');
INSERT INTO `player` VALUES ('137', '0', 'Jonatan', 'Gómez', null, '37', '4', '1', '0');
INSERT INTO `player` VALUES ('138', '0', 'Abel', 'Espinosa', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('139', '0', 'Lucas', 'Moya', null, '37', '3', '1', '0');
INSERT INTO `player` VALUES ('140', '0', 'Leandro', 'Gurrieri', null, '37', '4', '1', '0');
INSERT INTO `player` VALUES ('141', '0', 'Gonzalo', 'Castillejos', null, '37', '4', '1', '1');
INSERT INTO `player` VALUES ('142', '0', 'Santiago', 'García', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('143', '0', 'Ignacio', 'Calcaterra', null, '37', '3', '1', '0');
INSERT INTO `player` VALUES ('144', '0', 'Manuel', 'García', null, '37', '1', '1', '0');
INSERT INTO `player` VALUES ('145', '0', 'Facundo', 'Lupardo', null, '37', '1', '1', '0');
INSERT INTO `player` VALUES ('146', '0', 'Rafael', 'Delgado', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('147', '0', 'Cristian', 'Godoy', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('148', '0', 'Cristian', 'Paz', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('149', '0', 'Mario', 'Vallejo', null, '37', '2', '1', '0');
INSERT INTO `player` VALUES ('150', '0', 'Matías', 'Ballini', null, '37', '3', '1', '0');
INSERT INTO `player` VALUES ('151', '0', 'Milton', 'Zárate', null, '37', '3', '1', '0');
INSERT INTO `player` VALUES ('152', '0', 'Martín', 'Rivero', null, '37', '3', '1', '0');
INSERT INTO `player` VALUES ('153', '0', 'Emanuel', 'Serra', null, '37', '4', '1', '0');
INSERT INTO `player` VALUES ('154', '0', 'Cristian', 'Fabbiani', null, '29', '4', '2', '0');
INSERT INTO `player` VALUES ('155', '0', 'Paulo', 'Ferrari', null, '29', '2', '2', '1');
INSERT INTO `player` VALUES ('156', '0', 'Patricio', 'Toranzo', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('157', '0', 'Matías', 'Abelairas', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('158', '0', 'Mauro', 'Rosales', null, '29', '4', '2', '0');
INSERT INTO `player` VALUES ('159', '0', 'Nicolás', 'Navarro', null, '29', '1', '2', '0');
INSERT INTO `player` VALUES ('160', '0', 'Mario Daniel', 'Vega', null, '29', '1', '2', '0');
INSERT INTO `player` VALUES ('161', '0', 'Gustavo', 'Cabral', null, '29', '2', '2', '0');
INSERT INTO `player` VALUES ('162', '0', 'Facundo', 'Quiroga', null, '29', '2', '2', '0');
INSERT INTO `player` VALUES ('163', '0', 'Nicolás', 'Sánchez', null, '29', '2', '2', '0');
INSERT INTO `player` VALUES ('164', '0', 'Cristian', 'Villagra', null, '29', '2', '2', '0');
INSERT INTO `player` VALUES ('165', '0', 'Oscar', 'Ahumada', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('166', '0', 'Juan Marcelo', 'Ojeda', null, '29', '1', '1', '0');
INSERT INTO `player` VALUES ('167', '0', 'Diego', 'Barrado', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('168', '0', 'Martín', 'Galmarini', null, '29', '3', '1', '0');
INSERT INTO `player` VALUES ('169', '0', 'Rodrigo', 'Archubi', null, '29', '3', '1', '0');
INSERT INTO `player` VALUES ('170', '0', 'Miguel', 'Paniagua', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('171', '0', 'Matías', 'Almeyda', null, '29', '3', '2', '1');
INSERT INTO `player` VALUES ('172', '0', 'Mauro', 'Díaz', null, '29', '3', '2', '0');
INSERT INTO `player` VALUES ('173', '0', 'Nicolás', 'Domingo', null, '29', '3', '1', '0');
INSERT INTO `player` VALUES ('174', '0', 'Javier', 'Cohene Mereles', null, '29', '2', '1', '0');
INSERT INTO `player` VALUES ('175', '0', 'Andrés', 'Ríos', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('176', '0', 'Gustavo', 'Bou', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('177', '0', 'Lucas', 'Orban', null, '29', '2', '1', '0');
INSERT INTO `player` VALUES ('178', '0', 'Gustavo', 'Fernández', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('179', '0', 'Daniel', 'Villalba', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('180', '0', 'Facundo', 'Affranchino', null, '29', '3', '1', '0');
INSERT INTO `player` VALUES ('181', '0', 'Gustavo', 'Gil', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('182', '0', 'Erik', 'Lamela', null, '29', '3', '1', '0');
INSERT INTO `player` VALUES ('183', '0', 'Leandro', 'Chichizola', null, '29', '1', '1', '0');
INSERT INTO `player` VALUES ('184', '0', 'Maximiliano', 'Coronel', null, '29', '2', '1', '0');
INSERT INTO `player` VALUES ('185', '0', 'Eial', 'Strahman', null, '29', '4', '1', '0');
INSERT INTO `player` VALUES ('186', '0', 'Gonzalo', 'Marinelli', null, '29', '1', '1', '0');
INSERT INTO `player` VALUES ('187', '0', 'Germán', 'Pezzella', null, '29', '2', '1', '0');
INSERT INTO `player` VALUES ('188', '0', 'Rubén', 'Ramírez', null, '38', '4', '2', '1');
INSERT INTO `player` VALUES ('189', '0', 'Pablo', 'LugÃ¼ercio', null, '38', '4', '2', '0');
INSERT INTO `player` VALUES ('190', '0', 'Matías', 'Martínez', null, '38', '2', '2', '1');
INSERT INTO `player` VALUES ('191', '0', 'Claudio', 'Yacob', null, '38', '3', '2', '0');
INSERT INTO `player` VALUES ('192', '0', 'Lucas', 'Aveldaño', null, '38', '2', '2', '0');
INSERT INTO `player` VALUES ('193', '0', 'Lucas', 'Castromán', null, '38', '3', '2', '0');
INSERT INTO `player` VALUES ('194', '0', 'Adrián', 'Lucero', null, '38', '3', '2', '0');
INSERT INTO `player` VALUES ('195', '0', 'Sebastián', 'Rosano', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('196', '0', 'Marcos', 'Cáceres', null, '38', '2', '2', '1');
INSERT INTO `player` VALUES ('197', '0', 'Matías', 'Cahais', null, '38', '2', '2', '1');
INSERT INTO `player` VALUES ('198', '0', 'Sebastián', 'Grazzini', null, '38', '3', '2', '0');
INSERT INTO `player` VALUES ('199', '0', 'Pablo', 'Santillo', null, '38', '1', '2', '0');
INSERT INTO `player` VALUES ('200', '0', 'Martín', 'Wagner', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('201', '0', 'Juan Carlos', 'Falcón', null, '38', '3', '2', '0');
INSERT INTO `player` VALUES ('202', '0', 'Damián', 'Ledesma', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('203', '0', 'Gabriel', 'Mercado', null, '38', '2', '1', '0');
INSERT INTO `player` VALUES ('204', '0', 'Damián', 'Steinert', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('205', '0', 'Cristian', 'Tavio', null, '38', '2', '1', '0');
INSERT INTO `player` VALUES ('206', '0', 'Pablo', 'Caballero', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('207', '0', 'José', 'Martínez Gullotta', null, '38', '1', '1', '0');
INSERT INTO `player` VALUES ('208', '0', 'Marcos', 'Brítez Ojeda', null, '38', '3', '1', '1');
INSERT INTO `player` VALUES ('209', '0', 'Pablo', 'Monsalvo', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('210', '0', 'Braian', 'Lluy', null, '38', '2', '1', '1');
INSERT INTO `player` VALUES ('211', '0', 'Jorge', 'De Olivera', null, '38', '1', '1', '1');
INSERT INTO `player` VALUES ('212', '0', 'Diego', 'Menghi', null, '38', '2', '1', '0');
INSERT INTO `player` VALUES ('213', '0', 'José Luis', 'Fernández', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('214', '0', 'Juan', 'Sánchez Sotelo', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('215', '0', 'Javier', 'Velázquez', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('216', '0', 'Gonzalo', 'Pérez', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('217', '0', 'Mauro', 'Dobler', null, '38', '1', '1', '0');
INSERT INTO `player` VALUES ('218', '0', 'Martín', 'Puchetta', null, '38', '2', '1', '0');
INSERT INTO `player` VALUES ('219', '0', 'Nicolás', 'Sainz', null, '38', '2', '1', '0');
INSERT INTO `player` VALUES ('220', '0', 'Luis', 'Fariña', null, '38', '3', '1', '0');
INSERT INTO `player` VALUES ('221', '0', 'Juan Cruz', 'Respuela', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('222', '0', 'Brian', 'Risso', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('223', '0', 'Valentín', 'Viola', null, '38', '4', '1', '0');
INSERT INTO `player` VALUES ('224', '0', 'Mauro', 'Formica', null, '30', '3', '2', '1');
INSERT INTO `player` VALUES ('225', '0', 'Sebastián', 'Peratta', null, '30', '1', '2', '1');
INSERT INTO `player` VALUES ('226', '0', 'Leonel', 'Vangioni', null, '30', '3', '2', '1');
INSERT INTO `player` VALUES ('227', '0', 'Juan M.', 'Insaurralde', null, '30', '2', '2', '1');
INSERT INTO `player` VALUES ('228', '0', 'Mauricio', 'Sperdutti', null, '30', '3', '2', '0');
INSERT INTO `player` VALUES ('229', '0', 'Cristian', 'Sánchez Prette', null, '30', '3', '2', '1');
INSERT INTO `player` VALUES ('230', '0', 'Joaquín A.', 'Boghossian', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('231', '0', 'Alejandro', 'Da Silva', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('232', '0', 'Lucas', 'Bernardi', null, '30', '3', '2', '0');
INSERT INTO `player` VALUES ('233', '0', 'Jorge', 'Achucarro', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('234', '0', 'Hugo', 'Barrientos', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('235', '0', 'Diego', 'Mateo', null, '30', '3', '2', '0');
INSERT INTO `player` VALUES ('236', '0', 'Diego', 'Torres', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('237', '0', 'Juan', 'Quiroga', null, '30', '2', '1', '1');
INSERT INTO `player` VALUES ('238', '0', 'Germán', 'Caffa', null, '30', '1', '1', '1');
INSERT INTO `player` VALUES ('239', '0', 'Pablo', 'Aguilar', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('240', '0', 'Franco', 'Dolci', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('241', '0', 'Diego', 'Casaneve', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('242', '0', 'Matías', 'Quiroga', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('243', '0', 'Cristian', 'Núñez', null, '30', '4', '1', '1');
INSERT INTO `player` VALUES ('244', '0', 'Miguel', 'Torren', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('245', '0', 'Ignacio', 'Fideleff', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('246', '0', 'Pablo', 'Pérez', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('247', '0', 'Nahuel', 'Roselli', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('248', '0', 'Mauricio', 'Carrasco', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('249', '0', 'Martín', 'Seri', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('250', '0', 'Juan Manuel', 'Sosa', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('251', '0', 'Alexis', 'Machuca', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('252', '0', 'Carlos', 'Vaca', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('253', '0', 'Santiago', 'Fernández', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('254', '0', 'Rodrigo', 'Chávez', null, '30', '2', '1', '0');
INSERT INTO `player` VALUES ('255', '0', 'Cristian', 'Díaz', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('256', '0', 'Hernán', 'Zanni', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('257', '0', 'Emanuel', 'Dening', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('258', '0', 'Federico', 'Falcone', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('259', '0', 'Lucas', 'Hoyos', null, '30', '1', '1', '0');
INSERT INTO `player` VALUES ('260', '0', 'Alejandro', 'Cascio', null, '30', '3', '1', '0');
INSERT INTO `player` VALUES ('261', '0', 'Juan Manuel', 'Cobelli', null, '30', '4', '1', '0');
INSERT INTO `player` VALUES ('262', '0', 'Santiago', 'Salcedo', null, '31', '4', '2', '1');
INSERT INTO `player` VALUES ('263', '0', 'Diego', 'Lagos', null, '31', '4', '2', '0');
INSERT INTO `player` VALUES ('264', '0', 'Mauricio', 'Caranta', null, '31', '1', '2', '1');
INSERT INTO `player` VALUES ('265', '0', 'Agustín', 'Pelletieri', null, '31', '3', '2', '1');
INSERT INTO `player` VALUES ('266', '0', 'Matías', 'Fritzler', null, '31', '3', '2', '1');
INSERT INTO `player` VALUES ('267', '0', 'Maximiliano', 'Velázquez', null, '31', '2', '2', '0');
INSERT INTO `player` VALUES ('268', '0', 'Marcos', 'Aguirre', null, '31', '3', '2', '0');
INSERT INTO `player` VALUES ('269', '0', 'Santiago', 'Hoyos', null, '31', '2', '2', '0');
INSERT INTO `player` VALUES ('270', '0', 'Diego', 'González', null, '31', '3', '1', '1');
INSERT INTO `player` VALUES ('271', '0', 'Santiago', 'Biglieri', null, '31', '4', '1', '1');
INSERT INTO `player` VALUES ('272', '0', 'Jadson', 'Viera', null, '31', '2', '2', '0');
INSERT INTO `player` VALUES ('273', '0', 'Emir', 'Faccioli', null, '31', '2', '1', '1');
INSERT INTO `player` VALUES ('274', '0', 'Eduardo', 'Ledesma', null, '31', '3', '2', '1');
INSERT INTO `player` VALUES ('275', '0', 'Adrián', 'Peralta', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('276', '0', 'Hernán', 'Grana', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('277', '0', 'Carlos', 'Quintana', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('278', '0', 'Carlos', 'Arce', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('279', '0', 'Cristian', 'Menéndez', null, '31', '4', '1', '0');
INSERT INTO `player` VALUES ('280', '0', 'Agustín', 'Marchesín', null, '31', '1', '1', '0');
INSERT INTO `player` VALUES ('281', '0', 'Roberto', 'Dovetta', null, '31', '4', '1', '0');
INSERT INTO `player` VALUES ('282', '0', 'Iván', 'Macalik', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('283', '0', 'Maximiliano', 'Lugo', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('284', '0', 'Mario', 'Zaninovic', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('285', '0', 'Marcelo', 'Benítez', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('286', '0', 'Rodrigo', 'Erramuspe', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('287', '0', 'Leandro', 'Benítez', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('288', '0', 'Javier', 'Carrasco', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('289', '0', 'Gonzalo', 'Díaz Nachar', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('290', '0', 'Guido', 'Pizarro', null, '31', '3', '1', '0');
INSERT INTO `player` VALUES ('291', '0', 'Esteban', 'Andrada', null, '31', '1', '1', '0');
INSERT INTO `player` VALUES ('292', '0', 'Ariel', 'Alarcón', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('293', '0', 'Luciano', 'Balbi', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('294', '0', 'Gastón', 'Lolli', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('295', '0', 'Leonel', 'Pérez', null, '31', '2', '1', '0');
INSERT INTO `player` VALUES ('296', '0', 'Javier', 'Arias', null, '31', '4', '1', '0');
INSERT INTO `player` VALUES ('297', '0', 'Diego', 'Bielkiewicz', null, '31', '4', '1', '0');
INSERT INTO `player` VALUES ('298', '0', 'Andrés', 'Silvera', null, '39', '4', '2', '0');
INSERT INTO `player` VALUES ('299', '0', 'Fabián', 'Assmann', null, '39', '1', '2', '0');
INSERT INTO `player` VALUES ('300', '0', 'Hilario', 'Navarro', null, '39', '1', '2', '1');
INSERT INTO `player` VALUES ('301', '0', 'Leonel', 'Núñez', null, '39', '4', '2', '0');
INSERT INTO `player` VALUES ('302', '0', 'Walter', 'Busse', null, '39', '3', '2', '0');
INSERT INTO `player` VALUES ('303', '0', 'Ignacio', 'Piatti', null, '39', '3', '2', '0');
INSERT INTO `player` VALUES ('304', '0', 'Eduardo', 'Tuzzio', null, '39', '2', '2', '0');
INSERT INTO `player` VALUES ('305', '0', 'Darío', 'Gandín', null, '39', '4', '2', '1');
INSERT INTO `player` VALUES ('306', '0', 'Gastón', 'Machín', null, '39', '3', '2', '0');
INSERT INTO `player` VALUES ('307', '0', 'Carlos', 'Matheu', null, '39', '2', '2', '1');
INSERT INTO `player` VALUES ('308', '0', 'Walter', 'Acevedo', null, '39', '3', '2', '0');
INSERT INTO `player` VALUES ('309', '0', 'Luciano', 'Vella', null, '39', '2', '1', '1');
INSERT INTO `player` VALUES ('310', '0', 'Lucas', 'Pusineri', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('311', '0', 'Lucas', 'Mareque', null, '39', '2', '2', '0');
INSERT INTO `player` VALUES ('312', '0', 'Ricardo', 'Moreira', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('313', '0', 'Federico', 'Mancuello', null, '39', '3', '1', '1');
INSERT INTO `player` VALUES ('314', '0', 'Patricio', 'Rodríguez', null, '39', '3', '2', '1');
INSERT INTO `player` VALUES ('315', '0', 'Angel', 'Puertas', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('316', '0', 'Sergio', 'Vittor', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('317', '0', 'Fernando', 'Godoy', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('318', '0', 'Martín', 'Gómez', null, '39', '4', '1', '1');
INSERT INTO `player` VALUES ('319', '0', 'Nicolás', 'Mazzola', null, '39', '4', '1', '0');
INSERT INTO `player` VALUES ('320', '0', 'Samuel', 'Cáceres', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('321', '0', 'Federico', 'González', null, '39', '4', '1', '0');
INSERT INTO `player` VALUES ('322', '0', 'Adrián', 'Gabbarini', null, '39', '1', '1', '1');
INSERT INTO `player` VALUES ('323', '0', 'Héctor', 'EchagÃ¼e', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('324', '0', 'Leonel', 'Galeano', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('325', '0', 'Lucas', 'Kruspzky', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('326', '0', 'Nicolás', 'Martínez', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('327', '0', 'Roberto', 'Vissio', null, '39', '3', '1', '0');
INSERT INTO `player` VALUES ('328', '0', 'Matías', 'Canteros', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('329', '0', 'Diego', 'Rodríguez', null, '39', '1', '1', '0');
INSERT INTO `player` VALUES ('330', '0', 'Julián', 'Velázquez', null, '39', '2', '1', '0');
INSERT INTO `player` VALUES ('331', '0', 'Mariano', 'Berriex', null, '39', '3', '1', '1');
INSERT INTO `player` VALUES ('332', '0', 'David', 'Escalante', null, '39', '4', '1', '0');
INSERT INTO `player` VALUES ('333', '0', 'Patricio', 'Toranzo', null, '32', '3', '2', '0');
INSERT INTO `player` VALUES ('334', '0', 'Paolo', 'Goltz', null, '32', '2', '2', '1');
INSERT INTO `player` VALUES ('335', '0', 'Gastón', 'Monzón', null, '32', '1', '2', '0');
INSERT INTO `player` VALUES ('336', '0', 'Eduardo', 'Domínguez', null, '32', '2', '2', '0');
INSERT INTO `player` VALUES ('337', '0', 'Leandro', 'Díaz', null, '32', '3', '2', '0');
INSERT INTO `player` VALUES ('338', '0', 'Pablo', 'Jerez', null, '32', '2', '1', '1');
INSERT INTO `player` VALUES ('339', '0', 'Gastón', 'Esmerado', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('340', '0', 'Rodrigo', 'Díaz', null, '32', '3', '2', '0');
INSERT INTO `player` VALUES ('341', '0', 'Alan', 'Sánchez', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('342', '0', 'Diego', 'Rodríguez', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('343', '0', 'Gonzalo', 'García', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('344', '0', 'Lucas', 'Trecarichi', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('345', '0', 'Federico', 'Laurito', null, '32', '4', '1', '0');
INSERT INTO `player` VALUES ('346', '0', 'Kevin', 'Cura', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('347', '0', 'Juan Carlos', 'Carrizo', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('348', '0', 'Nicolás', 'De Bruno', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('349', '0', 'Leandro', 'Benegas', null, '32', '4', '1', '1');
INSERT INTO `player` VALUES ('350', '0', 'Ezequiel', 'Filipetto', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('351', '0', 'Luciano', 'Nieto', null, '32', '4', '1', '0');
INSERT INTO `player` VALUES ('352', '0', 'Nicolás', 'Trecco', null, '32', '4', '1', '0');
INSERT INTO `player` VALUES ('353', '0', 'Rodrigo', 'Malbernat', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('354', '0', 'Lucas', 'Calviño', null, '32', '1', '1', '0');
INSERT INTO `player` VALUES ('355', '0', 'Daniel', 'Medina', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('356', '0', 'Gastón', 'Rudniesky', null, '32', '1', '1', '0');
INSERT INTO `player` VALUES ('357', '0', 'César', 'Vallejos', null, '32', '1', '1', '0');
INSERT INTO `player` VALUES ('358', '0', 'Cristian', 'Fernández', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('359', '0', 'Ezequiel', 'Llesona', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('360', '0', 'Gerardo', 'Maidana', null, '32', '2', '1', '0');
INSERT INTO `player` VALUES ('361', '0', 'Mariano', 'Cosentino', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('362', '0', 'Francisco', 'Hernández', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('363', '0', 'Marcos', 'Moreno', null, '32', '3', '1', '0');
INSERT INTO `player` VALUES ('364', '0', 'Gino', 'Clara', null, '32', '4', '1', '0');
INSERT INTO `player` VALUES ('365', '0', 'Carlos', 'Ortiz López', null, '32', '4', '1', '0');
INSERT INTO `player` VALUES ('366', '0', 'Nelson', 'Ibáñez', null, '40', '1', '2', '0');
INSERT INTO `player` VALUES ('367', '0', 'Federico', 'Higuaín', null, '40', '4', '2', '1');
INSERT INTO `player` VALUES ('368', '0', 'Daniel', 'Vega', null, '40', '4', '1', '1');
INSERT INTO `player` VALUES ('369', '0', 'Sebastián', 'Salomón', null, '40', '3', '2', '0');
INSERT INTO `player` VALUES ('370', '0', 'Lautaro', 'Formica', null, '40', '2', '2', '0');
INSERT INTO `player` VALUES ('371', '0', 'Francisco', 'Dutari', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('372', '0', 'Sebastián', 'Martínez', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('373', '0', 'Leonardo', 'Sigali', null, '40', '2', '1', '1');
INSERT INTO `player` VALUES ('374', '0', 'Nicolás', 'Olmedo', null, '40', '3', '1', '1');
INSERT INTO `player` VALUES ('375', '0', 'Cristian', 'Chávez', null, '40', '4', '1', '0');
INSERT INTO `player` VALUES ('376', '0', 'Leandro', 'Torres', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('377', '0', 'Jorge', 'Curbelo', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('378', '0', 'Gabriel', 'Vallés', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('379', '0', 'Ariel', 'Rojas', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('380', '0', 'Martín', 'Aguirre', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('381', '0', 'José', 'Ramírez', null, '40', '1', '1', '0');
INSERT INTO `player` VALUES ('382', '0', 'Diego', 'Trotta', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('383', '0', 'Luis', 'Lobos', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('384', '0', 'Ernesto', 'Garín', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('385', '0', 'Carlos', 'Valencia', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('386', '0', 'Matías', 'Jara', null, '40', '4', '1', '1');
INSERT INTO `player` VALUES ('387', '0', 'Zelmar', 'García', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('388', '0', 'Jesús', 'Vera', null, '40', '4', '1', '0');
INSERT INTO `player` VALUES ('389', '0', 'César', 'Mena', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('390', '0', 'Cristian', 'Cuevas', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('391', '0', 'Sergio', 'Sánchez', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('392', '0', 'Maximiliano', 'Alaniz', null, '40', '4', '1', '0');
INSERT INTO `player` VALUES ('393', '0', 'Cristian', 'Del Castillo', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('394', '0', 'Facundo', 'Bailo', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('395', '0', 'Marcio', 'Conejero', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('396', '0', 'Federico', 'Villegas', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('397', '0', 'Cristian', 'Aracena', null, '40', '1', '1', '0');
INSERT INTO `player` VALUES ('398', '0', 'Juan', 'Marital', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('399', '0', 'Paolo', 'Santander', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('400', '0', 'Nicolás', 'Triviño', null, '40', '2', '1', '0');
INSERT INTO `player` VALUES ('401', '0', 'Alejandro', 'Camargo', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('402', '0', 'Paul', 'Martín', null, '40', '3', '1', '0');
INSERT INTO `player` VALUES ('403', '0', 'Adrián', 'Escudero', null, '40', '4', '1', '0');
INSERT INTO `player` VALUES ('404', '0', 'Sebastián', 'Romero', null, '41', '3', '2', '1');
INSERT INTO `player` VALUES ('405', '0', 'Gastón', 'Sessa', null, '41', '1', '2', '0');
INSERT INTO `player` VALUES ('406', '0', 'Juan', 'Cuevas', null, '41', '4', '2', '0');
INSERT INTO `player` VALUES ('407', '0', 'Fabián', 'Rinaudo', null, '41', '3', '2', '0');
INSERT INTO `player` VALUES ('408', '0', 'José', 'Vizcarra', null, '41', '4', '2', '0');
INSERT INTO `player` VALUES ('409', '0', 'Ariel', 'AgÃ¼ero', null, '41', '2', '1', '1');
INSERT INTO `player` VALUES ('410', '0', 'Alvaro', 'Ormeño', null, '41', '2', '2', '0');
INSERT INTO `player` VALUES ('411', '0', 'Esteban', 'González', null, '41', '3', '2', '0');
INSERT INTO `player` VALUES ('412', '0', 'Rubén', 'Maldonado', null, '41', '2', '2', '0');
INSERT INTO `player` VALUES ('413', '0', 'Roberto', 'Sosa', null, '41', '4', '1', '0');
INSERT INTO `player` VALUES ('414', '0', 'Diego', 'Villar', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('415', '0', 'Mariano', 'Messera', null, '41', '3', '2', '0');
INSERT INTO `player` VALUES ('416', '0', 'Marcelo', 'Cardozo', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('417', '0', 'Marco', 'Pérez', null, '41', '4', '1', '0');
INSERT INTO `player` VALUES ('418', '0', 'Luciano', 'Aued', null, '41', '3', '1', '1');
INSERT INTO `player` VALUES ('419', '0', 'Sebastián', 'Ereros', null, '41', '4', '1', '0');
INSERT INTO `player` VALUES ('420', '0', 'Hugo', 'Iriarte', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('421', '0', 'Cristian', 'Piarrou', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('422', '0', 'Néstor', 'Martinena', null, '41', '4', '1', '1');
INSERT INTO `player` VALUES ('423', '0', 'Lucas', 'Landa', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('424', '0', 'Denis', 'Stracqualursi', null, '41', '4', '1', '1');
INSERT INTO `player` VALUES ('425', '0', 'Pablo', 'Bangardino', null, '41', '1', '1', '0');
INSERT INTO `player` VALUES ('426', '0', 'Juan', 'Neira', null, '41', '4', '1', '0');
INSERT INTO `player` VALUES ('427', '0', 'Pablo', 'De Blasis', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('428', '0', 'Milton', 'Casco', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('429', '0', 'Lucas', 'Castro', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('430', '0', 'Dardo', 'Miloc', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('431', '0', 'Andrés', 'Angelini', null, '41', '1', '1', '0');
INSERT INTO `player` VALUES ('432', '0', 'Yair', 'Bonnin', null, '41', '1', '1', '0');
INSERT INTO `player` VALUES ('433', '0', 'Fernando', 'Monetti', null, '41', '1', '1', '0');
INSERT INTO `player` VALUES ('434', '0', 'Raúl Alberto', 'Albornoz', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('435', '0', 'Miguel Angel', 'Juárez', null, '41', '2', '1', '1');
INSERT INTO `player` VALUES ('436', '0', 'Federico', 'Quiroga', null, '41', '2', '1', '0');
INSERT INTO `player` VALUES ('437', '0', 'Nery', 'Espinoza', null, '41', '3', '1', '0');
INSERT INTO `player` VALUES ('438', '0', 'Alfredo Israel', 'Roldán', null, '41', '3', '1', '1');
INSERT INTO `player` VALUES ('439', '0', 'Rodrigo', 'Braña', null, '33', '3', '2', '1');
INSERT INTO `player` VALUES ('440', '0', 'Clemente', 'Rodríguez', null, '33', '2', '2', '1');
INSERT INTO `player` VALUES ('441', '0', 'José Luis', 'Calderón', null, '33', '4', '1', '0');
INSERT INTO `player` VALUES ('442', '0', 'Marcos', 'Angeleri', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('443', '0', 'Marcelo', 'Carrusca', null, '33', '3', '2', '0');
INSERT INTO `player` VALUES ('444', '0', 'Leandro', 'Desábato', null, '33', '2', '2', '1');
INSERT INTO `player` VALUES ('445', '0', 'Agustín', 'Alayes', null, '33', '2', '2', '0');
INSERT INTO `player` VALUES ('446', '0', 'Christian', 'Cellay', null, '33', '2', '2', '1');
INSERT INTO `player` VALUES ('447', '0', 'Leandro', 'Benítez', null, '33', '3', '2', '1');
INSERT INTO `player` VALUES ('448', '0', 'Juan Manuel', 'Salgueiro', null, '33', '4', '2', '0');
INSERT INTO `player` VALUES ('449', '0', 'Germán', 'Ré', null, '33', '2', '2', '0');
INSERT INTO `player` VALUES ('450', '0', 'Damián', 'Albil', null, '33', '1', '2', '1');
INSERT INTO `player` VALUES ('451', '0', 'Matías', 'Sánchez', null, '33', '3', '2', '0');
INSERT INTO `player` VALUES ('452', '0', 'Leandro', 'González', null, '33', '3', '1', '0');
INSERT INTO `player` VALUES ('453', '0', 'Roberto', 'Fernández', null, '33', '1', '1', '0');
INSERT INTO `player` VALUES ('454', '0', 'Edgar', 'González', null, '33', '3', '1', '0');
INSERT INTO `player` VALUES ('455', '0', 'César', 'Taborda', null, '33', '1', '1', '0');
INSERT INTO `player` VALUES ('456', '0', 'Juan Manuel', 'Díaz', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('457', '0', 'J.', 'Morales Neumann', null, '33', '4', '1', '0');
INSERT INTO `player` VALUES ('458', '0', 'Federico', 'Fernández', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('459', '0', 'Raúl', 'Iberbia', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('460', '0', 'Maximiliano', 'Núñez', null, '33', '3', '1', '0');
INSERT INTO `player` VALUES ('461', '0', 'Milton', 'Galeana', null, '33', '4', '1', '0');
INSERT INTO `player` VALUES ('462', '0', 'Diego', 'Armani', null, '33', '1', '1', '0');
INSERT INTO `player` VALUES ('463', '0', 'Marcos', 'Rojo', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('464', '0', 'Cristian', 'Gaitán', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('465', '0', 'Matías', 'Sarulyte', null, '33', '2', '1', '0');
INSERT INTO `player` VALUES ('466', '0', 'Matías', 'Birge', null, '33', '3', '1', '0');
INSERT INTO `player` VALUES ('467', '0', 'Agustín', 'Silva', null, '33', '1', '1', '0');
INSERT INTO `player` VALUES ('468', '0', 'Diego', 'Pozo', null, '34', '1', '2', '1');
INSERT INTO `player` VALUES ('469', '0', 'Alexis', 'Ferrero', null, '34', '2', '2', '1');
INSERT INTO `player` VALUES ('470', '0', 'Germán', 'Rivarola', null, '34', '2', '2', '1');
INSERT INTO `player` VALUES ('471', '0', 'Federico', 'Nieto', null, '34', '4', '2', '0');
INSERT INTO `player` VALUES ('472', '0', 'Cristian', 'Pellerano', null, '34', '3', '2', '0');
INSERT INTO `player` VALUES ('473', '0', 'Marcelo', 'Goux', null, '34', '2', '1', '1');
INSERT INTO `player` VALUES ('474', '0', 'Ariel', 'Garcé', null, '34', '2', '2', '1');
INSERT INTO `player` VALUES ('475', '0', 'Alejandro', 'Capurro', null, '34', '3', '2', '0');
INSERT INTO `player` VALUES ('476', '0', 'Ricardo', 'Gómez', null, '34', '3', '2', '0');
INSERT INTO `player` VALUES ('477', '0', 'Daley', 'Mena', null, '34', '4', '1', '0');
INSERT INTO `player` VALUES ('478', '0', 'Lucas', 'Acosta', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('479', '0', 'Juan Manuel', 'Lucero', null, '34', '4', '1', '0');
INSERT INTO `player` VALUES ('480', '0', 'Alfredo', 'Ramírez', null, '34', '3', '1', '1');
INSERT INTO `player` VALUES ('481', '0', 'Facundo', 'Bertoglio', null, '34', '3', '2', '1');
INSERT INTO `player` VALUES ('482', '0', 'Luis', 'Quinteros', null, '34', '4', '1', '0');
INSERT INTO `player` VALUES ('483', '0', 'Salustiano', 'Candia', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('484', '0', 'Nicolás', 'Torres', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('485', '0', 'Fabián', 'Castillo', null, '34', '4', '1', '0');
INSERT INTO `player` VALUES ('486', '0', 'Omar', 'Merlo', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('487', '0', 'Cristian', 'Barinaga', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('488', '0', 'Maximiliano', 'Caire', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('489', '0', 'Pablo', 'De Miranda', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('490', '0', 'Federico', 'García', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('491', '0', 'Mauricio', 'Mansilla', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('492', '0', 'Facundo', 'Sánchez', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('493', '0', 'Marcos', 'Díaz', null, '34', '1', '1', '0');
INSERT INTO `player` VALUES ('494', '0', 'Ismael', 'Quilez', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('495', '0', 'Mauro', 'Bellone', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('496', '0', 'Rodrigo', 'Canario', null, '34', '4', '1', '0');
INSERT INTO `player` VALUES ('497', '0', 'Iván', 'Gorosito', null, '34', '1', '1', '0');
INSERT INTO `player` VALUES ('498', '0', 'Gonzalo', 'Gaydou', null, '34', '2', '1', '0');
INSERT INTO `player` VALUES ('499', '0', 'Santiago', 'Soto', null, '34', '3', '1', '0');
INSERT INTO `player` VALUES ('500', '0', 'Sebastián', 'Sciorilli', null, '42', '3', '2', '0');
INSERT INTO `player` VALUES ('501', '0', 'Nicolás', 'Tauber', null, '42', '1', '1', '1');
INSERT INTO `player` VALUES ('502', '0', 'Cristian', 'Grabinski', null, '42', '2', '1', '1');
INSERT INTO `player` VALUES ('503', '0', 'Matías', 'Alustiza', null, '42', '4', '2', '1');
INSERT INTO `player` VALUES ('504', '0', 'Diego', 'Crosa', null, '42', '2', '2', '0');
INSERT INTO `player` VALUES ('505', '0', 'Facundo', 'Parra', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('506', '0', 'Sebastián', 'Cejas', null, '42', '1', '1', '0');
INSERT INTO `player` VALUES ('507', '0', 'Fernando', 'Crosa', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('508', '0', 'Jorge', 'Núñez', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('509', '0', 'Emanuel', 'Centurión', null, '42', '3', '2', '0');
INSERT INTO `player` VALUES ('510', '0', 'Federico', 'Vismara', null, '42', '3', '1', '1');
INSERT INTO `player` VALUES ('511', '0', 'Omar', 'Zarif', null, '42', '3', '1', '1');
INSERT INTO `player` VALUES ('512', '0', 'Cristian', 'Milla', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('513', '0', 'Daniel', 'Pereira', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('514', '0', 'Juan Manuel', 'Aróstegui', null, '42', '4', '1', '1');
INSERT INTO `player` VALUES ('515', '0', 'Alejandro', 'Frezzotti', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('516', '0', 'Nicolás', 'Ramírez', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('517', '0', 'Mariano', 'Echeverría', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('518', '0', 'Fernando', 'Fontana', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('519', '0', 'Franco', 'Miranda', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('520', '0', 'Federico', 'Iñíguez', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('521', '0', 'Diego', 'Churín', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('522', '0', 'José Luis', 'Gómez', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('523', '0', 'Germán', 'Cano', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('524', '0', 'Daniel', 'Ponce', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('525', '0', 'Emiliano', 'Strappini', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('526', '0', 'Cristian', 'Gutiérrez', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('527', '0', 'Diego', 'Morales', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('528', '0', 'Franco', 'Coria', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('529', '0', 'Jorge', 'Myma', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('530', '0', 'Federico', 'Rosso', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('531', '0', 'Matías', 'Pisano', null, '42', '3', '1', '0');
INSERT INTO `player` VALUES ('532', '0', 'Diego', 'Torres', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('533', '0', 'Pedro', 'Fernández', null, '42', '1', '1', '0');
INSERT INTO `player` VALUES ('534', '0', 'Lisandro', 'López', null, '42', '2', '1', '0');
INSERT INTO `player` VALUES ('535', '0', 'Daniel', 'Giordano', null, '42', '4', '1', '0');
INSERT INTO `player` VALUES ('536', '0', 'Roberto', 'Abbondanzieri', null, '35', '1', '2', '0');
INSERT INTO `player` VALUES ('537', '0', 'Hugo', 'Ibarra', null, '35', '2', '2', '1');
INSERT INTO `player` VALUES ('538', '0', 'Claudio', 'Morel Rodríguez', null, '35', '2', '2', '0');
INSERT INTO `player` VALUES ('539', '0', 'Gary', 'Medel', null, '35', '3', '2', '1');
INSERT INTO `player` VALUES ('540', '0', 'Julio César', 'Cáceres', null, '35', '2', '2', '1');
INSERT INTO `player` VALUES ('541', '0', 'Pablo', 'Mouche', null, '35', '4', '2', '1');
INSERT INTO `player` VALUES ('542', '0', 'Cristian', 'Chávez', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('543', '0', 'Lucas', 'Viatri', null, '35', '4', '1', '1');
INSERT INTO `player` VALUES ('544', '0', 'Gabriel', 'Paletta', null, '35', '2', '2', '1');
INSERT INTO `player` VALUES ('545', '0', 'Guillermo', 'Marino', null, '35', '3', '2', '1');
INSERT INTO `player` VALUES ('546', '0', 'Ariel', 'Rosada', null, '35', '3', '1', '1');
INSERT INTO `player` VALUES ('547', '0', 'Luciano', 'Monzón', null, '35', '2', '2', '0');
INSERT INTO `player` VALUES ('548', '0', 'Ricardo', 'Noir', null, '35', '4', '1', '0');
INSERT INTO `player` VALUES ('549', '0', 'Nicolás', 'Gaitán', null, '35', '3', '1', '1');
INSERT INTO `player` VALUES ('550', '0', 'Juan', 'Krupoviesa', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('551', '0', 'José María', 'Calvo', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('552', '0', 'Javier', 'García', null, '35', '1', '1', '0');
INSERT INTO `player` VALUES ('553', '0', 'Adrián', 'Gunino', null, '35', '2', '1', '1');
INSERT INTO `player` VALUES ('554', '0', 'Ezequiel', 'Muñoz', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('555', '0', 'Gastón', 'Sauro', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('556', '0', 'Josué', 'Ayala', null, '35', '1', '1', '0');
INSERT INTO `player` VALUES ('557', '0', 'Exequiel', 'Benavídez', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('558', '0', 'Breyner', 'Bonilla', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('559', '0', 'S. Alberto', 'Battaglia', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('560', '0', 'Jonathan', 'Philippe', null, '35', '4', '1', '0');
INSERT INTO `player` VALUES ('561', '0', 'Nicolás', 'Colazo', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('562', '0', 'Leandro', 'Aguirre', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('563', '0', 'Omar', 'Alfonso', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('564', '0', 'Enzo Adrián', 'Ruiz', null, '35', '2', '1', '0');
INSERT INTO `player` VALUES ('565', '0', 'Cristian', 'Erbes', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('566', '0', 'Sebastián', 'Vidal', null, '35', '3', '1', '0');
INSERT INTO `player` VALUES ('567', '0', 'Cristian', 'Lucchetti', null, '43', '1', '2', '1');
INSERT INTO `player` VALUES ('568', '0', 'Santiago', 'Silva', null, '43', '4', '2', '1');
INSERT INTO `player` VALUES ('569', '0', 'Sebastián', 'Fernández', null, '43', '4', '2', '1');
INSERT INTO `player` VALUES ('570', '0', 'Walter', 'Erviti', null, '43', '3', '2', '1');
INSERT INTO `player` VALUES ('571', '0', 'Víctor', 'López', null, '43', '2', '2', '1');
INSERT INTO `player` VALUES ('572', '0', 'Daniel', 'Bilos', null, '43', '3', '2', '0');
INSERT INTO `player` VALUES ('573', '0', 'Roberto', 'Battión', null, '43', '3', '1', '1');
INSERT INTO `player` VALUES ('574', '0', 'Maximiliano', 'Bustos', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('575', '0', 'Sebastián', 'Méndez', null, '43', '2', '2', '0');
INSERT INTO `player` VALUES ('576', '0', 'Marcelo', 'Quinteros', null, '43', '3', '2', '0');
INSERT INTO `player` VALUES ('577', '0', 'Julio', 'Marchant', null, '43', '3', '1', '1');
INSERT INTO `player` VALUES ('578', '0', 'Marcelo', 'Bustamante', null, '43', '2', '1', '1');
INSERT INTO `player` VALUES ('579', '0', 'Santiago', 'Ladino', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('580', '0', 'Emmanuel', 'Pío', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('581', '0', 'Luis', 'Salmerón', null, '43', '4', '1', '0');
INSERT INTO `player` VALUES ('582', '0', 'José', 'Devaca', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('583', '0', 'Julio', 'Barraza', null, '43', '2', '1', '1');
INSERT INTO `player` VALUES ('584', '0', 'James', 'Rodríguez', null, '43', '3', '2', '1');
INSERT INTO `player` VALUES ('585', '0', 'Ariel', 'Broggi', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('586', '0', 'Cristian', 'García', null, '43', '4', '1', '0');
INSERT INTO `player` VALUES ('587', '0', 'Enrique', 'Bologna', null, '43', '1', '1', '0');
INSERT INTO `player` VALUES ('588', '0', 'Maximiliano', 'Laso', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('589', '0', 'Marcos', 'Galarza', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('590', '0', 'Fabián', 'Santana', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('591', '0', 'Gustavo', 'Gómez', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('592', '0', 'Mauro', 'Dos Santos', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('593', '0', 'Facundo', 'Ferreyra', null, '43', '4', '1', '0');
INSERT INTO `player` VALUES ('594', '0', 'Federico', 'Sardella', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('595', '0', 'Pablo', 'Vergara', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('596', '0', 'Gonzalo', 'Robledo', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('597', '0', 'Diego', 'Galeano', null, '43', '3', '1', '0');
INSERT INTO `player` VALUES ('598', '0', 'Guido', 'Di Vanni', null, '43', '4', '1', '0');
INSERT INTO `player` VALUES ('599', '0', 'Sebastián', 'López', null, '43', '1', '1', '0');
INSERT INTO `player` VALUES ('600', '0', 'Favio', 'Segovia', null, '43', '2', '1', '0');
INSERT INTO `player` VALUES ('601', '0', 'Héctor', 'Desvaux', null, '44', '2', '1', '1');
INSERT INTO `player` VALUES ('602', '0', 'Raúl', 'Saavedra', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('603', '0', 'Luis', 'Rodríguez', null, '44', '4', '2', '0');
INSERT INTO `player` VALUES ('604', '0', 'Pablo', 'Calandria', null, '44', '4', '1', '0');
INSERT INTO `player` VALUES ('605', '0', 'Matías', 'Villavicencio', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('606', '0', 'Matías', 'Escobar', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('607', '0', 'Claudio', 'Sarría', null, '44', '3', '1', '1');
INSERT INTO `player` VALUES ('608', '0', 'Deivis', 'Barone', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('609', '0', 'Juan Manuel', 'Azconzábal', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('610', '0', 'Javier', 'Páez', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('611', '0', 'Jonathan', 'Blanes', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('612', '0', 'Lucas', 'Ischuk', null, '44', '1', '1', '1');
INSERT INTO `player` VALUES ('613', '0', 'Andrés', 'Bressán', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('614', '0', 'Diego', 'Erroz', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('615', '0', 'Martín', 'Granero', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('616', '0', 'Damián', 'Musto', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('617', '0', 'Fabio', 'Escobar', null, '44', '4', '1', '0');
INSERT INTO `player` VALUES ('618', '0', 'Sebastián', 'Longo', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('619', '0', 'César', 'Montiglio', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('620', '0', 'Juan', 'Pereyra', null, '44', '4', '1', '1');
INSERT INTO `player` VALUES ('621', '0', 'Matías', 'García', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('622', '0', 'Emanuel', 'Gigliotti', null, '44', '4', '1', '0');
INSERT INTO `player` VALUES ('623', '0', 'Esteban', 'Dei Rossi', null, '44', '1', '1', '0');
INSERT INTO `player` VALUES ('624', '0', 'David', 'Drocco', null, '44', '3', '1', '1');
INSERT INTO `player` VALUES ('625', '0', 'Rodrigo', 'Herrera', null, '44', '2', '1', '0');
INSERT INTO `player` VALUES ('626', '0', 'José', 'Saavedra', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('627', '0', 'Claudio', 'González', null, '44', '3', '1', '0');
INSERT INTO `player` VALUES ('628', '0', 'Cristian', 'Campestrini', null, '45', '1', '2', '0');
INSERT INTO `player` VALUES ('629', '0', 'Javier', 'Yacuzzi', null, '45', '3', '2', '0');
INSERT INTO `player` VALUES ('630', '0', 'Mauro', 'Matos', null, '45', '4', '2', '0');
INSERT INTO `player` VALUES ('631', '0', 'Aníbal', 'Matellán', null, '45', '2', '2', '0');
INSERT INTO `player` VALUES ('632', '0', 'Diego', 'Galván', null, '45', '3', '2', '0');
INSERT INTO `player` VALUES ('633', '0', 'Franco', 'Jara', null, '45', '4', '2', '1');
INSERT INTO `player` VALUES ('634', '0', 'Sergio', 'Sena', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('635', '0', 'Cristian', 'Alvarez', null, '45', '3', '2', '0');
INSERT INTO `player` VALUES ('636', '0', 'Federico', 'Poggi', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('637', '0', 'Franco', 'Peppino', null, '45', '2', '1', '1');
INSERT INTO `player` VALUES ('638', '0', 'Cristian', 'Tula', null, '45', '2', '1', '1');
INSERT INTO `player` VALUES ('639', '0', 'Facundo', 'Pérez Castro', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('640', '0', 'Darío', 'Espínola', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('641', '0', 'Matías', 'Pérez', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('642', '0', 'Matías', 'Carabajal', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('643', '0', 'Alexander', 'Medina', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('644', '0', 'Mariano Sebastián', 'Brau', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('645', '0', 'Jonathan', 'López', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('646', '0', 'Juan', 'Bottaro', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('647', '0', 'Hugo', 'Nervo', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('648', '0', 'Iván', 'Marcone', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('649', '0', 'Darío', 'Benedetto', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('650', '0', 'Mariano', 'Martínez', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('651', '0', 'Catriel', 'Orcellet', null, '45', '1', '1', '0');
INSERT INTO `player` VALUES ('652', '0', 'Nahuel', 'Sachetto', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('653', '0', 'Raúl', 'Speroni', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('654', '0', 'Damián', 'Pérez', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('655', '0', 'Facundo', 'Silva', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('656', '0', 'Nicolás', 'Aguirre', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('657', '0', 'Martín', 'Reichel', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('658', '0', 'Alexander', 'Corro', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('659', '0', 'Javier Nicolás', 'Burrai', null, '45', '1', '1', '0');
INSERT INTO `player` VALUES ('660', '0', 'Ludovico', 'Paulucci', null, '45', '1', '1', '0');
INSERT INTO `player` VALUES ('661', '0', 'Víctor', 'Cuesta', null, '45', '2', '1', '0');
INSERT INTO `player` VALUES ('662', '0', 'Claudio', 'Mosca', null, '45', '3', '1', '0');
INSERT INTO `player` VALUES ('663', '0', 'Matías Javier', 'Sierra', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('664', '0', 'Pablo', 'Villalba Fretes', null, '45', '4', '1', '0');
INSERT INTO `player` VALUES ('665', '0', 'Gabriel', 'Hauche', null, '46', '4', '2', '1');
INSERT INTO `player` VALUES ('666', '0', 'Néstor', 'Ortigoza', null, '46', '3', '2', '1');
INSERT INTO `player` VALUES ('667', '0', 'Santiago', 'Raymonda', null, '46', '3', '1', '1');
INSERT INTO `player` VALUES ('668', '0', 'Juan', 'Mercier', null, '46', '3', '2', '1');
INSERT INTO `player` VALUES ('669', '0', 'Nicolás', 'Pavlovich', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('670', '0', 'Sebastián', 'Torrico', null, '46', '1', '1', '1');
INSERT INTO `player` VALUES ('671', '0', 'Ignacio', 'Canuto', null, '46', '2', '2', '1');
INSERT INTO `player` VALUES ('672', '0', 'Andrés', 'Scotti', null, '46', '2', '2', '1');
INSERT INTO `player` VALUES ('673', '0', 'Federico', 'Domínguez', null, '46', '2', '1', '1');
INSERT INTO `player` VALUES ('674', '0', 'Matías', 'Caruzzo', null, '46', '2', '2', '1');
INSERT INTO `player` VALUES ('675', '0', 'Gustavo', 'Oberman', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('676', '0', 'Ismael', 'Sosa', null, '46', '4', '2', '0');
INSERT INTO `player` VALUES ('677', '0', 'René', 'Lima', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('678', '0', 'Nicolás', 'Peric', null, '46', '1', '1', '0');
INSERT INTO `player` VALUES ('679', '0', 'Gonzalo', 'Prósperi', null, '46', '2', '1', '1');
INSERT INTO `player` VALUES ('680', '0', 'Juan Alberto', 'Sabia', null, '46', '2', '1', '0');
INSERT INTO `player` VALUES ('681', '0', 'Franco', 'Quiroga', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('682', '0', 'Ciro', 'Rius', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('683', '0', 'Nicolás', 'Gianni', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('684', '0', 'Mauro', 'Bogado', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('685', '0', 'Germán', 'Basualdo', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('686', '0', 'Facundo', 'Coria', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('687', '0', 'Andrés', 'Romero', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('688', '0', 'Diego', 'García', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('689', '0', 'Nicolás', 'Berardo', null, '46', '2', '1', '0');
INSERT INTO `player` VALUES ('690', '0', 'Julián', 'Fernández', null, '46', '2', '1', '0');
INSERT INTO `player` VALUES ('691', '0', 'Sebastián', 'Jaime', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('692', '0', 'Facundo', 'Alfonso', null, '46', '3', '1', '0');
INSERT INTO `player` VALUES ('693', '0', 'Diego', 'Morales', null, '46', '1', '1', '0');
INSERT INTO `player` VALUES ('694', '0', 'Maximiliano', 'Sola', null, '46', '2', '1', '0');
INSERT INTO `player` VALUES ('695', '0', 'Hernán', 'Salazar', null, '46', '4', '1', '0');
INSERT INTO `player` VALUES ('696', '0', 'Gabriel Oscar', 'Frandino', null, '46', '1', '1', '0');
INSERT INTO `player` VALUES ('697', '0', 'Daniel Alejandro', 'Franco', null, '46', '2', '1', '0');
INSERT INTO `player` VALUES ('698', '0', 'Edgardo', 'Rotondi', null, '46', '4', '1', '0');

-- ----------------------------
-- Table structure for `playermatch`
-- ----------------------------
DROP TABLE IF EXISTS `playermatch`;
CREATE TABLE `playermatch` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `player` bigint(20) NOT NULL,
  `match_` bigint(20) NOT NULL,
  `totalPoints` double default NULL,
  `olePoints` double default NULL,
  `cleanGoal` tinyint(1) default NULL,
  `ownGoal` int(11) default NULL,
  `mom` tinyint(1) default NULL,
  `goals` int(11) default NULL,
  `penaltyGoals` int(11) default NULL,
  `freeKickGoals` int(11) default NULL,
  `missedPenalties` int(11) default NULL,
  `cachedPenalties` int(11) default NULL,
  `yellowCard` tinyint(1) default NULL,
  `redCard` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerMatch_player_match` (`player`,`match_`),
  KEY `FK_PlayerMatch_player` (`player`),
  KEY `FK_PlayerMatch_match` (`match_`),
  CONSTRAINT `FK_PlayerMatch_match` FOREIGN KEY (`match_`) REFERENCES `match_` (`id`),
  CONSTRAINT `FK_PlayerMatch_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playermatch
-- ----------------------------
INSERT INTO `playermatch` VALUES ('710', '1', '409', '120', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('711', '1', '92', '120', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('712', '1', '450', '116', '5', '7', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('713', '1', '171', '114', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('714', '1', '418', '120', '13', '7', '0', '0', '1', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('715', '1', '583', '116', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('716', '1', '266', '114', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('717', '1', '21', '117', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('718', '1', '211', '112', '7', '5', '1', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('719', '1', '481', '118', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('720', '1', '14', '118', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('721', '1', '16', '116', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('722', '1', '90', '120', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('723', '1', '119', '117', '6', '7', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('724', '1', '129', '117', '4.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('725', '1', '578', '116', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('726', '1', '197', '112', '8', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('727', '1', '671', '115', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('728', '1', '25', '121', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('729', '1', '674', '115', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('730', '2', '141', '117', '7', '7', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('731', '1', '27', '121', '17', '7.5', '0', '0', '1', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('732', '1', '444', '116', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('733', '1', '601', '112', '0', '3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `playermatch` VALUES ('734', '1', '673', '115', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('735', '1', '570', '116', '11', '8', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('736', '1', '569', '116', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('737', '1', '155', '114', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('738', '1', '469', '118', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('740', '4', '224', '113', '9.5', '6.5', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('741', '1', '322', '119', '5', '6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('742', '1', '549', '117', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('743', '1', '305', '119', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('744', '1', '474', '118', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('745', '1', '334', '118', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('746', '1', '318', '119', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('747', '1', '473', '118', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('748', '1', '665', '115', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('749', '1', '367', '121', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('751', '1', '612', '112', '0', '4', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('752', '1', '54', '113', '4', '6', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('753', '3', '633', '119', '16', '8', '0', '0', '1', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('754', '1', '386', '121', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('755', '1', '210', '112', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('756', '1', '571', '116', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('757', '1', '567', '116', '5', '6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('758', '1', '53', '113', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('759', '1', '313', '119', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('760', '1', '577', '116', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('761', '1', '190', '112', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('762', '1', '307', '119', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('763', '1', '539', '117', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('764', '1', '668', '115', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `playermatch` VALUES ('765', '1', '87', '120', '2', '4', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('766', '1', '1', '121', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('767', '1', '52', '113', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('768', '1', '374', '121', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('769', '1', '666', '115', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('770', '1', '3', '121', '6.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('771', '1', '134', '117', '6.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('772', '1', '544', '117', '3.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('773', '1', '26', '121', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('774', '1', '265', '114', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('776', '1', '620', '112', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('777', '1', '17', '116', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `playermatch` VALUES ('778', '1', '99', '120', '11', '6', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('779', '1', '468', '118', '7.5', '5.5', '1', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('780', '1', '480', '118', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('781', '1', '667', '115', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('782', '1', '470', '118', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('783', '1', '94', '120', '6.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('784', '1', '440', '116', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('785', '1', '314', '119', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('786', '1', '404', '120', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('787', '1', '546', '117', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('788', '1', '262', '114', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('789', '0', '573', '114', '6', '6', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `playermatch` VALUES ('790', '1', '502', '115', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('791', '1', '672', '115', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('792', '1', '568', '116', '8', '7', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('793', '1', '93', '120', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('794', '1', '670', '115', '14', '8', '0', '2', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('795', '1', '638', '119', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('796', '4', '226', '113', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('797', '1', '120', '117', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('798', '1', '309', '119', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('799', '1', '15', '116', '18', '8', '0', '0', '1', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('800', '1', '23', '121', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('801', '1', '511', '115', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('804', '0', '227', '113', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('805', '0', '13', '114', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('806', '1', '123', '117', '23', '8', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('807', '0', '225', '113', '6', '7', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('808', '0', '131', '117', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('809', '0', '447', '116', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('810', '0', '305', '122', '3.5', '3.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('811', '0', '307', '122', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('812', '1', '309', '122', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('813', '0', '313', '122', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('814', '1', '314', '122', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('815', '0', '318', '122', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('816', '1', '322', '122', '8', '6', '1', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('817', '0', '404', '122', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('818', '0', '409', '122', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('819', '0', '418', '122', '5.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('820', '0', '14', '123', '6.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('821', '0', '334', '123', '0.5', '4.5', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('822', '0', '338', '123', '4.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('823', '0', '638', '123', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('824', '0', '537', '124', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('825', '0', '539', '124', '5.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('826', '0', '540', '124', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('827', '0', '541', '124', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('828', '0', '545', '124', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('829', '0', '546', '124', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('830', '0', '549', '124', '6.5', '6.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('831', '0', '18', '124', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('832', '0', '468', '124', '8', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('833', '0', '469', '124', '6', '7', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('834', '0', '470', '124', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('835', '0', '474', '124', '15', '7.5', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('836', '0', '480', '124', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('837', '0', '481', '124', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('838', '0', '13', '126', '3.5', '3.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('839', '0', '262', '126', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('840', '0', '265', '126', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('841', '0', '266', '126', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('842', '0', '271', '126', '3.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('843', '0', '274', '126', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('844', '0', '502', '126', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('845', '0', '511', '126', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('846', '0', '224', '127', '8', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('847', '0', '225', '127', '5', '6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('848', '0', '226', '127', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('849', '0', '227', '127', '6', '7', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('850', '0', '237', '127', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('851', '0', '155', '127', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('852', '0', '612', '128', '4', '6', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('853', '0', '620', '128', '22', '10', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('854', '0', '624', '128', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('855', '0', '53', '128', '6', '6', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('856', '0', '54', '128', '1', '5', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('857', '0', '64', '128', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('858', '0', '367', '129', '10', '8', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('859', '0', '368', '129', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('860', '0', '373', '129', '3.5', '4.5', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('861', '0', '374', '129', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('862', '0', '188', '129', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('863', '0', '190', '129', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `playermatch` VALUES ('864', '0', '210', '129', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('865', '0', '15', '130', '8.5', '8.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('866', '0', '440', '130', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('867', '0', '87', '131', '3', '4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('868', '0', '94', '131', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('869', '0', '99', '131', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('870', '1', '567', '131', '10', '8', '1', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('871', '0', '568', '131', '5.5', '5.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('872', '0', '571', '131', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('873', '0', '584', '131', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('874', '0', '665', '125', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('875', '0', '666', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('876', '0', '667', '125', '4.5', '4.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('877', '0', '670', '125', '5', '6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('878', '1', '672', '125', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('879', '0', '679', '125', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('880', '0', '120', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('881', '0', '123', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('882', '0', '131', '125', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('883', '0', '134', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('884', '0', '16', '130', '19', '9', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('885', '0', '439', '130', '7.5', '7.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('886', '0', '444', '130', '11.5', '6.5', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('887', '0', '446', '130', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('888', '0', '447', '130', '11', '9', '0', '0', '0', '1', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('889', '0', '450', '130', '8', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('890', '0', '25', '130', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('891', '0', '119', '125', '15', '8', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('892', '0', '129', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('893', '0', '141', '125', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('894', '0', '671', '125', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('895', '0', '674', '125', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('896', '0', '569', '131', '18', '8.5', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('897', '0', '570', '131', '7', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('898', '0', '573', '131', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('899', '0', '578', '131', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('900', '0', '583', '131', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('901', '0', '90', '131', '2.5', '3.5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `playermatch` VALUES ('902', '0', '197', '129', '2.5', '2.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `playermatch` VALUES ('903', '0', '211', '129', '3', '6', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `playerposition`
-- ----------------------------
DROP TABLE IF EXISTS `playerposition`;
CREATE TABLE `playerposition` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playerposition
-- ----------------------------
INSERT INTO `playerposition` VALUES ('1', '0', 'Arquero');
INSERT INTO `playerposition` VALUES ('2', '0', 'Defensor');
INSERT INTO `playerposition` VALUES ('3', '0', 'Volante');
INSERT INTO `playerposition` VALUES ('4', '0', 'Delantero');

-- ----------------------------
-- Table structure for `playerteam`
-- ----------------------------
DROP TABLE IF EXISTS `playerteam`;
CREATE TABLE `playerteam` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `player` bigint(20) NOT NULL,
  `team` bigint(20) NOT NULL,
  `isCaptain1` tinyint(1) default NULL,
  `isCaptain2` tinyint(1) default NULL,
  `isCaptain3` tinyint(1) default NULL,
  `isPrincipal` tinyint(1) default NULL,
  `isList` tinyint(1) default NULL,
  `isSubstitute` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerTeam_player_team` (`player`,`team`),
  KEY `FK_PlayerTeam_player` (`player`),
  KEY `FK_PlayerTeam_team` (`team`),
  CONSTRAINT `FK_PlayerTeam_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_PlayerTeam_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playerteam
-- ----------------------------
INSERT INTO `playerteam` VALUES ('801', '0', '225', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('802', '0', '227', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('803', '0', '469', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('804', '0', '334', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('805', '0', '129', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('806', '0', '15', '52', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('807', '0', '17', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('808', '0', '208', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('809', '0', '229', '52', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('810', '0', '14', '52', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('811', '0', '16', '52', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('812', '0', '670', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('813', '0', '210', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('814', '0', '309', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('815', '0', '607', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('816', '0', '374', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('817', '0', '569', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('818', '0', '620', '52', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('819', '0', '567', '53', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('820', '0', '470', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('821', '0', '227', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('822', '0', '26', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('823', '0', '20', '53', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('824', '0', '313', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('825', '0', '6', '53', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('826', '0', '1', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('827', '0', '224', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('828', '0', '568', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('829', '0', '53', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('830', '0', '468', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('831', '0', '679', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('832', '0', '601', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('833', '0', '23', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('834', '0', '480', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('835', '0', '368', '53', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('836', '0', '305', '53', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('837', '0', '567', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('838', '0', '446', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('839', '0', '227', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('840', '0', '129', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('841', '0', '123', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('842', '0', '584', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('843', '0', '13', '54', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('844', '0', '1', '54', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('845', '0', '16', '54', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('846', '3', '262', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('847', '1', '25', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('848', '0', '670', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('849', '0', '409', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('850', '0', '673', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('851', '0', '265', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('852', '0', '510', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('853', '1', '568', '54', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('854', '0', '141', '54', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('855', '0', '468', '55', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('856', '0', '3', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('857', '0', '92', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('858', '0', '26', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('859', '0', '224', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('860', '0', '226', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('861', '0', '1', '55', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('862', '0', '14', '55', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('863', '0', '314', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('864', '0', '568', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('865', '0', '262', '55', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('866', '0', '119', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('867', '0', '578', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('868', '0', '473', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('869', '0', '418', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('870', '0', '549', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('871', '0', '53', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('872', '0', '368', '55', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('873', '0', '87', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('874', '0', '90', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('875', '0', '444', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('876', '0', '59', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('877', '0', '17', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('878', '0', '265', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('879', '0', '15', '56', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('880', '0', '314', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('881', '0', '6', '56', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('882', '0', '9', '56', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('883', '0', '568', '56', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('884', '0', '670', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('885', '0', '637', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('886', '0', '671', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('887', '0', '64', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('888', '0', '131', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('889', '0', '262', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('890', '0', '243', '56', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('891', '0', '119', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('892', '0', '470', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('893', '0', '435', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('894', '0', '446', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('895', '0', '13', '57', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('896', '0', '1', '57', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('897', '0', '438', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('898', '0', '666', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('899', '0', '23', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('900', '0', '18', '57', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('901', '0', '422', '57', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('902', '0', '136', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('903', '0', '155', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('904', '0', '473', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('905', '0', '123', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('906', '0', '265', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('907', '0', '568', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('908', '0', '262', '57', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('909', '0', '300', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('910', '0', '99', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('911', '0', '540', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('912', '0', '571', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('913', '0', '26', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('914', '0', '94', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('915', '0', '539', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('916', '0', '6', '58', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('917', '0', '20', '58', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('918', '0', '9', '58', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('919', '0', '305', '58', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('920', '0', '322', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('921', '0', '210', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('922', '0', '473', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('923', '0', '480', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('924', '0', '570', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('925', '0', '568', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('926', '0', '368', '58', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('927', '2', '54', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('928', '0', '583', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('929', '0', '444', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('930', '0', '571', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('931', '0', '99', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('932', '0', '17', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('933', '1', '265', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('934', '0', '52', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('935', '0', '1', '59', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('936', '0', '13', '59', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('937', '0', '16', '59', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('938', '2', '612', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('939', '0', '373', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('940', '0', '673', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('941', '0', '123', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('942', '1', '481', '59', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('943', '0', '568', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('944', '0', '620', '59', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('945', '0', '225', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('946', '0', '227', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('947', '0', '672', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('948', '0', '93', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('949', '0', '1', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('950', '0', '13', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('951', '0', '23', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('952', '0', '21', '60', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('953', '0', '503', '60', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('954', '0', '262', '60', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('955', '0', '367', '60', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('956', '0', '238', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('957', '0', '409', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('958', '0', '469', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('959', '0', '666', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('960', '0', '573', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('961', '0', '318', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('962', '0', '424', '60', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('963', '0', '119', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('964', '0', '446', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('965', '0', '334', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('966', '0', '237', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('967', '0', '539', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('968', '0', '15', '61', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('969', '0', '481', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('970', '0', '20', '61', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('971', '0', '1', '61', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('972', '0', '568', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('973', '0', '262', '61', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('974', '0', '670', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('975', '0', '638', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('976', '0', '128', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('977', '0', '314', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('978', '0', '667', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('979', '0', '503', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('980', '0', '569', '61', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('981', '0', '119', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('982', '0', '470', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('983', '0', '227', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('984', '0', '129', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('985', '0', '334', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('986', '0', '23', '62', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('987', '0', '224', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('988', '0', '123', '62', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('989', '0', '584', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('990', '0', '570', '62', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('991', '0', '568', '62', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('992', '0', '670', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('993', '0', '210', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('994', '0', '409', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('995', '0', '27', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('996', '0', '510', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('997', '0', '262', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('998', '0', '368', '62', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('999', '0', '450', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1000', '0', '210', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1001', '0', '671', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1002', '0', '129', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1003', '0', '17', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1004', '0', '23', '63', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1005', '0', '584', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1006', '0', '226', '63', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1007', '1', '503', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1008', '0', '568', '63', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1009', '0', '569', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1010', '0', '501', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1011', '0', '473', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1012', '0', '273', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1013', '0', '208', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1014', '0', '265', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1015', '1', '665', '63', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1016', '0', '633', '63', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1017', '0', '450', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1018', '0', '444', '64', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1019', '0', '26', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1020', '0', '129', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1021', '0', '334', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1022', '0', '314', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1023', '0', '545', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1024', '0', '17', '64', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1025', '0', '229', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1026', '0', '305', '64', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1027', '0', '568', '64', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1028', '0', '670', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1029', '0', '227', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1030', '0', '338', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1031', '0', '134', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1032', '0', '27', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1033', '0', '349', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1034', '0', '141', '64', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1035', '0', '450', '65', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1036', '0', '227', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1037', '0', '307', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1038', '0', '446', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1039', '0', '409', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1040', '0', '17', '65', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1041', '0', '23', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1042', '0', '666', '65', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1043', '0', '52', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1044', '0', '27', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1045', '0', '318', '65', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1046', '0', '501', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1047', '0', '309', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1048', '0', '583', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1049', '0', '171', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1050', '0', '224', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1051', '0', '569', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1052', '0', '541', '65', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1053', '0', '468', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1054', '0', '671', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1055', '0', '196', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1056', '0', '474', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1057', '0', '440', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1058', '0', '447', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1059', '0', '666', '66', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1060', '0', '584', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1061', '0', '314', '66', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1062', '0', '481', '66', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1063', '0', '568', '66', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1064', '0', '612', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1065', '0', '583', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1066', '0', '638', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1067', '0', '624', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1068', '0', '667', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1069', '0', '367', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1070', '0', '503', '66', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1071', '0', '468', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1072', '0', '26', '67', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1073', '0', '674', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1074', '0', '129', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1075', '0', '27', '67', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1076', '0', '668', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1077', '0', '439', '67', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1078', '0', '94', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1079', '0', '577', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1080', '0', '665', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1081', '1', '514', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1082', '0', '225', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1083', '0', '197', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1084', '0', '544', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1085', '0', '546', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1086', '0', '511', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1087', '1', '569', '67', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1088', '0', '271', '67', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1089', '0', '87', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1090', '0', '446', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1091', '0', '473', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1092', '0', '334', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1093', '0', '439', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1094', '0', '23', '68', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1095', '0', '224', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1096', '0', '404', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1097', '0', '568', '68', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1098', '0', '53', '68', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1099', '0', '541', '68', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1100', '0', '501', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1101', '0', '210', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1102', '0', '129', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1103', '0', '331', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1104', '0', '265', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1105', '0', '665', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1106', '0', '543', '68', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1107', '0', '119', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1108', '0', '210', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1109', '0', '26', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1110', '0', '129', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1111', '0', '23', '69', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1112', '0', '539', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1113', '0', '584', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1114', '0', '274', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1115', '0', '314', '69', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1116', '0', '568', '69', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1117', '0', '262', '69', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1118', '0', '501', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1119', '0', '190', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1120', '0', '409', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1121', '0', '510', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1122', '0', '224', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1123', '0', '188', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1124', '0', '141', '69', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1125', '0', '450', '70', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1126', '0', '26', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1127', '0', '440', '70', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1128', '0', '470', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1129', '0', '17', '70', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1130', '0', '266', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1131', '0', '226', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1132', '0', '584', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1133', '0', '367', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1134', '0', '569', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1135', '0', '262', '70', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1136', '0', '211', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1137', '0', '679', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1138', '0', '502', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1139', '0', '374', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1140', '0', '52', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1141', '0', '620', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1142', '0', '120', '70', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1143', '0', '54', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1144', '0', '129', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1145', '0', '227', '71', null, null, '1', '1', null, '0');
INSERT INTO `playerteam` VALUES ('1146', '0', '26', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1147', '0', '537', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1148', '0', '52', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1149', '0', '123', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1150', '0', '314', '71', '1', null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1151', '0', '439', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1152', '0', '568', '71', null, '1', null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1153', '0', '262', '71', null, null, null, '1', null, '0');
INSERT INTO `playerteam` VALUES ('1154', '0', '81', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1155', '0', '553', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1156', '0', '409', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1157', '0', '539', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1158', '0', '270', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1159', '0', '569', '71', null, null, null, '0', null, '1');
INSERT INTO `playerteam` VALUES ('1160', '0', '386', '71', null, null, null, '0', null, '1');

-- ----------------------------
-- Table structure for `playerteamweek`
-- ----------------------------
DROP TABLE IF EXISTS `playerteamweek`;
CREATE TABLE `playerteamweek` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `playerteam` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `plays` tinyint(1) default NULL,
  `points` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerTeamWeek_playerteam_week` (`playerteam`,`week`),
  KEY `FK_PlayerTeamWeek_playerteam` (`playerteam`),
  KEY `FK_PlayerTeamWeek_week` (`week`),
  CONSTRAINT `FK_PlayerTeamWeek_playerteam` FOREIGN KEY (`playerteam`) REFERENCES `playerteam` (`id`),
  CONSTRAINT `FK_PlayerTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17905 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playerteamweek
-- ----------------------------
INSERT INTO `playerteamweek` VALUES ('13207', '0', '801', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13208', '0', '802', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13209', '0', '803', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13210', '0', '804', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13211', '0', '805', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13212', '0', '806', '12', '1', '36');
INSERT INTO `playerteamweek` VALUES ('13213', '0', '807', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13214', '0', '808', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13215', '0', '809', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13216', '0', '810', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13217', '0', '811', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13218', '0', '812', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13219', '0', '813', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13220', '0', '814', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13221', '0', '815', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13222', '0', '816', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13223', '0', '817', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13224', '0', '818', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13225', '0', '819', '12', '1', '10');
INSERT INTO `playerteamweek` VALUES ('13226', '0', '820', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13227', '0', '821', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13228', '0', '822', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13229', '0', '823', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13230', '0', '824', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13231', '0', '825', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13232', '0', '826', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13233', '0', '827', '12', '1', '9.5');
INSERT INTO `playerteamweek` VALUES ('13234', '0', '828', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13235', '0', '829', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13236', '0', '830', '12', '0', '7.5');
INSERT INTO `playerteamweek` VALUES ('13237', '0', '831', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13238', '0', '832', '12', '0', '0');
INSERT INTO `playerteamweek` VALUES ('13239', '0', '833', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13240', '0', '834', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13241', '0', '835', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13242', '0', '836', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13243', '0', '837', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13244', '0', '838', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13245', '0', '839', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13246', '0', '840', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13247', '0', '841', '12', '1', '23');
INSERT INTO `playerteamweek` VALUES ('13248', '0', '842', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13249', '0', '843', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13250', '0', '844', '12', '1', '14');
INSERT INTO `playerteamweek` VALUES ('13251', '0', '845', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13252', '0', '846', '12', '0', '6');
INSERT INTO `playerteamweek` VALUES ('13253', '0', '847', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13254', '0', '848', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13255', '0', '849', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13256', '0', '850', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13257', '0', '851', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13258', '0', '852', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13259', '0', '853', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13260', '0', '854', '12', '0', '7');
INSERT INTO `playerteamweek` VALUES ('13261', '0', '855', '12', '1', '7.5');
INSERT INTO `playerteamweek` VALUES ('13262', '0', '856', '12', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('13263', '0', '857', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13264', '0', '858', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13265', '0', '859', '12', '1', '9.5');
INSERT INTO `playerteamweek` VALUES ('13266', '0', '860', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13267', '0', '861', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13268', '0', '862', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13269', '0', '863', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13270', '0', '864', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13271', '0', '865', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13272', '0', '866', '12', '0', '6');
INSERT INTO `playerteamweek` VALUES ('13273', '0', '867', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13274', '0', '868', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13275', '0', '869', '12', '0', '13');
INSERT INTO `playerteamweek` VALUES ('13276', '0', '870', '12', '0', '7');
INSERT INTO `playerteamweek` VALUES ('13277', '0', '871', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13278', '0', '872', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13279', '0', '873', '12', '1', '2');
INSERT INTO `playerteamweek` VALUES ('13280', '0', '874', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13281', '0', '875', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13282', '0', '876', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13283', '0', '877', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13284', '0', '878', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13285', '0', '879', '12', '1', '36');
INSERT INTO `playerteamweek` VALUES ('13286', '0', '880', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13287', '0', '881', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13288', '0', '882', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13289', '0', '883', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13290', '0', '884', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13291', '0', '885', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13292', '0', '886', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13293', '0', '887', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13294', '0', '888', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13295', '0', '889', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13296', '0', '890', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13297', '0', '891', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13298', '0', '892', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13299', '0', '893', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13300', '0', '894', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13301', '0', '895', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13302', '0', '896', '12', '1', '14');
INSERT INTO `playerteamweek` VALUES ('13303', '0', '897', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13304', '0', '898', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13305', '0', '899', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13306', '0', '900', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13307', '0', '901', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13308', '0', '902', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13309', '0', '903', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13310', '0', '904', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13311', '0', '905', '12', '1', '23');
INSERT INTO `playerteamweek` VALUES ('13312', '0', '906', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13313', '0', '907', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13314', '0', '908', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13315', '0', '909', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13316', '0', '910', '12', '1', '11');
INSERT INTO `playerteamweek` VALUES ('13317', '0', '911', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13318', '0', '912', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13319', '0', '913', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13320', '0', '914', '12', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('13321', '0', '915', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13322', '0', '916', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13323', '0', '917', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13324', '0', '918', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13325', '0', '919', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13326', '0', '920', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13327', '0', '921', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13328', '0', '922', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13329', '0', '923', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13330', '0', '924', '12', '1', '11');
INSERT INTO `playerteamweek` VALUES ('13331', '0', '925', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13332', '0', '926', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13333', '0', '927', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13334', '0', '928', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13335', '0', '929', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13336', '0', '930', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13337', '0', '931', '12', '1', '11');
INSERT INTO `playerteamweek` VALUES ('13338', '0', '932', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13339', '0', '933', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13340', '0', '934', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13341', '0', '935', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13342', '0', '936', '12', '1', '12');
INSERT INTO `playerteamweek` VALUES ('13343', '0', '937', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13344', '0', '938', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13345', '0', '939', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13346', '0', '940', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13347', '0', '941', '12', '0', '23');
INSERT INTO `playerteamweek` VALUES ('13348', '0', '942', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13349', '0', '943', '12', '0', '8');
INSERT INTO `playerteamweek` VALUES ('13350', '0', '944', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13351', '0', '945', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13352', '0', '946', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13353', '0', '947', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13354', '0', '948', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13355', '0', '949', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13356', '0', '950', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13357', '0', '951', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13358', '0', '952', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13359', '0', '953', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13360', '0', '954', '12', '1', '12');
INSERT INTO `playerteamweek` VALUES ('13361', '0', '955', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13362', '0', '956', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13363', '0', '957', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13364', '0', '958', '12', '0', '5.5');
INSERT INTO `playerteamweek` VALUES ('13365', '0', '959', '12', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('13366', '0', '960', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13367', '0', '961', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13368', '0', '962', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13369', '0', '963', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13370', '0', '964', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13371', '0', '965', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13372', '0', '966', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13373', '0', '967', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13374', '0', '968', '12', '1', '36');
INSERT INTO `playerteamweek` VALUES ('13375', '0', '969', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13376', '0', '970', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13377', '0', '971', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13378', '0', '972', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13379', '0', '973', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13380', '0', '974', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13381', '0', '975', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13382', '0', '976', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13383', '0', '977', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13384', '0', '978', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13385', '0', '979', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13386', '0', '980', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13387', '0', '981', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13388', '0', '982', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13389', '0', '983', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13390', '0', '984', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13391', '0', '985', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13392', '0', '986', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13393', '0', '987', '12', '1', '9.5');
INSERT INTO `playerteamweek` VALUES ('13394', '0', '988', '12', '1', '23');
INSERT INTO `playerteamweek` VALUES ('13395', '0', '989', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13396', '0', '990', '12', '1', '11');
INSERT INTO `playerteamweek` VALUES ('13397', '0', '991', '12', '1', '16');
INSERT INTO `playerteamweek` VALUES ('13398', '0', '992', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13399', '0', '993', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13400', '0', '994', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13401', '0', '995', '12', '1', '17');
INSERT INTO `playerteamweek` VALUES ('13402', '0', '996', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13403', '0', '997', '12', '0', '6');
INSERT INTO `playerteamweek` VALUES ('13404', '0', '998', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13405', '0', '999', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13406', '0', '1000', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13407', '0', '1001', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13408', '0', '1002', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13409', '0', '1003', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13410', '0', '1004', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13411', '0', '1005', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13412', '0', '1006', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13413', '0', '1007', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13414', '0', '1008', '12', '1', '16');
INSERT INTO `playerteamweek` VALUES ('13415', '0', '1009', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13416', '0', '1010', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13417', '0', '1011', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13418', '0', '1012', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13419', '0', '1013', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13420', '0', '1014', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13421', '0', '1015', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13422', '0', '1016', '12', '0', '16');
INSERT INTO `playerteamweek` VALUES ('13423', '0', '1017', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13424', '0', '1018', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13425', '0', '1019', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13426', '0', '1020', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13427', '0', '1021', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13428', '0', '1022', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13429', '0', '1023', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13430', '0', '1024', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13431', '0', '1025', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13432', '0', '1026', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13433', '0', '1027', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13434', '0', '1028', '12', '0', '14');
INSERT INTO `playerteamweek` VALUES ('13435', '0', '1029', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13436', '0', '1030', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13437', '0', '1031', '12', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('13438', '0', '1032', '12', '1', '17');
INSERT INTO `playerteamweek` VALUES ('13439', '0', '1033', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13440', '0', '1034', '12', '0', '7');
INSERT INTO `playerteamweek` VALUES ('13441', '0', '1035', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13442', '0', '1036', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13443', '0', '1037', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13444', '0', '1038', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13445', '0', '1039', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13446', '0', '1040', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13447', '0', '1041', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13448', '0', '1042', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13449', '0', '1043', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13450', '0', '1044', '12', '1', '17');
INSERT INTO `playerteamweek` VALUES ('13451', '0', '1045', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13452', '0', '1046', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13453', '0', '1047', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13454', '0', '1048', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13455', '0', '1049', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13456', '0', '1050', '12', '0', '9.5');
INSERT INTO `playerteamweek` VALUES ('13457', '0', '1051', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13458', '0', '1052', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13459', '0', '1053', '12', '1', '7.5');
INSERT INTO `playerteamweek` VALUES ('13460', '0', '1054', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13461', '0', '1055', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13462', '0', '1056', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13463', '0', '1057', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13464', '0', '1058', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13465', '0', '1059', '12', '1', '9');
INSERT INTO `playerteamweek` VALUES ('13466', '0', '1060', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13467', '0', '1061', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13468', '0', '1062', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13469', '0', '1063', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13470', '0', '1064', '12', '0', '0');
INSERT INTO `playerteamweek` VALUES ('13471', '0', '1065', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13472', '0', '1066', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13473', '0', '1067', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13474', '0', '1068', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13475', '0', '1069', '12', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('13476', '0', '1070', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13477', '0', '1071', '12', '1', '7.5');
INSERT INTO `playerteamweek` VALUES ('13478', '0', '1072', '12', '1', '11');
INSERT INTO `playerteamweek` VALUES ('13479', '0', '1073', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13480', '0', '1074', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13481', '0', '1075', '12', '1', '17');
INSERT INTO `playerteamweek` VALUES ('13482', '0', '1076', '12', '1', '1');
INSERT INTO `playerteamweek` VALUES ('13483', '0', '1077', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13484', '0', '1078', '12', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('13485', '0', '1079', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13486', '0', '1080', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13487', '0', '1081', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13488', '0', '1082', '12', '0', '6');
INSERT INTO `playerteamweek` VALUES ('13489', '0', '1083', '12', '0', '8');
INSERT INTO `playerteamweek` VALUES ('13490', '0', '1084', '12', '0', '3.5');
INSERT INTO `playerteamweek` VALUES ('13491', '0', '1085', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13492', '0', '1086', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13493', '0', '1087', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13494', '0', '1088', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13495', '0', '1089', '12', '1', '2');
INSERT INTO `playerteamweek` VALUES ('13496', '0', '1090', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13497', '0', '1091', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13498', '0', '1092', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13499', '0', '1093', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13500', '0', '1094', '12', '1', '12');
INSERT INTO `playerteamweek` VALUES ('13501', '0', '1095', '12', '1', '9.5');
INSERT INTO `playerteamweek` VALUES ('13502', '0', '1096', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13503', '0', '1097', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13504', '0', '1098', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13505', '0', '1099', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13506', '0', '1100', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13507', '0', '1101', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13508', '0', '1102', '12', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('13509', '0', '1103', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13510', '0', '1104', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13511', '0', '1105', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13512', '0', '1106', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13513', '0', '1107', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13514', '0', '1108', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13515', '0', '1109', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13516', '0', '1110', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13517', '0', '1111', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13518', '0', '1112', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13519', '0', '1113', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13520', '0', '1114', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13521', '0', '1115', '12', '1', '10');
INSERT INTO `playerteamweek` VALUES ('13522', '0', '1116', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13523', '0', '1117', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13524', '0', '1118', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13525', '0', '1119', '12', '0', '7');
INSERT INTO `playerteamweek` VALUES ('13526', '0', '1120', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13527', '0', '1121', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13528', '0', '1122', '12', '1', '9.5');
INSERT INTO `playerteamweek` VALUES ('13529', '0', '1123', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13530', '0', '1124', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13531', '0', '1125', '12', '1', '10');
INSERT INTO `playerteamweek` VALUES ('13532', '0', '1126', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13533', '0', '1127', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13534', '0', '1128', '12', '1', '7');
INSERT INTO `playerteamweek` VALUES ('13535', '0', '1129', '12', '1', '0');
INSERT INTO `playerteamweek` VALUES ('13536', '0', '1130', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13537', '0', '1131', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13538', '0', '1132', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13539', '0', '1133', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13540', '0', '1134', '12', '1', '3');
INSERT INTO `playerteamweek` VALUES ('13541', '0', '1135', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13542', '0', '1136', '12', '0', '7');
INSERT INTO `playerteamweek` VALUES ('13543', '0', '1137', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13544', '0', '1138', '12', '0', '6');
INSERT INTO `playerteamweek` VALUES ('13545', '0', '1139', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13546', '0', '1140', '12', '0', '5.5');
INSERT INTO `playerteamweek` VALUES ('13547', '0', '1141', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('13548', '0', '1142', '12', '0', '4');
INSERT INTO `playerteamweek` VALUES ('13549', '0', '1143', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13550', '0', '1144', '12', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('13551', '0', '1145', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13552', '0', '1146', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13553', '0', '1147', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13554', '0', '1148', '12', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('13555', '0', '1149', '12', '1', '23');
INSERT INTO `playerteamweek` VALUES ('13556', '0', '1150', '12', '1', '10');
INSERT INTO `playerteamweek` VALUES ('13557', '0', '1151', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13558', '0', '1152', '12', '1', '8');
INSERT INTO `playerteamweek` VALUES ('13559', '0', '1153', '12', '1', '6');
INSERT INTO `playerteamweek` VALUES ('13560', '0', '1154', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13561', '0', '1155', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13562', '0', '1156', '12', '1', '5');
INSERT INTO `playerteamweek` VALUES ('13563', '0', '1157', '12', '1', '4');
INSERT INTO `playerteamweek` VALUES ('13564', '0', '1158', '12', '0', null);
INSERT INTO `playerteamweek` VALUES ('13565', '0', '1159', '12', '0', '3');
INSERT INTO `playerteamweek` VALUES ('13566', '0', '1160', '12', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17545', '0', '801', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17546', '0', '802', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17547', '0', '803', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17548', '0', '804', '13', '1', '0.5');
INSERT INTO `playerteamweek` VALUES ('17549', '0', '805', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17550', '0', '806', '13', '1', '17');
INSERT INTO `playerteamweek` VALUES ('17551', '0', '807', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17552', '0', '808', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17553', '0', '809', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17554', '0', '810', '13', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('17555', '0', '811', '13', '1', '19');
INSERT INTO `playerteamweek` VALUES ('17556', '0', '812', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17557', '0', '813', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17558', '0', '814', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17559', '0', '815', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17560', '0', '816', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17561', '0', '817', '13', '0', '18');
INSERT INTO `playerteamweek` VALUES ('17562', '0', '818', '13', '0', '22');
INSERT INTO `playerteamweek` VALUES ('17563', '0', '819', '13', '1', '20');
INSERT INTO `playerteamweek` VALUES ('17564', '0', '820', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17565', '0', '821', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17566', '0', '822', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17567', '0', '823', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17568', '0', '824', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17569', '0', '825', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17570', '0', '826', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17571', '0', '827', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17572', '0', '828', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17573', '0', '829', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17574', '0', '830', '13', '0', '8');
INSERT INTO `playerteamweek` VALUES ('17575', '0', '831', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17576', '0', '832', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17577', '0', '833', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17578', '0', '834', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17579', '0', '835', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17580', '0', '836', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17581', '0', '837', '13', '1', '10');
INSERT INTO `playerteamweek` VALUES ('17582', '0', '838', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17583', '0', '839', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17584', '0', '840', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17585', '0', '841', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17586', '0', '842', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17587', '0', '843', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17588', '0', '844', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17589', '0', '845', '13', '1', '19');
INSERT INTO `playerteamweek` VALUES ('17590', '0', '846', '13', '0', '3');
INSERT INTO `playerteamweek` VALUES ('17591', '0', '847', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17592', '0', '848', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17593', '0', '849', '13', '0', '4');
INSERT INTO `playerteamweek` VALUES ('17594', '0', '850', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17595', '0', '851', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17596', '0', '852', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17597', '0', '853', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17598', '0', '854', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17599', '0', '855', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17600', '0', '856', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17601', '0', '857', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17602', '0', '858', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17603', '0', '859', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17604', '0', '860', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17605', '0', '861', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17606', '0', '862', '13', '1', '13');
INSERT INTO `playerteamweek` VALUES ('17607', '0', '863', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17608', '0', '864', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17609', '0', '865', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17610', '0', '866', '13', '0', '15');
INSERT INTO `playerteamweek` VALUES ('17611', '0', '867', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17612', '0', '868', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17613', '0', '869', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17614', '0', '870', '13', '1', '6.5');
INSERT INTO `playerteamweek` VALUES ('17615', '0', '871', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17616', '0', '872', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17617', '0', '873', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17618', '0', '874', '13', '1', '2.5');
INSERT INTO `playerteamweek` VALUES ('17619', '0', '875', '13', '1', '11.5');
INSERT INTO `playerteamweek` VALUES ('17620', '0', '876', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17621', '0', '877', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17622', '0', '878', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17623', '0', '879', '13', '1', '17');
INSERT INTO `playerteamweek` VALUES ('17624', '0', '880', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17625', '0', '881', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17626', '0', '882', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17627', '0', '883', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17628', '0', '884', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17629', '0', '885', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17630', '0', '886', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17631', '0', '887', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17632', '0', '888', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17633', '0', '889', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17634', '0', '890', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17635', '0', '891', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17636', '0', '892', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17637', '0', '893', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17638', '0', '894', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17639', '0', '895', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17640', '0', '896', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17641', '0', '897', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17642', '0', '898', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17643', '0', '899', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17644', '0', '900', '13', '1', '10');
INSERT INTO `playerteamweek` VALUES ('17645', '0', '901', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17646', '0', '902', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17647', '0', '903', '13', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('17648', '0', '904', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17649', '0', '905', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17650', '0', '906', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17651', '0', '907', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17652', '0', '908', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17653', '0', '909', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17654', '0', '910', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17655', '0', '911', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17656', '0', '912', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17657', '0', '913', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17658', '0', '914', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17659', '0', '915', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17660', '0', '916', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17661', '0', '917', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17662', '0', '918', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17663', '0', '919', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17664', '0', '920', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17665', '0', '921', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17666', '0', '922', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17667', '0', '923', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17668', '0', '924', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17669', '0', '925', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17670', '0', '926', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17671', '0', '927', '13', '1', '1');
INSERT INTO `playerteamweek` VALUES ('17672', '0', '928', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17673', '0', '929', '13', '1', '11.5');
INSERT INTO `playerteamweek` VALUES ('17674', '0', '930', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17675', '0', '931', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17676', '0', '932', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17677', '0', '933', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17678', '0', '934', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17679', '0', '935', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17680', '0', '936', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17681', '0', '937', '13', '1', '19');
INSERT INTO `playerteamweek` VALUES ('17682', '0', '938', '13', '0', '4');
INSERT INTO `playerteamweek` VALUES ('17683', '0', '939', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17684', '0', '940', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17685', '0', '941', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17686', '0', '942', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17687', '0', '943', '13', '0', '5.5');
INSERT INTO `playerteamweek` VALUES ('17688', '0', '944', '13', '0', '22');
INSERT INTO `playerteamweek` VALUES ('17689', '0', '945', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17690', '0', '946', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17691', '0', '947', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17692', '0', '948', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17693', '0', '949', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17694', '0', '950', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17695', '0', '951', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17696', '0', '952', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17697', '0', '953', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17698', '0', '954', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17699', '0', '955', '13', '1', '10');
INSERT INTO `playerteamweek` VALUES ('17700', '0', '956', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17701', '0', '957', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17702', '0', '958', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17703', '0', '959', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17704', '0', '960', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17705', '0', '961', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17706', '0', '962', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17707', '0', '963', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17708', '0', '964', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17709', '0', '965', '13', '1', '0.5');
INSERT INTO `playerteamweek` VALUES ('17710', '0', '966', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17711', '0', '967', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17712', '0', '968', '13', '1', '17');
INSERT INTO `playerteamweek` VALUES ('17713', '0', '969', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17714', '0', '970', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17715', '0', '971', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17716', '0', '972', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17717', '0', '973', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17718', '0', '974', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17719', '0', '975', '13', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('17720', '0', '976', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17721', '0', '977', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17722', '0', '978', '13', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('17723', '0', '979', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17724', '0', '980', '13', '0', '18');
INSERT INTO `playerteamweek` VALUES ('17725', '0', '981', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17726', '0', '982', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17727', '0', '983', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17728', '0', '984', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17729', '0', '985', '13', '1', '0.5');
INSERT INTO `playerteamweek` VALUES ('17730', '0', '986', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17731', '0', '987', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17732', '0', '988', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17733', '0', '989', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17734', '0', '990', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17735', '0', '991', '13', '1', '11');
INSERT INTO `playerteamweek` VALUES ('17736', '0', '992', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17737', '0', '993', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17738', '0', '994', '13', '0', '4');
INSERT INTO `playerteamweek` VALUES ('17739', '0', '995', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17740', '0', '996', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17741', '0', '997', '13', '0', '3');
INSERT INTO `playerteamweek` VALUES ('17742', '0', '998', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17743', '0', '999', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17744', '0', '1000', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17745', '0', '1001', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17746', '0', '1002', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17747', '0', '1003', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17748', '0', '1004', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17749', '0', '1005', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17750', '0', '1006', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17751', '0', '1007', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17752', '0', '1008', '13', '1', '11');
INSERT INTO `playerteamweek` VALUES ('17753', '0', '1009', '13', '1', '18');
INSERT INTO `playerteamweek` VALUES ('17754', '0', '1010', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17755', '0', '1011', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17756', '0', '1012', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17757', '0', '1013', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17758', '0', '1014', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17759', '0', '1015', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17760', '0', '1016', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17761', '0', '1017', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17762', '0', '1018', '13', '1', '23');
INSERT INTO `playerteamweek` VALUES ('17763', '0', '1019', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17764', '0', '1020', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17765', '0', '1021', '13', '1', '0.5');
INSERT INTO `playerteamweek` VALUES ('17766', '0', '1022', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17767', '0', '1023', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17768', '0', '1024', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17769', '0', '1025', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17770', '0', '1026', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17771', '0', '1027', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17772', '0', '1028', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17773', '0', '1029', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17774', '0', '1030', '13', '1', '4.5');
INSERT INTO `playerteamweek` VALUES ('17775', '0', '1031', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17776', '0', '1032', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17777', '0', '1033', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17778', '0', '1034', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17779', '0', '1035', '13', '1', '16');
INSERT INTO `playerteamweek` VALUES ('17780', '0', '1036', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17781', '0', '1037', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17782', '0', '1038', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17783', '0', '1039', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17784', '0', '1040', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17785', '0', '1041', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17786', '0', '1042', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17787', '0', '1043', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17788', '0', '1044', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17789', '0', '1045', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17790', '0', '1046', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17791', '0', '1047', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17792', '0', '1048', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17793', '0', '1049', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17794', '0', '1050', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17795', '0', '1051', '13', '1', '18');
INSERT INTO `playerteamweek` VALUES ('17796', '0', '1052', '13', '0', '6');
INSERT INTO `playerteamweek` VALUES ('17797', '0', '1053', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17798', '0', '1054', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17799', '0', '1055', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17800', '0', '1056', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17801', '0', '1057', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17802', '0', '1058', '13', '1', '11');
INSERT INTO `playerteamweek` VALUES ('17803', '0', '1059', '13', '1', '12');
INSERT INTO `playerteamweek` VALUES ('17804', '0', '1060', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17805', '0', '1061', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17806', '0', '1062', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17807', '0', '1063', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17808', '0', '1064', '13', '0', '4');
INSERT INTO `playerteamweek` VALUES ('17809', '0', '1065', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17810', '0', '1066', '13', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('17811', '0', '1067', '13', '0', '6');
INSERT INTO `playerteamweek` VALUES ('17812', '0', '1068', '13', '0', '4.5');
INSERT INTO `playerteamweek` VALUES ('17813', '0', '1069', '13', '0', '10');
INSERT INTO `playerteamweek` VALUES ('17814', '0', '1070', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17815', '0', '1071', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17816', '0', '1072', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17817', '0', '1073', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17818', '0', '1074', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17819', '0', '1075', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17820', '0', '1076', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17821', '0', '1077', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17822', '0', '1078', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17823', '0', '1079', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17824', '0', '1080', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17825', '0', '1081', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17826', '0', '1082', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17827', '0', '1083', '13', '1', '2.5');
INSERT INTO `playerteamweek` VALUES ('17828', '0', '1084', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17829', '0', '1085', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17830', '0', '1086', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17831', '0', '1087', '13', '1', '18');
INSERT INTO `playerteamweek` VALUES ('17832', '0', '1088', '13', '1', '3.5');
INSERT INTO `playerteamweek` VALUES ('17833', '0', '1089', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17834', '0', '1090', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17835', '0', '1091', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17836', '0', '1092', '13', '1', '0.5');
INSERT INTO `playerteamweek` VALUES ('17837', '0', '1093', '13', '1', '7.5');
INSERT INTO `playerteamweek` VALUES ('17838', '0', '1094', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17839', '0', '1095', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17840', '0', '1096', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17841', '0', '1097', '13', '1', '11');
INSERT INTO `playerteamweek` VALUES ('17842', '0', '1098', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17843', '0', '1099', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17844', '0', '1100', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17845', '0', '1101', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17846', '0', '1102', '13', '0', '6');
INSERT INTO `playerteamweek` VALUES ('17847', '0', '1103', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17848', '0', '1104', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17849', '0', '1105', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17850', '0', '1106', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17851', '0', '1107', '13', '1', '15');
INSERT INTO `playerteamweek` VALUES ('17852', '0', '1108', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17853', '0', '1109', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17854', '0', '1110', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17855', '0', '1111', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17856', '0', '1112', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17857', '0', '1113', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17858', '0', '1114', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17859', '0', '1115', '13', '1', '12');
INSERT INTO `playerteamweek` VALUES ('17860', '0', '1116', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17861', '0', '1117', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17862', '0', '1118', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17863', '0', '1119', '13', '0', '1');
INSERT INTO `playerteamweek` VALUES ('17864', '0', '1120', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17865', '0', '1121', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17866', '0', '1122', '13', '1', '8');
INSERT INTO `playerteamweek` VALUES ('17867', '0', '1123', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17868', '0', '1124', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17869', '0', '1125', '13', '1', '16');
INSERT INTO `playerteamweek` VALUES ('17870', '0', '1126', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17871', '0', '1127', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17872', '0', '1128', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17873', '0', '1129', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17874', '0', '1130', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17875', '0', '1131', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17876', '0', '1132', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17877', '0', '1133', '13', '1', '10');
INSERT INTO `playerteamweek` VALUES ('17878', '0', '1134', '13', '1', '18');
INSERT INTO `playerteamweek` VALUES ('17879', '0', '1135', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17880', '0', '1136', '13', '0', '3');
INSERT INTO `playerteamweek` VALUES ('17881', '0', '1137', '13', '0', '5');
INSERT INTO `playerteamweek` VALUES ('17882', '0', '1138', '13', '1', '7');
INSERT INTO `playerteamweek` VALUES ('17883', '0', '1139', '13', '1', '5');
INSERT INTO `playerteamweek` VALUES ('17884', '0', '1140', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17885', '0', '1141', '13', '0', '22');
INSERT INTO `playerteamweek` VALUES ('17886', '0', '1142', '13', '0', '6');
INSERT INTO `playerteamweek` VALUES ('17887', '0', '1143', '13', '1', '1');
INSERT INTO `playerteamweek` VALUES ('17888', '0', '1144', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17889', '0', '1145', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17890', '0', '1146', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17891', '0', '1147', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17892', '0', '1148', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17893', '0', '1149', '13', '1', '6');
INSERT INTO `playerteamweek` VALUES ('17894', '0', '1150', '13', '1', '12');
INSERT INTO `playerteamweek` VALUES ('17895', '0', '1151', '13', '1', '7.5');
INSERT INTO `playerteamweek` VALUES ('17896', '0', '1152', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17897', '0', '1153', '13', '1', '3');
INSERT INTO `playerteamweek` VALUES ('17898', '0', '1154', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17899', '0', '1155', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17900', '0', '1156', '13', '1', '4');
INSERT INTO `playerteamweek` VALUES ('17901', '0', '1157', '13', '1', '5.5');
INSERT INTO `playerteamweek` VALUES ('17902', '0', '1158', '13', '0', null);
INSERT INTO `playerteamweek` VALUES ('17903', '0', '1159', '13', '0', '18');
INSERT INTO `playerteamweek` VALUES ('17904', '0', '1160', '13', '0', null);

-- ----------------------------
-- Table structure for `playerweek`
-- ----------------------------
DROP TABLE IF EXISTS `playerweek`;
CREATE TABLE `playerweek` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `player` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `totalPoints` double default NULL,
  `olePoints` double default NULL,
  `cleanGoal` tinyint(1) default NULL,
  `ownGoal` int(11) default NULL,
  `mom` tinyint(1) default NULL,
  `goals` int(11) default NULL,
  `penaltyGoals` int(11) default NULL,
  `freeKickGoals` int(11) default NULL,
  `missedPenalties` int(11) default NULL,
  `cachedPenalties` int(11) default NULL,
  `yellowCard` tinyint(1) default NULL,
  `redCard` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerWeek_player_week` (`player`,`week`),
  KEY `FK_PlayerWeek_player` (`player`),
  KEY `FK_PlayerWeek_week` (`week`),
  CONSTRAINT `FK_PlayerWeek_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_PlayerWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playerweek
-- ----------------------------
INSERT INTO `playerweek` VALUES ('1', '0', '1', '1', '6', '6', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `positionteamweek`
-- ----------------------------
DROP TABLE IF EXISTS `positionteamweek`;
CREATE TABLE `positionteamweek` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `team` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `category` bigint(20) default NULL,
  `position` int(11) default NULL,
  `points` double default NULL,
  `weekPoints` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PositionTeamWeek_team_week` (`team`,`week`),
  KEY `FK_PositionTeamWeek_team` (`team`),
  KEY `FK_PositionTeamWeek_week` (`week`),
  KEY `FK_PositionTeamWeek_category` (`category`),
  CONSTRAINT `FK_PositionTeamWeek_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_PositionTeamWeek_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_PositionTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=835 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of positionteamweek
-- ----------------------------
INSERT INTO `positionteamweek` VALUES ('1', '1', '52', '11', '1', '5', '592', null);
INSERT INTO `positionteamweek` VALUES ('2', '1', '53', '11', '1', '1', '666', null);
INSERT INTO `positionteamweek` VALUES ('3', '1', '54', '11', '1', '2', '627', null);
INSERT INTO `positionteamweek` VALUES ('4', '1', '55', '11', '1', '3', '610', null);
INSERT INTO `positionteamweek` VALUES ('5', '1', '56', '11', '1', '9', '555.5', null);
INSERT INTO `positionteamweek` VALUES ('6', '1', '57', '11', '1', '4', '604', null);
INSERT INTO `positionteamweek` VALUES ('7', '1', '58', '11', '1', '7', '564', null);
INSERT INTO `positionteamweek` VALUES ('8', '1', '59', '11', '1', '10', '554.5', null);
INSERT INTO `positionteamweek` VALUES ('9', '1', '60', '11', '1', '6', '583.5', null);
INSERT INTO `positionteamweek` VALUES ('10', '1', '61', '11', '1', '8', '563', null);
INSERT INTO `positionteamweek` VALUES ('11', '1', '62', '11', '2', '2', '665.5', null);
INSERT INTO `positionteamweek` VALUES ('12', '1', '63', '11', '2', '3', '623', null);
INSERT INTO `positionteamweek` VALUES ('13', '1', '64', '11', '2', '4', '609.5', null);
INSERT INTO `positionteamweek` VALUES ('14', '1', '65', '11', '2', '5', '603.5', null);
INSERT INTO `positionteamweek` VALUES ('15', '1', '66', '11', '2', '1', '680.5', null);
INSERT INTO `positionteamweek` VALUES ('16', '1', '67', '11', '2', '6', '599', null);
INSERT INTO `positionteamweek` VALUES ('17', '1', '68', '11', '2', '8', '587.5', null);
INSERT INTO `positionteamweek` VALUES ('18', '1', '69', '11', '2', '7', '594.5', null);
INSERT INTO `positionteamweek` VALUES ('19', '1', '70', '11', '2', '9', '552', null);
INSERT INTO `positionteamweek` VALUES ('20', '1', '71', '11', '2', '10', '544', null);
INSERT INTO `positionteamweek` VALUES ('575', '1', '52', '12', '1', '5', '671', '79');
INSERT INTO `positionteamweek` VALUES ('576', '1', '53', '12', '1', '1', '736.5', '70.5');
INSERT INTO `positionteamweek` VALUES ('577', '1', '54', '12', '1', '2', '709.5', '82.5');
INSERT INTO `positionteamweek` VALUES ('578', '1', '55', '12', '1', '4', '685', '75');
INSERT INTO `positionteamweek` VALUES ('579', '1', '56', '12', '1', '9', '632', '76.5');
INSERT INTO `positionteamweek` VALUES ('580', '1', '57', '12', '1', '3', '692.5', '88.5');
INSERT INTO `positionteamweek` VALUES ('581', '1', '58', '12', '1', '8', '634.5', '70.5');
INSERT INTO `positionteamweek` VALUES ('582', '1', '59', '12', '1', '10', '613', '58.5');
INSERT INTO `positionteamweek` VALUES ('583', '1', '60', '12', '1', '7', '650.5', '67');
INSERT INTO `positionteamweek` VALUES ('584', '1', '61', '12', '1', '6', '653', '90');
INSERT INTO `positionteamweek` VALUES ('585', '1', '62', '12', '2', '1', '774.5', '109');
INSERT INTO `positionteamweek` VALUES ('586', '1', '63', '12', '2', '3', '679.5', '56.5');
INSERT INTO `positionteamweek` VALUES ('587', '1', '64', '12', '2', '4', '674', '64.5');
INSERT INTO `positionteamweek` VALUES ('588', '1', '65', '12', '2', '7', '665.5', '62');
INSERT INTO `positionteamweek` VALUES ('589', '1', '66', '12', '2', '2', '743', '62.5');
INSERT INTO `positionteamweek` VALUES ('590', '1', '67', '12', '2', '5', '668.5', '69.5');
INSERT INTO `positionteamweek` VALUES ('591', '1', '68', '12', '2', '8', '649', '61.5');
INSERT INTO `positionteamweek` VALUES ('592', '1', '69', '12', '2', '6', '666', '71.5');
INSERT INTO `positionteamweek` VALUES ('593', '1', '70', '12', '2', '10', '609', '57');
INSERT INTO `positionteamweek` VALUES ('594', '1', '71', '12', '2', '9', '624.5', '80.5');
INSERT INTO `positionteamweek` VALUES ('815', '1', '52', '13', '1', '5', '753', '82');
INSERT INTO `positionteamweek` VALUES ('816', '1', '53', '13', '1', '1', '809.5', '73');
INSERT INTO `positionteamweek` VALUES ('817', '1', '54', '13', '1', '2', '789', '79.5');
INSERT INTO `positionteamweek` VALUES ('818', '1', '55', '13', '1', '4', '756.5', '71.5');
INSERT INTO `positionteamweek` VALUES ('819', '1', '56', '13', '1', '9', '698.5', '66.5');
INSERT INTO `positionteamweek` VALUES ('820', '1', '57', '13', '1', '3', '762', '69.5');
INSERT INTO `positionteamweek` VALUES ('821', '1', '58', '13', '1', '8', '700.5', '66');
INSERT INTO `positionteamweek` VALUES ('822', '1', '59', '13', '1', '10', '690', '77');
INSERT INTO `positionteamweek` VALUES ('823', '1', '60', '13', '1', '7', '711', '60.5');
INSERT INTO `positionteamweek` VALUES ('824', '1', '61', '13', '1', '6', '726.5', '73.5');
INSERT INTO `positionteamweek` VALUES ('825', '1', '62', '13', '2', '1', '850', '75.5');
INSERT INTO `positionteamweek` VALUES ('826', '1', '63', '13', '2', '3', '753.5', '74');
INSERT INTO `positionteamweek` VALUES ('827', '1', '64', '13', '2', '5', '749', '75');
INSERT INTO `positionteamweek` VALUES ('828', '1', '65', '13', '2', '4', '750.5', '85');
INSERT INTO `positionteamweek` VALUES ('829', '1', '66', '13', '2', '2', '826.5', '83.5');
INSERT INTO `positionteamweek` VALUES ('830', '1', '67', '13', '2', '6', '748.5', '80');
INSERT INTO `positionteamweek` VALUES ('831', '1', '68', '13', '2', '8', '713', '64');
INSERT INTO `positionteamweek` VALUES ('832', '1', '69', '13', '2', '7', '739', '73');
INSERT INTO `positionteamweek` VALUES ('833', '1', '70', '13', '2', '9', '691.5', '82.5');
INSERT INTO `positionteamweek` VALUES ('834', '1', '71', '13', '2', '10', '686.5', '62');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `user` bigint(20) NOT NULL,
  `category` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Team_name` (`name`),
  KEY `FK_Team_user` (`user`),
  KEY `FK_Team_category` (`category`),
  CONSTRAINT `FK_Team_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_Team_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('52', '0', 'Botox', '52', '1');
INSERT INTO `team` VALUES ('53', '0', 'HRG F.C.', '53', '1');
INSERT INTO `team` VALUES ('54', '0', 'Viejita Stone', '54', '1');
INSERT INTO `team` VALUES ('55', '0', 'TRES', '55', '1');
INSERT INTO `team` VALUES ('56', '0', '15 de Octubre', '56', '1');
INSERT INTO `team` VALUES ('57', '0', 'Red Bull', '57', '1');
INSERT INTO `team` VALUES ('58', '0', 'Capussoto F.C.', '58', '1');
INSERT INTO `team` VALUES ('59', '0', 'QEE', '59', '1');
INSERT INTO `team` VALUES ('60', '0', 'GELP Ware Tech', '60', '1');
INSERT INTO `team` VALUES ('61', '0', 'Chapita de Cerveza Fóbal Clus', '61', '1');
INSERT INTO `team` VALUES ('62', '0', 'Los Super Ratones', '62', '2');
INSERT INTO `team` VALUES ('63', '0', 'La Bandita', '63', '2');
INSERT INTO `team` VALUES ('64', '0', 'Magia Negra', '64', '2');
INSERT INTO `team` VALUES ('65', '0', 'A.C. DECANO', '65', '2');
INSERT INTO `team` VALUES ('66', '0', 'La Filial', '66', '2');
INSERT INTO `team` VALUES ('67', '0', 'Hidrocarburo', '67', '2');
INSERT INTO `team` VALUES ('68', '0', 'FASA 13', '68', '2');
INSERT INTO `team` VALUES ('69', '0', 'ULTIMO RECURSO', '69', '2');
INSERT INTO `team` VALUES ('70', '0', 'Clockwork Orange', '70', '2');
INSERT INTO `team` VALUES ('71', '0', 'Los Golosos', '71', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_User_username` (`username`),
  UNIQUE KEY `UK_User_firstname_lastname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('52', '0', 'Ricardo', 'Berl', 'Pela', 'Pela');
INSERT INTO `user` VALUES ('53', '0', 'Leandro', 'Soncini', 'Chochi', 'Chochi');
INSERT INTO `user` VALUES ('54', '0', 'Francisco', 'Tabellione', 'Tabe', 'Tabe');
INSERT INTO `user` VALUES ('55', '0', 'Esteban', 'Sabbione', 'Tete', 'Tete');
INSERT INTO `user` VALUES ('56', '0', 'Tomas', 'Condorelli', 'Tommy', 'Tommy');
INSERT INTO `user` VALUES ('57', '0', 'Martín', 'Aristia', 'Martín', 'Martín');
INSERT INTO `user` VALUES ('58', '0', 'Franco', 'Condorelli', 'Catalano', 'Catalano');
INSERT INTO `user` VALUES ('59', '0', 'Nicolás', 'Condorelli', 'Coco', 'Coco');
INSERT INTO `user` VALUES ('60', '0', 'Augusto', 'Soncini', 'Agus', 'Agus');
INSERT INTO `user` VALUES ('61', '0', 'Matías', 'Condorelli', 'Pepi', 'Pepi');
INSERT INTO `user` VALUES ('62', '0', 'Mauro', 'Pennacchioni', 'Rata', 'Rata');
INSERT INTO `user` VALUES ('63', '0', 'Emilio', 'Tabellione', 'Emi', 'Emi');
INSERT INTO `user` VALUES ('64', '0', 'Andrés', 'García Olivares', 'Negro', 'Negro');
INSERT INTO `user` VALUES ('65', '0', 'Guillermo', 'Vallina', 'Guillote', 'Guillote');
INSERT INTO `user` VALUES ('66', '0', 'Mauro', 'DB', 'Papucho', 'Papucho');
INSERT INTO `user` VALUES ('67', '0', 'Adriano', 'Mucelli', 'Tano', 'Tano');
INSERT INTO `user` VALUES ('68', '0', 'Fabián', 'Sabbione', 'Cuñado', 'Cuñado');
INSERT INTO `user` VALUES ('69', '0', 'Sebastián', 'Fiori', 'Chocho', 'Chocho');
INSERT INTO `user` VALUES ('70', '0', 'Ignacio', 'Soncini', 'Iki', 'Iki');
INSERT INTO `user` VALUES ('71', '0', 'Gastón', 'Messineo', 'Vivi', 'Vivi');

-- ----------------------------
-- Table structure for `week`
-- ----------------------------
DROP TABLE IF EXISTS `week`;
CREATE TABLE `week` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Week_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of week
-- ----------------------------
INSERT INTO `week` VALUES ('1', '0', '1');
INSERT INTO `week` VALUES ('2', '0', '2');
INSERT INTO `week` VALUES ('3', '0', '3');
INSERT INTO `week` VALUES ('4', '0', '4');
INSERT INTO `week` VALUES ('5', '0', '5');
INSERT INTO `week` VALUES ('6', '0', '6');
INSERT INTO `week` VALUES ('7', '0', '7');
INSERT INTO `week` VALUES ('8', '0', '8');
INSERT INTO `week` VALUES ('9', '0', '9');
INSERT INTO `week` VALUES ('10', '0', '10');
INSERT INTO `week` VALUES ('11', '0', '11');
INSERT INTO `week` VALUES ('12', '0', '12');
INSERT INTO `week` VALUES ('13', '0', '13');
INSERT INTO `week` VALUES ('14', '0', '14');
INSERT INTO `week` VALUES ('15', '0', '15');
INSERT INTO `week` VALUES ('16', '0', '16');
INSERT INTO `week` VALUES ('17', '0', '17');
INSERT INTO `week` VALUES ('18', '0', '18');
INSERT INTO `week` VALUES ('19', '0', '19');
