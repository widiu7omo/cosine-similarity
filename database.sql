# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.9-MariaDB)
# Database: similarity
# Generation Time: 2019-05-24 12:20:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tbcosine
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbcosine`;

CREATE TABLE `tbcosine` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idjudul` int(11) DEFAULT NULL,
  `count` float DEFAULT NULL,
  `persen` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbcosine` WRITE;
/*!40000 ALTER TABLE `tbcosine` DISABLE KEYS */;

INSERT INTO `tbcosine` (`id`, `idjudul`, `count`, `persen`)
VALUES
	(1,1,1,'100%'),
	(2,2,0.866876,'86.6875912086%'),
	(3,3,0.689508,'68.9508295889%'),
	(4,4,0.589658,'58.9657762885%');

/*!40000 ALTER TABLE `tbcosine` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbdfidf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbdfidf`;

CREATE TABLE `tbdfidf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtoken` int(11) DEFAULT NULL,
  `df` int(11) DEFAULT NULL,
  `n` int(11) DEFAULT NULL,
  `idf` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbdfidf` WRITE;
/*!40000 ALTER TABLE `tbdfidf` DISABLE KEYS */;

INSERT INTO `tbdfidf` (`id`, `idtoken`, `df`, `n`, `idf`)
VALUES
	(1,1,3,4,1.28768),
	(2,2,2,4,1.69315),
	(3,3,2,4,1.69315),
	(4,4,0,4,0),
	(5,5,0,4,0),
	(6,6,1,4,2.38629),
	(7,7,2,4,1.69315),
	(8,8,0,4,0),
	(9,9,1,4,2.38629),
	(10,10,1,4,2.38629),
	(11,11,0,4,0),
	(12,12,0,4,0);

/*!40000 ALTER TABLE `tbdfidf` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbdn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbdn`;

CREATE TABLE `tbdn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idjudul` int(11) DEFAULT NULL,
  `idtoken` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbdn` WRITE;
/*!40000 ALTER TABLE `tbdn` DISABLE KEYS */;

INSERT INTO `tbdn` (`id`, `idjudul`, `idtoken`, `count`)
VALUES
	(1,1,1,1),
	(2,1,2,1),
	(3,1,3,1),
	(4,1,4,0),
	(5,1,5,0),
	(6,1,6,0),
	(7,1,7,0),
	(8,1,8,0),
	(9,1,9,0),
	(10,1,10,0),
	(11,1,11,0),
	(12,1,12,0),
	(13,2,1,1),
	(14,2,2,0),
	(15,2,3,0),
	(16,2,4,0),
	(17,2,5,0),
	(18,2,6,1),
	(19,2,7,0),
	(20,2,8,0),
	(21,2,9,0),
	(22,2,10,0),
	(23,2,11,0),
	(24,2,12,0),
	(25,3,1,0),
	(26,3,2,0),
	(27,3,3,0),
	(28,3,4,0),
	(29,3,5,0),
	(30,3,6,0),
	(31,3,7,1),
	(32,3,8,0),
	(33,3,9,1),
	(34,3,10,0),
	(35,3,11,0),
	(36,3,12,0),
	(37,4,1,0),
	(38,4,2,0),
	(39,4,3,0),
	(40,4,4,0),
	(41,4,5,0),
	(42,4,6,0),
	(43,4,7,1),
	(44,4,8,0),
	(45,4,9,0),
	(46,4,10,1),
	(47,4,11,0),
	(48,4,12,0);

/*!40000 ALTER TABLE `tbdn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbDnidfpangkat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbDnidfpangkat`;

CREATE TABLE `tbDnidfpangkat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtoken` int(11) DEFAULT NULL,
  `count` float DEFAULT NULL,
  `idjudul` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbDnidfpangkat` WRITE;
/*!40000 ALTER TABLE `tbDnidfpangkat` DISABLE KEYS */;

INSERT INTO `tbDnidfpangkat` (`id`, `idtoken`, `count`, `idjudul`)
VALUES
	(1,1,1.65812,1),
	(2,2,2.86676,1),
	(3,3,2.86676,1),
	(4,4,0,1),
	(5,5,0,1),
	(6,6,0,1),
	(7,7,0,1),
	(8,8,0,1),
	(9,9,0,1),
	(10,10,0,1),
	(11,11,0,1),
	(12,12,0,1),
	(13,1,1.65812,2),
	(14,2,0,2),
	(15,3,0,2),
	(16,4,0,2),
	(17,5,0,2),
	(18,6,5.69438,2),
	(19,7,0,2),
	(20,8,0,2),
	(21,9,0,2),
	(22,10,0,2),
	(23,11,0,2),
	(24,12,0,2),
	(25,1,0,3),
	(26,2,0,3),
	(27,3,0,3),
	(28,4,0,3),
	(29,5,0,3),
	(30,6,0,3),
	(31,7,2.86676,3),
	(32,8,0,3),
	(33,9,5.69438,3),
	(34,10,0,3),
	(35,11,0,3),
	(36,12,0,3),
	(37,1,0,4),
	(38,2,0,4),
	(39,3,0,4),
	(40,4,0,4),
	(41,5,0,4),
	(42,6,0,4),
	(43,7,2.86676,4),
	(44,8,0,4),
	(45,9,0,4),
	(46,10,5.69438,4),
	(47,11,0,4),
	(48,12,0,4);

