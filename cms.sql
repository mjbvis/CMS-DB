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
  CONSTRAINT `AMICertification_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  PRIMARY KEY (`AcademicLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicLevel`
--

LOCK TABLES `AcademicLevel` WRITE;
/*!40000 ALTER TABLE `AcademicLevel` DISABLE KEYS */;
INSERT INTO `AcademicLevel` VALUES (1,'Toddler','children 18 months to 3 years',1);
INSERT INTO `AcademicLevel` VALUES (2,'Primary','children 3 years to 6 years',1);
INSERT INTO `AcademicLevel` VALUES (3,'Elementary','children 6 years to 12 years',1);
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
  CONSTRAINT `Accident_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_Accident_Parent` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Accident_Staff` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `AdmissionsForm_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdmissionsForm`
--

LOCK TABLES `AdmissionsForm` WRITE;
/*!40000 ALTER TABLE `AdmissionsForm` DISABLE KEYS */;
INSERT INTO `AdmissionsForm` VALUES (24,'no','yes','yes','yes','no','yes','Tucan : Gilbert','smash','sam','4','Other','woot','<p>no/yes</p>');
INSERT INTO `AdmissionsForm` VALUES (25,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ',NULL,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','','','Friend','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ');
INSERT INTO `AdmissionsForm` VALUES (26,'5418290052','5418290052','5418290052','5418290052','5418290052','5418290052',NULL,'5418290052','','','Friend','5418290052','5418290052');
INSERT INTO `AdmissionsForm` VALUES (27,'j;','kjl','kj','k','klj','lkj','Albatross : Darth Maul','.,m,','','','Other','hi','mlkm');
INSERT INTO `AdmissionsForm` VALUES (28,'lkj','lkj','lk','kl','lk','kl',NULL,'lkj','lkj','5','Other','hi','lkh');
INSERT INTO `AdmissionsForm` VALUES (29,'yes','yes','yes','yes','yes','yes',NULL,'yes','','','Other','walkin','yes');
INSERT INTO `AdmissionsForm` VALUES (30,'k','k','k','k','k','k','k : k','k','k','7','Internet','','k');
INSERT INTO `AdmissionsForm` VALUES (31,'lkj','lk','lk','lkj','lkj','lkj','dog : sam','l;k','lkj','5','Other','','lkj');
INSERT INTO `AdmissionsForm` VALUES (32,'lkj','lkj','lkj','lk','lkj','lkj',NULL,'lkj','lkj','','Parent','sdf','lkj');
INSERT INTO `AdmissionsForm` VALUES (33,'lkj','lkj','lkj','klj','klj','lkj','Tucan : Oscar','kjhkj','','','Parent','hi','kljlk');
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
  KEY `FK_Alumni_AcademicLevel` (`AcademicLevelID`),
  CONSTRAINT `Alumni_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_Alumni_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `BinaryLookup`
--

DROP TABLE IF EXISTS `BinaryLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BinaryLookup` (
  `ID` int(11) NOT NULL,
  `TrueFalse` varchar(255) NOT NULL,
  `YesNo` varchar(255) NOT NULL,
  `ActiveInactive` varchar(255) NOT NULL,
  `EnabledDisabled` varchar(255) NOT NULL,
  `EnrolledPreenrolled` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BinaryLookup`
--

LOCK TABLES `BinaryLookup` WRITE;
/*!40000 ALTER TABLE `BinaryLookup` DISABLE KEYS */;
INSERT INTO `BinaryLookup` VALUES (0,'False','No','Inactive','Disabled','Pre-enrolled');
INSERT INTO `BinaryLookup` VALUES (1,'True','Yes','Active','Enabled','Enrolled');
/*!40000 ALTER TABLE `BinaryLookup` ENABLE KEYS */;
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
  PRIMARY KEY (`ClassID`),
  KEY `FK_Classroom_AcademicLevel` (`AcademicLevelID`),
  CONSTRAINT `FK_Classroom_AcademicLevel` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classroom`
--

LOCK TABLES `Classroom` WRITE;
/*!40000 ALTER TABLE `Classroom` DISABLE KEYS */;
INSERT INTO `Classroom` VALUES (1,'Toddler House',1,1);
INSERT INTO `Classroom` VALUES (2,'Bamboo',2,1);
INSERT INTO `Classroom` VALUES (3,'Maple',2,1);
INSERT INTO `Classroom` VALUES (4,'Willow',2,1);
INSERT INTO `Classroom` VALUES (5,'Ginkgo',3,1);
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
  CONSTRAINT `ClassroomAssistant_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ClassroomAssistant_ibfk_4` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `ClassroomTeacher_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ClassroomTeacher_ibfk_4` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  `DonorID` int(11) DEFAULT NULL,
  `DonationTypeID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Allocation` varchar(255) DEFAULT NULL,
  `FundingPurpose` varchar(255) DEFAULT NULL,
  `DonationDate` datetime DEFAULT NULL,
  `Comments` varchar(2047) DEFAULT NULL,
  PRIMARY KEY (`DonationID`),
  KEY `FK_Donation_DonationTypeLookup` (`DonationTypeID`),
  KEY `FK_Donation_Donor` (`DonorID`),
  CONSTRAINT `Donation_ibfk_1` FOREIGN KEY (`DonorID`) REFERENCES `Donor` (`DonorID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_DonationTypeLookup` FOREIGN KEY (`DonationTypeID`) REFERENCES `DonationTypeLookup` (`DonationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `Donor_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  `StudentID` int(11) NOT NULL,
  `ECName` varchar(255) NOT NULL,
  `ECPhone` varchar(255) NOT NULL,
  `ECRelationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  KEY `FK_EmergencyContact_Student` (`StudentID`),
  CONSTRAINT `FK_EmergencyContact_Student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyContact`
