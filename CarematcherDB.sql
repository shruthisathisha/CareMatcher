-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: carematcher
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Table structure for table `ADDRESS`
--

DROP TABLE IF EXISTS `ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDRESS` (
  `ADDRESSID` bigint(20) NOT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `ST` varchar(255) DEFAULT NULL,
  `STREET` varchar(255) DEFAULT NULL,
  `ZIP` varchar(255) DEFAULT NULL,
  `USER_USERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADDRESSID`),
  KEY `FK_ADDRESS_USER_USERID` (`USER_USERID`),
  CONSTRAINT `FK_ADDRESS_USER_USERID` FOREIGN KEY (`USER_USERID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSURANCE`
--

DROP TABLE IF EXISTS `INSURANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSURANCE` (
  `INSURANCEID` bigint(20) NOT NULL,
  `COMPANY` varchar(255) DEFAULT NULL,
  `PLANNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INSURANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSURANCE`
--

LOCK TABLES `INSURANCE` WRITE;
/*!40000 ALTER TABLE `INSURANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSURANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSURANCE_USER`
--

DROP TABLE IF EXISTS `INSURANCE_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSURANCE_USER` (
  `Insurance_INSURANCEID` bigint(20) NOT NULL,
  `users_USERID` bigint(20) NOT NULL,
  PRIMARY KEY (`Insurance_INSURANCEID`,`users_USERID`),
  KEY `FK_INSURANCE_USER_users_USERID` (`users_USERID`),
  CONSTRAINT `FK_INSURANCE_USER_Insurance_INSURANCEID` FOREIGN KEY (`Insurance_INSURANCEID`) REFERENCES `INSURANCE` (`INSURANCEID`),
  CONSTRAINT `FK_INSURANCE_USER_users_USERID` FOREIGN KEY (`users_USERID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSURANCE_USER`
--

LOCK TABLES `INSURANCE_USER` WRITE;
/*!40000 ALTER TABLE `INSURANCE_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSURANCE_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LICENSE`
--

DROP TABLE IF EXISTS `LICENSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LICENSE` (
  `LICENSEID` bigint(20) NOT NULL,
  `LICENSEDESCRIPTION` varchar(255) DEFAULT NULL,
  `LICENSENAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LICENSEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LICENSE`
--

LOCK TABLES `LICENSE` WRITE;
/*!40000 ALTER TABLE `LICENSE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LICENSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LICENSE_USER`
--

DROP TABLE IF EXISTS `LICENSE_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LICENSE_USER` (
  `License_LICENSEID` bigint(20) NOT NULL,
  `providersWithLicense_USERID` bigint(20) NOT NULL,
  PRIMARY KEY (`License_LICENSEID`,`providersWithLicense_USERID`),
  KEY `FK_LICENSE_USER_providersWithLicense_USERID` (`providersWithLicense_USERID`),
  CONSTRAINT `FK_LICENSE_USER_License_LICENSEID` FOREIGN KEY (`License_LICENSEID`) REFERENCES `LICENSE` (`LICENSEID`),
  CONSTRAINT `FK_LICENSE_USER_providersWithLicense_USERID` FOREIGN KEY (`providersWithLicense_USERID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LICENSE_USER`
--

LOCK TABLES `LICENSE_USER` WRITE;
/*!40000 ALTER TABLE `LICENSE_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `LICENSE_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHONE`
--

DROP TABLE IF EXISTS `PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PHONE` (
  `PHONEID` bigint(20) NOT NULL,
  `PHONENUMBER` varchar(255) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PHONEID`),
  KEY `FK_PHONE_USER_ID` (`USER_ID`),
  CONSTRAINT `FK_PHONE_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHONE`
--

LOCK TABLES `PHONE` WRITE;
/*!40000 ALTER TABLE `PHONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REVIEW` (
  `REVIEWID` bigint(20) NOT NULL,
  `RATING` double DEFAULT NULL,
  `REVIEW` varchar(255) DEFAULT NULL,
  `providerReviewed_userId` bigint(20) DEFAULT NULL,
  `REVIEWINGCUSTOMER_USERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`REVIEWID`),
  KEY `FK_REVIEW_REVIEWINGCUSTOMER_USERID` (`REVIEWINGCUSTOMER_USERID`),
  KEY `FK_REVIEW_providerReviewed_userId` (`providerReviewed_userId`),
  CONSTRAINT `FK_REVIEW_REVIEWINGCUSTOMER_USERID` FOREIGN KEY (`REVIEWINGCUSTOMER_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_REVIEW_providerReviewed_userId` FOREIGN KEY (`providerReviewed_userId`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',200);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE`
--

DROP TABLE IF EXISTS `SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE` (
  `SERVICEID` bigint(20) NOT NULL,
  `CATEGORIES` longblob,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SERVICENAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SERVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE`
--

LOCK TABLES `SERVICE` WRITE;
/*!40000 ALTER TABLE `SERVICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_USER`
--

DROP TABLE IF EXISTS `SERVICE_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_USER` (
  `Service_SERVICEID` bigint(20) NOT NULL,
  `customers_USERID` bigint(20) NOT NULL,
  `practices_USERID` bigint(20) NOT NULL,
  `providers_USERID` bigint(20) NOT NULL,
  PRIMARY KEY (`Service_SERVICEID`,`customers_USERID`,`practices_USERID`,`providers_USERID`),
  KEY `FK_SERVICE_USER_practices_USERID` (`practices_USERID`),
  KEY `FK_SERVICE_USER_providers_USERID` (`providers_USERID`),
  KEY `FK_SERVICE_USER_customers_USERID` (`customers_USERID`),
  CONSTRAINT `FK_SERVICE_USER_Service_SERVICEID` FOREIGN KEY (`Service_SERVICEID`) REFERENCES `SERVICE` (`SERVICEID`),
  CONSTRAINT `FK_SERVICE_USER_customers_USERID` FOREIGN KEY (`customers_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_SERVICE_USER_practices_USERID` FOREIGN KEY (`practices_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_SERVICE_USER_providers_USERID` FOREIGN KEY (`providers_USERID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_USER`
--

LOCK TABLES `SERVICE_USER` WRITE;
/*!40000 ALTER TABLE `SERVICE_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `USERID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `MIDINIT` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `ACCEPTINGNEWPATIENTS` tinyint(1) DEFAULT '0',
  `AVAILABILITY` varchar(255) DEFAULT NULL,
  `BIOGRAPHY` varchar(255) DEFAULT NULL,
  `WILLTRAVEL` tinyint(1) DEFAULT '0',
  `YEARSPRACTICING` int(11) DEFAULT NULL,
  `DATEOFBIRTH` date DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Customer','kbuck210@gmail.com','Kevin','Buckley','','password','username',0,NULL,NULL,0,NULL,'2015-05-31','placeholder'),(51,'Customer','kennedy31407@yahoo.com','Liz','Kennedy','','password','username',0,NULL,NULL,0,NULL,'2015-05-31','placeholder'),(101,'Customer','test@test1.com','Tester','Test','','password','username',0,NULL,NULL,0,NULL,'2015-05-31','placeholder'),(151,'Customer','test2@test.com','Teset','Testing','','password','username',0,NULL,NULL,0,NULL,'2015-05-31','placeholder');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_INSURANCE`
--

DROP TABLE IF EXISTS `USER_INSURANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_INSURANCE` (
  `Customer_USERID` bigint(20) NOT NULL,
  `insurances_INSURANCEID` bigint(20) NOT NULL,
  `Practice_USERID` bigint(20) NOT NULL,
  `acceptedInsurance_INSURANCEID` bigint(20) NOT NULL,
  PRIMARY KEY (`Customer_USERID`,`insurances_INSURANCEID`,`Practice_USERID`,`acceptedInsurance_INSURANCEID`),
  KEY `FK_USER_INSURANCE_Practice_USERID` (`Practice_USERID`),
  KEY `FK_USER_INSURANCE_acceptedInsurance_INSURANCEID` (`acceptedInsurance_INSURANCEID`),
  KEY `FK_USER_INSURANCE_insurances_INSURANCEID` (`insurances_INSURANCEID`),
  CONSTRAINT `FK_USER_INSURANCE_Customer_USERID` FOREIGN KEY (`Customer_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_INSURANCE_Practice_USERID` FOREIGN KEY (`Practice_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_INSURANCE_acceptedInsurance_INSURANCEID` FOREIGN KEY (`acceptedInsurance_INSURANCEID`) REFERENCES `INSURANCE` (`INSURANCEID`),
  CONSTRAINT `FK_USER_INSURANCE_insurances_INSURANCEID` FOREIGN KEY (`insurances_INSURANCEID`) REFERENCES `INSURANCE` (`INSURANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_INSURANCE`
--

LOCK TABLES `USER_INSURANCE` WRITE;
/*!40000 ALTER TABLE `USER_INSURANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_INSURANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_LICENSE`
--

DROP TABLE IF EXISTS `USER_LICENSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_LICENSE` (
  `Provider_USERID` bigint(20) NOT NULL,
  `licenses_LICENSEID` bigint(20) NOT NULL,
  PRIMARY KEY (`Provider_USERID`,`licenses_LICENSEID`),
  KEY `FK_USER_LICENSE_licenses_LICENSEID` (`licenses_LICENSEID`),
  CONSTRAINT `FK_USER_LICENSE_Provider_USERID` FOREIGN KEY (`Provider_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_LICENSE_licenses_LICENSEID` FOREIGN KEY (`licenses_LICENSEID`) REFERENCES `LICENSE` (`LICENSEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_LICENSE`
--

LOCK TABLES `USER_LICENSE` WRITE;
/*!40000 ALTER TABLE `USER_LICENSE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_LICENSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REVIEW`
--

DROP TABLE IF EXISTS `USER_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REVIEW` (
  `Customer_USERID` bigint(20) NOT NULL,
  `reviews_REVIEWID` bigint(20) NOT NULL,
  PRIMARY KEY (`Customer_USERID`,`reviews_REVIEWID`),
  KEY `FK_USER_REVIEW_reviews_REVIEWID` (`reviews_REVIEWID`),
  CONSTRAINT `FK_USER_REVIEW_Customer_USERID` FOREIGN KEY (`Customer_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_REVIEW_reviews_REVIEWID` FOREIGN KEY (`reviews_REVIEWID`) REFERENCES `REVIEW` (`REVIEWID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REVIEW`
--

LOCK TABLES `USER_REVIEW` WRITE;
/*!40000 ALTER TABLE `USER_REVIEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SERVICE`
--

DROP TABLE IF EXISTS `USER_SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SERVICE` (
  `Provider_USERID` bigint(20) NOT NULL,
  `servicesPerformed_SERVICEID` bigint(20) NOT NULL,
  `Customer_USERID` bigint(20) NOT NULL,
  `servicesDesired_SERVICEID` bigint(20) NOT NULL,
  PRIMARY KEY (`Provider_USERID`,`servicesPerformed_SERVICEID`,`Customer_USERID`,`servicesDesired_SERVICEID`),
  KEY `FK_USER_SERVICE_servicesPerformed_SERVICEID` (`servicesPerformed_SERVICEID`),
  KEY `FK_USER_SERVICE_Customer_USERID` (`Customer_USERID`),
  KEY `FK_USER_SERVICE_servicesDesired_SERVICEID` (`servicesDesired_SERVICEID`),
  CONSTRAINT `FK_USER_SERVICE_Customer_USERID` FOREIGN KEY (`Customer_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_SERVICE_Provider_USERID` FOREIGN KEY (`Provider_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_SERVICE_servicesDesired_SERVICEID` FOREIGN KEY (`servicesDesired_SERVICEID`) REFERENCES `SERVICE` (`SERVICEID`),
  CONSTRAINT `FK_USER_SERVICE_servicesPerformed_SERVICEID` FOREIGN KEY (`servicesPerformed_SERVICEID`) REFERENCES `SERVICE` (`SERVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SERVICE`
--

LOCK TABLES `USER_SERVICE` WRITE;
/*!40000 ALTER TABLE `USER_SERVICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_USER`
--

DROP TABLE IF EXISTS `USER_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_USER` (
  `Provider_USERID` bigint(20) NOT NULL,
  `practicesWorkedAt_USERID` bigint(20) NOT NULL,
  `Practice_USERID` bigint(20) NOT NULL,
  `providersAtPractice_USERID` bigint(20) NOT NULL,
  PRIMARY KEY (`Provider_USERID`,`practicesWorkedAt_USERID`,`Practice_USERID`,`providersAtPractice_USERID`),
  KEY `FK_USER_USER_practicesWorkedAt_USERID` (`practicesWorkedAt_USERID`),
  KEY `FK_USER_USER_providersAtPractice_USERID` (`providersAtPractice_USERID`),
  KEY `FK_USER_USER_Practice_USERID` (`Practice_USERID`),
  CONSTRAINT `FK_USER_USER_Practice_USERID` FOREIGN KEY (`Practice_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_USER_Provider_USERID` FOREIGN KEY (`Provider_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_USER_practicesWorkedAt_USERID` FOREIGN KEY (`practicesWorkedAt_USERID`) REFERENCES `USER` (`USERID`),
  CONSTRAINT `FK_USER_USER_providersAtPractice_USERID` FOREIGN KEY (`providersAtPractice_USERID`) REFERENCES `USER` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_USER`
--

LOCK TABLES `USER_USER` WRITE;
/*!40000 ALTER TABLE `USER_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-31 17:09:24
