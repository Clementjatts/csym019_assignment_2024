-- MySQL dump 10.13  Distrib 8.0.37, for Linux (aarch64)
--
-- Host: localhost    Database: premier_league
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) DEFAULT NULL,
  `team_city` varchar(255) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `founded_year` int DEFAULT NULL,
  `stadium_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  UNIQUE KEY `team_name` (`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'AFC Bournemouth','Bournemouth','Andoni Iraola',1899,'Vitality Stadium'),(2,'Arsenal','London','Mikel Arteta',1886,'Emirates Stadium'),(3,'Aston Villa','Birmingham','Unai Emery',1874,'Villa Park'),(4,'Brentford','    London','Thomas Frank',1889,'Gtech Community Stadium'),(5,'Brighton & Hove Albion','Brighton','Roberto De Zerbi',1901,'Falmer Stadium (Amex Stadium)'),(6,'Burnley','    Burnley','Vincent Kompany',1882,'Turf Moor'),(7,'Chelsea','London','Mauricio Pochettino',1905,'Stamford Bridge'),(8,'Crystal Palace','London','Roy Hodgson',1905,'Selhurst Park'),(9,'Everton','Liverpool','Sean Dyche',1878,'Goodison Park'),(10,'Fulham','London','Marco Silva',1879,'Craven Cottage'),(11,'Liverpool','Liverpool','Jürgen Klopp',1892,'Anfield'),(12,'Luton Town','Luton','Rob Edwards',1885,'Kenilworth Road'),(13,'Manchester City','Manchester','Pep Guardiola',1880,'Etihad Stadium'),(14,'Manchester United','Manchester','Erik ten Hag',1878,'Old Trafford'),(15,'Newcastle United','Newcastle upon Tyne','Eddie Howe',1892,'St James\' Park'),(16,'Nottingham Forest','Nottingham','Steve Cooper',1865,'City Ground'),(17,'Sheffield United','Sheffield','Paul Heckingbottom',1889,'Bramall Lane'),(18,'Tottenham Hotspur','London','Ange Postecoglou',1882,'Tottenham Hotspur Stadium'),(19,'West Ham United','London','David Moyes',1895,'London Stadium'),(20,'Wolverhampton Wanderers','Wolverhampton','Gary O\'Neil ',1877,'Molineux Stadium');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `home_team` int DEFAULT NULL,
  `home_score` int DEFAULT NULL,
  `away_score` int DEFAULT NULL,
  `away_team` int DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `away_team` (`away_team`),
  KEY `home_team` (`home_team`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`away_team`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`home_team`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2024-05-06',8,4,0,14),(2,'2024-05-05',5,1,0,3),(3,'2024-05-05',7,5,0,19),(4,'2024-05-05',11,4,2,18),(5,'2024-05-04',2,3,0,1),(6,'2024-05-04',4,0,0,10),(7,'2024-05-04',6,1,4,15),(8,'2024-05-04',17,1,3,16),(9,'2024-05-04',13,5,1,20),(10,'2024-05-03',12,1,1,9),(11,'2024-05-02',7,2,0,18),(12,'2024-04-28',1,3,0,5),(13,'2024-04-28',18,2,3,2),(14,'2024-04-28',16,0,2,13),(15,'2024-04-27',19,2,2,11),(16,'2024-04-27',20,2,1,12),(17,'2024-04-27',14,1,1,6),(18,'2024-04-27',10,1,1,8),(19,'2024-04-27',15,5,1,17),(20,'2024-04-27',9,1,0,4),(21,'2024-04-27',3,2,2,7),(22,'2024-04-25',5,0,4,13),(23,'2024-04-24',20,0,1,1),(24,'2024-04-24',9,2,0,11),(25,'2024-04-24',14,4,2,17),(26,'2024-04-24',8,2,0,15),(27,'2024-04-23',2,5,0,7),(28,'2024-04-21',9,2,0,16),(29,'2024-04-21',3,3,1,1),(30,'2024-04-21',8,5,2,19),(31,'2024-04-21',10,1,3,11),(32,'2024-04-20',12,1,5,4),(33,'2024-04-20',17,1,4,6),(34,'2024-04-20',20,0,2,2),(35,'2024-04-15',7,6,0,9),(36,'2024-04-14',11,0,1,8),(37,'2024-04-14',19,0,2,10),(38,'2024-04-14',2,0,2,3),(39,'2024-04-13',15,4,0,18),(40,'2024-04-13',13,5,1,12),(41,'2024-04-13',6,1,1,5),(42,'2024-04-13',4,2,0,17),(43,'2024-04-13',16,2,2,20),(44,'2024-04-13',1,2,2,14),(45,'2024-04-07',14,2,2,11),(46,'2024-04-07',17,2,2,7),(47,'2024-04-07',18,3,1,16),(48,'2024-04-06',8,2,4,13),(49,'2024-04-06',9,1,0,6),(50,'2024-04-06',3,3,3,4),(51,'2024-04-06',10,0,1,15),(52,'2024-04-06',20,1,2,19),(53,'2024-04-06',12,2,1,1),(54,'2024-04-06',5,0,3,2),(55,'2024-04-04',11,3,1,17),(56,'2024-04-04',7,4,3,14),(57,'2024-04-03',2,2,0,12),(58,'2024-04-03',4,0,0,5),(59,'2024-04-03',13,4,1,3),(60,'2024-04-02',15,1,1,9),(61,'2024-04-02',16,3,1,10),(62,'2024-04-02',6,1,1,20),(63,'2024-04-02',1,1,0,8),(64,'2024-04-02',19,1,1,18),(65,'2024-03-31',11,2,1,5),(66,'2024-03-31',13,0,0,2),(67,'2024-03-30',15,4,3,19),(68,'2024-03-30',17,3,3,10),(69,'2024-03-30',16,1,1,8),(70,'2024-03-30',7,2,2,6),(71,'2024-03-30',18,2,1,12),(72,'2024-03-30',1,2,1,9),(73,'2024-03-30',3,2,0,20),(74,'2024-03-30',4,1,1,14),(75,'2024-03-17',19,1,1,3),(76,'2024-03-16',12,1,1,16),(77,'2024-03-16',6,2,1,4),(78,'2024-03-16',10,3,0,18),(79,'2024-03-13',1,4,3,12),(80,'2024-03-11',7,3,2,15),(81,'2024-03-10',3,0,4,18),(82,'2024-03-10',19,2,2,6),(83,'2024-03-10',5,1,0,16),(84,'2024-03-10',11,1,1,13),(85,'2024-03-09',14,2,0,9),(86,'2024-03-09',8,1,1,12),(87,'2024-03-09',20,2,1,10),(88,'2024-03-09',1,2,2,17),(89,'2024-03-09',2,2,1,4),(90,'2024-03-04',17,0,6,2),(91,'2024-03-03',6,0,2,1),(92,'2024-03-03',13,3,1,14),(93,'2024-03-02',18,3,1,8),(94,'2024-03-02',16,0,1,11),(95,'2024-03-02',15,3,0,20),(96,'2024-03-02',10,3,0,5),(97,'2024-03-02',9,1,3,19),(98,'2024-03-02',4,2,2,7),(99,'2024-03-02',12,2,3,3),(100,'2024-02-26',19,4,2,4),(101,'2024-02-25',20,1,0,17),(102,'2024-02-24',14,1,2,10),(103,'2024-02-24',3,4,2,16),(104,'2024-02-24',8,3,0,6),(105,'2024-02-24',5,1,1,9),(106,'2024-02-24',1,0,1,13),(107,'2024-02-24',2,4,1,15),(108,'2024-02-21',11,4,1,12),(109,'2024-02-20',13,1,0,4),(110,'2024-02-19',9,1,1,8),(111,'2024-02-18',17,0,5,5),(112,'2024-02-18',12,1,2,14),(113,'2024-02-17',4,1,4,11),(114,'2024-02-17',6,0,5,2),(115,'2024-02-17',10,1,2,3),(116,'2024-02-17',18,1,2,20),(117,'2024-02-17',16,2,0,19),(118,'2024-02-17',15,2,2,1),(119,'2024-02-17',13,1,1,7),(120,'2024-02-12',8,1,3,7),(121,'2024-02-11',19,0,6,2),(122,'2024-02-11',3,1,2,14),(123,'2024-02-10',13,2,0,9),(124,'2024-02-10',10,3,1,1),(125,'2024-02-10',12,1,3,17),(126,'2024-02-10',11,3,1,6),(127,'2024-02-10',18,2,1,5),(128,'2024-02-10',20,0,2,4),(129,'2024-02-10',16,2,3,15),(130,'2024-02-05',4,1,3,13),(131,'2024-02-04',7,2,4,20),(132,'2024-02-04',14,3,0,19),(133,'2024-02-04',1,1,1,16),(134,'2024-02-04',2,3,1,11),(135,'2024-02-03',9,2,2,18),(136,'2024-02-03',15,4,4,12),(137,'2024-02-03',6,2,2,10),(138,'2024-02-03',5,4,1,8),(139,'2024-02-03',17,0,5,3),(140,'2024-02-01',19,1,1,1),(141,'2024-02-01',20,3,4,14),(142,'2024-01-31',18,3,2,4),(143,'2024-01-31',13,3,1,6),(144,'2024-01-31',11,4,1,7),(145,'2024-01-30',16,1,2,2),(146,'2024-01-30',10,0,0,9),(147,'2024-01-30',12,4,0,5),(148,'2024-01-30',8,3,2,17),(149,'2024-01-30',3,1,3,15),(150,'2024-01-22',5,0,0,20),(151,'2024-01-21',17,2,2,19),(152,'2024-01-21',1,0,4,11),(153,'2024-01-20',2,5,0,8),(154,'2024-01-20',4,3,2,16),(155,'2024-01-14',9,0,0,3),(156,'2024-01-14',14,2,2,18),(157,'2024-01-13',7,1,0,10),(158,'2024-01-13',15,2,3,13),(159,'2024-01-12',6,1,1,12),(160,'2024-01-02',19,0,0,5),(161,'2024-01-01',11,4,2,15),(162,'2023-12-31',10,2,1,2),(163,'2023-12-31',18,3,1,1),(164,'2023-12-30',12,2,3,7),(165,'2023-12-30',13,2,0,17),(166,'2023-12-30',8,3,1,4),(167,'2023-12-30',20,3,0,9),(168,'2023-12-30',3,3,2,6),(169,'2023-12-30',16,2,1,14),(170,'2023-12-28',5,4,2,18),(171,'2023-12-28',2,0,2,19),(172,'2023-12-27',7,2,1,8),(173,'2023-12-27',4,1,4,20),(174,'2023-12-27',9,1,3,13),(175,'2023-12-26',15,1,3,16),(176,'2023-12-26',17,2,3,12),(177,'2023-12-26',1,3,0,10),(178,'2023-12-26',6,0,2,11),(179,'2023-12-26',14,3,2,3),(180,'2023-12-24',20,2,1,7),(181,'2023-12-23',19,2,0,14),(182,'2023-12-23',18,2,1,9),(183,'2023-12-23',16,2,3,1),(184,'2023-12-23',12,1,0,15),(185,'2023-12-23',10,0,2,6),(186,'2023-12-23',11,1,1,2),(187,'2023-12-22',3,1,1,17),(188,'2023-12-21',8,1,1,5),(189,'2023-12-17',4,1,2,3),(190,'2023-12-17',2,2,0,5),(191,'2023-12-17',19,3,0,20),(192,'2023-12-17',11,0,0,14),(193,'2023-12-16',13,2,2,8),(194,'2023-12-16',15,3,0,10),(195,'2023-12-16',7,2,0,17),(196,'2023-12-16',6,0,2,9),(197,'2023-12-15',16,0,2,18),(198,'2023-12-10',10,5,0,19),(199,'2023-12-10',12,1,2,13),(200,'2023-12-10',9,2,0,7),(201,'2023-12-10',18,4,1,15),(202,'2023-12-09',8,1,2,11),(203,'2023-12-09',14,0,3,1),(204,'2023-12-09',5,1,1,6),(205,'2023-12-09',17,1,0,4),(206,'2023-12-09',20,1,1,16),(207,'2023-12-09',3,1,0,2),(208,'2023-12-07',9,3,0,15),(209,'2023-12-07',18,1,2,19),(210,'2023-12-06',10,5,0,16),(211,'2023-12-06',17,0,2,11),(212,'2023-12-06',5,2,1,4),(213,'2023-12-06',8,0,2,1),(214,'2023-12-06',3,1,0,13),(215,'2023-12-06',14,2,1,7),(216,'2023-12-05',20,1,0,6),(217,'2023-12-05',12,3,4,2),(218,'2023-12-03',19,1,1,8),(219,'2023-12-03',7,3,2,5),(220,'2023-12-03',1,2,2,3),(221,'2023-12-03',11,4,3,10),(222,'2023-12-03',13,3,3,18),(223,'2023-12-02',6,5,0,17),(224,'2023-12-02',4,3,1,12),(225,'2023-12-02',2,2,1,20),(226,'2023-12-02',16,0,1,9),(227,'2023-12-02',15,1,0,14),(228,'2023-11-27',10,3,2,20),(229,'2023-11-26',18,1,2,3),(230,'2023-11-26',9,0,3,14),(231,'2023-11-25',13,1,1,11),(232,'2023-11-25',17,1,3,1),(233,'2023-11-25',12,2,1,8),(234,'2023-11-25',15,4,1,7),(235,'2023-11-25',6,1,2,19),(236,'2023-11-25',16,2,3,5),(237,'2023-11-25',4,0,1,2),(238,'2023-11-12',3,3,1,10),(239,'2023-11-12',5,1,1,17),(240,'2023-11-12',19,3,2,16),(241,'2023-11-12',11,3,0,4),(242,'2023-11-12',7,4,4,13),(243,'2023-11-11',20,2,1,18),(244,'2023-11-11',8,2,3,9),(245,'2023-11-11',14,1,0,12),(246,'2023-11-11',2,3,1,6),(247,'2023-11-11',1,2,0,15),(248,'2023-11-06',18,1,4,7),(249,'2023-11-05',16,2,0,3),(250,'2023-11-05',12,1,1,11),(251,'2023-11-04',10,0,1,14),(252,'2023-11-04',9,1,1,5),(253,'2023-11-04',6,0,2,8),(254,'2023-11-04',4,3,2,19),(255,'2023-11-04',13,6,1,1),(256,'2023-11-04',17,2,1,20),(257,'2023-11-04',15,1,0,2),(258,'2023-11-03',12,1,2,6),(259,'2023-11-02',10,0,2,7),(260,'2023-11-01',16,1,1,4),(261,'2023-10-29',19,0,1,9),(262,'2023-10-29',11,3,0,16),(263,'2023-10-29',5,1,1,10),(264,'2023-10-29',3,3,1,12),(265,'2023-10-29',14,0,3,13),(266,'2023-10-28',7,0,2,4),(267,'2023-10-28',1,2,1,6),(268,'2023-10-28',2,5,0,17),(269,'2023-10-28',20,2,2,15),(270,'2023-10-27',8,1,2,18),(271,'2023-10-23',18,2,0,10),(272,'2023-10-22',3,4,1,19),(273,'2023-10-21',11,2,0,9),(274,'2023-10-21',15,4,0,8),(275,'2023-10-21',13,2,1,5),(276,'2023-10-21',4,3,0,6),(277,'2023-10-21',16,2,2,12),(278,'2023-10-21',1,1,2,20),(279,'2023-10-21',7,2,2,2),(280,'2023-10-21',17,1,2,14),(281,'2023-10-08',5,2,2,11),(282,'2023-10-08',20,1,1,3),(283,'2023-10-08',19,2,2,15),(284,'2023-10-08',2,1,0,13),(285,'2023-10-07',12,0,1,18),(286,'2023-10-07',14,2,1,4),(287,'2023-10-07',9,3,0,1),(288,'2023-10-07',10,3,1,17),(289,'2023-10-07',6,1,4,7),(290,'2023-10-07',8,0,0,16),(291,'2023-10-03',12,1,2,6),(292,'2023-10-02',10,0,2,7),(293,'2023-10-01',16,1,1,4),(294,'2023-09-30',3,6,1,5),(295,'2023-09-30',19,2,0,17),(296,'2023-09-30',14,0,1,8),(297,'2023-09-30',1,0,4,2),(298,'2023-09-30',20,2,1,13),(299,'2023-09-30',9,1,2,12),(300,'2023-09-30',15,2,0,6),(301,'2023-09-30',18,2,1,11),(302,'2023-09-24',5,3,1,1),(303,'2023-09-24',7,0,1,3),(304,'2023-09-24',11,3,1,19),(305,'2023-09-24',2,2,2,18),(306,'2023-09-24',17,0,8,15),(307,'2023-09-23',12,1,1,20),(308,'2023-09-23',8,0,0,10),(309,'2023-09-23',13,2,0,16),(310,'2023-09-23',4,1,3,9),(311,'2023-09-23',6,0,1,14),(312,'2023-09-18',16,1,1,6),(313,'2023-09-17',1,0,0,7),(314,'2023-09-17',9,0,1,2),(315,'2023-09-16',20,1,3,11),(316,'2023-09-16',18,2,1,17),(317,'2023-09-16',14,1,3,5),(318,'2023-09-16',19,1,3,13),(319,'2023-09-16',3,3,1,8),(320,'2023-09-16',10,1,0,12),(321,'2023-09-16',15,1,0,4),(322,'2023-09-03',8,3,2,20),(323,'2023-09-03',11,3,0,3),(324,'2023-09-03',2,3,1,14),(325,'2023-09-02',17,2,2,9),(326,'2023-09-02',13,5,1,10),(327,'2023-09-02',7,0,1,16),(328,'2023-09-02',6,2,5,18),(329,'2023-09-02',4,2,2,1),(330,'2023-09-02',5,3,1,15),(331,'2023-09-01',12,1,2,19),(332,'2023-08-27',6,1,3,3),(333,'2023-08-27',17,1,2,13),(334,'2023-08-27',15,1,2,11),(335,'2023-08-26',1,0,2,18),(336,'2023-08-26',2,2,2,10),(337,'2023-08-26',4,1,1,8),(338,'2023-08-26',14,3,2,16),(339,'2023-08-26',9,0,1,20),(340,'2023-08-26',5,1,3,19),(341,'2023-08-25',7,3,0,12),(342,'2023-08-21',8,0,1,2),(343,'2023-08-20',3,4,0,9),(344,'2023-08-20',19,3,1,7),(345,'2023-08-19',20,1,4,5),(346,'2023-08-19',11,3,1,1),(347,'2023-08-19',10,0,3,4),(348,'2023-08-19',18,2,0,14),(349,'2023-08-19',13,1,0,15),(350,'2023-08-18',16,2,1,17),(351,'2023-08-14',14,1,0,20),(352,'2023-08-13',4,2,2,18),(353,'2023-08-13',7,1,1,11),(354,'2023-08-12',2,2,1,16),(355,'2023-08-12',9,0,1,10),(356,'2023-08-12',5,4,1,12),(357,'2023-08-12',1,1,1,19),(358,'2023-08-12',17,0,1,8),(359,'2023-08-12',15,5,1,3),(360,'2023-08-11',6,0,3,13);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Clementjatts','$2y$10$8XXnd3CtEaqWwMp2s4L6zO78ekVQiAWWNdo4utM0uY35gkr8bWiH6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19  7:58:12