--

LOCK TABLES `EmergencyContact` WRITE;
/*!40000 ALTER TABLE `EmergencyContact` DISABLE KEYS */;
INSERT INTO `EmergencyContact` VALUES (130,24,'Jack Bowser','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (131,24,'Jerry Bowser','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (132,24,'Janelle Bowser','555-555-5555','Aunt');
INSERT INTO `EmergencyContact` VALUES (133,25,'Larry Harry','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (134,25,'Harry Jim','555-555-5555','Uncle');
INSERT INTO `EmergencyContact` VALUES (135,25,'Mary Jim','555-555-5555','Aunt');
INSERT INTO `EmergencyContact` VALUES (136,26,'Catlyn Stark','5418290052','Mother');
INSERT INTO `EmergencyContact` VALUES (137,26,'John Snow','5418290052','Bastard Brother');
INSERT INTO `EmergencyContact` VALUES (138,26,'Ned Stark','5418290052','Dead Father');
INSERT INTO `EmergencyContact` VALUES (139,27,'Thomas kjjk','555-555-5555','friend');
INSERT INTO `EmergencyContact` VALUES (140,27,'Lorie jkkj','555-555-5555','sister');
INSERT INTO `EmergencyContact` VALUES (141,27,'Hello World','555-555-5555','idea');
INSERT INTO `EmergencyContact` VALUES (142,28,'asdf','555-555-5555','asdf');
INSERT INTO `EmergencyContact` VALUES (143,28,'asd','555-555-5555','ads');
INSERT INTO `EmergencyContact` VALUES (144,28,'asdf','555-555-5555','a;lkjdsf');
INSERT INTO `EmergencyContact` VALUES (148,29,'Brian Lindsley','541-737-2237','father');
INSERT INTO `EmergencyContact` VALUES (149,29,'Niddy Lindsley','541-754-1189','mother');
INSERT INTO `EmergencyContact` VALUES (150,29,'Marilyn Lindsley','541-745-6810','Grandma');
INSERT INTO `EmergencyContact` VALUES (151,30,'Bob Uncle','541-737-2237','Uncle');
INSERT INTO `EmergencyContact` VALUES (152,30,'Sally Uncle','541-754-1189','Aunt');
INSERT INTO `EmergencyContact` VALUES (153,30,'Tamara Uncle','541-745-6810','Sister');
INSERT INTO `EmergencyContact` VALUES (154,31,'Dilbert','555-555-5555','social construct');
INSERT INTO `EmergencyContact` VALUES (155,31,'Hilbert','555-555-5555','dad');
INSERT INTO `EmergencyContact` VALUES (156,31,'Wilber','555-555-5555','almost a rhyme');
INSERT INTO `EmergencyContact` VALUES (157,32,'kj','555-555-5555','lkj');
INSERT INTO `EmergencyContact` VALUES (158,32,'klj','555-555-5555','lkj');
INSERT INTO `EmergencyContact` VALUES (159,32,'sdf','555-555-5555','lk');
INSERT INTO `EmergencyContact` VALUES (160,33,'lkj','555-555-5555','asdf');
INSERT INTO `EmergencyContact` VALUES (161,33,'asdf','555-555-5555','asdf');
INSERT INTO `EmergencyContact` VALUES (162,33,'aasd','555-555-5555','asdf');
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
  CONSTRAINT `GroupMenuItem_ibfk_3` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `GroupMenuItem_ibfk_4` FOREIGN KEY (`MenuItemID`) REFERENCES `MenuItem` (`MenuItemID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupMenuItem`
--

LOCK TABLES `GroupMenuItem` WRITE;
/*!40000 ALTER TABLE `GroupMenuItem` DISABLE KEYS */;
INSERT INTO `GroupMenuItem` VALUES (1,1);
INSERT INTO `GroupMenuItem` VALUES (100,1);
INSERT INTO `GroupMenuItem` VALUES (1,2);
INSERT INTO `GroupMenuItem` VALUES (100,2);
INSERT INTO `GroupMenuItem` VALUES (100,3);
INSERT INTO `GroupMenuItem` VALUES (100,4);
INSERT INTO `GroupMenuItem` VALUES (1,5);
INSERT INTO `GroupMenuItem` VALUES (1,6);
INSERT INTO `GroupMenuItem` VALUES (1,7);
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
  CONSTRAINT `Incident_ibfk_3` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Incident_ibfk_4` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (1,'Home','login',1);
INSERT INTO `MenuItem` VALUES (2,'Logout','logout',100);
INSERT INTO `MenuItem` VALUES (3,'Admissions','',2);
INSERT INTO `MenuItem` VALUES (4,'My Records','login',4);
INSERT INTO `MenuItem` VALUES (5,'Admissions','',5);
INSERT INTO `MenuItem` VALUES (6,'Record Managment','admin',6);
INSERT INTO `MenuItem` VALUES (7,'Dev Tools','',7);
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
INSERT INTO `Notifications` VALUES (8,'Parent has completed registration for : ','record_management/manageStudents/edit/');
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
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
  CONSTRAINT `Parent_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Parent_ibfk_2` FOREIGN KEY (`SkillSheetID`) REFERENCES `VolunteerSkillSheet` (`SkillSheetID`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
INSERT INTO `Parent` VALUES (51,74,'Mark',NULL,'Bowser','markbowser9@gmail.com',NULL,NULL,0,NULL,'2012-05-31 21:47:01');
INSERT INTO `Parent` VALUES (52,75,'Mark',NULL,'Bowser','markbowser9@hotmail.com',NULL,NULL,0,NULL,'2012-05-31 22:22:21');
INSERT INTO `Parent` VALUES (53,76,'Justin',NULL,'Field','fieldju@gmail.com',NULL,NULL,0,NULL,'2012-06-01 01:24:42');
INSERT INTO `Parent` VALUES (54,77,'Whosi ',NULL,'Whazit','info@corvallismontessori.org',NULL,NULL,0,NULL,'2012-06-01 12:20:49');
INSERT INTO `Parent` VALUES (55,78,'mark',NULL,'bowser','asdlkfjasldkfjalsdfj@fgasdf.com',NULL,NULL,0,NULL,'2012-06-03 00:48:46');
INSERT INTO `Parent` VALUES (56,79,'mark',NULL,'bowser','kaljsdflkajdflka@asdf.com',NULL,NULL,0,NULL,'2012-06-04 12:02:15');
INSERT INTO `Parent` VALUES (57,80,'niddy',NULL,'lindsley','lindsleyn@gmail.com',NULL,NULL,0,NULL,'2012-06-08 10:19:14');
INSERT INTO `Parent` VALUES (58,81,'Jason',NULL,'Prothero','asdfasdfasdfasdf@asmdf.com',NULL,NULL,0,NULL,'2012-06-08 11:34:57');
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
  CONSTRAINT `ParentContactInfo_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  `AcademicYear` int(11) NOT NULL,
  `AcademicLevelID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Days` varchar(255) NOT NULL,
  `StartTime` varchar(255) NOT NULL,
  `EndTime` varchar(255) NOT NULL,
  `Tuition` int(11) NOT NULL,
  `Enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ProgramID`),
  KEY `FK_Program_AcademicLevel` (`AcademicLevelID`),
  KEY `FK_Program_SchoolInformation` (`AcademicYear`),
  CONSTRAINT `Program_ibfk_1` FOREIGN KEY (`AcademicYear`) REFERENCES `SchoolInformation` (`AcademicYear`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Program_ibfk_2` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program`
--

LOCK TABLES `Program` WRITE;
/*!40000 ALTER TABLE `Program` DISABLE KEYS */;
INSERT INTO `Program` VALUES (1,2012,2,'Primary Mornings','3 day (Monday - Wednesday)','8:30 AM','11:30 AM',5250,0);
INSERT INTO `Program` VALUES (2,2012,2,'Primary Mornings','5 day (Monday - Friday)','8:30 AM','11:30 AM',5250,1);
INSERT INTO `Program` VALUES (3,2012,2,'Primary Full-Day','3 day (Monday - Wednesday)','8:30 AM','2:30 PM',7450,0);
INSERT INTO `Program` VALUES (4,2012,2,'Primary Full-Day','5 day (Monday - Friday)','8:30 AM','3:00 PM',7450,1);
INSERT INTO `Program` VALUES (5,2012,3,'Elementary Full-Day','5 day (Monday - Friday)','8:30 AM','3:00 PM',7950,1);
INSERT INTO `Program` VALUES (6,2012,1,'Toddler Full-Day','5 day (Monday - Friday)','8:30 AM','3:00 PM',3250,1);
INSERT INTO `Program` VALUES (7,2013,1,'Toddler Full-Day','5 day (Monday - Friday)','8:30 AM','3:00 PM',3500,1);
/*!40000 ALTER TABLE `Program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProspectInterview`
--

DROP TABLE IF EXISTS `ProspectInterview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProspectInterview` (
  `ProspectID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentNames` varchar(255) NOT NULL,
  `ChildrenNamesAges` varchar(255) NOT NULL,
  `FirstContactedDTTM` date NOT NULL,
  `VisitDTTM` date NOT NULL,
  `InterviewDTTM` date NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MontessoriImpressions` varchar(255) NOT NULL,
  `InterviewImpressions` varchar(255) NOT NULL,
  `LevelOfInterest` varchar(255) NOT NULL,
  `LevelOfUnderstanding` varchar(255) NOT NULL,
  `WillingnessToLearn` varchar(255) NOT NULL,
  `IsLearningIndependently` int(1) NOT NULL,
  `IsLearningAtOwnPace` int(1) NOT NULL,
  `IsHandsOnLearner` int(1) NOT NULL,
  `IsMixedAges` int(1) NOT NULL,
  `WebSearchRef` int(1) NOT NULL,
  `CMSFamilyRef` int(1) NOT NULL,
  `FriendsRef` int(1) NOT NULL,
  `AdRef` int(1) NOT NULL,
  `AdRefNote` varchar(255) DEFAULT NULL,
  `OtherRef` int(1) NOT NULL,
  `OtherRefNote` varchar(255) DEFAULT NULL,
  `NewCityState` varchar(255) DEFAULT NULL,
  `NewSchool` varchar(255) DEFAULT NULL,
  `ObservationDTTM` date DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `AttendedObservation` int(1) DEFAULT NULL,
  `OnTimeToObservation` int(1) DEFAULT NULL,
  `AppReceivedDTTM` date DEFAULT NULL,
  `FeeReceivedDTTM` date DEFAULT NULL,
  PRIMARY KEY (`ProspectID`),
  KEY `FK_ProspectInterview_Classroom` (`ClassID`),
  CONSTRAINT `FK_ProspectInterview_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProspectInterview`
--

LOCK TABLES `ProspectInterview` WRITE;
/*!40000 ALTER TABLE `ProspectInterview` DISABLE KEYS */;
INSERT INTO `ProspectInterview` VALUES (10,'<ol>\n<li>Jusitn Field</li>\n<li>Tamara Field</li>\n</ol>','<p><span style=\"font-size: medium;\">Bob Field</span></p>\n<p><span style=\"font-size: medium;\">Sarah Field</span></p>','2012-05-26','2012-05-01','2012-05-26','541-829-0052','fieldju@gmail.com','<p>Ugily</p>','<p>Lame</p>','Low','Little','Low',1,0,0,0,0,1,0,0,NULL,0,NULL,NULL,NULL,'2012-05-26',2,1,1,'2012-05-26','2012-05-27');
INSERT INTO `ProspectInterview` VALUES (14,'1. Mark Bowser\n2. ????','1. ????','1969-12-31','1969-12-31','2012-12-31','','','','','','','',0,0,0,0,0,0,0,0,'',0,'','','','1969-12-31',NULL,0,0,'1969-12-31','1969-12-31');
/*!40000 ALTER TABLE `ProspectInterview` ENABLE KEYS */;
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
  `CurrentYear` int(1) NOT NULL,
  PRIMARY KEY (`AcademicYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolInformation`
--

LOCK TABLES `SchoolInformation` WRITE;
/*!40000 ALTER TABLE `SchoolInformation` DISABLE KEYS */;
INSERT INTO `SchoolInformation` VALUES (2012,'2011-08-19 00:00:00',20,10,1);
INSERT INTO `SchoolInformation` VALUES (2013,'2012-08-15 00:00:00',30,12,0);
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
  `UserID` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Enabled` int(1) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `FK_Staff_StaffTypeLookup` (`StaffTypeID`),
  KEY `FK_Staff_UserTable` (`UserID`),
  CONSTRAINT `FK_Staff_StaffTypeLookup` FOREIGN KEY (`StaffTypeID`) REFERENCES `StaffTypeLookup` (`StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `StaffEduBackground_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  `IsEnrolled` int(1) NOT NULL DEFAULT '0',
  `QuestionaireID` int(11) DEFAULT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Student_Classroom` (`ClassID`),
  KEY `FK_Student_WaitlistQuestionaire` (`QuestionaireID`),
  KEY `FK_Student_Program` (`ProgramID`),
  KEY `FK_Student_users` (`UserID`),
  CONSTRAINT `FK_Student_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_Program` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_WaitlistForm` FOREIGN KEY (`QuestionaireID`) REFERENCES `WaitlistForm` (`FormID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `Student_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (24,74,2,2,'Walter',NULL,'Troglodyte','M','111 NW 26th St Apt 1','Lebanon, OR','2002-03-02',NULL,'555-555-5555',0,22,'2012-06-08 18:08:17');
INSERT INTO `Student` VALUES (25,75,5,5,'Jim','Jim','Jim','M','184 S 7th St, Lebanon, OR, 97355','Corvallis, OR','2012-07-28',NULL,'541-259-4620',1,23,'2012-06-01 18:46:46');
INSERT INTO `Student` VALUES (26,76,NULL,4,'Rob',NULL,'Stark','M','7400 SW Barnes Road #1162','Winterfell, Seven Kingdoms','1986-05-26',NULL,'5418290052',0,25,'2012-06-01 01:51:09');
INSERT INTO `Student` VALUES (27,75,NULL,5,'asdf','lkj;','kjjk','F','184 S 7th St, Lebanon, OR, 97355','Lebanon, OR','2002-03-02',NULL,'555-555-5555',0,24,'2012-06-01 10:02:59');
INSERT INTO `Student` VALUES (28,75,NULL,2,'Mr','','Man','M','184 S 7th St, Lebanon, OR, 97355','Lebanon, OR','2002-03-02',NULL,'555-555-5555',0,26,'2012-06-01 10:07:17');
INSERT INTO `Student` VALUES (29,76,NULL,6,'Fa','N','Lindsley','F','3003 NW Morning Glory Drive','corvallis, or','2007-07-15',NULL,'5410754-1189',0,28,'2012-06-01 11:58:05');
INSERT INTO `Student` VALUES (30,77,3,6,'Grandma','Sister','Uncle','M','2730 Greeley','Corvallis, OR','2012-01-02',NULL,'541-753-2513',1,29,'2012-06-01 12:44:16');
INSERT INTO `Student` VALUES (31,75,NULL,5,'Drew','David Leon','Conley','M','184 S 7th St, Lebanon, OR, 97355','Lebanon, OR','2001-01-01',NULL,'555-555-5555',0,27,'2012-06-01 16:10:33');
INSERT INTO `Student` VALUES (32,75,NULL,4,'Gilbert','','VonGilbert','M','lk;j','Lebanon, OR','2002-03-02',NULL,'555-555-5555',0,30,'2012-06-01 17:52:50');
INSERT INTO `Student` VALUES (33,79,2,6,'bob','bob','bob','M','111 NW 26th St Apt 1','Lebanon, OR','2002-03-02',NULL,'555-555-5555',1,34,'2012-06-04 12:06:58');
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
  CONSTRAINT `StudentEduBackground_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  CONSTRAINT `StudentIncident_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `StudentIncident_ibfk_2` FOREIGN KEY (`IncidentID`) REFERENCES `Incident` (`IncidentID`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `PreferredHospital` varchar(255) DEFAULT NULL,
  `HospitalPhone` varchar(255) DEFAULT NULL,
  `Physician` varchar(255) DEFAULT NULL,
  `PhysicianPhone` varchar(255) DEFAULT NULL,
  `Dentist` varchar(255) DEFAULT NULL,
  `DentistPhone` varchar(255) DEFAULT NULL,
  `MedicalConditions` varchar(255) DEFAULT NULL,
  `Allergies` varchar(255) DEFAULT NULL,
  `InsuranceCompany` varchar(255) DEFAULT NULL,
  `CertificateNumber` varchar(255) DEFAULT NULL,
  `Employer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `StudentMedicalInformation_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentMedicalInformation`
--

LOCK TABLES `StudentMedicalInformation` WRITE;
/*!40000 ALTER TABLE `StudentMedicalInformation` DISABLE KEYS */;
INSERT INTO `StudentMedicalInformation` VALUES (24,'asdfafd','555-555-5555','man','555-555-5555','blimp','555-555-5555',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `StudentMedicalInformation` VALUES (25,'Corvallis','555-555-5555','Bob Jones','555-555-5555','Yoda','555-555-5555','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ','Some place insurance land','987987987ds98a6s89dfa9d','Entek Int Mfg');
INSERT INTO `StudentMedicalInformation` VALUES (27,'','','','','','','','','','','');
INSERT INTO `StudentMedicalInformation` VALUES (28,'','555-555-5555','','','','','','','','','');
INSERT INTO `StudentMedicalInformation` VALUES (29,'','','','','','','','','','','');
INSERT INTO `StudentMedicalInformation` VALUES (30,'s','555-555-5555','555-555-5555','555-555-5555','s','555-555-5555','s','j','d','d','d');
INSERT INTO `StudentMedicalInformation` VALUES (33,'lkjaslkdf','555-555-5555','asdfa','555-555-5555','asdfasdf','555-555-5555','','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubItem`
--

LOCK TABLES `SubItem` WRITE;
/*!40000 ALTER TABLE `SubItem` DISABLE KEYS */;
INSERT INTO `SubItem` VALUES (1,5,'Create New Parent Account','admin/addParentUserAccount',1);
INSERT INTO `SubItem` VALUES (2,5,'Interview & Observation','admin/interviewObservationForm',2);
INSERT INTO `SubItem` VALUES (3,3,'Step 1: Waitlist Student','admissions/waitlistQuestionaire',1);
INSERT INTO `SubItem` VALUES (4,3,'Step 2: Wait for Available Spot','admissions/stepTwoInfo',2);
INSERT INTO `SubItem` VALUES (18,7,'Manage Sub-Menu Items','record_management/manageSubMenuItems/',5);
INSERT INTO `SubItem` VALUES (19,5,'Waitlist Managment','admin/waitlist',1);
INSERT INTO `SubItem` VALUES (20,3,'Step 3: Registration Forms','admissions/registerStudentSelector',3);
INSERT INTO `SubItem` VALUES (22,6,'User Accounts','record_management/manageAccounts',1);
INSERT INTO `SubItem` VALUES (23,6,'Students','record_management/manageStudents',1);
INSERT INTO `SubItem` VALUES (24,6,'Programs','record_management/managePrograms',1);
INSERT INTO `SubItem` VALUES (25,6,'Volunteer Logs','record_management/manageVolunteerLogs',1);
INSERT INTO `SubItem` VALUES (26,6,'Prospects','record_management/manageProspects',1);
INSERT INTO `SubItem` VALUES (27,4,'My Students','parents/manageMyStudents',1);
INSERT INTO `SubItem` VALUES (28,3,'Step 4: Medical Forms','admissions/studentMedicalSelector',4);
INSERT INTO `SubItem` VALUES (29,3,'Step 5: Admin Approval','admissions/adminApproval',6);
INSERT INTO `SubItem` VALUES (30,4,'Volunteer Activity','parents/manageMyVolunteerActivity',2);
INSERT INTO `SubItem` VALUES (32,6,'Classrooms','record_management/manageClasses',1);
INSERT INTO `SubItem` VALUES (33,7,'Manage Parent Menu Items','record_management/manageParentMenuItems',5);
INSERT INTO `SubItem` VALUES (34,7,'Group Menu Items','record_management/manageGroupMenuItems',3);
INSERT INTO `SubItem` VALUES (35,6,'Emergency Contacts','record_management/manageEmergencyContacts',1000);
/*!40000 ALTER TABLE `SubItem` ENABLE KEYS */;
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
  CONSTRAINT `UserNotifications_ibfk_3` FOREIGN KEY (`NotificationID`) REFERENCES `Notifications` (`NotificationID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `UserNotifications_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserNotifications`
--

LOCK TABLES `UserNotifications` WRITE;
/*!40000 ALTER TABLE `UserNotifications` DISABLE KEYS */;
INSERT INTO `UserNotifications` VALUES (8,1,'Jim Jim','25');
INSERT INTO `UserNotifications` VALUES (8,1,'asdf kjjk','27');
INSERT INTO `UserNotifications` VALUES (8,1,'Mr Man','28');
INSERT INTO `UserNotifications` VALUES (8,1,'Fa Lindsley','29');
INSERT INTO `UserNotifications` VALUES (8,1,'Grandma Uncle','30');
INSERT INTO `UserNotifications` VALUES (8,1,'bob bob','33');
INSERT INTO `UserNotifications` VALUES (6,75,'Finrod Felegund','31');
INSERT INTO `UserNotifications` VALUES (6,75,'h kj','32');
INSERT INTO `UserNotifications` VALUES (7,75,'Drew Conley','31');
INSERT INTO `UserNotifications` VALUES (7,75,'Gilbert VonGilbert','32');
INSERT INTO `UserNotifications` VALUES (7,76,'Rob Stark','26');
INSERT INTO `UserNotifications` VALUES (6,78,'Micah DeVyldere','33');
INSERT INTO `UserNotifications` VALUES (1,80,'','');
INSERT INTO `UserNotifications` VALUES (1,81,'','');
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
  `UDTTM` date DEFAULT NULL,
  `VolunteeredDTTM` date DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `FK_VolunteerLogEntry_user` (`UserID`),
  CONSTRAINT `VolunteerLogEntry_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerLogEntry`
--

LOCK TABLES `VolunteerLogEntry` WRITE;
/*!40000 ALTER TABLE `VolunteerLogEntry` DISABLE KEYS */;
INSERT INTO `VolunteerLogEntry` VALUES (63,74,8,'I logged some hours! and updated this again','2012-06-01','2012-05-30');
INSERT INTO `VolunteerLogEntry` VALUES (74,76,4,'singing','2012-06-01','2012-06-04');
INSERT INTO `VolunteerLogEntry` VALUES (75,75,7,'logged it','2012-06-01','2012-06-12');
INSERT INTO `VolunteerLogEntry` VALUES (76,75,8,'test log modified','2012-06-01','2012-06-13');
INSERT INTO `VolunteerLogEntry` VALUES (77,80,2,'Listening to Bamboo\'s children read','2012-06-08','2012-06-07');
INSERT INTO `VolunteerLogEntry` VALUES (78,80,1,'Listening to Willow\'s children read','2012-06-08','2012-06-05');
INSERT INTO `VolunteerLogEntry` VALUES (79,80,1.5,'Listening to Bamboo\'s Children read','2012-06-08','2012-05-31');
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
  CONSTRAINT `WaitlistForm_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistForm`
--

LOCK TABLES `WaitlistForm` WRITE;
/*!40000 ALTER TABLE `WaitlistForm` DISABLE KEYS */;
INSERT INTO `WaitlistForm` VALUES (22,6,74,'Walter','','Troglodyte',3,0,0,'2012-05-31 21:47:56');
INSERT INTO `WaitlistForm` VALUES (23,2,75,'Jim','Jim','Jim',3,0,0,'2012-05-31 22:24:49');
INSERT INTO `WaitlistForm` VALUES (24,5,75,'asdf','lkj;','kjjk',2,0,0,'2012-06-01 00:19:30');
INSERT INTO `WaitlistForm` VALUES (25,4,76,'Rob','','Stark',1,1,0,'2012-06-01 01:29:59');
INSERT INTO `WaitlistForm` VALUES (26,2,75,'Mr','','Man',1,0,0,'2012-06-01 10:05:22');
INSERT INTO `WaitlistForm` VALUES (27,5,75,'Drew','David Leon','Conley',1,1,0,'2012-06-01 10:10:23');
INSERT INTO `WaitlistForm` VALUES (28,6,76,'Fa','N','Lindsley',1,0,0,'2012-06-01 11:53:06');
INSERT INTO `WaitlistForm` VALUES (29,6,77,'Grandma','Sister','Uncle',1,0,0,'2012-06-01 12:27:14');
INSERT INTO `WaitlistForm` VALUES (30,4,75,'Gilbert','','VonGilbert',1,1,0,'2012-06-01 16:08:00');
INSERT INTO `WaitlistForm` VALUES (31,6,75,'Finrod','','Felegund',3,1,0,'2012-06-01 16:15:08');
INSERT INTO `WaitlistForm` VALUES (32,2,75,'h','kj','kj',2,1,0,'2012-06-01 17:51:42');
INSERT INTO `WaitlistForm` VALUES (33,5,78,'Micah','Anthony','DeVyldere',2,1,0,'2012-06-03 00:53:35');
INSERT INTO `WaitlistForm` VALUES (34,6,79,'bob','bob','bob',1,0,0,'2012-06-04 12:03:31');
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
  CONSTRAINT `WaitlistFormQuestion_ibfk_3` FOREIGN KEY (`FormID`) REFERENCES `WaitlistForm` (`FormID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `WaitlistFormQuestion_ibfk_4` FOREIGN KEY (`QuestionID`) REFERENCES `WaitlistQuestion` (`QuestionID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaitlistFormQuestion`
--

LOCK TABLES `WaitlistFormQuestion` WRITE;
/*!40000 ALTER TABLE `WaitlistFormQuestion` DISABLE KEYS */;
INSERT INTO `WaitlistFormQuestion` VALUES (22,1,'h;');
INSERT INTO `WaitlistFormQuestion` VALUES (22,2,'l;k');
INSERT INTO `WaitlistFormQuestion` VALUES (22,3,'lkj;');
INSERT INTO `WaitlistFormQuestion` VALUES (22,4,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,6,'lkj;');
INSERT INTO `WaitlistFormQuestion` VALUES (22,7,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,8,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (22,9,'l;kj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,12,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (22,15,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (22,16,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (23,1,'l;kj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,3,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (23,4,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,7,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (23,8,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,9,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,10,'kljlk');
INSERT INTO `WaitlistFormQuestion` VALUES (23,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,12,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,15,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (23,16,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (24,1,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,3,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (24,4,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (24,5,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (24,6,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,7,'lkk');
INSERT INTO `WaitlistFormQuestion` VALUES (24,8,'ljklj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,9,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (24,10,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (24,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,12,'kjllk');
INSERT INTO `WaitlistFormQuestion` VALUES (24,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (24,14,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (24,15,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (24,16,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (25,1,'Yes, he is the lord of Winterfell and shall be called Lord Stark.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,2,'Yes, he is the lord of Winterfell and shall be called Lord Stark.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,3,'Slaying Lanester&#39;s with his dire wolf.\nSaying &quot;winter is coming&quot;.\nBreaking marriage packs.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,4,'None, he is too busy waging war as he is the king in the north and will take vengeance for his fathers death.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,5,'Of course the lord of the north speaks English.\nHe also speaks High Valerian.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,6,'as the lord of the north speaks English.\nHe also speaks High Valerian.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,7,'The lord of the north speaks English.\nHe also speaks High Valerian.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,8,'The lord of the north speaks English.\nHe also speaks High Valerian.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,9,'He rolls with his dire wolf.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,10,'None, too busy waging war.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,11,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,12,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,13,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,14,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,15,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (25,16,'The lord of the north is fed by his squire.');
INSERT INTO `WaitlistFormQuestion` VALUES (26,1,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,3,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,4,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,7,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,8,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,9,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,10,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,11,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,12,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (26,15,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (26,16,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,1,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,3,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,4,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,5,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (27,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,7,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,8,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,9,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,10,'kl');
INSERT INTO `WaitlistFormQuestion` VALUES (27,11,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,12,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (27,13,'lkjlk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,14,'jlk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,15,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (27,16,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (28,1,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,2,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,3,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,4,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,5,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,6,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,7,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,8,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,9,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,10,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,11,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,12,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,13,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,14,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,15,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (28,16,'yes');
INSERT INTO `WaitlistFormQuestion` VALUES (29,1,'d');
INSERT INTO `WaitlistFormQuestion` VALUES (29,2,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,3,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,4,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,5,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,6,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,7,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,8,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,9,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,10,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,11,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,12,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,13,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,14,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,15,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (29,16,'k');
INSERT INTO `WaitlistFormQuestion` VALUES (30,1,';lkh');
INSERT INTO `WaitlistFormQuestion` VALUES (30,2,'l;jk');
INSERT INTO `WaitlistFormQuestion` VALUES (30,3,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,4,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,7,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,8,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (30,9,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,11,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,12,'klk');
INSERT INTO `WaitlistFormQuestion` VALUES (30,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,15,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (30,16,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,1,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,2,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,3,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,4,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (31,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,6,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (31,7,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,8,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (31,9,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,10,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (31,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,12,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (31,13,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,14,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,15,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (31,16,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,1,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,2,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (32,3,'m');
INSERT INTO `WaitlistFormQuestion` VALUES (32,4,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,5,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,6,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (32,7,'kj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,8,'jk');
INSERT INTO `WaitlistFormQuestion` VALUES (32,9,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,10,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,11,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,12,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,13,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,14,'jh');
INSERT INTO `WaitlistFormQuestion` VALUES (32,15,'jhj');
INSERT INTO `WaitlistFormQuestion` VALUES (32,16,'hjh');
INSERT INTO `WaitlistFormQuestion` VALUES (33,1,'if he choses');
INSERT INTO `WaitlistFormQuestion` VALUES (33,2,'he wears no socks');
INSERT INTO `WaitlistFormQuestion` VALUES (33,3,'programming');
INSERT INTO `WaitlistFormQuestion` VALUES (33,4,'Am I my brothers keeper?');
INSERT INTO `WaitlistFormQuestion` VALUES (33,5,'No');
INSERT INTO `WaitlistFormQuestion` VALUES (33,6,'grunts');
INSERT INTO `WaitlistFormQuestion` VALUES (33,7,';laskdjfhklh');
INSERT INTO `WaitlistFormQuestion` VALUES (33,8,';kl');
INSERT INTO `WaitlistFormQuestion` VALUES (33,9,'hlk;');
INSERT INTO `WaitlistFormQuestion` VALUES (33,10,'hkl');
INSERT INTO `WaitlistFormQuestion` VALUES (33,11,'lhk');
INSERT INTO `WaitlistFormQuestion` VALUES (33,12,'khkhl');
INSERT INTO `WaitlistFormQuestion` VALUES (33,13,'khl');
INSERT INTO `WaitlistFormQuestion` VALUES (33,14,'lkhhk');
INSERT INTO `WaitlistFormQuestion` VALUES (33,15,'kh');
INSERT INTO `WaitlistFormQuestion` VALUES (33,16,'lkh');
INSERT INTO `WaitlistFormQuestion` VALUES (34,1,'kjl');
INSERT INTO `WaitlistFormQuestion` VALUES (34,2,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (34,3,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,4,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,5,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,6,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,7,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,8,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,9,'klj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,10,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,11,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,12,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,13,'lk');
INSERT INTO `WaitlistFormQuestion` VALUES (34,14,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,15,'lkj');
INSERT INTO `WaitlistFormQuestion` VALUES (34,16,'lkj');
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
INSERT INTO `ci_sessions` VALUES ('31b275972e91590d9813d3c3026bed66','128.193.8.96','Mozilla/5.0 (X11; Linux x86_64; rv:13.0) Gecko/20100101 Firefox/13.0',1339170486,'');
INSERT INTO `ci_sessions` VALUES ('72f126ca4b6530458cf94832947a65e6','24.21.104.139','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5',1339181857,'');
INSERT INTO `ci_sessions` VALUES ('7c250baa841ca6ff25673c1a3cd7c213','180.76.6.20','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)',1339233296,'');
INSERT INTO `ci_sessions` VALUES ('9d0a9c24f22c96433ab33b21a245de11','128.193.8.40','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5',1339204381,'');
INSERT INTO `ci_sessions` VALUES ('b652c51555e937457b9ae28d5884ce4f','24.21.104.139','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5',1339269230,'');
INSERT INTO `ci_sessions` VALUES ('c7f51bc048740d82b7a3304007a1136d','24.20.226.169','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5',1339176194,'');
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
INSERT INTO `groups` VALUES (1,'Admin','No restrictions. Cannot be re-routed by alerts.');
INSERT INTO `groups` VALUES (100,'Parent',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com','6f7c155805e64f13b752a222bf8f6528e958ed890cc149a53f0ab01f6d5d108c','1','','','2012-06-09 12:13:20','2012-02-02 01:01:01',1,1);
INSERT INTO `users` VALUES (74,'mark.bowser','markbowser9@gmail.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-06-09 12:13:31','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (75,'mark.bowser.2','markbowser9@hotmail.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-06-08 11:05:49','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (76,'justin.field','fieldju@gmail.com','1ab9e422fac04df35066e6491d39b745550ae4a65a9ac9f81a5504682a25b71a','100','','','2012-06-06 12:14:30','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (77,'whosi .whazit','info@corvallismontessori.org','23856a3c626bdbc25ea5b126e54329c765691096ada36dfeb644998eacbeee19','100','','','2012-06-01 12:22:24','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (78,'mark.bowser.3','asdlkfjasldkfjalsdfj@fgasdf.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-06-03 00:54:24','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (79,'mark.bowser.4','kaljsdflkajdflka@asdf.com','9c9265dbcc979d004a7752868d103663255eb8333613ed627189a109ab7d01c1','100','','','2012-06-04 12:04:23','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (80,'niddy.lindsley','lindsleyn@gmail.com','a02e171378affd5d0da25096a7e7004277e2476492a2f97012ae87328b59963e','100','','','2012-06-08 10:19:36','0000-00-00 00:00:00',1,1);
INSERT INTO `users` VALUES (81,'jason.prothero','asdfasdfasdfasdf@asmdf.com','aa13c23c30a27d54241bce5fa44f95977128b00886d0205b73fc9725647e34ee','100','','',NULL,'0000-00-00 00:00:00',1,0);
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

-- Dump completed on 2012-06-10  3:14:01
