-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_design
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `rarity` int DEFAULT NULL,
  `attack` int DEFAULT NULL,
  `health` int DEFAULT NULL,
  `weapon_type` varchar(20) DEFAULT NULL,
  `element` varchar(20) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `weapon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_to_weapon_type` (`weapon_type`),
  KEY `character_to_element` (`element`),
  KEY `character_to_user` (`user_id`),
  KEY `character_to_weapon` (`weapon_id`),
  CONSTRAINT `character_to_element` FOREIGN KEY (`element`) REFERENCES `elements` (`element`),
  CONSTRAINT `character_to_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `character_to_weapon` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`),
  CONSTRAINT `character_to_weapon_type` FOREIGN KEY (`weapon_type`) REFERENCES `weapon_types` (`weapon_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Zhongli',90,5,892,54610,'Polearm','Geo',1,1),(2,'Bennett',80,4,875,28661,'Sword','Pyro',1,2),(3,'Eula',81,5,1899,20470,'Claymore','Cyro',2,3),(4,'Lisa',20,4,209,2661,'Catalyst','Electro',2,4);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17 12:53:13
