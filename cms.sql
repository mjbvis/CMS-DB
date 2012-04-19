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
  `Enabled` bit(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`AcademicLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicLevel`
--

LOCK TABLES `AcademicLevel` WRITE;
/*!40000 ALTER TABLE `AcademicLevel` DISABLE KEYS */;
INSERT INTO `AcademicLevel` VALUES (1,'Toddler House','children 18 months to 3 years','','2012-04-18 11:14:56');
INSERT INTO `AcademicLevel` VALUES (2,'Primary','children 3 years to 6 years','','2012-04-18 11:14:56');
INSERT INTO `AcademicLevel` VALUES (3,'Elementary','children 6 years to 12 years','','2012-04-18 11:14:56');
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
  `Pets` varchar(255) NOT NULL,
  `Interests` varchar(255) NOT NULL,
  `SiblingNames` varchar(255) NOT NULL DEFAULT '',
  `SiblingAges` varchar(255) NOT NULL DEFAULT '',
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
  `IsDonor` bit(1) DEFAULT NULL,
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
  `Enabled` bit(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `FK_Classroom_AcademicLevel` (`AcademicLevelID`),
  CONSTRAINT `FK_Classroom_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classroom`
--

LOCK TABLES `Classroom` WRITE;
/*!40000 ALTER TABLE `Classroom` DISABLE KEYS */;
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
  `EventID` int(11) DEFAULT NULL,
  `FundingPurpose` varchar(255) DEFAULT NULL,
  `DonationDate` datetime DEFAULT NULL,
  `Comments` varchar(2047) DEFAULT NULL,
  PRIMARY KEY (`DonationID`),
  KEY `FK_Donation_DonationTypeLookup` (`DonationTypeID`),
  KEY `FK_Donation_Donor` (`DonorID`),
  KEY `FK_Donation_Event` (`EventID`),
  CONSTRAINT `FK_Donation_DonationTypeLookup` FOREIGN KEY (`DonationTypeID`) REFERENCES `DonationTypeLookup` (`DonationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_Donor` FOREIGN KEY (`DonorID`) REFERENCES `Donor` (`DonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_Event` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyContact`
--

LOCK TABLES `EmergencyContact` WRITE;
/*!40000 ALTER TABLE `EmergencyContact` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
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
-- Table structure for table `InsuranceInformation`
--

DROP TABLE IF EXISTS `InsuranceInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InsuranceInformation` (
  `StudentID` int(11) NOT NULL,
  `InsuranceCompany` varchar(255) NOT NULL,
  `CertificateNumber` int(11) NOT NULL,
  `NameOfInsured` varchar(255) NOT NULL,
  `Employer` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_InsuranceInformation_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InsuranceInformation`
--

LOCK TABLES `InsuranceInformation` WRITE;
/*!40000 ALTER TABLE `InsuranceInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `InsuranceInformation` ENABLE KEYS */;
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
-- Table structure for table `Observation`
--

DROP TABLE IF EXISTS `Observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Observation` (
  `ParentID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `ObservationDTTM` datetime NOT NULL,
  `Attended` bit(1) NOT NULL,
  `OnTime` bit(1) NOT NULL,
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
  `IsDepositPaid` bit(1) NOT NULL DEFAULT b'0',
  `IsProspect` bit(1) NOT NULL DEFAULT b'1',
  `AppReceivedDTTM` datetime DEFAULT NULL,
  `FeeReceivedDTTM` datetime DEFAULT NULL,
  `UDDTM` datetime NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_Parent_users` (`UserID`),
  CONSTRAINT `FK_Parent_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
INSERT INTO `Parent` VALUES (1,1,'Little','Bobby','Tables','markbowser9@gmail.com',NULL,NULL,'\0','',NULL,NULL,'2012-03-10 16:06:01');
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
  `Enabled` bit(1) NOT NULL DEFAULT b'1',
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
INSERT INTO `Program` VALUES (1,1,'3 day (Monday - Wednesday)','8:30 AM','11:30 AM','\0');
INSERT INTO `Program` VALUES (2,1,'5 day (Monday - Friday)','8:30 AM','11:30 AM','');
INSERT INTO `Program` VALUES (3,2,'3 day (Monday - Wednesday)','8:30 AM','2:30 PM','\0');
INSERT INTO `Program` VALUES (4,2,'5 day (Monday - Friday)','8:30 AM','3:00 PM','');
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
  `Enabled` bit(1) NOT NULL,
  `RankOrder` int(11) NOT NULL,
  PRIMARY KEY (`ProgramGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgramGroup`
--

LOCK TABLES `ProgramGroup` WRITE;
/*!40000 ALTER TABLE `ProgramGroup` DISABLE KEYS */;
INSERT INTO `ProgramGroup` VALUES (1,'Primary Mornings','',1);
INSERT INTO `ProgramGroup` VALUES (2,'Full-Day Primary','',5);
INSERT INTO `ProgramGroup` VALUES (3,'Extended Day','\0',15);
INSERT INTO `ProgramGroup` VALUES (4,'Elementary','',10);
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
  `IsLearningIndipendently` bit(1) NOT NULL,
  `IsLearningAtOwnPace` bit(1) NOT NULL,
  `IsHandsOnLearner` bit(1) NOT NULL,
  `IsMixedAges` bit(1) NOT NULL,
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
-- Table structure for table `RelationshipLookup`
--

DROP TABLE IF EXISTS `RelationshipLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelationshipLookup` (
  `RelationshipID` int(11) NOT NULL AUTO_INCREMENT,
  `RelationshipName` varchar(255) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`RelationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelationshipLookup`
--

LOCK TABLES `RelationshipLookup` WRITE;
/*!40000 ALTER TABLE `RelationshipLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `RelationshipLookup` ENABLE KEYS */;
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
  `Enabled` bit(1) NOT NULL,
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
  `ClassID` int(11) NOT NULL,
  `ProgramID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Nickname` varchar(255) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `PlaceOfBirth` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `EnrollmentDTTM` datetime NOT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `EmergencyContactID1` int(11) NOT NULL,
  `EmergencyContactID2` int(11) NOT NULL,
  `EmergencyContactID3` int(11) NOT NULL,
  `IsEnrolled` bit(1) NOT NULL DEFAULT b'0',
  `QuestionaireID` int(11) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Student_Classroom` (`ClassID`),
  KEY `FK_Student_EmergencyContact1` (`EmergencyContactID1`),
  KEY `FK_Student_EmergencyContact2` (`EmergencyContactID2`),
  KEY `FK_Student_EmergencyContact3` (`EmergencyContactID3`),
  KEY `FK_Student_WaitlistQuestionaire` (`QuestionaireID`),
  KEY `FK_Student_Program` (`ProgramID`),
  CONSTRAINT `FK_Student_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact1` FOREIGN KEY (`EmergencyContactID1`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact2` FOREIGN KEY (`EmergencyContactID2`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact3` FOREIGN KEY (`EmergencyContactID3`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Program` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_WaitlistQuestionaire` FOREIGN KEY (`QuestionaireID`) REFERENCES `WaitlistForm` (`FormID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
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
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_MedicalInformation_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentMedicalInformation`
--

LOCK TABLES `StudentMedicalInformation` WRITE;
/*!40000 ALTER TABLE `StudentMedicalInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentMedicalInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentParent`
--

DROP TABLE IF EXISTS `StudentParent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentParent` (
  `ParentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `RelationshipID` int(11) NOT NULL,
  `IsPrimaryContact` bit(1) NOT NULL,
  PRIMARY KEY (`ParentID`,`StudentID`),
  KEY `FK_StudentParent_Student` (`StudentID`),
  KEY `FK_StudentParent_Parent` (`ParentID`),
  KEY `FK_StudentParent_RelationshipLookup` (`RelationshipID`),
  CONSTRAINT `FK_StudentParent_Parent` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_StudentParent_RelationshipLookup` FOREIGN KEY (`RelationshipID`) REFERENCES `RelationshipLookup` (`RelationshipID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_StudentParent_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentParent`
--

LOCK TABLES `StudentParent` WRITE;
/*!40000 ALTER TABLE `StudentParent` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentParent` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubItem`
--

LOCK TABLES `SubItem` WRITE;
/*!40000 ALTER TABLE `SubItem` DISABLE KEYS */;
INSERT INTO `SubItem` VALUES (1,5,'Create New Parent Account','admin/register',1);
INSERT INTO `SubItem` VALUES (2,5,'Interview & Observation','admin/interview_observation_form',2);
INSERT INTO `SubItem` VALUES (3,3,'Waitlist Student','admissions/waitlist_questionaire',3);
INSERT INTO `SubItem` VALUES (4,3,'Register New Student','admissions/register_student_selector',4);
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
-- Table structure for table `VolunteerLogEntry`
--

DROP TABLE IF EXISTS `VolunteerLogEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerLogEntry` (
  `EntryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL,
  `Hours` double NOT NULL,
  `VolunteerTaskID` int(11) NOT NULL,
  `VolunteerEventID` int(11) NOT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `FK_VolunteerLogEntry_VolunteerTasks` (`VolunteerTaskID`),
  KEY `FK_VolunteerLogEntry_VolunteerEvent` (`VolunteerEventID`),
  KEY `FK_VolunteerLogEntry_Vonunteer` (`ParentID`),
  CONSTRAINT `FK_VolunteerLogEntry_VolunteerEvent` FOREIGN KEY (`VolunteerEventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_VolunteerLogEntry_VolunteerTasks` FOREIGN KEY (`VolunteerTaskID`) REFERENCES `VolunteerTasks` (`VolunteerTaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_VolunteerLogEntry_Vonunteer` FOREIGN KEY (`ParentID`) REFERENCES `Vonunteer` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerLogEntry`
--

LOCK TABLES `VolunteerLogEntry` WRITE;
/*!40000 ALTER TABLE `VolunteerLogEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerLogEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerSkillSheet`
--

DROP TABLE IF EXISTS `VolunteerSkillSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerSkillSheet` (
  `VolunteerSkillID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillID` int(11) DEFAULT NULL,
  `VolunteerTaskID` int(11) DEFAULT NULL,
  PRIMARY KEY (`VolunteerSkillID`)
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
-- Table structure for table `VolunteerTasks`
--

DROP TABLE IF EXISTS `VolunteerTasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerTasks` (
  `VolunteerTaskID` int(11) NOT NULL AUTO_INCREMENT,
  `TaskName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `TaskDTTM` datetime NOT NULL,
  PRIMARY KEY (`VolunteerTaskID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerTasks`
--

LOCK TABLES `VolunteerTasks` WRITE;
/*!40000 ALTER TABLE `VolunteerTasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerTasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vonunteer`
--

DROP TABLE IF EXISTS `Vonunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vonunteer` (
  `ParentID` int(11) NOT NULL,
  `VolunteeringOptOut` bit(1) DEFAULT NULL,
  `VolunteerSkillID` int(11) NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_Parent_Volunteer` (`ParentID`),
  KEY `FK_Vonunteer_VolunteerSkillSheet` (`VolunteerSkillID`),
  CONSTRAINT `FK_Parent_Volunteer` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vonunteer_VolunteerSkillSheet` FOREIGN KEY (`VolunteerSkillID`) REFERENCES `VolunteerSkillSheet` (`VolunteerSkillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vonunteer`
--

LOCK TABLES `Vonunteer` WRITE;
/*!40000 ALTER TABLE `Vonunteer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vonunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaitlistForm`
--

DROP TABLE IF EXISTS `WaitlistForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaitlistForm` (
  `FormID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `Agreement` int(11) NOT NULL,
  `SubmissionDTTM` datetime NOT NULL,
  PRIMARY KEY (`FormID`),
  KEY `FK_WaitlistQuestionaire_Parent` (`ParentID`),
  CONSTRAINT `FK_WaitlistQuestionaire_Parent` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistForm`
--

LOCK TABLES `WaitlistForm` WRITE;
/*!40000 ALTER TABLE `WaitlistForm` DISABLE KEYS */;
INSERT INTO `WaitlistForm` VALUES (10,1,'mark','','bowser',1,'2012-03-12 18:53:14');
INSERT INTO `WaitlistForm` VALUES (11,1,'asf','asdf','asdf',1,'2012-03-12 19:27:47');
INSERT INTO `WaitlistForm` VALUES (12,1,'Steven','Ray','Bowser',1,'2012-03-16 14:30:14');
INSERT INTO `WaitlistForm` VALUES (13,1,'eric','lee','bowser',1,'2012-03-16 14:47:36');
INSERT INTO `WaitlistForm` VALUES (14,1,'Mark','asdfa','asdkhfasklf',1,'2012-04-12 19:20:42');
INSERT INTO `WaitlistForm` VALUES (15,1,'Steve','Ray','Bowser',1,'2012-04-14 23:19:26');
INSERT INTO `WaitlistForm` VALUES (16,1,'b','b','b',2,'2012-04-15 18:33:22');
INSERT INTO `WaitlistForm` VALUES (45,1,'gerald','ralph','bob',3,'2012-04-16 05:39:00');
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
INSERT INTO `WaitlistFormQuestion` VALUES (10,1,'yes. he can');
INSERT INTO `WaitlistFormQuestion` VALUES (10,2,'no he cant');
INSERT INTO `WaitlistFormQuestion` VALUES (10,3,'crawling around');
INSERT INTO `WaitlistFormQuestion` VALUES (10,4,'he&#39;s a gamer');
INSERT INTO `WaitlistFormQuestion` VALUES (10,5,'we speak not a word');
INSERT INTO `WaitlistFormQuestion` VALUES (10,6,'i just told you');
INSERT INTO `WaitlistFormQuestion` VALUES (10,7,'only if he decides to talk');
INSERT INTO `WaitlistFormQuestion` VALUES (10,8,'yes he can');
INSERT INTO `WaitlistFormQuestion` VALUES (10,9,'sedentary');
INSERT INTO `WaitlistFormQuestion` VALUES (10,10,'we filter feed from the air');
INSERT INTO `WaitlistFormQuestion` VALUES (10,11,'we are filter feeders');
INSERT INTO `WaitlistFormQuestion` VALUES (10,12,'we are filter feeders');
INSERT INTO `WaitlistFormQuestion` VALUES (10,13,'This answer has an apostrophe right here &#39;');
INSERT INTO `WaitlistFormQuestion` VALUES (10,14,'Can i use your bathroom independently?');
INSERT INTO `WaitlistFormQuestion` VALUES (10,15,'he cries a lot');
INSERT INTO `WaitlistFormQuestion` VALUES (10,16,'i stare at him');
INSERT INTO `WaitlistFormQuestion` VALUES (11,1,'asdf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,2,'asdf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,3,'asdf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,4,'asdf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,5,'adsf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,6,'sdf');
INSERT INTO `WaitlistFormQuestion` VALUES (11,7,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,8,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,9,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,10,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,11,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,12,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,13,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,14,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,15,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (11,16,'jkl');
INSERT INTO `WaitlistFormQuestion` VALUES (12,1,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,2,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,3,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,4,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,5,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,6,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,7,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,8,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,9,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,10,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,11,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,12,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,13,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,14,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,15,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (12,16,'ya');
INSERT INTO `WaitlistFormQuestion` VALUES (13,1,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,2,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,3,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,4,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,5,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,6,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,7,'why not');
INSERT INTO `WaitlistFormQuestion` VALUES (13,8,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,9,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,10,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,11,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,12,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,13,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,14,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,15,'why');
INSERT INTO `WaitlistFormQuestion` VALUES (13,16,'because');
INSERT INTO `WaitlistFormQuestion` VALUES (14,1,';klj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,2,'lkj;');
INSERT INTO `WaitlistFormQuestion` VALUES (14,3,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,4,'kklj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,5,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,6,'kjkj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,7,'kjjk');
INSERT INTO `WaitlistFormQuestion` VALUES (14,8,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,9,'kjj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,10,'kjkj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,11,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,12,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,13,'kjkk');
INSERT INTO `WaitlistFormQuestion` VALUES (14,14,'kjj');
INSERT INTO `WaitlistFormQuestion` VALUES (14,15,'kjk');
INSERT INTO `WaitlistFormQuestion` VALUES (14,16,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (15,1,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (15,2,'he takes them off at the same time\n');
INSERT INTO `WaitlistFormQuestion` VALUES (15,3,'drawing\n');
INSERT INTO `WaitlistFormQuestion` VALUES (15,4,'far too much');
INSERT INTO `WaitlistFormQuestion` VALUES (15,5,'yes and no');
INSERT INTO `WaitlistFormQuestion` VALUES (15,6,'hmmmm');
INSERT INTO `WaitlistFormQuestion` VALUES (15,7,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (15,8,'no');
INSERT INTO `WaitlistFormQuestion` VALUES (15,9,'he rolls');
INSERT INTO `WaitlistFormQuestion` VALUES (15,10,'none');
INSERT INTO `WaitlistFormQuestion` VALUES (15,11,'he prefers fingers');
INSERT INTO `WaitlistFormQuestion` VALUES (15,12,'sippy cup');
INSERT INTO `WaitlistFormQuestion` VALUES (15,13,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (15,14,'which');
INSERT INTO `WaitlistFormQuestion` VALUES (15,15,'microwave');
INSERT INTO `WaitlistFormQuestion` VALUES (15,16,'BRING THE HAMMER DOWN!');
INSERT INTO `WaitlistFormQuestion` VALUES (16,1,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,2,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,3,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,4,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,5,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,6,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,7,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,8,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,9,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,10,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,11,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,12,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,13,'bb');
INSERT INTO `WaitlistFormQuestion` VALUES (16,14,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,15,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (16,16,'b');
INSERT INTO `WaitlistFormQuestion` VALUES (45,1,'l');
INSERT INTO `WaitlistFormQuestion` VALUES (45,2,'kjq');
INSERT INTO `WaitlistFormQuestion` VALUES (45,3,'jqk');
INSERT INTO `WaitlistFormQuestion` VALUES (45,4,'jkj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,5,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (45,6,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (45,7,'l');
INSERT INTO `WaitlistFormQuestion` VALUES (45,8,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (45,9,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,10,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,11,'k;j');
INSERT INTO `WaitlistFormQuestion` VALUES (45,12,';kj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,13,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,14,';lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,15,';lj');
INSERT INTO `WaitlistFormQuestion` VALUES (45,16,';kj');
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
  `Enabled` bit(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`QuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistQuestion`
--

LOCK TABLES `WaitlistQuestion` WRITE;
/*!40000 ALTER TABLE `WaitlistQuestion` DISABLE KEYS */;
INSERT INTO `WaitlistQuestion` VALUES (1,'Can your child dress and undress himself?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (2,'Can your child take his socks and shoes off independently? Put them on without help?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (3,'What are your child\'s favorite pastimes? What activities does he enjoy?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (4,'How much time does your child spend with tv/dvd\'s/computers/video games on a daily basis?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (5,'Does your family speak English at home? Any other languages?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (6,'Briefly describe your child\'s communication. Single words? Two-word phrases? Sentences?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (7,'Can people outside your family understand your child?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (8,'Can your child respond to verbal direction? (For example, Go and put your coat on.)','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (9,'Briefly describe your child\'s movement. Does he primarily walk or run? Can he go up and down stairs without adult support or assistance?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (10,'In an average week, how many meals does your family eat together?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (11,'Does your child eat with utensils?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (12,'Does your child drink from a bottle, sippy-cup or an open cup/glass? Please list which.','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (13,'Does your child make eye-contact when you talk with him? With people outside your family?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (14,'Is your child using the bathroom independently? Does he wear cloth underwear, pull-ups or diapers at home? Please list which.','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (15,'Specifically, what does your child do to help himself?','','2012-03-09 22:26:50');
INSERT INTO `WaitlistQuestion` VALUES (16,'How do you respond when your child refuses to comply to direction from you?','','2012-03-09 22:26:50');
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
INSERT INTO `ci_sessions` VALUES ('6841f3d37a24896fa73148fd18eed47e','24.21.104.139','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.162 Safari/535.19',1334813947,'');
INSERT INTO `ci_sessions` VALUES ('cf4054166635651adf2f7b315afb63fa','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.162 Safari/535.19',1334816823,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:1:\"1\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"2012-02-02 01:01:01\";s:7:\"Enabled\";s:1:\"\";s:18:\"HasChangedPassword\";s:1:\"\";s:9:\"logged_in\";b:1;}');
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
  `Enabled` bit(1) NOT NULL,
  `HasChangedPassword` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com','6f7c155805e64f13b752a222bf8f6528e958ed890cc149a53f0ab01f6d5d108c','1','','',NULL,'2012-02-02 01:01:01','','');
INSERT INTO `users` VALUES (2,'Mark.Bowser','markbowser9@gmail.com','2944a295022c39d6d06e44c97cbff0e84b1bc0212dc71a680ac02e5592707e33','200','','',NULL,'0000-00-00 00:00:00','\0','\0');
INSERT INTO `users` VALUES (9,'Niddy.Lindsley','lindsleyn@gmail.com','3b787cb3c7a9b79641c8ecb3997e8287d6c5b9ca258c6839706fcde0d2056c81','100','','',NULL,'0000-00-00 00:00:00','\0','\0');
INSERT INTO `users` VALUES (10,'Justin.Field','fieldju@gmail.com','dc311902bca1696349e8555605389c35a071b0bad5e30d9222df07847d20916f','100','','',NULL,'0000-00-00 00:00:00','\0','\0');
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

-- Dump completed on 2012-04-19  3:14:01