/*!40000 ALTER TABLE `tbDnidfpangkat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbjudul
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbjudul`;

CREATE TABLE `tbjudul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `judul` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbjudul` WRITE;
/*!40000 ALTER TABLE `tbjudul` DISABLE KEYS */;

INSERT INTO `tbjudul` (`id`, `nama`, `judul`)
VALUES
	(1,'satu','sistem informasi majemuk bertingkat'),
	(2,'dua','sistem pencernaan tubuh'),
	(3,'tiga','aplikasi pembasmi nyamuk'),
	(4,'empat','aplikasi manajemen peserta lapangan');

/*!40000 ALTER TABLE `tbjudul` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbq
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbq`;

CREATE TABLE `tbq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtoken` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbq` WRITE;
/*!40000 ALTER TABLE `tbq` DISABLE KEYS */;

INSERT INTO `tbq` (`id`, `idtoken`, `count`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,0),
	(5,5,0),
	(6,6,0),
	(7,7,0),
	(8,8,0),
	(9,9,0),
	(10,10,0),
	(11,11,0),
	(12,12,0);

/*!40000 ALTER TABLE `tbq` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbQidfpangkat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbQidfpangkat`;

CREATE TABLE `tbQidfpangkat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtoken` int(11) DEFAULT NULL,
  `count` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbQidfpangkat` WRITE;
/*!40000 ALTER TABLE `tbQidfpangkat` DISABLE KEYS */;

INSERT INTO `tbQidfpangkat` (`id`, `idtoken`, `count`)
VALUES
	(1,1,1.65812),
	(2,2,2.86676),
	(3,3,2.86676),
	(4,4,0),
	(5,5,0),
	(6,6,0),
	(7,7,0),
	(8,8,0),
	(9,9,0),
	(10,10,0),
	(11,11,0),
	(12,12,0);

/*!40000 ALTER TABLE `tbQidfpangkat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbDidfkaliQidf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbDidfkaliQidf`;

CREATE TABLE `tbDidfkaliQidf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idtoken` int(11) DEFAULT NULL,
  `count` float DEFAULT NULL,
  `idjudul` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tbDidfkaliQidf` WRITE;
/*!40000 ALTER TABLE `tbDidfkaliQidf` DISABLE KEYS */;

INSERT INTO `tbDidfkaliQidf` (`id`, `idtoken`, `count`, `idjudul`)
VALUES
	(1,1,1.65812,1),
	(2,2,2.86676,1),
	(3,3,2.86676,1),
	(4,4,0,1),
	(5,5,0,1),
	(6,6,0,1),
	(7,7,0,1),
	(8,8,0,1),
	(9,9,0,1),
	(10,10,0,1),
	(11,11,0,1),
	(12,12,0,1),
	(13,1,1.65812,2),
	(14,2,0,2),
	(15,3,0,2),
	(16,4,0,2),
	(17,5,0,2),
	(18,6,0,2),
	(19,7,0,2),
	(20,8,0,2),
	(21,9,0,2),
	(22,10,0,2),
	(23,11,0,2),
	(24,12,0,2),
	(25,1,0,3),
	(26,2,0,3),
	(27,3,0,3),
	(28,4,0,3),
	(29,5,0,3),
	(30,6,0,3),
	(31,7,0,3),
	(32,8,0,3),
	(33,9,0,3),
	(34,10,0,3),
	(35,11,0,3),
	(36,12,0,3),
	(37,1,0,4),
	(38,2,0,4),
	(39,3,0,4),
	(40,4,0,4),
	(41,5,0,4),
	(42,6,0,4),
	(43,7,0,4),
	(44,8,0,4),
	(45,9,0,4),
	(46,10,0,4),
	(47,11,0,4),
	(48,12,0,4);

/*!40000 ALTER TABLE `tbDidfkaliQidf` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbtoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbtoken`;

CREATE TABLE `tbtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(30) NOT NULL,
  `count` int(11) NOT NULL,
  `bobot` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbtoken` WRITE;
/*!40000 ALTER TABLE `tbtoken` DISABLE KEYS */;

INSERT INTO `tbtoken` (`id`, `term`, `count`, `bobot`)
VALUES
	(1,'sistem',2,NULL),
	(2,'informasi',1,NULL),
	(3,'majemuk',1,NULL),
	(4,'bertingkat',1,NULL),
	(5,'pencernaan',1,NULL),
	(6,'tubuh',1,NULL),
	(7,'aplikasi',2,NULL),
	(8,'pembasmi',1,NULL),
	(9,'nyamuk',1,NULL),
	(10,'manajemen',1,NULL),
	(11,'peserta',1,NULL),
	(12,'lapangan',1,NULL);

/*!40000 ALTER TABLE `tbtoken` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
