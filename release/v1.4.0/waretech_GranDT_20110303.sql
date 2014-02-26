-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-03-2011 a las 15:52:35
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
-- Creación: 03-03-2011 a las 15:28:41
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
-- Creación: 03-03-2011 a las 15:28:42
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
-- Creación: 03-03-2011 a las 15:28:42
-- Última actualización: 03-03-2011 a las 15:51:43
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `claim`
--

INSERT INTO `claim` (`id`, `version`, `title`, `description`, `target`, `priority`, `user`, `date`, `state`) VALUES
(1, 0, 'Bombeo contra Los Golosos', 'Evidentemente, haber salido de la Orga fue un error para JJ Munoz..\r\nNo solo ignoran sus e-mails sino que tambien le prohiben hacer los cambios q le corresponden a su humilde equipo Los Golosos. \r\n\r\nEspero q reflexionen y se den cuenta q no pueden dejar d', 0, 1, 71, '2010-03-25', 0),
(2, 0, 'Mejoras varias', 'Poner el nombre del DT siempre a continuaciÃ³n del nombre del equuipo\r\nPoner estrllas o trofeos a los equipos ganadores de torneo y copas\r\n', 1, 2, 53, '2010-03-27', 0),
(3, 0, 'Mejoras varias II', 'Falta historial del Torneo "Fernet Branca" \r\nNo es claro el diseÃ±o para poder seguir el puntaje de los jugadores, esta muy lejos del nombre y la linea para seguir es difusa', 1, 2, 53, '2010-03-27', 0),
(5, 0, 'A corregir', ' Creo que no esta bien que los demas DT que todavia no entregaron sus equipos puedan ver los planteles de los diferentes equipos antes de que comienze el torneo.', 0, 2, 54, '2010-09-03', 0),
(6, 0, 'Castillo errÃ³ el penal', 'Jairo Castillo errÃ³ el penal y luego metiÃ³ el rebote. Se le deben computar las dos cosas, y creo q no estÃ¡ asÃ­ pq suma 17pts.', 0, 3, 65, '2010-09-27', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--
-- Creación: 03-03-2011 a las 15:28:42
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
(4, 0, 'Banfield'),
(5, 0, 'Boca Jrs.'),
(6, 0, 'Colon (Santa Fé)'),
(7, 0, 'Estudiantes (La Plata)'),
(8, 0, 'Gimnasia (La PLata)'),
(9, 0, 'Godoy Cruz (Mendoza)'),
(10, 0, 'Huracán'),
(11, 0, 'Independiente'),
(12, 0, 'Lanús'),
(13, 0, 'Newell´s Old Boys\r\n'),
(14, 0, 'Olimpo (Bahía Blanca)'),
(15, 0, 'Quilmes'),
(16, 0, 'Racing Club'),
(17, 0, 'River Plate'),
(18, 0, 'San Lorenzo'),
(19, 0, 'Tigre'),
(20, 0, 'Velez Sarsfield');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--
-- Creación: 03-03-2011 a las 15:28:42
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
(1, 1, 'started', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `match_`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=382 ;

--
-- RELACIONES PARA LA TABLA `match_`:
--   `awayClub`
--       `club` -> `id`
--   `homeClub`
--       `club` -> `id`
--   `week`
--       `week` -> `id`
--

--
-- Volcar la base de datos para la tabla `match_`
--

INSERT INTO `match_` (`id`, `version`, `week`, `homeClub`, `awayClub`, `homeGoals`, `awayGoals`, `date`, `time`) VALUES
(232, 2, 26, 7, 9, NULL, NULL, '2010-09-05', NULL),
(233, 2, 26, 6, 16, NULL, NULL, '2010-09-05', NULL),
(234, 2, 26, 14, 1, NULL, NULL, '2010-09-05', NULL),
(235, 3, 26, 18, 5, NULL, NULL, '2010-09-05', NULL),
(236, 2, 26, 17, 20, NULL, NULL, '2010-09-05', NULL),
(237, 2, 26, 2, 3, NULL, NULL, '2010-09-05', NULL),
(238, 2, 26, 11, 13, NULL, NULL, '2010-09-05', NULL),
(239, 2, 26, 10, 15, NULL, NULL, '2010-09-05', NULL),
(240, 2, 26, 19, 4, NULL, NULL, '2010-09-05', NULL),
(241, 2, 26, 12, 8, NULL, NULL, '2010-09-05', NULL),
(242, 2, 27, 4, 10, NULL, NULL, '2010-09-12', NULL),
(243, 2, 27, 15, 11, NULL, NULL, '2010-09-12', NULL),
(244, 2, 27, 13, 2, NULL, NULL, '2010-09-12', NULL),
(245, 2, 27, 3, 17, NULL, NULL, '2010-09-12', NULL),
(246, 2, 27, 20, 18, NULL, NULL, '2010-09-12', NULL),
(247, 2, 27, 5, 14, NULL, NULL, '2010-09-12', NULL),
(248, 2, 27, 1, 6, NULL, NULL, '2010-09-12', NULL),
(249, 2, 27, 16, 7, NULL, NULL, '2010-09-12', NULL),
(250, 2, 27, 9, 12, NULL, NULL, '2010-09-12', NULL),
(251, 2, 27, 8, 19, NULL, NULL, '2010-09-12', NULL),
(252, 2, 28, 19, 9, NULL, NULL, '2010-09-19', NULL),
(253, 2, 28, 12, 16, NULL, NULL, '2010-09-19', NULL),
(254, 2, 28, 7, 1, NULL, NULL, '2010-09-19', NULL),
(255, 2, 28, 6, 5, NULL, NULL, '2010-09-19', NULL),
(256, 2, 28, 14, 18, NULL, NULL, '2010-09-19', NULL),
(257, 2, 28, 20, 3, NULL, NULL, '2010-09-19', NULL),
(258, 2, 28, 17, 13, NULL, NULL, '2010-09-19', NULL),
(259, 2, 28, 2, 15, NULL, NULL, '2010-09-19', NULL),
(260, 2, 28, 11, 4, NULL, NULL, '2010-09-19', NULL),
(261, 2, 28, 10, 8, NULL, NULL, '2010-09-19', NULL),
(262, 2, 29, 9, 10, NULL, NULL, '2010-09-26', NULL),
(263, 2, 29, 8, 11, NULL, NULL, '2010-09-26', NULL),
(264, 3, 29, 4, 2, NULL, NULL, '2010-09-26', NULL),
(265, 2, 29, 15, 17, NULL, NULL, '2010-09-26', NULL),
(266, 2, 29, 14, 20, NULL, NULL, '2010-09-26', NULL),
(267, 2, 29, 13, 3, NULL, NULL, '2010-09-26', NULL),
(268, 2, 29, 18, 6, NULL, NULL, '2010-09-26', NULL),
(269, 2, 29, 5, 7, NULL, NULL, '2010-09-26', NULL),
(270, 2, 29, 1, 12, NULL, NULL, '2010-09-26', NULL),
(271, 2, 29, 16, 19, NULL, NULL, '2010-09-26', NULL),
(272, 2, 30, 11, 9, NULL, NULL, '2010-10-03', NULL),
(273, 2, 30, 10, 16, NULL, NULL, '2010-10-03', NULL),
(274, 2, 30, 19, 1, NULL, NULL, '2010-10-03', NULL),
(275, 2, 30, 12, 5, NULL, NULL, '2010-10-03', NULL),
(276, 3, 30, 7, 18, NULL, NULL, '2010-10-03', NULL),
(277, 2, 30, 6, 14, NULL, NULL, '2010-10-03', NULL),
(278, 2, 30, 20, 13, NULL, NULL, '2010-10-03', NULL),
(279, 2, 30, 3, 15, NULL, NULL, '2010-10-03', NULL),
(280, 3, 30, 17, 4, NULL, NULL, '2010-10-03', NULL),
(281, 2, 30, 2, 8, NULL, NULL, '2010-10-03', NULL),
(282, 4, 31, 1, 10, NULL, NULL, '2010-10-10', NULL),
(283, 2, 31, 16, 11, NULL, NULL, '2010-10-10', NULL),
(284, 3, 31, 9, 2, NULL, NULL, '2010-10-10', NULL),
(285, 2, 31, 8, 17, NULL, NULL, '2010-10-10', NULL),
(286, 2, 31, 6, 20, NULL, NULL, '2010-10-10', NULL),
(287, 3, 31, 4, 3, NULL, NULL, '2010-10-10', NULL),
(288, 3, 31, 15, 13, NULL, NULL, '2010-10-10', NULL),
(289, 3, 31, 14, 7, NULL, NULL, '2010-10-10', NULL),
(290, 4, 31, 18, 12, NULL, NULL, '2010-10-10', NULL),
(291, 2, 31, 5, 19, NULL, NULL, '2010-10-10', NULL),
(292, 2, 32, 17, 9, NULL, NULL, '2010-10-17', NULL),
(293, 2, 32, 2, 16, NULL, NULL, '2010-10-17', NULL),
(294, 1, 32, 11, 1, NULL, NULL, '2010-10-17', NULL),
(295, 2, 32, 10, 5, NULL, NULL, '2010-10-17', NULL),
(296, 2, 32, 19, 18, NULL, NULL, '2010-10-17', NULL),
(297, 2, 32, 12, 14, NULL, NULL, '2010-10-17', NULL),
(298, 2, 32, 7, 6, NULL, NULL, '2010-10-17', NULL),
(299, 2, 32, 20, 15, NULL, NULL, '2010-10-17', NULL),
(300, 2, 32, 13, 4, NULL, NULL, '2010-10-17', NULL),
(301, 2, 32, 3, 8, NULL, NULL, '2010-10-17', NULL),
(302, 2, 33, 18, 10, NULL, NULL, '2010-10-24', NULL),
(303, 3, 33, 5, 11, NULL, NULL, '2010-10-24', NULL),
(304, 2, 33, 1, 2, NULL, NULL, '2010-10-24', NULL),
(305, 2, 33, 16, 17, NULL, NULL, '2010-10-24', NULL),
(306, 2, 33, 7, 20, NULL, NULL, '2010-10-24', NULL),
(307, 2, 33, 9, 3, NULL, NULL, '2010-10-24', NULL),
(308, 2, 33, 8, 13, NULL, NULL, '2010-10-24', NULL),
(309, 2, 33, 4, 15, NULL, NULL, '2010-10-24', NULL),
(310, 2, 33, 6, 12, NULL, NULL, '2010-10-24', NULL),
(311, 2, 33, 14, 19, NULL, NULL, '2010-10-24', NULL),
(312, 2, 34, 13, 9, NULL, NULL, '2010-10-31', NULL),
(313, 2, 34, 3, 16, NULL, NULL, '2010-10-31', NULL),
(314, 2, 34, 17, 1, NULL, NULL, '2010-10-31', NULL),
(315, 2, 34, 2, 5, NULL, NULL, '2010-10-31', NULL),
(316, 1, 34, 11, 18, NULL, NULL, '2010-10-31', NULL),
(317, 2, 34, 10, 14, NULL, NULL, '2010-10-31', NULL),
(318, 2, 34, 19, 6, NULL, NULL, '2010-10-31', NULL),
(319, 2, 34, 12, 7, NULL, NULL, '2010-10-31', NULL),
(320, 2, 34, 20, 4, NULL, NULL, '2010-10-31', NULL),
(321, 2, 34, 15, 8, NULL, NULL, '2010-10-31', NULL),
(322, 2, 35, 6, 10, NULL, NULL, '2010-11-07', NULL),
(323, 2, 35, 14, 11, NULL, NULL, '2010-11-07', NULL),
(324, 2, 35, 18, 2, NULL, NULL, '2010-11-07', NULL),
(325, 4, 35, 5, 17, NULL, NULL, '2010-11-07', NULL),
(326, 2, 35, 12, 20, NULL, NULL, '2010-11-07', NULL),
(327, 2, 35, 1, 3, NULL, NULL, '2010-11-07', NULL),
(328, 2, 35, 16, 13, NULL, NULL, '2010-11-07', NULL),
(329, 2, 35, 9, 15, NULL, NULL, '2010-11-07', NULL),
(330, 3, 35, 8, 4, NULL, NULL, '2010-11-07', NULL),
(331, 2, 35, 7, 19, NULL, NULL, '2010-11-07', NULL),
(332, 2, 36, 4, 9, NULL, NULL, '2010-11-14', NULL),
(333, 2, 36, 15, 16, NULL, NULL, '2010-11-14', NULL),
(334, 2, 36, 13, 1, NULL, NULL, '2010-11-14', NULL),
(335, 2, 36, 3, 5, NULL, NULL, '2010-11-14', NULL),
(336, 2, 36, 17, 18, NULL, NULL, '2010-11-14', NULL),
(337, 2, 36, 2, 14, NULL, NULL, '2010-11-14', NULL),
(338, 2, 36, 11, 6, NULL, NULL, '2010-11-14', NULL),
(339, 2, 36, 10, 7, NULL, NULL, '2010-11-14', NULL),
(340, 3, 36, 19, 12, NULL, NULL, '2010-11-14', NULL),
(341, 2, 36, 20, 8, NULL, NULL, '2010-11-14', NULL),
(342, 2, 37, 12, 10, NULL, NULL, '2010-11-21', NULL),
(343, 2, 37, 7, 11, NULL, NULL, '2010-11-21', NULL),
(344, 2, 37, 6, 2, NULL, NULL, '2010-11-21', NULL),
(345, 2, 37, 14, 17, NULL, NULL, '2010-11-21', NULL),
(346, 2, 37, 19, 20, NULL, NULL, '2010-11-21', NULL),
(347, 2, 37, 18, 3, NULL, NULL, '2010-11-21', NULL),
(348, 2, 37, 5, 13, NULL, NULL, '2010-11-21', NULL),
(349, 2, 37, 1, 15, NULL, NULL, '2010-11-21', NULL),
(350, 2, 37, 16, 4, NULL, NULL, '2010-11-21', NULL),
(351, 3, 37, 9, 8, NULL, NULL, '2010-11-21', NULL),
(352, 2, 38, 20, 9, NULL, NULL, '2010-11-28', NULL),
(353, 2, 38, 8, 16, NULL, NULL, '2010-11-28', NULL),
(354, 2, 38, 4, 1, NULL, NULL, '2010-11-28', NULL),
(355, 2, 38, 15, 5, NULL, NULL, '2010-11-28', NULL),
(356, 2, 38, 13, 18, NULL, NULL, '2010-11-28', NULL),
(357, 2, 38, 3, 14, NULL, NULL, '2010-11-28', NULL),
(358, 2, 38, 17, 6, NULL, NULL, '2010-11-28', NULL),
(359, 2, 38, 2, 7, NULL, NULL, '2010-11-28', NULL),
(360, 2, 38, 11, 12, NULL, NULL, '2010-11-28', NULL),
(361, 1, 38, 10, 19, NULL, NULL, '2010-11-28', NULL),
(362, 2, 39, 16, 9, NULL, NULL, '2010-12-05', NULL),
(363, 0, 39, 19, 11, NULL, NULL, '2010-12-05', NULL),
(364, 3, 39, 12, 2, NULL, NULL, '2010-12-05', NULL),
(365, 2, 39, 7, 17, NULL, NULL, '2010-12-05', NULL),
(366, 2, 39, 10, 20, NULL, NULL, '2010-12-05', NULL),
(367, 2, 39, 6, 3, NULL, NULL, '2010-12-05', NULL),
(368, 2, 39, 14, 13, NULL, NULL, '2010-12-05', NULL),
(369, 2, 39, 18, 15, NULL, NULL, '2010-12-05', NULL),
(370, 2, 39, 5, 4, NULL, NULL, '2010-12-05', NULL),
(371, 2, 39, 1, 8, NULL, NULL, '2010-12-05', NULL),
(372, 2, 40, 11, 10, NULL, NULL, '2010-12-12', NULL),
(373, 2, 40, 20, 16, NULL, NULL, '2010-12-12', NULL),
(374, 2, 40, 9, 1, NULL, NULL, '2010-12-12', NULL),
(375, 2, 40, 8, 5, NULL, NULL, '2010-12-12', NULL),
(376, 2, 40, 4, 18, NULL, NULL, '2010-12-12', NULL),
(377, 2, 40, 15, 14, NULL, NULL, '2010-12-12', NULL),
(378, 2, 40, 13, 6, NULL, NULL, '2010-12-12', NULL),
(379, 2, 40, 3, 7, NULL, NULL, '2010-12-12', NULL),
(380, 2, 40, 17, 12, NULL, NULL, '2010-12-12', NULL),
(381, 2, 40, 2, 19, NULL, NULL, '2010-12-12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4540 ;

--
-- RELACIONES PARA LA TABLA `player`:
--   `club`
--       `club` -> `id`
--   `position`
--       `playerposition` -> `id`
--

--
-- Volcar la base de datos para la tabla `player`
--

INSERT INTO `player` (`id`, `version`, `firstname`, `lastname`, `number`, `club`, `position`, `value`, `selected`) VALUES
(1, 0, 'Matías', 'Abelairas', NULL, 17, 3, '1', 0),
(2, 0, 'Walter', 'Acevedo', NULL, 17, 3, '2', 0),
(3, 0, 'Gonzalo', 'Acevedo', NULL, 18, 1, '1', 0),
(4, 0, 'Jorge', 'Achucarro', NULL, 4, 4, '2', 0),
(5, 0, 'David', 'Achucarro', NULL, 5, 2, '1', 0),
(6, 0, 'Joel', 'Acosta', NULL, 5, 4, '1', 0),
(7, 0, 'Lucas', 'Acosta', NULL, 6, 3, '1', 0),
(8, 0, 'Facundo', 'Affranchino', NULL, 17, 3, '1', 0),
(9, 0, 'Ariel', 'Agüero', NULL, 8, 2, '1', 0),
(10, 0, 'Alan', 'Aguerre', NULL, 20, 1, '1', 0),
(11, 0, 'PabloCésar', 'Aguilar', NULL, 3, 2, '1', 0),
(12, 0, 'Emanuel', 'Aguilera', NULL, 9, 2, '1', 0),
(13, 0, 'Marcos', 'Aguirre', NULL, 3, 3, '2', 0),
(14, 0, 'Nicolás', 'Aguirre', NULL, 10, 2, '1', 0),
(15, 0, 'Martín', 'Aguirre', NULL, 14, 3, '1', 0),
(16, 0, 'Gastón', 'Aguirre', NULL, 18, 2, '1', 0),
(17, 0, 'Damián', 'Albil', NULL, 18, 1, '1', 0),
(18, 0, 'Matías', 'Almeyda', NULL, 17, 3, '2', 0),
(19, 0, 'Sergio', 'Almirón', NULL, 13, 4, '1', 0),
(20, 0, 'Leonel', 'Altobelli', NULL, 19, 4, '1', 0),
(21, 0, 'Matías', 'Alustiza', NULL, 3, 4, '2', 0),
(22, 0, 'Pablo', 'Alvarado', NULL, 18, 3, '1', 0),
(23, 0, 'Cristian', 'Alvarez', NULL, 3, 3, '1', 0),
(24, 0, 'Ricardo', 'Alvarez', NULL, 20, 3, '1', 0),
(25, 0, 'Esteban', 'Andrada', NULL, 12, 1, '1', 0),
(26, 0, 'David', 'Angeloff', NULL, 10, 2, '1', 0),
(27, 0, 'Horacio', 'Anzorena', NULL, 19, 3, '1', 0),
(28, 0, 'Carlos', 'Arano', NULL, 17, 2, '1', 0),
(29, 0, 'Sergio', 'Araujo', NULL, 5, 4, '1', 0),
(30, 0, 'Carlos', 'Araujo', NULL, 12, 2, '1', 0),
(31, 0, 'Carlos', 'Arce', NULL, 12, 2, '1', 0),
(32, 0, 'Luis', 'Ardente', NULL, 19, 1, '1', 0),
(33, 0, 'Mauricio', 'Arias', NULL, 6, 2, '1', 0),
(34, 0, 'Gabriel', 'Arias', NULL, 14, 1, '1', 0),
(35, 0, 'Fabián', 'Assmann', NULL, 11, 1, '1', 0),
(36, 0, 'Luciano', 'Aued', NULL, 8, 3, '2', 0),
(37, 0, 'Carlos', 'Auzqui', NULL, 7, 4, '1', 0),
(38, 0, 'Diego', 'Auzqui', NULL, 7, 3, '1', 0),
(39, 0, 'Lucas', 'Aveldaño', NULL, 16, 2, '2', 0),
(40, 0, 'Cristian', 'Báez', NULL, 11, 2, '1', 0),
(41, 0, 'Andrés', 'Bailo', NULL, 6, 1, '1', 0),
(42, 0, 'Luciano', 'Balbi', NULL, 12, 2, '1', 0),
(43, 0, 'Josepmir', 'Ballón', NULL, 17, 3, '1', 0),
(44, 0, 'Alejandro', 'Bárbaro', NULL, 4, 3, '1', 0),
(45, 0, 'Ignacio', 'Barcia', NULL, 11, 2, '1', 0),
(46, 0, 'Néstor', 'Bareiro', NULL, 14, 4, '1', 0),
(47, 0, 'Marcelo', 'Barovero', NULL, 20, 1, '2', 0),
(48, 0, 'Julio', 'Barraza', NULL, 4, 2, '1', 0),
(49, 0, 'Leandro', 'Barrera', NULL, 2, 4, '1', 0),
(50, 0, 'Hugo', 'Barrientos', NULL, 1, 3, '1', 0),
(51, 0, 'Pablo', 'Barrientos', NULL, 7, 3, '2', 0),
(52, 0, 'Fernando', 'Barrientos', NULL, 12, 3, '1', 0),
(53, 0, 'Guillermo', 'BarrosSchelotto', NULL, 8, 4, '2', 0),
(54, 0, 'Gustavo', 'Bartelt', NULL, 1, 4, '1', 0),
(55, 0, 'Germán', 'Basualdo', NULL, 2, 3, '1', 0),
(56, 0, 'Matías', 'Batista', NULL, 1, 2, '1', 0),
(57, 0, 'Sebastián', 'Battaglia', NULL, 5, 3, '2', 0),
(58, 0, 'Rodrigo', 'Battaglia', NULL, 10, 3, '1', 0),
(59, 0, 'Roberto', 'Battión', NULL, 11, 3, '2', 0),
(60, 0, 'Nicolás', 'Bauchet', NULL, 4, 4, '1', 0),
(61, 0, 'Iván', 'Bella', NULL, 20, 3, '1', 0),
(62, 0, 'Mauro', 'Bellone', NULL, 6, 3, '1', 0),
(63, 0, 'LeandroDamián', 'Benítez', NULL, 7, 3, '2', 0),
(64, 0, 'Nelson', 'Benítez', NULL, 7, 2, '1', 0),
(65, 0, 'Oliver', 'Benítez', NULL, 8, 2, '1', 0),
(66, 0, 'Oscar', 'Benítez', NULL, 12, 3, '1', 0),
(67, 0, 'Nahuel', 'Benítez', NULL, 18, 4, '1', 0),
(68, 0, 'Nicolás', 'Berardo', NULL, 2, 2, '1', 0),
(69, 0, 'Lucas', 'Bernardi', NULL, 13, 3, '2', 0),
(70, 0, 'Nicolás', 'BianchiArce', NULL, 14, 2, '1', 0),
(71, 0, 'Claudio', 'Bieler', NULL, 13, 4, '2', 0),
(72, 0, 'MarianoEzequiel', 'Bittolo', NULL, 20, 2, '1', 0),
(73, 0, 'Gustavo', 'Blanco', NULL, 3, 4, '1', 0),
(74, 0, 'Jonathan', 'Blanco', NULL, 19, 3, '1', 0),
(75, 0, 'Nicolás', 'Blandi', NULL, 2, 4, '1', 0),
(76, 0, 'JuanCarlos', 'Blengio', NULL, 19, 2, '1', 0),
(77, 0, 'Mauro', 'Bogado', NULL, 2, 3, '1', 0),
(78, 0, 'Ignacio', 'Bogino', NULL, 3, 2, '1', 0),
(79, 0, 'Enrique', 'Bologna', NULL, 4, 1, '2', 0),
(80, 0, 'Yair', 'Bonnín', NULL, 8, 1, '1', 0),
(81, 0, 'Luciano', 'Bonomo', NULL, 7, 2, '1', 0),
(82, 0, 'Fabián', 'Bordagaray', NULL, 17, 4, '1', 0),
(83, 0, 'Rubén', 'Botta', NULL, 19, 3, '1', 0),
(84, 0, 'Julián', 'Bottaro', NULL, 10, 4, '1', 0),
(85, 0, 'Jonathan', 'Bottinelli', NULL, 18, 2, '2', 0),
(86, 0, 'Gustavo', 'Bou', NULL, 17, 4, '1', 0),
(87, 0, 'Rodrigo', 'Braña', NULL, 7, 3, '3', 0),
(88, 0, 'Mariano', 'Brau', NULL, 1, 2, '1', 0),
(89, 0, 'Marcos', 'BrítezOjeda', NULL, 10, 3, '1', 0),
(90, 0, 'Ariel', 'Broggi', NULL, 15, 2, '1', 0),
(91, 0, 'Roberto', 'Brum', NULL, 14, 3, '1', 0),
(92, 0, 'Diego', 'Buonanotte', NULL, 17, 3, '2', 0),
(93, 0, 'Javier', 'Burrai', NULL, 3, 1, '1', 0),
(94, 0, 'Walter', 'Busse', NULL, 11, 3, '1', 0),
(95, 0, 'Marcelo', 'Bustamante', NULL, 4, 2, '1', 0),
(96, 0, 'Maximiliano', 'Bustos', NULL, 4, 3, '1', 0),
(97, 0, 'Nicolás', 'Cabrera', NULL, 11, 3, '2', 0),
(98, 0, 'Samuel', 'Cáceres', NULL, 11, 2, '1', 0),
(99, 0, 'Marcos', 'Cáceres', NULL, 16, 2, '2', 0),
(100, 0, 'Pablo', 'Cáceres', NULL, 19, 2, '1', 0),
(101, 0, 'JuanPablo', 'Caffa', NULL, 3, 3, '2', 0),
(102, 0, 'Leonel', 'Cafferatti', NULL, 16, 1, '1', 0),
(103, 0, 'Matías', 'Cahais', NULL, 16, 2, '2', 0),
(104, 0, 'Maximiliano', 'Caire', NULL, 6, 2, '1', 0),
(105, 0, 'Lucas', 'Calviño', NULL, 10, 1, '1', 0),
(106, 0, 'JoséMaría', 'Calvo', NULL, 5, 2, '1', 0),
(107, 0, 'Néstor', 'Camacho', NULL, 13, 3, '1', 0),
(108, 0, 'Alejandro', 'Camargo', NULL, 9, 3, '1', 0),
(109, 0, 'Nicolás', 'Cambiasso', NULL, 1, 1, '2', 0),
(110, 0, 'Mauro', 'Camoranesi', NULL, 12, 3, '2', 0),
(111, 0, 'Cristian', 'Campestrini', NULL, 3, 1, '2', 0),
(112, 0, 'Javier', 'Cámpora', NULL, 10, 4, '2', 0),
(113, 0, 'Salustiano', 'Candia', NULL, 6, 2, '1', 0),
(114, 0, 'Miguel', 'Caneo', NULL, 15, 3, '1', 0),
(115, 0, 'Germán', 'Cano', NULL, 6, 4, '1', 0),
(116, 0, 'Héctor', 'Canteros', NULL, 20, 3, '1', 0),
(117, 0, 'Alejandro', 'Capurro', NULL, 8, 3, '1', 0),
(118, 0, 'Mauricio', 'Caranta', NULL, 12, 1, '2', 0),
(119, 0, 'Giancarlo', 'Carmona', NULL, 18, 2, '1', 0),
(120, 0, 'César', 'Carranza', NULL, 12, 4, '1', 0),
(121, 0, 'Javier', 'Carrasco', NULL, 12, 3, '1', 0),
(122, 0, 'Mauricio', 'Carrasco', NULL, 15, 4, '1', 0),
(123, 0, 'JuanIgnacio', 'Carrera', NULL, 2, 1, '1', 0),
(124, 0, 'Guido', 'Carrillo', NULL, 7, 4, '1', 0),
(125, 0, 'JuanPablo', 'Carrizo', NULL, 17, 1, '3', 0),
(126, 0, 'Marcelo', 'Carrusca', NULL, 4, 3, '2', 0),
(127, 0, 'Leandro', 'Caruso', NULL, 17, 4, '1', 0),
(128, 0, 'Matías', 'Caruzzo', NULL, 5, 2, '2', 0),
(129, 0, 'Eduardo', 'Casais', NULL, 14, 2, '1', 0),
(130, 0, 'Milton', 'Casco', NULL, 8, 2, '1', 0),
(131, 0, 'Diego', 'Castaño', NULL, 19, 3, '2', 0),
(132, 0, 'Carlos', 'Casteglione', NULL, 1, 2, '1', 0),
(133, 0, 'Gonzalo', 'Castillejos', NULL, 12, 4, '2', 0),
(134, 0, 'Jairo', 'Castillo', NULL, 11, 4, '1', 0),
(135, 0, 'Federico', 'Castillón', NULL, 14, 4, '1', 0),
(136, 0, 'Lucas', 'Castro', NULL, 8, 3, '1', 0),
(137, 0, 'Martín', 'Cauteruccio', NULL, 15, 4, '1', 0),
(138, 0, 'Lucas', 'Ceballos', NULL, 9, 2, '1', 0),
(139, 0, 'Lucas', 'Ceballos', NULL, 18, 4, '1', 0),
(140, 0, 'Christian', 'Cellay', NULL, 5, 2, '2', 0),
(141, 0, 'Christian', 'Cepeda', NULL, 3, 2, '1', 0),
(142, 0, 'Francisco', 'Cerro', NULL, 15, 3, '1', 0),
(143, 0, 'Lucas', 'Chaparro', NULL, 18, 2, '1', 0),
(144, 0, 'Cristian', 'Chávez', NULL, 5, 3, '2', 0),
(145, 0, 'Leandro', 'Chichizola', NULL, 17, 1, '2', 0),
(146, 0, 'Gonzalo', 'ChoyGonzález', NULL, 3, 3, '1', 0),
(147, 0, 'Gabriel', 'Cichero', NULL, 13, 2, '1', 0),
(148, 0, 'Ezequiel', 'Cirigliano', NULL, 17, 3, '1', 0),
(149, 0, 'JuanManuel', 'Cobelli', NULL, 13, 4, '1', 0),
(150, 0, 'JuanManuel', 'Cobo', NULL, 14, 3, '1', 0),
(151, 0, 'Nicolás', 'Colazo', NULL, 5, 3, '1', 0),
(152, 0, 'Gabriel', 'Colombatti', NULL, 16, 2, '1', 0),
(153, 0, 'Ignacio', 'Colombini', NULL, 16, 4, '1', 0),
(154, 0, 'Martín', 'Comachi', NULL, 6, 4, '1', 0),
(155, 0, 'Jorge', 'Córdoba', NULL, 8, 4, '1', 0),
(156, 0, 'Leandro', 'Coronel', NULL, 15, 3, '1', 0),
(157, 0, 'Maximiliano', 'Coronel', NULL, 17, 2, '1', 0),
(158, 0, 'JorgeIván', 'Correa', NULL, 20, 4, '1', 0),
(159, 0, 'Claudio', 'Corvalán', NULL, 15, 2, '1', 0),
(160, 0, 'Fabián', 'Cubero', NULL, 20, 3, '2', 0),
(161, 0, 'Kevin', 'Cura', NULL, 10, 2, '1', 0),
(162, 0, 'Jorge', 'Curbelo', NULL, 9, 2, '1', 0),
(163, 0, 'Agustín', 'Curima', NULL, 8, 4, '1', 0),
(164, 0, 'Facundo', 'Curuchet', NULL, 6, 4, '1', 0),
(165, 0, 'Israel', 'Damonte', NULL, 9, 3, '1', 0),
(166, 0, 'Esteban', 'Daneri', NULL, 10, 1, '1', 0),
(167, 0, 'Sebastián', 'D''Angelo', NULL, 5, 1, '1', 0),
(168, 0, 'Jorge', 'DeOlivera', NULL, 16, 1, '2', 0),
(169, 0, 'Diego', 'DeSouza', NULL, 4, 3, '1', 0),
(170, 0, 'Matías', 'Defederico', NULL, 11, 4, '2', 0),
(171, 0, 'Alejandro', 'Delfino', NULL, 4, 2, '1', 0),
(172, 0, 'Nicolás', 'Delmonte', NULL, 11, 4, '1', 0),
(173, 0, 'Leandro', 'Desábato', NULL, 7, 2, '2', 0),
(174, 0, 'LeandroLuis', 'Desábato', NULL, 20, 3, '1', 0),
(175, 0, 'José', 'Devaca', NULL, 4, 2, '1', 0),
(176, 0, 'Lucas', 'DiGrazia', NULL, 1, 1, '1', 0),
(177, 0, 'Matías', 'DiGregorio', NULL, 15, 2, '1', 0),
(178, 0, 'Damián', 'Díaz', NULL, 6, 3, '2', 0),
(179, 0, 'Marcos', 'Díaz', NULL, 6, 1, '1', 0),
(180, 0, 'Leandro', 'Díaz', NULL, 12, 4, '1', 0),
(181, 0, 'Cristian', 'Díaz', NULL, 13, 3, '1', 0),
(182, 0, 'Gabriel', 'Díaz', NULL, 14, 2, '1', 0),
(183, 0, 'JuanManuel', 'Díaz', NULL, 17, 2, '2', 0),
(184, 0, 'Mauro', 'Díaz', NULL, 17, 3, '1', 0),
(185, 0, 'Gastón', 'Díaz', NULL, 19, 3, '1', 0),
(186, 0, 'Gastón', 'Díaz', NULL, 20, 2, '1', 0),
(187, 0, 'Mauro', 'Dobler', NULL, 16, 1, '1', 0),
(188, 0, 'Pablo', 'Dolci', NULL, 13, 3, '1', 0),
(189, 0, 'Eduardo', 'Domínguez', NULL, 1, 2, '2', 0),
(190, 0, 'Federico', 'Domínguez', NULL, 14, 2, '1', 0),
(191, 0, 'Sebastián', 'Domínguez', NULL, 20, 2, '2', 0),
(192, 0, 'Mariano', 'Donda', NULL, 9, 3, '1', 0),
(193, 0, 'Mauro', 'DosSantos', NULL, 4, 2, '1', 0),
(194, 0, 'Francisco', 'Dutari', NULL, 9, 2, '1', 0),
(195, 0, 'Mariano', 'Echeverría', NULL, 19, 2, '1', 0),
(196, 0, 'Hernán', 'Encina', NULL, 8, 3, '1', 0),
(197, 0, 'Cristian', 'Erbes', NULL, 5, 3, '1', 0),
(198, 0, 'Sebastian', 'Ereros', NULL, 1, 4, '1', 0),
(199, 0, 'Rodrigo', 'Erramuspe', NULL, 12, 2, '1', 0),
(200, 0, 'Walter', 'Erviti', NULL, 5, 3, '3', 0),
(201, 0, 'Sergio', 'Escudero', NULL, 2, 2, '2', 0),
(202, 0, 'Gastón', 'Esmerado', NULL, 3, 3, '1', 0),
(203, 0, 'Marcelo', 'Estigarribia', NULL, 13, 3, '2', 0),
(204, 0, 'Cristian', 'Fabbiani', NULL, 1, 4, '1', 0),
(205, 0, 'Emir', 'Faccioli', NULL, 9, 2, '1', 0),
(206, 0, 'Lorenzo', 'Faravelli', NULL, 13, 3, '1', 0),
(207, 0, 'LuisCarlos', 'Fariña', NULL, 16, 3, '1', 0),
(208, 0, 'Gastón', 'Fernández', NULL, 7, 4, '2', 0),
(209, 0, 'Federico', 'Fernández', NULL, 7, 2, '2', 0),
(210, 0, 'Ignacio', 'Fernández', NULL, 8, 3, '1', 0),
(211, 0, 'Roberto', 'Fernández', NULL, 16, 1, '1', 0),
(212, 0, 'Augusto', 'Fernández', NULL, 20, 3, '2', 0),
(213, 0, 'Paulo', 'Ferrari', NULL, 17, 2, '2', 0),
(214, 0, 'Jonathan', 'Ferrari', NULL, 18, 2, '1', 0),
(215, 0, 'Brian', 'Ferreira', NULL, 20, 4, '1', 0),
(216, 0, 'Alexis', 'Ferrero', NULL, 17, 2, '2', 0),
(217, 0, 'Facundo', 'Ferreyra', NULL, 4, 4, '1', 0),
(218, 0, 'Ignacio', 'Fideleff', NULL, 13, 2, '1', 0),
(219, 0, 'Ezequiel', 'Filippetto', NULL, 10, 2, '1', 0),
(220, 0, 'Pablo', 'Fontanello', NULL, 8, 2, '1', 0),
(221, 0, 'Fabricio', 'Fontanini', NULL, 15, 2, '1', 0),
(222, 0, 'Guillermo', 'Franco', NULL, 20, 4, '2', 0),
(223, 0, 'Andrés', 'Franzoia', NULL, 3, 4, '1', 0),
(224, 0, 'Hernán', 'Fredes', NULL, 11, 3, '2', 0),
(225, 0, 'Federico', 'Freire', NULL, 20, 3, '1', 0),
(226, 0, 'Alejandro', 'Frezzotti', NULL, 8, 3, '1', 0),
(227, 0, 'Fabricio', 'Fuentes', NULL, 13, 2, '2', 0),
(228, 0, 'Esteban', 'Fuertes', NULL, 6, 4, '3', 0),
(229, 0, 'Rogelio', 'FunesMori', NULL, 17, 4, '2', 0),
(230, 0, 'JoséRamiro', 'FunesMori', NULL, 17, 2, '1', 0),
(231, 0, 'Julio', 'Furch', NULL, 14, 4, '1', 0),
(232, 0, 'Adrián', 'Gabbarini', NULL, 11, 1, '1', 0),
(233, 0, 'Leonel', 'Galeano', NULL, 11, 2, '2', 0),
(234, 0, 'Hernán', 'Galíndez', NULL, 15, 1, '1', 0),
(235, 0, 'Martín', 'Galmarini', NULL, 19, 3, '1', 0),
(236, 0, 'Diego', 'Galván', NULL, 14, 3, '1', 0),
(237, 0, 'Orlando', 'GaonaLugo', NULL, 5, 4, '1', 0),
(238, 0, 'Ariel', 'Garcé', NULL, 6, 2, '2', 0),
(239, 0, 'Cristian', 'García', NULL, 4, 4, '1', 0),
(240, 0, 'Javier', 'García', NULL, 5, 1, '2', 0),
(241, 0, 'Zelmar', 'García', NULL, 9, 2, '1', 0),
(242, 0, 'Gonzalo', 'García', NULL, 16, 2, '1', 0),
(243, 0, 'Pablo', 'Garnier', NULL, 15, 3, '1', 0),
(244, 0, 'Santiago', 'Gentiletti', NULL, 2, 2, '1', 0),
(245, 0, 'Danilo', 'Gerlo', NULL, 15, 2, '1', 0),
(246, 0, 'Emanuel', 'Gigliotti', NULL, 1, 4, '1', 0),
(247, 0, 'Matías', 'Giménez', NULL, 18, 3, '2', 0),
(248, 0, 'Matías', 'Giordano', NULL, 1, 1, '1', 0),
(249, 0, 'Dylan', 'Gissi', NULL, 7, 2, '1', 0),
(250, 0, 'Jorge', 'Giusti', NULL, 20, 4, '1', 0),
(251, 0, 'Fernando', 'Godoy', NULL, 11, 3, '1', 0),
(252, 0, 'PaoloDuval', 'Goltz', NULL, 12, 2, '2', 0),
(253, 0, 'Jonatan', 'Gómez', NULL, 4, 3, '1', 0),
(254, 0, 'Ricardo', 'Gómez', NULL, 6, 3, '1', 0),
(255, 0, 'Facundo', 'Gómez', NULL, 15, 2, '1', 0),
(256, 0, 'Martín', 'Gómez', NULL, 19, 4, '1', 0),
(257, 0, 'Adrián', 'González', NULL, 3, 2, '1', 0),
(258, 0, 'Leandro', 'González', NULL, 7, 4, '1', 0),
(259, 0, 'César', 'González', NULL, 8, 3, '2', 0),
(260, 0, 'Diego', 'González', NULL, 12, 3, '1', 0),
(261, 0, 'Cristian', 'González', NULL, 13, 4, '1', 0),
(262, 0, 'Arnaldo', 'González', NULL, 15, 3, '1', 0),
(263, 0, 'Sebastián', 'González', NULL, 18, 3, '1', 0),
(264, 0, 'Esteban', 'González', NULL, 19, 3, '1', 0),
(265, 0, 'JuanNicolás', 'González', NULL, 20, 3, '1', 0),
(266, 0, 'Leandro', 'GonzálezPirez', NULL, 17, 2, '1', 0),
(267, 0, 'Marcelo', 'Goux', NULL, 6, 2, '1', 0),
(268, 0, 'Leandro', 'Gracián', NULL, 11, 3, '2', 0),
(269, 0, 'Gabriel', 'Graciani', NULL, 6, 3, '1', 0),
(270, 0, 'Claudio', 'Graf', NULL, 8, 4, '1', 0),
(271, 0, 'Hernán', 'Grana', NULL, 15, 2, '1', 0),
(272, 0, 'Franco', 'Grassi', NULL, 4, 1, '1', 0),
(273, 0, 'Sebastián', 'Grazzini', NULL, 1, 3, '2', 0),
(274, 0, 'Claudio', 'Guerra', NULL, 10, 4, '1', 0),
(275, 0, 'Julián', 'GuillermoRojas', NULL, 4, 3, '1', 0),
(276, 0, 'Teófilo', 'Gutiérrez', NULL, 16, 4, '2', 0),
(277, 0, 'Fernando', 'Gutiérrez', NULL, 18, 3, '1', 0),
(278, 0, 'Nahuel', 'Guzmán', NULL, 13, 1, '1', 0),
(279, 0, 'Gabriel', 'Hauche', NULL, 16, 4, '2', 0),
(280, 0, 'Emilio', 'Hernández', NULL, 2, 3, '1', 0),
(281, 0, 'Pablo', 'Hernández', NULL, 2, 3, '1', 0),
(282, 0, 'Diego', 'Herner', NULL, 18, 2, '1', 0),
(283, 0, 'Federico', 'Higuaín', NULL, 6, 4, '2', 0),
(284, 0, 'Michael', 'Hoyos', NULL, 7, 3, '1', 0),
(285, 0, 'Santiago', 'Hoyos', NULL, 12, 2, '1', 0),
(286, 0, 'Lucas', 'Hoyos', NULL, 13, 1, '1', 0),
(287, 0, 'Nelson', 'Ibáñez', NULL, 9, 1, '2', 0),
(288, 0, 'Matías', 'Ibáñez', NULL, 14, 1, '1', 0),
(289, 0, 'Raúl', 'Iberbia', NULL, 7, 2, '1', 0),
(290, 0, 'JuanMartín', 'Imbert', NULL, 5, 4, '1', 0),
(291, 0, 'JuanManuel', 'Insaurralde', NULL, 5, 2, '2', 0),
(292, 0, 'Hugo', 'Iriarte', NULL, 8, 2, '1', 0),
(293, 0, 'Daniel', 'Islas', NULL, 19, 1, '2', 0),
(294, 0, 'KevinFabián', 'Itabel', NULL, 19, 3, '1', 0),
(295, 0, 'Carlos', 'Izquierdoz', NULL, 12, 2, '1', 0),
(296, 0, 'Leonardo', 'Jara', NULL, 7, 3, '1', 0),
(297, 0, 'Pablo', 'Jerez', NULL, 14, 2, '1', 0),
(298, 0, 'Enzo', 'Kalinski', NULL, 15, 3, '1', 0),
(299, 0, 'Juan', 'Krupoviesa', NULL, 3, 2, '1', 0),
(300, 0, 'Lucas', 'Kruspzky', NULL, 11, 2, '1', 0),
(301, 0, 'Matías', 'Laba', NULL, 2, 3, '1', 0),
(302, 0, 'Santiago', 'Ladino', NULL, 4, 2, '1', 0),
(303, 0, 'Diego', 'Lagos', NULL, 12, 4, '1', 0),
(304, 0, 'Erik', 'Lamela', NULL, 17, 3, '3', 0),
(305, 0, 'Franco', 'Lanaro', NULL, 19, 4, '1', 0),
(306, 0, 'Manuel', 'Lanzini', NULL, 17, 3, '2', 0),
(307, 0, 'Joaquín', 'Larrivey', NULL, 6, 4, '2', 0),
(308, 0, 'Joaquín', 'Laso', NULL, 19, 2, '1', 0),
(309, 0, 'Cristian', 'Ledesma', NULL, 6, 3, '1', 0),
(310, 0, 'Eduardo', 'Ledesma', NULL, 12, 3, '1', 0),
(311, 0, 'Luciano', 'Leguizamón', NULL, 3, 4, '2', 0),
(312, 0, 'Cristian', 'Lema', NULL, 13, 2, '1', 0),
(313, 0, 'Rodrigo', 'Lemos', NULL, 10, 2, '1', 0),
(314, 0, 'Emiliano', 'Lencina', NULL, 10, 4, '1', 0),
(315, 0, 'Ramiro', 'Leone', NULL, 19, 3, '1', 0),
(316, 0, 'Germán', 'Lesman', NULL, 6, 4, '1', 0),
(317, 0, 'Lucas', 'Licht', NULL, 16, 2, '2', 0),
(318, 0, 'Marcos', 'Litre', NULL, 14, 4, '1', 0),
(319, 0, 'Braian', 'Lluy', NULL, 16, 2, '1', 0),
(320, 0, 'Sebastián', 'Longo', NULL, 14, 3, '1', 0),
(321, 0, 'Hernán', 'Lopes', NULL, 12, 2, '1', 0),
(322, 0, 'VíctorDavid', 'López', NULL, 1, 3, '1', 0),
(323, 0, 'Lisandro', 'López', NULL, 3, 2, '2', 0),
(324, 0, 'Víctor', 'López', NULL, 4, 2, '3', 0),
(325, 0, 'HernánRodrigo', 'López', NULL, 7, 4, '2', 0),
(326, 0, 'Martín', 'López', NULL, 10, 2, '1', 0),
(327, 0, 'Cristian', 'Lucchetti', NULL, 5, 1, '2', 0),
(328, 0, 'Maximiliano', 'Lugo', NULL, 12, 2, '1', 0),
(329, 0, 'Pablo', 'Lugüercio', NULL, 16, 4, '2', 0),
(330, 0, 'Sebastián', 'Luna', NULL, 18, 2, '1', 0),
(331, 0, 'Carlos', 'Luque', NULL, 6, 4, '1', 0),
(332, 0, 'Gastón', 'Machín', NULL, 10, 3, '1', 0),
(333, 0, 'Alexis', 'Machuca', NULL, 13, 2, '1', 0),
(334, 0, 'Gerardo', 'Maciel', NULL, 4, 3, '1', 0),
(335, 0, 'Carlos', 'Madeo', NULL, 1, 2, '1', 0),
(336, 0, 'Lisandro', 'Magallán', NULL, 8, 2, '1', 0),
(337, 0, 'Ezequiel', 'Maggiolo', NULL, 14, 4, '2', 0),
(338, 0, 'Cristian', 'Maidana', NULL, 10, 3, '1', 0),
(339, 0, 'Jonatan', 'Maidana', NULL, 17, 2, '2', 0),
(340, 0, 'Federico', 'Mancuello', NULL, 11, 3, '1', 0),
(341, 0, 'Agustín', 'Marchesín', NULL, 12, 1, '2', 0),
(342, 0, 'Iván', 'Marcone', NULL, 3, 3, '1', 0),
(343, 0, 'Lucas', 'Mareque', NULL, 11, 2, '2', 0),
(344, 0, 'LeandroLucas', 'Marín', NULL, 5, 2, '1', 0),
(345, 0, 'Nicolás', 'Martínez', NULL, 11, 3, '1', 0),
(346, 0, 'Sebastián', 'Martínez', NULL, 15, 2, '1', 0),
(347, 0, 'Matías', 'Martínez', NULL, 16, 2, '2', 0),
(348, 0, 'Román', 'Martínez', NULL, 19, 3, '2', 0),
(349, 0, 'JuanManuel', 'Martínez', NULL, 20, 4, '3', 0),
(350, 0, 'Abel', 'Masuero', NULL, 8, 2, '1', 0),
(351, 0, 'Diego', 'Mateo', NULL, 13, 3, '2', 0),
(352, 0, 'Carlos', 'Matheu', NULL, 11, 2, '2', 0),
(353, 0, 'Mauro', 'Matos', NULL, 1, 4, '2', 0),
(354, 0, 'JuanAlberto', 'Mauri', NULL, 14, 3, '1', 0),
(355, 0, 'Sebastián', 'Mayorga', NULL, 16, 3, '1', 0),
(356, 0, 'Gabriel', 'Méndez', NULL, 4, 4, '1', 0),
(357, 0, 'Emiliano', 'Méndez', NULL, 8, 3, '1', 0),
(358, 0, 'Franco', 'Mendoza', NULL, 3, 4, '1', 0),
(359, 0, 'Humberto', 'Mendoza', NULL, 6, 2, '1', 0),
(360, 0, 'Gonzalo', 'Menéndez', NULL, 3, 2, '1', 0),
(361, 0, 'Lucas', 'Menossi', NULL, 19, 3, '1', 0),
(362, 0, 'JuanCarlos', 'Menseguez', NULL, 18, 4, '2', 0),
(363, 0, 'Gabriel', 'Mercado', NULL, 7, 2, '3', 0),
(364, 0, 'JuanIgnacio', 'Mercier', NULL, 2, 3, '3', 0),
(365, 0, 'Fernando', 'Meza', NULL, 18, 2, '1', 0),
(366, 0, 'Pablo', 'Migliore', NULL, 18, 1, '2', 0),
(367, 0, 'Nicolás', 'Millán', NULL, 19, 4, '1', 0),
(368, 0, 'Pablo', 'Miranda', NULL, 9, 4, '1', 0),
(369, 0, 'Fernando', 'Monetti', NULL, 8, 1, '1', 0),
(370, 0, 'César', 'Montiglio', NULL, 10, 3, '1', 0),
(371, 0, 'Marcelo', 'Montoya', NULL, 20, 1, '2', 0),
(372, 0, 'LucianoFabián', 'Monzón', NULL, 5, 2, '1', 0),
(373, 0, 'Gastón', 'Monzón', NULL, 10, 1, '2', 0),
(374, 0, 'Angel', 'Morales', NULL, 10, 3, '1', 0),
(375, 0, 'JuanJosé', 'Morales', NULL, 15, 4, '1', 0),
(376, 0, 'DiegoHernán', 'Morales', NULL, 15, 1, '1', 0),
(377, 0, 'Diego', 'Morales', NULL, 19, 3, '2', 0),
(378, 0, 'Maximiliano', 'Moralez', NULL, 20, 3, '3', 0),
(379, 0, 'Ricardo', 'Moreira', NULL, 8, 2, '1', 0),
(380, 0, 'Giovanni', 'Moreno', NULL, 16, 3, '3', 0),
(381, 0, 'Iván', 'MorenoyFabianesi', NULL, 6, 3, '2', 0),
(382, 0, 'Claudio', 'Mosca', NULL, 3, 3, '1', 0),
(383, 0, 'Marcelo', 'Mosset', NULL, 14, 2, '1', 0),
(384, 0, 'Pablo', 'Mouche', NULL, 5, 4, '2', 0),
(385, 0, 'GabrielOscar', 'Moyano', NULL, 9, 3, '1', 0),
(386, 0, 'Sebastián', 'Moyano', NULL, 9, 1, '1', 0),
(387, 0, 'Lucas', 'Mugni', NULL, 6, 3, '1', 0),
(388, 0, 'Franco', 'Mussis', NULL, 8, 3, '1', 0),
(389, 0, 'Daniel', 'Mustafá', NULL, 19, 2, '1', 0),
(390, 0, 'Enrique', 'Narvay', NULL, 15, 4, '1', 0),
(391, 0, 'Nicolás', 'Navarro', NULL, 2, 1, '2', 0),
(392, 0, 'Alvaro', 'Navarro', NULL, 9, 4, '1', 0),
(393, 0, 'Hilario', 'Navarro', NULL, 11, 1, '3', 0),
(394, 0, 'Leandro', 'Navarro', NULL, 18, 3, '1', 0),
(395, 0, 'Juan', 'Neira', NULL, 8, 4, '2', 0),
(396, 0, 'HugoMartín', 'Nervo', NULL, 3, 2, '1', 0),
(397, 0, 'Franco', 'Niell', NULL, 2, 4, '2', 0),
(398, 0, 'Luciano', 'Nieto', NULL, 10, 4, '1', 0),
(399, 0, 'Brian', 'Nieva', NULL, 11, 4, '1', 0),
(400, 0, 'Ricardo', 'Noir', NULL, 5, 4, '1', 0),
(401, 0, 'Maximiliano', 'Núñez', NULL, 7, 3, '1', 0),
(402, 0, 'Fabricio', 'Núñez', NULL, 9, 4, '1', 0),
(403, 0, 'Leonel', 'Núñez', NULL, 11, 4, '2', 0),
(404, 0, 'Gervasio', 'Núñez', NULL, 15, 3, '1', 0),
(405, 0, 'Gustavo', 'Oberman', NULL, 2, 4, '2', 0),
(406, 0, 'MauroIván', 'Obolo', NULL, 3, 4, '2', 0),
(407, 0, 'Darío', 'Ocampo', NULL, 2, 3, '1', 0),
(408, 0, 'Luis', 'Ojeda', NULL, 2, 1, '1', 0),
(409, 0, 'Emanuel', 'Olivera', NULL, 20, 2, '1', 0),
(410, 0, 'Nicolás', 'Olmedo', NULL, 9, 3, '2', 0),
(411, 0, 'Lucas', 'Orban', NULL, 17, 2, '1', 0),
(412, 0, 'Catriel', 'Orcellet', NULL, 3, 1, '1', 0),
(413, 0, 'Agustín', 'Orion', NULL, 7, 1, '2', 0),
(414, 0, 'Ariel', 'Ortega', NULL, 1, 4, '2', 0),
(415, 0, 'Néstor', 'Ortigoza', NULL, 18, 3, '3', 0),
(416, 0, 'Jorge', 'Ortiz', NULL, 3, 3, '2', 0),
(417, 0, 'Fernando', 'Ortiz', NULL, 20, 2, '2', 0),
(418, 0, 'Luciano', 'Ospina', NULL, 10, 2, '1', 0),
(419, 0, 'Nahuel', 'Oviedo', NULL, 10, 4, '1', 0),
(420, 0, 'Germán', 'Pacheco', NULL, 8, 4, '1', 0),
(421, 0, 'Fernando', 'Pagés', NULL, 10, 3, '1', 0),
(422, 0, 'Martín', 'Palermo', NULL, 5, 4, '3', 0),
(423, 0, 'JoséLuis', 'Palomino', NULL, 18, 2, '1', 0),
(424, 0, 'Armando', 'Panceri', NULL, 1, 2, '1', 0),
(425, 0, 'Emiliano', 'Papa', NULL, 20, 2, '2', 0),
(426, 0, 'Norberto', 'Paparatto', NULL, 19, 2, '1', 0),
(427, 0, 'Leandro', 'Paredes', NULL, 5, 4, '1', 0),
(428, 0, 'Facundo', 'Parra', NULL, 11, 4, '2', 0),
(429, 0, 'Mariano', 'Pasini', NULL, 19, 3, '1', 0),
(430, 0, 'Mariano', 'Pavone', NULL, 17, 4, '3', 0),
(431, 0, 'Fabricio', 'Pedrozo', NULL, 18, 4, '1', 0),
(432, 0, 'Fernando', 'Pellegrino', NULL, 8, 1, '1', 0),
(433, 0, 'Cristian', 'Pellerano', NULL, 11, 3, '2', 0),
(434, 0, 'Agustín', 'Pelletieri', NULL, 12, 3, '2', 0),
(435, 0, 'Agustín', 'Peña', NULL, 10, 2, '1', 0),
(436, 0, 'Gabriel', 'Peñalba', NULL, 7, 3, '1', 0),
(437, 0, 'Sebastián', 'Peratta', NULL, 13, 1, '2', 0),
(438, 0, 'Emanuel', 'Perea', NULL, 1, 3, '1', 0),
(439, 0, 'Hernán', 'Pereyra', NULL, 4, 3, '1', 0),
(440, 0, 'JuanPablo', 'Pereyra', NULL, 7, 4, '1', 0),
(441, 0, 'Roberto', 'Pereyra', NULL, 17, 3, '2', 0),
(442, 0, 'Guillermo', 'Pereyra', NULL, 18, 3, '2', 0),
(443, 0, 'DamiánAlfredo', 'Pérez', NULL, 3, 2, '1', 0),
(444, 0, 'Enzo', 'Pérez', NULL, 7, 3, '3', 0),
(445, 0, 'JorgeIván', 'Pérez', NULL, 11, 3, '1', 0),
(446, 0, 'Mariano', 'Pernía', NULL, 19, 2, '1', 0),
(447, 0, 'Gino', 'Peruzzi', NULL, 20, 2, '1', 0),
(448, 0, 'Germán', 'Pezzella', NULL, 17, 2, '1', 0),
(449, 0, 'Cristian', 'Piarrou', NULL, 8, 2, '1', 0),
(450, 0, 'Iván', 'Pillud', NULL, 16, 2, '3', 0),
(451, 0, 'Jorge', 'PiñerodaSilva', NULL, 9, 4, '1', 0),
(452, 0, 'Emmanuel', 'Pío', NULL, 4, 3, '1', 0),
(453, 0, 'Federico', 'Pistone', NULL, 2, 2, '1', 0),
(454, 0, 'Guido', 'Pizarro', NULL, 12, 3, '1', 0),
(455, 0, 'Diego', 'Placente', NULL, 18, 2, '2', 0),
(456, 0, 'Raúl', 'Poclaba', NULL, 16, 3, '1', 0),
(457, 0, 'Diego', 'Pozo', NULL, 6, 1, '2', 0),
(458, 0, 'Sebastián', 'Prediger', NULL, 6, 3, '1', 0),
(459, 0, 'Mauricio', 'Prol', NULL, 1, 3, '1', 0),
(460, 0, 'Gonzalo', 'Prósperi', NULL, 2, 2, '1', 0),
(461, 0, 'Jorge', 'Pucheta', NULL, 12, 1, '1', 0),
(462, 0, 'Martín', 'Quiles', NULL, 15, 2, '1', 0),
(463, 0, 'Ismael', 'Quilez', NULL, 6, 2, '1', 0),
(464, 0, 'Carlos', 'Quintana', NULL, 10, 2, '1', 0),
(465, 0, 'Alejandro', 'Quintana', NULL, 10, 3, '1', 0),
(466, 0, 'Marcelo', 'Quinteros', NULL, 4, 3, '1', 0),
(467, 0, 'Juan', 'Quiroga', NULL, 6, 2, '1', 0),
(468, 0, 'Facundo', 'Quiroga', NULL, 10, 2, '1', 0),
(469, 0, 'Matías', 'Quiroga', NULL, 10, 3, '1', 0),
(470, 0, 'Ronald', 'Raldes', NULL, 6, 2, '2', 0),
(471, 0, 'Alfredo', 'Ramírez', NULL, 6, 3, '1', 0),
(472, 0, 'Rubén', 'Ramírez', NULL, 9, 4, '2', 0),
(473, 0, 'David', 'Ramírez', NULL, 20, 3, '3', 0),
(474, 0, 'Santiago', 'Raymonda', NULL, 15, 3, '1', 0),
(475, 0, 'Franco', 'Razzotti', NULL, 20, 3, '1', 0),
(476, 0, 'Germán', 'Ré', NULL, 7, 2, '2', 0),
(477, 0, 'Mario', 'Regueiro', NULL, 12, 3, '3', 0),
(478, 0, 'Ezequiel', 'Rescaldani', NULL, 20, 4, '1', 0),
(479, 0, 'JuanCruz', 'Respuela', NULL, 16, 3, '1', 0),
(480, 0, 'Diego', 'Reynoso', NULL, 14, 2, '1', 0),
(481, 0, 'Salvador', 'Reynoso', NULL, 18, 3, '1', 0),
(482, 0, 'Marcelo', 'Ricci', NULL, 14, 3, '1', 0),
(483, 0, 'Boris', 'Rieloff', NULL, 8, 2, '1', 0),
(484, 0, 'Lucas', 'Rimoldi', NULL, 1, 3, '1', 0),
(485, 0, 'Fabián', 'Rinaudo', NULL, 8, 3, '2', 0),
(486, 0, 'JuanRomán', 'Riquelme', NULL, 5, 3, '3', 0),
(487, 0, 'Ciro', 'Rius', NULL, 2, 4, '1', 0),
(488, 0, 'Diego', 'Rivero', NULL, 5, 3, '2', 0),
(489, 0, 'Andrés', 'Rodales', NULL, 19, 2, '1', 0),
(490, 0, 'JuanPablo', 'Rodríguez', NULL, 1, 3, '1', 0),
(491, 0, 'Lucas', 'Rodríguez', NULL, 2, 2, '1', 0),
(492, 0, 'Clemente', 'Rodríguez', NULL, 5, 2, '2', 0),
(493, 0, 'Patricio', 'Rodríguez', NULL, 11, 3, '2', 0),
(494, 0, 'Diego', 'Rodríguez', NULL, 11, 1, '1', 0),
(495, 0, 'Luis', 'Rodríguez', NULL, 13, 4, '1', 0),
(496, 0, 'Guillermo', 'Roffes', NULL, 10, 4, '1', 0),
(497, 0, 'Antonio', 'Rojano', NULL, 8, 4, '1', 0),
(498, 0, 'Ariel', 'Rojas', NULL, 9, 3, '2', 0),
(499, 0, 'Israel', 'Roldán', NULL, 8, 3, '1', 0),
(500, 0, 'Martín', 'Rolle', NULL, 14, 3, '1', 0),
(501, 0, 'Leandro', 'Romagnoli', NULL, 18, 3, '2', 0),
(502, 0, 'Adalberto', 'Román', NULL, 17, 2, '2', 0),
(503, 0, 'Joaquín', 'Romea', NULL, 8, 4, '1', 0),
(504, 0, 'Bernardo', 'Romeo', NULL, 15, 4, '1', 0),
(505, 0, 'Andrés', 'Romero', NULL, 2, 4, '1', 0),
(506, 0, 'SebastiánAriel', 'Romero', NULL, 4, 3, '2', 0),
(507, 0, 'Silvio', 'Romero', NULL, 12, 4, '1', 0),
(508, 0, 'Jonatan', 'Romero', NULL, 19, 2, '1', 0),
(509, 0, 'Facundo', 'Roncaglia', NULL, 7, 2, '2', 0),
(510, 0, 'Ariel', 'Rosada', NULL, 4, 3, '1', 0),
(511, 0, 'Pablo', 'Rosales', NULL, 7, 2, '1', 0),
(512, 0, 'MatiasEzequiel', 'Rudler', NULL, 1, 3, '1', 0),
(513, 0, 'Henry', 'Rui', NULL, 1, 4, '1', 0),
(514, 0, 'EnzoAdrián', 'Ruiz', NULL, 5, 2, '1', 0),
(515, 0, 'Federico', 'Ruiz', NULL, 8, 3, '1', 0),
(516, 0, 'Sebastián', 'Rusculleda', NULL, 18, 3, '1', 0),
(517, 0, 'Roberto', 'Russo', NULL, 9, 2, '1', 0),
(518, 0, 'Juan', 'Sabia', NULL, 2, 2, '1', 0),
(519, 0, 'Nicolás', 'Sainz', NULL, 16, 2, '1', 0),
(520, 0, 'Santiago', 'Salcedo', NULL, 2, 4, '2', 0),
(521, 0, 'Juan', 'Salgueiro', NULL, 18, 4, '2', 0),
(522, 0, 'Rodrigo', 'Salinas', NULL, 9, 4, '1', 0),
(523, 0, 'Carlos', 'Salom', NULL, 14, 4, '1', 0),
(524, 0, 'Daniel', 'Salvatierra', NULL, 13, 4, '1', 0),
(525, 0, 'José', 'SanRomán', NULL, 18, 2, '1', 0),
(526, 0, 'Fernando', 'Sánchez', NULL, 1, 3, '1', 0),
(527, 0, 'Matías', 'Sánchez', NULL, 7, 3, '1', 0),
(528, 0, 'Carlos', 'Sánchez', NULL, 9, 3, '2', 0),
(529, 0, 'Nicolás', 'Sánchez', NULL, 9, 2, '1', 0),
(530, 0, 'Sergio', 'Sánchez', NULL, 9, 3, '1', 0),
(531, 0, 'JuanManuel', 'SánchezMiño', NULL, 5, 3, '1', 0),
(532, 0, 'Christian', 'SánchezPrette', NULL, 2, 3, '1', 0),
(533, 0, 'Pablo', 'Santillo', NULL, 4, 1, '1', 0),
(534, 0, 'Leandro', 'Sapetti', NULL, 8, 2, '1', 0),
(535, 0, 'Federico', 'Sardella', NULL, 4, 3, '1', 0),
(536, 0, 'Matías', 'Sarulyte', NULL, 7, 2, '1', 0),
(537, 0, 'Gastón', 'Sauro', NULL, 5, 2, '1', 0),
(538, 0, 'Mauricio', 'Scaglia', NULL, 13, 2, '1', 0),
(539, 0, 'Maximiliano', 'Scapparoni', NULL, 5, 1, '1', 0),
(540, 0, 'JuanPablo', 'Scheffer', NULL, 14, 2, '1', 0),
(541, 0, 'Rolando', 'Schiavi', NULL, 13, 2, '2', 0),
(542, 0, 'Favio', 'Segovia', NULL, 4, 2, '1', 0),
(543, 0, 'Sergio', 'Sena', NULL, 3, 3, '1', 0),
(544, 0, 'Gastón', 'Sessa', NULL, 8, 1, '2', 0),
(545, 0, 'Matías', 'Sierra', NULL, 3, 3, '1', 0),
(546, 0, 'Leonardo', 'Sigali', NULL, 9, 2, '2', 0),
(547, 0, 'JuanIgnacio', 'Sills', NULL, 20, 2, '1', 0),
(548, 0, 'Facundo', 'Silva', NULL, 3, 3, '1', 0),
(549, 0, 'Agustín', 'Silva', NULL, 7, 1, '1', 0),
(550, 0, 'Santiago', 'Silva', NULL, 20, 4, '3', 0),
(551, 0, 'Andrés', 'Silvera', NULL, 11, 4, '2', 0),
(552, 0, 'Lucas', 'Simón', NULL, 19, 4, '1', 0),
(553, 0, 'Luis', 'Solignac', NULL, 4, 4, '1', 0),
(554, 0, 'Leandro', 'Somoza', NULL, 5, 3, '2', 0),
(555, 0, 'Darío', 'Soplan', NULL, 10, 3, '1', 0),
(556, 0, 'Carlos', 'Soto', NULL, 1, 2, '1', 0),
(557, 0, 'Santiago', 'Soto', NULL, 6, 3, '1', 0),
(558, 0, 'Gonzalo', 'Soto', NULL, 8, 2, '1', 0),
(559, 0, 'Mauricio', 'Sperduti', NULL, 13, 3, '2', 0),
(560, 0, 'Darío', 'Stefanatto', NULL, 7, 3, '1', 0),
(561, 0, 'Denis', 'Stracqualursi', NULL, 19, 4, '2', 0),
(562, 0, 'César', 'Taborda', NULL, 7, 1, '1', 0),
(563, 0, 'Nicolás', 'Tagliafico', NULL, 4, 2, '1', 0),
(564, 0, 'Juan', 'Tejera', NULL, 14, 2, '1', 0),
(565, 0, 'Fernando', 'Telechea', NULL, 19, 4, '1', 0),
(566, 0, 'Facundo', 'Tessoro', NULL, 1, 3, '1', 0),
(567, 0, 'Fernando', 'Tobio', NULL, 20, 2, '1', 0),
(568, 0, 'Gustavo', 'Toledo', NULL, 4, 2, '1', 0),
(569, 0, 'Laureano', 'Tombolini', NULL, 14, 1, '1', 0),
(570, 0, 'Martín', 'Tonso', NULL, 13, 3, '1', 0),
(571, 0, 'Patricio', 'Toranzo', NULL, 16, 3, '2', 0),
(572, 0, 'Agustín', 'Torassa', NULL, 1, 4, '1', 0),
(573, 0, 'Miguel', 'Torrén', NULL, 2, 2, '1', 0),
(574, 0, 'Adrián', 'Torres', NULL, 9, 3, '1', 0),
(575, 0, 'Diego', 'Torres', NULL, 15, 4, '1', 0),
(576, 0, 'Aureliano', 'Torres', NULL, 18, 2, '2', 0),
(577, 0, 'JuanManuel', 'Torres', NULL, 18, 3, '2', 0),
(578, 0, 'Sebastián', 'Torrico', NULL, 9, 1, '2', 0),
(579, 0, 'Emanuel', 'Trípodi', NULL, 15, 1, '1', 0),
(580, 0, 'Cristian', 'Trombetta', NULL, 19, 2, '1', 0),
(581, 0, 'Cristian', 'Tula', NULL, 18, 2, '2', 0),
(582, 0, 'Eduardo', 'Tuzzio', NULL, 11, 2, '2', 0),
(583, 0, 'Diego', 'Valeri', NULL, 12, 3, '3', 0),
(584, 0, 'Jonathan', 'Valle', NULL, 13, 2, '1', 0),
(585, 0, 'Nicolás', 'Vallejos', NULL, 10, 2, '1', 0),
(586, 0, 'Gabriel', 'Vallés', NULL, 11, 2, '1', 0),
(587, 0, 'Leonel', 'Vangioni', NULL, 13, 3, '1', 0),
(588, 0, 'Gustavo', 'Varela', NULL, 15, 3, '1', 0),
(589, 0, 'Gonzalo', 'Vargas', NULL, 2, 4, '1', 0),
(590, 0, 'David', 'Vega', NULL, 14, 3, '1', 0),
(591, 0, 'MarioDaniel', 'Vega', NULL, 17, 1, '1', 0),
(592, 0, 'Maximiliano', 'Velasco', NULL, 13, 4, '1', 0),
(593, 0, 'Maximiliano', 'Velázquez', NULL, 11, 2, '2', 0),
(594, 0, 'Julián', 'Velázquez', NULL, 11, 2, '1', 0),
(595, 0, 'Leandro', 'Velázquez', NULL, 13, 3, '1', 0),
(596, 0, 'Pablo', 'Velázquez', NULL, 18, 4, '2', 0),
(597, 0, 'LeandroNicolás', 'Vélez', NULL, 10, 3, '1', 0),
(598, 0, 'José', 'Vélez', NULL, 11, 2, '1', 0),
(599, 0, 'Cristian', 'Vella', NULL, 1, 2, '1', 0),
(600, 0, 'Luciano', 'Vella', NULL, 13, 2, '1', 0),
(601, 0, 'Renzo', 'Vera', NULL, 19, 2, '1', 0),
(602, 0, 'JuanSebastián', 'Verón', NULL, 7, 3, '3', 0),
(603, 0, 'Lucas', 'Viatri', NULL, 5, 4, '2', 0),
(604, 0, 'Juan', 'Vieyra', NULL, 13, 3, '1', 0),
(605, 0, 'Marcelo', 'Vieytes', NULL, 1, 3, '1', 0),
(606, 0, 'Lucas', 'Villafáñez', NULL, 11, 3, '1', 0),
(607, 0, 'Hernán', 'Villalba', NULL, 13, 3, '1', 0),
(608, 0, 'Daniel', 'Villalva', NULL, 17, 4, '1', 0),
(609, 0, 'Leonardo', 'Villán', NULL, 10, 2, '1', 0),
(610, 0, 'Cristian', 'Villanueva', NULL, 14, 2, '1', 0),
(611, 0, 'Diego', 'Villar', NULL, 9, 3, '2', 0),
(612, 0, 'Valentín', 'Viola', NULL, 16, 4, '1', 0),
(613, 0, 'José', 'Vizcarra', NULL, 8, 4, '1', 0),
(614, 0, 'Germán', 'Voboril', NULL, 9, 2, '1', 0),
(615, 0, 'Germán', 'Vouilloud', NULL, 19, 1, '1', 0),
(616, 0, 'Claudio', 'Yacob', NULL, 16, 3, '2', 0),
(617, 0, 'Nahuel', 'Yeri', NULL, 4, 2, '1', 0),
(618, 0, 'Víctor', 'Zapata', NULL, 20, 3, '2', 0),
(619, 0, 'Edgar', 'Zaracho', NULL, 6, 3, '1', 0),
(620, 0, 'Ariel', 'Zárate', NULL, 1, 3, '1', 0),
(621, 0, 'Rolando', 'Zárate', NULL, 10, 4, '1', 0),
(622, 0, 'Emilio', 'Zelaya', NULL, 4, 4, '1', 0),
(623, 0, 'Franco', 'Zuculini', NULL, 16, 3, '2', 0),
(624, 0, 'Bruno', 'Zuculini', NULL, 16, 3, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playermatch`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1321 ;

--
-- RELACIONES PARA LA TABLA `playermatch`:
--   `match_`
--       `match_` -> `id`
--   `player`
--       `player` -> `id`
--

--
-- Volcar la base de datos para la tabla `playermatch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerposition`
--
-- Creación: 03-03-2011 a las 15:28:42
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
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2449 ;

--
-- RELACIONES PARA LA TABLA `playerteam`:
--   `player`
--       `player` -> `id`
--   `team`
--       `team` -> `id`
--

--
-- Volcar la base de datos para la tabla `playerteam`
--

INSERT INTO `playerteam` (`id`, `version`, `player`, `team`, `isCaptain1`, `isCaptain2`, `isCaptain3`, `isPrincipal`, `isList`, `isSubstitute`, `number`) VALUES
(2431, 1, 47, 60, 0, 0, 0, 1, 0, 0, 1),
(2433, 1, 213, 56, 0, 0, 0, 1, 0, 0, 2),
(2434, 1, 502, 56, 0, 0, 0, 1, 0, 0, 3),
(2435, 1, 581, 56, 0, 0, 0, 1, 0, 0, 4),
(2436, 1, 444, 56, 0, 0, 0, 1, 0, 0, 5),
(2437, 1, 583, 56, 0, 0, 0, 1, 0, 0, 6),
(2438, 1, 528, 56, 0, 0, 0, 1, 0, 0, 7),
(2439, 1, 616, 56, 0, 0, 0, 1, 0, 0, 8),
(2440, 1, 550, 56, 0, 0, 0, 1, 0, 0, 9),
(2441, 1, 384, 56, 0, 0, 0, 1, 0, 0, 10),
(2442, 1, 561, 56, 0, 0, 0, 0, 0, 1, 11),
(2443, 1, 406, 56, 0, 0, 0, 0, 0, 1, 12),
(2444, 1, 425, 56, 0, 0, 0, 1, 0, 0, 13),
(2445, 1, 252, 56, 0, 0, 0, 0, 0, 1, 14),
(2446, 1, 110, 56, 0, 0, 0, 0, 0, 1, 15),
(2448, 1, 559, 56, 0, 0, 0, 0, 0, 1, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerteamweek`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28601 ;

--
-- RELACIONES PARA LA TABLA `playerteamweek`:
--   `playerteam`
--       `playerteam` -> `id`
--   `week`
--       `week` -> `id`
--

--
-- Volcar la base de datos para la tabla `playerteamweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playerweek`
--
-- Creación: 03-03-2011 a las 15:28:42
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
-- RELACIONES PARA LA TABLA `playerweek`:
--   `player`
--       `player` -> `id`
--   `week`
--       `week` -> `id`
--

--
-- Volcar la base de datos para la tabla `playerweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positionteamweek`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1241 ;

--
-- RELACIONES PARA LA TABLA `positionteamweek`:
--   `category`
--       `category` -> `id`
--   `team`
--       `team` -> `id`
--   `week`
--       `week` -> `id`
--

--
-- Volcar la base de datos para la tabla `positionteamweek`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--
-- Creación: 03-03-2011 a las 15:28:42
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
-- RELACIONES PARA LA TABLA `team`:
--   `category`
--       `category` -> `id`
--   `user`
--       `user` -> `id`
--

--
-- Volcar la base de datos para la tabla `team`
--

INSERT INTO `team` (`id`, `version`, `name`, `user`, `category`, `isClosed`, `tactic`) VALUES
(52, 0, '[NI UN PELO DE TONTO]', 52, 2, 0, '4-4-2'),
(53, 0, 'HRG F.C.', 53, 1, 0, '4-4-2'),
(54, 0, 'Viejita Stone', 54, 1, 0, '4-4-2'),
(55, 0, 'TRES', 55, 1, 0, '4-4-2'),
(56, 0, '15 de Octubre', 56, 1, 0, '4-4-2'),
(57, 0, 'Red Bull', 57, 2, 0, '4-4-2'),
(58, 0, 'Capussoto F.C.', 58, 2, 0, '4-4-2'),
(59, 0, 'QEE', 59, 1, 0, '4-4-2'),
(60, 0, 'GWT FC', 60, 2, 0, '4-4-2'),
(61, 0, 'Chapita de Cerveza Fóbal Clus', 61, 1, 0, '4-4-2'),
(62, 0, 'Los Super Ratones', 62, 1, 0, '4-4-2'),
(63, 0, 'La Bandita', 63, 1, 0, '4-4-2'),
(64, 0, 'Magia Negra', 64, 2, 0, '4-4-2'),
(65, 0, 'A.C. Decano', 65, 2, 0, '4-4-2'),
(66, 0, 'La Filial', 66, 2, 0, '4-4-2'),
(67, 0, 'Hidrocarburo', 67, 1, 0, '4-4-2'),
(68, 0, '[GRAN CUÑADO]', 68, 2, 0, '4-4-2'),
(69, 0, 'Último Recurso', 69, 1, 0, '4-4-2'),
(70, 0, 'Dep. A Lunares', 70, 2, 0, '4-4-2'),
(71, 0, 'Los Golosos', 71, 2, 0, '4-4-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--
-- Creación: 03-03-2011 a las 15:28:42
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
(55, 4, 'Esteban', 'Sabbione', 'Tete', 'MTI4MzI2', 'tetesabbione@hotmail.com'),
(56, 3, 'Tomas', 'Condorelli', 'Tommy', 'Y2FzY294Mg==', 'tonyvelamazan@hotmail.com'),
(57, 4, 'Martin', 'Aristia', 'Martin', 'bWFydGlu', 'm.aristia@gmail.com'),
(58, 2, 'Franco', 'Condorelli', 'Catalano', 'Y2F0YWxhbm8=', 'cachosaccardi@hotmail.com'),
(59, 5, 'Nicolas', 'Condorelli', 'Coco', 'UGluY2hhMDE=', 'ncondorelli@exiros.com'),
(60, 14, 'Augusto', 'Soncini', 'Augusto', 'U29uY2luaQ==', 'augustosoncini@hotmail.com'),
(61, 3, 'Matias', 'Condorelli', 'Pepi', 'UGVwaQ==', 'maticondorelli@gmail.com'),
(62, 7, 'Mauro', 'Pennacchioni', 'Rata', 'MTMxMTc2', 'mpennach@gmail.com'),
(63, 3, 'Emilio', 'Tabellione', 'Emi', 'MTI4MzEz', 'etabe114@hotmail.com'),
(64, 3, 'Andres', 'Garci­a Olivares', 'Negro', 'bmVncm8=', 'a_garciaolivares@hotmail.com'),
(65, 5, 'Guillermo', 'Vallina', 'Guillote', 'MTI3Mjkw', 'gdvallina@fibertel.com.ar'),
(66, 4, 'Mauro', 'Di Benni', 'Papucho', 'MTI4MzE5', 'patodb@hotmail.com'),
(67, 2, 'Adriano', 'Mucelli', 'Tano', 'dGFubw==', 'amucelli@kpmg.com.ar'),
(68, 10, 'Fabian', 'Sabbione', 'Cunado', 'NTk4NDcz', 'fabiansabbione@hotmail.com'),
(69, 2, 'Sebastian', 'Fiori', 'Chocho', 'Y2hvY2hv', 'fioriseba@hotmail.com'),
(70, 3, 'Ignacio', 'Soncini', 'Iki', 'Z2F5', 'ikisoncini@hotmail.com'),
(71, 2, 'Gaston', 'Messineo', 'Vivi', 'dml2aQ==', 'gastonmessineo@hotmail.com'),
(72, 2, 'Luciano', 'Mucelli', 'Luchi', 'bHVjaGk=', 'luciano.mucelli@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraccess`
--
-- Creación: 03-03-2011 a las 15:28:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- RELACIONES PARA LA TABLA `useraccess`:
--   `access`
--       `access` -> `id`
--   `user`
--       `user` -> `id`
--

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
(88, 0, 65, 1),
(89, 0, 65, 2),
(90, 0, 65, 3),
(91, 0, 65, 13),
(92, 0, 65, 14),
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
(106, 0, 53, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `week`
--
-- Creación: 03-03-2011 a las 15:28:42
--

DROP TABLE IF EXISTS `week`;
CREATE TABLE IF NOT EXISTS `week` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_Week_number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Volcar la base de datos para la tabla `week`
--

INSERT INTO `week` (`id`, `version`, `number`) VALUES
(26, 0, 1),
(27, 0, 2),
(28, 0, 3),
(29, 0, 4),
(30, 0, 5),
(31, 0, 6),
(32, 0, 7),
(33, 0, 8),
(34, 0, 9),
(35, 0, 10),
(36, 0, 11),
(37, 0, 12),
(38, 0, 13),
(39, 0, 14),
(40, 0, 15);

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
