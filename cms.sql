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
INSERT INTO `AdmissionsForm` VALUES (16,'nope. this would be like his kindergarten','just the neighbor kids','hugs','yep. he&#39;s ready for all that','sometimes if he&#39;s cranky','in the summer time','Tucan : Fred','bugs!','George','6','Other','aliens','nope. he&#39;s a good kid');
INSERT INTO `AdmissionsForm` VALUES (17,'yes','some','hugs','yes','no','sure','Albatross : James','James the albatross','bob','3','Parent','Mark Bowser','not really');
INSERT INTO `AdmissionsForm` VALUES (18,'yes','yes','yes','yes','yes','yes',NULL,'yes','bob','7','Parent','crazy!','no');
INSERT INTO `AdmissionsForm` VALUES (19,'nope','hunting and gathering','cottage cheese','poopin','yes. nocturnal','not in the sunlight.','Tucan : Brutus','taxedermy','blah','400','Other','hi','He&#39;s a troglodyte');
INSERT INTO `AdmissionsForm` VALUES (20,'lkj','lkj','lk','lk','lk','lkj',NULL,';lkj','lkj','2','Internet','','klj');
/*!40000 ALTER TABLE `AdmissionsForm` ENABLE KEYS */;
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
INSERT INTO `Classroom` VALUES (1,'Toddler House',2,1,'2012-04-21 16:20:07');
INSERT INTO `Classroom` VALUES (2,'Primary',3,1,'2012-04-21 16:20:07');
INSERT INTO `Classroom` VALUES (3,'Elementary',3,1,'2012-04-21 16:20:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyContact`
--

LOCK TABLES `EmergencyContact` WRITE;
/*!40000 ALTER TABLE `EmergencyContact` DISABLE KEYS */;
INSERT INTO `EmergencyContact` VALUES (106,'Joanne Lewis','555-555-5555','Aunt');
INSERT INTO `EmergencyContact` VALUES (107,'Rodger Graham-Cracker','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (108,'Nancy Thomas','555-555-5555','family friend');
INSERT INTO `EmergencyContact` VALUES (109,'Jack Bowser','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (110,'Jerry','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (111,'Janelle','555-555-5555','Aunt');
INSERT INTO `EmergencyContact` VALUES (112,'bob','555-555-5555','no relationship');
INSERT INTO `EmergencyContact` VALUES (113,'ray','555-555-5555','friend');
INSERT INTO `EmergencyContact` VALUES (114,'sarah','555-555-5555','brother');
INSERT INTO `EmergencyContact` VALUES (115,'mom','555-555-5555','mom');
INSERT INTO `EmergencyContact` VALUES (116,'dad','555-555-5555','dad');
INSERT INTO `EmergencyContact` VALUES (117,'other','555-555-5555','other');
INSERT INTO `EmergencyContact` VALUES (118,'Abe Lincoln','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (119,'Ralph Nader','555-555-5555','Father');
INSERT INTO `EmergencyContact` VALUES (120,'Yoda','555-555-5555','mentor');
/*!40000 ALTER TABLE `EmergencyContact` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (1,'Waitlist a child','admissions/waitlistQuestionaire/');
INSERT INTO `Notifications` VALUES (6,'Register student : ','admissions/registerStudent/');
INSERT INTO `Notifications` VALUES (7,'Fill out medical release form : ','admissions/studentMedical/');
INSERT INTO `Notifications` VALUES (8,'Parent has completed registration for : ','admin/manageStudents');
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
  CONSTRAINT `FK_Parent_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Parent_VolunteerSkillSheet` FOREIGN KEY (`SkillSheetID`) REFERENCES `VolunteerSkillSheet` (`SkillSheetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
INSERT INTO `Parent` VALUES (41,62,'Mark',NULL,'Bowser','markbowser9@gmail.com',NULL,NULL,0,NULL,'2012-05-18 08:53:18');
INSERT INTO `Parent` VALUES (42,63,'Mark',NULL,'Bowser','markbowser9@hotmail.com',NULL,NULL,0,NULL,'2012-05-18 09:14:11');
INSERT INTO `Parent` VALUES (43,64,'Mark',NULL,'Bowser','adsfadafd@asdafdsafsfds.com',NULL,NULL,0,NULL,'2012-05-18 09:44:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (16,63,NULL,2,'Gary','','Graham-Cracker','M','184 S 7th St, Lebanon, OR, 97355','Lebanon, OR','2003-01-05',NULL,'541-259-4620',106,107,108,0,13,'2012-05-18 09:25:56');
INSERT INTO `Student` VALUES (17,62,2,2,'Billy',NULL,'Banana','M','184 S 7th St, Lebanon, OR, 97355','Salem, OR, 97355','2001-01-01',NULL,'541-259-4620',109,110,111,1,10,'2012-05-18 13:30:07');
INSERT INTO `Student` VALUES (18,62,NULL,4,'Roy','Lee','Trueman','M','111 NW 26th St Apt 1','Corvallis, OR','1989-10-14',NULL,'541-979-0245',112,113,114,0,12,'2012-05-25 00:48:13');
INSERT INTO `Student` VALUES (19,62,NULL,4,'Walter','','Troglodyte','M','cave','cave','2001-01-01',NULL,'555-555-5555',115,116,117,0,16,'2012-05-25 02:58:37');
INSERT INTO `Student` VALUES (20,64,NULL,4,'Sean','Onifer','Stalley','M','184 S 7th St, Lebanon, OR, 97355','here','2002-03-02',NULL,'555-555-5555',118,119,120,0,15,'2012-05-25 03:13:15');
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
INSERT INTO `StudentMedicalInformation` VALUES (17,'Corvallis Hospital','555-555-5555','David','555-555-5555','Sally','555-555-5555','','','none','none','none');
INSERT INTO `StudentMedicalInformation` VALUES (18,'Corvallis Hospital','555-555-5555','David','555-555-5555','Bob','555-555-5555','no!','no!','blah','234dfs','');
INSERT INTO `StudentMedicalInformation` VALUES (19,'time','555-555-5555','mom','555-555-5555','dad','555-555-5555','mad cow desease','sunlight','none','none','none');
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
INSERT INTO `SubItem` VALUES (2,3,'Interview & Observation','admin/interviewObservationForm',2);
INSERT INTO `SubItem` VALUES (3,3,'Waitlist Student','admissions/waitlistQuestionaire',3);
INSERT INTO `SubItem` VALUES (4,3,'Register Student','admissions/registerStudentSelector',4);
INSERT INTO `SubItem` VALUES (18,5,'Add Sub-Menu Item','admin/addSubItem',5);
INSERT INTO `SubItem` VALUES (19,5,'Waitlist Managment','admin/waitlist',1);
INSERT INTO `SubItem` VALUES (20,3,'Pending Medical Records','admissions/studentMedicalSelector',1);
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
-- Table structure for table `UserNotifications`
--

DROP TABLE IF EXISTS `UserNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserNotifications` (
  `NotificationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AdditionalInfo` varchar(255) DEFAULT '',
  `UrlParam` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserID`,`NotificationID`,`UrlParam`),
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
INSERT INTO `UserNotifications` VALUES (8,62,' ','');
INSERT INTO `UserNotifications` VALUES (8,62,'Roy Trueman','18');
INSERT INTO `UserNotifications` VALUES (8,62,'Walter Troglodyte','19');
INSERT INTO `UserNotifications` VALUES (6,63,'George Graham-Cracker','14');
INSERT INTO `UserNotifications` VALUES (7,63,'Gary Graham-Cracker','16');
INSERT INTO `UserNotifications` VALUES (7,64,'Sean Stalley','20');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerLogEntry`
--

LOCK TABLES `VolunteerLogEntry` WRITE;
/*!40000 ALTER TABLE `VolunteerLogEntry` DISABLE KEYS */;
INSERT INTO `VolunteerLogEntry` VALUES (52,62,6,'substitute teaching','2012-05-18 09:05:04');
INSERT INTO `VolunteerLogEntry` VALUES (53,62,2.5,'Janitorial work after school','2012-05-18 09:10:02');
INSERT INTO `VolunteerLogEntry` VALUES (54,63,1,'website maintanence','2012-05-18 09:20:44');
INSERT INTO `VolunteerLogEntry` VALUES (55,63,1.2,'more website maintanence','2012-05-18 09:21:00');
INSERT INTO `VolunteerLogEntry` VALUES (56,63,6,'Teacher\'s assistant for the day','2012-05-18 09:21:16');
INSERT INTO `VolunteerLogEntry` VALUES (57,62,0.5,'drove the bus','2012-05-18 10:11:53');
INSERT INTO `VolunteerLogEntry` VALUES (58,63,4,'janitorial','2012-05-18 11:09:55');
INSERT INTO `VolunteerLogEntry` VALUES (59,63,4.2,'substitute teaching','2012-05-18 13:33:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistForm`
--

LOCK TABLES `WaitlistForm` WRITE;
/*!40000 ALTER TABLE `WaitlistForm` DISABLE KEYS */;
INSERT INTO `WaitlistForm` VALUES (10,2,62,'Billy','','Banana',1,0,0,'2012-05-18 08:55:33');
INSERT INTO `WaitlistForm` VALUES (11,2,62,'Jill','','Trueman',2,0,1,'2012-05-18 08:58:18');
INSERT INTO `WaitlistForm` VALUES (12,4,62,'Roy','Lee','Trueman',2,0,0,'2012-05-18 09:01:26');
INSERT INTO `WaitlistForm` VALUES (13,2,63,'Gary','','Graham-Cracker',1,0,0,'2012-05-18 09:16:43');
INSERT INTO `WaitlistForm` VALUES (14,4,63,'George','','Graham-Cracker',3,1,0,'2012-05-18 09:19:57');
INSERT INTO `WaitlistForm` VALUES (15,4,64,'Sean','Onifer','Stalley',1,1,0,'2012-05-18 10:27:02');
INSERT INTO `WaitlistForm` VALUES (16,4,62,'Walter','','Troglodyte',2,0,0,'2012-05-25 02:11:17');
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
INSERT INTO `WaitlistFormQuestion` VALUES (10,1,'mostly');
INSERT INTO `WaitlistFormQuestion` VALUES (10,2,'ya. for sure');
INSERT INTO `WaitlistFormQuestion` VALUES (10,3,'being read to.');
INSERT INTO `WaitlistFormQuestion` VALUES (10,4,'not a lot. outdoors family');
INSERT INTO `WaitlistFormQuestion` VALUES (10,5,'yes. no just english');
INSERT INTO `WaitlistFormQuestion` VALUES (10,6,'full sentances');
INSERT INTO `WaitlistFormQuestion` VALUES (10,7,'yep');
INSERT INTO `WaitlistFormQuestion` VALUES (10,8,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (10,9,'walks well');
INSERT INTO `WaitlistFormQuestion` VALUES (10,10,'4');
INSERT INTO `WaitlistFormQuestion` VALUES (10,11,'He can');
INSERT INTO `WaitlistFormQuestion` VALUES (10,12,'all of the above');
INSERT INTO `WaitlistFormQuestion` VALUES (10,13,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (10,14,'diapers');
INSERT INTO `WaitlistFormQuestion` VALUES (10,15,'cry');
INSERT INTO `WaitlistFormQuestion` VALUES (10,16,'time out');
INSERT INTO `WaitlistFormQuestion` VALUES (11,1,'indeed');
INSERT INTO `WaitlistFormQuestion` VALUES (11,2,'indeed');
INSERT INTO `WaitlistFormQuestion` VALUES (11,3,'blocks. building stuff with legos');
INSERT INTO `WaitlistFormQuestion` VALUES (11,4,'none at all.');
INSERT INTO `WaitlistFormQuestion` VALUES (11,5,'Yes. A little spanish');
INSERT INTO `WaitlistFormQuestion` VALUES (11,6,'she&#39;s a talker');
INSERT INTO `WaitlistFormQuestion` VALUES (11,7,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (11,8,'she can be rebellious, but she&#39;ll listen');
INSERT INTO `WaitlistFormQuestion` VALUES (11,9,'run');
INSERT INTO `WaitlistFormQuestion` VALUES (11,10,'2');
INSERT INTO `WaitlistFormQuestion` VALUES (11,11,'if you make her');
INSERT INTO `WaitlistFormQuestion` VALUES (11,12,'ya, whatever we give her');
INSERT INTO `WaitlistFormQuestion` VALUES (11,13,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (11,14,'normal underwear');
INSERT INTO `WaitlistFormQuestion` VALUES (11,15,'cry');
INSERT INTO `WaitlistFormQuestion` VALUES (11,16,'time out');
INSERT INTO `WaitlistFormQuestion` VALUES (12,1,'YES');
INSERT INTO `WaitlistFormQuestion` VALUES (12,2,'YES, sir');
INSERT INTO `WaitlistFormQuestion` VALUES (12,3,'camping');
INSERT INTO `WaitlistFormQuestion` VALUES (12,4,'none, we don&#39;t have TV');
INSERT INTO `WaitlistFormQuestion` VALUES (12,5,'English only');
INSERT INTO `WaitlistFormQuestion` VALUES (12,6,'shorter phrases');
INSERT INTO `WaitlistFormQuestion` VALUES (12,7,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,8,'most of the time');
INSERT INTO `WaitlistFormQuestion` VALUES (12,9,'walks');
INSERT INTO `WaitlistFormQuestion` VALUES (12,10,'as many as possible. 5?');
INSERT INTO `WaitlistFormQuestion` VALUES (12,11,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,12,'bottle');
INSERT INTO `WaitlistFormQuestion` VALUES (12,13,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (12,14,'yes, normal underwear');
INSERT INTO `WaitlistFormQuestion` VALUES (12,15,'gets mom or dad');
INSERT INTO `WaitlistFormQuestion` VALUES (12,16,'spankings');
INSERT INTO `WaitlistFormQuestion` VALUES (13,1,'he can');
INSERT INTO `WaitlistFormQuestion` VALUES (13,2,'He can even tie his shoes!');
INSERT INTO `WaitlistFormQuestion` VALUES (13,3,'video games');
INSERT INTO `WaitlistFormQuestion` VALUES (13,4,'he only plays when his dad does');
INSERT INTO `WaitlistFormQuestion` VALUES (13,5,'Just english');
INSERT INTO `WaitlistFormQuestion` VALUES (13,6,'He uses full sentences');
INSERT INTO `WaitlistFormQuestion` VALUES (13,7,'almost all the time');
INSERT INTO `WaitlistFormQuestion` VALUES (13,8,'He can. Don&#39;t let him fool you.');
INSERT INTO `WaitlistFormQuestion` VALUES (13,9,'He can walk and run');
INSERT INTO `WaitlistFormQuestion` VALUES (13,10,'a couple');
INSERT INTO `WaitlistFormQuestion` VALUES (13,11,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (13,12,'sippy-cup');
INSERT INTO `WaitlistFormQuestion` VALUES (13,13,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (13,14,'ya, cloth underwear');
INSERT INTO `WaitlistFormQuestion` VALUES (13,15,'asks us');
INSERT INTO `WaitlistFormQuestion` VALUES (13,16,'spakings');
INSERT INTO `WaitlistFormQuestion` VALUES (14,1,'of course!');
INSERT INTO `WaitlistFormQuestion` VALUES (14,2,'both');
INSERT INTO `WaitlistFormQuestion` VALUES (14,3,'legos!');
INSERT INTO `WaitlistFormQuestion` VALUES (14,4,'we don&#39;t let him play the video games');
INSERT INTO `WaitlistFormQuestion` VALUES (14,5,'English only');
INSERT INTO `WaitlistFormQuestion` VALUES (14,6,'he doesn&#39;t talk much');
INSERT INTO `WaitlistFormQuestion` VALUES (14,7,'not very well');
INSERT INTO `WaitlistFormQuestion` VALUES (14,8,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (14,9,'walks');
INSERT INTO `WaitlistFormQuestion` VALUES (14,10,'dinner every night');
INSERT INTO `WaitlistFormQuestion` VALUES (14,11,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (14,12,'he can drink from a glass, but we give him a sippy-cup');
INSERT INTO `WaitlistFormQuestion` VALUES (14,13,'yep');
INSERT INTO `WaitlistFormQuestion` VALUES (14,14,'he needs help sometimes');
INSERT INTO `WaitlistFormQuestion` VALUES (14,15,'asks me');
INSERT INTO `WaitlistFormQuestion` VALUES (14,16,'depends on the day');
INSERT INTO `WaitlistFormQuestion` VALUES (15,1,'yes\nYES');
INSERT INTO `WaitlistFormQuestion` VALUES (15,2,'YES');
INSERT INTO `WaitlistFormQuestion` VALUES (15,3,'games');
INSERT INTO `WaitlistFormQuestion` VALUES (15,4,'none');
INSERT INTO `WaitlistFormQuestion` VALUES (15,5,'english');
INSERT INTO `WaitlistFormQuestion` VALUES (15,6,'words in general');
INSERT INTO `WaitlistFormQuestion` VALUES (15,7,'asdf;lkh');
INSERT INTO `WaitlistFormQuestion` VALUES (15,8,';lkh');
INSERT INTO `WaitlistFormQuestion` VALUES (15,9,'lk;h');
INSERT INTO `WaitlistFormQuestion` VALUES (15,10,';lkh');
INSERT INTO `WaitlistFormQuestion` VALUES (15,11,'l;h');
INSERT INTO `WaitlistFormQuestion` VALUES (15,12,'lk;h');
INSERT INTO `WaitlistFormQuestion` VALUES (15,13,'l;kh');
INSERT INTO `WaitlistFormQuestion` VALUES (15,14,'lk;l');
INSERT INTO `WaitlistFormQuestion` VALUES (15,15,'k;lk;');
INSERT INTO `WaitlistFormQuestion` VALUES (15,16,'lj;k');
INSERT INTO `WaitlistFormQuestion` VALUES (16,1,'He chooses not to');
INSERT INTO `WaitlistFormQuestion` VALUES (16,2,'Can you take your socks and shoes off independently?');
INSERT INTO `WaitlistFormQuestion` VALUES (16,3,'categorize river creatures');
INSERT INTO `WaitlistFormQuestion` VALUES (16,4,'none');
INSERT INTO `WaitlistFormQuestion` VALUES (16,5,'no. grunts');
INSERT INTO `WaitlistFormQuestion` VALUES (16,6,'it all kinda mushes together');
INSERT INTO `WaitlistFormQuestion` VALUES (16,7,'nooo');
INSERT INTO `WaitlistFormQuestion` VALUES (16,8,'he understands gestures');
INSERT INTO `WaitlistFormQuestion` VALUES (16,9,'runs');
INSERT INTO `WaitlistFormQuestion` VALUES (16,10,'12+');
INSERT INTO `WaitlistFormQuestion` VALUES (16,11,'no!');
INSERT INTO `WaitlistFormQuestion` VALUES (16,12,'cupped fists');
INSERT INTO `WaitlistFormQuestion` VALUES (16,13,'always');
INSERT INTO `WaitlistFormQuestion` VALUES (16,14,'naked');
INSERT INTO `WaitlistFormQuestion` VALUES (16,15,'he wails');
INSERT INTO `WaitlistFormQuestion` VALUES (16,16,'psycological warfare');
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
INSERT INTO `WaitlistQuestion` VALUES (15,'Specifically, what does your child do to help himself/herself?',1,'2012-03-09 22:26:50');
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
INSERT INTO `ci_sessions` VALUES ('99f8dbb9abbae8845bfdf6fb144ff84c','24.21.104.139','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5',1337940801,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:1:\"1\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";s:19:\"2012-05-25 03:11:37\";s:12:\"CreationDTTM\";s:19:\"2012-02-02 01:01:01\";s:7:\"Enabled\";s:1:\"1\";s:18:\"HasChangedPassword\";s:1:\"1\";s:9:\"logged_in\";b:1;}');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com','6f7c155805e64f13b752a222bf8f6528e958ed890cc149a53f0ab01f6d5d108c','1','','','2012-05-25 03:13:24','2012-02-02 01:01:01',1,1);
INSERT INTO `users` VALUES (24,'Justin.Field','fieldju@gmailsdsd.com','c68e63ba2197d48d6afbefa23205ed7707c8a2f616d02941092eb6e3ce5ff09e','100','','',NULL,'0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (62,'Mark.Bowser','markbowser9@gmail.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-05-25 03:11:00','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (63,'Mark.Bowser.2','markbowser9@hotmail.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-05-25 03:11:14','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (64,'Mark.Bowser.3','adsfadafd@asdafdsafsfds.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-05-25 03:11:54','0000-00-00 00:00:00',1,1);
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

-- Dump completed on 2012-05-25  3:14:01
