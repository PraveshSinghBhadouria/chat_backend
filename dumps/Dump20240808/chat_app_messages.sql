CREATE DATABASE  IF NOT EXISTS `chat_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `chat_app`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: chat_app
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,3,2,'hyy','2024-08-07 16:42:48'),(2,2,3,'hyy','2024-08-07 16:43:38'),(3,3,2,'hlq','2024-08-07 16:43:43'),(4,3,2,'hhhh','2024-08-07 16:44:07'),(5,2,3,'hjhjhj','2024-08-07 16:44:11'),(6,1,3,'hyy','2024-08-07 16:45:42'),(7,2,1,'nhi deepak ese nhi','2024-08-07 16:45:45'),(8,1,2,'hh','2024-08-07 16:45:51'),(9,1,2,'fhfhft','2024-08-07 16:45:54'),(10,1,2,'hh','2024-08-07 16:49:34'),(11,2,1,'hh','2024-08-07 16:49:44'),(12,2,1,'gfhfg','2024-08-07 16:51:33'),(13,1,2,'ghfg','2024-08-07 16:54:12'),(14,1,2,'hyy','2024-08-07 16:56:00'),(15,3,2,'hyy','2024-08-07 17:12:50'),(16,3,2,'dfds','2024-08-07 17:12:54'),(17,3,1,'hyy','2024-08-07 17:35:54'),(18,3,1,'hyy','2024-08-07 17:41:30'),(19,2,3,'hyy','2024-08-07 17:45:39'),(20,3,2,'hyy','2024-08-07 17:45:43'),(21,3,2,'hyyy','2024-08-07 17:46:55'),(22,2,3,'hlw','2024-08-07 17:47:00'),(23,3,1,'hhh','2024-08-07 17:47:09'),(24,2,3,'hey','2024-08-07 17:51:09'),(25,3,1,'haan','2024-08-07 17:51:13'),(26,2,3,'hi','2024-08-07 17:55:35'),(27,3,1,'Pravesh','2024-08-07 17:55:48'),(28,2,3,'hi','2024-08-07 17:57:52'),(29,3,2,'hyy','2024-08-07 18:03:12'),(30,3,2,'dfd','2024-08-07 18:06:14'),(31,3,2,'dfdfd','2024-08-07 18:06:16'),(32,3,2,'dfsds','2024-08-07 18:07:01'),(33,3,2,'vcvc','2024-08-07 18:10:39'),(34,3,2,'dfd','2024-08-07 18:11:04'),(35,3,2,'cvx','2024-08-07 18:11:45'),(36,3,2,'vxvxc','2024-08-07 18:12:16'),(37,3,2,'xcxc','2024-08-07 18:12:37'),(38,3,2,'vxxcxc','2024-08-07 18:12:55'),(39,3,2,'vxv','2024-08-07 18:14:42'),(40,2,3,'hyy','2024-08-07 18:15:20'),(41,3,2,'gg','2024-08-07 18:15:26'),(42,3,2,'xcxc','2024-08-07 18:15:33'),(43,3,2,'xcvxc','2024-08-07 18:18:00'),(44,2,3,'xcvcx','2024-08-07 18:18:02'),(45,3,2,'hyyy','2024-08-07 18:21:26'),(46,2,3,'cccc','2024-08-07 18:22:19'),(47,3,2,'ccccc','2024-08-07 18:23:38'),(48,2,3,'vvv','2024-08-07 18:23:50'),(49,2,3,'vdvd','2024-08-07 18:23:54'),(50,3,2,'fvdfdvd','2024-08-07 18:23:57'),(51,3,2,'hyy','2024-08-07 18:25:30'),(52,2,3,'hlw','2024-08-07 18:25:34'),(53,2,1,'ccs','2024-08-07 18:25:42'),(54,3,2,'hyy','2024-08-07 18:31:29'),(55,2,3,'hyyy','2024-08-07 18:31:32'),(56,2,3,'bgbfg','2024-08-07 18:31:39'),(57,3,2,'fgfgf','2024-08-07 18:31:42'),(58,3,2,'dcdc','2024-08-07 18:32:31'),(59,3,2,'ddfd','2024-08-07 18:33:04'),(60,3,2,'xcxcx','2024-08-07 18:33:33'),(61,2,3,'cxcxcx','2024-08-07 18:33:44'),(62,3,2,'hi','2024-08-07 18:54:34'),(63,2,3,'hiiiiiiiiiiiii','2024-08-07 18:54:40'),(64,3,2,'hi','2024-08-07 18:57:03'),(65,3,2,'hiii','2024-08-07 18:58:42'),(66,2,1,'ggggggggggggg','2024-08-07 18:58:47'),(67,4,2,'hii','2024-08-07 19:37:03'),(68,4,2,'hello','2024-08-07 19:37:13'),(69,4,2,'hiii','2024-08-07 19:37:15');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08  1:15:39
