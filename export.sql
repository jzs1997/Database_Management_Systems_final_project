CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beverage'),(2,'Bread & Bakery'),(3,'Dairy, Eggs & Cheese'),(4,'Cookies, Snacks & Candy'),(5,'Frozen Foods'),(6,'Fruits & Vegetables'),(7,'Meat & Seafood');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  `customer_first_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Baker','Emma'),(2,'Clark','Charlotte'),(3,'Kelly','Amelia'),(4,'Taylor','Luna'),(5,'Walker','Emily'),(6,'Smith','Leo'),(7,'Davis','Dylan'),(8,'Miller','Lincoln'),(9,'Martinez','Jayden'),(10,'Jones','Julia'),(11,'Begay','Maverick'),(12,'Chatto','Thomas');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `staff_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,3,1,3),(2,3,4,10),(3,5,2,24),(4,5,2,31),(5,5,2,11),(6,3,3,5),(7,1,1,28),(8,4,6,4),(9,4,2,36),(10,3,3,7),(11,5,2,17),(12,3,5,6),(13,1,6,9),(14,2,5,32),(15,1,1,23),(16,2,3,37),(17,5,4,2),(18,4,4,20),(19,3,4,40),(20,1,4,25),(21,5,2,38),(22,5,1,21),(23,1,1,13),(24,4,2,35),(25,1,4,12),(26,2,5,34),(27,3,4,30),(28,5,4,26),(29,2,5,33),(30,2,4,16),(31,4,1,29),(32,3,1,19),(33,5,4,39),(34,5,4,8),(35,3,4,14),(36,3,6,15),(37,2,2,18),(38,3,3,1),(39,4,3,27),(40,5,4,22);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `item_price` double DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_remains` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1.39,'CRYSTAL GEYSER ALPINE SPRING WATER',100,1),(2,2,'Coca Cola',200,1),(3,3.99,'Starbucks Coffee',199,1),(4,3.49,'OROWEAT COUNTRY STYLE WHITE BREAD',1000,2),(5,6.99,'GRADE AA extra large eggs 12',500,3),(6,0.99,'PEACH WHITE',300,6),(7,4.99,'THAI STYLE FRED RICE',1000,5),(8,3.99,'HUNGER MAN TURKEY MEAL',600,5),(9,5.99,'CURRY RICE',20,5),(10,11.49,'FROZEN TENDER CHIKEN BREASTS',500,5),(11,5,'KASHI CHOCOLATE ALMOND BUTTER',800,4),(12,25.13,'USDA CHOICE STEAK VALUE PACK',1000,7),(13,5.99,'GOLDEN POTATOS',500,6),(14,5,'SHRIMP COOKED',700,7),(15,6.49,'OREO DOUBLE STUF',1000,4),(16,2,'PEPSI',400,1),(17,1.29,'BLACK TEA',600,1),(18,3.49,'GARLIC BREAD',700,2),(19,2,'COUNTYSIDE CHEESE',600,3),(20,1.19,'SODA WAHTER',500,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `units` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `item_id` (`item_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,9,9,3,352,'Delivery','2022-06-18 15:12:32',1),(2,3,12,9,1,352,'Pickup','2022-06-18 15:12:32',1),(3,3,20,9,3,352,'Delivery','2022-06-18 15:12:32',1),(4,3,2,9,2,352,'Delivery','2022-06-18 15:12:32',1),(5,3,14,9,1,352,'Delivery','2022-06-18 15:12:32',1),(6,3,18,9,4,352,'Pickup','2022-06-18 15:12:32',1),(7,10,12,5,2,333,'Delivery','2022-06-28 03:42:35',4),(8,10,10,5,5,333,'Delivery','2022-06-28 03:42:35',4),(9,10,16,5,2,333,'Pickup','2022-06-28 03:42:35',4),(10,10,17,5,1,333,'Pickup','2022-06-28 03:42:35',4),(11,10,18,5,5,333,'Pickup','2022-06-28 03:42:35',4),(12,10,7,5,1,333,'Delivery','2022-06-28 03:42:35',4),(13,10,9,5,4,333,'Delivery','2022-06-28 03:42:35',4),(14,10,3,5,1,333,'Delivery','2022-06-28 03:42:35',4),(15,24,14,12,3,545,'Delivery','2022-06-05 19:48:37',2),(16,24,3,12,2,545,'Pickup','2022-06-05 19:48:37',2),(17,24,15,12,2,545,'Delivery','2022-06-05 19:48:37',2),(18,31,6,12,4,792,'Delivery','2022-06-16 06:01:49',2),(19,31,19,12,4,792,'Delivery','2022-06-16 06:01:49',2),(20,31,15,12,1,792,'Pickup','2022-06-16 06:01:49',2),(21,31,12,12,2,792,'Delivery','2022-06-16 06:01:49',2),(22,11,8,6,3,640,'Pickup','2022-06-17 00:09:37',2),(23,11,9,6,2,640,'Pickup','2022-06-17 00:09:37',2),(24,11,5,6,1,640,'Pickup','2022-06-17 00:09:37',2),(25,11,15,6,4,640,'Delivery','2022-06-17 00:09:37',2),(26,11,3,6,1,640,'Pickup','2022-06-17 00:09:37',2),(27,11,20,6,4,640,'Pickup','2022-06-17 00:09:37',2),(28,11,2,6,3,640,'Delivery','2022-06-17 00:09:37',2),(29,5,13,8,5,426,'Delivery','2022-06-10 01:00:38',3),(30,5,10,8,5,426,'Pickup','2022-06-10 01:00:38',3),(31,5,3,8,5,426,'Delivery','2022-06-10 01:00:38',3),(32,5,12,8,1,426,'Delivery','2022-06-10 01:00:38',3),(33,5,9,8,3,426,'Pickup','2022-06-10 01:00:38',3),(34,5,5,8,4,426,'Delivery','2022-06-10 01:00:38',3),(35,5,17,8,1,426,'Pickup','2022-06-10 01:00:38',3),(36,28,1,10,4,649,'Pickup','2022-06-04 14:21:11',1),(37,28,4,10,2,649,'Pickup','2022-06-04 14:21:11',1),(38,28,14,10,3,649,'Delivery','2022-06-04 14:21:11',1),(39,28,5,10,2,649,'Delivery','2022-06-04 14:21:11',1),(40,28,6,10,4,649,'Delivery','2022-06-04 14:21:11',1),(41,28,16,10,1,649,'Pickup','2022-06-04 14:21:11',1),(42,28,3,10,1,649,'Pickup','2022-06-04 14:21:11',1),(43,28,11,10,1,649,'Pickup','2022-06-04 14:21:11',1),(44,28,9,10,1,649,'Delivery','2022-06-04 14:21:11',1),(45,28,7,10,1,649,'Delivery','2022-06-04 14:21:11',1),(46,4,16,4,2,66,'Delivery','2022-06-04 00:17:05',6),(47,36,12,9,3,952,'Pickup','2022-06-23 21:27:33',2),(48,36,13,9,3,952,'Pickup','2022-06-23 21:27:33',2),(49,36,14,9,4,952,'Delivery','2022-06-23 21:27:33',2),(50,36,16,9,4,952,'Pickup','2022-06-23 21:27:33',2),(51,7,18,1,1,645,'Pickup','2022-07-01 00:21:05',3),(52,7,10,1,5,645,'Pickup','2022-07-01 00:21:05',3),(53,7,14,1,5,645,'Pickup','2022-07-01 00:21:05',3),(54,17,6,5,3,464,'Delivery','2022-06-22 00:38:04',2),(55,17,12,5,4,464,'Pickup','2022-06-22 00:38:04',2),(56,17,4,5,2,464,'Pickup','2022-06-22 00:38:04',2),(57,17,14,5,4,464,'Delivery','2022-06-22 00:38:04',2),(58,17,13,5,4,464,'Delivery','2022-06-22 00:38:04',2),(59,17,5,5,5,464,'Delivery','2022-06-22 00:38:04',2),(60,17,20,5,3,464,'Pickup','2022-06-22 00:38:04',2),(61,17,2,5,1,464,'Delivery','2022-06-22 00:38:04',2),(62,17,15,5,3,464,'Pickup','2022-06-22 00:38:04',2),(63,17,8,5,1,464,'Delivery','2022-06-22 00:38:04',2),(64,6,15,4,4,594,'Pickup','2022-06-23 23:08:17',5),(65,6,19,4,3,594,'Delivery','2022-06-23 23:08:17',5),(66,6,2,4,5,594,'Delivery','2022-06-23 23:08:17',5),(67,6,9,4,5,594,'Pickup','2022-06-23 23:08:17',5),(68,6,1,4,3,594,'Pickup','2022-06-23 23:08:17',5),(69,6,13,4,4,594,'Delivery','2022-06-23 23:08:17',5),(70,9,16,5,2,476,'Delivery','2022-06-22 13:42:02',6),(71,9,14,5,4,476,'Delivery','2022-06-22 13:42:02',6),(72,32,16,9,4,246,'Pickup','2022-06-03 13:19:35',5),(73,32,7,9,1,246,'Pickup','2022-06-03 13:19:35',5),(74,32,18,9,2,246,'Delivery','2022-06-03 13:19:35',5),(75,32,8,9,2,246,'Pickup','2022-06-03 13:19:35',5),(76,32,11,9,4,246,'Delivery','2022-06-03 13:19:35',5),(77,32,6,9,3,246,'Delivery','2022-06-03 13:19:35',5),(78,32,15,9,5,246,'Pickup','2022-06-03 13:19:35',5),(79,23,5,1,4,806,'Delivery','2022-06-20 19:13:24',1),(80,23,19,1,2,806,'Delivery','2022-06-20 19:13:24',1),(81,23,4,1,1,806,'Pickup','2022-06-20 19:13:24',1),(82,23,16,1,1,806,'Pickup','2022-06-20 19:13:24',1),(83,37,7,6,3,384,'Delivery','2022-06-20 14:06:02',3),(84,37,8,6,3,384,'Delivery','2022-06-20 14:06:02',3),(85,2,5,9,2,134,'Delivery','2022-06-21 12:55:54',4),(86,2,14,9,3,134,'Delivery','2022-06-21 12:55:54',4),(87,2,2,9,3,134,'Delivery','2022-06-21 12:55:54',4),(88,2,4,9,5,134,'Pickup','2022-06-21 12:55:54',4),(89,2,9,9,3,134,'Delivery','2022-06-21 12:55:54',4),(90,2,17,9,1,134,'Pickup','2022-06-21 12:55:54',4),(91,2,10,9,4,134,'Pickup','2022-06-21 12:55:54',4),(92,2,13,9,3,134,'Delivery','2022-06-21 12:55:54',4),(93,2,1,9,4,134,'Delivery','2022-06-21 12:55:54',4),(94,20,8,2,5,187,'Delivery','2022-06-10 01:26:47',4),(95,20,20,2,5,187,'Delivery','2022-06-10 01:26:47',4),(96,20,12,2,1,187,'Pickup','2022-06-10 01:26:47',4),(97,20,19,2,4,187,'Pickup','2022-06-10 01:26:47',4),(98,20,4,2,1,187,'Pickup','2022-06-10 01:26:47',4),(99,20,11,2,5,187,'Pickup','2022-06-10 01:26:47',4),(100,20,14,2,1,187,'Delivery','2022-06-10 01:26:47',4),(101,20,17,2,2,187,'Pickup','2022-06-10 01:26:47',4),(102,20,5,2,5,187,'Pickup','2022-06-10 01:26:47',4),(103,40,14,3,1,850,'Pickup','2022-06-21 16:30:17',4),(104,40,13,3,5,850,'Pickup','2022-06-21 16:30:17',4),(105,40,19,3,1,850,'Delivery','2022-06-21 16:30:17',4),(106,40,2,3,5,850,'Pickup','2022-06-21 16:30:17',4),(107,40,15,3,5,850,'Delivery','2022-06-21 16:30:17',4),(108,40,8,3,5,850,'Pickup','2022-06-21 16:30:17',4),(109,40,20,3,3,850,'Pickup','2022-06-21 16:30:17',4),(110,40,16,3,2,850,'Delivery','2022-06-21 16:30:17',4),(111,40,7,3,2,850,'Pickup','2022-06-21 16:30:17',4),(112,40,5,3,3,850,'Delivery','2022-06-21 16:30:17',4),(113,25,20,4,1,742,'Delivery','2022-06-19 06:43:21',4),(114,25,5,4,4,742,'Delivery','2022-06-19 06:43:21',4),(115,25,8,4,4,742,'Delivery','2022-06-19 06:43:21',4),(116,25,10,4,2,742,'Delivery','2022-06-19 06:43:21',4),(117,25,13,4,4,742,'Delivery','2022-06-19 06:43:21',4),(118,38,9,12,2,491,'Pickup','2022-06-04 00:54:40',2),(119,38,1,12,5,491,'Pickup','2022-06-04 00:54:40',2),(120,21,8,2,3,712,'Delivery','2022-06-06 17:52:22',1),(121,21,10,2,3,712,'Delivery','2022-06-06 17:52:22',1),(122,21,11,2,1,712,'Delivery','2022-06-06 17:52:22',1),(123,21,19,2,3,712,'Delivery','2022-06-06 17:52:22',1),(124,21,12,2,3,712,'Pickup','2022-06-06 17:52:22',1),(125,21,5,2,3,712,'Delivery','2022-06-06 17:52:22',1),(126,21,9,2,2,712,'Delivery','2022-06-06 17:52:22',1),(127,13,12,8,1,508,'Delivery','2022-06-12 13:52:30',1),(128,35,12,2,1,826,'Delivery','2022-06-21 04:22:03',2),(129,35,20,2,5,826,'Pickup','2022-06-21 04:22:03',2),(130,12,14,3,5,851,'Pickup','2022-06-01 17:59:27',4),(131,12,16,3,1,851,'Pickup','2022-06-01 17:59:27',4),(132,12,20,3,5,851,'Delivery','2022-06-01 17:59:27',4),(133,12,8,3,2,851,'Delivery','2022-06-01 17:59:27',4),(134,12,1,3,4,851,'Delivery','2022-06-01 17:59:27',4),(135,12,7,3,5,851,'Delivery','2022-06-01 17:59:27',4),(136,12,9,3,1,851,'Delivery','2022-06-01 17:59:27',4),(137,34,12,10,5,914,'Delivery','2022-06-08 21:18:12',5),(138,34,5,10,5,914,'Delivery','2022-06-08 21:18:12',5),(139,34,15,10,3,914,'Delivery','2022-06-08 21:18:12',5),(140,34,13,10,2,914,'Delivery','2022-06-08 21:18:12',5),(141,30,15,8,3,160,'Pickup','2022-06-19 06:17:55',4),(142,30,19,8,5,160,'Delivery','2022-06-19 06:17:55',4),(143,30,13,8,2,160,'Delivery','2022-06-19 06:17:55',4),(144,26,9,1,1,751,'Delivery','2022-06-18 12:00:28',4),(145,26,8,1,3,751,'Delivery','2022-06-18 12:00:28',4),(146,26,18,1,1,751,'Delivery','2022-06-18 12:00:28',4),(147,33,18,9,1,273,'Pickup','2022-06-24 20:15:33',5),(148,33,19,9,2,273,'Delivery','2022-06-24 20:15:33',5),(149,33,4,9,5,273,'Delivery','2022-06-24 20:15:33',5),(150,33,6,9,3,273,'Pickup','2022-06-24 20:15:33',5),(151,33,17,9,4,273,'Pickup','2022-06-24 20:15:33',5),(152,33,15,9,1,273,'Pickup','2022-06-24 20:15:33',5),(153,33,16,9,4,273,'Delivery','2022-06-24 20:15:33',5),(154,16,17,8,3,968,'Delivery','2022-06-17 17:27:33',4),(155,16,15,8,4,968,'Delivery','2022-06-17 17:27:33',4),(156,16,16,8,3,968,'Pickup','2022-06-17 17:27:33',4),(157,29,2,5,1,394,'Pickup','2022-06-09 15:21:28',1),(158,29,9,5,1,394,'Delivery','2022-06-09 15:21:28',1),(159,29,15,5,2,394,'Pickup','2022-06-09 15:21:28',1),(160,29,7,5,2,394,'Pickup','2022-06-09 15:21:28',1),(161,29,18,5,5,394,'Pickup','2022-06-09 15:21:28',1),(162,29,4,5,2,394,'Delivery','2022-06-09 15:21:28',1),(163,29,8,5,3,394,'Pickup','2022-06-09 15:21:28',1),(164,29,10,5,4,394,'Pickup','2022-06-09 15:21:28',1),(165,29,5,5,1,394,'Pickup','2022-06-09 15:21:28',1),(166,29,3,5,3,394,'Delivery','2022-06-09 15:21:28',1),(167,19,16,1,3,460,'Delivery','2022-06-09 06:45:54',1),(168,39,7,1,2,97,'Delivery','2022-06-10 21:05:06',4),(169,39,10,1,4,97,'Pickup','2022-06-10 21:05:06',4),(170,39,2,1,4,97,'Pickup','2022-06-10 21:05:06',4),(171,39,8,1,1,97,'Pickup','2022-06-10 21:05:06',4),(172,39,5,1,5,97,'Pickup','2022-06-10 21:05:06',4),(173,8,11,7,4,328,'Delivery','2022-06-13 18:39:45',4),(174,8,5,7,4,328,'Delivery','2022-06-13 18:39:45',4),(175,8,10,7,5,328,'Pickup','2022-06-13 18:39:45',4),(176,8,20,7,3,328,'Delivery','2022-06-13 18:39:45',4),(177,8,13,7,5,328,'Delivery','2022-06-13 18:39:45',4),(178,8,15,7,5,328,'Pickup','2022-06-13 18:39:45',4),(179,8,2,7,4,328,'Delivery','2022-06-13 18:39:45',4),(180,14,12,2,4,644,'Delivery','2022-06-24 13:14:43',4),(181,14,1,2,5,644,'Delivery','2022-06-24 13:14:43',4),(182,14,10,2,5,644,'Pickup','2022-06-24 13:14:43',4),(183,14,2,2,4,644,'Delivery','2022-06-24 13:14:43',4),(184,14,4,2,2,644,'Pickup','2022-06-24 13:14:43',4),(185,14,20,2,1,644,'Pickup','2022-06-24 13:14:43',4),(186,14,17,2,4,644,'Delivery','2022-06-24 13:14:43',4),(187,14,8,2,4,644,'Delivery','2022-06-24 13:14:43',4),(188,14,19,2,2,644,'Pickup','2022-06-24 13:14:43',4),(189,14,16,2,1,644,'Pickup','2022-06-24 13:14:43',4),(190,15,6,11,2,915,'Pickup','2022-06-19 02:15:01',6),(191,15,9,11,1,915,'Delivery','2022-06-19 02:15:01',6),(192,18,16,11,5,65,'Delivery','2022-06-25 02:41:43',2),(193,1,10,7,5,17,'Delivery','2022-06-15 01:39:44',3),(194,1,15,7,2,17,'Delivery','2022-06-15 01:39:44',3),(195,1,20,7,1,17,'Pickup','2022-06-15 01:39:44',3),(196,1,8,7,2,17,'Delivery','2022-06-15 01:39:44',3),(197,27,12,7,3,805,'Pickup','2022-06-16 20:35:08',3),(198,27,2,7,4,805,'Pickup','2022-06-16 20:35:08',3),(199,27,10,7,4,805,'Delivery','2022-06-16 20:35:08',3),(200,27,1,7,4,805,'Delivery','2022-06-16 20:35:08',3),(201,27,18,7,1,805,'Delivery','2022-06-16 20:35:08',3),(202,27,17,7,3,805,'Delivery','2022-06-16 20:35:08',3),(203,27,7,7,5,805,'Delivery','2022-06-16 20:35:08',3),(204,27,8,7,5,805,'Delivery','2022-06-16 20:35:08',3),(205,22,19,7,5,152,'Delivery','2022-06-05 18:22:22',4),(206,22,16,7,5,152,'Delivery','2022-06-05 18:22:22',4),(207,111,3,1,1,123,'Pickup','2022-07-11 08:19:13',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inventory_calculation` BEFORE INSERT ON `orders` FOR EACH ROW UPDATE items SET item_remains = item_remains - NEW.units WHERE item_id = NEW.item_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `payment_amount` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (17,79.60000000000001,7),(65,10,11),(66,4,4),(97,102.88,1),(134,141.18,9),(152,20,7),(160,41.45,8),(187,130.05,2),(246,83.37,9),(273,47.56000000000001,9),(328,179.38,7),(333,163.39000000000004,5),(352,69.63,9),(384,26.94,6),(394,132.27,5),(426,179.70000000000002,8),(460,6,1),(464,218.41,5),(476,24,5),(491,18.93,12),(508,25.13,8),(545,35.96,12),(594,100.03999999999999,4),(640,71.65,6),(644,208.21,2),(645,85.94,1),(649,67.45,10),(712,165.77999999999997,2),(742,92.05000000000001,4),(751,21.450000000000003,1),(792,68.71000000000001,12),(805,187.17000000000002,7),(806,37.45,1),(826,31.08,2),(850,137.87,3),(851,77.43,3),(914,192.04999999999998,10),(915,7.970000000000001,11),(952,121.36,9),(968,35.83,8);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `staff_id` int NOT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'Oliver Smith'),(2,'Lucas Miller'),(3,'William Garcia'),(4,'Jackson Davis'),(5,'Levi Martinez'),(6,'Brown Mateo');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `staffServiceFreqDaily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staffServiceFreqDaily`(staff VARCHAR(255))
BEGIN
	SELECT staff_name, COUNT(order_type) AS counts, order_type
	FROM
		(SELECT orders.order_type, orders.order_id, orders.staff_id, orders.ts, staffs.staff_name
		FROM orders
		LEFT JOIN staffs ON orders.staff_id = staffs.staff_id
		GROUP BY orders.order_id) AS tmp1
	GROUP BY staff_id, order_type
    HAVING tmp1.staff_name = staff;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 13:57:03
