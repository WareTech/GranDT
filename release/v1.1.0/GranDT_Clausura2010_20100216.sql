/*
MySQL Backup
Source Server Version: 5.0.45
Source Database: waretech_grandt
Date: 16/02/2010 03:03:50
*/


-- ----------------------------
--  Table structure for `access`
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `category`
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
--  Table structure for `club`
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
--  Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `key_` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `match_`
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
--  Table structure for `player`
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
) ENGINE=InnoDB AUTO_INCREMENT=1355 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `playermatch`
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
) ENGINE=InnoDB AUTO_INCREMENT=1471 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `playerposition`
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
--  Table structure for `playerteam`
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
  `number` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerTeam_player_team` (`player`,`team`),
  KEY `FK_PlayerTeam_player` (`player`),
  KEY `FK_PlayerTeam_team` (`team`),
  CONSTRAINT `FK_PlayerTeam_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_PlayerTeam_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1296 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `playerteamweek`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `playerweek`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `positionteamweek`
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
) ENGINE=InnoDB AUTO_INCREMENT=1576 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `user` bigint(20) NOT NULL,
  `category` bigint(20) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `tactic` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Team_name` (`name`),
  KEY `FK_Team_user` (`user`),
  KEY `FK_Team_category` (`category`),
  CONSTRAINT `FK_Team_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_Team_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_User_username` (`username`),
  UNIQUE KEY `UK_User_firstname_lastname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `useraccess`
