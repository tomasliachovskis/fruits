# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.32)
# Database: fruits
# Generation Time: 2023-03-27 11:18:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table doctrine_migration_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doctrine_migration_versions`;

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`)
VALUES
	('DoctrineMigrations\\Version20230324074328','2023-03-27 07:54:51',166);

/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fruit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fruit`;

CREATE TABLE `fruit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nutrition_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_f` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A00BD297B5D724CD` (`nutrition_id`),
  CONSTRAINT `FK_A00BD297B5D724CD` FOREIGN KEY (`nutrition_id`) REFERENCES `nutrition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `fruit` WRITE;
/*!40000 ALTER TABLE `fruit` DISABLE KEYS */;

INSERT INTO `fruit` (`id`, `nutrition_id`, `name`, `genus`, `family`, `order_f`, `created_at`, `updated_at`)
VALUES
	(1,1,'Apple','Malus','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(2,2,'Apricot','Prunus','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(3,3,'Avocado','Persea','Lauraceae','Laurales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(4,4,'Banana','Musa','Musaceae','Zingiberales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(5,5,'Blackberry','Rubus','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(6,6,'Blueberry','Fragaria','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(7,7,'Cherry','Prunus','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(8,8,'Cranberry','Vaccinium','Ericaceae','Ericales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(9,9,'Dragonfruit','Selenicereus','Cactaceae','Caryophyllales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(10,10,'Durian','Durio','Malvaceae','Malvales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(11,11,'Feijoa','Sellowiana','Myrtaceae','Myrtoideae','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(12,12,'Fig','Ficus','Moraceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(13,13,'Gooseberry','Ribes','Grossulariaceae','Saxifragales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(14,14,'Grape','Vitis','Vitaceae','Vitales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(15,15,'GreenApple','Malus','Rosaceae','Rosales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(16,16,'Guava','Psidium','Myrtaceae','Myrtales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(17,17,'Kiwi','Apteryx','Actinidiaceae','Struthioniformes','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(18,18,'Kiwifruit','Actinidia','Actinidiaceae','Ericales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(19,19,'Lemon','Citrus','Rutaceae','Sapindales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(20,20,'Lime','Citrus','Rutaceae','Sapindales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(21,21,'Lingonberry','Vaccinium','Ericaceae','Ericales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(22,22,'Lychee','Litchi','Sapindaceae','Sapindales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(23,23,'Mango','Mangifera','Anacardiaceae','Sapindales','2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(24,24,'Melon','Cucumis','Cucurbitaceae','Cucurbitaceae','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(25,25,'Morus','Morus','Moraceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(26,26,'Orange','Citrus','Rutaceae','Sapindales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(27,27,'Papaya','Carica','Caricaceae','Caricacea','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(28,28,'Passionfruit','Passiflora','Passifloraceae','Malpighiales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(29,29,'Peach','Prunus','Rosaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(30,30,'Pear','Pyrus','Rosaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(31,31,'Persimmon','Diospyros','Ebenaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(32,32,'Pineapple','Ananas','Bromeliaceae','Poales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(33,33,'Pitahaya','Cactaceae','Cactaceae','Caryophyllales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(34,34,'Plum','Prunus','Rosaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(35,35,'Pomegranate','Punica','Lythraceae','Myrtales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(36,36,'Raspberry','Rubus','Rosaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(37,37,'Strawberry','Fragaria','Rosaceae','Rosales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(38,38,'Tangerine','Citrus','Rutaceae','Sapindales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(39,39,'Tomato','Solanum','Solanaceae','Solanales','2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(40,40,'Watermelon','Citrullus','Cucurbitaceae','Cucurbitales','2023-03-27 07:55:39','2023-03-27 07:55:39');

/*!40000 ALTER TABLE `fruit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nutrition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nutrition`;

CREATE TABLE `nutrition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carbohydrates` double NOT NULL,
  `protein` double NOT NULL,
  `fat` double NOT NULL,
  `calories` double NOT NULL,
  `sugar` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `nutrition` WRITE;
/*!40000 ALTER TABLE `nutrition` DISABLE KEYS */;

INSERT INTO `nutrition` (`id`, `carbohydrates`, `protein`, `fat`, `calories`, `sugar`, `created_at`, `updated_at`)
VALUES
	(1,11.4,0.3,0.4,52,10.3,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(2,3.9,0.5,0.1,15,3.2,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(3,8.53,2,14.66,160,0.66,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(4,22,1,0.2,96,17.2,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(5,9,1.3,0.4,40,4.5,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(6,5.5,0,0.4,29,5.4,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(7,12,1,0.3,50,8,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(8,12.2,0.4,0.1,46,4,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(9,9,9,1.5,60,8,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(10,27.1,1.5,5.3,147,6.75,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(11,8,0.6,0.4,44,3,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(12,19,0.8,0.3,74,16,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(13,10,0.9,0.6,44,0,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(14,18.1,0.72,0.16,69,16,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(15,3.1,0.4,0.1,21,6.4,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(16,14,2.6,1,68,9,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(17,15,1.1,0.5,61,9,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(18,14.6,1.14,0.5,61,8.9,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(19,9,1.1,0.3,29,2.5,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(20,8.4,0.3,0.1,25,1.7,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(21,11.3,0.75,0.34,50,5.74,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(22,17,0.8,0.44,66,15,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(23,15,0.82,0.38,60,13.7,'2023-03-27 07:55:38','2023-03-27 07:55:38'),
	(24,8,0,0,34,8,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(25,9.8,1.44,0.39,43,8.1,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(26,8.3,1,0.2,43,8.2,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(27,11,0,0.4,43,1,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(28,22.4,2.2,0.7,97,11.2,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(29,9.5,0.9,0.25,39,8.4,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(30,15,0.4,0.1,57,10,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(31,18,0,0,81,18,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(32,13.12,0.54,0.12,50,9.85,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(33,7,1,0.4,36,3,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(34,11.4,0.7,0.28,46,9.92,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(35,18.7,1.7,1.2,83,13.7,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(36,12,1.2,0.7,53,4.4,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(37,5.5,0.8,0.4,29,5.4,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(38,8.3,0,0.4,45,9.1,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(39,3.9,0.9,0.2,74,2.6,'2023-03-27 07:55:39','2023-03-27 07:55:39'),
	(40,8,0.6,0.2,30,6,'2023-03-27 07:55:39','2023-03-27 07:55:39');

/*!40000 ALTER TABLE `nutrition` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
