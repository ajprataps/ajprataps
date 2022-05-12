CREATE DATABASE  IF NOT EXISTS `pms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pms`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: pms
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `allowances`
--

DROP TABLE IF EXISTS `allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowances` (
  `allowance_id` int NOT NULL,
  `medical_allowance` double DEFAULT NULL,
  `house_rent_allowance` double DEFAULT NULL,
  `travel_allowance` double DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`allowance_id`),
  KEY `FK_employee_id_all_idx` (`employee_id`),
  CONSTRAINT `FK_employee_id_all` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowances`
--

LOCK TABLES `allowances` WRITE;
/*!40000 ALTER TABLE `allowances` DISABLE KEYS */;
INSERT INTO `allowances` VALUES (10001,5000,100.5,0,4004),(10002,8051.5,674.52,251.36,4002),(10003,7541.69,587.1,200,4003),(10004,8763.2,212.5,750.1,4001),(10005,0,0,120,4005);
/*!40000 ALTER TABLE `allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compensation`
--

DROP TABLE IF EXISTS `compensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compensation` (
  `compensation_id` int NOT NULL,
  `bonus` double DEFAULT NULL,
  `appraisal` double DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`compensation_id`),
  KEY `FK_employee_id_comp_idx` (`employee_id`),
  CONSTRAINT `FK_employee_id_comp` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compensation`
--

LOCK TABLES `compensation` WRITE;
/*!40000 ALTER TABLE `compensation` DISABLE KEYS */;
INSERT INTO `compensation` VALUES (20001,500,1500,4005),(20002,0,1500,4004),(20003,100,1000,4001),(20004,150,1200,4002);
/*!40000 ALTER TABLE `compensation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductions` (
  `deduction_id` int NOT NULL,
  `income_tax` double DEFAULT NULL,
  `professional_tax` double DEFAULT NULL,
  `loan` double DEFAULT NULL,
  `pension_funds` double DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`deduction_id`),
  KEY `FK_employee_id_ded_idx` (`employee_id`),
  CONSTRAINT `FK_employee_id_ded` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
INSERT INTO `deductions` VALUES (30001,222.1,200,0,50,4001),(30002,144.65,200,120,50,4002),(30003,222.1,200,0,50,4004),(30004,154.8,200,0,50,4005);
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Finance & Accounting'),(2,'Research & Development'),(3,'Human Resource'),(4,'IT'),(5,'Risk & Strategy'),(6,'Support'),(7,'Administration');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `phone_number` int NOT NULL,
  `address` varchar(200) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `bank_account_number` int NOT NULL,
  `department_id` int NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_exit` date DEFAULT NULL,
  `type_of_employment` varchar(12) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `FK_department_id_idx` (`department_id`),
  CONSTRAINT `FK_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (4001,'Andrew Fisher','Software Engineer',15242513,'104, Kings St, Sydney, NS','1B4 89J',52412,4,'2013-12-12',NULL,'Full-time'),(4002,'Anton Feureck','Data Engineer',12547852,'5, Queens St, Sydney, NS','2B6 542',74122,4,'2014-01-24',NULL,'Full-time'),(4003,'Aston Kutcher','HR',78452121,'10, Charles St, Sydney, NS','54N K78',784512252,3,'2015-09-22',NULL,'Full-time'),(4004,'John Strugis','Risk Analyst',87542125,'Halifax, NS','8K2 JH1',75412252,5,'2021-01-15',NULL,'Part-time'),(4005,'Stefan Sieber','Researcher',15421452,'Toronto, ON','78N U14',7541214,2,'2021-02-02',NULL,'Part-time'),(4006,'Monika Kohlbecher','Business Analyst',87451212,'Toronto, ON','74L 54L',53698523,4,'2015-08-22','2020-12-01','Full-time');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `leave_id` int NOT NULL,
  `type_of_leave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
INSERT INTO `leave` VALUES (1,'Medical'),(2,'Vacation'),(3,'Floating'),(4,'Unpaid');
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_taken`
--

DROP TABLE IF EXISTS `leave_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_taken` (
  `leave_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `to_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `monthly_working_days` int DEFAULT NULL,
  KEY `FK_employee_id_idx` (`employee_id`),
  KEY `FK_leave_id_idx` (`leave_id`),
  CONSTRAINT `FK_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_leave_id` FOREIGN KEY (`leave_id`) REFERENCES `leave` (`leave_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_taken`
--

LOCK TABLES `leave_taken` WRITE;
/*!40000 ALTER TABLE `leave_taken` DISABLE KEYS */;
INSERT INTO `leave_taken` VALUES (1,4001,'2020-03-03','2020-01-04','Had fever',22),(1,4004,'2020-03-01','2020-03-01','Not feeling well',22),(2,4001,'2020-03-08','2020-03-18','Family vacation',22),(3,4002,'2020-04-11','2020-04-11','Regional festival',22),(4,4005,'2020-04-18','2020-04-25','Personal issues',15);
/*!40000 ALTER TABLE `leave_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `transaction_id` int NOT NULL,
  `net_income` double DEFAULT NULL,
  `gross_income` double DEFAULT NULL,
  `salary_month` varchar(5) DEFAULT NULL,
  `salary_year` year DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FK_employee_id_sal_idx` (`employee_id`),
  CONSTRAINT `FK_employee_id_sal` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (100001,45000,56000,'Mar',2020,4001),(100002,40000,52000,'Mar',2020,4002),(100003,60000,80000,'Mar',2020,4005);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pms'
--

--
-- Dumping routines for database 'pms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 14:36:07
