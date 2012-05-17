-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

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
-- Table structure for table `AMICertification`
--

DROP TABLE IF EXISTS `AMICertification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AMICertification` (
  `StaffID` int(11) NOT NULL,
  `CertifiedFrom` varchar(255) NOT NULL,
  `CertificationDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `FK_AMICertification_Staff` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AMICertification`
--

LOCK TABLES `AMICertification` WRITE;
/*!40000 ALTER TABLE `AMICertification` DISABLE KEYS */;
/*!40000 ALTER TABLE `AMICertification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AcademicLevel`
--

DROP TABLE IF EXISTS `AcademicLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AcademicLevel` (
  `AcademicLevelID` int(11) NOT NULL AUTO_INCREMENT,
  `AcademicLevelName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Enabled` int(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`AcademicLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicLevel`
--

LOCK TABLES `AcademicLevel` WRITE;
/*!40000 ALTER TABLE `AcademicLevel` DISABLE KEYS */;
INSERT INTO `AcademicLevel` VALUES (1,'Toddler House','children 18 months to 3 years',1,'2012-04-18 11:14:56');
INSERT INTO `AcademicLevel` VALUES (2,'Primary','children 3 years to 6 years',1,'2012-04-18 11:14:56');
INSERT INTO `AcademicLevel` VALUES (3,'Elementary','children 6 years to 12 years',1,'2012-04-18 11:14:56');
/*!40000 ALTER TABLE `AcademicLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accident`
--

DROP TABLE IF EXISTS `Accident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accident` (
  `AccidentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `CreationDTTM` datetime NOT NULL,
  `AccidentDescription` varchar(255) NOT NULL,
  `InjuryDescription` varchar(255) DEFAULT NULL,
  `TreatmentDescription` varchar(255) DEFAULT NULL,
  `TreatedBy` varchar(255) DEFAULT NULL,
  `ReturnedToActivities` char(5) NOT NULL,
  `TransportedTo` varchar(255) DEFAULT NULL,
  `TransportedBy` varchar(255) DEFAULT NULL,
  `AttendingPhysician` varchar(255) DEFAULT NULL,
  `PhysicianAddress` varchar(255) DEFAULT NULL,
  `PhysicianPhone` varchar(255) DEFAULT NULL,
  `ReportedBy` varchar(255) NOT NULL,
  `AckParentID` int(11) DEFAULT NULL,
  `AckAdminID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccidentID`),
  KEY `FK_Accident_Student` (`StudentID`),
  KEY `FK_Accident_Parent` (`AckParentID`),
  KEY `FK_Accident_Staff` (`AckAdminID`),
  CONSTRAINT `FK_Accident_Parent` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Accident_Staff` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Accident_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accident`
--

LOCK TABLES `Accident` WRITE;
/*!40000 ALTER TABLE `Accident` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdmissionsForm`
--

DROP TABLE IF EXISTS `AdmissionsForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdmissionsForm` (
  `StudentID` int(11) NOT NULL,
  `SchoolExperience` varchar(255) NOT NULL,
  `SocialExperience` varchar(255) NOT NULL,
  `ComfortMethods` varchar(255) NOT NULL,
  `Toilet` varchar(255) NOT NULL,
  `NapTime` varchar(255) NOT NULL,
  `OutdoorPlay` varchar(255) NOT NULL,
  `Pets` varchar(255) DEFAULT NULL,
  `Interests` varchar(255) NOT NULL,
  `SiblingNames` varchar(255) NOT NULL DEFAULT '',
  `SiblingAges` varchar(255) NOT NULL DEFAULT '',
  `ReferrerType` varchar(255) NOT NULL,
  `ReferredBy` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_AdmissionsQuestionaire_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdmissionsForm`
--

LOCK TABLES `AdmissionsForm` WRITE;
/*!40000 ALTER TABLE `AdmissionsForm` DISABLE KEYS */;
INSERT INTO `AdmissionsForm` VALUES (1,'31','32','13','21','32','13',NULL,'21','321','32','Parent','','13');
INSERT INTO `AdmissionsForm` VALUES (2,'kj','lkh',';kj','h;kg','gkjl','kjh','asd : dfdf','sasa','sdfsd','sdfdsf','Friend','bob','sdfdsfsd');
INSERT INTO `AdmissionsForm` VALUES (3,'fhg','f','ghf','hg','fhg','f',NULL,'hg','f','hgfhg','Parent','','f');
/*!40000 ALTER TABLE `AdmissionsForm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alerts`
--

DROP TABLE IF EXISTS `Alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alerts` (
  `AlertID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `CreationDTTM` datetime NOT NULL,
  PRIMARY KEY (`AlertID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alerts`
--

LOCK TABLES `Alerts` WRITE;
/*!40000 ALTER TABLE `Alerts` DISABLE KEYS */;
INSERT INTO `Alerts` VALUES (1,'Must change password','2012-02-05 18:12:48');
INSERT INTO `Alerts` VALUES (2,'Must fill out yearly','2012-02-05 18:12:48');
/*!40000 ALTER TABLE `Alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumni`
--

DROP TABLE IF EXISTS `Alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumni` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `CurrentAddressOne` varchar(255) DEFAULT NULL,
  `CurrentAddressTwo` varchar(255) DEFAULT NULL,
  `CurrentCity` varchar(255) DEFAULT NULL,
  `CurrentState` char(2) DEFAULT NULL,
  `CurrentZip` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `AlumniYear` char(4) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `AcademicLevelID` int(11) NOT NULL,
  `HasCompletedLevel` bit(1) DEFAULT NULL,
  `RecentSchool` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `Comments` varchar(2047) DEFAULT NULL,
  `IsDonor` int(1) DEFAULT NULL,
  `DonorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Alumni_Student` (`StudentID`),
  KEY `FK_Alumni_AcademicLevel` (`AcademicLevelID`),
  CONSTRAINT `FK_Alumni_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Alumni_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumni`
--

LOCK TABLES `Alumni` WRITE;
/*!40000 ALTER TABLE `Alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classroom`
--

DROP TABLE IF EXISTS `Classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classroom` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(255) NOT NULL,
  `AcademicLevelID` int(11) NOT NULL,
  `Enabled` int(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `FK_Classroom_AcademicLevel` (`AcademicLevelID`),
  CONSTRAINT `FK_Classroom_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classroom`
--

LOCK TABLES `Classroom` WRITE;
/*!40000 ALTER TABLE `Classroom` DISABLE KEYS */;
INSERT INTO `Classroom` VALUES (1,'Test Class Toddler',2,1,'2012-04-21 16:20:07');
INSERT INTO `Classroom` VALUES (2,'Test Class Primary',3,1,'2012-04-21 16:20:07');
INSERT INTO `Classroom` VALUES (3,'Test Class Elementary',3,1,'2012-04-21 16:20:07');
INSERT INTO `Classroom` VALUES (4,'Test Class Disabled',1,0,'2012-04-21 16:20:07');
/*!40000 ALTER TABLE `Classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClassroomAssistant`
--

DROP TABLE IF EXISTS `ClassroomAssistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClassroomAssistant` (
  `ClassID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`ClassID`,`StaffID`),
  KEY `FK_ClassroomAssistant_Staff` (`StaffID`),
  CONSTRAINT `FK_ClassroomAssistant_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ClassroomAssistant_Staff` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassroomAssistant`
--

LOCK TABLES `ClassroomAssistant` WRITE;
/*!40000 ALTER TABLE `ClassroomAssistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClassroomAssistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClassroomTeacher`
--

DROP TABLE IF EXISTS `ClassroomTeacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClassroomTeacher` (
  `ClassID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`ClassID`,`StaffID`),
  KEY `FK_ClassroomStaff_Staff` (`StaffID`),
  CONSTRAINT `FK_ClassroomStaff_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ClassroomStaff_Staff` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassroomTeacher`
--

LOCK TABLES `ClassroomTeacher` WRITE;
/*!40000 ALTER TABLE `ClassroomTeacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClassroomTeacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donation`
--

DROP TABLE IF EXISTS `Donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Donation` (
  `DonationID` int(11) NOT NULL AUTO_INCREMENT,
  `DonorID` int(11) NOT NULL,
  `DonationTypeID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Allocation` varchar(255) DEFAULT NULL,
  `FundingPurpose` varchar(255) DEFAULT NULL,
  `DonationDate` datetime DEFAULT NULL,
  `Comments` varchar(2047) DEFAULT NULL,
  PRIMARY KEY (`DonationID`),
  KEY `FK_Donation_DonationTypeLookup` (`DonationTypeID`),
  KEY `FK_Donation_Donor` (`DonorID`),
  CONSTRAINT `FK_Donation_DonationTypeLookup` FOREIGN KEY (`DonationTypeID`) REFERENCES `DonationTypeLookup` (`DonationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_Donor` FOREIGN KEY (`DonorID`) REFERENCES `Donor` (`DonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donation`
--

LOCK TABLES `Donation` WRITE;
/*!40000 ALTER TABLE `Donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DonationTypeLookup`
--

DROP TABLE IF EXISTS `DonationTypeLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DonationTypeLookup` (
  `DonationTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `DonationTypeName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`DonationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DonationTypeLookup`
--

LOCK TABLES `DonationTypeLookup` WRITE;
/*!40000 ALTER TABLE `DonationTypeLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `DonationTypeLookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donor`
--

DROP TABLE IF EXISTS `Donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Donor` (
  `DonorID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `OrganizationName` varchar(255) DEFAULT NULL,
  `ContactFirstName` varchar(255) NOT NULL,
  `ContactLastName` varchar(255) NOT NULL,
  `AddressOne` varchar(255) NOT NULL,
  `AddressTwo` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` int(11) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` int(11) NOT NULL,
  PRIMARY KEY (`DonorID`),
  KEY `FK_Donor_UserTable` (`UserID`),
  CONSTRAINT `FK_Donor_UserTable` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donor`
--

LOCK TABLES `Donor` WRITE;
/*!40000 ALTER TABLE `Donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmergencyContact`
--

DROP TABLE IF EXISTS `EmergencyContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmergencyContact` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `ECName` varchar(255) NOT NULL,
  `ECPhone` varchar(255) NOT NULL,
  `ECRelationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyContact`
--

LOCK TABLES `EmergencyContact` WRITE;
/*!40000 ALTER TABLE `EmergencyContact` DISABLE KEYS */;
INSERT INTO `EmergencyContact` VALUES (58,'Jack Bowser','5555555555','Uncle');
INSERT INTO `EmergencyContact` VALUES (59,'Janelle Witrig','5558675309','Aunt');
INSERT INTO `EmergencyContact` VALUES (60,'Cindy Arevalo','5555555556','Family friend');
INSERT INTO `EmergencyContact` VALUES (61,'1','2','132');
INSERT INTO `EmergencyContact` VALUES (62,'1','321','32');
INSERT INTO `EmergencyContact` VALUES (63,'132','1','321');
INSERT INTO `EmergencyContact` VALUES (64,'asdf','asdf','asdf');
INSERT INTO `EmergencyContact` VALUES (65,'asdf','asdf','kj');
INSERT INTO `EmergencyContact` VALUES (66,'kj','kj','kj');
INSERT INTO `EmergencyContact` VALUES (67,'fgh','fhg','f');
INSERT INTO `EmergencyContact` VALUES (68,'hgf','hg','fhg');
INSERT INTO `EmergencyContact` VALUES (69,'f','hgf','hg');
/*!40000 ALTER TABLE `EmergencyContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `EventName` varchar(255) NOT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `StartDTTM` datetime NOT NULL,
  `EndDTTM` datetime NOT NULL,
  PRIMARY KEY (`EventID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (1,'Mother\'s Day Celebration','just celebrating mother\'s day cause its coming up','2012-05-12 00:00:00','2012-05-13 00:00:00');
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupMenuItem`
--

DROP TABLE IF EXISTS `GroupMenuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupMenuItem` (
  `GroupID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`,`MenuItemID`),
  KEY `FK_GroupMenuItem_MenuItem` (`MenuItemID`),
  CONSTRAINT `FK_GroupMenuItem_groups` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GroupMenuItem_MenuItem` FOREIGN KEY (`MenuItemID`) REFERENCES `MenuItem` (`MenuItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupMenuItem`
--

LOCK TABLES `GroupMenuItem` WRITE;
/*!40000 ALTER TABLE `GroupMenuItem` DISABLE KEYS */;
INSERT INTO `GroupMenuItem` VALUES (1,1);
INSERT INTO `GroupMenuItem` VALUES (100,1);
INSERT INTO `GroupMenuItem` VALUES (200,1);
INSERT INTO `GroupMenuItem` VALUES (1,2);
INSERT INTO `GroupMenuItem` VALUES (100,2);
INSERT INTO `GroupMenuItem` VALUES (200,2);
INSERT INTO `GroupMenuItem` VALUES (1,3);
INSERT INTO `GroupMenuItem` VALUES (100,3);
INSERT INTO `GroupMenuItem` VALUES (1,4);
INSERT INTO `GroupMenuItem` VALUES (100,4);
INSERT INTO `GroupMenuItem` VALUES (200,4);
INSERT INTO `GroupMenuItem` VALUES (1,5);
/*!40000 ALTER TABLE `GroupMenuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incident`
--

DROP TABLE IF EXISTS `Incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incident` (
  `IncidentID` int(11) NOT NULL AUTO_INCREMENT,
  `CreationDTTM` datetime NOT NULL,
  `IncidentDescription` varchar(255) NOT NULL,
  `ActionsTaken` varchar(255) DEFAULT NULL,
  `Recommendations` varchar(5000) DEFAULT NULL,
  `ReportedBy` int(11) NOT NULL,
  `AckParentID` int(11) DEFAULT NULL,
  `AckAdminID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IncidentID`),
  KEY `FK_Incident_Parent` (`AckParentID`),
  KEY `FK_Incident_Staff` (`AckAdminID`),
  CONSTRAINT `FK_Incident_Parent` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Incident_Staff` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incident`
--

LOCK TABLES `Incident` WRITE;
/*!40000 ALTER TABLE `Incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `Incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItem`
--

DROP TABLE IF EXISTS `MenuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MenuItem` (
  `MenuItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `RankOrder` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (1,'Home','login',1);
INSERT INTO `MenuItem` VALUES (2,'Logout','logout',100);
INSERT INTO `MenuItem` VALUES (3,'Admissions','',2);
INSERT INTO `MenuItem` VALUES (4,'Personal Information','login',4);
INSERT INTO `MenuItem` VALUES (5,'Administration','',5);
/*!40000 ALTER TABLE `MenuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notifications` (
  `NotificationID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `URL` varchar(45) NOT NULL,
  PRIMARY KEY (`NotificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (1,'Waitlist a child','admissions/waitlistQuestionaire');
INSERT INTO `Notifications` VALUES (6,'Register a child','admissions/registerStudent');
INSERT INTO `Notifications` VALUES (7,'Fill out medical release form','admissions/forms/studentMedical');
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Observation`
--

DROP TABLE IF EXISTS `Observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Observation` (
  `ParentID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `ObservationDTTM` datetime NOT NULL,
  `Attended` int(1) NOT NULL,
  `OnTime` int(1) NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_ClassroomObservation_Classroom` (`ClassID`),
  CONSTRAINT `FK_ClassroomObservation_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Observation_Parent` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Observation`
--

LOCK TABLES `Observation` WRITE;
/*!40000 ALTER TABLE `Observation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Observation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parent`
--

DROP TABLE IF EXISTS `Parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parent` (
  `ParentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Employer` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `VolunteeringOptOut` int(1) NOT NULL,
  `SkillSheetID` int(11) DEFAULT NULL,
  `UDDTM` datetime NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_Parent_users` (`UserID`),
  KEY `FK_Parent_SkillSheet` (`SkillSheetID`),
  CONSTRAINT `FK_Parent_VolunteerSkillSheet` FOREIGN KEY (`SkillSheetID`) REFERENCES `VolunteerSkillSheet` (`SkillSheetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Parent_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
INSERT INTO `Parent` VALUES (1,1,'Little','Bobby','Tables','markbowser9@gmail.com',NULL,NULL,0,NULL,'2012-03-10 16:06:01');
INSERT INTO `Parent` VALUES (8,24,'Justin','Lee','Field','fieldju@gmail.com',NULL,NULL,0,NULL,'2012-04-21 19:29:58');
INSERT INTO `Parent` VALUES (9,25,'Mark','Alan','Bowser','markbowser9@gmail.com',NULL,NULL,0,NULL,'2012-04-21 19:32:40');
INSERT INTO `Parent` VALUES (10,1,'Mr','User','Duplicate','asdf@asdfsf.com','some guy','idk',0,NULL,'2012-04-25 19:36:18');
INSERT INTO `Parent` VALUES (14,29,'mark','alan','bowser','markbowser9@hotmail.com',NULL,NULL,0,NULL,'2012-05-04 03:32:53');
INSERT INTO `Parent` VALUES (15,35,'bob','dole','ginger','gi@gi.com',NULL,NULL,0,NULL,'2012-05-16 20:30:44');
INSERT INTO `Parent` VALUES (16,36,'bob','dole','ginger','gasdi@gi.com',NULL,NULL,0,NULL,'2012-05-16 20:31:17');
INSERT INTO `Parent` VALUES (17,37,'kjhkljh','lkjh','lkh','kjlh@akldsjfh.com',NULL,NULL,0,NULL,'2012-05-16 20:43:39');
INSERT INTO `Parent` VALUES (18,38,'testf','test','sta','bob@aol.com',NULL,NULL,0,NULL,'2012-05-16 20:49:00');
INSERT INTO `Parent` VALUES (19,39,'testf','test','sta','bosb@aol.com',NULL,NULL,0,NULL,'2012-05-16 20:49:24');
INSERT INTO `Parent` VALUES (20,40,'testf','test','sta','bosdb@aol.com',NULL,NULL,0,NULL,'2012-05-16 20:53:44');
INSERT INTO `Parent` VALUES (21,41,'testf','test','sta','bosdfdb@aol.com',NULL,NULL,0,NULL,'2012-05-16 20:59:50');
INSERT INTO `Parent` VALUES (22,42,'132321123','321321','132132','bosdffdb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:00:58');
INSERT INTO `Parent` VALUES (23,43,'199999','321321','132132','bosdffddb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:02:19');
INSERT INTO `Parent` VALUES (24,44,'19999fgh9','321321','132132','bosdfhhfddb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:03:47');
INSERT INTO `Parent` VALUES (25,45,'ppppp','321321','132132','bosddfhhfddb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:05:09');
INSERT INTO `Parent` VALUES (26,46,'ppppp','321321','132132','bosdfgdfhhfddb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:06:04');
INSERT INTO `Parent` VALUES (27,47,'ppppp','321321','132132','bosdfdfgdfhhfddb@aol.com',NULL,NULL,0,NULL,'2012-05-16 21:07:08');
INSERT INTO `Parent` VALUES (28,48,'unicorn','thunder','lighting','lit@lit.com',NULL,NULL,0,NULL,'2012-05-16 21:08:37');
INSERT INTO `Parent` VALUES (29,49,'Justi','in','asd','fi@lf.com',NULL,NULL,0,NULL,'2012-05-17 00:13:20');
INSERT INTO `Parent` VALUES (30,50,'Justi','in','asd','fdfi@lf.com',NULL,NULL,0,NULL,'2012-05-17 00:15:32');
INSERT INTO `Parent` VALUES (31,51,'a','a','a','a@a.com',NULL,NULL,0,NULL,'2012-05-17 01:25:11');
INSERT INTO `Parent` VALUES (32,52,'a','a','a','aa@a.com',NULL,NULL,0,NULL,'2012-05-17 01:25:36');
/*!40000 ALTER TABLE `Parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParentContactInfo`
--

DROP TABLE IF EXISTS `ParentContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParentContactInfo` (
  `ParentID` int(11) NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` int(11) NOT NULL,
  `HomePhone` varchar(255) DEFAULT NULL,
  `CellPhone` varchar(255) DEFAULT NULL,
  `WorkPhone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ParentID`),
  CONSTRAINT `FK_ParentContactInfo_Parent` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParentContactInfo`
--

LOCK TABLES `ParentContactInfo` WRITE;
/*!40000 ALTER TABLE `ParentContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParentContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Program`
--

DROP TABLE IF EXISTS `Program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Program` (
  `ProgramID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgramGroupID` int(11) NOT NULL,
  `Days` varchar(255) NOT NULL,
  `StartTime` varchar(255) NOT NULL,
  `EndTime` varchar(255) NOT NULL,
  `Enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ProgramID`),
  KEY `FK_Program_ProgramGroup` (`ProgramGroupID`),
  CONSTRAINT `FK_Program_ProgramGroup` FOREIGN KEY (`ProgramGroupID`) REFERENCES `ProgramGroup` (`ProgramGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program`
--

LOCK TABLES `Program` WRITE;
/*!40000 ALTER TABLE `Program` DISABLE KEYS */;
INSERT INTO `Program` VALUES (1,1,'3 day (Monday - Wednesday)','8:30 AM','11:30 AM',0);
INSERT INTO `Program` VALUES (2,1,'5 day (Monday - Friday)','8:30 AM','11:30 AM',1);
INSERT INTO `Program` VALUES (3,2,'3 day (Monday - Wednesday)','8:30 AM','2:30 PM',0);
INSERT INTO `Program` VALUES (4,2,'5 day (Monday - Friday)','8:30 AM','3:00 PM',1);
/*!40000 ALTER TABLE `Program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgramGroup`
--

DROP TABLE IF EXISTS `ProgramGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProgramGroup` (
  `ProgramGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupTitle` varchar(255) NOT NULL,
  `Enabled` int(1) NOT NULL,
  `RankOrder` int(11) NOT NULL,
  PRIMARY KEY (`ProgramGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgramGroup`
--

LOCK TABLES `ProgramGroup` WRITE;
/*!40000 ALTER TABLE `ProgramGroup` DISABLE KEYS */;
INSERT INTO `ProgramGroup` VALUES (1,'Primary Mornings',1,1);
INSERT INTO `ProgramGroup` VALUES (2,'Full-Day Primary',1,5);
INSERT INTO `ProgramGroup` VALUES (3,'Extended Day',0,15);
INSERT INTO `ProgramGroup` VALUES (4,'Elementary',1,10);
/*!40000 ALTER TABLE `ProgramGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProspectInterview`
--

DROP TABLE IF EXISTS `ProspectInterview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProspectInterview` (
  `ParentID` int(11) NOT NULL,
  `ParentNames` varchar(255) NOT NULL,
  `ChildrenNamesAges` varchar(255) NOT NULL,
  `DOB` datetime NOT NULL,
  `FirstContactedDTTM` datetime NOT NULL,
  `InterviewDTTM` datetime NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MontessoriImpressions` varchar(255) NOT NULL,
  `InterviewImpressions` varchar(255) NOT NULL,
  `LevelOfInterest` int(11) NOT NULL,
  `LevelOfUnderstanding` int(11) NOT NULL,
  `WillingnessToLearn` int(11) NOT NULL,
  `IsLearningIndipendently` int(1) NOT NULL,
  `IsLearningAtOwnPace` int(1) NOT NULL,
  `IsHandsOnLearner` int(1) NOT NULL,
  `IsMixedAges` int(1) NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_ProspectInterview_ProspectLevelLookup1` (`LevelOfInterest`),
  KEY `FK_ProspectInterview_ProspectLevelLookup2` (`LevelOfUnderstanding`),
  KEY `FK_ProspectInterview_ProspectLevelLookup3` (`WillingnessToLearn`),
  CONSTRAINT `FK_ProspectInterview_Parent1` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProspectInterview_ProspectLevelLookup1` FOREIGN KEY (`LevelOfInterest`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProspectInterview_ProspectLevelLookup2` FOREIGN KEY (`LevelOfUnderstanding`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProspectInterview_ProspectLevelLookup3` FOREIGN KEY (`WillingnessToLearn`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProspectInterview`
--

LOCK TABLES `ProspectInterview` WRITE;
/*!40000 ALTER TABLE `ProspectInterview` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProspectInterview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProspectLevelLookup`
--

DROP TABLE IF EXISTS `ProspectLevelLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProspectLevelLookup` (
  `LevelID` int(11) NOT NULL AUTO_INCREMENT,
  `LevelDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProspectLevelLookup`
--

LOCK TABLES `ProspectLevelLookup` WRITE;
/*!40000 ALTER TABLE `ProspectLevelLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProspectLevelLookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProspectMovement`
--

DROP TABLE IF EXISTS `ProspectMovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProspectMovement` (
  `ParentID` int(11) NOT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ParentID`),
  CONSTRAINT `FK_ProspectMovement_ProspectInterview` FOREIGN KEY (`ParentID`) REFERENCES `ProspectInterview` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProspectMovement`
--

LOCK TABLES `ProspectMovement` WRITE;
/*!40000 ALTER TABLE `ProspectMovement` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProspectMovement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProspectReference`
--

DROP TABLE IF EXISTS `ProspectReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProspectReference` (
  `ParentID` int(11) NOT NULL,
  `ReferenceName` varchar(255) NOT NULL,
  `ReferenceNotes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ParentID`,`ReferenceName`),
  KEY `FK_ProspectReference_ReferenceLookup` (`ReferenceName`),
  KEY `FK_ProspectReference_ProspectInterview` (`ParentID`),
  CONSTRAINT `FK_ProspectReference_ProspectInterview` FOREIGN KEY (`ParentID`) REFERENCES `ProspectInterview` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProspectReference_ReferenceLookup` FOREIGN KEY (`ReferenceName`) REFERENCES `ReferenceLookup` (`ReferenceName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProspectReference`
--

LOCK TABLES `ProspectReference` WRITE;
/*!40000 ALTER TABLE `ProspectReference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProspectReference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReferenceLookup`
--

DROP TABLE IF EXISTS `ReferenceLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceLookup` (
  `ReferenceName` varchar(255) NOT NULL,
  PRIMARY KEY (`ReferenceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReferenceLookup`
--

LOCK TABLES `ReferenceLookup` WRITE;
/*!40000 ALTER TABLE `ReferenceLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReferenceLookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolInformation`
--

DROP TABLE IF EXISTS `SchoolInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolInformation` (
  `AcademicYear` int(11) NOT NULL,
  `ContractRenewalDeadline` datetime NOT NULL,
  `RequiredHours` int(11) NOT NULL,
  `FeePerHour` double NOT NULL,
  PRIMARY KEY (`AcademicYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolInformation`
--

LOCK TABLES `SchoolInformation` WRITE;
/*!40000 ALTER TABLE `SchoolInformation` DISABLE KEYS */;
INSERT INTO `SchoolInformation` VALUES (2012,'2011-08-19 00:00:00',20,10);
INSERT INTO `SchoolInformation` VALUES (2013,'2012-08-15 00:00:00',30,12);
/*!40000 ALTER TABLE `SchoolInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffTypeID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `SchoolEmail` varchar(255) NOT NULL,
  `PersonalEmail` varchar(255) NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` int(11) NOT NULL,
  `HomePhone` varchar(255) DEFAULT NULL,
  `CellPhone` varchar(255) DEFAULT NULL,
  `FoodAllergies` varchar(2047) DEFAULT NULL,
  `MedicineAllergies` varchar(2047) DEFAULT NULL,
  `OtherAllergies` varchar(2047) DEFAULT NULL,
  `EmergencyContactID1` int(11) NOT NULL,
  `EmergencyContactID2` int(11) NOT NULL,
  `EmergencyContactID3` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Enabled` int(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `FK_Staff_StaffTypeLookup` (`StaffTypeID`),
  KEY `FK_Staff_UserTable` (`UserID`),
  KEY `FK_Staff_EmergencyContact1` (`EmergencyContactID1`),
  KEY `FK_Staff_EmergencyContact2` (`EmergencyContactID2`),
  KEY `FK_Staff_EmergencyContact3` (`EmergencyContactID3`),
  CONSTRAINT `FK_Staff_EmergencyContact1` FOREIGN KEY (`EmergencyContactID1`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_EmergencyContact2` FOREIGN KEY (`EmergencyContactID2`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_EmergencyContact3` FOREIGN KEY (`EmergencyContactID3`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_StaffTypeLookup` FOREIGN KEY (`StaffTypeID`) REFERENCES `StaffTypeLookup` (`StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_UserTable` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffEduBackground`
--

DROP TABLE IF EXISTS `StaffEduBackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffEduBackground` (
  `BackgroundID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffID` int(11) NOT NULL,
  `Institute` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  `GraduationDate` date DEFAULT NULL,
  PRIMARY KEY (`BackgroundID`),
  KEY `FK_StaffEduBackground_Staff` (`StaffID`),
  CONSTRAINT `FK_StaffEduBackground_Staff` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffEduBackground`
--

LOCK TABLES `StaffEduBackground` WRITE;
/*!40000 ALTER TABLE `StaffEduBackground` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffEduBackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffTypeLookup`
--

DROP TABLE IF EXISTS `StaffTypeLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffTypeLookup` (
  `StaffTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffTypeDescription` varchar(255) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffTypeLookup`
--

LOCK TABLES `StaffTypeLookup` WRITE;
/*!40000 ALTER TABLE `StaffTypeLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffTypeLookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `ProgramID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PlaceOfBirth` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `EnrollmentDTTM` datetime DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `EmergencyContactID1` int(11) NOT NULL,
  `EmergencyContactID2` int(11) NOT NULL,
  `EmergencyContactID3` int(11) NOT NULL,
  `IsEnrolled` int(1) NOT NULL DEFAULT '0',
  `QuestionaireID` int(11) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Student_Classroom` (`ClassID`),
  KEY `FK_Student_EmergencyContact1` (`EmergencyContactID1`),
  KEY `FK_Student_EmergencyContact2` (`EmergencyContactID2`),
  KEY `FK_Student_EmergencyContact3` (`EmergencyContactID3`),
  KEY `FK_Student_WaitlistQuestionaire` (`QuestionaireID`),
  KEY `FK_Student_Program` (`ProgramID`),
  KEY `FK_Student_users` (`UserID`),
  CONSTRAINT `FK_Student_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Program` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_WaitlistQuestionaire` FOREIGN KEY (`QuestionaireID`) REFERENCES `WaitlistForm` (`FormID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`EmergencyContactID1`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`EmergencyContactID2`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Student_ibfk_3` FOREIGN KEY (`EmergencyContactID3`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,24,NULL,2,'Bobby','sd','asdf','M','132','13','1969-12-31',NULL,'132',61,62,63,0,57,'2012-05-11 01:37:36');
INSERT INTO `Student` VALUES (2,25,NULL,4,'Eric','Lee','Bowser','M','sdf','asdf','2001-01-01',NULL,'555-555-5555',64,65,66,0,53,'2012-05-11 03:16:53');
INSERT INTO `Student` VALUES (3,25,NULL,2,'Jason','Dee','Bowser','F','hjgf','ghf','8698-05-11',NULL,'hgf',67,68,69,0,54,'2012-05-11 11:40:44');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentEduBackground`
--

DROP TABLE IF EXISTS `StudentEduBackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentEduBackground` (
  `BackgroundID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `School` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` char(2) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`BackgroundID`),
  KEY `FK_StudentEduBackground_Student` (`StudentID`),
  CONSTRAINT `FK_StudentEduBackground_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentEduBackground`
--

LOCK TABLES `StudentEduBackground` WRITE;
/*!40000 ALTER TABLE `StudentEduBackground` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentEduBackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentIncident`
--

DROP TABLE IF EXISTS `StudentIncident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentIncident` (
  `StudentID` int(11) NOT NULL,
  `IncidentID` int(11) NOT NULL,
  PRIMARY KEY (`IncidentID`,`StudentID`),
  KEY `FK_StudentIncident_Incident` (`IncidentID`),
  KEY `FK_StudentIncident_Student` (`StudentID`),
  CONSTRAINT `FK_StudentIncident_Incident` FOREIGN KEY (`IncidentID`) REFERENCES `Incident` (`IncidentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_StudentIncident_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentIncident`
--

LOCK TABLES `StudentIncident` WRITE;
/*!40000 ALTER TABLE `StudentIncident` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentIncident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentMedicalInformation`
--

DROP TABLE IF EXISTS `StudentMedicalInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentMedicalInformation` (
  `StudentID` int(11) NOT NULL,
  `PreferredHospital` varchar(255) NOT NULL,
  `HospitalPhone` varchar(255) NOT NULL,
  `Physician` varchar(255) NOT NULL,
  `PhysicianPhone` varchar(255) NOT NULL,
  `Dentist` varchar(255) NOT NULL,
  `DentistPhone` varchar(255) NOT NULL,
  `MedicalConditions` varchar(255) DEFAULT NULL,
  `Allergies` varchar(255) DEFAULT NULL,
  `InsuranceCompany` varchar(255) NOT NULL,
  `CertificateNumber` varchar(255) NOT NULL,
  `Employer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_MedicalInformation_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentMedicalInformation`
--

LOCK TABLES `StudentMedicalInformation` WRITE;
/*!40000 ALTER TABLE `StudentMedicalInformation` DISABLE KEYS */;
INSERT INTO `StudentMedicalInformation` VALUES (2,'corvalls','555-555-5555','asdfa','555-555-5555','bob','555-555-5555','asdfadsf','','asdfassfd','fdsf','frank');
/*!40000 ALTER TABLE `StudentMedicalInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubItem`
--

DROP TABLE IF EXISTS `SubItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubItem` (
  `SubItemID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuItemID` int(11) NOT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `RankOrder` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SubItemID`),
  KEY `FK_SubItem_MenuItem` (`MenuItemID`),
  CONSTRAINT `FK_SubItem_MenuItem` FOREIGN KEY (`MenuItemID`) REFERENCES `MenuItem` (`MenuItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubItem`
--

LOCK TABLES `SubItem` WRITE;
/*!40000 ALTER TABLE `SubItem` DISABLE KEYS */;
INSERT INTO `SubItem` VALUES (1,5,'Create New Parent Account','admin/addParentUserAccount',1);
INSERT INTO `SubItem` VALUES (2,5,'Interview & Observation','admin/interviewObservationForm',2);
INSERT INTO `SubItem` VALUES (3,3,'Waitlist Student','admissions/waitlistQuestionaire',3);
INSERT INTO `SubItem` VALUES (4,3,'Register New Student','admissions/registerStudentSelector',4);
INSERT INTO `SubItem` VALUES (18,5,'Add Sub-Menu Item','admin/addSubItem',5);
INSERT INTO `SubItem` VALUES (19,5,'Waitlist Managment','admin/waitlist',1);
INSERT INTO `SubItem` VALUES (20,3,'Medical Records','admissions/studentMedical',1);
INSERT INTO `SubItem` VALUES (22,5,'Manage User Accounts','admin/manageAccounts',1);
INSERT INTO `SubItem` VALUES (23,5,'Manage Students','admin/manageStudents',1);
/*!40000 ALTER TABLE `SubItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tuition`
--

DROP TABLE IF EXISTS `Tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tuition` (
  `AcademicYear` int(11) NOT NULL,
  `AcademicLevelID` int(11) NOT NULL,
  `ProgramID` int(11) NOT NULL,
  `HalfdayFee` int(11) NOT NULL,
  `FullDayFee` int(11) NOT NULL,
  PRIMARY KEY (`AcademicYear`,`AcademicLevelID`,`ProgramID`),
  KEY `FK_SchoolInformation_Tuition_SchoolInformation` (`AcademicYear`),
  KEY `FK_SchoolInformation_Tuition_AcademicLevel` (`AcademicLevelID`),
  KEY `FK_SchoolInformation_Tuition_Program` (`ProgramID`),
  CONSTRAINT `FK_SchoolInformation_Tuition_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SchoolInformation_Tuition_Program` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SchoolInformation_Tuition_SchoolInformation` FOREIGN KEY (`AcademicYear`) REFERENCES `SchoolInformation` (`AcademicYear`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tuition`
--

LOCK TABLES `Tuition` WRITE;
/*!40000 ALTER TABLE `Tuition` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tuition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAlerts`
--

DROP TABLE IF EXISTS `UserAlerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAlerts` (
  `UserID` int(11) NOT NULL,
  `AlertID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`AlertID`),
  KEY `FK_UserAlerts_Alerts` (`AlertID`),
  KEY `FK_UserAlerts_users` (`UserID`),
  CONSTRAINT `FK_UserAlerts_Alerts` FOREIGN KEY (`AlertID`) REFERENCES `Alerts` (`AlertID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserAlerts_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAlerts`
--

LOCK TABLES `UserAlerts` WRITE;
/*!40000 ALTER TABLE `UserAlerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserAlerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserNotifications`
--

DROP TABLE IF EXISTS `UserNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserNotifications` (
  `NotificationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AdditionalInfo` varchar(255) NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`UserID`,`NotificationID`,`AdditionalInfo`),
  KEY `FK_UserNotifications_Notifications` (`NotificationID`),
  CONSTRAINT `FK_UserNotifications_Notifications` FOREIGN KEY (`NotificationID`) REFERENCES `Notifications` (`NotificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserNotifications_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserNotifications`
--

LOCK TABLES `UserNotifications` WRITE;
/*!40000 ALTER TABLE `UserNotifications` DISABLE KEYS */;
INSERT INTO `UserNotifications` VALUES (1,37,'');
INSERT INTO `UserNotifications` VALUES (1,38,'');
INSERT INTO `UserNotifications` VALUES (1,39,'');
INSERT INTO `UserNotifications` VALUES (1,47,'');
INSERT INTO `UserNotifications` VALUES (1,48,'');
INSERT INTO `UserNotifications` VALUES (1,49,'');
INSERT INTO `UserNotifications` VALUES (1,50,'');
INSERT INTO `UserNotifications` VALUES (1,51,'');
INSERT INTO `UserNotifications` VALUES (1,52,'');
INSERT INTO `UserNotifications` VALUES (6,24,'');
INSERT INTO `UserNotifications` VALUES (6,25,'Array');
INSERT INTO `UserNotifications` VALUES (6,49,'');
INSERT INTO `UserNotifications` VALUES (6,50,'');
INSERT INTO `UserNotifications` VALUES (6,51,'');
INSERT INTO `UserNotifications` VALUES (6,52,'');
/*!40000 ALTER TABLE `UserNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerLogEntry`
--

DROP TABLE IF EXISTS `VolunteerLogEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerLogEntry` (
  `EntryID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Hours` double NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SubmissionDTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `FK_VolunteerLogEntry_user` (`UserID`),
  CONSTRAINT `VolunteerLogEntry_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerLogEntry`
--

LOCK TABLES `VolunteerLogEntry` WRITE;
/*!40000 ALTER TABLE `VolunteerLogEntry` DISABLE KEYS */;
INSERT INTO `VolunteerLogEntry` VALUES (3,25,2,'hello','2012-05-11 01:09:00');
INSERT INTO `VolunteerLogEntry` VALUES (4,25,2,'hello','2012-05-11 01:09:00');
INSERT INTO `VolunteerLogEntry` VALUES (5,25,4,'hi again','2012-05-11 01:33:00');
INSERT INTO `VolunteerLogEntry` VALUES (6,25,3,'adfadf','2012-05-23 00:00:00');
INSERT INTO `VolunteerLogEntry` VALUES (7,24,2,'Worked the lemon aid stand','2012-05-10 00:00:00');
INSERT INTO `VolunteerLogEntry` VALUES (8,25,3,'adfadf','2012-05-23 00:00:00');
INSERT INTO `VolunteerLogEntry` VALUES (9,1,4,'asdadf','2012-05-11 02:05:00');
INSERT INTO `VolunteerLogEntry` VALUES (10,25,5,'did stuff','2012-05-11 11:42:00');
INSERT INTO `VolunteerLogEntry` VALUES (16,25,0,'asas','2012-05-15 19:39:36');
INSERT INTO `VolunteerLogEntry` VALUES (21,25,50,'asdadsf','2012-05-15 20:51:01');
INSERT INTO `VolunteerLogEntry` VALUES (22,25,454,'asdfsad','2012-05-15 20:54:54');
INSERT INTO `VolunteerLogEntry` VALUES (23,25,4,'asdfa','2012-05-15 21:04:26');
INSERT INTO `VolunteerLogEntry` VALUES (24,25,7.99,'asdf','2012-05-15 21:06:58');
INSERT INTO `VolunteerLogEntry` VALUES (25,25,5,'THIS ONE SHOULD SHOW UP','2012-05-15 21:07:50');
INSERT INTO `VolunteerLogEntry` VALUES (28,24,2,'g','2012-05-16 09:16:58');
INSERT INTO `VolunteerLogEntry` VALUES (43,1,3,'more stuff today','2012-05-16 11:55:10');
INSERT INTO `VolunteerLogEntry` VALUES (44,1,7.99,'close to the limit','2012-05-16 11:55:10');
INSERT INTO `VolunteerLogEntry` VALUES (45,1,4.4,'aaaaaa','2012-05-16 12:22:13');
INSERT INTO `VolunteerLogEntry` VALUES (46,1,5.5,'ffffffff','2012-05-16 12:23:06');
INSERT INTO `VolunteerLogEntry` VALUES (47,1,3.3,'ffffffdsdf','2012-05-16 12:23:27');
INSERT INTO `VolunteerLogEntry` VALUES (48,1,5,'ggrgrg','2012-05-16 12:38:00');
INSERT INTO `VolunteerLogEntry` VALUES (49,1,3,'d3','2012-05-16 12:39:09');
INSERT INTO `VolunteerLogEntry` VALUES (50,1,3,'cdrfc','2012-05-16 12:41:29');
/*!40000 ALTER TABLE `VolunteerLogEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerSkillSheet`
--

DROP TABLE IF EXISTS `VolunteerSkillSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerSkillSheet` (
  `SkillSheetID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SkillSheetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerSkillSheet`
--

LOCK TABLES `VolunteerSkillSheet` WRITE;
/*!40000 ALTER TABLE `VolunteerSkillSheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerSkillSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaitlistForm`
--

DROP TABLE IF EXISTS `WaitlistForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaitlistForm` (
  `FormID` int(11) NOT NULL AUTO_INCREMENT,
  `ExpectedProgramID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `Agreement` int(11) NOT NULL,
  `IsPreEnrolled` int(1) NOT NULL,
  `IsWaitlisted` int(1) NOT NULL,
  `SubmissionDTTM` datetime NOT NULL,
  PRIMARY KEY (`FormID`),
  KEY `FK_WaitlistForm_Program` (`ExpectedProgramID`),
  KEY `FK_WaitlistForm_users` (`UserID`),
  CONSTRAINT `FK_WaitlistForm_Program` FOREIGN KEY (`ExpectedProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_WaitlistForm_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistForm`
--

LOCK TABLES `WaitlistForm` WRITE;
/*!40000 ALTER TABLE `WaitlistForm` DISABLE KEYS */;
INSERT INTO `WaitlistForm` VALUES (52,2,1,'little','bobby','tables',1,0,1,'2012-04-21 21:06:40');
INSERT INTO `WaitlistForm` VALUES (53,4,25,'Eric','Lee','Bowser',3,0,0,'2012-04-21 21:07:39');
INSERT INTO `WaitlistForm` VALUES (54,2,25,'Jason','Dee','Bowser',1,0,0,'2012-04-22 12:25:38');
INSERT INTO `WaitlistForm` VALUES (55,4,25,'Steven','Ray','Bowser',2,1,0,'2012-04-22 12:37:51');
INSERT INTO `WaitlistForm` VALUES (56,4,24,'Justin','L','Field',1,1,0,'2012-04-23 18:17:24');
INSERT INTO `WaitlistForm` VALUES (57,1,24,'Bobby','sd','asdf',3,0,0,'2012-04-23 18:17:53');
INSERT INTO `WaitlistForm` VALUES (58,4,1,'leanne','','bowser',1,0,1,'2012-05-03 23:43:45');
INSERT INTO `WaitlistForm` VALUES (59,2,1,'jeff','allen','bowser',3,0,1,'2012-05-03 23:46:55');
INSERT INTO `WaitlistForm` VALUES (60,2,1,'2','2','2',3,0,1,'2012-05-04 02:33:34');
INSERT INTO `WaitlistForm` VALUES (61,2,1,'3','3','3',1,0,1,'2012-05-04 02:37:09');
INSERT INTO `WaitlistForm` VALUES (62,2,25,'Leroy','','Jenkins',1,1,0,'2012-05-10 18:03:19');
INSERT INTO `WaitlistForm` VALUES (63,2,25,'Sean','','Bowser',1,0,1,'2012-05-16 21:36:17');
INSERT INTO `WaitlistForm` VALUES (64,2,25,'asdfsdfsdf','kjl','lkj',3,0,1,'2012-05-16 21:37:30');
INSERT INTO `WaitlistForm` VALUES (65,2,25,'asdlkj','lkj','l;kjhlhjh',1,0,1,'2012-05-16 21:38:10');
INSERT INTO `WaitlistForm` VALUES (66,2,25,'dddd','ddd','ddddd',1,0,1,'2012-05-16 21:41:01');
INSERT INTO `WaitlistForm` VALUES (67,2,25,'fffs','ssd','sdfdfd',1,0,1,'2012-05-16 21:42:49');
INSERT INTO `WaitlistForm` VALUES (68,2,25,'erer','erer','rere',1,0,1,'2012-05-16 21:43:57');
INSERT INTO `WaitlistForm` VALUES (69,2,25,'rtr','tert','erter',2,0,1,'2012-05-16 21:44:59');
INSERT INTO `WaitlistForm` VALUES (70,2,25,'rtr','tert','erter',2,0,1,'2012-05-16 21:46:23');
INSERT INTO `WaitlistForm` VALUES (71,4,25,'qwqw','qwqw','qwqw',1,0,1,'2012-05-16 21:48:44');
INSERT INTO `WaitlistForm` VALUES (72,2,25,'asdfadsf','fdsafdsa','dsasdfdsa',1,0,1,'2012-05-16 21:52:01');
/*!40000 ALTER TABLE `WaitlistForm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaitlistFormQuestion`
--

DROP TABLE IF EXISTS `WaitlistFormQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaitlistFormQuestion` (
  `FormID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FormID`,`QuestionID`),
  KEY `FK_WaitlistFormQuestion_WaitlistForm` (`FormID`),
  KEY `FK_WaitlistFormQuestion_WaitlistQuestion` (`QuestionID`),
  CONSTRAINT `FK_WaitlistFormQuestion_WaitlistForm` FOREIGN KEY (`FormID`) REFERENCES `WaitlistForm` (`FormID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_WaitlistFormQuestion_WaitlistQuestion` FOREIGN KEY (`QuestionID`) REFERENCES `WaitlistQuestion` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistFormQuestion`
--

LOCK TABLES `WaitlistFormQuestion` WRITE;
/*!40000 ALTER TABLE `WaitlistFormQuestion` DISABLE KEYS */;
INSERT INTO `WaitlistFormQuestion` VALUES (52,1,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,2,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,3,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,4,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,5,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,6,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,7,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (52,8,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,9,'jkhjkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,10,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,11,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,12,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,13,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,14,'jkhjkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,15,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (52,16,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (53,1,'no');
INSERT INTO `WaitlistFormQuestion` VALUES (53,2,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (53,3,'l;kh');
INSERT INTO `WaitlistFormQuestion` VALUES (53,4,'l;h');
INSERT INTO `WaitlistFormQuestion` VALUES (53,5,'l;h');
INSERT INTO `WaitlistFormQuestion` VALUES (53,6,'l;jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (53,7,'klj;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,8,'ljk;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,9,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,10,'lk;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,11,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,12,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,13,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,14,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,15,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (53,16,'jkl;');
INSERT INTO `WaitlistFormQuestion` VALUES (54,1,';jk');
INSERT INTO `WaitlistFormQuestion` VALUES (54,2,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,3,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,4,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,5,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,6,'j');
INSERT INTO `WaitlistFormQuestion` VALUES (54,7,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (54,8,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,9,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (54,10,'kh');
INSERT INTO `WaitlistFormQuestion` VALUES (54,11,'h');
INSERT INTO `WaitlistFormQuestion` VALUES (54,12,'hgjk');
INSERT INTO `WaitlistFormQuestion` VALUES (54,13,'lbkj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,14,'bh');
INSERT INTO `WaitlistFormQuestion` VALUES (54,15,'bhj');
INSERT INTO `WaitlistFormQuestion` VALUES (54,16,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,1,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (55,2,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,3,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,4,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,7,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,8,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,9,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,11,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,12,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,13,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (55,14,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,15,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (55,16,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (56,1,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,2,'gkhj');
INSERT INTO `WaitlistFormQuestion` VALUES (56,3,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (56,4,'jkhg');
INSERT INTO `WaitlistFormQuestion` VALUES (56,5,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,6,'gjkh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,7,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (56,8,'jkhg');
INSERT INTO `WaitlistFormQuestion` VALUES (56,9,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,10,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (56,11,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,12,'gkjh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,13,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (56,14,'jkhg');
INSERT INTO `WaitlistFormQuestion` VALUES (56,15,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (56,16,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (57,1,'a');
INSERT INTO `WaitlistFormQuestion` VALUES (57,2,'hkjhkjlhkj');
INSERT INTO `WaitlistFormQuestion` VALUES (57,3,'h');
INSERT INTO `WaitlistFormQuestion` VALUES (57,4,'kjlh');
INSERT INTO `WaitlistFormQuestion` VALUES (57,5,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (57,6,'hkj');
INSERT INTO `WaitlistFormQuestion` VALUES (57,7,'lh');
INSERT INTO `WaitlistFormQuestion` VALUES (57,8,'hjk');
INSERT INTO `WaitlistFormQuestion` VALUES (57,9,'kjhkj');
INSERT INTO `WaitlistFormQuestion` VALUES (57,10,'hkjh');
INSERT INTO `WaitlistFormQuestion` VALUES (57,11,'ljkh');
INSERT INTO `WaitlistFormQuestion` VALUES (57,12,'hjk');
INSERT INTO `WaitlistFormQuestion` VALUES (57,13,'jkhl');
INSERT INTO `WaitlistFormQuestion` VALUES (57,14,'hjkl');
INSERT INTO `WaitlistFormQuestion` VALUES (57,15,'hjk');
INSERT INTO `WaitlistFormQuestion` VALUES (57,16,'hjkl');
INSERT INTO `WaitlistFormQuestion` VALUES (58,1,'h;k');
INSERT INTO `WaitlistFormQuestion` VALUES (58,2,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (58,3,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,4,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (58,5,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,6,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,7,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,8,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,9,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,10,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,11,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,12,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,13,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,14,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,15,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (58,16,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,1,'klk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,2,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,3,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,4,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,5,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,6,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,7,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,8,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,9,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,11,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (59,12,'kljklj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,15,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (59,16,'klkj');
INSERT INTO `WaitlistFormQuestion` VALUES (60,1,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,2,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,3,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,4,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,5,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,6,'22');
INSERT INTO `WaitlistFormQuestion` VALUES (60,7,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,8,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,9,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,10,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,11,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,12,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,13,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,14,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,15,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (60,16,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (61,1,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,2,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,3,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,4,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,5,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,6,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,7,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,8,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,9,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,10,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,11,'33');
INSERT INTO `WaitlistFormQuestion` VALUES (61,12,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,13,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,14,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,15,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (61,16,'3');
INSERT INTO `WaitlistFormQuestion` VALUES (62,1,'asdf');
INSERT INTO `WaitlistFormQuestion` VALUES (62,2,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (62,3,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (62,4,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,5,'jhk');
INSERT INTO `WaitlistFormQuestion` VALUES (62,6,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,7,'jhk');
INSERT INTO `WaitlistFormQuestion` VALUES (62,8,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,9,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,10,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,11,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,12,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,13,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,14,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,15,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (62,16,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (63,1,'as');
INSERT INTO `WaitlistFormQuestion` VALUES (63,2,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,3,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (63,4,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (63,5,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,6,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (63,7,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,8,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,9,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,10,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,11,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,12,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,13,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,14,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (63,15,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (63,16,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,1,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,3,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,4,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,5,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,6,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,7,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,8,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,9,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (64,10,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,11,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,12,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,13,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,14,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,15,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (64,16,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,1,'kljlk');
INSERT INTO `WaitlistFormQuestion` VALUES (65,2,'lkjlk');
INSERT INTO `WaitlistFormQuestion` VALUES (65,3,'jlkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,4,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (65,5,'kljj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,6,'lkjlkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,7,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,8,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,9,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,12,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,15,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (65,16,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (66,1,'asd');
INSERT INTO `WaitlistFormQuestion` VALUES (66,2,'l;k');
INSERT INTO `WaitlistFormQuestion` VALUES (66,3,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (66,4,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (66,5,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (66,6,'ll');
INSERT INTO `WaitlistFormQuestion` VALUES (66,7,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (66,8,'h');
INSERT INTO `WaitlistFormQuestion` VALUES (66,9,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (66,10,'bv');
INSERT INTO `WaitlistFormQuestion` VALUES (66,11,'hv');
INSERT INTO `WaitlistFormQuestion` VALUES (66,12,'f');
INSERT INTO `WaitlistFormQuestion` VALUES (66,13,'uyt');
INSERT INTO `WaitlistFormQuestion` VALUES (66,14,'jjk');
INSERT INTO `WaitlistFormQuestion` VALUES (66,15,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (66,16,'hv');
INSERT INTO `WaitlistFormQuestion` VALUES (67,1,'aaaa');
INSERT INTO `WaitlistFormQuestion` VALUES (67,2,'f');
INSERT INTO `WaitlistFormQuestion` VALUES (67,3,'f');
INSERT INTO `WaitlistFormQuestion` VALUES (67,4,'f');
INSERT INTO `WaitlistFormQuestion` VALUES (67,5,'d');
INSERT INTO `WaitlistFormQuestion` VALUES (67,6,'d');
INSERT INTO `WaitlistFormQuestion` VALUES (67,7,'s');
INSERT INTO `WaitlistFormQuestion` VALUES (67,8,'e');
INSERT INTO `WaitlistFormQuestion` VALUES (67,9,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (67,10,'g');
INSERT INTO `WaitlistFormQuestion` VALUES (67,11,'v');
INSERT INTO `WaitlistFormQuestion` VALUES (67,12,'cd');
INSERT INTO `WaitlistFormQuestion` VALUES (67,13,'rd');
INSERT INTO `WaitlistFormQuestion` VALUES (67,14,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (67,15,'fx');
INSERT INTO `WaitlistFormQuestion` VALUES (67,16,'gfx');
INSERT INTO `WaitlistFormQuestion` VALUES (68,1,'ererer');
INSERT INTO `WaitlistFormQuestion` VALUES (68,2,'er');
INSERT INTO `WaitlistFormQuestion` VALUES (68,3,'e');
INSERT INTO `WaitlistFormQuestion` VALUES (68,4,'re');
INSERT INTO `WaitlistFormQuestion` VALUES (68,5,'re');
INSERT INTO `WaitlistFormQuestion` VALUES (68,6,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (68,7,'er');
INSERT INTO `WaitlistFormQuestion` VALUES (68,8,'e');
INSERT INTO `WaitlistFormQuestion` VALUES (68,9,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (68,10,'e');
INSERT INTO `WaitlistFormQuestion` VALUES (68,11,'t');
INSERT INTO `WaitlistFormQuestion` VALUES (68,12,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (68,13,'y');
INSERT INTO `WaitlistFormQuestion` VALUES (68,14,'r');
INSERT INTO `WaitlistFormQuestion` VALUES (68,15,'t');
INSERT INTO `WaitlistFormQuestion` VALUES (68,16,'xcv');
INSERT INTO `WaitlistFormQuestion` VALUES (69,1,'rwe');
INSERT INTO `WaitlistFormQuestion` VALUES (69,2,'rwe');
INSERT INTO `WaitlistFormQuestion` VALUES (69,3,'rw');
INSERT INTO `WaitlistFormQuestion` VALUES (69,4,'er');
INSERT INTO `WaitlistFormQuestion` VALUES (69,5,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,6,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,7,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,8,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,9,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,10,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,11,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,12,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,13,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,14,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,15,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (69,16,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,1,'rwe');
INSERT INTO `WaitlistFormQuestion` VALUES (70,2,'rwe');
INSERT INTO `WaitlistFormQuestion` VALUES (70,3,'rw');
INSERT INTO `WaitlistFormQuestion` VALUES (70,4,'er');
INSERT INTO `WaitlistFormQuestion` VALUES (70,5,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,6,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,7,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,8,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,9,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,10,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,11,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,12,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,13,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,14,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,15,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (70,16,'wer');
INSERT INTO `WaitlistFormQuestion` VALUES (71,1,'as');
INSERT INTO `WaitlistFormQuestion` VALUES (71,2,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,3,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,4,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,5,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,6,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (71,7,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,8,'jkh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,9,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,10,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,11,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,12,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,13,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,14,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,15,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (71,16,'kjh');
INSERT INTO `WaitlistFormQuestion` VALUES (72,1,'asdfadsfadsf');
INSERT INTO `WaitlistFormQuestion` VALUES (72,2,'asd');
INSERT INTO `WaitlistFormQuestion` VALUES (72,3,'fas');
INSERT INTO `WaitlistFormQuestion` VALUES (72,4,'da');
INSERT INTO `WaitlistFormQuestion` VALUES (72,5,'sdf');
INSERT INTO `WaitlistFormQuestion` VALUES (72,6,'fdsa');
INSERT INTO `WaitlistFormQuestion` VALUES (72,7,'sdf');
INSERT INTO `WaitlistFormQuestion` VALUES (72,8,'fd');
INSERT INTO `WaitlistFormQuestion` VALUES (72,9,'as');
INSERT INTO `WaitlistFormQuestion` VALUES (72,10,'fd');
INSERT INTO `WaitlistFormQuestion` VALUES (72,11,'fdsa');
INSERT INTO `WaitlistFormQuestion` VALUES (72,12,'sdf');
INSERT INTO `WaitlistFormQuestion` VALUES (72,13,'fda');
INSERT INTO `WaitlistFormQuestion` VALUES (72,14,'sdf');
INSERT INTO `WaitlistFormQuestion` VALUES (72,15,'fds');
INSERT INTO `WaitlistFormQuestion` VALUES (72,16,'as');
/*!40000 ALTER TABLE `WaitlistFormQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaitlistQuestion`
--

DROP TABLE IF EXISTS `WaitlistQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaitlistQuestion` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionText` varchar(255) NOT NULL,
  `Enabled` int(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`QuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistQuestion`
--

LOCK TABLES `WaitlistQuestion` WRITE;
/*!40000 ALTER TABLE `WaitlistQuestion` DISABLE KEYS */;
INSERT INTO `WaitlistQuestion` VALUES (1,'Can your child dress and undress himself?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (2,'Can your child take his socks and shoes off independently? Put them on without help?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (3,'What are your child\'s favorite pastimes? What activities does he enjoy?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (4,'How much time does your child spend with tv/dvd\'s/computers/video games on a daily basis?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (5,'Does your family speak English at home? Any other languages?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (6,'Briefly describe your child\'s communication. Single words? Two-word phrases? Sentences?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (7,'Can people outside your family understand your child?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (8,'Can your child respond to verbal direction? (For example, Go and put your coat on.)',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (9,'Briefly describe your child\'s movement. Does he primarily walk or run? Can he go up and down stairs without adult support or assistance?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (10,'In an average week, how many meals does your family eat together?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (11,'Does your child eat with utensils?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (12,'Does your child drink from a bottle, sippy-cup or an open cup/glass? Please list which.',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (13,'Does your child make eye-contact when you talk with him? With people outside your family?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (14,'Is your child using the bathroom independently? Does he wear cloth underwear, pull-ups or diapers at home? Please list which.',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (15,'Specifically, what does your child do to help himself?',1,'2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (16,'How do you respond when your child refuses to comply to direction from you?',1,'2012-03-09 22:26:50');
/*!40000 ALTER TABLE `WaitlistQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('8e25602db0ef108ba5bc0a7f87e77465','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19',1337244375,'');
INSERT INTO `ci_sessions` VALUES ('b7c791ec39953ac36744f279ea9ad0e9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19',1337247457,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','No restrictions. Cannot be re-routed by alerts.');
INSERT INTO `groups` VALUES (100,'parent',NULL);
INSERT INTO `groups` VALUES (200,'alert','This group is for parents that need to meet some requirements.');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `group_id` varchar(45) NOT NULL DEFAULT '3',
  `token` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `LastLoginDTTM` datetime DEFAULT NULL,
  `CreationDTTM` datetime NOT NULL,
  `Enabled` int(11) NOT NULL,
  `HasChangedPassword` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com','6f7c155805e64f13b752a222bf8f6528e958ed890cc149a53f0ab01f6d5d108c','1','','',NULL,'2012-02-02 01:01:01',1,1);
INSERT INTO `users` VALUES (24,'Justin.Field','fieldju@gmail.com','1ab9e422fac04df35066e6491d39b745550ae4a65a9ac9f81a5504682a25b71a','100','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (25,'Mark.Bowser','markbowser9@gmail.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (29,'mark.bowser.2','markbowser9@hotmail.com','3503c71df253c3c255ec529a195c66c38592156989e8c73374f46e58a1ae11a1','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (31,'test','test@test.com','86c2982e3349c29255f99281593148a736386617f2cb53dec3aa851f8e86bfae','1','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (33,'parent','asdf','0e04f84669bdcf3c97bc19cbba4e0ce4a5b6d8e889cfe58c9d64d1d107245df8','100','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (34,'asdf','adsf','6b881a874e1a94245c11431b78e9569727385b2ca7d3d25b118e9835e801afa9','100','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (35,'bob.ginger','gi@gi.com','fcb7ea1b103fab50f302a762c7fa148c2813413f49ecac37a7e2c60c2953394a','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (36,'bob.ginger.2','gasdi@gi.com','f240c212b2c6b751f24154ac43a69d2b328dabca8df3eaa24726e450d25b7617','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (37,'kjhkljh.lkh','kjlh@akldsjfh.com','4dc82ca5d4ba04fca76b7957cda1610a3d382d4d82eaed81abf2459b0b54b082','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (38,'testf.sta','bob@aol.com','3b865d87f96be908ad0b5c5889c28d224e3fc83beeb70b6a512c121b9cd22909','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (39,'testf.sta.2','bosb@aol.com','1dce1636d9fc1935bcb8d0a8096bb585ab877cfa00a612c47598bddcaab88cf7','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (40,'testf.sta.3','bosdb@aol.com','adce48bc514c8f26b6a9ff0674f1cdfe320e28459d3993bbf66b7f93b382f5a9','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (41,'testf.sta.4','bosdfdb@aol.com','b2d25c7450ea7d424edbb227570a5cdf4a177d0bf51ffbe1146eda9b70bd3443','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (42,'132321123.132132','bosdffdb@aol.com','ad3c662b2d2ef1d5d6e27475b0d1eb8ee852f5c38008d5191869727f485e80d3','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (43,'199999.132132','bosdffddb@aol.com','8e0b38ba972134145531e942a35d36c6dde36d63e3ea14a40eaf756449fa3812','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (44,'19999fgh9.132132','bosdfhhfddb@aol.com','ecc4ec32d511f03be7e27a660e1fd49ff4bb269ef1a39d6236ccbd14bf4b6d76','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (45,'ppppp.132132','bosddfhhfddb@aol.com','aba973897cbd5583b0242362f48a5310d1dc796daaa7c411a06f01cfef68576e','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (46,'ppppp.132132.2','bosdfgdfhhfddb@aol.com','fe22892ea62b4b9f83434d231d2de6239c0516bd134719fe153f045d203d1684','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (47,'ppppp.132132.3','bosdfdfgdfhhfddb@aol.com','4ebb42b0d3fb3a041dca38cbaf44e8b873d66cefb9c591faae5ed3177b792ef2','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (48,'unicorn.lighting','lit@lit.com','905f2fb242cca68d07105cd163b0e7fd7319c820083c45e405c3127c97d926e6','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (49,'Justi.asd','fi@lf.com','5c0d90f64c343a4dbdc1a2066bd222105f9837327f9ac2a5d81c3e702596366f','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (50,'Justi.asd.2','fdfi@lf.com','91b17f61d607885add8ca035186e8aad81450529b19925ef867fd31477136c00','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (51,'a.a','a@a.com','5fce946ebc338cb7ffd9bfeee5eca44b56bb02afaa0d20f64116576c33efd64f','100','','',NULL,'0000-00-00 00:00:00',1,0);
INSERT INTO `users` VALUES (52,'a.a.2','aa@a.com','24cf6b38cd5e3140197ce6f1411e353d5e65a4060d699f9361d257b2402d099b','100','','',NULL,'0000-00-00 00:00:00',1,0);
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

-- Dump completed on 2012-05-17  3:14:01
