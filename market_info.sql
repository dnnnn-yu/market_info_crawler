# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: market_info
# Generation Time: 2020-03-25 02:23:38 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table decreases
# ------------------------------------------------------------

CREATE TABLE `decreases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `volume` int(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `relative_ratio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table increases
# ------------------------------------------------------------

CREATE TABLE `increases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `volume` int(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `relative_ratio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table indices
# ------------------------------------------------------------

CREATE TABLE `indices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `volume` bigint(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pickups
# ------------------------------------------------------------

CREATE TABLE `pickups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` int(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table volumes
# ------------------------------------------------------------

CREATE TABLE `volumes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) DEFAULT NULL,
  `rank` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `volume` bigint(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `relative_ratio` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
