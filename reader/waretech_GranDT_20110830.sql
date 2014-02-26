-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-08-2011 a las 23:10:01
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `claim`
--


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
(1, 2, 'started', 'false');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `match_`
--


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
(1, 0, 'Walter', 'Acevedo', 0, 5, 3, '2', 0),
(2, 0, 'Jorge', 'Achucarro', 0, 5, 4, '2', 0),
(3, 0, 'David', 'Achucarro', 0, 7, 2, '1', 0),
(4, 0, 'Joel', 'Acosta', 0, 7, 4, '1', 0),
(5, 0, 'Ricardo', 'Acosta', 0, 19, 3, '1', 0),
(6, 0, 'Alan', 'Aguerre', 0, 20, 1, '1', 0),
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
(24, 0, 'Carlos', 'Araujo', 0, 12, 2, '1', 0),
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
(35, 0, 'Juan', 'Avendaño', 0, 19, 2, '1', 0),
(36, 0, 'Néstor', 'Ayala', 0, 17, 4, '1', 0),
(37, 0, 'Cristian', 'Báez', 0, 11, 2, '1', 0),
(38, 0, 'Andrés', 'Bailo', 0, 8, 1, '1', 0),
(39, 0, 'Luciano', 'Balbi', 0, 12, 2, '1', 0),
(40, 0, 'Alejandro', 'Bárbaro', 0, 5, 3, '1', 0),
(41, 0, 'Guido', 'Barceló', 0, 10, 4, '1', 0),
(42, 0, 'Ignacio', 'Barcia', 0, 11, 2, '1', 0),
(43, 0, 'Néstor', 'Bareiro', 0, 14, 4, '1', 0),
(44, 0, 'Hugo', 'Bargas', 0, 1, 4, '1', 0),
(45, 0, 'Diego', 'Barisone', 0, 19, 2, '1', 0),
(46, 0, 'Marcelo', 'Barovero', 0, 20, 1, '2', 0),
(47, 0, 'Jerónimo', 'Barrales', 0, 19, 4, '1', 0),
(48, 0, 'Julio', 'Barraza', 0, 8, 2, '1', 0),
(49, 0, 'Leandro', 'Barrera', 0, 2, 4, '1', 0),
(50, 0, 'Hugo', 'Barrientos', 0, 1, 3, '1', 0),
(51, 0, 'Fernando', 'Barrientos', 0, 12, 3, '1', 0),
(52, 0, 'Pier Miqueas', 'Barrios', 0, 6, 2, '1', 0),
(53, 0, 'Pablo', 'Barzola', 0, 2, 2, '1', 0),
(54, 0, 'Adrián', 'Bastía', 0, 8, 3, '1', 0),
(55, 0, 'Germán', 'Basualdo', 0, 2, 3, '1', 0),
(56, 0, 'Matías', 'Batista', 0, 1, 2, '1', 0),
(57, 0, 'Sebastián', 'Battaglia', 0, 7, 3, '2', 0),
(58, 0, 'Roberto', 'Battión', 0, 11, 3, '1', 0),
(59, 0, 'Nicolás', 'Bauchet', 0, 5, 4, '1', 0),
(60, 0, 'Gonzalo', 'Bazán', 0, 16, 3, '1', 0),
(61, 0, 'Iván', 'Bella', 0, 20, 3, '1', 0),
(62, 0, 'Darío', 'Benedetto', 0, 3, 4, '1', 0),
(63, 0, 'Leandro Damián', 'Benítez', 0, 9, 3, '2', 0),
(64, 0, 'Nelson', 'Benítez', 0, 9, 2, '1', 0),
(65, 0, 'Oscar', 'Benítez', 0, 12, 3, '1', 0),
(66, 0, 'Marcos', 'Benítez', 0, 13, 2, '1', 0),
(67, 0, 'Nahuel', 'Benítez', 0, 16, 4, '1', 0),
(68, 0, 'Nicolás', 'Berardo', 0, 2, 2, '1', 0),
(69, 0, 'Lucas', 'Bernardi', 0, 13, 3, '2', 0),
(70, 0, 'Nicolás', 'Bianchi Arce', 0, 16, 2, '1', 0),
(71, 0, 'Mariano Ezequiel', 'Bittolo', 0, 20, 2, '1', 0),
(72, 0, 'Gustavo', 'Blanco Leschuk', 0, 3, 4, '1', 0),
(73, 0, 'Nicolás', 'Blandi', 0, 7, 4, '1', 0),
(74, 0, 'Juan Carlos', 'Blengio', 0, 18, 2, '1', 0),
(75, 0, 'Mauro', 'Bogado', 0, 17, 3, '1', 0),
(76, 0, 'Enrique', 'Bologna', 0, 19, 1, '1', 0),
(77, 0, 'Luciano', 'Bonomo', 0, 9, 2, '1', 0),
(78, 0, 'Mauro', 'Boselli', 0, 9, 4, '3', 0),
(79, 0, 'Rubén', 'Botta', 0, 18, 3, '1', 0),
(80, 0, 'Jonathan', 'Bottinelli', 0, 16, 2, '2', 0),
(81, 0, 'Gonzalo', 'Bozzoni', 0, 16, 2, '1', 0),
(82, 0, 'Diego', 'Braghieri', 0, 12, 2, '1', 0),
(83, 0, 'Rodrigo', 'Braña', 0, 9, 3, '2', 0),
(84, 0, 'Ariel', 'Broggi', 0, 5, 2, '1', 0),
(85, 0, 'Roberto', 'Brum', 0, 2, 3, '1', 0),
(86, 0, 'Nicolás', 'Bruna', 0, 19, 3, '1', 0),
(87, 0, 'Guillermo', 'Burdisso', 0, 3, 2, '2', 0),
(88, 0, 'Javier', 'Burrai', 0, 3, 1, '1', 0),
(89, 0, 'Walter', 'Busse', 0, 11, 3, '1', 0),
(90, 0, 'Marcelo', 'Bustamante', 0, 5, 2, '1', 0),
(91, 0, 'Maximiliano', 'Bustos', 0, 17, 3, '1', 0),
(92, 0, 'Alejandro', 'Cabral', 0, 20, 3, '1', 0),
(93, 0, 'Gonzalo', 'Cabrera', 0, 10, 3, '1', 0),
(94, 0, 'Nicolás', 'Cabrera', 0, 11, 3, '1', 0),
(95, 0, 'Rafael', 'Cabrera', 0, 16, 3, '1', 0),
(96, 0, 'Samuel', 'Cáceres', 0, 11, 2, '1', 0),
(97, 0, 'Marcos', 'Cáceres', 0, 15, 2, '1', 0),
(98, 0, 'Germán', 'Cáceres', 0, 4, 3, '1', 0),
(99, 0, 'Juan Pablo', 'Caffa', 0, 3, 3, '2', 0),
(100, 0, 'Leonel', 'Cafferatti', 0, 15, 1, '1', 0),
(101, 0, 'Matías', 'Cahais', 0, 15, 2, '2', 0),
(102, 0, 'Maximiliano', 'Caire', 0, 8, 2, '1', 0),
(103, 0, 'Néstor', 'Camacho', 0, 13, 3, '1', 0),
(104, 0, 'Alejandro', 'Camargo', 0, 10, 3, '1', 0),
(105, 0, 'Nicolás', 'Cambiasso', 0, 1, 1, '1', 0),
(106, 0, 'Mauro', 'Camoranesi', 0, 12, 3, '2', 0),
(107, 0, 'Cristian', 'Campestrini', 0, 3, 1, '2', 0),
(108, 0, 'Salustiano', 'Candia', 0, 8, 2, '1', 0),
(109, 0, 'Pablo', 'Cantero', 0, 17, 3, '1', 0),
(110, 0, 'Héctor', 'Canteros', 0, 20, 3, '2', 0),
(111, 0, 'Damián', 'Canuto', 0, 17, 3, '1', 0),
(112, 0, 'Nicolás', 'Capellino', 0, 4, 4, '1', 0),
(113, 0, 'Gastón', 'Caprari', 0, 17, 4, '1', 0),
(114, 0, 'Nicolás', 'Caprio', 0, 19, 1, '1', 0),
(115, 0, 'Matías', 'Carabajal', 0, 17, 3, '1', 0),
(116, 0, 'Mauricio', 'Caranta', 0, 12, 1, '2', 0),
(117, 0, 'Carlos', 'Carbonero', 0, 9, 3, '2', 0),
(118, 0, 'Ezequiel', 'Carboni', 0, 5, 3, '1', 0),
(119, 0, 'Juan Pablo', 'Cárdenas', 0, 19, 2, '1', 0),
(120, 0, 'Giancarlo', 'Carmona', 0, 16, 2, '1', 0),
(121, 0, 'Oscar', 'Carniello', 0, 4, 2, '1', 0),
(122, 0, 'César', 'Carranza', 0, 12, 4, '1', 0),
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
(135, 0, 'Lucas', 'Castro', 0, 15, 3, '2', 0),
(136, 0, 'Nicolás', 'Castro', 0, 4, 3, '1', 0),
(137, 0, 'Lucas', 'Ceballos', 0, 10, 2, '1', 0),
(138, 0, 'Cristian', 'Cellay', 0, 9, 2, '2', 0),
(139, 0, 'Gastón', 'Cellerino', 0, 15, 3, '1', 0),
(140, 0, 'Christian', 'Cepeda', 0, 3, 2, '1', 0),
(141, 0, 'Francisco', 'Cerro', 0, 20, 3, '1', 0),
(142, 0, 'Nereo', 'Champagne', 0, 16, 1, '1', 0),
(143, 0, 'Cristian', 'Chávez', 0, 7, 3, '2', 0),
(144, 0, 'Christian', 'Chávez', 0, 16, 4, '1', 0),
(145, 0, 'Javier', 'Chevantón', 0, 8, 4, '2', 0),
(146, 0, 'Gino', 'Clara', 0, 11, 4, '1', 0),
(147, 0, 'Juan Manuel', 'Cobo', 0, 3, 3, '1', 0),
(148, 0, 'Nicolás', 'Colazo', 0, 7, 3, '1', 0),
(149, 0, 'Gabriel', 'Colombatti', 0, 15, 2, '1', 0),
(150, 0, 'Ignacio', 'Colombini', 0, 15, 4, '1', 0),
(151, 0, 'Armando', 'Cooper', 0, 10, 3, '1', 0),
(152, 0, 'Jherson', 'Córdoba', 0, 4, 3, '1', 0),
(153, 0, 'Facundo', 'Coria', 0, 9, 3, '2', 0),
(154, 0, 'Maximiliano', 'Coronel', 0, 1, 2, '1', 0),
(155, 0, 'Nicolás', 'Correa', 0, 19, 2, '1', 0),
(156, 0, 'Jorge Iván', 'Correa', 0, 20, 3, '1', 0),
(157, 0, 'Leonardo', 'Corti', 0, 17, 1, '1', 0),
(158, 0, 'Tomás', 'Costa', 0, 8, 3, '2', 0),
(159, 0, 'Agustín', 'Cousillas', 0, 18, 1, '1', 0),
(160, 0, 'Fabián', 'Cubero', 0, 20, 3, '2', 0),
(161, 0, 'Víctor', 'Cuesta', 0, 3, 2, '1', 0),
(162, 0, 'Jorge', 'Curbelo', 0, 10, 2, '1', 0),
(163, 0, 'Facundo', 'Curuchet', 0, 8, 4, '1', 0),
(164, 0, 'Darío', 'Cvitanich', 0, 7, 4, '2', 0),
(165, 0, 'Israel', 'Damonte', 0, 10, 3, '1', 0),
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
(181, 0, 'Gastón', 'Díaz', 0, 18, 3, '1', 0),
(182, 0, 'Gastón', 'Díaz', 0, 20, 2, '1', 0),
(183, 0, 'Mauro', 'Dobler', 0, 15, 1, '1', 0),
(184, 0, 'Eduardo', 'Domínguez', 0, 1, 2, '1', 0),
(185, 0, 'Sebastián', 'Domínguez', 0, 20, 2, '3', 0),
(186, 0, 'Mauro', 'Dos Santos', 0, 5, 2, '1', 0),
(187, 0, 'Francisco', 'Dutari', 0, 4, 2, '1', 0),
(188, 0, 'Mariano', 'Echeverría', 0, 18, 2, '2', 0),
(189, 0, 'Juan', 'Eluchans', 0, 5, 3, '1', 0),
(190, 0, 'Cristian', 'Erbes', 0, 7, 3, '1', 0),
(191, 0, 'Rodrigo', 'Erramuspe', 0, 19, 2, '1', 0),
(192, 0, 'Walter', 'Erviti', 0, 7, 3, '2', 0),
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
(217, 0, 'Facundo', 'Ferreyra', 0, 5, 4, '2', 0),
(218, 0, 'Juan Pablo', 'Ferreyra', 0, 5, 1, '1', 0),
(219, 0, 'Osmar', 'Ferreyra', 0, 11, 3, '2', 0),
(220, 0, 'Ignacio', 'Fideleff', 0, 13, 2, '1', 0),
(221, 0, 'Tobías', 'Figueroa', 0, 6, 4, '1', 0),
(222, 0, 'Víctor', 'Figueroa', 0, 13, 3, '2', 0),
(223, 0, 'Matías', 'Fissore', 0, 4, 3, '1', 0),
(224, 0, 'Santiago', 'Fogst', 0, 8, 2, '1', 0),
(225, 0, 'Fabricio', 'Fontanini', 0, 4, 2, '1', 0),
(226, 0, 'Guillermo', 'Franco', 0, 10, 2, '1', 0),
(227, 0, 'Guillermo', 'Franco', 0, 20, 4, '2', 0),
(228, 0, 'Andrés', 'Franzoia', 0, 14, 4, '1', 0),
(229, 0, 'Hernán', 'Fredes', 0, 11, 3, '2', 0),
(230, 0, 'Federico', 'Freire', 0, 20, 3, '1', 0),
(231, 0, 'Matías', 'Fritzler', 0, 12, 3, '2', 0),
(232, 0, 'Diego', 'Ftacla', 0, 18, 4, '1', 0),
(233, 0, 'Diego', 'Fuentes', 0, 1, 2, '1', 0),
(234, 0, 'Esteban', 'Fuertes', 0, 8, 4, '3', 0),
(235, 0, 'Julio', 'Furch', 0, 14, 4, '1', 0),
(236, 0, 'Adrián', 'Gabbarini', 0, 11, 1, '1', 0),
(237, 0, 'Walter', 'Gaitán', 0, 4, 3, '2', 0),
(238, 0, 'Marcos', 'Galarza', 0, 17, 2, '1', 0),
(239, 0, 'Leonel', 'Galeano', 0, 11, 2, '1', 0),
(240, 0, 'Martín', 'Galmarini', 0, 18, 3, '1', 0),
(241, 0, 'Diego', 'Galván', 0, 9, 3, '1', 0),
(242, 0, 'Darío', 'Gandín', 0, 4, 4, '2', 0),
(243, 0, 'Orlando', 'Gaona Lugo', 0, 7, 4, '1', 0),
(244, 0, 'Ariel', 'Garcé', 0, 8, 2, '2', 0),
(245, 0, 'Zelmar', 'García', 0, 10, 2, '1', 0),
(246, 0, 'Gonzalo', 'García', 0, 15, 2, '1', 0),
(247, 0, 'Diego', 'García', 0, 17, 4, '1', 0),
(248, 0, 'Javier', 'García', 0, 18, 1, '2', 0),
(249, 0, 'Danilo', 'Gerlo', 0, 3, 2, '1', 0),
(250, 0, 'Emmanuel', 'Gigliotti', 0, 16, 4, '3', 0),
(251, 0, 'Matías', 'Giménez', 0, 7, 3, '1', 0),
(252, 0, 'Dylan', 'Gissi', 0, 9, 2, '1', 0),
(253, 0, 'Fernando', 'Godoy', 0, 11, 3, '1', 0),
(254, 0, 'Paolo Duval', 'Goltz', 0, 12, 2, '2', 0),
(255, 0, 'Jonatan', 'Gómez', 0, 5, 3, '1', 0),
(256, 0, 'Adrián', 'González', 0, 3, 2, '2', 0),
(257, 0, 'Esteban', 'González', 0, 6, 3, '1', 0),
(258, 0, 'Fernando', 'González', 0, 6, 2, '1', 0),
(259, 0, 'Leandro', 'González', 0, 8, 4, '1', 0),
(260, 0, 'Mariano', 'González', 0, 9, 3, '2', 0),
(261, 0, 'Diego', 'González', 0, 12, 3, '1', 0),
(262, 0, 'Cristian', 'González', 0, 13, 4, '1', 0),
(263, 0, 'Federico', 'González', 0, 4, 4, '1', 0),
(264, 0, 'Sebastián', 'González', 0, 16, 3, '1', 0),
(265, 0, 'Cristian', 'Grabinski', 0, 17, 2, '1', 0),
(266, 0, 'Leandro', 'Gracián', 0, 7, 3, '1', 0),
(267, 0, 'Gabriel', 'Graciani', 0, 8, 3, '1', 0),
(268, 0, 'Claudio', 'Graf', 0, 17, 4, '1', 0),
(269, 0, 'Hernán', 'Grana', 0, 6, 2, '1', 0),
(270, 0, 'Franco', 'Grassi', 0, 5, 1, '1', 0),
(271, 0, 'Julián', 'Guillermo Rojas', 0, 5, 3, '1', 0),
(272, 0, 'Gastón', 'Guruceaga', 0, 13, 2, '1', 0),
(273, 0, 'Teófilo', 'Gutiérrez', 0, 15, 4, '3', 0),
(274, 0, 'Fernando', 'Gutiérrez', 0, 16, 3, '1', 0),
(275, 0, 'Nahuel', 'Guzmán', 0, 13, 1, '1', 0),
(276, 0, 'Gabriel', 'Hauche', 0, 15, 4, '2', 0),
(277, 0, 'Carlos', 'Henneberg', 0, 12, 4, '1', 0),
(278, 0, 'Juan Pablo', 'Heredia', 0, 6, 1, '1', 0),
(279, 0, 'Emilio', 'Hernández', 0, 2, 3, '1', 0),
(280, 0, 'Pablo', 'Hernández', 0, 2, 3, '1', 0),
(281, 0, 'Federico', 'Higuaín', 0, 8, 4, '2', 0),
(282, 0, 'Michael', 'Hoyos', 0, 9, 3, '1', 0),
(283, 0, 'Lucas', 'Hoyos', 0, 13, 1, '1', 0),
(284, 0, 'Jefferson', 'Hurtado', 0, 2, 2, '1', 0),
(285, 0, 'Nelson', 'Ibáñez', 0, 10, 1, '1', 0),
(286, 0, 'Matías', 'Ibáñez', 0, 14, 1, '1', 0),
(287, 0, 'Raúl', 'Iberbia', 0, 9, 2, '1', 0),
(288, 0, 'Juan Martín', 'Imbert', 0, 7, 4, '1', 0),
(289, 0, 'Juan Manuel', 'Insaurralde', 0, 7, 2, '2', 0),
(290, 0, 'Hugo', 'Iriarte', 0, 4, 2, '1', 0),
(291, 0, 'Daniel', 'Islas', 0, 18, 1, '1', 0),
(292, 0, 'Kevin Fabián', 'Itabel', 0, 18, 3, '1', 0),
(293, 0, 'Carlos', 'Izquierdoz', 0, 12, 2, '1', 0),
(294, 0, 'Leonardo', 'Jara', 0, 9, 3, '1', 0),
(295, 0, 'Pablo', 'Jerez', 0, 14, 2, '1', 0),
(296, 0, 'Iván', 'Juárez', 0, 4, 3, '1', 0),
(297, 0, 'Enzo', 'Kalinski', 0, 16, 3, '1', 0),
(298, 0, 'Lucas', 'Kruspzky', 0, 11, 2, '1', 0),
(299, 0, 'Luciano', 'Kummer', 0, 8, 2, '1', 0),
(300, 0, 'Matías', 'Laba', 0, 2, 3, '1', 0),
(301, 0, 'Santiago', 'Ladino', 0, 5, 2, '1', 0),
(302, 0, 'Luis', 'Lagrutta', 0, 4, 3, '1', 0),
(303, 0, 'César', 'Lamanna', 0, 16, 4, '1', 0),
(304, 0, 'Franco', 'Lanaro', 0, 18, 4, '1', 0),
(305, 0, 'Lucas', 'Landa', 0, 17, 2, '1', 0),
(306, 0, 'Maximiliano', 'Laso', 0, 5, 3, '1', 0),
(307, 0, 'Joaquín', 'Laso', 0, 18, 2, '1', 0),
(308, 0, 'Cristian', 'Ledesma', 0, 8, 3, '1', 0),
(309, 0, 'Eduardo', 'Ledesma', 0, 12, 3, '1', 0),
(310, 0, 'Luciano', 'Leguizamón', 0, 3, 4, '2', 0),
(311, 0, 'Leandro', 'Leguizamón', 0, 18, 4, '1', 0),
(312, 0, 'Cristian', 'Lema', 0, 18, 2, '1', 0),
(313, 0, 'Alejandro', 'Lembo', 0, 6, 2, '1', 0),
(314, 0, 'Ramiro', 'Leone', 0, 18, 3, '1', 0),
(315, 0, 'Germán', 'Lesman', 0, 8, 4, '1', 0),
(316, 0, 'Bernardo', 'Leyenda', 0, 1, 1, '1', 0),
(317, 0, 'Lucas', 'Licht', 0, 15, 2, '2', 0),
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
(346, 0, 'Agustín', 'Marchesín', 0, 12, 1, '2', 0),
(347, 0, 'Iván', 'Marcone', 0, 3, 3, '1', 0),
(348, 0, 'Leandro Lucas', 'Marín', 0, 7, 2, '1', 0),
(349, 0, 'Francisco', 'Martínez', 0, 1, 2, '1', 0),
(350, 0, 'Matías', 'Martínez', 0, 15, 2, '2', 0),
(351, 0, 'Diego', 'Martínez', 0, 16, 4, '1', 0),
(352, 0, 'Adrián', 'Martínez', 0, 16, 2, '1', 0),
(353, 0, 'Román', 'Martínez', 0, 18, 3, '2', 0),
(354, 0, 'Nicolás', 'Martínez', 0, 18, 2, '1', 0),
(355, 0, 'Juan Manuel', 'Martínez', 0, 20, 4, '3', 0),
(356, 0, 'Emmanuel', 'Mas', 0, 17, 2, '1', 0),
(357, 0, 'Ezequiel', 'Mastrolía', 0, 16, 1, '1', 0),
(358, 0, 'Diego', 'Mateo', 0, 13, 3, '1', 0),
(359, 0, 'Carlos', 'Matheu', 0, 11, 2, '2', 0),
(360, 0, 'Mauro', 'Matos', 0, 1, 4, '2', 0),
(361, 0, 'Francisco', 'Mattia', 0, 17, 2, '1', 0),
(362, 0, 'Juan Alberto', 'Mauri', 0, 14, 3, '1', 0),
(363, 0, 'Lucas', 'Melano', 0, 6, 4, '1', 0),
(364, 0, 'Jesús', 'Méndez', 0, 7, 3, '2', 0),
(365, 0, 'Gabriel', 'Méndez', 0, 16, 4, '2', 0),
(366, 0, 'Gonzalo', 'Menéndez', 0, 3, 2, '1', 0),
(367, 0, 'Lucas', 'Menossi', 0, 18, 3, '1', 0),
(368, 0, 'Juan Carlos', 'Menseguez', 0, 16, 4, '2', 0),
(369, 0, 'Gabriel', 'Mercado', 0, 9, 2, '2', 0),
(370, 0, 'Fernando', 'Meza', 0, 16, 2, '1', 0),
(371, 0, 'Pablo', 'Migliore', 0, 16, 1, '2', 0),
(372, 0, 'Pablo', 'Miguez', 0, 19, 3, '1', 0),
(373, 0, 'Gabriel', 'Milito', 0, 11, 2, '2', 0),
(374, 0, 'Nicolás', 'Millán', 0, 18, 4, '1', 0),
(375, 0, 'Pablo', 'Miranda', 0, 10, 4, '1', 0),
(376, 0, 'Maximiliano', 'Montero', 0, 18, 2, '1', 0),
(377, 0, 'Fausto', 'Montero', 0, 19, 3, '1', 0),
(378, 0, 'Marcelo', 'Montoya', 0, 20, 1, '2', 0),
(379, 0, 'Juan José', 'Morales', 0, 2, 4, '1', 0),
(380, 0, 'Diego', 'Morales', 0, 18, 3, '2', 0),
(381, 0, 'Giovanni', 'Moreno', 0, 15, 3, '3', 0),
(382, 0, 'Emanuel', 'Moreno', 0, 19, 3, '1', 0),
(383, 0, 'Iván', 'Moreno y Fabianesi', 0, 8, 3, '2', 0),
(384, 0, 'Claudio', 'Mosca', 0, 3, 3, '1', 0),
(385, 0, 'Pablo', 'Mouche', 0, 7, 4, '2', 0),
(386, 0, 'Gabriel Oscar', 'Moyano', 0, 10, 3, '1', 0),
(387, 0, 'Sebastián', 'Moyano', 0, 10, 1, '1', 0),
(388, 0, 'Lucas', 'Mugni', 0, 8, 3, '1', 0),
(389, 0, 'Damián', 'Musto', 0, 14, 3, '1', 0),
(390, 0, 'Alvaro', 'Navarro', 0, 10, 4, '1', 0),
(391, 0, 'Hilario', 'Navarro', 0, 11, 1, '2', 0),
(392, 0, 'Leandro', 'Navarro', 0, 16, 3, '1', 0),
(393, 0, 'Juan', 'Neira', 0, 12, 3, '1', 0),
(394, 0, 'Hugo Martín', 'Nervo', 0, 3, 2, '1', 0),
(395, 0, 'Brian', 'Nieva', 0, 11, 4, '1', 0),
(396, 0, 'Alexis', 'Niz', 0, 4, 2, '1', 0),
(397, 0, 'Ricardo', 'Noir', 0, 13, 4, '1', 0),
(398, 0, 'Leonel', 'Núñez', 0, 11, 4, '2', 0),
(399, 0, 'Maximiliano', 'Núñez', 0, 17, 3, '1', 0),
(400, 0, 'Fabricio', 'Núñez', 0, 19, 4, '1', 0),
(401, 0, 'Gustavo', 'Oberman', 0, 2, 4, '1', 0),
(402, 0, 'Mauro Iván', 'Obolo', 0, 3, 4, '3', 0),
(403, 0, 'Luis', 'Ojeda', 0, 2, 1, '1', 0),
(404, 0, 'Juan Carlos', 'Olave', 0, 6, 1, '1', 0),
(405, 0, 'Emanuel', 'Olivera', 0, 20, 2, '1', 0),
(406, 0, 'Nicolás', 'Olmedo', 0, 10, 3, '2', 0),
(407, 0, 'Lucas', 'Orban', 0, 18, 2, '1', 0),
(408, 0, 'Catriel', 'Orcellet', 0, 3, 1, '1', 0),
(409, 0, 'Agustín', 'Orion', 0, 7, 1, '3', 0),
(410, 0, 'Néstor', 'Ortigoza', 0, 16, 3, '3', 0),
(411, 0, 'Jorge', 'Ortiz', 0, 3, 3, '1', 0),
(412, 0, 'Fernando', 'Ortiz', 0, 20, 2, '2', 0),
(413, 0, 'Lucas', 'Oviedo', 0, 17, 3, '1', 0),
(414, 0, 'Jonathan', 'Pacheco', 0, 16, 3, '1', 0),
(415, 0, 'Hugo', 'Padilla', 0, 6, 2, '1', 0),
(416, 0, 'Matías', 'Palavecino', 0, 14, 2, '1', 0),
(417, 0, 'José Luis', 'Palomino', 0, 16, 2, '1', 0),
(418, 0, 'Armando', 'Panceri', 0, 1, 2, '1', 0),
(419, 0, 'Emiliano', 'Papa', 0, 20, 2, '2', 0),
(420, 0, 'Norberto', 'Paparatto', 0, 18, 2, '1', 0),
(421, 0, 'Leandro', 'Paredes', 0, 7, 4, '1', 0),
(422, 0, 'Lucas', 'Parodi', 0, 6, 3, '1', 0),
(423, 0, 'Facundo', 'Parra', 0, 11, 4, '2', 0),
(424, 0, 'Elian', 'Parrino', 0, 9, 2, '1', 0),
(425, 0, 'Pablo', 'Pavetti', 0, 4, 3, '1', 0),
(426, 0, 'Nicolás', 'Pavlovich', 0, 14, 4, '1', 0),
(427, 0, 'Mariano', 'Pavone', 0, 12, 4, '2', 0),
(428, 0, 'Fabricio', 'Pedrozo', 0, 16, 4, '1', 0),
(429, 0, 'Maximiliano', 'Pellegrino', 0, 8, 2, '2', 0),
(430, 0, 'Cristian', 'Pellerano', 0, 11, 3, '2', 0),
(431, 0, 'Hernán', 'Pellerano', 0, 13, 2, '2', 0),
(432, 0, 'Agustín', 'Pelletieri', 0, 15, 3, '2', 0),
(433, 0, 'Sebastián', 'Penco', 0, 17, 4, '1', 0),
(434, 0, 'Rodrigo', 'Pepe', 0, 5, 3, '1', 0),
(435, 0, 'Sebastián', 'Peratta', 0, 13, 1, '2', 0),
(436, 0, 'Emanuel', 'Perea', 0, 1, 3, '1', 0),
(437, 0, 'Hernán', 'Pereyra', 0, 5, 3, '1', 0),
(438, 0, 'César', 'Pereyra', 0, 6, 4, '2', 0),
(439, 0, 'Mauricio', 'Pereyra', 0, 12, 3, '1', 0),
(440, 0, 'Juan Pablo', 'Pereyra', 0, 19, 4, '1', 0),
(441, 0, 'Patricio', 'Pérez', 0, 1, 3, '1', 0),
(442, 0, 'Damián Alfredo', 'Pérez', 0, 3, 2, '1', 0),
(443, 0, 'Claudio', 'Pérez', 0, 6, 2, '1', 0),
(444, 0, 'Marco', 'Pérez', 0, 11, 4, '2', 0),
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
(455, 0, 'Iván', 'Pillud', 0, 15, 2, '2', 0),
(456, 0, 'Marcos', 'Pinto', 0, 12, 2, '1', 0),
(457, 0, 'Emanuel', 'Pío', 0, 18, 3, '1', 0),
(458, 0, 'Federico', 'Pistone', 0, 2, 2, '1', 0),
(459, 0, 'Guido', 'Pizarro', 0, 12, 3, '2', 0),
(460, 0, 'Luciano', 'Pocrnjic', 0, 17, 1, '1', 0),
(461, 0, 'Federico', 'Poggi', 0, 17, 3, '1', 0),
(462, 0, 'Diego', 'Pozo', 0, 8, 1, '2', 0),
(463, 0, 'Sebastián', 'Prediger', 0, 8, 3, '1', 0),
(464, 0, 'Mauricio', 'Prol', 0, 1, 3, '1', 0),
(465, 0, 'Gonzalo', 'Prósperi', 0, 2, 2, '2', 0),
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
(477, 0, 'Rubén', 'Ramírez', 0, 10, 4, '2', 0),
(478, 0, 'Julio Gonzalo', 'Ramírez', 0, 16, 3, '1', 0),
(479, 0, 'David', 'Ramírez', 0, 20, 3, '3', 0),
(480, 0, 'Jonathan', 'Ramírez', 0, 20, 4, '1', 0),
(481, 0, 'Franco', 'Razzotti', 0, 20, 3, '1', 0),
(482, 0, 'Germán', 'Ré', 0, 9, 2, '2', 0),
(483, 0, 'Mario', 'Regueiro', 0, 12, 3, '3', 0),
(484, 0, 'Ezequiel', 'Rescaldani', 0, 20, 4, '1', 0),
(485, 0, 'Juan Cruz', 'Respuela', 0, 15, 3, '1', 0),
(486, 0, 'Salvador', 'Reynoso', 0, 16, 3, '1', 0),
(487, 0, 'César', 'Rigamonti', 0, 6, 1, '1', 0),
(488, 0, 'Emiliano', 'Rigoni', 0, 6, 3, '1', 0),
(489, 0, 'Leonel', 'Ríos', 0, 14, 3, '1', 0),
(490, 0, 'Juan Román', 'Riquelme', 0, 7, 3, '3', 0),
(491, 0, 'Ciro', 'Rius', 0, 2, 4, '1', 0),
(492, 0, 'Diego', 'Rivero', 0, 7, 3, '2', 0),
(493, 0, 'Marcos', 'Riveros', 0, 13, 3, '1', 0),
(494, 0, 'Emison', 'Roberval', 0, 17, 4, '1', 0),
(495, 0, 'Leonardo', 'Roda', 0, 17, 4, '1', 0),
(496, 0, 'Andrés', 'Rodales', 0, 18, 2, '1', 0),
(497, 0, 'Juan Pablo', 'Rodríguez', 0, 1, 3, '1', 0),
(498, 0, 'Lucas', 'Rodríguez', 0, 2, 2, '1', 0),
(499, 0, 'Gonzalo', 'Rodríguez', 0, 2, 4, '1', 0),
(500, 0, 'Ribair', 'Rodríguez', 0, 6, 3, '1', 0),
(501, 0, 'Clemente', 'Rodríguez', 0, 7, 2, '2', 0),
(502, 0, 'Patricio', 'Rodríguez', 0, 11, 3, '2', 0),
(503, 0, 'Diego', 'Rodríguez', 0, 11, 1, '1', 0),
(504, 0, 'Germán', 'Rodríguez Rojas', 0, 4, 3, '1', 0),
(505, 0, 'Ariel', 'Rojas', 0, 10, 3, '2', 0),
(506, 0, 'Martín', 'Rolle', 0, 14, 3, '2', 0),
(507, 0, 'Leandro', 'Romagnoli', 0, 16, 3, '2', 0),
(508, 0, 'Bernardo', 'Romeo', 0, 16, 4, '2', 0),
(509, 0, 'Andrés', 'Romero', 0, 2, 4, '1', 0),
(510, 0, 'Silvio', 'Romero', 0, 12, 4, '2', 0),
(511, 0, 'Emiliano', 'Romero', 0, 14, 4, '1', 0),
(512, 0, 'Jonatan', 'Romero', 0, 18, 2, '1', 0),
(513, 0, 'Facundo', 'Roncaglia', 0, 7, 2, '2', 0),
(514, 0, 'Ariel', 'Rosada', 0, 14, 3, '1', 0),
(515, 0, 'Pablo', 'Rosales', 0, 9, 2, '1', 0),
(516, 0, 'Paulo', 'Rosales', 0, 19, 3, '2', 0),
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
(535, 0, 'Nicolás', 'Sánchez', 0, 10, 2, '2', 0),
(536, 0, 'Sergio', 'Sánchez', 0, 10, 3, '1', 0),
(537, 0, 'Guillermo', 'Sánchez', 0, 14, 2, '1', 0),
(538, 0, 'Juan Manuel', 'Sánchez Miño', 0, 19, 3, '1', 0),
(539, 0, 'Damián', 'Santagatti', 0, 19, 2, '1', 0),
(540, 0, 'Pablo', 'Santillo', 0, 5, 1, '1', 0),
(541, 0, 'Guillermo', 'Sara', 0, 4, 1, '1', 0),
(542, 0, 'Brian', 'Sarmiento', 0, 15, 4, '1', 0),
(543, 0, 'Marcelo', 'Sarmiento', 0, 19, 3, '1', 0),
(544, 0, 'Matías', 'Sarulyte', 0, 9, 2, '1', 0),
(545, 0, 'Gastón', 'Sauro', 0, 7, 2, '1', 0),
(546, 0, 'Mauricio', 'Scaglia', 0, 13, 2, '1', 0),
(547, 0, 'Juan Pablo', 'Scheffer', 0, 14, 2, '1', 0),
(548, 0, 'Rolando', 'Schiavi', 0, 7, 2, '3', 0),
(549, 0, 'Favio', 'Segovia', 0, 5, 2, '1', 0),
(550, 0, 'Sergio', 'Sena', 0, 3, 3, '1', 0),
(551, 0, 'Walter', 'Serrano', 0, 4, 3, '1', 0),
(552, 0, 'Matías', 'Sierra', 0, 3, 3, '1', 0),
(553, 0, 'Leonardo', 'Sigali', 0, 10, 2, '2', 0),
(554, 0, 'Juan Ignacio', 'Sills', 0, 20, 2, '1', 0),
(555, 0, 'Agustín', 'Silva', 0, 9, 1, '1', 0),
(556, 0, 'Andrés', 'Silvera', 0, 6, 4, '2', 0),
(557, 0, 'Luis', 'Solignac', 0, 5, 4, '1', 0),
(558, 0, 'Leandro', 'Somoza', 0, 7, 3, '2', 0),
(559, 0, 'Franco', 'Sosa', 0, 7, 2, '1', 0),
(560, 0, 'Sebastián', 'Sosa', 0, 7, 1, '1', 0),
(561, 0, 'Diego', 'Sosa', 0, 17, 2, '1', 0),
(562, 0, 'Carlos', 'Soto', 0, 1, 2, '1', 0),
(563, 0, 'Santiago', 'Soto', 0, 8, 3, '1', 0),
(564, 0, 'Matías', 'Soto Torres', 0, 19, 3, '1', 0),
(565, 0, 'Mauricio', 'Sperduti', 0, 13, 3, '3', 0),
(566, 0, 'Darío', 'Stefanatto', 0, 1, 3, '1', 0),
(567, 0, 'Gastón', 'Suárez', 0, 6, 3, '1', 0),
(568, 0, 'Pedro', 'Suárez', 0, 19, 2, '1', 0),
(569, 0, 'Nicolás', 'Tagliafico', 0, 5, 2, '1', 0),
(570, 0, 'Juan', 'Tejera', 0, 14, 2, '1', 0),
(571, 0, 'Emiliano', 'Tellechea', 0, 16, 3, '1', 0),
(572, 0, 'Fernando', 'Tobio', 0, 20, 2, '1', 0),
(573, 0, 'Gustavo', 'Toledo', 0, 5, 2, '1', 0),
(574, 0, 'Laureano', 'Tombolini', 0, 14, 1, '1', 0),
(575, 0, 'Martín', 'Tonso', 0, 13, 3, '1', 0),
(576, 0, 'Patricio', 'Toranzo', 0, 15, 3, '2', 0),
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
(587, 0, 'Gastón', 'Turus', 0, 6, 2, '1', 0),
(588, 0, 'Eduardo', 'Tuzzio', 0, 11, 2, '2', 0),
(589, 0, 'Bruno', 'Urribarri', 0, 8, 2, '1', 0),
(590, 0, 'Maximiliano', 'Urruti', 0, 13, 4, '1', 0),
(591, 0, 'Matías', 'Valdez', 0, 12, 2, '1', 0),
(592, 0, 'Carmelo', 'Valencia', 0, 13, 4, '1', 0),
(593, 0, 'Diego', 'Valeri', 0, 12, 3, '3', 0),
(594, 0, 'Jonathan', 'Valle', 0, 13, 2, '1', 0),
(595, 0, 'Gabriel', 'Vallés', 0, 11, 2, '1', 0),
(596, 0, 'Leonel', 'Vangioni', 0, 13, 3, '2', 0),
(597, 0, 'Cristian', 'Varela', 0, 1, 2, '1', 0),
(598, 0, 'Franco', 'Vázquez', 0, 6, 3, '2', 0),
(599, 0, 'David', 'Vega', 0, 14, 3, '1', 0),
(600, 0, 'Maximiliano', 'Velasco', 0, 13, 4, '1', 0),
(601, 0, 'Julián', 'Velázquez', 0, 11, 2, '1', 0),
(602, 0, 'Maximiliano', 'Velázquez', 0, 11, 2, '2', 0),
(603, 0, 'Jorge', 'Velázquez', 0, 19, 3, '1', 0),
(604, 0, 'Leandro', 'Velázquez', 0, 20, 3, '1', 0),
(605, 0, 'José', '20', 0, 11, 2, '1', 0),
(606, 0, 'Cristian', 'Vella', 0, 1, 2, '1', 0),
(607, 0, 'Renzo', 'Vera', 0, 19, 2, '1', 0),
(608, 0, 'Santiago', 'Vergini', 0, 13, 2, '1', 0),
(609, 0, 'Juan Sebastián', 'Verón', 0, 9, 3, '3', 0),
(610, 0, 'Lucas', 'Viatri', 0, 7, 4, '3', 0),
(611, 0, 'Sebastián', 'Vidal', 0, 19, 3, '1', 0),
(612, 0, 'Juan', 'Vieyra', 0, 13, 3, '1', 0),
(613, 0, 'Lucas', 'Villafáñez', 0, 11, 3, '1', 0),
(614, 0, 'Hernán', 'Villalba', 0, 13, 3, '1', 0),
(615, 0, 'Cristian', 'Villanueva', 0, 14, 2, '1', 0),
(616, 0, 'Justo', 'Villar', 0, 9, 1, '2', 0),
(617, 0, 'Diego', 'Villar', 0, 10, 3, '2', 0),
(618, 0, 'Valentín', 'Viola', 0, 15, 4, '1', 0),
(619, 0, 'Darío', 'Vitelli', 0, 6, 2, '1', 0),
(620, 0, 'Oswaldo', 'Vizcarrondo', 0, 14, 2, '1', 0),
(621, 0, 'Germán', 'Voboril', 0, 10, 2, '1', 0),
(622, 0, 'Agustín', 'Vuletich', 0, 20, 4, '1', 0),
(623, 0, 'Martín', 'Wagner', 0, 17, 3, '1', 0),
(624, 0, 'Claudio', 'Yacob', 0, 15, 3, '2', 0),
(625, 0, 'Walter', 'Yacob', 0, 19, 2, '1', 0),
(626, 0, 'Rubén', 'Zamponi', 0, 17, 2, '1', 0),
(627, 0, 'Martín', 'Zapata', 0, 1, 3, '1', 0),
(628, 0, 'Duván', 'Zapata', 0, 9, 4, '1', 0),
(629, 0, 'Víctor', 'Zapata', 0, 20, 3, '2', 0),
(630, 0, 'Martín', 'Zbrun', 0, 4, 2, '1', 0),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `playerteam`
--


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
(52, 2, 'Ni un Pelo de Tonto', 52, 2, 0, '3-4-3'),
(53, 2, 'HRG F.C.', 53, 1, 0, '3-4-3'),
(54, 2, 'Viejita Stone', 54, 2, 0, '3-5-2'),
(55, 2, 'TRES', 55, 1, 0, '3-5-2'),
(56, 1, '15 de Octubre', 56, 1, 0, '4-4-2'),
(57, 3, 'Red Bull', 57, 1, 0, '3-4-3'),
(58, 4, 'Capussoto F.C.', 58, 1, 0, '3-4-3'),
(59, 2, 'QEE', 59, 2, 0, '3-4-3'),
(60, 2, 'GWT FC', 60, 2, 0, '3-5-2'),
(61, 4, 'Chapita de Cerveza Fóbal Clus', 61, 1, 0, '3-4-3'),
(62, 2, 'Los Super Ratones', 62, 2, 0, '3-4-3'),
(63, 2, 'La Bandita', 63, 1, 0, '3-5-2'),
(64, 1, '[HIPPIE CHIC]', 64, 2, 0, '4-4-2'),
(65, 2, 'A.C. Decano', 65, 2, 0, '3-5-2'),
(66, 2, '[PAPUCHO]', 66, 2, 0, '3-4-3'),
(67, 1, 'Hidrocarburo', 67, 1, 0, '4-4-2'),
(68, 2, 'Gran Cuñado', 68, 1, 0, '3-5-2'),
(69, 2, 'Último Recurso', 69, 1, 0, '3-4-3'),
(70, 2, '[BUSCO DUEÑO]', 70, 2, 0, '3-4-3'),
(71, 4, 'Los Golosos', 71, 2, 0, '3-4-3');

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
(64, 4, 'Andres', 'Garciía Olivares', 'Negro', 'bmVncm84NDQ=', 'a_garciaolivares@hotmail.com'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

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
(106, 0, 53, 2);

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
