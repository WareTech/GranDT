-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: waretech_GranDT
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,1,'MatchEdit.jsp!enabled','Edicion de Partido'),(2,0,'WeekEdit.jsp!change','Calcular la fecha'),(3,0,'AccessList.jsp','Lista de accesos'),(13,0,'TeamEdit.jsp!change','Cambiar jugador de la lista'),(14,5,'UserEdit.jsp!update','Edicion de usuario'),(15,0,'TeamBuild.jsp!enabled','Construccion de Equipo'),(16,0,'WeekList.jsp!tournamentStart','Comenzar torneo'),(17,0,'EMailSend.jsp','Enviar eMail'),(18,0,'ClaimList.jsp!delete','Eliminar reclamo');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'Primera A'),(2,0,'Nacional B');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` int(1) NOT NULL,
  `priority` int(1) NOT NULL,
  `user` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `state` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Claim_user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim`
--

LOCK TABLES `claim` WRITE;
/*!40000 ALTER TABLE `claim` DISABLE KEYS */;
INSERT INTO `claim` VALUES (5,0,'Capitan 3 ','Mi capitan 3 era Cauteruccio que es baja por lesion fue reemplazado por Ramirez reasignar a Vietto a capitan 3',0,0,53,'2013-09-13',0);
/*!40000 ALTER TABLE `claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_Club_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (134,0,'Vélez'),(135,0,'Belgrano'),(136,0,'Racing'),(137,0,'Rosario Central'),(138,0,'Arsenal'),(139,0,'Lanús'),(140,0,'Godoy Cruz'),(141,0,'Gimnasia'),(142,0,'Tigre'),(143,0,'San Lorenzo'),(144,0,'Quilmes'),(145,0,'Argentinos'),(146,0,'Boca'),(147,0,'Rafaela'),(148,0,'All Boys'),(149,0,'Olimpo'),(150,0,'Colón'),(151,0,'River'),(152,0,'Newell\'s'),(153,0,'Estudiantes');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,5,'started','0');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_`
--

DROP TABLE IF EXISTS `match_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `week` bigint(20) NOT NULL,
  `homeClub` bigint(20) NOT NULL,
  `awayClub` bigint(20) NOT NULL,
  `homeGoals` int(11) DEFAULT NULL,
  `awayGoals` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Match_week` (`week`),
  KEY `FK_Match_homeClub` (`homeClub`),
  KEY `FK_Match_awayClub` (`awayClub`),
  CONSTRAINT `FK_Match_awayClub` FOREIGN KEY (`awayClub`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Match_homeClub` FOREIGN KEY (`homeClub`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Match_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2658 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_`
--

LOCK TABLES `match_` WRITE;
/*!40000 ALTER TABLE `match_` DISABLE KEYS */;
INSERT INTO `match_` VALUES (2508,2,318,134,146,NULL,NULL,NULL,NULL),(2509,2,318,153,152,NULL,NULL,NULL,NULL),(2510,2,318,147,135,NULL,NULL,NULL,NULL),(2511,2,318,137,150,NULL,NULL,NULL,NULL),(2512,2,318,140,141,NULL,NULL,NULL,NULL),(2513,2,318,151,143,NULL,NULL,NULL,NULL),(2514,2,318,144,142,NULL,NULL,NULL,NULL),(2515,2,318,145,138,NULL,NULL,NULL,NULL),(2516,2,318,136,148,NULL,NULL,NULL,NULL),(2517,3,318,149,139,NULL,NULL,NULL,NULL),(2518,2,319,142,151,NULL,NULL,NULL,NULL),(2519,2,319,143,137,NULL,NULL,NULL,NULL),(2520,2,319,150,140,NULL,NULL,NULL,NULL),(2521,2,319,141,147,NULL,NULL,NULL,NULL),(2522,2,319,135,153,NULL,NULL,NULL,NULL),(2523,3,319,152,134,NULL,NULL,NULL,NULL),(2524,3,319,146,149,NULL,NULL,NULL,NULL),(2525,3,319,139,136,NULL,NULL,NULL,NULL),(2526,2,319,148,145,NULL,NULL,NULL,NULL),(2527,2,319,138,144,NULL,NULL,NULL,NULL),(2528,2,320,136,146,NULL,NULL,NULL,NULL),(2529,2,320,149,152,NULL,NULL,NULL,NULL),(2530,2,320,134,135,NULL,NULL,NULL,NULL),(2531,2,320,153,147,NULL,NULL,NULL,NULL),(2532,2,320,150,141,NULL,NULL,NULL,NULL),(2533,2,320,140,143,NULL,NULL,NULL,NULL),(2534,1,320,137,142,NULL,NULL,NULL,NULL),(2535,2,320,151,138,NULL,NULL,NULL,NULL),(2536,2,320,144,148,NULL,NULL,NULL,NULL),(2537,3,320,145,139,NULL,NULL,NULL,NULL),(2538,2,321,148,151,NULL,NULL,NULL,NULL),(2539,2,321,138,137,NULL,NULL,NULL,NULL),(2540,2,321,142,140,NULL,NULL,NULL,NULL),(2541,3,321,143,150,NULL,NULL,NULL,NULL),(2542,3,321,141,153,NULL,NULL,NULL,NULL),(2543,3,321,147,134,NULL,NULL,NULL,NULL),(2544,2,321,135,149,NULL,NULL,NULL,NULL),(2545,2,321,152,136,NULL,NULL,NULL,NULL),(2546,2,321,146,145,NULL,NULL,NULL,NULL),(2547,2,321,139,144,NULL,NULL,NULL,NULL),(2548,2,322,144,146,NULL,NULL,NULL,NULL),(2549,3,322,145,152,NULL,NULL,NULL,NULL),(2550,2,322,136,135,NULL,NULL,NULL,NULL),(2551,2,322,149,147,NULL,NULL,NULL,NULL),(2552,2,322,134,153,NULL,NULL,NULL,NULL),(2553,2,322,141,143,NULL,NULL,NULL,NULL),(2554,2,322,150,142,NULL,NULL,NULL,NULL),(2555,2,322,140,138,NULL,NULL,NULL,NULL),(2556,2,322,137,148,NULL,NULL,NULL,NULL),(2557,3,322,151,139,NULL,NULL,NULL,NULL),(2558,2,323,146,151,NULL,NULL,NULL,NULL),(2559,2,323,139,137,NULL,NULL,NULL,NULL),(2560,2,323,148,140,NULL,NULL,NULL,NULL),(2561,2,323,138,150,NULL,NULL,NULL,NULL),(2562,2,323,134,141,NULL,NULL,NULL,NULL),(2563,2,323,142,143,NULL,NULL,NULL,NULL),(2564,2,323,153,149,NULL,NULL,NULL,NULL),(2565,2,323,147,136,NULL,NULL,NULL,NULL),(2566,2,323,135,145,NULL,NULL,NULL,NULL),(2567,2,323,152,144,NULL,NULL,NULL,NULL),(2568,2,324,137,146,NULL,NULL,NULL,NULL),(2569,2,324,151,152,NULL,NULL,NULL,NULL),(2570,2,324,144,135,NULL,NULL,NULL,NULL),(2571,2,324,145,147,NULL,NULL,NULL,NULL),(2572,2,324,136,153,NULL,NULL,NULL,NULL),(2573,2,324,149,134,NULL,NULL,NULL,NULL),(2574,2,324,141,142,NULL,NULL,NULL,NULL),(2575,2,324,143,138,NULL,NULL,NULL,NULL),(2576,2,324,150,148,NULL,NULL,NULL,NULL),(2577,2,324,140,139,NULL,NULL,NULL,NULL),(2578,2,325,135,151,NULL,NULL,NULL,NULL),(2579,2,325,152,137,NULL,NULL,NULL,NULL),(2580,2,325,146,140,NULL,NULL,NULL,NULL),(2581,2,325,139,150,NULL,NULL,NULL,NULL),(2582,2,325,149,141,NULL,NULL,NULL,NULL),(2583,2,325,148,143,NULL,NULL,NULL,NULL),(2584,2,325,138,142,NULL,NULL,NULL,NULL),(2585,3,325,134,136,NULL,NULL,NULL,NULL),(2586,2,325,153,145,NULL,NULL,NULL,NULL),(2587,2,325,147,144,NULL,NULL,NULL,NULL),(2588,2,326,150,146,NULL,NULL,NULL,NULL),(2589,2,326,140,152,NULL,NULL,NULL,NULL),(2590,3,326,137,135,NULL,NULL,NULL,NULL),(2591,2,326,151,147,NULL,NULL,NULL,NULL),(2592,2,326,144,153,NULL,NULL,NULL,NULL),(2593,2,326,145,134,NULL,NULL,NULL,NULL),(2594,2,326,136,149,NULL,NULL,NULL,NULL),(2595,2,326,141,138,NULL,NULL,NULL,NULL),(2596,2,326,142,148,NULL,NULL,NULL,NULL),(2597,2,326,143,139,NULL,NULL,NULL,NULL),(2598,2,327,153,151,NULL,NULL,NULL,NULL),(2599,2,327,147,137,NULL,NULL,NULL,NULL),(2600,2,327,135,140,NULL,NULL,NULL,NULL),(2601,2,327,152,150,NULL,NULL,NULL,NULL),(2602,2,327,136,141,NULL,NULL,NULL,NULL),(2603,2,327,146,143,NULL,NULL,NULL,NULL),(2604,2,327,139,142,NULL,NULL,NULL,NULL),(2605,2,327,148,138,NULL,NULL,NULL,NULL),(2606,3,327,149,145,NULL,NULL,NULL,NULL),(2607,2,327,134,144,NULL,NULL,NULL,NULL),(2608,2,328,142,146,NULL,NULL,NULL,NULL),(2609,2,328,143,152,NULL,NULL,NULL,NULL),(2610,2,328,150,135,NULL,NULL,NULL,NULL),(2611,2,328,140,147,NULL,NULL,NULL,NULL),(2612,2,328,137,153,NULL,NULL,NULL,NULL),(2613,2,328,151,134,NULL,NULL,NULL,NULL),(2614,2,328,144,149,NULL,NULL,NULL,NULL),(2615,2,328,145,136,NULL,NULL,NULL,NULL),(2616,2,328,141,148,NULL,NULL,NULL,NULL),(2617,2,328,138,139,NULL,NULL,NULL,NULL),(2618,2,329,149,151,NULL,NULL,NULL,NULL),(2619,2,329,134,137,NULL,NULL,NULL,NULL),(2620,2,329,153,140,NULL,NULL,NULL,NULL),(2621,0,329,147,150,NULL,NULL,NULL,NULL),(2622,2,329,145,141,NULL,NULL,NULL,NULL),(2623,2,329,135,143,NULL,NULL,NULL,NULL),(2624,2,329,152,142,NULL,NULL,NULL,NULL),(2625,2,329,146,138,NULL,NULL,NULL,NULL),(2626,2,329,139,148,NULL,NULL,NULL,NULL),(2627,2,329,136,144,NULL,NULL,NULL,NULL),(2628,2,330,148,146,NULL,NULL,NULL,NULL),(2629,3,330,138,152,NULL,NULL,NULL,NULL),(2630,2,330,142,135,NULL,NULL,NULL,NULL),(2631,2,330,143,147,NULL,NULL,NULL,NULL),(2632,2,330,150,153,NULL,NULL,NULL,NULL),(2633,2,330,140,134,NULL,NULL,NULL,NULL),(2634,2,330,137,149,NULL,NULL,NULL,NULL),(2635,2,330,151,136,NULL,NULL,NULL,NULL),(2636,3,330,144,145,NULL,NULL,NULL,NULL),(2637,2,330,141,139,NULL,NULL,NULL,NULL),(2638,2,331,145,151,NULL,NULL,NULL,NULL),(2639,2,331,136,137,NULL,NULL,NULL,NULL),(2640,2,331,149,140,NULL,NULL,NULL,NULL),(2641,3,331,134,150,NULL,NULL,NULL,NULL),(2642,2,331,144,141,NULL,NULL,NULL,NULL),(2643,2,331,153,143,NULL,NULL,NULL,NULL),(2644,2,331,147,142,NULL,NULL,NULL,NULL),(2645,2,331,135,138,NULL,NULL,NULL,NULL),(2646,2,331,152,148,NULL,NULL,NULL,NULL),(2647,2,331,146,139,NULL,NULL,NULL,NULL),(2648,2,332,141,146,NULL,NULL,NULL,NULL),(2649,3,332,139,152,NULL,NULL,NULL,NULL),(2650,2,332,148,135,NULL,NULL,NULL,NULL),(2651,2,332,138,147,NULL,NULL,NULL,NULL),(2652,2,332,142,153,NULL,NULL,NULL,NULL),(2653,2,332,143,134,NULL,NULL,NULL,NULL),(2654,2,332,150,149,NULL,NULL,NULL,NULL),(2655,2,332,140,136,NULL,NULL,NULL,NULL),(2656,2,332,137,145,NULL,NULL,NULL,NULL),(2657,2,332,151,144,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `match_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `number` int(2) DEFAULT NULL,
  `club` bigint(20) NOT NULL,
  `position` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `selected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Player_club` (`club`),
  KEY `FK_Player_position` (`position`),
  CONSTRAINT `FK_Player_club` FOREIGN KEY (`club`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_Player_position` FOREIGN KEY (`position`) REFERENCES `playerposition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1185 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (488,0,'Maxi','Rodriguez',NULL,152,3,'3',0),(489,0,'Lucas','Pratto',NULL,134,4,'3',0),(490,0,'Ignacio','Piatti',NULL,143,3,'3',0),(491,0,'Juan Roman','Riquelme',NULL,146,3,'3',0),(492,0,'Santiago','Silva',NULL,139,4,'3',0),(493,0,'Juan Sebastian','Veron',NULL,153,3,'3',0),(494,0,'Emmanuel','Gigliotti',NULL,146,4,'3',0),(495,0,'Mauro','Zarate',NULL,134,4,'3',0),(496,0,'Fernando','Cavenaghi',NULL,151,4,'3',0),(497,0,'Fernando','Gago',NULL,146,3,'3',0),(498,0,'Ever','Banega',NULL,152,3,'3',0),(499,0,'Manuel','Lanzini',NULL,151,3,'3',0),(500,0,'Agustin','Orion',NULL,146,1,'3',0),(501,0,'Sebastian','Dominguez',NULL,134,2,'3',0),(502,0,'Angel','Correa',NULL,143,4,'3',0),(503,0,'Paolo Duval','Goltz',NULL,139,2,'3',0),(504,0,'Fernando','Monetti',NULL,141,1,'3',0),(505,0,'Mariano','Echeverria',NULL,138,2,'3',0),(506,0,'Lucas','Licht',NULL,141,2,'3',0),(507,0,'Sebastian','Saja',NULL,136,1,'3',0),(508,0,'Agustin','Marchesin',NULL,139,1,'3',0),(509,0,'Leandro','Romagnoli',NULL,143,3,'3',0),(510,0,'Teofilo','Gutierrez',NULL,151,4,'2',0),(511,0,'David','Trezeguet',NULL,152,4,'2',0),(512,0,'Luciano','Vietto',NULL,136,4,'2',0),(513,0,'Juan Manuel','Martinez',NULL,146,4,'2',0),(514,0,'Mauro','Obolo',NULL,140,4,'2',0),(515,0,'Martin','Cauteruccio',NULL,143,4,'2',0),(516,0,'Mauro','Matos',NULL,143,4,'2',0),(517,0,'Diego','Vera',NULL,147,4,'2',0),(518,0,'Bruno','Zuculini',NULL,136,3,'2',0),(519,0,'Marcelo','Barovero',NULL,151,1,'2',0),(520,0,'Daniel','Diaz',NULL,146,2,'2',0),(521,0,'Gabriel','Heinze',NULL,152,2,'2',0),(522,0,'Carlos','Luna',NULL,137,4,'2',0),(523,0,'Matias','Perez Garcia',NULL,142,3,'2',0),(524,0,'Miguel','Caneo',NULL,144,3,'2',0),(525,0,'Roman','Martinez',NULL,153,3,'2',0),(526,0,'Cesar','Pereyra',NULL,135,4,'2',0),(527,0,'Jorge','Luna',NULL,153,3,'2',0),(528,0,'Juan','Mercier',NULL,143,3,'2',0),(529,0,'Jonathan','Fabbro',NULL,151,3,'2',0),(530,0,'Lucas','Bernardi',NULL,152,3,'2',0),(531,0,'Nestor','Ortigoza',NULL,143,3,'2',0),(532,0,'Cristian','Campestrini',NULL,138,1,'2',0),(533,0,'Gabriel','Mercado',NULL,151,2,'2',0),(534,0,'Diego','Perotti',NULL,146,3,'2',0),(535,0,'Lautaro','Acosta',NULL,139,4,'2',0),(536,0,'Nicolas','Blandi',NULL,143,4,'2',0),(537,0,'Julio','Buffarini',NULL,143,3,'2',0),(538,0,'Gabriel','Hauche',NULL,136,4,'2',0),(539,0,'Pablo','Migliore',NULL,145,1,'2',0),(540,0,'Fernando','Ortiz',NULL,136,2,'2',0),(541,0,'Leonardo','Ponzio',NULL,151,3,'2',0),(542,0,'Sebastian','Sosa',NULL,134,1,'2',0),(543,0,'Leandro','Desabato',NULL,153,2,'2',0),(544,0,'Carlos','Carbonero',NULL,151,3,'2',0),(545,0,'Juan','Forlin',NULL,146,2,'2',0),(546,0,'Carlos','Izquierdoz',NULL,139,2,'2',0),(547,0,'Juan Carlos','Olave',NULL,135,1,'2',0),(548,0,'Alejandro','Donatti',NULL,137,2,'2',0),(549,0,'Guillermo','Farre',NULL,135,3,'2',0),(550,0,'Victor','Lopez',NULL,152,2,'2',0),(551,0,'Emiliano','Papa',NULL,134,2,'2',0),(552,0,'Martin','Rolle',NULL,138,3,'2',0),(553,0,'Jose Luis','Fernandez',NULL,140,3,'2',0),(554,0,'Victor','Figueroa',NULL,152,3,'2',0),(555,0,'Nahuel','Guzman',NULL,152,1,'2',0),(556,0,'Emmanuel','Mas',NULL,143,2,'2',0),(557,0,'Ismael','Blanco',NULL,139,4,'2',0),(558,0,'Diego','Braghieri',NULL,138,2,'2',0),(559,0,'Marcos','Cáceres',NULL,152,2,'2',0),(560,0,'Mauro','Camoranesi',NULL,136,3,'2',0),(561,0,'Alexis N.','Castro',NULL,152,3,'2',0),(562,0,'Hernan','Encina',NULL,137,3,'2',0),(563,0,'Patricio','Rodriguez',NULL,153,3,'2',0),(564,0,'Fernando','Tobio',NULL,134,2,'2',0),(565,0,'Matias','Cahais',NULL,136,2,'2',0),(566,0,'Paulo','Ferrari',NULL,137,2,'2',0),(567,0,'Jorge','Velazquez',NULL,135,3,'2',0),(568,0,'Valentin','Viola',NULL,136,4,'2',0),(569,0,'Eder','Alvarez Balanta',NULL,151,2,'2',0),(570,0,'Mauricio','Caranta',NULL,137,1,'2',0),(571,0,'Franco','Mussis',NULL,141,3,'2',0),(572,0,'Ariel','Rojas',NULL,151,3,'2',0),(573,0,'Diego','Villar',NULL,136,3,'2',0),(574,0,'Gonzalo','Castellani',NULL,140,3,'2',0),(575,0,'Roberto','Nanni',NULL,134,4,'2',0),(576,0,'Leonardo','Sigali',NULL,140,2,'2',0),(577,0,'Sebastian','Torrico',NULL,143,1,'2',0),(578,0,'Pablo','Alvarado',NULL,143,2,'2',0),(579,0,'Rodrigo','Braña',NULL,144,3,'2',0),(580,0,'Sebastian','Rusculleda',NULL,142,3,'2',0),(581,0,'Juan M.','Sanchez Miño',NULL,146,3,'2',0),(582,0,'Leonel','Vangioni',NULL,151,3,'2',0),(583,0,'Maxi','Velazquez',NULL,139,2,'2',0),(584,0,'Nicolas','Aguirre',NULL,138,3,'2',0),(585,0,'Guillermo','Burdisso',NULL,146,2,'2',0),(586,0,'Nicolas','Cambiasso',NULL,148,1,'2',0),(587,0,'Milton','Casco',NULL,152,2,'2',0),(588,0,'Mauro','Cetto',NULL,143,2,'2',0),(589,0,'Fabian','Cubero',NULL,134,2,'2',0),(590,0,'Esteban','Gonzalez',NULL,135,3,'2',0),(591,0,'Lucas','Landa',NULL,150,2,'2',0),(592,0,'Pablo','Ledesma',NULL,146,3,'2',0),(593,0,'Jonatan','Maidana',NULL,151,2,'2',0),(594,0,'Jesus','Mendez',NULL,137,3,'2',0),(595,0,'Facundo','Pereyra',NULL,141,4,'2',0),(596,0,'Leandro','Somoza',NULL,139,3,'2',0),(597,0,'Osvaldo','Barsottini',NULL,141,2,'2',0),(598,0,'Facundo','Castillon',NULL,140,4,'2',0),(599,0,'Santiago','Gentiletti',NULL,143,2,'2',0),(600,0,'Jorge','Ortiz',NULL,139,3,'2',0),(601,0,'Victor','Ayala',NULL,139,3,'2',0),(602,0,'Juan Carlos','Blengio',NULL,141,2,'2',0),(603,0,'Ignacio','Fernandez',NULL,141,3,'2',0),(604,0,'Diego','Mateo',NULL,152,3,'2',0),(605,0,'Carlos','Araujo',NULL,139,2,'2',0),(606,0,'Diego','Castaño',NULL,142,3,'2',0),(607,0,'Ramiro','Funes Mori',NULL,151,2,'2',0),(608,0,'German','Montoya',NULL,150,1,'2',0),(609,0,'Hugo Martin','Nervo',NULL,138,2,'2',0),(610,0,'Leonardo','Pisculichi',NULL,145,4,'2',0),(611,0,'Jacobo','Mansilla',NULL,150,3,'2',0),(612,0,'Martin','Perez Guedes',NULL,149,3,'2',0),(613,0,'Oscar','Ahumada',NULL,148,3,'2',0),(614,0,'Adrian','Bastia',NULL,147,3,'2',0),(615,0,'Federico','Carrizo',NULL,137,3,'2',0),(616,0,'Gonzalo','Castillejos',NULL,137,4,'2',0),(617,0,'Javier','Garcia',NULL,142,1,'2',0),(618,0,'Franco','Jara',NULL,153,4,'2',0),(619,0,'Enzo','Kalinski',NULL,143,3,'2',0),(620,0,'Cristian','Ledesma',NULL,151,3,'2',0),(621,0,'Antonio','Medina',NULL,137,4,'2',0),(622,0,'Nicolas','Olmedo',NULL,145,3,'2',0),(623,0,'Gabriel','Peñalba',NULL,142,3,'2',0),(624,0,'German','Re',NULL,153,2,'2',0),(625,0,'Emilio','Zelaya',NULL,138,4,'2',0),(626,0,'Franco','Zuculini',NULL,138,3,'2',0),(627,0,'Cristian','Alvarez',NULL,143,1,'2',0),(628,0,'Carlos','Bueno',NULL,135,4,'2',0),(629,0,'Facundo','Coria',NULL,145,4,'2',0),(630,0,'Nery','Dominguez',NULL,137,3,'2',0),(631,0,'Federico','Lertora',NULL,140,3,'2',0),(632,0,'Luciano','Lollo',NULL,135,2,'2',0),(633,0,'Lucas','Albertengo',NULL,147,4,'2',0),(634,0,'Javier','Campora',NULL,148,4,'2',0),(635,0,'Claudio','Perez',NULL,146,2,'2',0),(636,0,'Omar','Pouso',NULL,141,3,'2',0),(637,0,'Francisco','Cerro',NULL,136,3,'2',0),(638,0,'Julio','Furch',NULL,138,4,'2',0),(639,0,'Leandro','Grimi',NULL,140,2,'2',0),(640,0,'Hector','Canteros',NULL,134,3,'2',0),(641,0,'Rodrigo','De Paul',NULL,136,3,'2',0),(642,0,'Juan','Eluchans',NULL,147,3,'2',0),(643,0,'Cristian','Erbes',NULL,146,3,'2',0),(644,0,'Adrian','Gabbarini',NULL,152,1,'2',0),(645,0,'Ariel','Garce',NULL,147,2,'2',0),(646,0,'Marcos','Gelabert',NULL,142,3,'2',0),(647,0,'Ivan','Marcone',NULL,138,3,'2',0),(648,0,'Sebastian','Romero',NULL,144,3,'2',0),(649,0,'Geronimo','Rulli',NULL,153,1,'2',0),(650,0,'Guido','Carrillo',NULL,153,4,'2',0),(651,0,'Hernan','Villalba',NULL,152,3,'2',0),(652,0,'Alejandro','Cabral',NULL,134,3,'2',0),(653,0,'Rodrigo','Depetris',NULL,147,3,'2',0),(654,0,'Dario','Gandin',NULL,150,4,'2',0),(655,0,'Diego','Gonzalez',NULL,139,3,'2',0),(656,0,'Gabriel','Graciani',NULL,150,3,'2',0),(657,0,'Leonardo','Jara',NULL,153,3,'2',0),(658,0,'Roberto','Battion',NULL,148,3,'2',0),(659,0,'Maximiliano','Caire',NULL,150,2,'2',0),(660,0,'Alejandro','Silva',NULL,139,3,'2',0),(661,0,'Juan I.','Cavallaro',NULL,143,3,'2',0),(662,0,'Agustin','Allione',NULL,134,3,'2',0),(663,0,'Gaston','Gil Romero',NULL,153,3,'2',0),(664,0,'Gonzalo','Espinoza',NULL,148,3,'2',0),(665,0,'German','Pezzella',NULL,151,2,'2',0),(666,0,'Claudio','Kranevitter',NULL,151,3,'2',0),(667,0,'Lisandro','Magallan',NULL,137,2,'2',0),(668,0,'Jonathan','Silva',NULL,153,2,'2',0),(669,0,'Gaston','Campi',NULL,136,2,'2',0),(670,0,'Luciano','Acosta',NULL,146,3,'2',0),(671,0,'Sebastian','Abreu',NULL,137,4,'1',0),(672,0,'Joaquin','Boghossian',NULL,144,4,'1',0),(673,0,'Franco','Niell',NULL,137,4,'1',0),(674,0,'Ivan','Borghello',NULL,141,4,'1',0),(675,0,'Jose','Sand',NULL,142,4,'1',0),(676,0,'Martin','Tonso',NULL,152,3,'1',0),(677,0,'Federico','Rasic',NULL,141,4,'1',0),(678,0,'Andres','Rodales',NULL,147,2,'1',0),(679,0,'Osmar','Ferreyra',NULL,151,3,'1',0),(680,0,'Sebastian','Peratta',NULL,144,1,'1',0),(681,0,'Mauricio','Sperduti',NULL,138,4,'1',0),(682,0,'Sebastian','Carrera',NULL,135,3,'1',0),(683,0,'Leandro','Benitez',NULL,144,3,'1',0),(684,0,'Nicolas','Cabrera',NULL,148,3,'1',0),(685,0,'Carlos','Casteglione',NULL,148,2,'1',0),(686,0,'Ezequiel','Cerutti',NULL,149,4,'1',0),(687,0,'Ivan','Furios',NULL,149,2,'1',0),(688,0,'Federico','Gonzalez',NULL,147,4,'1',0),(689,0,'Walter','Kannemann',NULL,143,2,'1',0),(690,0,'Ramiro','Leone',NULL,142,3,'1',0),(691,0,'Ezequiel','Maggiolo',NULL,135,4,'1',0),(692,0,'Wason','Renteria',NULL,136,4,'1',0),(693,0,'Lucas','Aveldano',NULL,135,2,'1',0),(694,0,'Juan','Sabia',NULL,134,2,'1',0),(695,0,'Carlos','Valdes',NULL,143,2,'1',0),(696,0,'Nereo','Champagne',NULL,149,1,'1',0),(697,0,'Fabricio','Fontanini',NULL,143,2,'1',0),(698,0,'Mariano','Gonzalez',NULL,153,3,'1',0),(699,0,'Nelson','Ibañez',NULL,136,1,'1',0),(700,0,'Juan C.','Menseguez',NULL,151,4,'1',0),(701,0,'Gonzalo','Prosperi',NULL,143,2,'1',0),(702,0,'Gonzalo','Veron',NULL,143,4,'1',0),(703,0,'Ariel Matias','Garcia',NULL,141,3,'1',0),(704,0,'Lucas','Melano',NULL,139,4,'1',0),(705,0,'Damian','Musto',NULL,149,3,'1',0),(706,0,'Horacio','Orzan',NULL,152,3,'1',0),(707,0,'Claudio','Riano',NULL,146,4,'1',0),(708,0,'Nicolas','Sanchez',NULL,140,2,'1',0),(709,0,'Daniel','Villalva',NULL,151,4,'1',0),(710,0,'Nahuel','Benitez',NULL,149,4,'1',0),(711,0,'Jorge','Carranza',NULL,140,1,'1',0),(712,0,'Hernan','Grana',NULL,146,2,'1',0),(713,0,'Matias','Aguirregaray',NULL,153,2,'1',0),(714,0,'Gerardo','Alcoba',NULL,150,2,'1',0),(715,0,'Hernan','Boyero',NULL,145,4,'1',0),(716,0,'Facundo','Curuchet',NULL,150,4,'1',0),(717,0,'Rodrigo','Erramuspe',NULL,147,2,'1',0),(718,0,'Emanuel','Insua',NULL,146,2,'1',0),(719,0,'Damian','Manso',NULL,152,3,'1',0),(720,0,'Fernando','Marquez',NULL,135,4,'1',0),(721,0,'Matias','Martinez',NULL,139,2,'1',0),(722,0,'Sebastian','Martinez',NULL,144,2,'1',0),(723,0,'Nestor','Moiraghi',NULL,149,2,'1',0),(724,0,'Luis','Ojeda',NULL,145,1,'1',0),(725,0,'Damian','Perez',NULL,138,2,'1',0),(726,0,'Jose','San Roman',NULL,140,2,'1',0),(727,0,'Bruno','Urribarri',NULL,151,2,'1',0),(728,0,'Pablo','Vitti',NULL,142,4,'1',0),(729,0,'Milton','Caraglio',NULL,138,4,'1',0),(730,0,'Eduardo','Casais',NULL,138,2,'1',0),(731,0,'Esteban','Conde',NULL,147,1,'1',0),(732,0,'Cristian','Diaz',NULL,152,2,'1',0),(733,0,'Francisco','Dutari',NULL,137,2,'1',0),(734,0,'Diego','Ferreira',NULL,147,3,'1',0),(735,0,'Pablo','Luguercio',NULL,149,4,'1',0),(736,0,'Facundo','Oreja',NULL,141,2,'1',0),(737,0,'Jonathan','Schunke',NULL,153,2,'1',0),(738,0,'Pablo','Garnier',NULL,144,3,'1',0),(739,0,'Leonardo','Gil',NULL,149,3,'1',0),(740,0,'Oscar A.','Limia',NULL,138,1,'1',0),(741,0,'Cesar','Mansanelli',NULL,147,3,'1',0),(742,0,'Sergio','Rodriguez',NULL,135,2,'1',0),(743,0,'Matias','Sarulyte',NULL,149,2,'1',0),(744,0,'Ignacio','Fideleff',NULL,142,2,'1',0),(745,0,'Rodrigo','Gomez',NULL,145,3,'1',0),(746,0,'Leandro','Gonzalez Pirez',NULL,138,2,'1',0),(747,0,'Luis','Peralta',NULL,141,4,'1',0),(748,0,'Gustavo','Bou',NULL,141,4,'1',0),(749,0,'Santiago','Naguel',NULL,145,3,'1',0),(750,0,'Maxi','Pellegrino',NULL,148,2,'1',0),(751,0,'David','Vega',NULL,149,3,'1',0),(752,0,'Luciano','Abecasis',NULL,144,2,'1',0),(753,0,'Facundo','Affranchino',NULL,135,3,'1',0),(754,0,'Martin','Aguirre',NULL,151,3,'1',0),(755,0,'Damian','Albil',NULL,142,1,'1',0),(756,0,'Pablo','Barzola',NULL,145,2,'1',0),(757,0,'Marcelo','Bustamante',NULL,148,2,'1',0),(758,0,'Joel','Carli',NULL,144,2,'1',0),(759,0,'Claudio','Corvalan',NULL,136,2,'1',0),(760,0,'Jorge','Curbelo',NULL,140,2,'1',0),(761,0,'Rafael','Delgado',NULL,137,2,'1',0),(762,0,'Leandro','Diaz Borsani',NULL,144,3,'1',0),(763,0,'A. Gaston','Diaz',NULL,142,3,'1',0),(764,0,'Nereo','Fernandez',NULL,145,1,'1',0),(765,0,'Federico','Freire',NULL,138,3,'1',0),(766,0,'Gaspar','Iniguez',NULL,145,3,'1',0),(767,0,'Damian','Leyes',NULL,144,2,'1',0),(768,0,'Adrian','Martinez',NULL,149,2,'1',0),(769,0,'Ezequiel','Miralles',NULL,149,4,'1',0),(770,0,'Gustavo','Oberman',NULL,149,3,'1',0),(771,0,'Jose Luis','Palomino',NULL,145,2,'1',0),(772,0,'Ismael','Quilez',NULL,136,2,'1',0),(773,0,'Juan','Quiroga',NULL,135,2,'1',0),(774,0,'Matias','Sanchez',NULL,138,3,'1',0),(775,0,'Emanuel','Tripodi',NULL,146,1,'1',0),(776,0,'Gaston','Turus',NULL,135,2,'1',0),(777,0,'Hector','Villalba',NULL,143,4,'1',0),(778,0,'Cristian','Villanueva',NULL,149,2,'1',0),(779,0,'Lucas','Acosta',NULL,150,3,'1',0),(780,0,'Lucas','Bovaglio',NULL,147,2,'1',0),(781,0,'Guillermo','Cosaro',NULL,142,2,'1',0),(782,0,'Marcos','Figueroa',NULL,147,4,'1',0),(783,0,'Matias','Fissore',NULL,147,3,'1',0),(784,0,'Juan Manuel','Olivera',NULL,153,4,'1',0),(785,0,'Sergio','Araujo',NULL,142,4,'1',0),(786,0,'Carlos','Auzqui',NULL,153,4,'1',0),(787,0,'Julio','Barraza',NULL,145,2,'1',0),(788,0,'Jonathan','Blanco',NULL,149,3,'1',0),(789,0,'Leandro','Chichizola',NULL,151,1,'1',0),(790,0,'Israel','Damonte',NULL,153,3,'1',0),(791,0,'Ernesto','Goñi',NULL,153,2,'1',0),(792,0,'Santiago','Ladino',NULL,148,2,'1',0),(793,0,'Fernando','Meza',NULL,149,2,'1',0),(794,0,'Leonardo','Miglionico',NULL,136,2,'1',0),(795,0,'Fausto','Montero',NULL,138,3,'1',0),(796,0,'Matias','Perez Laborda',NULL,144,2,'1',0),(797,0,'Walter','Serrano',NULL,145,3,'1',0),(798,0,'Nicolas','Colazo',NULL,146,3,'1',0),(799,0,'Guillermo','Ortiz',NULL,152,2,'1',0),(800,0,'Agustin','Torassa',NULL,148,4,'1',0),(801,0,'German','Voboril',NULL,143,2,'1',0),(802,0,'Martin','Zbrun',NULL,147,2,'1',0),(803,0,'Alejandro','Barbaro',NULL,148,3,'1',0),(804,0,'Cristian','Canuhe',NULL,147,3,'1',0),(805,0,'Jose Erik','Correa',NULL,141,4,'1',0),(806,0,'Manuel','Garcia',NULL,137,1,'1',0),(807,0,'Maximiliano','Meza',NULL,141,3,'1',0),(808,0,'Nicolas','Pasquini',NULL,139,3,'1',0),(809,0,'Giovanni','Simeone',NULL,151,4,'1',0),(810,0,'Lucas','Wilchez',NULL,142,3,'1',0),(811,0,'Diego','Barisone',NULL,145,2,'1',0),(812,0,'Leandro','Barrera',NULL,145,4,'1',0),(813,0,'Oscar','Benitez',NULL,139,3,'1',0),(814,0,'Javier','Carrasco',NULL,142,3,'1',0),(815,0,'R. Gaston','Diaz',NULL,141,2,'1',0),(816,0,'Facundo','Diz',NULL,144,4,'1',0),(817,0,'Fernando','Elizari',NULL,143,3,'1',0),(818,0,'Gaston','Esmerado',NULL,138,3,'1',0),(819,0,'Alvaro','Fernandez',NULL,141,3,'1',0),(820,0,'Carlos','Luque',NULL,150,4,'1',0),(821,0,'Nicolas','Navarro',NULL,142,1,'1',0),(822,0,'Martin','Perafan',NULL,134,1,'1',0),(823,0,'Diego','Rivero',NULL,146,3,'1',0),(824,0,'Diego','Rodriguez',NULL,140,3,'1',0),(825,0,'Lucas','Rodriguez',NULL,145,2,'1',0),(826,0,'Joel','Sacks',NULL,147,2,'1',0),(827,0,'Facundo','Sanchez',NULL,142,3,'1',0),(828,0,'Fernando','Sanchez',NULL,148,3,'1',0),(829,0,'Cristian','Trombetta',NULL,149,2,'1',0),(830,0,'Jose','Valencia',NULL,149,4,'1',0),(831,0,'Pablo','Bangardino',NULL,141,1,'1',0),(832,0,'Alejandro','Barbaro',NULL,134,3,'1',0),(833,0,'Pablo','Becker',NULL,137,3,'1',0),(834,0,'Oliver','Benitez',NULL,141,2,'1',0),(835,0,'Jose C.','Fernandez',NULL,145,4,'1',0),(836,0,'Dardo','Miloc',NULL,141,3,'1',0),(837,0,'Wilfredo','Olivera',NULL,144,2,'1',0),(838,0,'Jonathan','Ramis',NULL,140,4,'1',0),(839,0,'Lucas','Romero',NULL,134,3,'1',0),(840,0,'Fernando','Telechea',NULL,144,4,'1',0),(841,0,'Jonathan','Zacaria',NULL,144,3,'1',0),(842,0,'Luciano','Aued',NULL,136,3,'1',0),(843,0,'Guillermo','Fernandez',NULL,146,3,'1',0),(844,0,'Cristian','Garcia',NULL,140,4,'1',0),(845,0,'Luis','Jerez Silva',NULL,140,3,'1',0),(846,0,'Lucas','Mancinelli',NULL,139,2,'1',0),(847,0,'Leandro','Navarro',NULL,143,3,'1',0),(848,0,'Joaquin','Romea',NULL,141,4,'1',0),(849,0,'Jorge','Serrano',NULL,144,2,'1',0),(850,0,'Miguel','Torren',NULL,145,2,'1',0),(851,0,'Fernando','Barrientos',NULL,139,3,'1',0),(852,0,'Pier','Barrios',NULL,135,2,'1',0),(853,0,'Lucas','Ceballos',NULL,140,2,'1',0),(854,0,'Maximiliano','Coronel',NULL,141,2,'1',0),(855,0,'Martin','Gimenez',NULL,144,3,'1',0),(856,0,'Dylan','Gissi',NULL,149,2,'1',0),(857,0,'Esteban','Saveljich',NULL,136,2,'1',0),(858,0,'Jonatan','Schulze',NULL,137,2,'1',0),(859,0,'Matias','Ballini',NULL,137,3,'1',0),(860,0,'Raul','Becerra',NULL,145,4,'1',0),(861,0,'Ignacio','Canuto',NULL,142,2,'1',0),(862,0,'Juan','Garro',NULL,140,4,'1',0),(863,0,'Luis','Ibanez',NULL,136,2,'1',0),(864,0,'Reinaldo','Lenis Montes',NULL,145,3,'1',0),(865,0,'Leandro','Marin',NULL,146,2,'1',0),(866,0,'Ariel','Nahuelpan',NULL,142,4,'1',0),(867,0,'Juan E.','Ramirez',NULL,145,3,'1',0),(868,0,'Leandro','Velazquez',NULL,134,3,'1',0),(869,0,'Sergio','Vittor',NULL,145,3,'1',0),(870,0,'Juan I.','Alvacete',NULL,142,2,'1',0),(871,0,'Lucas','Cano',NULL,145,4,'1',0),(872,0,'Gonzalo','Diaz',NULL,140,3,'1',0),(873,0,'Silvio','Dulcich',NULL,144,1,'1',0),(874,0,'Nicolas','Freire',NULL,145,2,'1',0),(875,0,'Jonatan','Gomez',NULL,138,3,'1',0),(876,0,'Jose Luis','Gomez',NULL,136,2,'1',0),(877,0,'Franco','Lazzaroni',NULL,152,2,'1',0),(878,0,'Cristian','Lema',NULL,144,2,'1',0),(879,0,'Juan Manuel','Lucero',NULL,144,4,'1',0),(880,0,'Fabian','Munoz',NULL,152,4,'1',0),(881,0,'Jorge','Pereyra Diaz',NULL,139,4,'1',0),(882,0,'Emmanuel','Pio',NULL,142,3,'1',0),(883,0,'Jose','Ramirez Agudelo',NULL,138,2,'1',0),(884,0,'Julio','Rodriguez',NULL,140,4,'1',0),(885,0,'Brian','Sarmiento',NULL,148,3,'1',0),(886,0,'Agustin','Silva',NULL,153,1,'1',0),(887,0,'Ezequiel','Videla',NULL,150,3,'1',0),(888,0,'Nahuel','Zarate',NULL,146,2,'1',0),(889,0,'Claudio','Aquino',NULL,140,3,'1',0),(890,0,'Nicolas','Benavidez',NULL,141,2,'1',0),(891,0,'Cristian','Bordacahar',NULL,142,4,'1',0),(892,0,'Gianmarco','Gambetta',NULL,145,2,'1',0),(893,0,'Matias','Zaldivia',NULL,138,2,'1',0),(894,0,'Fernando','Zuqui',NULL,140,3,'1',0),(895,0,'Diego','Caballero',NULL,142,4,'1',0),(896,0,'Ramiro','Carrera',NULL,138,3,'1',0),(897,0,'Luis','Castillo',NULL,150,2,'1',0),(898,0,'Lucas','Janson',NULL,142,4,'1',0),(899,0,'Alexis','Niz',NULL,147,2,'1',0),(900,0,'Lucas','Pittinari',NULL,135,3,'1',0),(901,0,'Fabricio','Angileri',NULL,140,3,'1',0),(902,0,'Julian','Fernandez',NULL,147,2,'1',0),(903,0,'Ezequiel','Melillo',NULL,136,3,'1',0),(904,0,'Augusto','Solari',NULL,151,3,'1',0),(905,0,'David','Achucarro',NULL,140,2,'1',0),(906,0,'Walter','Acuna',NULL,137,4,'1',0),(907,0,'Alan','Alegre',NULL,144,2,'1',0),(908,0,'Esteban','Andrada',NULL,139,1,'1',0),(909,0,'Emiliano','Ellacopulos',NULL,142,4,'1',0),(910,0,'Brian','Ferreira',NULL,134,3,'1',0),(911,0,'Franco','Flores',NULL,145,2,'1',0),(912,0,'Alvaro','Klusener',NULL,153,4,'1',0),(913,0,'Alan','Aguerre',NULL,134,1,'1',0),(914,0,'Cristian M.','Alvarez',NULL,148,3,'1',0),(915,0,'Federico','Andrada',NULL,151,4,'1',0),(916,0,'Joaquin','Arzura',NULL,142,3,'1',0),(917,0,'Nicolas','Batista',NULL,145,2,'1',0),(918,0,'Matias','Catalan',NULL,143,2,'1',0),(919,0,'Joaquin','Correa',NULL,153,3,'1',0),(920,0,'Leandro L.','Desabato',NULL,134,3,'1',0),(921,0,'Francisco','Martinez',NULL,147,2,'1',0),(922,0,'Pablo','Pavetti',NULL,147,3,'1',0),(923,0,'Dario','Stefanatto',NULL,148,3,'1',0),(924,0,'Dario','Capogrosso',NULL,149,1,'1',0),(925,0,'Lucas','Alario',NULL,150,4,'1',0),(926,0,'Andres','Bailo',NULL,150,1,'1',0),(927,0,'Mariano','Bittolo',NULL,150,2,'1',0),(928,0,'Facundo','Cardozo',NULL,134,2,'1',0),(929,0,'Ramiro','Caseres',NULL,134,4,'1',0),(930,0,'Leandro','Corulo',NULL,141,2,'1',0),(931,0,'Cesar','Meli',NULL,150,3,'1',0),(932,0,'Lucas','Zelarrayan',NULL,135,3,'1',0),(933,0,'Leonel','Aguirre Avalo',NULL,137,3,'1',0),(934,0,'Leonel','Bontempo',NULL,144,2,'1',0),(935,0,'Pedro','Diehl',NULL,148,4,'1',0),(936,0,'Erik','Godoy',NULL,142,2,'1',0),(937,0,'Gabriel','Hachen',NULL,152,4,'1',0),(938,0,'Kevin','Itabel',NULL,142,4,'1',0),(939,0,'Nehuen','Paz',NULL,148,2,'1',0),(940,0,'Cristian','Sain',NULL,150,2,'1',0),(941,0,'German','Vouilloud',NULL,140,1,'1',0),(942,0,'Federico','Bravo',NULL,146,3,'1',0),(943,0,'Julian','Cardozo',NULL,138,3,'1',0),(944,0,'Marcos','Fernandez',NULL,150,3,'1',0),(945,0,'Juan','Maldonado',NULL,135,3,'1',0),(946,0,'Lucas','Acevedo',NULL,137,2,'1',0),(947,0,'Marcelo','Arguello',NULL,150,4,'1',0),(948,0,'Sebastian','D\'Angelo',NULL,146,1,'1',0),(949,0,'Juan I.','Dinenno',NULL,136,4,'1',0),(950,0,'Leonardo','Ferreyra',NULL,149,3,'1',0),(951,0,'Orlando','Gaona Lugo',NULL,149,4,'1',0),(952,0,'Angel A.','Garcia',NULL,136,2,'1',0),(953,0,'Lautaro','Giannetti',NULL,134,2,'1',0),(954,0,'Federico','Jourdan',NULL,150,3,'1',0),(955,0,'Lucas','Lazo',NULL,137,2,'1',0),(956,0,'Bernardo','Leyenda',NULL,148,1,'1',0),(957,0,'Adrian','Toloza',NULL,144,4,'1',0),(958,0,'Francesco','Celeste',NULL,146,3,'1',0),(959,0,'Rodrigo','Contreras',NULL,143,4,'1',0),(960,0,'Federico','Flores',NULL,137,3,'1',0),(961,0,'Arnaldo','Gonzalez',NULL,144,3,'1',0),(962,0,'Rodrigo','Manera',NULL,147,1,'1',0),(963,0,'Facundo','Monteseirin',NULL,139,2,'1',0),(964,0,'Sebastian','Moyano',NULL,140,1,'1',0),(965,0,'Emiliano','Rigoni',NULL,135,3,'1',0),(966,0,'Marcos','Astina',NULL,139,3,'1',0),(967,0,'Giuliano','Bardin',NULL,135,4,'1',0),(968,0,'Gonzalo','Escalante',NULL,146,3,'1',0),(969,0,'Julian R.','Fernandez',NULL,148,3,'1',0),(970,0,'Diego','Fuentes',NULL,148,2,'1',0),(971,0,'Pablo','Gaitan',NULL,147,3,'1',0),(972,0,'Cristian','Godoy',NULL,137,2,'1',0),(973,0,'Eugenio','Isnaldo',NULL,152,3,'1',0),(974,0,'Franco','Leys',NULL,150,3,'1',0),(975,0,'Roger','Martinez',NULL,136,4,'1',0),(976,0,'Lucas','Menossi',NULL,142,3,'1',0),(977,0,'Matias','Morales',NULL,144,3,'1',0),(978,0,'Leandro','Olivares',NULL,140,2,'1',0),(979,0,'Marcos Leonel','Perez',NULL,152,3,'1',0),(980,0,'Javier','Reina Calvo',NULL,149,3,'1',0),(981,0,'Sebastian','Rincon',NULL,142,4,'1',0),(982,0,'Renzo','Saravia',NULL,135,2,'1',0),(983,0,'Fabio','Vazquez',NULL,145,3,'1',0),(984,0,'Juan','Vieyra',NULL,152,3,'1',0),(985,0,'Agustin','Vuletich',NULL,149,4,'1',0),(986,0,'Jonathan','Calleri',NULL,148,4,'1',0),(987,0,'Martin','Comachi',NULL,150,4,'1',0),(988,0,'Esteban','Espindola Lopez',NULL,147,2,'1',0),(989,0,'Sergio','Hipperdinger',NULL,144,4,'1',0),(990,0,'Javier','Mendoza',NULL,141,3,'1',0),(991,0,'Dimas','Morales',NULL,147,3,'1',0),(992,0,'Lucas','Perez Godoy',NULL,144,3,'1',0),(993,0,'Eduardo','Pucheta',NULL,134,3,'1',0),(994,0,'Joel','Rodriguez',NULL,146,2,'1',0),(995,0,'Leonardo','Rolheiser',NULL,136,3,'1',0),(996,0,'Pablo','Rosales',NULL,153,2,'1',0),(997,0,'Jorge','Valdez Chamorro',NULL,139,4,'1',0),(998,0,'Jonathan','Valle',NULL,152,2,'1',0),(999,0,'Ezequiel','Barabas',NULL,148,3,'1',0),(1000,0,'Juan Manuel','Barrera',NULL,140,2,'1',0),(1001,0,'Tomas','Berra',NULL,137,2,'1',0),(1002,0,'Emanuel','Bilbao',NULL,149,1,'1',0),(1003,0,'Luciano','Cabral',NULL,145,3,'1',0),(1004,0,'Franco','Fragapane',NULL,146,4,'1',0),(1005,0,'Santiago','Gallucci Otero',NULL,140,3,'1',0),(1006,0,'Santiago','Leguiza',NULL,141,2,'1',0),(1007,0,'Martin','Lincopan',NULL,149,3,'1',0),(1008,0,'Gabriel','Lopez',NULL,148,3,'1',0),(1009,0,'Juan Manuel','Marital',NULL,140,2,'1',0),(1010,0,'Eros','Medaglia',NULL,134,2,'1',0),(1011,0,'Alan','Aguirre',NULL,146,2,'1',0),(1012,0,'Mariano','Almandoz',NULL,145,2,'1',0),(1013,0,'Ignacio','Bailone',NULL,139,4,'1',0),(1014,0,'Walter','Benitez',NULL,144,1,'1',0),(1015,0,'Juan','Careaga',NULL,148,3,'1',0),(1016,0,'German','Conti',NULL,150,2,'1',0),(1017,0,'Agustin','Cousillas',NULL,142,1,'1',0),(1018,0,'Lautaro','Fernandez',NULL,148,4,'1',0),(1019,0,'Nicolas','Ferreyra',NULL,135,2,'1',0),(1020,0,'Elias','Gomez',NULL,137,2,'1',0),(1021,0,'Nicolas','Gomez',NULL,151,3,'1',0),(1022,0,'Martin','Guzzi',NULL,149,3,'1',0),(1023,0,'Guillermo','Hauche',NULL,136,3,'1',0),(1024,0,'Juan Pablo','Heredia',NULL,135,1,'1',0),(1025,0,'Jeremias','Ledesma',NULL,137,1,'1',0),(1026,0,'Nahuel','Losada',NULL,153,1,'1',0),(1027,0,'Tomas','Martinez',NULL,151,3,'1',0),(1028,0,'Ezequiel','Mastrolia',NULL,143,1,'1',0),(1029,0,'Andres','Mehrig',NULL,150,1,'1',0),(1030,0,'Federico','Milo',NULL,138,3,'1',0),(1031,0,'Martin','Perez Acuna',NULL,134,2,'1',0),(1032,0,'Juan','Perotti',NULL,153,4,'1',0),(1033,0,'Franco','Piergiacomi',NULL,153,3,'1',0),(1034,0,'Maxi','Pollacchi',NULL,152,2,'1',0),(1035,0,'Ezequiel','Ponce',NULL,152,4,'1',0),(1036,0,'Matias','Presentado',NULL,153,2,'1',0),(1037,0,'Ignacio','Pusetto',NULL,147,4,'1',0),(1038,0,'Marcos','Rivadero',NULL,135,3,'1',0),(1039,0,'Javier','Sequeyra',NULL,153,3,'1',0),(1040,0,'Matias','Sosa',NULL,150,3,'1',0),(1041,0,'Ignacio','Torres',NULL,149,1,'1',0),(1042,0,'Jonathan','Torres',NULL,144,4,'1',0),(1043,0,'Guido','Vadala',NULL,146,4,'1',0),(1044,0,'Lucas','Vesco',NULL,142,2,'1',0),(1045,0,'Bruno','Vides',NULL,139,4,'1',0),(1046,0,'Gustavo','Villarruel',NULL,150,4,'1',0),(1047,0,'Leonardo','Alvarado',NULL,144,2,'1',0),(1048,0,'Alexis','Arias',NULL,141,1,'1',0),(1049,0,'Lucas','Asconape',NULL,145,4,'1',0),(1050,0,'Nicolas','Avellaneda',NULL,139,1,'1',0),(1051,0,'Enzo','Beloso',NULL,152,2,'1',0),(1052,0,'Dino','Castagno',NULL,146,2,'1',0),(1053,0,'Jonathan','Cerutti',NULL,144,4,'1',0),(1054,0,'Francisco','Di Franco',NULL,146,4,'1',0),(1055,0,'Sebastian','Giovini',NULL,145,1,'1',0),(1056,0,'Leonel','Gonzalez',NULL,152,2,'1',0),(1057,0,'Marcelo','Herrera',NULL,139,2,'1',0),(1058,0,'Juan Cruz','Kaprof',NULL,151,4,'1',0),(1059,0,'Ignacio','Lachalde',NULL,141,3,'1',0),(1060,0,'Damian','Morales',NULL,148,3,'1',0),(1061,0,'Juan','Musso',NULL,136,1,'1',0),(1062,0,'Alejandro','Otero',NULL,149,3,'1',0),(1063,0,'Valentin','Perales',NULL,143,2,'1',0),(1064,0,'Nicolas','Rodriguez',NULL,151,1,'1',0),(1065,0,'Dany','Rosero Valencia',NULL,138,2,'1',0),(1066,0,'Victor','Salazar',NULL,137,2,'1',0),(1067,0,'Sebastian','Silguero',NULL,142,2,'1',0),(1068,0,'Federico','Vega',NULL,151,2,'1',0),(1069,0,'Axel','Werner',NULL,147,1,'1',0),(1070,0,'Bruno','Zabala',NULL,137,3,'1',0),(1071,0,'Gonzalo','Acevedo',NULL,144,1,'1',0),(1072,0,'Juan I.','Acordino',NULL,140,1,'1',0),(1073,0,'Ain','Acosta Luna',NULL,139,1,'1',0),(1074,0,'Lucas M.','Acosta',NULL,135,1,'1',0),(1075,0,'Jose','Aguero',NULL,152,3,'1',0),(1076,0,'Alan','Aldaya',NULL,140,1,'1',0),(1077,0,'Hernan','Altolaguirre',NULL,152,4,'1',0),(1078,0,'Federico','Alvarez',NULL,135,2,'1',0),(1079,0,'Rodrigo','Arciero',NULL,148,2,'1',0),(1080,0,'Ramiro','Arias',NULL,143,2,'1',0),(1081,0,'Ezequiel','Bareiro',NULL,138,3,'1',0),(1082,0,'Lucas','Bareiro',NULL,136,3,'1',0),(1083,0,'Oscar','Belinetz',NULL,150,4,'1',0),(1084,0,'Patricio','Berardo',NULL,135,2,'1',0),(1085,0,'Ezequiel','Bonacorso',NULL,140,2,'1',0),(1086,0,'Yair','Bonnin',NULL,141,1,'1',0),(1087,0,'Danny','Cabezas Bazan',NULL,134,3,'1',0),(1088,0,'Yonathan','Cabral',NULL,136,2,'1',0),(1089,0,'Gonzalo','Cabrera',NULL,140,3,'1',0),(1090,0,'Victor','Cabrera',NULL,151,2,'1',0),(1091,0,'Maximiliano','Caceres',NULL,139,3,'1',0),(1092,0,'Joaquin','Carrion',NULL,140,4,'1',0),(1093,0,'Lucas','Carrizo',NULL,144,2,'1',0),(1094,0,'Franco','Caseres',NULL,144,3,'1',0),(1095,0,'Franco','Cervi',NULL,137,4,'1',0),(1096,0,'Ivan','Colman',NULL,146,3,'1',0),(1097,0,'Matias','Contreras',NULL,140,2,'1',0),(1098,0,'Jorge','Correa',NULL,134,3,'1',0),(1099,0,'Jonas','Corvalan',NULL,141,4,'1',0),(1100,0,'Jorge','Cravero',NULL,147,4,'1',0),(1101,0,'Juan Cruz','Curzi',NULL,135,1,'1',0),(1102,0,'Manuel','De Iriondo',NULL,147,3,'1',0),(1103,0,'Jose','Devecchi',NULL,143,1,'1',0),(1104,0,'Emilio','Di Fulvio',NULL,137,1,'1',0),(1105,0,'Leonel','Di Placido',NULL,148,2,'1',0),(1106,0,'Lucas','Diarte',NULL,153,2,'1',0),(1107,0,'Ivan','Diaz',NULL,151,3,'1',0),(1108,0,'Juan','Dobboletta',NULL,136,1,'1',0),(1109,0,'Sebastian','Driussi',NULL,151,4,'1',0),(1110,0,'Federico','Escobar',NULL,141,2,'1',0),(1111,0,'Franco','Escobar',NULL,152,2,'1',0),(1112,0,'Cristian','Esparza',NULL,143,4,'1',0),(1113,0,'Rodrigo','Espindola',NULL,136,2,'1',0),(1114,0,'Franco','Ferreyra',NULL,146,3,'1',0),(1115,0,'Nicolas','Francese',NULL,151,1,'1',0),(1116,0,'Francisco','Fydriszewski',NULL,152,4,'1',0),(1117,0,'Walter','Gallardo',NULL,139,3,'1',0),(1118,0,'Leandro','Garate',NULL,142,4,'1',0),(1119,0,'Emanuel','Garcia',NULL,140,3,'1',0),(1120,0,'Javier','Garibaldi',NULL,141,3,'1',0),(1121,0,'Lautaro','Grillo',NULL,134,2,'1',0),(1122,0,'Federico','Haberkorn',NULL,134,4,'1',0),(1123,0,'Joaquin','Ibanez',NULL,139,3,'1',0),(1124,0,'Ignacio','Jauregui',NULL,141,3,'1',0),(1125,0,'Eric','Jerez',NULL,134,2,'1',0),(1126,0,'Franco','Jominy',NULL,147,4,'1',0),(1127,0,'Daniel','Lescano',NULL,142,2,'1',0),(1128,0,'Jose','Leudo',NULL,153,3,'1',0),(1129,0,'Ignacio','Lovera',NULL,150,1,'1',0),(1130,0,'Brian','Luciatti',NULL,143,2,'1',0),(1131,0,'Nahuel','Lujan',NULL,135,4,'1',0),(1132,0,'Juan Manuel','Lungarzo',NULL,148,1,'1',0),(1133,0,'Santiago','Magallan',NULL,143,3,'1',0),(1134,0,'Federico','Malvestiti',NULL,145,3,'1',0),(1135,0,'Emanuel','Mammana',NULL,151,2,'1',0),(1136,0,'Nicolas','Mana',NULL,146,4,'1',0),(1137,0,'Federico','Marcucci',NULL,134,3,'1',0),(1138,0,'Gonzalo','Marinelli',NULL,147,1,'1',0),(1139,0,'Leandro','Martonaro',NULL,149,3,'1',0),(1140,0,'Patricio','Matricardi',NULL,145,2,'1',0),(1141,0,'Walter','Montoya',NULL,137,3,'1',0),(1142,0,'Mariano','Moscato',NULL,142,2,'1',0),(1143,0,'Rene','Moyano',NULL,138,1,'1',0),(1144,0,'Luciano','Nequecaur',NULL,148,4,'1',0),(1145,0,'Dilan','Nicoletti',NULL,152,1,'1',0),(1146,0,'Nicolas','Oroz',NULL,136,3,'1',0),(1147,0,'Nicolas','Orsini',NULL,147,4,'1',0),(1148,0,'Franco','Oviedo',NULL,137,4,'1',0),(1149,0,'Rodrigo','Paillalef',NULL,136,2,'1',0),(1150,0,'Leonel','Peralta',NULL,149,2,'1',0),(1151,0,'Leonel','Pierce',NULL,136,3,'1',0),(1152,0,'Marcos','Pinto',NULL,139,2,'1',0),(1153,0,'Gonzalo','Piovi',NULL,134,2,'1',0),(1154,0,'Federico','Pistone',NULL,145,2,'1',0),(1155,0,'Geronimo','Poblete',NULL,150,3,'1',0),(1156,0,'Lucas','Pugh',NULL,151,4,'1',0),(1157,0,'Facundo','Quignon',NULL,143,3,'1',0),(1158,0,'Juan Cruz','Randazzo',NULL,138,2,'1',0),(1159,0,'Lautaro','Rinaldi',NULL,145,4,'1',0),(1160,0,'Ezequiel','Rios',NULL,138,3,'1',0),(1161,0,'Leonardo','Rolon',NULL,134,2,'1',0),(1162,0,'Henry','Rui',NULL,148,4,'1',0),(1163,0,'Danilo','Sandrigo',NULL,150,2,'1',0),(1164,0,'Damian','Santagati',NULL,144,2,'1',0),(1165,0,'Marcos','Sartor',NULL,147,4,'1',0),(1166,0,'Gabriel','Seijas',NULL,153,3,'1',0),(1167,0,'Javier','Soner',NULL,148,4,'1',0),(1168,0,'Franco','Tordini',NULL,137,3,'1',0),(1169,0,'Carlos','Torres',NULL,152,3,'1',0),(1170,0,'Emmanuel','Torres',NULL,143,4,'1',0),(1171,0,'Federico','Unsain',NULL,152,1,'1',0),(1172,0,'Gianluca','Vaccarini',NULL,137,4,'1',0),(1173,0,'Joel','Valdemarin',NULL,135,4,'1',0),(1174,0,'Bruno','Valdez',NULL,140,2,'1',0),(1175,0,'Federico','Vazquez',NULL,134,4,'1',0),(1176,0,'Leandro','Vega',NULL,151,2,'1',0),(1177,0,'Lucas','Vera Piris',NULL,139,4,'1',0),(1178,0,'Manuel','Vicentini',NULL,146,1,'1',0),(1179,0,'Norberto','Vidal',NULL,149,4,'1',0),(1180,0,'Juan F.','Vidili',NULL,149,4,'1',0),(1181,0,'Leonardo','Villalba',NULL,134,3,'1',0),(1182,0,'Gonzalo','Yordan',NULL,134,3,'1',0),(1183,0,'Emanuel','Zagert',NULL,141,4,'1',0),(1184,0,'Julio','Zuniga',NULL,151,3,'1',0);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playermatch`
--

DROP TABLE IF EXISTS `playermatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playermatch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `player` bigint(20) NOT NULL,
  `match_` bigint(20) NOT NULL,
  `totalPoints` double DEFAULT NULL,
  `olePoints` double DEFAULT NULL,
  `cleanGoal` tinyint(1) DEFAULT NULL,
  `recivedGoals` int(11) DEFAULT NULL,
  `ownGoals` int(11) DEFAULT NULL,
  `mom` tinyint(1) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  `penaltyGoals` int(11) DEFAULT NULL,
  `freeKickGoals` int(11) DEFAULT NULL,
  `missedPenalties` int(11) DEFAULT NULL,
  `cachedPenalties` int(11) DEFAULT NULL,
  `yellowCard` tinyint(1) DEFAULT NULL,
  `redCard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerMatch_player_match` (`player`,`match_`),
  KEY `FK_PlayerMatch_player` (`player`),
  KEY `FK_PlayerMatch_match` (`match_`),
  CONSTRAINT `FK_PlayerMatch_match` FOREIGN KEY (`match_`) REFERENCES `match_` (`id`),
  CONSTRAINT `FK_PlayerMatch_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playermatch`
--

LOCK TABLES `playermatch` WRITE;
/*!40000 ALTER TABLE `playermatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerposition`
--

DROP TABLE IF EXISTS `playerposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerposition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerPosition_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerposition`
--

LOCK TABLES `playerposition` WRITE;
/*!40000 ALTER TABLE `playerposition` DISABLE KEYS */;
INSERT INTO `playerposition` VALUES (1,0,'Arquero'),(2,0,'Defensor'),(3,0,'Volante'),(4,0,'Delantero');
/*!40000 ALTER TABLE `playerposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerteam`
--

DROP TABLE IF EXISTS `playerteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerteam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `player` bigint(20) NOT NULL,
  `team` bigint(20) NOT NULL,
  `isCaptain1` tinyint(1) DEFAULT NULL,
  `isCaptain2` tinyint(1) DEFAULT NULL,
  `isCaptain3` tinyint(1) DEFAULT NULL,
  `isPrincipal` tinyint(1) DEFAULT NULL,
  `isList` tinyint(1) DEFAULT NULL,
  `isSubstitute` tinyint(1) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerTeam_player_team` (`player`,`team`),
  KEY `FK_PlayerTeam_player` (`player`),
  KEY `FK_PlayerTeam_team` (`team`),
  CONSTRAINT `FK_PlayerTeam_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_PlayerTeam_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerteam`
--

LOCK TABLES `playerteam` WRITE;
/*!40000 ALTER TABLE `playerteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerteamweek`
--

DROP TABLE IF EXISTS `playerteamweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerteamweek` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `playerteam` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `plays` tinyint(1) DEFAULT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerTeamWeek_playerteam_week` (`playerteam`,`week`),
  KEY `FK_PlayerTeamWeek_playerteam` (`playerteam`),
  KEY `FK_PlayerTeamWeek_week` (`week`),
  CONSTRAINT `FK_PlayerTeamWeek_playerteam` FOREIGN KEY (`playerteam`) REFERENCES `playerteam` (`id`),
  CONSTRAINT `FK_PlayerTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerteamweek`
--

LOCK TABLES `playerteamweek` WRITE;
/*!40000 ALTER TABLE `playerteamweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerteamweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerweek`
--

DROP TABLE IF EXISTS `playerweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerweek` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `player` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `totalPoints` double DEFAULT NULL,
  `olePoints` double DEFAULT NULL,
  `cleanGoal` tinyint(1) DEFAULT NULL,
  `ownGoal` int(11) DEFAULT NULL,
  `mom` tinyint(1) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  `penaltyGoals` int(11) DEFAULT NULL,
  `freeKickGoals` int(11) DEFAULT NULL,
  `missedPenalties` int(11) DEFAULT NULL,
  `cachedPenalties` int(11) DEFAULT NULL,
  `yellowCard` tinyint(1) DEFAULT NULL,
  `redCard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PlayerWeek_player_week` (`player`,`week`),
  KEY `FK_PlayerWeek_player` (`player`),
  KEY `FK_PlayerWeek_week` (`week`),
  CONSTRAINT `FK_PlayerWeek_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_PlayerWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerweek`
--

LOCK TABLES `playerweek` WRITE;
/*!40000 ALTER TABLE `playerweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positionteamweek`
--

DROP TABLE IF EXISTS `positionteamweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positionteamweek` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `team` bigint(20) NOT NULL,
  `week` bigint(20) NOT NULL,
  `category` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `weekPoints` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PositionTeamWeek_team_week` (`team`,`week`),
  KEY `FK_PositionTeamWeek_team` (`team`),
  KEY `FK_PositionTeamWeek_week` (`week`),
  KEY `FK_PositionTeamWeek_category` (`category`),
  CONSTRAINT `FK_PositionTeamWeek_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_PositionTeamWeek_team` FOREIGN KEY (`team`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_PositionTeamWeek_week` FOREIGN KEY (`week`) REFERENCES `week` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positionteamweek`
--

LOCK TABLES `positionteamweek` WRITE;
/*!40000 ALTER TABLE `positionteamweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `positionteamweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `user` bigint(20) NOT NULL,
  `category` bigint(20) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `tactic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_Team_name` (`name`),
  KEY `FK_Team_user` (`user`),
  KEY `FK_Team_category` (`category`),
  CONSTRAINT `FK_Team_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_Team_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (52,8,'Ni un Pelo de Tonto',52,1,1,'3-4-3'),(53,8,'HRG F.C.',53,1,1,'3-4-3'),(54,8,'678 Stone',54,1,1,'3-4-3'),(55,6,'Tres Mas',55,1,1,'3-5-2'),(56,6,'15 de Octubre',56,1,0,'3-5-2'),(57,10,'Red Bull',57,1,1,'3-4-3'),(58,8,'Capussoto F.C.',58,1,1,'4-4-2'),(59,11,'QEE',59,1,1,'3-4-3'),(60,11,'GWT FC',60,1,1,'3-4-3'),(61,13,'Chapita de Cerveza Fóbal Clus',61,2,1,'3-5-2'),(62,7,'Los Super Ratones',62,2,0,'3-4-3'),(63,10,'La Bandita',63,2,1,'3-5-2'),(64,10,'Magia Oscura',64,2,1,'3-5-2'),(65,7,'A.C. Decano',65,2,1,'3-5-2'),(66,9,'La Bolsa AC',66,2,0,'4-4-2'),(67,5,'Aurdax Italiano',67,2,0,'4-4-2'),(68,5,'Gran Cuñado',68,2,1,'3-4-3'),(69,7,'Último Recurso',69,1,1,'3-4-3'),(70,8,'Nitrogenac',70,2,1,'3-4-3'),(71,10,'Khino Kokker Kluk',71,2,1,'3-5-2'),(72,4,'Pesto Rosso A.C.',72,2,1,'4-4-2');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_User_username` (`username`),
  UNIQUE KEY `UK_User_firstname_lastname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,3,'prueba','prueba','prueba','cHJ1ZWJh','grandt@waretech.com.ar'),(52,2,'Ricardo','Berl','Pela','cGVsYQ==','rickyberl@hotmail.com'),(53,4,'Leandro','Soncini','Chochi','Y2hvY2hp','leandrosoncini@hotmail.com'),(54,2,'Francisco','Tabellione','Tabe','anVuaW9y','ftabe76@hotmail.com'),(55,14,'Esteban','Sabbione','Tete','MTM4NTQ4','tetesabbione@hotmail.com'),(56,3,'Tomas','Condorelli','Tommy','Y2FzY294Mg==','tonyvelamazan@hotmail.com'),(57,4,'Martin','Aristia','Martin','bWFydGlu','m.aristia@gmail.com'),(58,2,'Franco','Condorelli','Catalano','Y2F0YWxhbm8=','cachosaccardi@hotmail.com'),(59,5,'Nicolas','Condorelli','Coco','UGluY2hhMDE=','ncondorelli@exiros.com'),(60,16,'Augusto','Soncini','Augusto','U29uY2luaQ==','augustosoncini@hotmail.com'),(61,3,'Matias','Condorelli','Pepi','UGVwaQ==','maticondorelli@gmail.com'),(62,9,'Mauro','Pennacchioni','Rata','MTMxMTc2','mpennach@gmail.com'),(63,3,'Emilio','Tabellione','Emi','MTI4MzEz','etabe114@hotmail.com'),(64,8,'Andres','García Olivares','Negro','Z28wNjE5NzY=','a_garciaolivares@hotmail.com'),(65,5,'Guillermo','Vallina','Guillote','MTI3Mjkw','gdvallina@fibertel.com.ar'),(66,5,'Luciano','Mucelli','Luchi','bHVjaGk=','luciano.mucelli@gmail.com'),(67,3,'Adriano','Mucelli','Tano','dGFubw==','aumucelli@gmail.com'),(68,16,'Fabian','Sabbione','Cunado','MTM3Nzg4','fabiansabbione@hotmail.com'),(69,2,'Sebastian','Fiori','Chocho','Y2hvY2hv','fioriseba@hotmail.com'),(70,3,'Ignacio','Soncini','Iki','Z2F5','ikisoncini@hotmail.com'),(71,2,'Gaston','Messineo','Vivi','dml2aQ==','gastonmessineo@hotmail.com'),(72,3,'Alejandro','Collareda','Coya','Y295YQ==','elcolla77@hotmail.com'),(73,1,'Mauro','Di Benni','Papucho','MTI5OTM0','patodb@hotmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `user` bigint(20) NOT NULL,
  `access` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UserAccess_user` (`user`),
  KEY `FK_UserAccess_access` (`access`),
  CONSTRAINT `FK_UserAccess_access` FOREIGN KEY (`access`) REFERENCES `access` (`id`),
  CONSTRAINT `FK_UserAccess_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
INSERT INTO `useraccess` VALUES (1,0,60,1),(2,0,60,2),(3,0,60,3),(4,0,60,13),(5,0,60,14),(40,0,59,1),(41,0,59,2),(42,0,59,13),(93,0,60,15),(94,0,60,16),(95,0,60,17),(96,0,59,15),(97,0,59,16),(100,0,55,1),(101,0,55,2),(102,0,60,18),(105,0,53,1),(106,0,53,2),(107,0,59,17),(110,0,69,1),(111,0,69,2),(114,0,62,1),(115,0,62,2),(116,0,53,13),(117,0,53,16),(118,0,65,2),(119,0,65,1),(120,0,65,16),(121,0,58,1),(122,0,58,2);
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week`
--

DROP TABLE IF EXISTS `week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_Week_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week`
--

LOCK TABLES `week` WRITE;
/*!40000 ALTER TABLE `week` DISABLE KEYS */;
INSERT INTO `week` VALUES (318,0,1),(319,0,2),(320,0,3),(321,0,4),(322,0,5),(323,0,6),(324,0,7),(325,0,8),(326,0,9),(327,0,10),(328,0,11),(329,0,12),(330,0,13),(331,0,14),(332,0,15);
/*!40000 ALTER TABLE `week` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-25 23:54:21
