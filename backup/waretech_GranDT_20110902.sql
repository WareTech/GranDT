-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-09-2011 a las 18:21:40
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `waretech_GranDT`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcar la base de datos para la tabla `access`
--

INSERT INTO `access` (`id`, `version`, `value`, `description`) VALUES
(1, 1, 'MatchEdit.jsp!enabled', 'Edicion de Partido'),
(2, 0, 'WeekEdit.jsp!change', 'Calcular la fecha'),
(3, 0, 'AccessList.jsp', 'Lista de accesos'),
(13, 0, 'TeamEdit.jsp!change', 'Cambiar jugador de la lista'),
(14, 5, 'UserEdit.jsp!update', 'Edicion de usuario'),
(15, 0, 'TeamBuild.jsp!enabled', 'Construccion de Equipo'),
(16, 0, 'WeekList.jsp!tournamentStart', 'Comenzar torneo'),
(17, 0, 'EMailSend.jsp', 'Enviar eMail'),
(18, 0, 'ClaimList.jsp!delete', 'Eliminar reclamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `version`, `name`) VALUES
(1, 0, 'Primera A'),
(2, 0, 'Nacional B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `claim`
--

DROP TABLE IF EXISTS `claim`;
CREATE TABLE IF NOT EXISTS `claim` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` int(1) NOT NULL,
  `priority` int(1) NOT NULL,
  `user` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `state` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Claim_user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `claim`
--

INSERT INTO `claim` (`id`, `version`, `title`, `description`, `target`, `priority`, `user`, `date`, `state`) VALUES
(1, 0, 'Nombre', 'Cambiar mi nombre de equipo por Rompehuesos', 0, 1, 70, '2011-09-01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Club_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcar la base de datos para la tabla `club`
--

INSERT INTO `club` (`id`, `version`, `name`) VALUES
(1, 0, 'All Boys'),
(2, 0, 'Argentinos Jrs.'),
(3, 0, 'Arsenal'),
(4, 0, 'Atlético Rafaela'),
(5, 0, 'Banfield'),
(6, 0, 'Belgrano (Córdoba)'),
(7, 0, 'Boca Jrs.'),
(8, 0, 'Colón (Santa Fé)'),
(9, 0, 'Estudiantes (La PLata)'),
(10, 0, 'Godoy Cruz (Mendoza)'),
(11, 0, 'Independiente'),
(12, 0, 'Lanús'),
(13, 0, 'Newell''s Old Boys'),
(14, 0, 'Olimpo (Bahía Blanca)'),
(15, 0, 'Racing Club'),
(16, 0, 'San Lorenzo'),
(17, 0, 'San Martín (San Juan)'),
(18, 0, 'Tigre'),
(19, 0, 'Unión (Santa Fé)'),
(20, 0, 'Vélez Sarsfield');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `key_` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `version`, `key_`, `value`) VALUES
(1, 3, 'started', 'true');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `match_`
--

DROP TABLE IF EXISTS `match_`;
CREATE TABLE IF NOT EXISTS `match_` (
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
  KEY `FK_Match_awayClub` (`awayClub`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1022 ;

--
-- Volcar la base de datos para la tabla `match_`
--

INSERT INTO `match_` (`id`, `version`, `week`, `homeClub`, `awayClub`, `homeGoals`, `awayGoals`, `date`, `time`) VALUES
(872, 0, 139, 17, 2, NULL, NULL, NULL, NULL),
(873, 0, 139, 12, 9, NULL, NULL, NULL, NULL),
(874, 0, 139, 3, 10, NULL, NULL, NULL, NULL),
(875, 0, 139, 1, 15, NULL, NULL, NULL, NULL),
(876, 0, 139, 18, 5, NULL, NULL, NULL, NULL),
(877, 0, 139, 14, 20, NULL, NULL, NULL, NULL),
(878, 0, 139, 19, 4, NULL, NULL, NULL, NULL),
(879, 0, 139, 13, 8, NULL, NULL, NULL, NULL),
(880, 0, 139, 16, 6, NULL, NULL, NULL, NULL),
(881, 0, 139, 11, 7, NULL, NULL, NULL, NULL),
(882, 0, 140, 10, 1, NULL, NULL, NULL, NULL),
(883, 0, 140, 5, 3, NULL, NULL, NULL, NULL),
(884, 0, 140, 9, 18, NULL, NULL, NULL, NULL),
(885, 0, 140, 2, 12, NULL, NULL, NULL, NULL),
(886, 0, 140, 7, 17, NULL, NULL, NULL, NULL),
(887, 0, 140, 6, 11, NULL, NULL, NULL, NULL),
(888, 0, 140, 8, 16, NULL, NULL, NULL, NULL),
(889, 0, 140, 4, 13, NULL, NULL, NULL, NULL),
(890, 0, 140, 20, 19, NULL, NULL, NULL, NULL),
(891, 0, 140, 15, 14, NULL, NULL, NULL, NULL),
(892, 0, 141, 17, 6, NULL, NULL, NULL, NULL),
(893, 0, 141, 12, 7, NULL, NULL, NULL, NULL),
(894, 0, 141, 9, 2, NULL, NULL, NULL, NULL),
(895, 0, 141, 1, 5, NULL, NULL, NULL, NULL),
(896, 0, 141, 18, 3, NULL, NULL, NULL, NULL),
(897, 0, 141, 14, 10, NULL, NULL, NULL, NULL),
(898, 0, 141, 19, 15, NULL, NULL, NULL, NULL),
(899, 0, 141, 13, 20, NULL, NULL, NULL, NULL),
(900, 0, 141, 16, 4, NULL, NULL, NULL, NULL),
(901, 0, 141, 11, 8, NULL, NULL, NULL, NULL),
(902, 0, 142, 10, 19, NULL, NULL, NULL, NULL),
(903, 0, 142, 5, 14, NULL, NULL, NULL, NULL),
(904, 0, 142, 3, 1, NULL, NULL, NULL, NULL),
(905, 0, 142, 2, 18, NULL, NULL, NULL, NULL),
(906, 0, 142, 7, 9, NULL, NULL, NULL, NULL),
(907, 0, 142, 6, 12, NULL, NULL, NULL, NULL),
(908, 0, 142, 8, 17, NULL, NULL, NULL, NULL),
(909, 0, 142, 4, 11, NULL, NULL, NULL, NULL),
(910, 0, 142, 20, 16, NULL, NULL, NULL, NULL),
(911, 0, 142, 15, 13, NULL, NULL, NULL, NULL),
(912, 0, 143, 17, 4, NULL, NULL, NULL, NULL),
(913, 0, 143, 12, 8, NULL, NULL, NULL, NULL),
(914, 0, 143, 9, 6, NULL, NULL, NULL, NULL),
(915, 0, 143, 2, 7, NULL, NULL, NULL, NULL),
(916, 0, 143, 18, 1, NULL, NULL, NULL, NULL),
(917, 0, 143, 14, 3, NULL, NULL, NULL, NULL),
(918, 0, 143, 19, 5, NULL, NULL, NULL, NULL),
(919, 0, 143, 13, 10, NULL, NULL, NULL, NULL),
(920, 0, 143, 16, 15, NULL, NULL, NULL, NULL),
(921, 0, 143, 11, 20, NULL, NULL, NULL, NULL),
(922, 0, 144, 10, 16, NULL, NULL, NULL, NULL),
(923, 0, 144, 5, 13, NULL, NULL, NULL, NULL),
(924, 0, 144, 3, 19, NULL, NULL, NULL, NULL),
(925, 0, 144, 1, 14, NULL, NULL, NULL, NULL),
(926, 0, 144, 7, 18, NULL, NULL, NULL, NULL),
(927, 0, 144, 6, 2, NULL, NULL, NULL, NULL),
(928, 0, 144, 8, 9, NULL, NULL, NULL, NULL),
(929, 0, 144, 4, 12, NULL, NULL, NULL, NULL),
(930, 0, 144, 20, 17, NULL, NULL, NULL, NULL),
(931, 0, 144, 15, 11, NULL, NULL, NULL, NULL),
(932, 0, 145, 17, 15, NULL, NULL, NULL, NULL),
(933, 0, 145, 12, 20, NULL, NULL, NULL, NULL),
(934, 0, 145, 9, 4, NULL, NULL, NULL, NULL),
(935, 0, 145, 2, 8, NULL, NULL, NULL, NULL),
(936, 0, 145, 7, 6, NULL, NULL, NULL, NULL),
(937, 0, 145, 14, 18, NULL, NULL, NULL, NULL),
(938, 0, 145, 19, 1, NULL, NULL, NULL, NULL),
(939, 0, 145, 13, 3, NULL, NULL, NULL, NULL),
(940, 0, 145, 16, 5, NULL, NULL, NULL, NULL),
(941, 0, 145, 11, 10, NULL, NULL, NULL, NULL),
(942, 0, 146, 10, 17, NULL, NULL, NULL, NULL),
(943, 0, 146, 5, 11, NULL, NULL, NULL, NULL),
(944, 0, 146, 3, 16, NULL, NULL, NULL, NULL),
(945, 0, 146, 1, 13, NULL, NULL, NULL, NULL),
(946, 0, 146, 18, 6, NULL, NULL, NULL, NULL),
(947, 0, 146, 14, 19, NULL, NULL, NULL, NULL),
(948, 0, 146, 8, 7, NULL, NULL, NULL, NULL),
(949, 0, 146, 4, 2, NULL, NULL, NULL, NULL),
(950, 0, 146, 20, 9, NULL, NULL, NULL, NULL),
(951, 0, 146, 15, 12, NULL, NULL, NULL, NULL),
(952, 0, 147, 17, 5, NULL, NULL, NULL, NULL),
(953, 0, 147, 12, 10, NULL, NULL, NULL, NULL),
(954, 0, 147, 9, 15, NULL, NULL, NULL, NULL),
(955, 0, 147, 2, 20, NULL, NULL, NULL, NULL),
(956, 0, 147, 7, 4, NULL, NULL, NULL, NULL),
(957, 0, 147, 6, 8, NULL, NULL, NULL, NULL),
(958, 0, 147, 19, 18, NULL, NULL, NULL, NULL),
(959, 0, 147, 13, 14, NULL, NULL, NULL, NULL),
(960, 0, 147, 16, 1, NULL, NULL, NULL, NULL),
(961, 0, 147, 11, 3, NULL, NULL, NULL, NULL),
(962, 0, 148, 10, 9, NULL, NULL, NULL, NULL),
(963, 0, 148, 5, 12, NULL, NULL, NULL, NULL),
(964, 0, 148, 3, 17, NULL, NULL, NULL, NULL),
(965, 0, 148, 1, 11, NULL, NULL, NULL, NULL),
(966, 0, 148, 18, 8, NULL, NULL, NULL, NULL),
(967, 0, 148, 14, 16, NULL, NULL, NULL, NULL),
(968, 0, 148, 19, 13, NULL, NULL, NULL, NULL),
(969, 0, 148, 4, 6, NULL, NULL, NULL, NULL),
(970, 0, 148, 20, 7, NULL, NULL, NULL, NULL),
(971, 0, 148, 15, 2, NULL, NULL, NULL, NULL),
(972, 0, 149, 17, 1, NULL, NULL, NULL, NULL),
(973, 0, 149, 12, 3, NULL, NULL, NULL, NULL),
(974, 0, 149, 9, 5, NULL, NULL, NULL, NULL),
(975, 0, 149, 2, 10, NULL, NULL, NULL, NULL),
(976, 0, 149, 7, 15, NULL, NULL, NULL, NULL),
(977, 0, 149, 6, 20, NULL, NULL, NULL, NULL),
(978, 0, 149, 8, 4, NULL, NULL, NULL, NULL),
(979, 0, 149, 13, 18, NULL, NULL, NULL, NULL),
(980, 0, 149, 16, 19, NULL, NULL, NULL, NULL),
(981, 0, 149, 11, 14, NULL, NULL, NULL, NULL),
(982, 0, 150, 10, 7, NULL, NULL, NULL, NULL),
(983, 0, 150, 5, 2, NULL, NULL, NULL, NULL),
(984, 0, 150, 3, 9, NULL, NULL, NULL, NULL),
(985, 0, 150, 1, 12, NULL, NULL, NULL, NULL),
(986, 0, 150, 18, 4, NULL, NULL, NULL, NULL),
(987, 0, 150, 14, 17, NULL, NULL, NULL, NULL),
(988, 0, 150, 19, 11, NULL, NULL, NULL, NULL),
(989, 0, 150, 13, 16, NULL, NULL, NULL, NULL),
(990, 0, 150, 20, 8, NULL, NULL, NULL, NULL),
(991, 0, 150, 15, 6, NULL, NULL, NULL, NULL),
(992, 0, 151, 17, 19, NULL, NULL, NULL, NULL),
(993, 0, 151, 12, 14, NULL, NULL, NULL, NULL),
(994, 0, 151, 9, 1, NULL, NULL, NULL, NULL),
(995, 0, 151, 2, 3, NULL, NULL, NULL, NULL),
(996, 0, 151, 7, 5, NULL, NULL, NULL, NULL),
(997, 0, 151, 6, 10, NULL, NULL, NULL, NULL),
(998, 0, 151, 8, 15, NULL, NULL, NULL, NULL),
(999, 0, 151, 4, 20, NULL, NULL, NULL, NULL),
(1000, 0, 151, 16, 18, NULL, NULL, NULL, NULL),
(1001, 0, 151, 11, 13, NULL, NULL, NULL, NULL),
(1002, 0, 152, 10, 8, NULL, NULL, NULL, NULL),
(1003, 0, 152, 5, 6, NULL, NULL, NULL, NULL),
(1004, 0, 152, 3, 7, NULL, NULL, NULL, NULL),
(1005, 0, 152, 1, 2, NULL, NULL, NULL, NULL),
(1006, 0, 152, 18, 20, NULL, NULL, NULL, NULL),
(1007, 0, 152, 14, 9, NULL, NULL, NULL, NULL),
(1008, 0, 152, 19, 12, NULL, NULL, NULL, NULL),
(1009, 0, 152, 13, 17, NULL, NULL, NULL, NULL),
(1010, 0, 152, 16, 11, NULL, NULL, NULL, NULL),
(1011, 0, 152, 15, 4, NULL, NULL, NULL, NULL),
(1012, 0, 153, 17, 16, NULL, NULL, NULL, NULL),
(1013, 0, 153, 12, 13, NULL, NULL, NULL, NULL),
(1014, 0, 153, 9, 19, NULL, NULL, NULL, NULL),
(1015, 0, 153, 2, 14, NULL, NULL, NULL, NULL),
(1016, 0, 153, 7, 1, NULL, NULL, NULL, NULL),
(1017, 0, 153, 6, 3, NULL, NULL, NULL, NULL),
(1018, 0, 153, 8, 5, NULL, NULL, NULL, NULL),
(1019, 0, 153, 4, 10, NULL, NULL, NULL, NULL),
(1020, 0, 153, 20, 15, NULL, NULL, NULL, NULL),
(1021, 0, 153, 11, 18, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
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
  KEY `FK_Player_position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=635 ;

--
-- Volcar la base de datos para la tabla `player`
--

INSERT INTO `player` (`id`, `version`, `firstname`, `lastname`, `number`, `club`, `position`, `value`, `selected`) VALUES
(1, 0, 'Walter', 'Acevedo', 0, 5, 3, '2', 1),
(2, 0, 'Jorge', 'Achucarro', 0, 5, 4, '2', 0),
(3, 0, 'David', 'Achucarro', 0, 7, 2, '1', 0),
(4, 0, 'Joel', 'Acosta', 0, 7, 4, '1', 0),
(5, 0, 'Ricardo', 'Acosta', 0, 19, 3, '1', 0),
(6, 0, 'Alan', 'Aguerre', 0, 20, 1, '1', 1),
(7, 0, 'Pablo César', 'Aguilar', 0, 3, 2, '1', 0),
(8, 0, 'Emanuel', 'Aguilera', 0, 10, 2, '1', 0),
(9, 0, 'Nicolás', 'Aguirre', 0, 3, 3, '1', 0),
(10, 0, 'Gastón', 'Aguirre', 0, 16, 2, '1', 0),
(11, 0, 'Marcos', 'Aguirre', 0, 17, 3, '1', 0),
(12, 0, 'Lucas', 'Alario', 0, 8, 4, '1', 0),
(13, 0, 'Damián', 'Albil', 0, 9, 1, '1', 0),
(14, 0, 'Federico', 'Almerares', 0, 6, 4, '1', 0),
(15, 0, 'Sergio', 'Almirón', 0, 13, 4, '1', 0),
(16, 0, 'Pablo', 'Alvarado', 0, 16, 3, '1', 0),
(17, 0, 'Cristian', 'Alvarez', 0, 17, 3, '1', 0),
(18, 0, 'Nicolás', 'Amerise', 0, 19, 4, '1', 0),
(19, 0, 'Esteban', 'Andrada', 0, 12, 1, '1', 0),
(20, 0, 'Martín', 'Antoniazzi', 0, 19, 2, '1', 0),
(21, 0, 'Víctor', 'Aquino', 0, 13, 4, '1', 0),
(22, 0, 'Arturo David', 'Aquino', 0, 14, 2, '1', 0),
(23, 0, 'Sergio', 'Araujo', 0, 7, 4, '1', 0),
(24, 0, 'Carlos', 'Araujo', 0, 12, 2, '1', 1),
(25, 0, 'Ignacio', 'Arce', 0, 19, 1, '1', 0),
(26, 0, 'Luis', 'Ardente', 0, 17, 1, '1', 0),
(27, 0, 'Adrián', 'Argachá', 0, 11, 2, '1', 0),
(28, 0, 'Gabriel', 'Arias', 0, 14, 1, '1', 0),
(29, 0, 'Joaquín', 'Arzura', 0, 18, 3, '1', 0),
(30, 0, 'Fabián', 'Assmann', 0, 11, 1, '2', 0),
(31, 0, 'Luciano', 'Aued', 0, 15, 3, '2', 0),
(32, 0, 'Diego', 'Auzqui', 0, 9, 3, '1', 0),
(33, 0, 'Carlos', 'Auzqui', 0, 9, 4, '1', 0),
(34, 0, 'Lucas', 'Aveldaño', 0, 15, 2, '1', 0),
(35, 0, 'Juan', 'Avendaño', 0, 19, 2, '1', 1),
(36, 0, 'Néstor', 'Ayala', 0, 17, 4, '1', 0),
(37, 0, 'Cristian', 'Báez', 0, 11, 2, '1', 0),
(38, 0, 'Andrés', 'Bailo', 0, 8, 1, '1', 0),
(39, 0, 'Luciano', 'Balbi', 0, 12, 2, '1', 0),
(40, 0, 'Alejandro', 'Bárbaro', 0, 5, 3, '1', 0),
(41, 0, 'Guido', 'Barceló', 0, 10, 4, '1', 0),
(42, 0, 'Ignacio', 'Barcia', 0, 11, 2, '1', 0),
(43, 0, 'Néstor', 'Bareiro', 0, 14, 4, '1', 1),
(44, 0, 'Hugo', 'Bargas', 0, 1, 4, '1', 0),
(45, 0, 'Diego', 'Barisone', 0, 19, 2, '1', 0),
(46, 0, 'Marcelo', 'Barovero', 0, 20, 1, '2', 1),
(47, 0, 'Jerónimo', 'Barrales', 0, 19, 4, '1', 1),
(48, 0, 'Julio', 'Barraza', 0, 8, 2, '1', 0),
(49, 0, 'Leandro', 'Barrera', 0, 2, 4, '1', 0),
(50, 0, 'Hugo', 'Barrientos', 0, 1, 3, '1', 1),
(51, 0, 'Fernando', 'Barrientos', 0, 12, 3, '1', 0),
(52, 0, 'Pier Miqueas', 'Barrios', 0, 6, 2, '1', 0),
(53, 0, 'Pablo', 'Barzola', 0, 2, 2, '1', 1),
(54, 0, 'Adrián', 'Bastía', 0, 8, 3, '1', 0),
(55, 0, 'Germán', 'Basualdo', 0, 2, 3, '1', 0),
(56, 0, 'Matías', 'Batista', 0, 1, 2, '1', 0),
(57, 0, 'Sebastián', 'Battaglia', 0, 7, 3, '2', 0),
(58, 0, 'Roberto', 'Battión', 0, 11, 3, '1', 0),
(59, 0, 'Nicolás', 'Bauchet', 0, 5, 4, '1', 0),
(60, 0, 'Gonzalo', 'Bazán', 0, 16, 3, '1', 0),
(61, 0, 'Iván', 'Bella', 0, 20, 3, '1', 1),
(62, 0, 'Darío', 'Benedetto', 0, 3, 4, '1', 0),
(63, 0, 'Leandro Damián', 'Benítez', 0, 9, 3, '2', 0),
(64, 0, 'Nelson', 'Benítez', 0, 9, 2, '1', 0),
(65, 0, 'Oscar', 'Benítez', 0, 12, 3, '1', 0),
(66, 0, 'Marcos', 'Benítez', 0, 13, 2, '1', 0),
(67, 0, 'Nahuel', 'Benítez', 0, 16, 4, '1', 0),
(68, 0, 'Nicolás', 'Berardo', 0, 2, 2, '1', 0),
(69, 0, 'Lucas', 'Bernardi', 0, 13, 3, '2', 1),
(70, 0, 'Nicolás', 'Bianchi Arce', 0, 16, 2, '1', 0),
(71, 0, 'Mariano Ezequiel', 'Bittolo', 0, 20, 2, '1', 0),
(72, 0, 'Gustavo', 'Blanco Leschuk', 0, 3, 4, '1', 0),
(73, 0, 'Nicolás', 'Blandi', 0, 7, 4, '1', 0),
(74, 0, 'Juan Carlos', 'Blengio', 0, 18, 2, '1', 0),
(75, 0, 'Mauro', 'Bogado', 0, 17, 3, '1', 1),
(76, 0, 'Enrique', 'Bologna', 0, 19, 1, '1', 1),
(77, 0, 'Luciano', 'Bonomo', 0, 9, 2, '1', 0),
(78, 0, 'Mauro', 'Boselli', 0, 9, 4, '3', 1),
(79, 0, 'Rubén', 'Botta', 0, 18, 3, '1', 0),
(80, 0, 'Jonathan', 'Bottinelli', 0, 16, 2, '2', 1),
(81, 0, 'Gonzalo', 'Bozzoni', 0, 16, 2, '1', 0),
(82, 0, 'Diego', 'Braghieri', 0, 12, 2, '1', 0),
(83, 0, 'Rodrigo', 'Braña', 0, 9, 3, '2', 1),
(84, 0, 'Ariel', 'Broggi', 0, 5, 2, '1', 0),
(85, 0, 'Roberto', 'Brum', 0, 2, 3, '1', 0),
(86, 0, 'Nicolás', 'Bruna', 0, 19, 3, '1', 0),
(87, 0, 'Guillermo', 'Burdisso', 0, 3, 2, '2', 1),
(88, 0, 'Javier', 'Burrai', 0, 3, 1, '1', 0),
(89, 0, 'Walter', 'Busse', 0, 11, 3, '1', 0),
(90, 0, 'Marcelo', 'Bustamante', 0, 5, 2, '1', 0),
(91, 0, 'Maximiliano', 'Bustos', 0, 17, 3, '1', 0),
(92, 0, 'Alejandro', 'Cabral', 0, 20, 3, '1', 0),
(93, 0, 'Gonzalo', 'Cabrera', 0, 10, 3, '1', 1),
(94, 0, 'Nicolás', 'Cabrera', 0, 11, 3, '1', 0),
(95, 0, 'Rafael', 'Cabrera', 0, 16, 3, '1', 0),
(96, 0, 'Samuel', 'Cáceres', 0, 11, 2, '1', 0),
(97, 0, 'Marcos', 'Cáceres', 0, 15, 2, '1', 0),
(98, 0, 'Germán', 'Cáceres', 0, 4, 3, '1', 0),
(99, 0, 'Juan Pablo', 'Caffa', 0, 3, 3, '2', 0),
(100, 0, 'Leonel', 'Cafferatti', 0, 15, 1, '1', 0),
(101, 0, 'Matías', 'Cahais', 0, 15, 2, '2', 1),
(102, 0, 'Maximiliano', 'Caire', 0, 8, 2, '1', 0),
(103, 0, 'Néstor', 'Camacho', 0, 13, 3, '1', 0),
(104, 0, 'Alejandro', 'Camargo', 0, 10, 3, '1', 0),
(105, 0, 'Nicolás', 'Cambiasso', 0, 1, 1, '1', 1),
(106, 0, 'Mauro', 'Camoranesi', 0, 12, 3, '2', 0),
(107, 0, 'Cristian', 'Campestrini', 0, 3, 1, '2', 0),
(108, 0, 'Salustiano', 'Candia', 0, 8, 2, '1', 0),
(109, 0, 'Pablo', 'Cantero', 0, 17, 3, '1', 0),
(110, 0, 'Héctor', 'Canteros', 0, 20, 3, '2', 1),
(111, 0, 'Damián', 'Canuto', 0, 17, 3, '1', 0),
(112, 0, 'Nicolás', 'Capellino', 0, 4, 4, '1', 0),
(113, 0, 'Gastón', 'Caprari', 0, 17, 4, '1', 0),
(114, 0, 'Nicolás', 'Caprio', 0, 19, 1, '1', 0),
(115, 0, 'Matías', 'Carabajal', 0, 17, 3, '1', 0),
(116, 0, 'Mauricio', 'Caranta', 0, 12, 1, '2', 0),
(117, 0, 'Carlos', 'Carbonero', 0, 9, 3, '2', 1),
(118, 0, 'Ezequiel', 'Carboni', 0, 5, 3, '1', 0),
(119, 0, 'Juan Pablo', 'Cárdenas', 0, 19, 2, '1', 0),
(120, 0, 'Giancarlo', 'Carmona', 0, 16, 2, '1', 0),
(121, 0, 'Oscar', 'Carniello', 0, 4, 2, '1', 0),
(122, 0, 'César', 'Carranza', 0, 12, 4, '1', 1),
(123, 0, 'Jorge', 'Carranza', 0, 4, 1, '1', 0),
(124, 0, 'Javier', 'Carrasco', 0, 18, 3, '1', 0),
(125, 0, 'Sebastián', 'Carrera', 0, 4, 3, '1', 0),
(126, 0, 'Guido', 'Carrillo', 0, 9, 4, '1', 0),
(127, 0, 'Marcelo', 'Carrusca', 0, 17, 3, '2', 0),
(128, 0, 'Leandro', 'Caruso', 0, 10, 4, '2', 0),
(129, 0, 'Matías', 'Caruzzo', 0, 7, 2, '2', 0),
(130, 0, 'Eduardo', 'Casais', 0, 14, 2, '1', 0),
(131, 0, 'Diego', 'Castaño', 0, 18, 3, '2', 0),
(132, 0, 'Carlos', 'Casteglione', 0, 18, 2, '1', 0),
(133, 0, 'Jairo', 'Castillo', 0, 11, 4, '1', 0),
(134, 0, 'Facundo', 'Castillón', 0, 10, 4, '1', 0),
(135, 0, 'Lucas', 'Castro', 0, 15, 3, '2', 1),
(136, 0, 'Nicolás', 'Castro', 0, 4, 3, '1', 1),
(137, 0, 'Lucas', 'Ceballos', 0, 10, 2, '1', 0),
(138, 0, 'Cristian', 'Cellay', 0, 9, 2, '2', 1),
(139, 0, 'Gastón', 'Cellerino', 0, 15, 3, '1', 0),
(140, 0, 'Christian', 'Cepeda', 0, 3, 2, '1', 0),
(141, 0, 'Francisco', 'Cerro', 0, 20, 3, '1', 0),
(142, 0, 'Nereo', 'Champagne', 0, 16, 1, '1', 1),
(143, 0, 'Cristian', 'Chávez', 0, 7, 3, '2', 1),
(144, 0, 'Christian', 'Chávez', 0, 16, 4, '1', 0),
(145, 0, 'Javier', 'Chevantón', 0, 8, 4, '2', 1),
(146, 0, 'Gino', 'Clara', 0, 11, 4, '1', 0),
(147, 0, 'Juan Manuel', 'Cobo', 0, 3, 3, '1', 0),
(148, 0, 'Nicolás', 'Colazo', 0, 7, 3, '1', 1),
(149, 0, 'Gabriel', 'Colombatti', 0, 15, 2, '1', 0),
(150, 0, 'Ignacio', 'Colombini', 0, 15, 4, '1', 0),
(151, 0, 'Armando', 'Cooper', 0, 10, 3, '1', 0),
(152, 0, 'Jherson', 'Córdoba', 0, 4, 3, '1', 0),
(153, 0, 'Facundo', 'Coria', 0, 9, 3, '2', 0),
(154, 0, 'Maximiliano', 'Coronel', 0, 1, 2, '1', 0),
(155, 0, 'Nicolás', 'Correa', 0, 19, 2, '1', 0),
(156, 0, 'Jorge Iván', 'Correa', 0, 20, 3, '1', 0),
(157, 0, 'Leonardo', 'Corti', 0, 17, 1, '1', 0),
(158, 0, 'Tomás', 'Costa', 0, 8, 3, '2', 1),
(159, 0, 'Agustín', 'Cousillas', 0, 18, 1, '1', 0),
(160, 0, 'Fabián', 'Cubero', 0, 20, 3, '2', 0),
(161, 0, 'Víctor', 'Cuesta', 0, 3, 2, '1', 0),
(162, 0, 'Jorge', 'Curbelo', 0, 10, 2, '1', 1),
(163, 0, 'Facundo', 'Curuchet', 0, 8, 4, '1', 0),
(164, 0, 'Darío', 'Cvitanich', 0, 7, 4, '2', 1),
(165, 0, 'Israel', 'Damonte', 0, 10, 3, '1', 1),
(166, 0, 'Sebastián', 'D''Angelo', 0, 7, 1, '1', 0),
(167, 0, 'Jorge', 'De Olivera', 0, 15, 1, '1', 0),
(168, 0, 'Diego', 'De Souza', 0, 5, 3, '1', 0),
(169, 0, 'Matías', 'Defederico', 0, 11, 4, '2', 0),
(170, 0, 'Alejandro', 'Delfino', 0, 5, 2, '1', 0),
(171, 0, 'Nicolás', 'Delmonte', 0, 11, 4, '1', 0),
(172, 0, 'Leandro', 'Desábato', 0, 9, 2, '2', 0),
(173, 0, 'Leandro Luis', 'Desábato', 0, 20, 3, '1', 0),
(174, 0, 'José', 'Devaca', 0, 5, 2, '1', 0),
(175, 0, 'Lucas', 'Di Grazia', 0, 1, 1, '1', 0),
(176, 0, 'Matías', 'Di Gregorio', 0, 4, 2, '1', 0),
(177, 0, 'Marcos', 'Díaz', 0, 8, 1, '1', 0),
(178, 0, 'Leandro', 'Díaz', 0, 12, 4, '1', 0),
(179, 0, 'Cristian', 'Díaz', 0, 13, 3, '1', 0),
(180, 0, 'Gabriel', 'Díaz', 0, 14, 2, '1', 0),
(181, 0, 'Gastón', 'Díaz', 0, 18, 3, '1', 1),
(182, 0, 'Gastón', 'Díaz', 0, 20, 2, '1', 0),
(183, 0, 'Mauro', 'Dobler', 0, 15, 1, '1', 0),
(184, 0, 'Eduardo', 'Domínguez', 0, 1, 2, '1', 1),
(185, 0, 'Sebastián', 'Domínguez', 0, 20, 2, '3', 0),
(186, 0, 'Mauro', 'Dos Santos', 0, 5, 2, '1', 1),
(187, 0, 'Francisco', 'Dutari', 0, 4, 2, '1', 0),
(188, 0, 'Mariano', 'Echeverría', 0, 18, 2, '2', 1),
(189, 0, 'Juan', 'Eluchans', 0, 5, 3, '1', 0),
(190, 0, 'Cristian', 'Erbes', 0, 7, 3, '1', 0),
(191, 0, 'Rodrigo', 'Erramuspe', 0, 19, 2, '1', 0),
(192, 0, 'Walter', 'Erviti', 0, 7, 3, '2', 1),
(193, 0, 'Matías', 'Escalante', 0, 1, 3, '1', 0),
(194, 0, 'Matías', 'Escobar', 0, 18, 3, '1', 0),
(195, 0, 'Sergio', 'Escudero', 0, 2, 2, '1', 0),
(196, 0, 'Gastón', 'Esmerado', 0, 3, 3, '1', 0),
(197, 0, 'Gonzalo', 'Espinoza', 0, 15, 3, '1', 0),
(198, 0, 'Iván', 'Etevenaux', 0, 6, 3, '1', 0),
(199, 0, 'Emir', 'Faccioli', 0, 14, 2, '1', 0),
(200, 0, 'Juan Carlos', 'Falcón', 0, 10, 3, '1', 0),
(201, 0, 'Federico', 'Falcone', 0, 13, 4, '1', 0),
(202, 0, 'Lorenzo', 'Faravelli', 0, 13, 3, '1', 0),
(203, 0, 'Luis Carlos', 'Fariña', 0, 15, 3, '1', 0),
(204, 0, 'Guillermo', 'Farré', 0, 6, 3, '1', 0),
(205, 0, 'Nereo', 'Fernández', 0, 2, 1, '1', 0),
(206, 0, 'Gastón', 'Fernández', 0, 9, 4, '3', 0),
(207, 0, 'José Luis', 'Fernández', 0, 9, 3, '2', 0),
(208, 0, 'Mauro', 'Fernández', 0, 9, 4, '1', 0),
(209, 0, 'Juan', 'Fernández', 0, 4, 2, '1', 0),
(210, 0, 'Julián', 'Fernández', 0, 4, 2, '1', 0),
(211, 0, 'Alexis', 'Fernández', 0, 19, 3, '1', 0),
(212, 0, 'Augusto', 'Fernández', 0, 20, 3, '3', 0),
(213, 0, 'Guillermo', 'Ferragutti', 0, 13, 2, '1', 0),
(214, 0, 'Jonathan', 'Ferrari', 0, 16, 2, '1', 0),
(215, 0, 'Brian', 'Ferreira', 0, 20, 3, '1', 0),
(216, 0, 'Juan Carlos', 'Ferreyra', 0, 1, 4, '1', 0),
(217, 0, 'Facundo', 'Ferreyra', 0, 5, 4, '2', 1),
(218, 0, 'Juan Pablo', 'Ferreyra', 0, 5, 1, '1', 0),
(219, 0, 'Osmar', 'Ferreyra', 0, 11, 3, '2', 0),
(220, 0, 'Ignacio', 'Fideleff', 0, 13, 2, '1', 1),
(221, 0, 'Tobías', 'Figueroa', 0, 6, 4, '1', 0),
(222, 0, 'Víctor', 'Figueroa', 0, 13, 3, '2', 1),
(223, 0, 'Matías', 'Fissore', 0, 4, 3, '1', 0),
(224, 0, 'Santiago', 'Fogst', 0, 8, 2, '1', 0),
(225, 0, 'Fabricio', 'Fontanini', 0, 4, 2, '1', 0),
(226, 0, 'Guillermo', 'Franco', 0, 10, 2, '1', 0),
(227, 0, 'Guillermo', 'Franco', 0, 20, 4, '2', 1),
(228, 0, 'Andrés', 'Franzoia', 0, 14, 4, '1', 0),
(229, 0, 'Hernán', 'Fredes', 0, 11, 3, '2', 0),
(230, 0, 'Federico', 'Freire', 0, 20, 3, '1', 0),
(231, 0, 'Matías', 'Fritzler', 0, 12, 3, '2', 1),
(232, 0, 'Diego', 'Ftacla', 0, 18, 4, '1', 0),
(233, 0, 'Diego', 'Fuentes', 0, 1, 2, '1', 0),
(234, 0, 'Esteban', 'Fuertes', 0, 8, 4, '3', 0),
(235, 0, 'Julio', 'Furch', 0, 14, 4, '1', 0),
(236, 0, 'Adrián', 'Gabbarini', 0, 11, 1, '1', 0),
(237, 0, 'Walter', 'Gaitán', 0, 4, 3, '2', 1),
(238, 0, 'Marcos', 'Galarza', 0, 17, 2, '1', 0),
(239, 0, 'Leonel', 'Galeano', 0, 11, 2, '1', 0),
(240, 0, 'Martín', 'Galmarini', 0, 18, 3, '1', 0),
(241, 0, 'Diego', 'Galván', 0, 9, 3, '1', 0),
(242, 0, 'Darío', 'Gandín', 0, 4, 4, '2', 1),
(243, 0, 'Orlando', 'Gaona Lugo', 0, 7, 4, '1', 0),
(244, 0, 'Ariel', 'Garcé', 0, 8, 2, '2', 0),
(245, 0, 'Zelmar', 'García', 0, 10, 2, '1', 0),
(246, 0, 'Gonzalo', 'García', 0, 15, 2, '1', 0),
(247, 0, 'Diego', 'García', 0, 17, 4, '1', 0),
(248, 0, 'Javier', 'García', 0, 18, 1, '2', 0),
(249, 0, 'Danilo', 'Gerlo', 0, 3, 2, '1', 0),
(250, 0, 'Emmanuel', 'Gigliotti', 0, 16, 4, '3', 1),
(251, 0, 'Matías', 'Giménez', 0, 7, 3, '1', 0),
(252, 0, 'Dylan', 'Gissi', 0, 9, 2, '1', 0),
(253, 0, 'Fernando', 'Godoy', 0, 11, 3, '1', 0),
(254, 0, 'Paolo Duval', 'Goltz', 0, 12, 2, '2', 1),
(255, 0, 'Jonatan', 'Gómez', 0, 5, 3, '1', 0),
(256, 0, 'Adrián', 'González', 0, 3, 2, '2', 1),
(257, 0, 'Esteban', 'González', 0, 6, 3, '1', 1),
(258, 0, 'Fernando', 'González', 0, 6, 2, '1', 0),
(259, 0, 'Leandro', 'González', 0, 8, 4, '1', 1),
(260, 0, 'Mariano', 'González', 0, 9, 3, '2', 1),
(261, 0, 'Diego', 'González', 0, 12, 3, '1', 0),
(262, 0, 'Cristian', 'González', 0, 13, 4, '1', 0),
(263, 0, 'Federico', 'González', 0, 4, 4, '1', 1),
(264, 0, 'Sebastián', 'González', 0, 16, 3, '1', 0),
(265, 0, 'Cristian', 'Grabinski', 0, 17, 2, '1', 1),
(266, 0, 'Leandro', 'Gracián', 0, 7, 3, '1', 0),
(267, 0, 'Gabriel', 'Graciani', 0, 8, 3, '1', 0),
(268, 0, 'Claudio', 'Graf', 0, 17, 4, '1', 0),
(269, 0, 'Hernán', 'Grana', 0, 6, 2, '1', 0),
(270, 0, 'Franco', 'Grassi', 0, 5, 1, '1', 0),
(271, 0, 'Julián', 'Guillermo Rojas', 0, 5, 3, '1', 0),
(272, 0, 'Gastón', 'Guruceaga', 0, 13, 2, '1', 0),
(273, 0, 'Teófilo', 'Gutiérrez', 0, 15, 4, '3', 1),
(274, 0, 'Fernando', 'Gutiérrez', 0, 16, 3, '1', 0),
(275, 0, 'Nahuel', 'Guzmán', 0, 13, 1, '1', 0),
(276, 0, 'Gabriel', 'Hauche', 0, 15, 4, '2', 1),
(277, 0, 'Carlos', 'Henneberg', 0, 12, 4, '1', 0),
(278, 0, 'Juan Pablo', 'Heredia', 0, 6, 1, '1', 0),
(279, 0, 'Emilio', 'Hernández', 0, 2, 3, '1', 1),
(280, 0, 'Pablo', 'Hernández', 0, 2, 3, '1', 0),
(281, 0, 'Federico', 'Higuaín', 0, 8, 4, '2', 0),
(282, 0, 'Michael', 'Hoyos', 0, 9, 3, '1', 0),
(283, 0, 'Lucas', 'Hoyos', 0, 13, 1, '1', 0),
(284, 0, 'Jefferson', 'Hurtado', 0, 2, 2, '1', 0),
(285, 0, 'Nelson', 'Ibáñez', 0, 10, 1, '1', 0),
(286, 0, 'Matías', 'Ibáñez', 0, 14, 1, '1', 0),
(287, 0, 'Raúl', 'Iberbia', 0, 9, 2, '1', 1),
(288, 0, 'Juan Martín', 'Imbert', 0, 7, 4, '1', 0),
(289, 0, 'Juan Manuel', 'Insaurralde', 0, 7, 2, '2', 0),
(290, 0, 'Hugo', 'Iriarte', 0, 4, 2, '1', 0),
(291, 0, 'Daniel', 'Islas', 0, 18, 1, '1', 0),
(292, 0, 'Kevin Fabián', 'Itabel', 0, 18, 3, '1', 0),
(293, 0, 'Carlos', 'Izquierdoz', 0, 12, 2, '1', 1),
(294, 0, 'Leonardo', 'Jara', 0, 9, 3, '1', 0),
(295, 0, 'Pablo', 'Jerez', 0, 14, 2, '1', 0),
(296, 0, 'Iván', 'Juárez', 0, 4, 3, '1', 1),
(297, 0, 'Enzo', 'Kalinski', 0, 16, 3, '1', 1),
(298, 0, 'Lucas', 'Kruspzky', 0, 11, 2, '1', 0),
(299, 0, 'Luciano', 'Kummer', 0, 8, 2, '1', 0),
(300, 0, 'Matías', 'Laba', 0, 2, 3, '1', 1),
(301, 0, 'Santiago', 'Ladino', 0, 5, 2, '1', 0),
(302, 0, 'Luis', 'Lagrutta', 0, 4, 3, '1', 0),
(303, 0, 'César', 'Lamanna', 0, 16, 4, '1', 0),
(304, 0, 'Franco', 'Lanaro', 0, 18, 4, '1', 0),
(305, 0, 'Lucas', 'Landa', 0, 17, 2, '1', 1),
(306, 0, 'Maximiliano', 'Laso', 0, 5, 3, '1', 0),
(307, 0, 'Joaquín', 'Laso', 0, 18, 2, '1', 0),
(308, 0, 'Cristian', 'Ledesma', 0, 8, 3, '1', 0),
(309, 0, 'Eduardo', 'Ledesma', 0, 12, 3, '1', 0),
(310, 0, 'Luciano', 'Leguizamón', 0, 3, 4, '2', 1),
(311, 0, 'Leandro', 'Leguizamón', 0, 18, 4, '1', 0),
(312, 0, 'Cristian', 'Lema', 0, 18, 2, '1', 0),
(313, 0, 'Alejandro', 'Lembo', 0, 6, 2, '1', 1),
(314, 0, 'Ramiro', 'Leone', 0, 18, 3, '1', 0),
(315, 0, 'Germán', 'Lesman', 0, 8, 4, '1', 0),
(316, 0, 'Bernardo', 'Leyenda', 0, 1, 1, '1', 0),
(317, 0, 'Lucas', 'Licht', 0, 15, 2, '2', 1),
(318, 0, 'Pablo', 'Lima', 0, 8, 2, '1', 0),
(319, 0, 'Alejandro', 'Limia', 0, 19, 1, '1', 0),
(320, 0, 'Marcos', 'Litre', 0, 14, 4, '1', 0),
(321, 0, 'Braian', 'Lluy', 0, 15, 2, '1', 0),
(322, 0, 'Luciano', 'Lollo', 0, 6, 2, '1', 0),
(323, 0, 'Víctor David', 'López', 0, 1, 3, '1', 0),
(324, 0, 'Lisandro', 'López', 0, 3, 2, '3', 0),
(325, 0, 'Víctor', 'López', 0, 5, 2, '2', 0),
(326, 0, 'Hernán Rodrigo', 'López', 0, 5, 4, '2', 0),
(327, 0, 'Sergio', 'López', 0, 10, 3, '1', 0),
(328, 0, 'Nicolás', 'López', 0, 4, 4, '1', 0),
(329, 0, 'Cristian', 'Lucchetti', 0, 5, 1, '2', 0),
(330, 0, 'Adrián', 'Lucero', 0, 14, 3, '1', 0),
(331, 0, 'Abel', 'Luciatti', 0, 16, 2, '1', 0),
(332, 0, 'Rodrigo', 'Lugo', 0, 2, 1, '1', 0),
(333, 0, 'Pablo', 'Lugüercio', 0, 15, 4, '2', 0),
(334, 0, 'Sebastián', 'Luna', 0, 16, 2, '1', 0),
(335, 0, 'Carlos', 'Luna', 0, 18, 4, '2', 0),
(336, 0, 'Carlos', 'Luque', 0, 8, 4, '1', 0),
(337, 0, 'Alexis', 'Machuca', 0, 13, 2, '1', 0),
(338, 0, 'Gerardo', 'Maciel', 0, 5, 3, '1', 0),
(339, 0, 'Ezequiel', 'Maggiolo', 0, 18, 4, '2', 0),
(340, 0, 'Pablo', 'Magnín', 0, 19, 4, '1', 0),
(341, 0, 'Mauro', 'Maidana', 0, 19, 2, '1', 0),
(342, 0, 'Juan Carlos', 'Maldonado', 0, 6, 3, '1', 0),
(343, 0, 'Lucas', 'Mancinelli', 0, 12, 2, '1', 0),
(344, 0, 'Federico', 'Mancuello', 0, 6, 3, '1', 0),
(345, 0, 'César', 'Mansanelli', 0, 6, 3, '1', 0),
(346, 0, 'Agustín', 'Marchesín', 0, 12, 1, '2', 1),
(347, 0, 'Iván', 'Marcone', 0, 3, 3, '1', 0),
(348, 0, 'Leandro Lucas', 'Marín', 0, 7, 2, '1', 0),
(349, 0, 'Francisco', 'Martínez', 0, 1, 2, '1', 0),
(350, 0, 'Matías', 'Martínez', 0, 15, 2, '2', 1),
(351, 0, 'Diego', 'Martínez', 0, 16, 4, '1', 0),
(352, 0, 'Adrián', 'Martínez', 0, 16, 2, '1', 0),
(353, 0, 'Román', 'Martínez', 0, 18, 3, '2', 1),
(354, 0, 'Nicolás', 'Martínez', 0, 18, 2, '1', 0),
(355, 0, 'Juan Manuel', 'Martínez', 0, 20, 4, '3', 1),
(356, 0, 'Emmanuel', 'Mas', 0, 17, 2, '1', 1),
(357, 0, 'Ezequiel', 'Mastrolía', 0, 16, 1, '1', 0),
(358, 0, 'Diego', 'Mateo', 0, 13, 3, '1', 1),
(359, 0, 'Carlos', 'Matheu', 0, 11, 2, '2', 0),
(360, 0, 'Mauro', 'Matos', 0, 1, 4, '2', 1),
(361, 0, 'Francisco', 'Mattia', 0, 17, 2, '1', 0),
(362, 0, 'Juan Alberto', 'Mauri', 0, 14, 3, '1', 0),
(363, 0, 'Lucas', 'Melano', 0, 6, 4, '1', 0),
(364, 0, 'Jesús', 'Méndez', 0, 7, 3, '2', 0),
(365, 0, 'Gabriel', 'Méndez', 0, 16, 4, '2', 1),
(366, 0, 'Gonzalo', 'Menéndez', 0, 3, 2, '1', 0),
(367, 0, 'Lucas', 'Menossi', 0, 18, 3, '1', 0),
(368, 0, 'Juan Carlos', 'Menseguez', 0, 16, 4, '2', 0),
(369, 0, 'Gabriel', 'Mercado', 0, 9, 2, '2', 0),
(370, 0, 'Fernando', 'Meza', 0, 16, 2, '1', 0),
(371, 0, 'Pablo', 'Migliore', 0, 16, 1, '2', 1),
(372, 0, 'Pablo', 'Miguez', 0, 19, 3, '1', 0),
(373, 0, 'Gabriel', 'Milito', 0, 11, 2, '2', 0),
(374, 0, 'Nicolás', 'Millán', 0, 18, 4, '1', 0),
(375, 0, 'Pablo', 'Miranda', 0, 10, 4, '1', 0),
(376, 0, 'Maximiliano', 'Montero', 0, 18, 2, '1', 0),
(377, 0, 'Fausto', 'Montero', 0, 19, 3, '1', 0),
(378, 0, 'Marcelo', 'Montoya', 0, 20, 1, '2', 1),
(379, 0, 'Juan José', 'Morales', 0, 2, 4, '1', 1),
(380, 0, 'Diego', 'Morales', 0, 18, 3, '2', 1),
(381, 0, 'Giovanni', 'Moreno', 0, 15, 3, '3', 1),
(382, 0, 'Emanuel', 'Moreno', 0, 19, 3, '1', 0),
(383, 0, 'Iván', 'Moreno y Fabianesi', 0, 8, 3, '2', 1),
(384, 0, 'Claudio', 'Mosca', 0, 3, 3, '1', 0),
(385, 0, 'Pablo', 'Mouche', 0, 7, 4, '2', 1),
(386, 0, 'Gabriel Oscar', 'Moyano', 0, 10, 3, '1', 0),
(387, 0, 'Sebastián', 'Moyano', 0, 10, 1, '1', 0),
(388, 0, 'Lucas', 'Mugni', 0, 8, 3, '1', 0),
(389, 0, 'Damián', 'Musto', 0, 14, 3, '1', 0),
(390, 0, 'Alvaro', 'Navarro', 0, 10, 4, '1', 0),
(391, 0, 'Hilario', 'Navarro', 0, 11, 1, '2', 1),
(392, 0, 'Leandro', 'Navarro', 0, 16, 3, '1', 0),
(393, 0, 'Juan', 'Neira', 0, 12, 3, '1', 1),
(394, 0, 'Hugo Martín', 'Nervo', 0, 3, 2, '1', 0),
(395, 0, 'Brian', 'Nieva', 0, 11, 4, '1', 0),
(396, 0, 'Alexis', 'Niz', 0, 4, 2, '1', 0),
(397, 0, 'Ricardo', 'Noir', 0, 13, 4, '1', 1),
(398, 0, 'Leonel', 'Núñez', 0, 11, 4, '2', 0),
(399, 0, 'Maximiliano', 'Núñez', 0, 17, 3, '1', 0),
(400, 0, 'Fabricio', 'Núñez', 0, 19, 4, '1', 0),
(401, 0, 'Gustavo', 'Oberman', 0, 2, 4, '1', 0),
(402, 0, 'Mauro Iván', 'Obolo', 0, 3, 4, '3', 1),
(403, 0, 'Luis', 'Ojeda', 0, 2, 1, '1', 1),
(404, 0, 'Juan Carlos', 'Olave', 0, 6, 1, '1', 1),
(405, 0, 'Emanuel', 'Olivera', 0, 20, 2, '1', 0),
(406, 0, 'Nicolás', 'Olmedo', 0, 10, 3, '2', 0),
(407, 0, 'Lucas', 'Orban', 0, 18, 2, '1', 0),
(408, 0, 'Catriel', 'Orcellet', 0, 3, 1, '1', 0),
(409, 0, 'Agustín', 'Orion', 0, 7, 1, '3', 0),
(410, 0, 'Néstor', 'Ortigoza', 0, 16, 3, '3', 1),
(411, 0, 'Jorge', 'Ortiz', 0, 3, 3, '1', 0),
(412, 0, 'Fernando', 'Ortiz', 0, 20, 2, '2', 1),
(413, 0, 'Lucas', 'Oviedo', 0, 17, 3, '1', 0),
(414, 0, 'Jonathan', 'Pacheco', 0, 16, 3, '1', 0),
(415, 0, 'Hugo', 'Padilla', 0, 6, 2, '1', 0),
(416, 0, 'Matías', 'Palavecino', 0, 14, 2, '1', 0),
(417, 0, 'José Luis', 'Palomino', 0, 16, 2, '1', 0),
(418, 0, 'Armando', 'Panceri', 0, 1, 2, '1', 0),
(419, 0, 'Emiliano', 'Papa', 0, 20, 2, '2', 1),
(420, 0, 'Norberto', 'Paparatto', 0, 18, 2, '1', 0),
(421, 0, 'Leandro', 'Paredes', 0, 7, 4, '1', 0),
(422, 0, 'Lucas', 'Parodi', 0, 6, 3, '1', 0),
(423, 0, 'Facundo', 'Parra', 0, 11, 4, '2', 1),
(424, 0, 'Elian', 'Parrino', 0, 9, 2, '1', 0),
(425, 0, 'Pablo', 'Pavetti', 0, 4, 3, '1', 0),
(426, 0, 'Nicolás', 'Pavlovich', 0, 14, 4, '1', 0),
(427, 0, 'Mariano', 'Pavone', 0, 12, 4, '2', 1),
(428, 0, 'Fabricio', 'Pedrozo', 0, 16, 4, '1', 0),
(429, 0, 'Maximiliano', 'Pellegrino', 0, 8, 2, '2', 0),
(430, 0, 'Cristian', 'Pellerano', 0, 11, 3, '2', 0),
(431, 0, 'Hernán', 'Pellerano', 0, 13, 2, '2', 1),
(432, 0, 'Agustín', 'Pelletieri', 0, 15, 3, '2', 0),
(433, 0, 'Sebastián', 'Penco', 0, 17, 4, '1', 1),
(434, 0, 'Rodrigo', 'Pepe', 0, 5, 3, '1', 0),
(435, 0, 'Sebastián', 'Peratta', 0, 13, 1, '2', 0),
(436, 0, 'Emanuel', 'Perea', 0, 1, 3, '1', 0),
(437, 0, 'Hernán', 'Pereyra', 0, 5, 3, '1', 0),
(438, 0, 'César', 'Pereyra', 0, 6, 4, '2', 1),
(439, 0, 'Mauricio', 'Pereyra', 0, 12, 3, '1', 0),
(440, 0, 'Juan Pablo', 'Pereyra', 0, 19, 4, '1', 0),
(441, 0, 'Patricio', 'Pérez', 0, 1, 3, '1', 0),
(442, 0, 'Damián Alfredo', 'Pérez', 0, 3, 2, '1', 0),
(443, 0, 'Claudio', 'Pérez', 0, 6, 2, '1', 0),
(444, 0, 'Marco', 'Pérez', 0, 11, 4, '2', 1),
(445, 0, 'Jorge Iván', 'Pérez', 0, 11, 3, '1', 0),
(446, 0, 'Pablo', 'Pérez', 0, 13, 3, '1', 0),
(447, 0, 'Leonel Marcos', 'Pérez', 0, 13, 3, '1', 0),
(448, 0, 'Alejandro', 'Pérez', 0, 19, 2, '1', 0),
(449, 0, 'Matías', 'Pérez García', 0, 1, 3, '1', 0),
(450, 0, 'Martín', 'Pérez Guedes', 0, 14, 3, '1', 0),
(451, 0, 'Gabriel', 'Pérez Tarifa', 0, 2, 4, '1', 0),
(452, 0, 'Gino', 'Peruzzi', 0, 20, 2, '1', 0),
(453, 0, 'Bruno', 'Pezzella', 0, 6, 3, '1', 0),
(454, 0, 'Leonel', 'Pietkiewitz', 0, 4, 3, '1', 0),
(455, 0, 'Iván', 'Pillud', 0, 15, 2, '2', 1),
(456, 0, 'Marcos', 'Pinto', 0, 12, 2, '1', 0),
(457, 0, 'Emanuel', 'Pío', 0, 18, 3, '1', 0),
(458, 0, 'Federico', 'Pistone', 0, 2, 2, '1', 0),
(459, 0, 'Guido', 'Pizarro', 0, 12, 3, '2', 1),
(460, 0, 'Luciano', 'Pocrnjic', 0, 17, 1, '1', 1),
(461, 0, 'Federico', 'Poggi', 0, 17, 3, '1', 0),
(462, 0, 'Diego', 'Pozo', 0, 8, 1, '2', 1),
(463, 0, 'Sebastián', 'Prediger', 0, 8, 3, '1', 0),
(464, 0, 'Mauricio', 'Prol', 0, 1, 3, '1', 0),
(465, 0, 'Gonzalo', 'Prósperi', 0, 2, 2, '2', 1),
(466, 0, 'Ismael', 'Quilez', 0, 8, 2, '1', 0),
(467, 0, 'Carlos', 'Quintana', 0, 12, 2, '1', 0),
(468, 0, 'Marcelo', 'Quinteros', 0, 5, 3, '1', 0),
(469, 0, 'Ronald', 'Quinteros', 0, 19, 3, '1', 0),
(470, 0, 'Facundo', 'Quiroga', 0, 1, 2, '1', 0),
(471, 0, 'Juan', 'Quiroga', 0, 6, 2, '1', 0),
(472, 0, 'Raúl', 'Quiroga', 0, 17, 3, '1', 0),
(473, 0, 'Matías', 'Quiroga', 0, 19, 4, '1', 0),
(474, 0, 'Ronald', 'Raldes', 0, 8, 2, '2', 0),
(475, 0, 'Juan Edgardo', 'Ramírez', 0, 2, 3, '1', 0),
(476, 0, 'Alfredo', 'Ramírez', 0, 8, 3, '1', 0),
(477, 0, 'Rubén', 'Ramírez', 0, 10, 4, '2', 1),
(478, 0, 'Julio Gonzalo', 'Ramírez', 0, 16, 3, '1', 0),
(479, 0, 'David', 'Ramírez', 0, 20, 3, '3', 1),
(480, 0, 'Jonathan', 'Ramírez', 0, 20, 4, '1', 1),
(481, 0, 'Franco', 'Razzotti', 0, 20, 3, '1', 0),
(482, 0, 'Germán', 'Ré', 0, 9, 2, '2', 0),
(483, 0, 'Mario', 'Regueiro', 0, 12, 3, '3', 1),
(484, 0, 'Ezequiel', 'Rescaldani', 0, 20, 4, '1', 0),
(485, 0, 'Juan Cruz', 'Respuela', 0, 15, 3, '1', 0),
(486, 0, 'Salvador', 'Reynoso', 0, 16, 3, '1', 0),
(487, 0, 'César', 'Rigamonti', 0, 6, 1, '1', 0),
(488, 0, 'Emiliano', 'Rigoni', 0, 6, 3, '1', 0),
(489, 0, 'Leonel', 'Ríos', 0, 14, 3, '1', 0),
(490, 0, 'Juan Román', 'Riquelme', 0, 7, 3, '3', 1),
(491, 0, 'Ciro', 'Rius', 0, 2, 4, '1', 0),
(492, 0, 'Diego', 'Rivero', 0, 7, 3, '2', 1),
(493, 0, 'Marcos', 'Riveros', 0, 13, 3, '1', 0),
(494, 0, 'Emison', 'Roberval', 0, 17, 4, '1', 1),
(495, 0, 'Leonardo', 'Roda', 0, 17, 4, '1', 0),
(496, 0, 'Andrés', 'Rodales', 0, 18, 2, '1', 0),
(497, 0, 'Juan Pablo', 'Rodríguez', 0, 1, 3, '1', 0),
(498, 0, 'Lucas', 'Rodríguez', 0, 2, 2, '1', 0),
(499, 0, 'Gonzalo', 'Rodríguez', 0, 2, 4, '1', 0),
(500, 0, 'Ribair', 'Rodríguez', 0, 6, 3, '1', 0),
(501, 0, 'Clemente', 'Rodríguez', 0, 7, 2, '2', 1),
(502, 0, 'Patricio', 'Rodríguez', 0, 11, 3, '2', 0),
(503, 0, 'Diego', 'Rodríguez', 0, 11, 1, '1', 0),
(504, 0, 'Germán', 'Rodríguez Rojas', 0, 4, 3, '1', 0),
(505, 0, 'Ariel', 'Rojas', 0, 10, 3, '2', 1),
(506, 0, 'Martín', 'Rolle', 0, 14, 3, '2', 1),
(507, 0, 'Leandro', 'Romagnoli', 0, 16, 3, '2', 1),
(508, 0, 'Bernardo', 'Romeo', 0, 16, 4, '2', 0),
(509, 0, 'Andrés', 'Romero', 0, 2, 4, '1', 0),
(510, 0, 'Silvio', 'Romero', 0, 12, 4, '2', 1),
(511, 0, 'Emiliano', 'Romero', 0, 14, 4, '1', 0),
(512, 0, 'Jonatan', 'Romero', 0, 18, 2, '1', 0),
(513, 0, 'Facundo', 'Roncaglia', 0, 7, 2, '2', 1),
(514, 0, 'Ariel', 'Rosada', 0, 14, 3, '1', 0),
(515, 0, 'Pablo', 'Rosales', 0, 9, 2, '1', 0),
(516, 0, 'Paulo', 'Rosales', 0, 19, 3, '2', 1),
(517, 0, 'Pablo', 'Rúdisi', 0, 6, 2, '1', 0),
(518, 0, 'Matias Ezequiel', 'Rudler', 0, 1, 3, '1', 0),
(519, 0, 'Henry', 'Rui', 0, 1, 4, '1', 0),
(520, 0, 'Enzo Adrián', 'Ruiz', 0, 7, 2, '1', 0),
(521, 0, 'Pablo', 'Ruiz', 0, 10, 4, '1', 0),
(522, 0, 'Roberto', 'Russo', 0, 10, 2, '1', 0),
(523, 0, 'Raúl', 'Saavedra', 0, 17, 2, '1', 0),
(524, 0, 'Juan', 'Sabia', 0, 2, 2, '1', 0),
(525, 0, 'Joel', 'Sacks', 0, 4, 2, '1', 0),
(526, 0, 'Nicolás', 'Sainz', 0, 15, 2, '1', 0),
(527, 0, 'Sebastián', 'Saja', 0, 15, 1, '3', 0),
(528, 0, 'Franklin', 'Salas', 0, 10, 4, '1', 0),
(529, 0, 'Santiago', 'Salcedo', 0, 2, 4, '2', 0),
(530, 0, 'Juan', 'Salgueiro', 0, 16, 4, '2', 0),
(531, 0, 'Carlos', 'Salom', 0, 1, 4, '1', 0),
(532, 0, 'José', 'San Román', 0, 16, 2, '1', 0),
(533, 0, 'Fernando', 'Sánchez', 0, 1, 3, '1', 0),
(534, 0, 'Matías', 'Sánchez', 0, 9, 3, '2', 0),
(535, 0, 'Nicolás', 'Sánchez', 0, 10, 2, '2', 1),
(536, 0, 'Sergio', 'Sánchez', 0, 10, 3, '1', 0),
(537, 0, 'Guillermo', 'Sánchez', 0, 14, 2, '1', 0),
(538, 0, 'Juan Manuel', 'Sánchez Miño', 0, 19, 3, '1', 0),
(539, 0, 'Damián', 'Santagatti', 0, 19, 2, '1', 0),
(540, 0, 'Pablo', 'Santillo', 0, 5, 1, '1', 0),
(541, 0, 'Guillermo', 'Sara', 0, 4, 1, '1', 1),
(542, 0, 'Brian', 'Sarmiento', 0, 15, 4, '1', 0),
(543, 0, 'Marcelo', 'Sarmiento', 0, 19, 3, '1', 0),
(544, 0, 'Matías', 'Sarulyte', 0, 9, 2, '1', 0),
(545, 0, 'Gastón', 'Sauro', 0, 7, 2, '1', 0),
(546, 0, 'Mauricio', 'Scaglia', 0, 13, 2, '1', 0),
(547, 0, 'Juan Pablo', 'Scheffer', 0, 14, 2, '1', 0),
(548, 0, 'Rolando', 'Schiavi', 0, 7, 2, '3', 0),
(549, 0, 'Favio', 'Segovia', 0, 5, 2, '1', 0),
(550, 0, 'Sergio', 'Sena', 0, 3, 3, '1', 0),
(551, 0, 'Walter', 'Serrano', 0, 4, 3, '1', 1),
(552, 0, 'Matías', 'Sierra', 0, 3, 3, '1', 0),
(553, 0, 'Leonardo', 'Sigali', 0, 10, 2, '2', 0),
(554, 0, 'Juan Ignacio', 'Sills', 0, 20, 2, '1', 0),
(555, 0, 'Agustín', 'Silva', 0, 9, 1, '1', 0),
(556, 0, 'Andrés', 'Silvera', 0, 6, 4, '2', 1),
(557, 0, 'Luis', 'Solignac', 0, 5, 4, '1', 0),
(558, 0, 'Leandro', 'Somoza', 0, 7, 3, '2', 0),
(559, 0, 'Franco', 'Sosa', 0, 7, 2, '1', 1),
(560, 0, 'Sebastián', 'Sosa', 0, 7, 1, '1', 0),
(561, 0, 'Diego', 'Sosa', 0, 17, 2, '1', 0),
(562, 0, 'Carlos', 'Soto', 0, 1, 2, '1', 0),
(563, 0, 'Santiago', 'Soto', 0, 8, 3, '1', 0),
(564, 0, 'Matías', 'Soto Torres', 0, 19, 3, '1', 0),
(565, 0, 'Mauricio', 'Sperduti', 0, 13, 3, '3', 1),
(566, 0, 'Darío', 'Stefanatto', 0, 1, 3, '1', 1),
(567, 0, 'Gastón', 'Suárez', 0, 6, 3, '1', 0),
(568, 0, 'Pedro', 'Suárez', 0, 19, 2, '1', 0),
(569, 0, 'Nicolás', 'Tagliafico', 0, 5, 2, '1', 0),
(570, 0, 'Juan', 'Tejera', 0, 14, 2, '1', 0),
(571, 0, 'Emiliano', 'Tellechea', 0, 16, 3, '1', 0),
(572, 0, 'Fernando', 'Tobio', 0, 20, 2, '1', 0),
(573, 0, 'Gustavo', 'Toledo', 0, 5, 2, '1', 0),
(574, 0, 'Laureano', 'Tombolini', 0, 14, 1, '1', 1),
(575, 0, 'Martín', 'Tonso', 0, 13, 3, '1', 0),
(576, 0, 'Patricio', 'Toranzo', 0, 15, 3, '2', 1),
(577, 0, 'Agustín', 'Torassa', 0, 1, 4, '1', 0),
(578, 0, 'Miguel', 'Torrén', 0, 2, 2, '1', 0),
(579, 0, 'Diego', 'Torres', 0, 3, 4, '1', 0),
(580, 0, 'Bernardo', 'Torres', 0, 6, 3, '1', 0),
(581, 0, 'Adrián', 'Torres', 0, 10, 3, '1', 0),
(582, 0, 'Aureliano', 'Torres', 0, 16, 2, '2', 0),
(583, 0, 'Sebastián', 'Torrico', 0, 10, 1, '2', 0),
(584, 0, 'Cristian', 'Trombetta', 0, 3, 2, '1', 0),
(585, 0, 'Cristian', 'Tula', 0, 16, 2, '2', 0),
(586, 0, 'Federico', 'Tursi', 0, 18, 1, '1', 0),
(587, 0, 'Gastón', 'Turus', 0, 6, 2, '1', 1),
(588, 0, 'Eduardo', 'Tuzzio', 0, 11, 2, '2', 0),
(589, 0, 'Bruno', 'Urribarri', 0, 8, 2, '1', 1),
(590, 0, 'Maximiliano', 'Urruti', 0, 13, 4, '1', 0),
(591, 0, 'Matías', 'Valdez', 0, 12, 2, '1', 0),
(592, 0, 'Carmelo', 'Valencia', 0, 13, 4, '1', 0),
(593, 0, 'Diego', 'Valeri', 0, 12, 3, '3', 1),
(594, 0, 'Jonathan', 'Valle', 0, 13, 2, '1', 0),
(595, 0, 'Gabriel', 'Vallés', 0, 11, 2, '1', 0),
(596, 0, 'Leonel', 'Vangioni', 0, 13, 3, '2', 0),
(597, 0, 'Cristian', 'Varela', 0, 1, 2, '1', 0),
(598, 0, 'Franco', 'Vázquez', 0, 6, 3, '2', 1),
(599, 0, 'David', 'Vega', 0, 14, 3, '1', 0),
(600, 0, 'Maximiliano', 'Velasco', 0, 13, 4, '1', 0),
(601, 0, 'Julián', 'Velázquez', 0, 11, 2, '1', 1),
(602, 0, 'Maximiliano', 'Velázquez', 0, 11, 2, '2', 1),
(603, 0, 'Jorge', 'Velázquez', 0, 19, 3, '1', 0),
(604, 0, 'Leandro', 'Velázquez', 0, 20, 3, '1', 0),
(605, 0, 'José', '20', 0, 11, 2, '1', 0),
(606, 0, 'Cristian', 'Vella', 0, 1, 2, '1', 0),
(607, 0, 'Renzo', 'Vera', 0, 19, 2, '1', 0),
(608, 0, 'Santiago', 'Vergini', 0, 13, 2, '1', 0),
(609, 0, 'Juan Sebastián', 'Verón', 0, 9, 3, '3', 0),
(610, 0, 'Lucas', 'Viatri', 0, 7, 4, '3', 1),
(611, 0, 'Sebastián', 'Vidal', 0, 19, 3, '1', 0),
(612, 0, 'Juan', 'Vieyra', 0, 13, 3, '1', 0),
(613, 0, 'Lucas', 'Villafáñez', 0, 11, 3, '1', 0),
(614, 0, 'Hernán', 'Villalba', 0, 13, 3, '1', 0),
(615, 0, 'Cristian', 'Villanueva', 0, 14, 2, '1', 0),
(616, 0, 'Justo', 'Villar', 0, 9, 1, '2', 0),
(617, 0, 'Diego', 'Villar', 0, 10, 3, '2', 1),
(618, 0, 'Valentín', 'Viola', 0, 15, 4, '1', 0),
(619, 0, 'Darío', 'Vitelli', 0, 6, 2, '1', 0),
(620, 0, 'Oswaldo', 'Vizcarrondo', 0, 14, 2, '1', 0),
(621, 0, 'Germán', 'Voboril', 0, 10, 2, '1', 0),
(622, 0, 'Agustín', 'Vuletich', 0, 20, 4, '1', 0),
(623, 0, 'Martín', 'Wagner', 0, 17, 3, '1', 0),
(624, 0, 'Claudio', 'Yacob', 0, 15, 3, '2', 1),
(625, 0, 'Walter', 'Yacob', 0, 19, 2, '1', 0),
(626, 0, 'Rubén', 'Zamponi', 0, 17, 2, '1', 0),
(627, 0, 'Martín', 'Zapata', 0, 1, 3, '1', 0),
(628, 0, 'Duván', 'Zapata', 0, 9, 4, '1', 0),
(629, 0, 'Víctor', 'Zapata', 0, 20, 3, '2', 1),
(630, 0, 'Martín', 'Zbrun', 0, 4, 2, '1', 1),
(631, 0, 'Matías', 'Zbrun', 0, 4, 4, '1', 0),
(632, 0, 'Emilio', 'Zelaya', 0, 3, 4, '1', 0),
(633, 0, 'Bruno', 'Zuculini', 0, 15, 3, '1', 0),
(634, 0, 'Santiago', 'Zurbriggen', 0, 19, 2, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playermatch`
--

DROP TABLE IF EXISTS `playermatch`;
CREATE TABLE IF NOT EXISTS `playermatch` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `player` bigint(20) NOT NULL,
  `match_` bigint(20) NOT NULL,
  `totalPoints` double default NULL,
  `olePoints` double default NULL,
  `cleanGoal` tinyint(1) default NULL,
  `recivedGoals` int(11) default NULL,
  `ownGoals` int(11) default NULL,
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
  KEY `FK_PlayerMatch_match` (`match_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `playermatch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerposition`
--

DROP TABLE IF EXISTS `playerposition`;
CREATE TABLE IF NOT EXISTS `playerposition` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `playerposition`
--

INSERT INTO `playerposition` (`id`, `version`, `name`) VALUES
(1, 0, 'Arquero'),
(2, 0, 'Defensor'),
(3, 0, 'Volante'),
(4, 0, 'Delantero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerteam`
--

DROP TABLE IF EXISTS `playerteam`;
CREATE TABLE IF NOT EXISTS `playerteam` (
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
  KEY `FK_PlayerTeam_team` (`team`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=559 ;

--
-- Volcar la base de datos para la tabla `playerteam`
--

INSERT INTO `playerteam` (`id`, `version`, `player`, `team`, `isCaptain1`, `isCaptain2`, `isCaptain3`, `isPrincipal`, `isList`, `isSubstitute`, `number`) VALUES
(2, 1, 403, 52, 0, 0, 0, 1, 0, 0, 1),
(3, 1, 346, 52, 0, 0, 0, 0, 0, 1, 2),
(8, 1, 162, 52, 0, 0, 0, 1, 0, 0, 3),
(9, 3, 135, 52, 0, 0, 0, 1, 0, 0, 4),
(11, 2, 617, 52, 1, 0, 0, 1, 0, 0, 6),
(12, 2, 353, 52, 0, 1, 0, 1, 0, 0, 7),
(13, 1, 598, 52, 0, 0, 0, 1, 0, 0, 8),
(14, 2, 310, 52, 0, 0, 1, 1, 0, 0, 9),
(15, 2, 490, 58, 1, 0, 0, 1, 0, 0, 1),
(16, 2, 593, 58, 0, 1, 0, 1, 0, 0, 2),
(17, 1, 273, 58, 0, 0, 0, 1, 0, 0, 3),
(18, 1, 46, 58, 0, 0, 0, 1, 0, 0, 4),
(19, 1, 80, 58, 0, 0, 0, 1, 0, 0, 5),
(20, 1, 350, 58, 0, 0, 0, 1, 0, 0, 6),
(21, 1, 501, 58, 0, 0, 0, 1, 0, 0, 7),
(22, 1, 135, 58, 0, 0, 0, 1, 0, 0, 8),
(24, 1, 617, 58, 0, 0, 0, 1, 0, 0, 9),
(25, 2, 273, 68, 1, 0, 0, 1, 0, 0, 1),
(26, 1, 135, 68, 0, 0, 0, 1, 0, 0, 2),
(27, 1, 46, 68, 0, 0, 0, 1, 0, 0, 3),
(28, 1, 6, 68, 0, 0, 0, 0, 0, 1, 4),
(29, 1, 87, 68, 0, 0, 0, 1, 0, 0, 5),
(30, 1, 101, 68, 0, 0, 0, 1, 0, 0, 6),
(31, 1, 305, 68, 0, 0, 0, 1, 0, 0, 7),
(32, 1, 35, 68, 0, 0, 0, 0, 0, 1, 8),
(33, 1, 143, 68, 0, 0, 0, 1, 0, 0, 9),
(34, 3, 148, 68, 0, 0, 0, 0, 0, 1, 16),
(35, 1, 506, 68, 0, 0, 0, 1, 0, 0, 11),
(36, 1, 598, 68, 0, 0, 0, 1, 0, 0, 12),
(37, 2, 397, 68, 0, 0, 0, 0, 0, 1, 14),
(38, 3, 610, 68, 0, 0, 1, 1, 0, 0, 13),
(40, 2, 479, 68, 0, 1, 0, 1, 0, 0, 10),
(41, 0, 107, 68, 0, 0, 0, 0, 1, 0, 17),
(42, 1, 138, 68, 0, 0, 0, 0, 0, 1, 18),
(43, 0, 172, 68, 0, 0, 0, 0, 1, 0, 19),
(44, 2, 63, 68, 0, 0, 0, 0, 1, 0, 23),
(46, 0, 529, 68, 0, 0, 0, 0, 1, 0, 22),
(47, 1, 551, 68, 0, 0, 0, 0, 0, 1, 20),
(48, 1, 427, 68, 0, 0, 0, 0, 0, 1, 21),
(49, 1, 46, 71, 0, 0, 0, 1, 0, 0, 1),
(50, 1, 105, 71, 0, 0, 0, 0, 0, 1, 2),
(52, 1, 80, 71, 0, 0, 0, 1, 0, 0, 4),
(53, 2, 455, 71, 0, 0, 1, 1, 0, 0, 5),
(54, 1, 602, 71, 0, 0, 0, 1, 0, 0, 6),
(55, 1, 135, 71, 0, 0, 0, 1, 0, 0, 7),
(56, 2, 143, 71, 1, 0, 0, 1, 0, 0, 8),
(57, 3, 506, 71, 0, 0, 0, 1, 0, 0, 9),
(58, 2, 242, 71, 0, 1, 0, 1, 0, 0, 10),
(59, 1, 276, 71, 0, 0, 0, 1, 0, 0, 11),
(60, 1, 310, 71, 0, 0, 0, 1, 0, 0, 12),
(61, 1, 444, 71, 0, 0, 0, 0, 0, 1, 13),
(62, 1, 184, 71, 0, 0, 0, 0, 0, 1, 14),
(63, 1, 356, 71, 0, 0, 0, 0, 0, 1, 15),
(65, 1, 158, 71, 0, 0, 0, 1, 0, 0, 17),
(66, 1, 231, 71, 0, 0, 0, 0, 0, 1, 18),
(70, 1, 47, 71, 0, 0, 0, 0, 0, 1, 21),
(72, 0, 23, 71, 0, 0, 0, 0, 1, 0, 22),
(73, 0, 175, 71, 0, 0, 0, 0, 1, 0, 23),
(74, 0, 249, 71, 0, 0, 0, 0, 1, 0, 24),
(75, 1, 181, 71, 0, 0, 0, 0, 0, 1, 25),
(76, 0, 51, 71, 0, 0, 0, 0, 1, 0, 26),
(77, 1, 371, 66, 0, 0, 0, 1, 0, 0, 1),
(78, 1, 431, 66, 0, 0, 0, 1, 0, 0, 2),
(79, 1, 305, 66, 0, 0, 0, 1, 0, 0, 3),
(81, 1, 297, 66, 0, 0, 0, 1, 0, 0, 5),
(82, 1, 158, 66, 0, 0, 0, 1, 0, 0, 6),
(83, 2, 598, 66, 1, 0, 0, 1, 0, 0, 7),
(84, 1, 222, 66, 0, 0, 0, 1, 0, 0, 8),
(85, 3, 516, 66, 0, 1, 0, 1, 0, 0, 9),
(86, 2, 164, 66, 0, 0, 1, 1, 0, 0, 10),
(87, 1, 433, 66, 0, 0, 0, 1, 0, 0, 11),
(88, 1, 460, 66, 0, 0, 0, 0, 0, 1, 12),
(89, 2, 587, 66, 0, 0, 0, 1, 0, 0, 13),
(90, 1, 630, 66, 0, 0, 0, 0, 0, 1, 14),
(91, 1, 135, 66, 0, 0, 0, 0, 0, 1, 15),
(93, 1, 365, 66, 0, 0, 0, 0, 0, 1, 17),
(94, 1, 438, 66, 0, 0, 0, 0, 0, 1, 18),
(96, 1, 559, 66, 0, 0, 0, 0, 0, 1, 20),
(97, 1, 296, 66, 0, 0, 0, 0, 0, 1, 21),
(98, 0, 145, 66, 0, 0, 0, 0, 1, 0, 22),
(99, 0, 541, 66, 0, 0, 0, 0, 1, 0, 23),
(100, 0, 188, 66, 0, 0, 0, 0, 1, 0, 24),
(101, 0, 148, 66, 0, 0, 0, 0, 1, 0, 25),
(102, 1, 46, 56, 0, 0, 0, 1, 0, 0, 1),
(103, 2, 273, 56, 1, 0, 0, 1, 0, 0, 2),
(104, 1, 254, 56, 0, 0, 0, 1, 0, 0, 3),
(105, 1, 87, 56, 0, 0, 0, 1, 0, 0, 4),
(106, 1, 535, 56, 0, 0, 0, 1, 0, 0, 5),
(107, 2, 490, 56, 0, 1, 0, 1, 0, 0, 6),
(108, 3, 565, 56, 0, 0, 0, 1, 0, 0, 7),
(109, 1, 135, 56, 0, 0, 0, 1, 0, 0, 8),
(110, 2, 617, 56, 0, 0, 1, 1, 0, 0, 9),
(111, 1, 242, 56, 0, 0, 0, 1, 0, 0, 10),
(112, 1, 624, 56, 0, 0, 0, 1, 0, 0, 11),
(113, 2, 184, 56, 0, 0, 0, 0, 0, 1, 16),
(117, 1, 76, 56, 0, 0, 0, 0, 0, 1, 15),
(118, 2, 220, 56, 0, 0, 0, 0, 0, 1, 12),
(119, 1, 598, 56, 0, 0, 0, 0, 0, 1, 17),
(121, 2, 556, 52, 0, 0, 0, 0, 0, 1, 13),
(123, 1, 297, 56, 0, 0, 0, 0, 0, 1, 19),
(126, 4, 397, 52, 0, 0, 0, 0, 0, 1, 17),
(127, 0, 459, 56, 0, 0, 0, 0, 1, 0, 22),
(128, 0, 80, 56, 0, 0, 0, 0, 1, 0, 23),
(129, 0, 346, 56, 0, 0, 0, 0, 1, 0, 24),
(130, 1, 360, 56, 0, 0, 0, 0, 0, 1, 25),
(131, 1, 43, 56, 0, 0, 0, 0, 0, 1, 26),
(132, 0, 276, 56, 0, 0, 0, 0, 1, 0, 27),
(133, 3, 46, 57, 0, 0, 0, 0, 1, 0, 14),
(134, 2, 273, 57, 1, 0, 0, 1, 0, 0, 2),
(135, 2, 135, 57, 0, 0, 1, 1, 0, 0, 3),
(136, 5, 346, 57, 0, 0, 0, 1, 0, 0, 1),
(137, 1, 483, 57, 0, 0, 0, 1, 0, 0, 5),
(138, 3, 136, 57, 0, 0, 0, 0, 0, 1, 19),
(139, 1, 617, 57, 0, 0, 0, 1, 0, 0, 7),
(140, 2, 355, 57, 0, 1, 0, 1, 0, 0, 8),
(141, 2, 629, 57, 0, 0, 0, 1, 0, 0, 6),
(142, 1, 455, 57, 0, 0, 0, 1, 0, 0, 10),
(143, 1, 293, 57, 0, 0, 0, 1, 0, 0, 11),
(144, 2, 617, 63, 0, 0, 1, 1, 0, 0, 1),
(145, 2, 505, 63, 0, 0, 0, 0, 0, 1, 9),
(146, 1, 459, 63, 0, 0, 0, 1, 0, 0, 3),
(147, 1, 393, 63, 0, 0, 0, 1, 0, 0, 4),
(148, 1, 381, 63, 0, 0, 0, 1, 0, 0, 5),
(149, 2, 273, 63, 1, 0, 0, 1, 0, 0, 6),
(150, 1, 254, 63, 0, 0, 0, 1, 0, 0, 7),
(151, 2, 250, 63, 0, 1, 0, 1, 0, 0, 8),
(152, 2, 279, 63, 0, 0, 0, 0, 0, 1, 18),
(153, 1, 360, 63, 0, 0, 0, 0, 0, 1, 10),
(154, 1, 145, 63, 0, 0, 0, 0, 0, 1, 11),
(155, 1, 313, 63, 0, 0, 0, 1, 0, 0, 12),
(156, 1, 188, 63, 0, 0, 0, 1, 0, 0, 13),
(157, 1, 46, 63, 0, 0, 0, 1, 0, 0, 14),
(158, 1, 404, 63, 0, 0, 0, 0, 0, 1, 15),
(159, 1, 87, 63, 0, 0, 0, 0, 0, 1, 16),
(160, 1, 53, 63, 0, 0, 0, 0, 0, 1, 17),
(161, 3, 135, 63, 0, 0, 0, 1, 0, 0, 2),
(162, 0, 219, 63, 0, 0, 0, 0, 1, 0, 19),
(163, 0, 101, 63, 0, 0, 0, 0, 1, 0, 20),
(164, 0, 378, 63, 0, 0, 0, 0, 1, 0, 21),
(165, 0, 339, 63, 0, 0, 0, 0, 1, 0, 22),
(166, 1, 397, 57, 0, 0, 0, 1, 0, 0, 12),
(168, 1, 541, 57, 0, 0, 0, 0, 0, 1, 4),
(169, 1, 501, 57, 0, 0, 0, 1, 0, 0, 15),
(171, 1, 465, 57, 0, 0, 0, 0, 0, 1, 16),
(172, 1, 356, 57, 0, 0, 0, 0, 0, 1, 17),
(173, 0, 553, 57, 0, 0, 0, 0, 1, 0, 18),
(174, 4, 164, 52, 0, 0, 0, 1, 0, 0, 12),
(175, 1, 431, 52, 0, 0, 0, 1, 0, 0, 14),
(176, 5, 192, 52, 0, 0, 0, 0, 0, 1, 15),
(177, 3, 287, 52, 0, 0, 0, 0, 0, 1, 20),
(179, 2, 510, 52, 0, 0, 0, 1, 0, 0, 11),
(180, 2, 143, 57, 0, 0, 0, 0, 0, 1, 9),
(181, 0, 158, 57, 0, 0, 0, 0, 1, 0, 20),
(182, 1, 242, 57, 0, 0, 0, 0, 0, 1, 21),
(183, 1, 365, 57, 0, 0, 0, 0, 0, 1, 22),
(184, 0, 164, 57, 0, 0, 0, 0, 1, 0, 23),
(185, 1, 371, 59, 0, 0, 0, 1, 0, 0, 1),
(186, 7, 80, 59, 0, 0, 0, 0, 1, 0, 28),
(187, 1, 87, 59, 0, 0, 0, 1, 0, 0, 3),
(188, 4, 501, 59, 0, 0, 0, 1, 0, 0, 15),
(190, 3, 617, 59, 0, 1, 0, 1, 0, 0, 6),
(191, 2, 629, 59, 0, 0, 1, 1, 0, 0, 7),
(193, 1, 164, 59, 0, 0, 0, 1, 0, 0, 9),
(195, 3, 444, 59, 1, 0, 0, 1, 0, 0, 11),
(196, 2, 360, 59, 0, 0, 0, 0, 0, 1, 20),
(197, 1, 142, 59, 0, 0, 0, 0, 0, 1, 13),
(198, 5, 305, 59, 0, 0, 0, 0, 0, 1, 22),
(199, 5, 24, 59, 0, 0, 0, 0, 0, 1, 25),
(201, 2, 385, 59, 0, 0, 0, 0, 0, 1, 16),
(203, 3, 393, 59, 0, 0, 0, 1, 0, 0, 8),
(205, 2, 227, 59, 0, 0, 0, 1, 0, 0, 12),
(206, 0, 46, 59, 0, 0, 0, 0, 1, 0, 21),
(208, 4, 222, 59, 0, 0, 0, 0, 1, 0, 27),
(209, 0, 423, 59, 0, 0, 0, 0, 1, 0, 24),
(211, 2, 346, 69, 0, 0, 0, 1, 0, 0, 2),
(212, 2, 46, 69, 0, 0, 0, 0, 1, 0, 23),
(213, 1, 419, 69, 0, 0, 0, 1, 0, 0, 4),
(214, 1, 293, 69, 0, 0, 0, 1, 0, 0, 5),
(215, 2, 87, 69, 0, 0, 0, 0, 1, 0, 9),
(216, 1, 188, 69, 0, 0, 0, 0, 0, 1, 7),
(217, 1, 287, 69, 0, 0, 0, 0, 0, 1, 8),
(219, 1, 256, 69, 0, 0, 0, 1, 0, 0, 6),
(220, 2, 381, 69, 0, 0, 1, 1, 0, 0, 10),
(221, 2, 273, 69, 1, 0, 0, 1, 0, 0, 11),
(222, 2, 78, 69, 0, 1, 0, 1, 0, 0, 12),
(223, 1, 598, 69, 0, 0, 0, 1, 0, 0, 13),
(224, 1, 507, 69, 0, 0, 0, 1, 0, 0, 14),
(225, 6, 148, 69, 0, 0, 0, 0, 1, 0, 22),
(226, 1, 164, 69, 0, 0, 0, 1, 0, 0, 16),
(229, 1, 46, 67, 0, 0, 0, 1, 0, 0, 1),
(230, 1, 479, 67, 0, 0, 0, 1, 0, 0, 2),
(231, 1, 101, 67, 0, 0, 0, 1, 0, 0, 3),
(232, 1, 87, 67, 0, 0, 0, 1, 0, 0, 4),
(235, 2, 227, 69, 0, 0, 0, 0, 0, 1, 17),
(236, 1, 455, 67, 0, 0, 0, 1, 0, 0, 6),
(237, 1, 617, 69, 0, 0, 0, 1, 0, 0, 15),
(238, 3, 165, 69, 0, 0, 0, 0, 0, 1, 21),
(239, 1, 135, 69, 0, 0, 0, 0, 0, 1, 20),
(241, 2, 69, 67, 0, 1, 0, 1, 0, 0, 7),
(244, 2, 629, 67, 1, 0, 0, 1, 0, 0, 9),
(246, 2, 610, 67, 0, 0, 1, 1, 0, 0, 10),
(247, 1, 402, 67, 0, 0, 0, 1, 0, 0, 11),
(248, 2, 1, 67, 0, 0, 0, 0, 0, 1, 20),
(249, 1, 541, 69, 0, 0, 0, 0, 0, 1, 3),
(250, 1, 371, 67, 0, 0, 0, 0, 0, 1, 13),
(251, 1, 513, 67, 0, 0, 0, 0, 0, 1, 14),
(252, 1, 494, 69, 0, 0, 0, 0, 0, 1, 19),
(254, 0, 510, 69, 0, 0, 0, 0, 1, 0, 24),
(255, 1, 265, 67, 0, 0, 0, 0, 0, 1, 16),
(263, 1, 310, 67, 0, 0, 0, 0, 0, 1, 22),
(264, 2, 75, 67, 0, 0, 0, 1, 0, 0, 12),
(265, 1, 50, 67, 0, 0, 0, 0, 0, 1, 26),
(266, 0, 154, 67, 0, 0, 0, 0, 1, 0, 27),
(268, 1, 589, 67, 0, 0, 0, 1, 0, 0, 8),
(269, 1, 259, 67, 0, 0, 0, 0, 0, 1, 28),
(270, 0, 344, 67, 0, 0, 0, 0, 1, 0, 29),
(271, 0, 14, 67, 0, 0, 0, 0, 1, 0, 30),
(272, 0, 462, 67, 0, 0, 0, 0, 1, 0, 31),
(274, 2, 391, 70, 1, 0, 0, 1, 0, 0, 1),
(275, 1, 346, 70, 0, 0, 0, 0, 0, 1, 2),
(276, 0, 403, 70, 0, 0, 0, 0, 1, 0, 3),
(277, 1, 419, 70, 0, 0, 0, 1, 0, 0, 4),
(278, 1, 80, 70, 0, 0, 0, 1, 0, 0, 5),
(279, 1, 317, 70, 0, 0, 0, 1, 0, 0, 6),
(280, 1, 184, 70, 0, 0, 0, 0, 0, 1, 7),
(281, 1, 35, 70, 0, 0, 0, 0, 0, 1, 8),
(282, 0, 138, 70, 0, 0, 0, 0, 1, 0, 9),
(283, 1, 93, 70, 0, 0, 0, 1, 0, 0, 10),
(284, 2, 135, 70, 0, 1, 0, 1, 0, 0, 11),
(285, 2, 576, 70, 0, 0, 1, 1, 0, 0, 12),
(286, 1, 380, 70, 0, 0, 0, 1, 0, 0, 13),
(287, 1, 257, 70, 0, 0, 0, 0, 0, 1, 14),
(288, 1, 566, 70, 0, 0, 0, 0, 0, 1, 15),
(289, 0, 153, 70, 0, 0, 0, 0, 1, 0, 16),
(290, 1, 242, 70, 0, 0, 0, 1, 0, 0, 17),
(291, 1, 164, 70, 0, 0, 0, 1, 0, 0, 18),
(292, 1, 433, 70, 0, 0, 0, 1, 0, 0, 19),
(293, 1, 263, 70, 0, 0, 0, 0, 0, 1, 20),
(294, 1, 47, 70, 0, 0, 0, 0, 0, 1, 21),
(295, 0, 530, 70, 0, 0, 0, 0, 1, 0, 22),
(296, 1, 462, 65, 0, 0, 0, 1, 0, 0, 1),
(297, 1, 87, 65, 0, 0, 0, 1, 0, 0, 2),
(298, 3, 501, 65, 0, 0, 1, 1, 0, 0, 3),
(299, 1, 602, 65, 0, 0, 0, 1, 0, 0, 4),
(300, 1, 383, 65, 0, 0, 0, 1, 0, 0, 5),
(301, 1, 117, 65, 0, 0, 0, 1, 0, 0, 6),
(302, 1, 192, 65, 0, 0, 0, 1, 0, 0, 7),
(303, 2, 135, 65, 0, 1, 0, 1, 0, 0, 8),
(304, 1, 459, 65, 0, 0, 0, 1, 0, 0, 9),
(305, 1, 242, 65, 0, 0, 0, 1, 0, 0, 10),
(307, 1, 105, 65, 0, 0, 0, 0, 0, 1, 12),
(308, 0, 316, 65, 0, 0, 0, 0, 1, 0, 13),
(310, 1, 287, 65, 0, 0, 0, 0, 0, 1, 15),
(312, 1, 260, 65, 0, 0, 0, 0, 0, 1, 17),
(313, 1, 587, 65, 0, 0, 0, 0, 0, 1, 18),
(316, 1, 576, 65, 0, 0, 0, 0, 0, 1, 20),
(317, 0, 280, 65, 0, 0, 0, 0, 1, 0, 21),
(318, 0, 356, 65, 0, 0, 0, 0, 1, 0, 22),
(320, 3, 164, 65, 1, 0, 0, 1, 0, 0, 24),
(322, 1, 379, 65, 0, 0, 0, 0, 0, 1, 26),
(324, 1, 480, 65, 0, 0, 0, 0, 0, 1, 27),
(325, 0, 43, 65, 0, 0, 0, 0, 1, 0, 28),
(326, 2, 490, 61, 1, 0, 0, 1, 0, 0, 1),
(327, 1, 164, 61, 0, 0, 0, 1, 0, 0, 2),
(362, 2, 397, 64, 0, 0, 0, 0, 0, 1, 5),
(363, 3, 391, 64, 0, 0, 0, 0, 0, 1, 6),
(364, 3, 360, 64, 0, 0, 1, 1, 0, 0, 3),
(366, 3, 242, 64, 0, 1, 0, 1, 0, 0, 1),
(367, 2, 116, 64, 0, 0, 0, 0, 1, 0, 9),
(368, 1, 346, 60, 0, 0, 0, 1, 0, 0, 1),
(374, 1, 574, 60, 0, 0, 0, 0, 0, 1, 7),
(375, 1, 87, 60, 0, 0, 0, 1, 0, 0, 8),
(377, 1, 188, 60, 0, 0, 0, 1, 0, 0, 10),
(381, 1, 350, 60, 0, 0, 0, 1, 0, 0, 9),
(382, 1, 412, 60, 0, 0, 0, 0, 0, 1, 11),
(384, 1, 455, 60, 0, 0, 0, 0, 1, 0, 13),
(389, 2, 110, 60, 0, 0, 0, 1, 0, 0, 18),
(391, 2, 135, 60, 0, 0, 0, 1, 0, 0, 16),
(393, 4, 237, 60, 0, 0, 0, 1, 0, 0, 17),
(400, 3, 506, 60, 0, 0, 1, 1, 0, 0, 20),
(404, 5, 617, 60, 0, 0, 0, 0, 0, 1, 27),
(408, 5, 276, 60, 0, 0, 0, 0, 1, 0, 36),
(409, 4, 310, 60, 0, 1, 0, 1, 0, 0, 32),
(414, 1, 438, 60, 0, 0, 0, 0, 0, 1, 35),
(415, 2, 444, 60, 1, 0, 0, 1, 0, 0, 33),
(418, 2, 164, 58, 0, 0, 1, 1, 0, 0, 10),
(419, 1, 423, 58, 0, 0, 0, 1, 0, 0, 11),
(421, 1, 397, 58, 0, 0, 0, 0, 0, 1, 13),
(422, 1, 136, 58, 0, 0, 0, 0, 0, 1, 14),
(424, 1, 297, 58, 0, 0, 0, 0, 0, 1, 16),
(426, 1, 378, 58, 0, 0, 0, 0, 0, 1, 17),
(429, 0, 46, 60, 0, 0, 0, 0, 1, 0, 38),
(430, 1, 601, 58, 0, 0, 0, 0, 0, 1, 20),
(432, 1, 35, 60, 0, 0, 0, 0, 0, 1, 12),
(434, 0, 158, 58, 0, 0, 0, 0, 1, 0, 22),
(435, 1, 300, 60, 0, 0, 0, 0, 0, 1, 22),
(436, 1, 217, 58, 0, 0, 0, 0, 0, 1, 23),
(438, 0, 276, 58, 0, 0, 0, 0, 1, 0, 24),
(439, 0, 346, 58, 0, 0, 0, 0, 1, 0, 25),
(441, 2, 297, 60, 0, 0, 0, 1, 0, 0, 21),
(444, 1, 184, 58, 0, 0, 0, 0, 0, 1, 26),
(445, 0, 455, 58, 0, 0, 0, 0, 1, 0, 27),
(446, 1, 397, 60, 0, 0, 0, 0, 0, 1, 34),
(448, 0, 459, 60, 0, 0, 0, 0, 1, 0, 39),
(449, 3, 61, 64, 0, 0, 0, 0, 0, 1, 20),
(450, 2, 617, 64, 1, 0, 0, 1, 0, 0, 8),
(451, 1, 371, 64, 0, 0, 0, 1, 0, 0, 2),
(452, 1, 501, 64, 0, 0, 0, 1, 0, 0, 10),
(453, 3, 287, 64, 0, 0, 0, 0, 0, 1, 16),
(454, 1, 358, 64, 0, 0, 0, 1, 0, 0, 12),
(455, 1, 551, 64, 0, 0, 0, 1, 0, 0, 13),
(456, 2, 419, 64, 0, 0, 0, 1, 0, 0, 14),
(457, 3, 110, 64, 0, 0, 0, 1, 0, 0, 7),
(458, 4, 256, 59, 0, 0, 0, 1, 0, 0, 2),
(459, 2, 184, 64, 0, 0, 0, 0, 1, 0, 19),
(460, 1, 136, 59, 0, 0, 0, 0, 0, 1, 23),
(461, 2, 317, 64, 0, 0, 0, 1, 0, 0, 11),
(462, 1, 87, 64, 0, 0, 0, 1, 0, 0, 4),
(463, 2, 293, 64, 0, 0, 0, 0, 0, 1, 17),
(464, 3, 231, 64, 0, 0, 0, 0, 1, 0, 21),
(465, 1, 83, 64, 0, 0, 0, 0, 0, 1, 15),
(466, 1, 164, 64, 0, 0, 0, 0, 0, 1, 22),
(467, 1, 598, 59, 0, 0, 0, 0, 0, 1, 26),
(468, 0, 444, 64, 0, 0, 0, 0, 1, 0, 23),
(469, 2, 254, 59, 0, 0, 0, 1, 0, 0, 14),
(471, 0, 616, 52, 0, 0, 0, 0, 1, 0, 18),
(472, 5, 455, 52, 0, 0, 0, 0, 0, 1, 19),
(473, 2, 317, 52, 0, 0, 0, 0, 1, 0, 26),
(475, 1, 492, 52, 0, 0, 0, 0, 0, 1, 22),
(478, 0, 432, 52, 0, 0, 0, 0, 1, 0, 24),
(480, 2, 293, 52, 0, 0, 0, 1, 0, 0, 16),
(481, 0, 427, 52, 0, 0, 0, 0, 1, 0, 27),
(482, 1, 346, 53, 0, 0, 0, 1, 0, 0, 1),
(483, 1, 460, 53, 0, 0, 0, 0, 0, 1, 2),
(484, 0, 404, 53, 0, 0, 0, 0, 1, 0, 3),
(485, 1, 465, 53, 0, 0, 0, 1, 0, 0, 4),
(486, 1, 602, 53, 0, 0, 0, 1, 0, 0, 5),
(487, 1, 305, 53, 0, 0, 0, 1, 0, 0, 6),
(488, 1, 293, 53, 0, 0, 0, 0, 0, 1, 7),
(489, 1, 630, 53, 0, 0, 0, 0, 0, 1, 8),
(490, 0, 442, 53, 0, 0, 0, 0, 1, 0, 9),
(491, 1, 410, 53, 0, 0, 0, 1, 0, 0, 10),
(492, 2, 490, 53, 0, 1, 0, 1, 0, 0, 11),
(493, 2, 617, 53, 0, 0, 1, 1, 0, 0, 12),
(494, 1, 135, 53, 0, 0, 0, 1, 0, 0, 13),
(495, 1, 136, 53, 0, 0, 0, 0, 0, 1, 14),
(496, 1, 598, 53, 0, 0, 0, 0, 0, 1, 15),
(497, 0, 280, 53, 0, 0, 0, 0, 1, 0, 16),
(498, 2, 273, 53, 1, 0, 0, 1, 0, 0, 17),
(499, 1, 444, 53, 0, 0, 0, 1, 0, 0, 18),
(500, 1, 510, 53, 0, 0, 0, 1, 0, 0, 19),
(501, 1, 242, 53, 0, 0, 0, 0, 0, 1, 20),
(502, 1, 397, 53, 0, 0, 0, 0, 0, 1, 21),
(503, 0, 360, 53, 0, 0, 0, 0, 1, 0, 22),
(504, 1, 371, 62, 0, 0, 0, 1, 0, 0, 1),
(505, 1, 105, 62, 0, 0, 0, 0, 0, 1, 2),
(506, 0, 616, 62, 0, 0, 0, 0, 1, 0, 3),
(507, 1, 87, 62, 0, 0, 0, 1, 0, 0, 4),
(508, 1, 602, 62, 0, 0, 0, 1, 0, 0, 5),
(509, 1, 501, 62, 0, 0, 0, 1, 0, 0, 6),
(510, 1, 287, 62, 0, 0, 0, 0, 0, 1, 7),
(511, 1, 305, 62, 0, 0, 0, 0, 0, 1, 8),
(512, 0, 455, 62, 0, 0, 0, 0, 1, 0, 9),
(513, 1, 617, 62, 0, 0, 0, 1, 0, 0, 10),
(514, 2, 135, 62, 1, 0, 0, 1, 0, 0, 11),
(515, 1, 506, 62, 0, 0, 0, 1, 0, 0, 12),
(516, 1, 117, 62, 0, 0, 0, 1, 0, 0, 13),
(517, 1, 598, 62, 0, 0, 0, 0, 0, 1, 14),
(518, 1, 393, 62, 0, 0, 0, 0, 0, 1, 15),
(519, 0, 353, 62, 0, 0, 0, 0, 1, 0, 16),
(520, 2, 164, 62, 0, 0, 1, 1, 0, 0, 17),
(521, 2, 444, 62, 0, 1, 0, 1, 0, 0, 18),
(522, 1, 310, 62, 0, 0, 0, 1, 0, 0, 19),
(523, 1, 360, 62, 0, 0, 0, 0, 0, 1, 20),
(524, 1, 43, 62, 0, 0, 0, 0, 0, 1, 21),
(525, 0, 276, 62, 0, 0, 0, 0, 1, 0, 22),
(526, 1, 46, 55, 0, 0, 0, 1, 0, 0, 1),
(527, 1, 350, 55, 0, 0, 0, 1, 0, 0, 2),
(528, 1, 80, 55, 0, 0, 0, 1, 0, 0, 3),
(529, 1, 465, 55, 0, 0, 0, 1, 0, 0, 4),
(530, 1, 135, 55, 0, 0, 0, 1, 0, 0, 5),
(532, 2, 353, 55, 0, 1, 0, 1, 0, 0, 7),
(533, 1, 617, 55, 0, 0, 0, 1, 0, 0, 8),
(534, 1, 483, 55, 0, 0, 0, 1, 0, 0, 9),
(535, 1, 459, 55, 0, 0, 0, 0, 0, 1, 10),
(536, 2, 273, 55, 1, 0, 0, 1, 0, 0, 11),
(538, 2, 397, 55, 0, 0, 0, 0, 0, 1, 17),
(539, 1, 122, 55, 0, 0, 0, 0, 0, 1, 14),
(540, 1, 105, 55, 0, 0, 0, 0, 0, 1, 15),
(541, 1, 184, 55, 0, 0, 0, 0, 0, 1, 16),
(542, 3, 402, 55, 0, 0, 1, 1, 0, 0, 13),
(543, 1, 143, 55, 0, 0, 0, 0, 0, 1, 18),
(544, 1, 186, 55, 0, 0, 0, 0, 0, 1, 19),
(547, 0, 507, 55, 0, 0, 0, 0, 1, 0, 21),
(548, 0, 438, 55, 0, 0, 0, 0, 1, 0, 22),
(549, 0, 462, 55, 0, 0, 0, 0, 1, 0, 23),
(550, 0, 87, 55, 0, 0, 0, 0, 1, 0, 24),
(551, 1, 629, 55, 0, 0, 0, 1, 0, 0, 6),
(552, 1, 350, 61, 0, 0, 0, 1, 0, 0, 3),
(553, 1, 276, 61, 0, 0, 0, 1, 0, 0, 4),
(554, 1, 477, 61, 0, 0, 0, 1, 0, 0, 5),
(555, 3, 105, 61, 0, 0, 0, 0, 0, 1, 7),
(556, 1, 346, 61, 0, 0, 0, 1, 0, 0, 6),
(557, 1, 365, 61, 0, 0, 0, 0, 0, 1, 8),
(558, 0, 136, 61, 0, 0, 0, 0, 1, 0, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerteamweek`
--

DROP TABLE IF EXISTS `playerteamweek`;
CREATE TABLE IF NOT EXISTS `playerteamweek` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `playerteam` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `plays` tinyint(1) default NULL,
  `points` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_PlayerTeamWeek_playerteam_week` (`playerteam`,`week`),
  KEY `FK_PlayerTeamWeek_playerteam` (`playerteam`),
  KEY `FK_PlayerTeamWeek_week` (`week`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `playerteamweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerweek`
--

DROP TABLE IF EXISTS `playerweek`;
CREATE TABLE IF NOT EXISTS `playerweek` (
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
  KEY `FK_PlayerWeek_week` (`week`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `playerweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positionteamweek`
--

DROP TABLE IF EXISTS `positionteamweek`;
CREATE TABLE IF NOT EXISTS `positionteamweek` (
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
  KEY `FK_PositionTeamWeek_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `positionteamweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
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
  KEY `FK_Team_category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Volcar la base de datos para la tabla `team`
--

INSERT INTO `team` (`id`, `version`, `name`, `user`, `category`, `isClosed`, `tactic`) VALUES
(52, 4, 'Ni un Pelo de Tonto', 52, 2, 1, '3-4-3'),
(53, 2, 'HRG F.C.', 53, 1, 1, '3-4-3'),
(54, 2, 'Viejita Stone', 54, 2, 0, '3-5-2'),
(55, 3, 'TRES', 55, 1, 1, '3-5-2'),
(56, 3, '15 de Octubre', 56, 1, 1, '3-5-2'),
(57, 4, 'Red Bull', 57, 1, 1, '3-4-3'),
(58, 4, 'Capussoto F.C.', 58, 1, 1, '3-4-3'),
(59, 4, 'QEE', 59, 2, 1, '4-3-3'),
(60, 5, 'GWT FC', 60, 2, 1, '3-5-2'),
(61, 4, 'Chapita de Cerveza Fóbal Clus', 61, 1, 0, '3-4-3'),
(62, 3, 'Los Super Ratones', 62, 2, 1, '3-4-3'),
(63, 3, 'La Bandita', 63, 1, 1, '3-5-2'),
(64, 4, '[HIPPIE CHIC]', 64, 2, 1, '4-4-2'),
(65, 3, 'A.C. Decano', 65, 2, 1, '3-5-2'),
(66, 4, '[PAPUCHO]', 66, 2, 1, '3-5-2'),
(67, 2, 'Hidrocarburo', 67, 1, 1, '4-4-2'),
(68, 2, 'Gran Cuñado', 68, 1, 1, '3-5-2'),
(69, 3, 'Último Recurso', 69, 1, 1, '3-4-3'),
(70, 3, '[BUSCO DUEÑO]', 70, 2, 1, '3-4-3'),
(71, 5, 'Los Golosos', 71, 2, 1, '3-4-3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Volcar la base de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `version`, `firstname`, `lastname`, `username`, `password`, `email`) VALUES
(1, 3, 'prueba', 'prueba', 'prueba', 'cHJ1ZWJh', 'grandt@waretech.com.ar'),
(52, 2, 'Ricardo', 'Berl', 'Pela', 'cGVsYQ==', 'rickyberl@hotmail.com'),
(53, 4, 'Leandro', 'Soncini', 'Chochi', 'Y2hvY2hp', 'leandrosoncini@hotmail.com'),
(54, 2, 'Francisco', 'Tabellione', 'Tabe', 'anVuaW9y', 'ftabe76@hotmail.com'),
(55, 5, 'Esteban', 'Sabbione', 'Tete', 'MTI5OTg4', 'tetesabbione@hotmail.com'),
(56, 3, 'Tomas', 'Condorelli', 'Tommy', 'Y2FzY294Mg==', 'tonyvelamazan@hotmail.com'),
(57, 4, 'Martin', 'Aristia', 'Martin', 'bWFydGlu', 'm.aristia@gmail.com'),
(58, 2, 'Franco', 'Condorelli', 'Catalano', 'Y2F0YWxhbm8=', 'cachosaccardi@hotmail.com'),
(59, 5, 'Nicolas', 'Condorelli', 'Coco', 'UGluY2hhMDE=', 'ncondorelli@exiros.com'),
(60, 14, 'Augusto', 'Soncini', 'Augusto', 'U29uY2luaQ==', 'augustosoncini@hotmail.com'),
(61, 3, 'Matias', 'Condorelli', 'Pepi', 'UGVwaQ==', 'maticondorelli@gmail.com'),
(62, 9, 'Mauro', 'Pennacchioni', 'Rata', 'MTMxMTc2', 'mpennach@gmail.com'),
(63, 3, 'Emilio', 'Tabellione', 'Emi', 'MTI4MzEz', 'etabe114@hotmail.com'),
(64, 6, 'Andres', 'GarciÃ­a Olivares', 'Negro', 'Z28wNjE5NzY=', 'a_garciaolivares@hotmail.com'),
(65, 5, 'Guillermo', 'Vallina', 'Guillote', 'MTI3Mjkw', 'gdvallina@fibertel.com.ar'),
(66, 5, 'Mauro', 'Di Benni', 'Papucho', 'MTI5OTM0', 'patodb@hotmail.com'),
(67, 2, 'Adriano', 'Mucelli', 'Tano', 'dGFubw==', 'amucelli@kpmg.com.ar'),
(68, 15, 'Fabian', 'Sabbione', 'Cunado', 'NTk4NDcz', 'fabiansabbione@hotmail.com'),
(69, 2, 'Sebastian', 'Fiori', 'Chocho', 'Y2hvY2hv', 'fioriseba@hotmail.com'),
(70, 3, 'Ignacio', 'Soncini', 'Iki', 'Z2F5', 'ikisoncini@hotmail.com'),
(71, 2, 'Gaston', 'Messineo', 'Vivi', 'dml2aQ==', 'gastonmessineo@hotmail.com'),
(72, 2, 'Luciano', 'Mucelli', 'Luchi', 'bHVjaGk=', 'luciano.mucelli@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
CREATE TABLE IF NOT EXISTS `useraccess` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `user` bigint(20) NOT NULL,
  `access` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_UserAccess_user` (`user`),
  KEY `FK_UserAccess_access` (`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

--
-- Volcar la base de datos para la tabla `useraccess`
--

INSERT INTO `useraccess` (`id`, `version`, `user`, `access`) VALUES
(1, 0, 60, 1),
(2, 0, 60, 2),
(3, 0, 60, 3),
(4, 0, 60, 13),
(5, 0, 60, 14),
(34, 0, 62, 1),
(35, 0, 62, 2),
(36, 0, 62, 13),
(40, 0, 59, 1),
(41, 0, 59, 2),
(42, 0, 59, 13),
(93, 0, 60, 15),
(94, 0, 60, 16),
(95, 0, 60, 17),
(96, 0, 59, 15),
(97, 0, 59, 16),
(98, 0, 62, 15),
(99, 0, 62, 16),
(100, 0, 55, 1),
(101, 0, 55, 2),
(102, 0, 60, 18),
(103, 0, 69, 1),
(104, 0, 69, 2),
(105, 0, 53, 1),
(106, 0, 53, 2),
(107, 0, 59, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `week`
--

DROP TABLE IF EXISTS `week`;
CREATE TABLE IF NOT EXISTS `week` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Week_number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Volcar la base de datos para la tabla `week`
--

INSERT INTO `week` (`id`, `version`, `number`) VALUES
(139, 0, 1),
(140, 0, 2),
(141, 0, 3),
(142, 0, 4),
(143, 0, 5),
(144, 0, 6),
(145, 0, 7),
(146, 0, 8),
(147, 0, 9),
(148, 0, 10),
(149, 0, 11),
(150, 0, 12),
(151, 0, 13),
(152, 0, 14),
(153, 0, 15);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `match_`
--
ALTER TABLE `match_`
  ADD CONSTRAINT `FK_Match_awayClub` FOREIGN KEY (`awayClub`) REFERENCES `club` (`id`),
  ADD CONSTRAINT `FK_Match_homeClub` FOREIGN KEY (`homeClub`) REFERENCES `club` (`id`),
  ADD CONSTRAINT `FK_Match_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`);

--
-- Filtros para la tabla `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FK_Player_club` FOREIGN KEY (`club`) REFERENCES `club` (`id`),
  ADD CONSTRAINT `FK_Player_position` FOREIGN KEY (`position`) REFERENCES `playerposition` (`id`);

--
-- Filtros para la tabla `playermatch`
--
ALTER TABLE `playermatch`
  ADD CONSTRAINT `FK_PlayerMatch_match` FOREIGN KEY (`match_`) REFERENCES `match_` (`id`),
  ADD CONSTRAINT `FK_PlayerMatch_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`);

--
-- Filtros para la tabla `playerteam`
--
ALTER TABLE `playerteam`
  ADD CONSTRAINT `FK_PlayerTeam_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `FK_PlayerTeam_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`);

--
-- Filtros para la tabla `playerteamweek`
--
ALTER TABLE `playerteamweek`
  ADD CONSTRAINT `FK_PlayerTeamWeek_playerteam` FOREIGN KEY (`playerteam`) REFERENCES `playerteam` (`id`),
  ADD CONSTRAINT `FK_PlayerTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`);

--
-- Filtros para la tabla `playerweek`
--
ALTER TABLE `playerweek`
  ADD CONSTRAINT `FK_PlayerWeek_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `FK_PlayerWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`);

--
-- Filtros para la tabla `positionteamweek`
--
ALTER TABLE `positionteamweek`
  ADD CONSTRAINT `FK_PositionTeamWeek_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_PositionTeamWeek_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `FK_PositionTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`);

--
-- Filtros para la tabla `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `FK_Team_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_Team_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `useraccess`
--
ALTER TABLE `useraccess`
  ADD CONSTRAINT `FK_UserAccess_access` FOREIGN KEY (`access`) REFERENCES `access` (`id`),
  ADD CONSTRAINT `FK_UserAccess_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

SET FOREIGN_KEY_CHECKS=1;
