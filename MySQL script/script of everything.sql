-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: barcs
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `owner_status` varchar(1) DEFAULT NULL,
  `employee` int(11) DEFAULT NULL,
  KEY `employee` (`employee`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('gugusha','gugushaaa','A',1),('bot1a','bot1b','E',4),('bot2a','bot2b','E',5);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_info`
--

DROP TABLE IF EXISTS `address_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `building` int(11) DEFAULT NULL,
  `home_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_info`
--

LOCK TABLES `address_info` WRITE;
/*!40000 ALTER TABLE `address_info` DISABLE KEYS */;
INSERT INTO `address_info` VALUES (1,'tbilisi','tamarashvili',3,23),(2,'tbilisi','chavchavadze',1,15),(3,'kutaisi','rustavelis',4,57);
/*!40000 ALTER TABLE `address_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonuses`
--

DROP TABLE IF EXISTS `bonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonuses` (
  `project_id` int(11) DEFAULT NULL,
  `problem_type` int(11) DEFAULT NULL,
  `bonus_percent` int(11) DEFAULT NULL,
  KEY `project_id` (`project_id`),
  KEY `problem_type` (`problem_type`),
  CONSTRAINT `bonuses_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `bonuses_ibfk_2` FOREIGN KEY (`problem_type`) REFERENCES `problem_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonuses`
--

LOCK TABLES `bonuses` WRITE;
/*!40000 ALTER TABLE `bonuses` DISABLE KEYS */;
INSERT INTO `bonuses` VALUES (1,1,40),(1,2,60);
/*!40000 ALTER TABLE `bonuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `home_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'598889977','ragaca@mail.com','2441568'),(2,'599874556','mem@mail.com','2136698'),(3,'598889977','ragaca@mail.com','2441568'),(4,'599874556','mem@mail.com','2136698'),(5,'598889977','ragaca@mail.com','2441568'),(6,'599874556','mem@mail.com','2136698');
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abr` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'tbd','tbilisi department','dddddd'),(11,'kud','kutaisi department','esaa kutaisis department');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `private` int(11) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `department` (`department`),
  KEY `private` (`private`),
  KEY `address` (`address`),
  KEY `contact` (`contact`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`position`) REFERENCES `positions` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`department`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`private`) REFERENCES `private_info` (`id`),
  CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`address`) REFERENCES `address_info` (`id`),
  CONSTRAINT `employees_ibfk_5` FOREIGN KEY (`contact`) REFERENCES `contact_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'irakli','gugushvili',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL),(4,'boti1a','boti1b','1999-05-01',NULL,NULL,3,1,1,1,1,1),(5,'boti2a','boti2b','1998-05-01',NULL,NULL,5,2,11,2,2,2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abr` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'kac','kacuri kaci','esaa kacuri kacis pozicia'),(2,'nub','nubi','esaa nubis pozicia');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_info`
--

DROP TABLE IF EXISTS `private_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(255) DEFAULT NULL,
  `doc_serial` int(11) DEFAULT NULL,
  `doc_number` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_info`
--

LOCK TABLES `private_info` WRITE;
/*!40000 ALTER TABLE `private_info` DISABLE KEYS */;
INSERT INTO `private_info` VALUES (1,'piradoba',1230003,6200320,'2016-10-10'),(2,'pasporti',999999,310310311,'2016-10-10'),(3,'piradoba',1230003,6200320,'2016-10-10'),(4,'pasporti',9999,312551,'2016-10-10');
/*!40000 ALTER TABLE `private_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_types`
--

DROP TABLE IF EXISTS `problem_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abr` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_types`
--

LOCK TABLES `problem_types` WRITE;
/*!40000 ALTER TABLE `problem_types` DISABLE KEYS */;
INSERT INTO `problem_types` VALUES (1,'biznes analizi','ba'),(2,'sistem analizi','sa'),(3,'developmenti','dp'),(4,'xarisx control','ba'),(5,'proeqtebis martva','pm');
/*!40000 ALTER TABLE `problem_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `problem_type` int(11) DEFAULT NULL,
  `employee` int(11) DEFAULT NULL,
  `time_given` int(11) DEFAULT NULL,
  `time_used` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_type` (`problem_type`),
  KEY `employee` (`employee`),
  KEY `project` (`project`),
  CONSTRAINT `problems_ibfk_1` FOREIGN KEY (`problem_type`) REFERENCES `problem_types` (`id`),
  CONSTRAINT `problems_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`),
  CONSTRAINT `problems_ibfk_3` FOREIGN KEY (`project`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'dzroxis yidva',1,4,48,24,'D',1),(2,'dzroxis mowvela',2,4,2,5,'D',1),(3,'rdzis gayidva',2,5,50,60,'D',1);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_problem_types`
--

DROP TABLE IF EXISTS `project_problem_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_problem_types` (
  `project_id` int(11) DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  KEY `project_id` (`project_id`),
  KEY `problem_id` (`problem_id`),
  CONSTRAINT `project_problem_types_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project_types` (`id`),
  CONSTRAINT `project_problem_types_ibfk_2` FOREIGN KEY (`problem_id`) REFERENCES `problem_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_problem_types`
--

LOCK TABLES `project_problem_types` WRITE;
/*!40000 ALTER TABLE `project_problem_types` DISABLE KEYS */;
INSERT INTO `project_problem_types` VALUES (1,1),(1,2),(2,1),(2,3),(2,4),(3,1),(3,2),(5,2),(5,3),(4,4);
/*!40000 ALTER TABLE `project_problem_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_types`
--

DROP TABLE IF EXISTS `project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abr` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_types`
--

LOCK TABLES `project_types` WRITE;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
INSERT INTO `project_types` VALUES (1,'shiga proeqti','sp'),(2,'gare proeqti','gp'),(3,'integraciuli proeqti','np'),(4,'infrastruqturuli proeqti','fp'),(5,'shiga proeqti','sp'),(6,'gare proeqti','gp'),(7,'integraciuli proeqti','np'),(8,'infrastruqturuli proeqti','fp'),(9,'shiga proeqti','sp'),(10,'gare proeqti','gp'),(11,'integraciuli proeqti','np'),(12,'infrastruqturuli proeqti','fp'),(13,'shiga proeqti','sp'),(14,'gare proeqti','gp'),(15,'integraciuli proeqti','np'),(16,'infrastruqturuli proeqti','fp');
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `project_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_type` (`project_type`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`project_type`) REFERENCES `project_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'rdzis migeba','2001-05-01','2001-05-01','ferma n2',1000,100,'D',1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-11 22:57:24
