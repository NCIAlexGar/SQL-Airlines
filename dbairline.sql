-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraft_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plane_range` float DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`aircraft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'A319','Airbus',6900,144),(2,'A320','Airbus',6150,180),(3,'A321','Airbus',7400,220),(4,'Max10','Boeing',7560,228),(5,'B737','Boeing',6950,189),(6,'A319','Airbus',6900,144),(7,'A319','Airbus',6500,175),(8,'A320','Airbus',6150,180),(9,'A321','Airbus',7400,200),(10,'Max10','Boeing',7560,195),(11,'B737','Boeing',6950,210);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `destination_id` int NOT NULL AUTO_INCREMENT,
  `airport_code` varchar(50) DEFAULT NULL,
  `airport_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `timezone` datetime NOT NULL,
  `lat` decimal(8,6) DEFAULT NULL,
  `lng` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'LON','LUTON','LONDON','2012-10-25 12:32:10',40.589000,3.452000),(2,'BUH','Otopeni','Bucharest','2012-10-25 12:32:10',39.536000,2.897000),(3,'DTT','Detroit Metropolitan Area','Detroit','2012-10-25 12:32:10',51.021000,4.236000),(4,'IST','Istanbul','Izmir Metropolitan Area','2012-10-25 12:32:10',58.326000,5.321000),(5,'JKT','Jakarta','Jakarta Metropolitan Area','2012-10-25 12:32:10',52.147000,4.023000);
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_table`
--

DROP TABLE IF EXISTS `fact_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_table` (
  `aircraft_id` int DEFAULT NULL,
  `destination_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `price` float NOT NULL,
  `time_stamp` datetime DEFAULT NULL,
  KEY `aircraft_id` (`aircraft_id`),
  KEY `destination_id` (`destination_id`),
  KEY `seat_id` (`seat_id`),
  KEY `flight_id` (`flight_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `fact_table_ibfk_1` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`aircraft_id`),
  CONSTRAINT `fact_table_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`destination_id`),
  CONSTRAINT `fact_table_ibfk_3` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `fact_table_ibfk_4` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `fact_table_ibfk_5` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_table`
--

LOCK TABLES `fact_table` WRITE;
/*!40000 ALTER TABLE `fact_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(30) NOT NULL,
  `departure` varchar(50) NOT NULL,
  `arrival` varchar(50) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'FR2513','september 2023 08:30','september 2023 13:20','delayed'),(2,'PR1913','november 2023 06:55','december 2023 04:20','cancelled'),(3,'IST1213','september 2023 08:30','september 2023 12:00','on_time'),(4,'BH7513','september 2023 08:30','september 2023 12:45','on_schedule'),(5,'LN8813','october 2023 5:30','september 2023 09:00','on_time'),(6,'FX3213','december 2023 06:15','december 2023 11:40','on_schedule');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `aircraft_code` varchar(50) DEFAULT NULL,
  `seat_number` varchar(8) DEFAULT NULL,
  `seat_option` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,'A319','ST17B','economic'),(2,'A321','ST21C','economic'),(3,'A320','ST05B','economic'),(4,'A321','ST10A','economic'),(5,'A319','ST33C','economic'),(6,'A320','ST25A','economic'),(7,'A320','ST15A','Bussness'),(8,'A320','ST21C','Bussness'),(9,'A320','ST16A','Bussness'),(10,'A320','ST12B','Bussness'),(11,'B737','ST55C','economic'),(12,'B737','ST35D','economic'),(13,'B737','ST27A','economic'),(14,'Max10','ST26D','economic'),(15,'Max10','ST05E','economic'),(16,'Max10','ST18C','economic');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `booking_ref` varchar(30) NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'E125',85),(2,'E95',90),(3,'E45',75),(4,'E36',125),(5,'B06',885),(6,'B03',950),(7,'B16',980),(8,'B09',1150),(9,'B12',1050),(10,'E124',150);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 17:13:53
