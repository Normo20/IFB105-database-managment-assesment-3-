CREATE DATABASE  IF NOT EXISTS `Interactive_Voting_Form_Database1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Interactive_Voting_Form_Database1`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: Interactive_Voting_Form_Database1
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for File ``
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `FileName` varchar(50) NOT NULL,
  `FolderName` varchar(50) NOT NULL,
  `Size` int(100) DEFAULT NULL default '0',
  `MemberNR` int(10) NOT NULL,
  PRIMARY KEY (`FileName`, `FolderName`),
  CONSTRAINT `File_ibfk_1` FOREIGN KEY (`MemberNr`) REFERENCES `Member`(`MemberNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--


LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES ('ping','pop',123,1),('pinga','popa',124,2),('pingo','popo',125,3),('pingi','popi',126,4);
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member` (
  `MemberNr` int(10) NOT NULL,
  `Fullname` varchar(50) NOT NULL DEFAULT '',
  `Adress` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MemberNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Jim P','21 cola rd','pli'),(2,'Jim w','22 cola rd','plis'),(3,'Jim o','23 cola rd','plip'),(4,'Jim Ph','24 cola rd','plic');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Voting`
--

DROP TABLE IF EXISTS `Voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Voting` (
  `MemberNr` int(10) NOT NULL,
  `MotionNr` int(11) NOT NULL,
  `option` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`MotionNr`,`MemberNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voting`
--

LOCK TABLES `Voting` WRITE;
/*!40000 ALTER TABLE `Voting` DISABLE KEYS */;
INSERT INTO `Voting` VALUES (1,1,'yes'),(2,2,'no'),(3,3,'yes'),(4,4,'no');
/*!40000 ALTER TABLE `Voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Motion`
--

DROP TABLE IF EXISTS `Motion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Motion` (
  `MotionNr` int(11) NOT NULL,
  `MotionText` varchar(50) NOT NULL,
  PRIMARY KEY (`MotionText`),
  CONSTRAINT `Motion_ibfk_1` FOREIGN KEY (`MotionNr`) REFERENCES `Voting` (`MotionNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Motion`
--

LOCK TABLES `Motion` WRITE;
/*!40000 ALTER TABLE `Motion` DISABLE KEYS */;
INSERT INTO `Motion` VALUES (1,'Change Lane sign'),(2,'Change lines'),(3,'Change colour'),(4,'Change Surface');
/*!40000 ALTER TABLE `Motion` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-06 20:49:28