-- ----------------------------
DROP TABLE IF EXISTS `useraccess`;
CREATE TABLE `useraccess` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `user` bigint(20) NOT NULL,
  `access` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_UserAccess_user` (`user`),
  KEY `FK_UserAccess_access` (`access`),
  CONSTRAINT `FK_UserAccess_access` FOREIGN KEY (`access`) REFERENCES `access` (`id`),
  CONSTRAINT `FK_UserAccess_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `week`
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
--  Records 
-- ----------------------------
INSERT INTO `access` VALUES ('1','1','MatchEdit.jsp!enabled','Edicion de Partido'),  ('2','0','WeekEdit.jsp!change','Calcular la fecha'),  ('3','0','AccessList.jsp','Lista de accesos'),  ('13','0','TeamEdit.jsp!change','Cambiar jugador de la lista'),  ('14','5','UserEdit.jsp!update','Edicion de usuario'),  ('15','0','TeamBuild.jsp!enabled','Construccion de Equipo'),  ('16','0','WeekList.jsp!tournamentStart','Comenzar torneo'),  ('17','0','EMailSend.jsp','Enviar eMail');
INSERT INTO `category` VALUES ('1','0','Primera A'),  ('2','0','Nacional B');
INSERT INTO `club` VALUES ('27','0','Vélez Sarsfield'),  ('28','0','San Lorenzo'),  ('29','0','River Plate'),  ('30','0','Newell\'s Old Boys'),  ('31','0','Lanús'),  ('32','0','Huracán'),  ('33','0','Estudiantes (La Plata)'),  ('34','0','Colón (Santa Fé)'),  ('35','0','Boca Jrs.'),  ('36','0','Tigre'),  ('37','0','Rosario Central'),  ('38','0','Racing Club'),  ('39','0','Independiente'),  ('40','0','Godoy Cruz (Mendoza)'),  ('41','0','Gimnasia y Esgrima (La Plata)'),  ('42','0','Chacarita Jrs.'),  ('43','0','Banfield'),  ('44','0','Atletico Tucumán'),  ('45','0','Arsenal'),  ('46','0','Argentinos Jrs.');
INSERT INTO `configuration` VALUES ('1','6','started','false');
INSERT INTO `match_` VALUES ('41','1','5','27','39',NULL,NULL,'2009-09-13',NULL),  ('42','1','5','33','32',NULL,NULL,'2009-09-13',NULL),  ('43','1','5','40','35',NULL,NULL,'2009-09-13',NULL),  ('44','1','5','44','46',NULL,NULL,'2009-09-13',NULL),  ('45','1','5','30','31',NULL,NULL,'2009-09-13',NULL),  ('46','1','5','43','37',NULL,NULL,'2009-09-13',NULL),  ('47','1','5','42','34',NULL,NULL,'2009-09-13',NULL),  ('48','1','5','29','45',NULL,NULL,'2009-09-13',NULL),  ('49','1','5','36','41',NULL,NULL,'2009-09-13',NULL),  ('50','1','5','38','28',NULL,NULL,'2009-09-13',NULL),  ('51','1','6','39','38',NULL,NULL,'2009-09-20',NULL),  ('52','1','6','28','36',NULL,NULL,'2009-09-20',NULL),  ('53','1','6','41','29',NULL,NULL,'2009-09-20',NULL),  ('54','1','6','45','42',NULL,NULL,'2009-09-20',NULL),  ('55','1','6','30','43',NULL,NULL,'2009-09-20',NULL),  ('56','1','6','34','37',NULL,NULL,'2009-09-20',NULL),  ('57','1','6','31','44',NULL,NULL,'2009-09-20',NULL),  ('58','1','6','46','40',NULL,NULL,'2009-09-20',NULL),  ('59','1','6','35','33',NULL,NULL,'2009-09-20',NULL),  ('60','1','6','32','27',NULL,NULL,'2009-09-20',NULL),  ('61','1','7','36','39',NULL,NULL,'2009-09-27',NULL),  ('62','1','7','38','32',NULL,NULL,'2009-09-27',NULL),  ('63','1','7','27','35',NULL,NULL,'2009-09-27',NULL),  ('64','1','7','33','46',NULL,NULL,'2009-09-27',NULL),  ('65','1','7','40','31',NULL,NULL,'2009-09-27',NULL),  ('66','1','7','44','30',NULL,NULL,'2009-09-27',NULL),  ('67','1','7','43','34',NULL,NULL,'2009-09-27',NULL),  ('68','1','7','37','45',NULL,NULL,'2009-09-27',NULL),  ('69','1','7','42','41',NULL,NULL,'2009-09-27',NULL),  ('70','1','7','29','28',NULL,NULL,'2009-09-27',NULL),  ('71','1','8','35','38',NULL,NULL,'2009-10-04',NULL),  ('72','1','8','32','36',NULL,NULL,'2009-10-04',NULL),  ('73','1','8','39','29',NULL,NULL,'2009-10-04',NULL),  ('74','1','8','28','42',NULL,NULL,'2009-10-04',NULL),  ('75','1','8','44','43',NULL,NULL,'2009-10-04',NULL),  ('76','1','8','41','37',NULL,NULL,'2009-10-04',NULL),  ('77','1','8','45','34',NULL,NULL,'2009-10-04',NULL),  ('78','1','8','30','40',NULL,NULL,'2009-10-04',NULL),  ('79','1','8','31','33',NULL,NULL,'2009-10-04',NULL),  ('80','1','8','46','27',NULL,NULL,'2009-10-04',NULL),  ('81','1','9','42','39',NULL,NULL,'2009-10-07',NULL),  ('82','1','9','29','32',NULL,NULL,'2009-10-07',NULL),  ('83','1','9','36','35',NULL,NULL,'2009-10-07',NULL),  ('84','1','9','38','46',NULL,NULL,'2009-10-07',NULL),  ('85','1','9','27','31',NULL,NULL,'2009-10-07',NULL),  ('86','1','9','33','30',NULL,NULL,'2009-10-07',NULL),  ('87','1','9','40','44',NULL,NULL,'2009-10-07',NULL),  ('88','1','9','43','45',NULL,NULL,'2009-10-07',NULL),  ('89','1','9','34','41',NULL,NULL,'2009-10-07',NULL),  ('90','0','9','28','28',NULL,NULL,'2009-10-07',NULL),  ('91','0','9','37','37',NULL,NULL,'2009-10-07',NULL),  ('92','1','10','31','38',NULL,NULL,'2009-10-18',NULL),  ('93','1','10','46','36',NULL,NULL,'2009-10-18',NULL),  ('94','1','10','35','29',NULL,NULL,'2009-10-18',NULL),  ('95','1','10','32','42',NULL,NULL,'2009-10-18',NULL),  ('96','1','10','40','43',NULL,NULL,'2009-10-18',NULL),  ('97','1','10','39','37',NULL,NULL,'2009-10-18',NULL),  ('98','1','10','28','34',NULL,NULL,'2009-10-18',NULL),  ('99','1','10','41','45',NULL,NULL,'2009-10-18',NULL),  ('100','1','10','44','33',NULL,NULL,'2009-10-18',NULL),  ('101','1','10','30','27',NULL,NULL,'2009-10-18',NULL),  ('102','1','11','34','39',NULL,NULL,'2009-10-25',NULL),  ('103','1','11','37','32',NULL,NULL,'2009-10-25',NULL),  ('104','1','11','42','35',NULL,NULL,'2009-10-25',NULL),  ('105','1','11','29','46',NULL,NULL,'2009-10-25',NULL),  ('106','1','11','36','31',NULL,NULL,'2009-10-25',NULL),  ('107','1','11','38','30',NULL,NULL,'2009-10-25',NULL),  ('108','1','11','27','44',NULL,NULL,'2009-10-25',NULL),  ('109','1','11','33','40',NULL,NULL,'2009-10-25',NULL),  ('110','1','11','43','41',NULL,NULL,'2009-10-25',NULL),  ('111','1','11','45','28',NULL,NULL,'2009-10-25',NULL),  ('112','2','12','44','38','4','0','2009-10-28',NULL),  ('113','7','12','30','36','1','2','2009-10-28',NULL),  ('114','4','12','31','29','0','1','2009-10-28',NULL),  ('115','3','12','46','42','2','2','2009-10-28',NULL),  ('116','4','12','33','43','2','1','2009-10-28',NULL),  ('117','4','12','35','37','2','1','2009-10-28',NULL),  ('118','3','12','32','34','3','0','2009-10-28',NULL),  ('119','2','12','39','45','1','0','2009-10-28',NULL),  ('120','2','12','28','41','2','2','2009-10-28',NULL),  ('121','3','12','40','27','2','0','2009-10-28',NULL),  ('122','3','13','41','39','1','0','2009-11-01',NULL),  ('123','3','13','45','32','1','1','2009-11-01',NULL),  ('124','3','13','34','35','0','0','2009-11-01',NULL),  ('125','5','13','37','46','1','1','2009-11-01',NULL),  ('126','3','13','42','31','0','3','2009-11-01',NULL),  ('127','3','13','29','30','2','1','2009-11-01',NULL),  ('128','4','13','36','44','4','2','2009-11-01',NULL),  ('129','4','13','38','40','3','1','2009-11-01',NULL),  ('130','4','13','27','33','3','0','2009-11-01',NULL),  ('131','5','13','43','28','0','1','2009-11-01',NULL),  ('132','3','14','33','38','1','0','2009-11-08',NULL),  ('133','3','14','40','36','2','0','2009-11-08',NULL),  ('134','3','14','44','29','3','1','2009-11-08',NULL),  ('135','3','14','30','42','0','1','2009-11-08',NULL),  ('136','4','14','27','43','3','0','2009-11-08',NULL),  ('137','3','14','31','37','0','0','2009-11-08',NULL),  ('138','4','14','46','34','2','0','2009-11-08',NULL),  ('139','3','14','35','45','1','1','2009-11-08',NULL),  ('140','3','14','32','41','4','1','2009-11-08',NULL),  ('141','3','14','39','28','0','3','2009-11-08',NULL),  ('142','3','15','43','39','1','2','2009-11-15',NULL),  ('143','3','15','28','32','0','2','2009-11-15',NULL),  ('144','3','15','41','35','4','0','2009-11-15',NULL),  ('145','4','15','45','46','1','1','2009-11-15',NULL),  ('146','3','15','34','31','3','0','2009-11-15',NULL),  ('147','3','15','37','30','2','2','2009-11-15',NULL),  ('148','3','15','42','44','2','1','2009-11-15',NULL),  ('149','3','15','29','40','0','0','2009-11-15',NULL),  ('150','5','15','36','33','3','1','2009-11-15',NULL),  ('151','4','15','38','27','4','2','2009-11-15',NULL),  ('152','3','16','32','39','2','0','2009-11-22',NULL),  ('153','3','16','27','36','0','3','2009-11-22',NULL),  ('154','3','16','33','29','1','1','2009-11-22',NULL),  ('155','3','16','40','42','2','1','2009-11-22',NULL),  ('156','4','16','38','43','1','2','2009-11-22',NULL),  ('157','3','16','44','37','1','1','2009-11-22',NULL),  ('158','3','16','30','34','0','1','2009-11-22',NULL),  ('159','3','16','31','45','2','5','2009-11-22',NULL),  ('160','3','16','46','41','1','2','2009-11-22',NULL),  ('161','4','16','35','28','3','0','2009-11-22',NULL),  ('162','3','17','36','38','1','0','2009-11-29',NULL),  ('163','3','17','43','32','0','1','2009-11-29',NULL),  ('164','3','17','39','35','1','2','2009-11-29',NULL),  ('165','3','17','28','46','2','1','2009-11-29',NULL),  ('166','3','17','41','31','2','0','2009-11-29',NULL),  ('167','3','17','45','30','1','2','2009-11-29',NULL),  ('168','3','17','34','44','2','0','2009-11-29',NULL),  ('169','3','17','37','40','1','1','2009-11-29',NULL),  ('170','3','17','42','33','0','0','2009-11-29',NULL),  ('171','3','17','29','27','0','0','2009-11-29',NULL),  ('172','3','18','46','39','1','1','2009-12-06',NULL),  ('173','3','18','35','32','0','0','2009-12-06',NULL),  ('174','3','18','38','29','2','0','2009-12-06',NULL),  ('175','3','18','27','42','0','0','2009-12-06',NULL),  ('176','3','18','36','43','1','0','2009-12-06',NULL),  ('177','4','18','33','37','3','0','2009-12-06',NULL),  ('178','4','18','40','34','1','0','2009-12-06',NULL),  ('179','3','18','44','45','0','0','2009-12-06',NULL),  ('180','3','18','30','41','0','2','2009-12-06',NULL),  ('181','3','18','31','28','0','1','2009-12-06',NULL),  ('182','3','19','42','38','0','2','2009-12-13',NULL),  ('183','3','19','29','36','0','2','2009-12-13',NULL),  ('184','4','19','43','35','2','0','2009-12-13',NULL),  ('185','2','19','32','46','5','1','2009-12-13',NULL),  ('186','3','19','39','31','0','0','2009-12-13',NULL),  ('187','3','19','28','30','0','2','2009-12-13',NULL),  ('188','3','19','41','44','0','0','2009-12-13',NULL),  ('189','3','19','45','40','0','0','2009-12-13',NULL),  ('190','3','19','34','33','0','1','2009-12-13',NULL),  ('191','3','19','37','27','1','2','2009-12-13',NULL);
INSERT INTO `player` VALUES ('699','0','Luis','Ojeda',NULL,'46','1','1','0'),  ('700','0','Matías','Caruzzo',NULL,'46','2','2','0'),  ('701','0','Gonzalo','Prósperi',NULL,'46','2','1','0'),  ('702','0','Matías','Laba',NULL,'46','3','1','0'),  ('703','0','Néstor','Ortigoza',NULL,'46','3','2','1'),  ('704','0','Ignacio','Canuto',NULL,'46','2','2','1'),  ('705','0','Gustavo','Oberman',NULL,'46','4','1','0'),  ('706','0','Nicolás','Pavlovich',NULL,'46','4','1','0'),  ('707','0','Facundo','Coria',NULL,'46','3','1','0'),  ('708','0','Federico','Domínguez',NULL,'46','2','1','0'),  ('709','0','Gabriel','Frandino',NULL,'46','1','1','0'),  ('710','0','Nicolás','Berardo',NULL,'46','2','1','0'),  ('711','0','Andrés','Romero',NULL,'46','4','1','0'),  ('712','0','Matías','Rotondi',NULL,'46','4','1','0'),  ('713','0','Juan','Sabia',NULL,'46','2','1','0'),  ('714','0','Ismael','Sosa',NULL,'46','4','1','0'),  ('715','0','Lucas','Rodríguez',NULL,'46','2','1','0'),  ('716','0','Julián','Fernández',NULL,'46','2','1','0'),  ('717','0','Santiago','Raymonda',NULL,'46','3','1','0'),  ('718','0','Nicolás','Peric',NULL,'46','1','1','0'),  ('719','0','Emilio','Hernández',NULL,'46','3','1','0'),  ('720','0','Germán','Basualdo',NULL,'46','3','1','0'),  ('721','0','Arturo','Mendoza',NULL,'46','3','1','0'),  ('722','0','Aníbal','Alarcon',NULL,'46','2','1','0'),  ('723','0','Nicolás','Gianni',NULL,'46','3','1','0'),  ('724','0','Sebastián','Jaime',NULL,'46','4','1','0'),  ('725','0','Santiago','Gentiletti',NULL,'46','2','1','0'),  ('726','0','Ludovico','Paulucci',NULL,'45','1','1','0'),  ('727','0','Mariano','Brau',NULL,'45','2','1','0'),  ('728','0','Matías','Perez',NULL,'45','2','1','0'),  ('729','0','Darío','Espínola',NULL,'45','2','1','0'),  ('730','0','Franco','Peppino',NULL,'45','2','1','0'),  ('731','0','Aníbal','Matellán',NULL,'45','2','2','0'),  ('732','0','Sergio','Sena',NULL,'45','3','1','0'),  ('733','0','Jonathan','López',NULL,'45','4','1','0'),  ('734','0','Federico','Poggi',NULL,'45','3','1','0'),  ('735','0','Darío','Benedetto',NULL,'45','4','1','0'),  ('736','0','Mariano','Martínez',NULL,'45','4','1','0'),  ('737','0','Nahuel','Sachetto',NULL,'45','3','1','0'),  ('738','0','Damián','Pérez',NULL,'45','2','1','0'),  ('739','0','Cristian','Tula',NULL,'45','2','2','0'),  ('740','0','Cristian','Campestrini',NULL,'45','1','2','0'),  ('741','0','Catriel','Orcellet',NULL,'45','1','1','0'),  ('742','0','Nicolás','Aguirre',NULL,'45','3','1','0'),  ('743','0','Diego','Galván',NULL,'45','3','2','0'),  ('744','0','Juan','Bottaro',NULL,'45','4','1','0'),  ('745','0','Cristian','Álvarez',NULL,'45','3','2','0'),  ('746','0','Javier','Yacuzzi',NULL,'45','3','2','0'),  ('747','0','Matías','Sierra',NULL,'45','3','1','0'),  ('748','0','Matías','Carabajal',NULL,'45','3','1','0'),  ('749','0','Víctor','Cuesta',NULL,'45','2','1','0'),  ('750','0','Hugo','Nervo',NULL,'45','2','1','0'),  ('751','0','Franco','Jara',NULL,'45','4','2','0'),  ('752','0','Iván','Marcone',NULL,'45','3','1','0'),  ('753','0','Facundo','Silva',NULL,'45','3','1','0'),  ('754','0','Claudio','Mosca',NULL,'45','3','1','0'),  ('755','0','Javier','Burrai',NULL,'45','1','1','0'),  ('756','0','Mauro','Matos',NULL,'45','4','1','0'),  ('757','0','Nicolás','Domingo',NULL,'45','3','1','0'),  ('758','0','Mauro','Óbolo',NULL,'45','3','1','0'),  ('759','0','Lucas','Ischuk',NULL,'44','1','1','0'),  ('760','0','Jorge','Morales',NULL,'44','2','1','0'),  ('761','0','Raúl','Saavedra',NULL,'44','2','1','0'),  ('762','0','Andrés','Bressán',NULL,'44','2','1','0'),  ('763','0','Martín','Granero',NULL,'44','3','1','0'),  ('764','0','Luis','Rodríguez',NULL,'44','4','1','0'),  ('765','0','Diego','Erroz',NULL,'44','3','1','0'),  ('766','0','Emmanuel','Gigliotti',NULL,'44','4','1','0'),  ('767','0','Claudio','Sarría',NULL,'44','3','1','0'),  ('768','0','César','Montiglio',NULL,'44','3','1','0'),  ('769','0','Iván','Benedetti',NULL,'44','1','1','0'),  ('770','0','Damián','Musto',NULL,'44','3','1','0'),  ('771','0','Pablo','Calandria',NULL,'44','4','1','0'),  ('772','0','Rodrigo','Herrera',NULL,'44','2','1','0'),  ('773','0','Deivis','Barone',NULL,'44','2','1','0'),  ('774','0','Matías','Villavicencio',NULL,'44','2','1','0'),  ('775','0','Javier','Páez',NULL,'44','2','1','0'),  ('776','0','César','More',NULL,'44','2','1','0'),  ('777','0','Matías','Escobar',NULL,'44','3','1','0'),  ('778','0','Fabio','Escobar',NULL,'44','4','1','0'),  ('779','0','Jonathan','Blanes',NULL,'44','3','1','0'),  ('780','0','Ricardo','Moreira',NULL,'44','2','1','0'),  ('781','0','Claudio','Vargas',NULL,'44','3','1','0'),  ('782','0','Matías','García',NULL,'44','3','1','0'),  ('783','0','Sebastián','Longo',NULL,'44','3','1','0'),  ('784','0','David','Drocco',NULL,'44','3','1','0'),  ('785','0','Cristian','Lucchetti',NULL,'43','1','3','0'),  ('786','0','Víctor','López',NULL,'43','2','2','0'),  ('787','0','Julio','Barraza',NULL,'43','2','1','0'),  ('788','0','Maximiliano','Bustos',NULL,'43','3','1','0'),  ('789','0','Marcelo','Bustamante',NULL,'43','2','1','0'),  ('790','0','Maximiliano','Laso',NULL,'43','3','1','0'),  ('791','0','James','Rodríguez',NULL,'43','3','1','0'),  ('792','0','Walter','Erviti',NULL,'43','3','3','0'),  ('793','0','Cristian','García',NULL,'43','4','1','0'),  ('794','0','Pablo','Vergara',NULL,'43','3','1','0'),  ('795','0','Federico','Sardella',NULL,'43','3','1','0'),  ('796','0','Sebastián','López',NULL,'43','1','1','0'),  ('797','0','Facundo','Ferreyra',NULL,'43','4','1','0'),  ('798','0','Marcelo','Quinteros',NULL,'43','3','1','0'),  ('799','0','José','Devaca',NULL,'43','2','1','0'),  ('800','0','Luis','Salmerón',NULL,'43','4','1','0'),  ('801','0','Emmanuel','Pío',NULL,'43','3','1','0'),  ('802','0','Santiago','Ladino',NULL,'43','2','1','0'),  ('803','0','Sebastián','Fernández',NULL,'43','4','2','0'),  ('804','0','Roberto','Battión',NULL,'43','3','1','1'),  ('805','0','Enrique','Bologna',NULL,'43','1','1','0'),  ('806','0','Julio','Marchant',NULL,'43','3','1','0'),  ('807','0','Ruben','Ramirez',NULL,'43','4','2','0'),  ('808','0','Jonathan','Maidana',NULL,'43','2','2','0'),  ('809','0','Mathías','Cardacio',NULL,'43','3','1','0'),  ('810','0','José','Shaffer',NULL,'43','2','2','0'),  ('811','0','Roberto','Abbondanzieri',NULL,'35','1','2','0'),  ('812','0','Hugo','Ibarra',NULL,'35','2','2','0'),  ('813','0','Sebastián','Battaglia',NULL,'35','3','3','0'),  ('814','0','Ezequiel','Muñoz',NULL,'35','2','1','0'),  ('815','0','Pablo','Mouche',NULL,'35','4','1','0'),  ('816','0','Gary','Medel',NULL,'35','3','2','1'),  ('817','0','Martín','Palermo',NULL,'35','4','3','0'),  ('818','0','Federico','Insúa',NULL,'35','3','2','0'),  ('819','0','Javier','García',NULL,'35','1','1','0'),  ('820','0','Sebastián','Prediger',NULL,'35','3','2','0'),  ('821','0','Ricardo','Noir',NULL,'35','4','1','0'),  ('822','0','Guillermo','Marino',NULL,'35','3','1','0'),  ('823','0','Matías','Giménez',NULL,'35','3','1','0'),  ('824','0','Luciano','Monzón',NULL,'35','2','1','0'),  ('825','0','Ariel','Rosada',NULL,'35','3','1','0'),  ('826','0','Juan','Krupoviesa',NULL,'35','2','1','0'),  ('827','0','Cristian','Chávez',NULL,'35','3','1','0'),  ('828','0','Cristian','Erbes',NULL,'35','3','1','0'),  ('829','0','Jonatan','Philippe',NULL,'35','4','1','0'),  ('830','0','Adrián','Gunino',NULL,'35','2','1','0'),  ('831','0','Gastón','Sauro',NULL,'35','2','1','0'),  ('832','0','Lucas','Viatri',NULL,'35','4','2','0'),  ('833','0','Nicolás','Gaitán',NULL,'35','3','3','0'),  ('834','0','Gabriel','Paletta',NULL,'35','2','2','0'),  ('835','0','Josué','Ayala',NULL,'35','1','1','0'),  ('836','0','Jesús','Méndez',NULL,'35','3','2','0'),  ('837','0','Julio','Barroso',NULL,'35','2','1','0'),  ('838','0','Leandro','Aguirre',NULL,'35','2','1','0'),  ('839','0','Breyner','Bonilla',NULL,'35','2','1','0'),  ('840','0','David','Achucarro',NULL,'35','2','1','0'),  ('841','0','Sergio','Araujo',NULL,'35','4','1','0'),  ('842','0','Lucas','Marín',NULL,'35','2','1','0'),  ('843','0','Sebastián','D\'Angelo',NULL,'35','1','1','0'),  ('844','0','Enzo','Ruiz',NULL,'35','2','1','0'),  ('845','0','Santiago','Villafañe',NULL,'35','2','1','0'),  ('846','0','Nicolás','Colazo',NULL,'35','3','1','0'),  ('847','0','Gastón','Rossi',NULL,'35','3','1','0'),  ('848','0','Luiz','Alberto',NULL,'35','2','1','0'),  ('849','0','Nicolás','Tauber',NULL,'42','1','1','0'),  ('850','0','Mariano','Echeverría',NULL,'42','2','2','1'),  ('851','0','Franco','Coria',NULL,'42','2','1','0'),  ('852','0','Fernando','Fontana',NULL,'42','2','1','0'),  ('853','0','Federico','Vismara',NULL,'42','3','1','0'),  ('854','0','Cristian','Grabinski',NULL,'42','2','1','0'),  ('855','0','Alejandro','Frezzotti',NULL,'42','3','1','0'),  ('856','0','Daniel','Ponce',NULL,'42','3','1','0'),  ('857','0','Cristian','Gutierrez',NULL,'42','2','1','0'),  ('858','0','Matías','Pisano',NULL,'42','3','1','0'),  ('859','0','Pedro','Fernández',NULL,'42','1','1','0'),  ('860','0','Emanuel','Centurión',NULL,'42','3','1','0'),  ('861','0','Lisandro','López',NULL,'42','2','1','0'),  ('862','0','Federico','Iñíguez',NULL,'42','3','1','0'),  ('863','0','Diego','Morales',NULL,'42','3','2','1'),  ('864','0','Sebastián','Sciorilli',NULL,'42','3','1','0'),  ('865','0','Facundo','Parra',NULL,'42','4','1','0'),  ('866','0','Daniel','Pereira',NULL,'42','3','1','0'),  ('867','0','Sebastián','Cejas',NULL,'42','1','1','0'),  ('868','0','Nicolás','Ramírez',NULL,'42','3','1','0'),  ('869','0','Omar','Zarif',NULL,'42','3','1','0'),  ('870','0','Diego','Crosa',NULL,'42','2','1','0'),  ('871','0','Jorge','Núñez',NULL,'42','2','1','0'),  ('872','0','Germán','Cano',NULL,'42','4','1','0'),  ('873','0','Emiliano','Strappini',NULL,'42','4','1','0'),  ('874','0','Fernando','Crosa',NULL,'42','2','1','0'),  ('875','0','Franco','Miranda',NULL,'42','2','1','0'),  ('876','0','Jorge','Myma',NULL,'42','3','1','0'),  ('877','0','Federico','Rosso',NULL,'42','2','1','0'),  ('878','0','Diego','Pozo',NULL,'34','1','2','0'),  ('879','0','Josimar','Mosquera',NULL,'34','2','1','0'),  ('880','0','Salustiano','Candia',NULL,'34','2','1','0'),  ('881','0','Ismael','Quílez',NULL,'34','2','1','0'),  ('882','0','Ariel','Garcé',NULL,'34','2','2','0'),  ('883','0','Cristian','Pellerano',NULL,'34','3','2','0'),  ('884','0','Eduardo','Coudet',NULL,'34','3','1','0'),  ('885','0','Federico','Nieto',NULL,'34','4','2','0'),  ('886','0','Lucas','Acosta',NULL,'34','4','1','0'),  ('887','0','Ricardo','Gómez',NULL,'34','3','2','0'),  ('888','0','Andrés','Bailo',NULL,'34','1','1','0'),  ('889','0','Germán','Rivarola',NULL,'34','2','2','0'),  ('890','0','Andres','Ríos',NULL,'34','4','1','0'),  ('891','0','Santiago','Soto',NULL,'34','4','1','0'),  ('892','0','Facundo','Bertoglio',NULL,'34','3','2','0'),  ('893','0','Nicolás','Torres',NULL,'34','3','1','0'),  ('894','0','Esteban','Fuertes',NULL,'34','4','3','0'),  ('895','0','Marcos','Díaz',NULL,'34','1','1','0'),  ('896','0','Alejandro','Capurro',NULL,'34','3','2','0'),  ('897','0','Mauro','Bellone',NULL,'34','3','1','0'),  ('898','0','Facundo','Sánchez',NULL,'34','3','1','0'),  ('899','0','Rodrigo','Canario',NULL,'34','4','1','0'),  ('900','0','Omar','Merlo',NULL,'34','2','1','0'),  ('901','0','Maximiliano','Caire',NULL,'34','2','1','0'),  ('902','0','Alfredo','Ramírez',NULL,'34','3','1','0'),  ('903','0','Iván','Gorosito',NULL,'34','1','1','0'),  ('904','0','Jonatan','Bauman',NULL,'34','4','1','0'),  ('905','0','Marcelo','Goux',NULL,'34','2','1','0'),  ('906','0','Mauricio','Mansilla',NULL,'34','2','1','0'),  ('907','0','Matías','Burne',NULL,'34','4','1','0'),  ('908','0','Johann','Laureiro',NULL,'34','3','1','0'),  ('909','0','Roberto','Fernández',NULL,'33','1','1','0'),  ('910','0','Leandro','Desábato',NULL,'33','2','2','0'),  ('911','0','Cristian','Cellay',NULL,'33','2','2','0'),  ('912','0','Raúl','Iberbia',NULL,'33','2','1','0'),  ('913','0','Matías','Sánchez',NULL,'33','3','1','0'),  ('914','0','Marcos','Rojo',NULL,'33','2','1','0'),  ('915','0','José','Sosa',NULL,'33','3','3','0'),  ('916','0','Enzo','Pérez',NULL,'33','3','2','0'),  ('917','0','Mauro','Boselli',NULL,'33','4','3','0'),  ('918','0','Marcelo','Carrusca',NULL,'33','3','2','0'),  ('919','0','César','Taborda',NULL,'33','1','1','0'),  ('920','0','Michael','Hoyos',NULL,'33','3','1','0'),  ('921','0','Marcos','Angeleri',NULL,'33','2','2','0'),  ('922','0','Darío','Stefanatto',NULL,'33','3','1','0'),  ('923','0','Germán','Ré',NULL,'33','2','2','0'),  ('924','0','Federico','Fernández',NULL,'33','2','1','0'),  ('925','0','Maximiliano','Núñez',NULL,'33','3','1','0'),  ('926','0','Ignacio','Cantaluppi',NULL,'33','3','1','0'),  ('927','0','Leandro','González',NULL,'33','4','1','0'),  ('928','0','Agustín','Orión',NULL,'33','1','2','0'),  ('929','0','Rodrigo','Braña',NULL,'33','3','2','0'),  ('930','0','Leandro','Benítez',NULL,'33','3','2','0'),  ('931','0','Leonardo','Sánchez',NULL,'33','2','1','0'),  ('932','0','Damián','Albil',NULL,'33','1','1','0'),  ('933','0','Juan','Huerta',NULL,'33','3','1','0'),  ('934','0','Matías','Sarulyte',NULL,'33','2','1','0'),  ('935','0','Roberto','Birge',NULL,'33','3','1','0'),  ('936','0','Clemente','Rodríguez',NULL,'33','2','2','0'),  ('937','0','Agustín','Silva',NULL,'33','1','1','0'),  ('938','0','Cristian','Gaitán',NULL,'33','3','1','0'),  ('939','0','Leonardo','Jara',NULL,'33','3','1','0'),  ('940','0','Diego','Auzqui',NULL,'33','3','1','0'),  ('941','0','Emanuel','López',NULL,'33','2','1','0'),  ('942','0','Fabián','Roskos',NULL,'33','2','1','0'),  ('943','0','Héctor','Morales',NULL,'33','3','1','0'),  ('944','0','Ianni','Verón',NULL,'33','3','1','0'),  ('945','0','Guido','Carrillo',NULL,'33','4','1','0'),  ('946','0','Máximo','Cantaluppi',NULL,'33','4','1','0'),  ('947','0','Guido','Cantaluppi',NULL,'33','3','1','0'),  ('948','0','Gastón','Sessa',NULL,'41','1','2','0'),  ('949','0','Patricio','Graff',NULL,'41','2','1','0'),  ('950','0','Álvaro','Ormeño',NULL,'41','2','2','0'),  ('951','0','Ariel','Agüero',NULL,'41','2','1','1'),  ('952','0','Juan','Cuevas',NULL,'41','4','1','0'),  ('953','0','Luciano','Aued',NULL,'41','3','2','0'),  ('954','0','Roberto','Sosa',NULL,'41','4','1','0'),  ('955','0','Mariano','Messera',NULL,'41','3','1','0'),  ('956','0','Diego','Villar',NULL,'41','3','2','0'),  ('957','0','Pablo','Bangardino',NULL,'41','1','1','0'),  ('958','0','Raúl','Albornoz',NULL,'41','2','1','0'),  ('959','0','Hugo','Iriarte',NULL,'41','2','1','0'),  ('960','0','Milton','Casco',NULL,'41','2','1','0'),  ('961','0','Lucas','Castro',NULL,'41','3','1','0'),  ('962','0','Sebastián','Romero',NULL,'41','3','2','0'),  ('963','0','José','Vizcarra',NULL,'41','4','1','0'),  ('964','0','Esteban','González',NULL,'41','3','1','0'),  ('965','0','Juan','Neira',NULL,'41','4','1','0'),  ('966','0','Fabián','Rinaudo',NULL,'41','3','2','0'),  ('967','0','Denis','Stracqualursi',NULL,'41','4','2','0'),  ('968','0','Néstor','Martinena',NULL,'41','4','1','0'),  ('969','0','Facundo','Imboden',NULL,'41','2','1','0'),  ('970','0','Hernan','Encina',NULL,'41','3','1','0'),  ('971','0','Dardo','Miloc',NULL,'41','2','1','0'),  ('972','0','Fernando','Monetti',NULL,'41','1','1','0'),  ('973','0','Gastón','Casas',NULL,'41','4','1','0'),  ('974','0','Rubén','Maldonado',NULL,'41','2','1','0'),  ('975','0','Marco','Pérez',NULL,'41','4','1','0'),  ('976','0','Israel','Roldán',NULL,'41','2','1','0'),  ('977','0','Joel','Carli',NULL,'41','2','1','0'),  ('978','0','Facundo','Quiroga',NULL,'41','4','1','0'),  ('979','0','Álvaro','Navarro',NULL,'41','4','1','0'),  ('980','0','Nelson','Ibáñez',NULL,'40','1','2','0'),  ('981','0','Leonardo','Sigali',NULL,'40','2','1','0'),  ('982','0','David','Ramírez',NULL,'40','3','1','0'),  ('983','0','Nicolás','Olmedo',NULL,'40','3','1','0'),  ('984','0','Lautaro','Formica',NULL,'40','2','1','0'),  ('985','0','Federico','Higuaín',NULL,'40','4','1','0'),  ('986','0','Daniel','Vega',NULL,'40','4','1','0'),  ('987','0','Cristian','Chávez',NULL,'40','4','1','0'),  ('988','0','César','Carranza',NULL,'40','4','2','1'),  ('989','0','Cristian','Aracena',NULL,'40','1','1','0'),  ('990','0','Sebastián','Martínez',NULL,'40','2','1','0'),  ('991','0','Francisco','Dutari',NULL,'40','2','1','0'),  ('992','0','Jesús','Vera',NULL,'40','4','1','0'),  ('993','0','Federico','Villegas',NULL,'40','3','1','0'),  ('994','0','Jairo','Castillo',NULL,'40','4','2','0'),  ('995','0','Martín','Aguirre',NULL,'40','3','1','0'),  ('996','0','Leandro','Torres',NULL,'40','3','1','0'),  ('997','0','Zelmar','García',NULL,'40','2','1','0'),  ('998','0','José','Ramírez',NULL,'40','1','1','0'),  ('999','0','Ariel','Rojas',NULL,'40','3','1','0'),  ('1000','0','Rodrigo','Salinas',NULL,'40','4','1','0'),  ('1001','0','Cristian','Cuevas',NULL,'40','2','1','0'),  ('1002','0','Jorge','Curbelo',NULL,'40','2','1','0'),  ('1003','0','Alejandro','Camargo',NULL,'40','3','1','0'),  ('1004','0','Nicolas','Triviño',NULL,'40','2','1','0'),  ('1005','0','Maximiliano','Alaniz',NULL,'40','4','1','0'),  ('1006','0','Sebastian','Torrico',NULL,'40','1','1','0'),  ('1007','0','Darío','Salomón',NULL,'40','2','1','0'),  ('1008','0','Paul','Martín',NULL,'40','3','1','0'),  ('1009','0','Gabriel','Moyano',NULL,'40','3','1','0'),  ('1010','0','Sebastián','Moyano',NULL,'40','1','1','0'),  ('1011','0','Paolo','Goltz',NULL,'32','2','2','0'),  ('1012','0','Pablo','Jerez',NULL,'32','2','1','0'),  ('1013','0','Gastón','Esmerado',NULL,'32','3','1','0'),  ('1014','0','Ezequiel','Filippetto',NULL,'32','2','1','0'),  ('1015','0','Andrés','Franzoia',NULL,'32','4','2','0'),  ('1016','0','Leandro','Díaz',NULL,'32','3','2','0'),  ('1017','0','Gustavo','Balvorín',NULL,'32','4','1','0'),  ('1018','0','Alan','Sánchez',NULL,'32','3','1','0'),  ('1019','0','Adrián','Peralta',NULL,'32','3','1','0'),  ('1020','0','Lucas','Calviño',NULL,'32','1','1','0'),  ('1021','0','Franco','Chiviló',NULL,'32','2','1','0'),  ('1022','0','Juan','Carrizo',NULL,'32','3','1','0'),  ('1023','0','Kevin','Cura',NULL,'32','2','1','0'),  ('1024','0','Federico','Laurito',NULL,'32','4','1','0'),  ('1025','0','Gastón','Machín',NULL,'32','3','1','0'),  ('1026','0','Patricio','Toranzo',NULL,'32','3','2','0'),  ('1027','0','Leandro','Benegas',NULL,'32','4','1','0'),  ('1028','0','Diego','Rodríguez',NULL,'32','2','1','0'),  ('1029','0','Gonzalo','García',NULL,'32','2','1','0'),  ('1030','0','Gaston','Monzón',NULL,'32','1','2','0'),  ('1031','0','Luciano','Nieto',NULL,'32','4','1','0'),  ('1032','0','Eduardo','Domínguez',NULL,'32','2','1','0'),  ('1033','0','Christian','Ortiz',NULL,'32','3','1','0'),  ('1034','0','Gino','Clara',NULL,'32','4','1','0'),  ('1035','0','Julián','Bottaro',NULL,'32','4','1','0'),  ('1036','0','Alejandro','Quintana',NULL,'32','4','1','0'),  ('1037','0','Guilllermo','Roffés',NULL,'32','4','1','0'),  ('1038','0','Lucas','Mareque',NULL,'39','2','2','0'),  ('1039','0','Luciano','Vella',NULL,'39','2','1','0'),  ('1040','0','Walter','Acevedo',NULL,'39','3','2','0'),  ('1041','0','Eduardo','Tuzzio',NULL,'39','2','2','0'),  ('1042','0','Walter','Busse',NULL,'39','3','2','0'),  ('1043','0','Lucas','Pusineri',NULL,'39','3','1','0'),  ('1044','0','Leonel','Nuñez',NULL,'39','4','1','0'),  ('1045','0','Patricio','Rodríguez',NULL,'39','3','2','0'),  ('1046','0','Andrés','Silvera',NULL,'39','4','2','0'),  ('1047','0','Adrián','Gabbarini',NULL,'39','1','2','0'),  ('1048','0','Julián','Velázquez',NULL,'39','2','1','0'),  ('1049','0','Lucas','Kruspzky',NULL,'39','2','1','0'),  ('1050','0','Fernando','Godoy',NULL,'39','3','1','0'),  ('1051','0','Federico','Gonzalez',NULL,'39','4','1','0'),  ('1052','0','Darío','Gandín',NULL,'39','4','3','0'),  ('1053','0','Martín','Gómez',NULL,'39','4','1','0'),  ('1054','0','Diego','Rodríguez',NULL,'39','1','1','0'),  ('1055','0','Ignacio','Piatti',NULL,'39','3','2','1'),  ('1056','0','Mariano','Berriex',NULL,'39','3','1','0'),  ('1057','0','Carlos','Matheu',NULL,'39','2','2','0'),  ('1058','0','Samuel','Cáceres',NULL,'39','2','1','0'),  ('1059','0','Leonel','Galeano',NULL,'39','2','2','0'),  ('1060','0','Federico','Mancuello',NULL,'39','3','1','0'),  ('1061','0','Sergio','Vittor',NULL,'39','3','1','0'),  ('1062','0','Hilario','Navarro',NULL,'39','1','1','0'),  ('1063','0','Ivan','Perez',NULL,'39','3','1','0'),  ('1064','0','Brian','Nieva',NULL,'39','4','1','0'),  ('1065','0','Roberto','Vissio',NULL,'39','3','1','0'),  ('1066','0','Héctor','Echagüe',NULL,'39','3','1','0'),  ('1067','0','Nicolás','Mazzola',NULL,'39','4','1','0'),  ('1068','0','Hernán','Fredes',NULL,'39','3','1','0'),  ('1069','0','Ángel','Puertas',NULL,'39','2','1','0'),  ('1070','0','Juan','Caracoche',NULL,'39','2','1','0'),  ('1071','0','Fernando','Perez',NULL,'39','3','1','0'),  ('1072','0','Pablo','Vitti',NULL,'39','4','1','0'),  ('1073','0','Jose','Moreno',NULL,'39','4','1','0'),  ('1074','0','Carlos','Báez',NULL,'39','2','1','0'),  ('1075','0','Leandro','Gracián',NULL,'39','3','2','0'),  ('1076','0','Agustín','Marchesín',NULL,'31','1','1','0'),  ('1077','0','Carlos','Quintana',NULL,'31','2','1','0'),  ('1078','0','Maximiliano','Velázquez',NULL,'31','2','2','0'),  ('1079','0','Hernán','Grana',NULL,'31','2','1','0'),  ('1080','0','Matías','Fritzler',NULL,'31','3','2','0'),  ('1081','0','Santiago','Biglieri',NULL,'31','4','1','0'),  ('1082','0','Agustín','Pelletieri',NULL,'31','3','2','0'),  ('1083','0','Cristian','Menéndez',NULL,'31','4','1','0'),  ('1084','0','Sebastián','Blanco',NULL,'31','3','3','0'),  ('1085','0','Gonzalo','Castillejos',NULL,'31','4','2','0'),  ('1086','0','Eduardo','Ledesma',NULL,'31','3','1','0'),  ('1087','0','Esteban','Andrada',NULL,'31','1','1','0'),  ('1088','0','Santiago','Salcedo',NULL,'31','4','2','0'),  ('1089','0','Mauricio','Caranta',NULL,'31','1','2','0'),  ('1090','0','Diego','Bielkiewicz',NULL,'31','4','1','0'),  ('1091','0','Santiago','Hoyos',NULL,'31','2','1','0'),  ('1092','0','Diego','Lagos',NULL,'31','3','2','0'),  ('1093','0','Emir','Faccioli',NULL,'31','2','1','0'),  ('1094','0','Marcos','Aguirre',NULL,'31','3','2','0'),  ('1095','0','Leonel','Pérez',NULL,'31','2','1','0'),  ('1096','0','Roberto','Dovetta',NULL,'31','4','1','0'),  ('1097','0','Carlos','Arce',NULL,'31','2','1','0'),  ('1098','0','Eric','Aparicio',NULL,'31','4','1','0'),  ('1099','0','Iván','Macalik',NULL,'31','2','1','0'),  ('1100','0','Ariel','Alarcón',NULL,'31','2','1','0'),  ('1101','0','Jorge','Pucheta',NULL,'31','1','1','0'),  ('1102','0','Javier','Arias',NULL,'31','4','1','0'),  ('1103','0','Gonzalo','Díaz',NULL,'31','3','1','0'),  ('1104','0','Diego','González',NULL,'31','3','1','0'),  ('1105','0','Luciano','Balbi',NULL,'31','2','1','0'),  ('1106','0','Maximiliano','Lugo',NULL,'31','2','1','0'),  ('1107','0','Mario','Zaninovic',NULL,'31','3','1','0'),  ('1108','0','Rodrigo','Erramuspe',NULL,'31','2','1','0'),  ('1109','0','Guido','Pizarro',NULL,'31','3','1','0'),  ('1110','0','Sebastián','Peratta',NULL,'30','1','2','1'),  ('1111','0','Alexis','Machuca',NULL,'30','2','1','0'),  ('1112','0','Juan','Quiroga',NULL,'30','2','1','0'),  ('1113','0','Agustin','Alayes',NULL,'30','2','2','0'),  ('1114','0','Diego','Mateo',NULL,'30','3','2','0'),  ('1115','0','Rolando','Schiavi',NULL,'30','2','3','0'),  ('1116','0','Lucas','Bernardi',NULL,'30','3','2','0'),  ('1117','0','Franco','Dolci',NULL,'30','3','1','0'),  ('1118','0','Cristian','Nuñez',NULL,'30','4','1','0'),  ('1119','0','Mauro','Formica',NULL,'30','3','3','0'),  ('1120','0','Diego','Torres',NULL,'30','4','1','0'),  ('1121','0','Lucas','Hoyos',NULL,'30','1','1','0'),  ('1122','0','Mauricio','Sperdutti',NULL,'30','3','1','0'),  ('1123','0','Nahuel','Roselli',NULL,'30','2','1','0'),  ('1124','0','Marcelo','Estigarribia',NULL,'30','3','1','0'),  ('1125','0','Jorge','Achucarro',NULL,'30','4','2','0'),  ('1126','0','Hugo','Barrientos',NULL,'30','3','1','0'),  ('1127','0','Joaquín','Boghossian',NULL,'30','4','3','0'),  ('1128','0','Leonel','Vangioni',NULL,'30','3','2','0'),  ('1129','0','Leandro','Benitez',NULL,'30','2','1','0'),  ('1130','0','Emanuel','Dening',NULL,'30','4','1','0'),  ('1131','0','Alejandro','Cascio',NULL,'30','3','1','0'),  ('1132','0','Ignacio','Fideleff',NULL,'30','2','1','0'),  ('1133','0','Nahuel','Guzman',NULL,'30','1','1','1'),  ('1134','0','Cristian','Lema',NULL,'30','2','1','0'),  ('1135','0','Jonathan','Hereñu',NULL,'30','2','1','0'),  ('1136','0','Hernan','Villalba',NULL,'30','3','1','0'),  ('1137','0','Santiago','Fernandez',NULL,'30','4','1','0'),  ('1138','0','Pablo','Santillo',NULL,'38','1','1','0'),  ('1139','0','Roberto','Ayala',NULL,'38','2','2','0'),  ('1140','0','Nicolás','Sainz',NULL,'38','2','1','0'),  ('1141','0','Claudio','Yacob',NULL,'38','3','2','0'),  ('1142','0','Lucas','Aveldaño',NULL,'38','2','1','0'),  ('1143','0','Pablo','Lugüercio',NULL,'38','4','2','0'),  ('1144','0','Martin','Wagner',NULL,'38','3','1','0'),  ('1145','0','Pablo','Caballero',NULL,'38','4','1','0'),  ('1146','0','Gabriel','Hauche',NULL,'38','4','2','0'),  ('1147','0','Sebastián','Grazzini',NULL,'38','3','2','0'),  ('1148','0','Mauro','Dobler',NULL,'38','1','1','0'),  ('1149','0','Claudio','Bieler',NULL,'38','4','3','0'),  ('1150','0','Cristian','Tavio',NULL,'38','2','1','0'),  ('1151','0','Adrián','Lucero',NULL,'38','3','1','0'),  ('1152','0','Damián','Steinert',NULL,'38','4','1','0'),  ('1153','0','Gabriel','Mercado',NULL,'38','2','2','0'),  ('1154','0','Brian','Lluy',NULL,'38','3','1','0'),  ('1155','0','Damián','Ledesma',NULL,'38','3','1','0'),  ('1156','0','Sebastián','Rosano',NULL,'38','3','1','0'),  ('1157','0','Lucas','Castromán',NULL,'38','4','2','0'),  ('1158','0','Matías','Cahais',NULL,'38','2','1','0'),  ('1159','0','Marcos','Cáceres',NULL,'38','2','1','0'),  ('1160','0','Gonzalo','Pérez',NULL,'38','3','1','0'),  ('1161','0','Valentín','Viola',NULL,'38','4','1','0'),  ('1162','0','Luis','Fariña',NULL,'38','3','1','0'),  ('1163','0','Santiago','Malano',NULL,'38','4','1','0'),  ('1164','0','Lucas','Licht',NULL,'38','2','2','0'),  ('1165','0','Matías','Martínez',NULL,'38','2','2','0'),  ('1166','0','Ignacio','Colombini',NULL,'38','4','1','0'),  ('1167','0','Bruno','Zuculini',NULL,'38','3','1','0'),  ('1168','0','Daniel','Vega',NULL,'29','1','2','0'),  ('1169','0','Alexis','Ferrero',NULL,'29','2','2','0'),  ('1170','0','Cristian','Villagra',NULL,'29','2','1','0'),  ('1171','0','Paulo','Ferrari',NULL,'29','2','2','0'),  ('1172','0','Oscar','Ahumada',NULL,'29','3','1','0'),  ('1173','0','Nicolás','Sánchez',NULL,'29','2','2','0'),  ('1174','0','Mauro','Rosales',NULL,'29','4','1','0'),  ('1175','0','Rodrigo','Rojas',NULL,'29','3','2','0'),  ('1176','0','Ariel','Ortega',NULL,'29','4','3','0'),  ('1177','0','Marcelo','Gallardo',NULL,'29','3','3','0'),  ('1178','0','Juan','Ojeda',NULL,'29','1','1','0'),  ('1179','0','Maximiliano','Coronel',NULL,'29','2','1','0'),  ('1180','0','Andrés','Ríos',NULL,'29','4','1','0'),  ('1181','0','Gustavo','Canales',NULL,'29','4','1','0'),  ('1182','0','Diego','Barrado',NULL,'29','3','1','0'),  ('1183','0','Martín','Galmarini',NULL,'29','3','1','0'),  ('1184','0','Gustavo','Bou',NULL,'29','3','1','0'),  ('1185','0','Gustavo','Cabral',NULL,'29','2','2','0'),  ('1186','0','Matías','Almeyda',NULL,'29','3','2','0'),  ('1187','0','Nicolás','Navarro',NULL,'29','1','1','0'),  ('1188','0','Mauro','Díaz',NULL,'29','3','1','0'),  ('1189','0','Diego','Buonanotte',NULL,'29','4','3','0'),  ('1190','0','Facundo','Quiroga',NULL,'29','2','2','0'),  ('1191','0','Gonzalo','Ludueña',NULL,'29','4','1','0'),  ('1192','0','Daniel','Villalba',NULL,'29','4','2','1'),  ('1193','0','Gonzalo','Gil',NULL,'29','4','1','0'),  ('1194','0','Lucas','Orbán',NULL,'29','2','1','0'),  ('1195','0','Roberto','Pereyra',NULL,'29','3','1','0'),  ('1196','0','Matías','Abelairas',NULL,'29','3','2','0'),  ('1197','0','Erik','Lamela',NULL,'29','3','1','0'),  ('1198','0','Jorge','Broun',NULL,'37','1','2','0'),  ('1199','0','Nahuel','Valentini',NULL,'37','2','1','0'),  ('1200','0','Guillermo','Burdisso',NULL,'37','2','2','1'),  ('1201','0','Alexis','Danelón',NULL,'37','2','1','0'),  ('1202','0','Diego','Braghieri',NULL,'37','2','1','0'),  ('1203','0','Diego','Chitzoff',NULL,'37','2','1','0'),  ('1204','0','Luciano','Figueroa',NULL,'37','4','2','0'),  ('1205','0','Johnatan','Gómez',NULL,'37','3','2','0'),  ('1206','0','Gervasio','Núñez',NULL,'37','3','1','0'),  ('1207','0','Hernán','Galíndez',NULL,'37','1','1','0'),  ('1208','0','Mario','Vallejo',NULL,'37','2','1','0'),  ('1209','0','Lucas','Moya',NULL,'37','3','1','0'),  ('1210','0','Milton','Caraglio',NULL,'37','4','1','0'),  ('1211','0','Martín','Astudillo',NULL,'37','3','1','0'),  ('1212','0','Emilio','Zelaya',NULL,'37','4','2','0'),  ('1213','0','Matías','Ballini',NULL,'37','3','1','0'),  ('1214','0','Jorge','Bava',NULL,'37','1','1','0'),  ('1215','0','Darío','Ocampo',NULL,'37','3','1','0'),  ('1216','0','Ignacio','Boggino',NULL,'37','2','1','0'),  ('1217','0','Facundo','Lupardo',NULL,'37','1','1','0'),  ('1218','0','Milton','Zárate',NULL,'37','3','1','0'),  ('1219','0','Leandro','Gurrieri',NULL,'37','4','1','0'),  ('1220','0','Santiago','García',NULL,'37','2','1','0'),  ('1221','0','Mario','Paglialunga',NULL,'37','3','1','0'),  ('1222','0','Paúl','Ambrosi',NULL,'37','2','1','0'),  ('1223','0','Martín','Rivero',NULL,'37','3','1','0'),  ('1224','0','Horacio','Calcaterra',NULL,'37','3','1','0'),  ('1225','0','Nicolás','Fernández',NULL,'37','4','1','0'),  ('1226','0','Manuel','García',NULL,'37','1','1','0'),  ('1227','0','Gustavo','Campagnuolo',NULL,'28','1','1','0'),  ('1228','0','Germán','Voboril',NULL,'28','2','1','0'),  ('1229','0','Sebastián','Luna',NULL,'28','2','1','0'),  ('1230','0','Cristian','González',NULL,'28','3','2','0'),  ('1231','0','Jonathan','Bottinelli',NULL,'28','2','2','0'),  ('1232','0','Diego','Rivero',NULL,'28','3','2','0'),  ('1233','0','Bernardo','Romeo',NULL,'28','4','1','0'),  ('1234','0','Leandro','Romagnoli',NULL,'28','3','3','0'),  ('1235','0','Aureliano','Torres',NULL,'28','2','2','0'),  ('1236','0','Nereo','Champagne',NULL,'28','1','1','0'),  ('1237','0','Fernando','Meza',NULL,'28','2','1','0'),  ('1238','0','Fabián','Bordagaray',NULL,'28','4','2','1'),  ('1239','0','Santiago','Prim',NULL,'28','3','1','0'),  ('1240','0','Cristian','Leiva',NULL,'28','3','1','0'),  ('1241','0','Alejandro','Gómez',NULL,'28','4','3','0'),  ('1242','0','Gastón','Aguirre',NULL,'28','2','2','0'),  ('1243','0','Pablo','Pintos',NULL,'28','2','2','1'),  ('1244','0','Sebastián','Rusculleda',NULL,'28','3','1','0'),  ('1245','0','Salvador','Reynoso',NULL,'28','3','1','0'),  ('1246','0','Gonzalo','Bazán',NULL,'28','3','1','0'),  ('1247','0','Axel','Juarez',NULL,'28','3','1','0'),  ('1248','0','Nelson','Benítez',NULL,'28','2','1','0'),  ('1249','0','Emiliano','Alfaro',NULL,'28','4','1','0'),  ('1250','0','Sebastián','González',NULL,'28','3','1','0'),  ('1251','0','Pablo','Migliore',NULL,'28','1','2','0'),  ('1252','0','Matías','Vega',NULL,'28','1','1','0'),  ('1253','0','Nicolás','Bertocchi',NULL,'28','3','1','0'),  ('1254','0','Daniel','Islas',NULL,'36','1','2','0'),  ('1255','0','Cristian','Leyes',NULL,'36','2','1','0'),  ('1256','0','Juan','Celaya',NULL,'36','2','1','0'),  ('1257','0','Diego','Castaño',NULL,'36','3','2','0'),  ('1258','0','Rodolfo','Arruabarrena',NULL,'36','2','1','1'),  ('1259','0','Carlos','Luna',NULL,'36','4','2','0'),  ('1260','0','Jónathan','Blanco',NULL,'36','3','1','0'),  ('1261','0','Leandro','Lázzaro',NULL,'36','4','2','0'),  ('1262','0','Martín','Morel',NULL,'36','3','2','0'),  ('1263','0','Ramiro','Leone',NULL,'36','3','1','0'),  ('1264','0','Luis','Ardente',NULL,'36','1','1','0'),  ('1265','0','Alberto','Alarcón',NULL,'36','2','1','0'),  ('1266','0','Gerardo','Castro',NULL,'36','4','1','0'),  ('1267','0','Néstor','Ayala',NULL,'36','4','2','0'),  ('1268','0','Lucas','Oviedo',NULL,'36','3','1','0'),  ('1269','0','Rubén','Botta',NULL,'36','3','1','0'),  ('1270','0','Ribair','Rodríguez',NULL,'36','3','1','0'),  ('1271','0','Cristian','Bardaro',NULL,'36','4','1','0'),  ('1272','0','Mariano','Pasini',NULL,'36','3','1','0'),  ('1273','0','Lucas','Abud',NULL,'36','1','1','0'),  ('1274','0','Facundo','Pumpido',NULL,'36','4','1','0'),  ('1275','0','Norberto','Paparatto',NULL,'36','2','1','0'),  ('1276','0','Walter','Sánchez',NULL,'36','3','1','0'),  ('1277','0','Gonzalo','Choy',NULL,'36','3','1','0'),  ('1278','0','Pablo','Fontanello',NULL,'36','2','1','0'),  ('1279','0','Carlos','Fondacaro',NULL,'36','2','1','0'),  ('1280','0','Brian','Rodríguez',NULL,'36','4','1','0'),  ('1281','0','Maximiliano','Oliva',NULL,'36','2','1','0'),  ('1282','0','Joaquín','Laso',NULL,'36','2','1','0'),  ('1283','0','Franco','Lanaro',NULL,'36','4','1','0'),  ('1284','0','Marcelo','Barovero',NULL,'27','1','1','0'),  ('1285','0','Marco','Torsiglieri',NULL,'27','2','1','0'),  ('1286','0','Emiliano','Papa',NULL,'27','2','2','0'),  ('1287','0','Gastón','Díaz',NULL,'27','2','1','0'),  ('1288','0','Fabián','Cubero',NULL,'27','3','2','0'),  ('1289','0','Sebastián','Domínguez',NULL,'27','2','2','0'),  ('1290','0','Nicolás','Cabrera',NULL,'27','3','2','1'),  ('1291','0','Maximiliano','Moralez',NULL,'27','3','3','0'),  ('1292','0','Rolando','Zárate',NULL,'27','4','1','0'),  ('1293','0','Ezequiel','Cacace',NULL,'27','1','1','0'),  ('1294','0','Pablo','Lima',NULL,'27','2','1','0'),  ('1295','0','Fernando','Tobio',NULL,'27','2','1','0'),  ('1296','0','Víctor','Zapata',NULL,'27','3','2','0'),  ('1297','0','Franco','Razzotti',NULL,'27','3','1','0'),  ('1298','0','Leandro','Somoza',NULL,'27','3','2','0'),  ('1299','0','Nicolás','Otamendi',NULL,'27','2','2','0'),  ('1300','0','Leandro','Caruso',NULL,'27','4','2','0'),  ('1301','0','Jonathan','Cristaldo',NULL,'27','4','2','0'),  ('1302','0','Leandro','Velázquez',NULL,'27','3','1','0'),  ('1303','0','Santiago','Silva',NULL,'27','4','3','0'),  ('1304','0','Iván','Bella',NULL,'27','3','1','0'),  ('1305','0','Germán','Montoya',NULL,'27','1','2','0'),  ('1306','0','Pablo','Despósito',NULL,'27','3','1','0'),  ('1307','0','Alejandro','Cabral',NULL,'27','3','1','0'),  ('1308','0','Mariano','Bíttolo',NULL,'27','2','1','0'),  ('1309','0','Ricardo','Álvarez',NULL,'27','3','1','0'),  ('1310','0','Leandro','Píris',NULL,'27','4','1','0'),  ('1311','0','Héctor','Canteros',NULL,'27','3','1','0'),  ('1312','0','Matías','Conti',NULL,'27','4','1','0'),  ('1313','0','Juan Ignacio','Mercier',NULL,'46','3','2','0'),  ('1314','0','José Luis','Calderón',NULL,'46','4','2','0'),  ('1315','0','Juan Manuel','Azconzábal',NULL,'44','2','1','0'),  ('1316','0','Jose M.','Saavedra',NULL,'44','3','1','0'),  ('1317','0','Juan Pablo','Pereyra',NULL,'44','4','1','1'),  ('1318','0','Juan Román','Riquelme',NULL,'35','3','3','0'),  ('1319','0','José María','Calvo',NULL,'35','2','1','0'),  ('1320','0','Juan Manuel','Lucero',NULL,'34','3','1','0'),  ('1321','0','Juan Sebastián','Verón',NULL,'33','3','3','0'),  ('1322','0','Carlos Andrés','Sánchez',NULL,'40','3','1','0'),  ('1323','0','Sergio Daniel','Sánchez',NULL,'40','3','1','0'),  ('1324','0','Juan Manuel','Insaurralde',NULL,'30','2','3','0'),  ('1325','0','José Luis','Martínez Gullota',NULL,'38','1','1','0'),  ('1326','0','Juan Ignacio','Sánchez Sotelo',NULL,'38','4','1','0'),  ('1327','0','Juan Carlos','Falcón',NULL,'38','4','2','0'),  ('1328','0','Juan Manuel','Díaz',NULL,'29','2','2','0'),  ('1329','0','Juan Carlos','Menseguez',NULL,'28','4','2','0'),  ('1330','0','Juan Manuel','Torres',NULL,'28','3','2','0'),  ('1331','0','José Luis','Palomino',NULL,'28','2','1','0'),  ('1332','0','Juan Pablo','Garat',NULL,'36','2','1','0'),  ('1333','0','Juan Miguel','Maldonado',NULL,'36','3','1','0'),  ('1334','0','Claudio Daniel','Pérez',NULL,'36','2','1','0'),  ('1335','0','Juan Manuel','Martínez',NULL,'27','4','2','0'),  ('1336','0','Hernán Rodrigo','López',NULL,'27','4','3','0'),  ('1337','0','Juan Pablo','Arancio',NULL,'27','3','1','0'),  ('1338','0','Facundo','Pérez Castro',NULL,'45','3','1','0'),  ('1339','0','Pablo','Villalba Fretes',NULL,'45','4','1','0'),  ('1340','0','Esteban','Dei Rossi',NULL,'44','1','1','0'),  ('1341','0','Mauro','Dos Santos',NULL,'43','2','1','0'),  ('1342','0','Claudio','Morel Rodríguez',NULL,'35','2','2','0'),  ('1343','0','Pablo','De Miranda',NULL,'34','2','1','0'),  ('1344','0','Iván','Moreno y Fabianesi',NULL,'34','3','2','0'),  ('1345','0','Jerónimo','Morales Neumann',NULL,'33','4','1','0'),  ('1346','0','Jadson','Viera Castro',NULL,'31','2','2','0'),  ('1347','0','Cristian','Sanchez Prette',NULL,'30','3','2','0'),  ('1348','0','David','Hernandez Valdez',NULL,'30','4','1','0'),  ('1349','0','Marcos','Brítez Ojeda',NULL,'38','3','1','0'),  ('1350','0','Jorge','De Olivera',NULL,'38','1','1','0'),  ('1351','0','Rogelio','Funes Mori',NULL,'29','4','1','0'),  ('1352','0','Adrián','De León',NULL,'37','4','1','0'),  ('1353','0','Cristian','Cuffaro Russo',NULL,'37','2','1','0'),  ('1354','0','José','San Román',NULL,'36','2','1','0');
INSERT INTO `playerposition` VALUES ('1','0','Arquero'),  ('2','0','Defensor'),  ('3','0','Volante'),  ('4','0','Delantero');
INSERT INTO `playerteam` VALUES ('1226','5','1110','60','0','0','0','1','0','0','1'),  ('1227','6','1133','60','0','0','0','0','0','1','2'),  ('1229','5','951','60','0','0','0','1','0','0','4'),  ('1230','7','1200','60','0','0','0','1','0','0','5'),  ('1231','5','704','60','0','0','0','1','0','0','6'),  ('1233','12','850','60','0','0','0','1','0','0','7'),  ('1235','2','786','60','0','0','0','0','1','0','10'),  ('1241','12','1258','60','0','0','0','0','0','1','9'),  ('1243','5','1243','60','0','0','0','0','0','1','8'),  ('1245','8','953','60','0','0','0','0','1','0','32'),  ('1246','2','1290','60','0','0','0','1','0','0','21'),  ('1250','10','816','60','0','0','0','0','0','1','23'),  ('1253','13','863','60','0','0','0','0','0','1','24'),  ('1255','9','703','60','0','0','1','1','0','0','19'),  ('1257','10','1055','60','0','1','0','1','0','0','20'),  ('1264','13','804','60','0','0','0','1','0','0','22'),  ('1276','17','1238','60','0','0','0','0','0','1','51'),  ('1277','2','988','60','0','0','0','0','0','1','52'),  ('1278','17','1085','60','0','0','0','0','1','0','53'),  ('1288','10','1192','60','1','0','0','1','0','0','50'),  ('1292','3','1317','60','0','0','0','1','0','0','49'),  ('1295','4','980','60','0','0','0','0','1','0','54');
INSERT INTO `team` VALUES ('52','0','Botox','52','1','0','4-4-2'),  ('53','0','HRG F.C.','53','1','0','4-4-2'),  ('54','0','Viejita Stone','54','1','0','4-4-2'),  ('55','0','TRES','55','1','0','4-4-2'),  ('56','0','15 de Octubre','56','2','0','4-4-2'),  ('57','0','Red Bull','57','1','0','4-4-2'),  ('58','0','Capussoto F.C.','58','1','0','4-4-2'),  ('59','0','QEE','59','2','0','4-4-2'),  ('60','46','GELP WareTech','60','2','0','4-4-2'),  ('61','0','Chapita de Cerveza Fóbal Clus','61','1','0','4-4-2'),  ('62','0','Los Super Ratones','62','1','0','4-4-2'),  ('63','0','La Bandita','63','1','0','4-4-2'),  ('64','0','Magia Negra','64','2','0','4-4-2'),  ('65','0','A.C. DECANO','65','2','0','4-4-2'),  ('66','0','La Filial','66','1','0','4-4-2'),  ('67','0','Hidrocarburo','67','2','0','4-4-2'),  ('68','1','FASA 13','68','2','0','4-4-2'),  ('69','0','ULTIMO RECURSO','69','2','0','4-4-2'),  ('70','0','Clockwork Orange','70','2','0','4-4-2'),  ('71','0','Los Golosos','71','2','0','4-4-2');
INSERT INTO `user` VALUES ('1','2','prueba','prueba','prueba','R3JhbkRU','grandt@waretech.com.ar'),  ('52','2','Ricardo','Berl','Pela','cGVsYQ==','rickyberl@hotmail.com'),  ('53','4','Leandro','Soncini','Chochi','Y2hvY2hp','leandrosoncini@hotmail.com'),  ('54','2','Francisco','Tabellione','Tabe','anVuaW9y','ftabe76@hotmail.com'),  ('55','2','Esteban','Sabbione','Tete','dGV0ZQ==','tetesabbione@hotmail.com'),  ('56','2','Tomas','Condorelli','Tommy','YmFzYW50YQ==','tonyvelamazan@hotmail.com'),  ('57','4','Martin','Aristia','Martin','bWFydGlu','m.aristia@gmail.com'),  ('58','2','Franco','Condorelli','Catalano','Y2F0YWxhbm8=','cachosaccardi@hotmail.com'),  ('59','3','Nicolas','Condorelli','Coco','Y29jbw==','ncondorelli@exiros.com'),  ('60','10','Augusto','Soncini','Augusto','YXVndXN0bw==','augustosoncini@hotmail.com'),  ('61','2','Matias','Condorelli','Pepi','cGVwaQ==','maticondorelli@gmail.com'),  ('62','2','Mauro','Pennacchioni','Rata','cmF0YQ==','mpennach@gmail.com'),  ('63','1','Emilio','Tabellione','Emi','RW1p','etabe114@hotmail.com'),  ('64','3','Andres','Garci­a Olivares','Negro','bmVncm8=','a_garciaolivares@hotmail.com'),  ('65','1','Guillermo','Vallina','Guillote','R3VpbGxvdGU=','gdvallina@fibertel.com.ar'),  ('66','3','Mauro','Di Benni','Papucho','Y29xdWlhcmdlbnRv','patodb@hotmail.com'),  ('67','2','Adriano','Mucelli','Tano','dGFubw==','amucelli@kpmg.com.ar'),  ('68','3','Fabian','Sabbione','Cunado','Y3VuYWRv','fabiansabbione@hotmail.com'),  ('69','2','Sebastian','Fiori','Chocho','Y2hvY2hv','fioriseba@hotmail.com'),  ('70','2','Ignacio','Soncini','Iki','ZG9jdG9y','ikisoncini@hotmail.com'),  ('71','2','Gaston','Messineo','Vivi','dml2aQ==','gastonmessineo@hotmail.com'),  ('72','2','Luciano','Mucelli','Luchi','bHVjaGk=','luciano.mucelli@gmail.com');
INSERT INTO `useraccess` VALUES ('1','0','60','1'),  ('2','0','60','2'),  ('3','0','60','3'),  ('4','0','60','13'),  ('5','0','60','14'),  ('34','0','62','1'),  ('35','0','62','2'),  ('36','0','62','13'),  ('37','0','53','1'),  ('38','0','53','2'),  ('39','0','53','13'),  ('40','0','59','1'),  ('41','0','59','2'),  ('42','0','59','13'),  ('88','0','65','1'),  ('89','0','65','2'),  ('90','0','65','3'),  ('91','0','65','13'),  ('92','0','65','14'),  ('93','0','60','15'),  ('94','0','60','16'),  ('95','0','60','17');
INSERT INTO `week` VALUES ('5','0','5'),  ('6','0','6'),  ('7','0','7'),  ('8','0','8'),  ('9','0','9'),  ('10','0','10'),  ('11','0','11'),  ('12','0','12'),  ('13','0','13'),  ('14','0','14'),  ('15','0','15'),  ('16','0','16'),  ('17','0','17'),  ('18','0','18'),  ('19','0','19');
