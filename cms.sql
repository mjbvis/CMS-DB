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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcademicLevel`
--

LOCK TABLES `AcademicLevel` WRITE;
/*!40000 ALTER TABLE `AcademicLevel` DISABLE KEYS */;
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
  KEY `FK_Accident_Parent1` (`AckParentID`),
  KEY `FK_Accident_Staff1` (`AckAdminID`),
  CONSTRAINT `FK_Accident_Parent1` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Accident_Staff1` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
INSERT INTO `Alerts` VALUES (1,'Change password','2012-02-05 18:12:48');
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
  `CompletedLevel` bit(1) DEFAULT NULL,
  `RecentSchool` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `Comments` varchar(2047) DEFAULT NULL,
  `IsDonor` bit(1) DEFAULT NULL,
  `DonorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Alumni_Student1` (`StudentID`),
  KEY `FK_Alumni_AcademicLevel1` (`AcademicLevelID`),
  CONSTRAINT `FK_Alumni_AcademicLevel1` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Alumni_Student1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `AcademicLevel` int(11) NOT NULL,
  `PrimaryStaffID` int(11) NOT NULL,
  `PrimaryStaffTypeID` int(11) NOT NULL,
  `SecondaryStaffID` int(11) DEFAULT NULL,
  `SecondaryStaffTypeID` int(11) DEFAULT NULL,
  `UDTTM` datetime NOT NULL,
  `CreationDTTM` datetime NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `FK_Classroom_Staff1` (`PrimaryStaffID`,`PrimaryStaffTypeID`),
  KEY `FK_Classroom_Staff2` (`SecondaryStaffID`,`SecondaryStaffTypeID`),
  KEY `FK_Classroom_StaffTypeLookUp1` (`PrimaryStaffTypeID`),
  KEY `FK_Classroom_StaffTypeLookUp2` (`SecondaryStaffTypeID`),
  CONSTRAINT `FK_Classroom_Staff1` FOREIGN KEY (`PrimaryStaffID`, `PrimaryStaffTypeID`) REFERENCES `Staff` (`StaffID`, `StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Classroom_Staff2` FOREIGN KEY (`SecondaryStaffID`, `SecondaryStaffTypeID`) REFERENCES `Staff` (`StaffID`, `StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Classroom_StaffTypeLookUp1` FOREIGN KEY (`PrimaryStaffTypeID`) REFERENCES `StaffTypeLookUp` (`StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Classroom_StaffTypeLookUp2` FOREIGN KEY (`SecondaryStaffTypeID`) REFERENCES `StaffTypeLookUp` (`StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `FK_Donation_DonationTypeLookup1` (`DonationTypeID`),
  KEY `FK_Donation_Donor1` (`DonorID`),
  KEY `FK_Donation_Event1` (`EventID`),
  CONSTRAINT `FK_Donation_DonationTypeLookup1` FOREIGN KEY (`DonationTypeID`) REFERENCES `DonationTypeLookup` (`DonationTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_Donor1` FOREIGN KEY (`DonorID`) REFERENCES `Donor` (`DonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Donation_Event1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `DonorID` int(11) NOT NULL,
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
  KEY `FK_Donor_UserTable1` (`UserID`),
  CONSTRAINT `FK_Donor_UserTable1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `ECRelationship` varchar(255) NOT NULL,
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
  KEY `FK_Incident_Parent1` (`AckParentID`),
  KEY `FK_Incident_Staff1` (`AckAdminID`),
  CONSTRAINT `FK_Incident_Parent1` FOREIGN KEY (`AckParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Incident_Staff1` FOREIGN KEY (`AckAdminID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `Parent`
--

DROP TABLE IF EXISTS `Parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parent` (
  `ParentID` int(11) NOT NULL AUTO_INCREMENT,
  `SpouseID` int(11) DEFAULT NULL,
  `ProspectID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` char(2) NOT NULL,
  `Zip` int(11) NOT NULL,
  `HomePhone` varchar(255) DEFAULT NULL,
  `CellPhone` varchar(255) DEFAULT NULL,
  `WorkPhone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Employer` varchar(255) NOT NULL,
  `Occupation` varchar(255) NOT NULL,
  `DepositPaid` bit(1) NOT NULL,
  `ParentStatusID` int(11) NOT NULL,
  `UDDTM` datetime NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_Parent_Prospect` (`ProspectID`),
  KEY `Parent_ParentStatusLookup` (`ParentStatusID`),
  KEY `FK_Parent_UserTable1` (`UserID`),
  KEY `FK_Parent_Parent1` (`SpouseID`),
  CONSTRAINT `FK_Parent_Parent1` FOREIGN KEY (`SpouseID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Parent_ParentStatusLookup` FOREIGN KEY (`ParentStatusID`) REFERENCES `ParentStatusLookup` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Parent_Prospect` FOREIGN KEY (`ProspectID`) REFERENCES `Prospect` (`ProspectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Parent_UserTable1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParentStatusLookup`
--

DROP TABLE IF EXISTS `ParentStatusLookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParentStatusLookup` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `StatusDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParentStatusLookup`
--

LOCK TABLES `ParentStatusLookup` WRITE;
/*!40000 ALTER TABLE `ParentStatusLookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParentStatusLookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prospect`
--

DROP TABLE IF EXISTS `Prospect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prospect` (
  `ProspectID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstContactDTTM` datetime NOT NULL,
  `ObservationDTTM` datetime NOT NULL,
  `ReferredBy` varchar(255) DEFAULT NULL,
  `IsMoving` bit(1) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `LevelOfInterest` int(11) NOT NULL,
  `LevelOfUnderstanding` int(11) NOT NULL,
  `WillingnessToLearn` int(11) NOT NULL,
  PRIMARY KEY (`ProspectID`),
  KEY `FK_Prospect_LevelLookup1` (`LevelOfInterest`),
  KEY `FK_Prospect_LevelLookup2` (`LevelOfUnderstanding`),
  KEY `FK_Prospect_LevelLookup3` (`WillingnessToLearn`),
  CONSTRAINT `FK_Prospect_LevelLookup1` FOREIGN KEY (`LevelOfInterest`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Prospect_LevelLookup2` FOREIGN KEY (`LevelOfUnderstanding`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Prospect_LevelLookup3` FOREIGN KEY (`WillingnessToLearn`) REFERENCES `ProspectLevelLookup` (`LevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prospect`
--

LOCK TABLES `Prospect` WRITE;
/*!40000 ALTER TABLE `Prospect` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prospect` ENABLE KEYS */;
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
  `UDDTM` datetime NOT NULL,
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
  `ContractRenewalDeadline` datetime DEFAULT NULL,
  `VolunteerInformationID` int(11) NOT NULL,
  PRIMARY KEY (`AcademicYear`),
  KEY `FK_SchoolInformation_VolunteerInformation` (`VolunteerInformationID`),
  CONSTRAINT `FK_SchoolInformation_VolunteerInformation` FOREIGN KEY (`VolunteerInformationID`) REFERENCES `VolunteerInformation` (`VolunteerInformationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolInformation`
--

LOCK TABLES `SchoolInformation` WRITE;
/*!40000 ALTER TABLE `SchoolInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolInformation_Tuition`
--

DROP TABLE IF EXISTS `SchoolInformation_Tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolInformation_Tuition` (
  `AcademicYear` int(11) NOT NULL,
  `AcademicLevelID` int(11) NOT NULL,
  `TuitionID` int(11) NOT NULL,
  PRIMARY KEY (`AcademicYear`,`AcademicLevelID`),
  UNIQUE KEY `AcademicLevelID_UNIQUE` (`AcademicLevelID`),
  KEY `FK_SchoolInformation_Tuition_SchoolInformation` (`AcademicYear`),
  KEY `FK_SchoolInformation_Tuition_Tuition` (`TuitionID`),
  KEY `FK_SchoolInformation_Tuition_AcademicLevel1` (`AcademicLevelID`),
  CONSTRAINT `FK_SchoolInformation_Tuition_AcademicLevel1` FOREIGN KEY (`AcademicLevelID`) REFERENCES `AcademicLevel` (`AcademicLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SchoolInformation_Tuition_SchoolInformation` FOREIGN KEY (`AcademicYear`) REFERENCES `SchoolInformation` (`AcademicYear`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SchoolInformation_Tuition_Tuition` FOREIGN KEY (`TuitionID`) REFERENCES `Tuition` (`TuitionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolInformation_Tuition`
--

LOCK TABLES `SchoolInformation_Tuition` WRITE;
/*!40000 ALTER TABLE `SchoolInformation_Tuition` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolInformation_Tuition` ENABLE KEYS */;
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
  `Enabled` bit(1) NOT NULL,
  `AMICertified` bit(1) DEFAULT NULL,
  `AMICertifiedFrom` varchar(255) DEFAULT NULL,
  `AMICertifiedDTTM` datetime DEFAULT NULL,
  `FoodAllergies` varchar(2047) DEFAULT NULL,
  `MedicineAllergies` varchar(2047) DEFAULT NULL,
  `OtherAllergies` varchar(2047) DEFAULT NULL,
  `EmergencyContactID1` int(11) NOT NULL,
  `EmergencyContactID2` int(11) NOT NULL,
  `EmergencyContactID3` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `StaffID_StaffType` (`StaffID`,`StaffTypeID`),
  KEY `FK_Staff_StaffTypeLookUp` (`StaffTypeID`),
  KEY `FK_Staff_UserTable` (`UserID`),
  KEY `FK_Staff_EmergencyContact1` (`EmergencyContactID1`),
  KEY `FK_Staff_EmergencyContact2` (`EmergencyContactID2`),
  KEY `FK_Staff_EmergencyContact3` (`EmergencyContactID3`),
  CONSTRAINT `FK_StaffTypeLookUp` FOREIGN KEY (`StaffTypeID`) REFERENCES `StaffTypeLookUp` (`StaffTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_EmergencyContact1` FOREIGN KEY (`EmergencyContactID1`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_EmergencyContact2` FOREIGN KEY (`EmergencyContactID2`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Staff_EmergencyContact3` FOREIGN KEY (`EmergencyContactID3`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
-- Table structure for table `StaffTypeLookUp`
--

DROP TABLE IF EXISTS `StaffTypeLookUp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffTypeLookUp` (
  `StaffTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffTypeDescription` varchar(255) NOT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StaffTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffTypeLookUp`
--

LOCK TABLES `StaffTypeLookUp` WRITE;
/*!40000 ALTER TABLE `StaffTypeLookUp` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffTypeLookUp` ENABLE KEYS */;
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
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Nickname` varchar(255) DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `StudentStatus` int(11) NOT NULL,
  `DayType` char(1) DEFAULT NULL,
  `DOB` date NOT NULL,
  `EnrollmentDTTM` datetime NOT NULL,
  `EmergencyContactID1` int(11) NOT NULL,
  `EmergencyContactID2` int(11) NOT NULL,
  `EmergencyContactID3` int(11) NOT NULL,
  `FoodAllergies` varchar(2047) DEFAULT NULL,
  `MedicineAllergies` varchar(2047) DEFAULT NULL,
  `OtherAllergies` varchar(2047) DEFAULT NULL,
  `UDTTM` datetime NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `FK_Student_Classroom` (`ClassID`),
  KEY `FK_Student_EmergencyContact1` (`EmergencyContactID1`),
  KEY `FK_Student_EmergencyContact2` (`EmergencyContactID2`),
  KEY `FK_Student_EmergencyContact3` (`EmergencyContactID3`),
  CONSTRAINT `FK_Student_Classroom` FOREIGN KEY (`ClassID`) REFERENCES `Classroom` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact1` FOREIGN KEY (`EmergencyContactID1`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact2` FOREIGN KEY (`EmergencyContactID2`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Student_EmergencyContact3` FOREIGN KEY (`EmergencyContactID3`) REFERENCES `EmergencyContact` (`ContactID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `StudentParent`
--

DROP TABLE IF EXISTS `StudentParent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentParent` (
  `ParentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `RelationshipID` int(11) NOT NULL,
  `PrimaryContact` bit(1) NOT NULL,
  PRIMARY KEY (`ParentID`,`StudentID`),
  KEY `FK_StudentParent_Student` (`StudentID`),
  KEY `FK_StudentParent_Parent` (`ParentID`),
  KEY `FK_StudentParent_RelationshipLookup1` (`RelationshipID`),
  CONSTRAINT `FK_StudentParent_Parent` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_StudentParent_RelationshipLookup1` FOREIGN KEY (`RelationshipID`) REFERENCES `RelationshipLookup` (`RelationshipID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
-- Table structure for table `Tuition`
--

DROP TABLE IF EXISTS `Tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tuition` (
  `TuitionID` int(11) NOT NULL AUTO_INCREMENT,
  `HalfdayFee` int(11) DEFAULT NULL,
  `FulldayFee` int(11) DEFAULT NULL,
  PRIMARY KEY (`TuitionID`)
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
  KEY `FK_UserAlerts_Alerts1` (`AlertID`),
  KEY `FK_UserAlerts_users1` (`UserID`),
  CONSTRAINT `FK_UserAlerts_Alerts1` FOREIGN KEY (`AlertID`) REFERENCES `Alerts` (`AlertID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserAlerts_users1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAlerts`
--

LOCK TABLES `UserAlerts` WRITE;
/*!40000 ALTER TABLE `UserAlerts` DISABLE KEYS */;
INSERT INTO `UserAlerts` VALUES (1,1);
INSERT INTO `UserAlerts` VALUES (4,1);
INSERT INTO `UserAlerts` VALUES (4,2);
/*!40000 ALTER TABLE `UserAlerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerInformation`
--

DROP TABLE IF EXISTS `VolunteerInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerInformation` (
  `VolunteerInformationID` int(11) NOT NULL AUTO_INCREMENT,
  `RequiredHours` int(11) DEFAULT NULL,
  `FeePerHour` int(11) DEFAULT NULL,
  `IsDefault` bit(1) DEFAULT NULL,
  PRIMARY KEY (`VolunteerInformationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerInformation`
--

LOCK TABLES `VolunteerInformation` WRITE;
/*!40000 ALTER TABLE `VolunteerInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerLogEntry`
--

DROP TABLE IF EXISTS `VolunteerLogEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VolunteerLogEntry` (
  `ParentID` int(11) NOT NULL,
  `Hours` double NOT NULL,
  `VolunteerTaskID` int(11) NOT NULL,
  `VolunteerEventID` int(11) NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `FK_VolunteerLogEntry_VolunteerTasks1` (`VolunteerTaskID`),
  KEY `FK_VolunteerLogEntry_VolunteerEvent1` (`VolunteerEventID`),
  KEY `FK_VolunteerLogEntry_Vonunteer1` (`ParentID`),
  CONSTRAINT `FK_VolunteerLogEntry_VolunteerEvent1` FOREIGN KEY (`VolunteerEventID`) REFERENCES `Event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_VolunteerLogEntry_VolunteerTasks1` FOREIGN KEY (`VolunteerTaskID`) REFERENCES `VolunteerTasks` (`VolunteerTaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_VolunteerLogEntry_Vonunteer1` FOREIGN KEY (`ParentID`) REFERENCES `Vonunteer` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  KEY `FK_Vonunteer_VolunteerSkillSheet1` (`VolunteerSkillID`),
  CONSTRAINT `FK_Parent_Volunteer` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ParentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vonunteer_VolunteerSkillSheet1` FOREIGN KEY (`VolunteerSkillID`) REFERENCES `VolunteerSkillSheet` (`VolunteerSkillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `ci_sessions` VALUES ('023f57898ba414f446fc599cdea59d75','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('024d209b7458db882ce6a2c0830f37a2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('02545a8030c1874da14b6381e3906292','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('0404299a9cbb0ec83fac03bae572ddf0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('043d0a57ae3aba0c15e69c95669adef4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('0476595de810506875220b46e016ff05','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('0490df1f0ab504c4923caab60a66a098','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('04eedb30f4cd650c34c742b9ebfdd56d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('05109bf9932680640a80c92df2f6361c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('05be8bf1f6975611bbdf64cc4813c622','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('06a67b8e12215a63b634570bdbe8c4df','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('075b30f71b986ae6b1bba54a72bc5741','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('08e5f30f40fe466de0d4a1bcdc494a70','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('0a06826db0fbce14222e57dee0415a4e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('0abcfd35243488d96d2132274bb17332','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('0c4d0f4133e0fac04dac17c828c59339','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('0e0de695ced659832b181f89ed0affeb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('11345d753160896f2554a5e0fbaa1198','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('13ddeaa9828f9802865583b260cb879f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167622,'');
INSERT INTO `ci_sessions` VALUES ('14513611c4bed70e8991b6415cc6f0fd','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('14b719134130edde994a17e6a0c7b73a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('14e157cd2d51ce7412f6c2d3a0859f84','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('157c966e70ba9682f61cade5c2a5af8c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('15a458437f4343d6f1fd705a046f6e97','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('15f55ec868cb4f786e85e56310b16c80','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('1759bd53dc4cf17acadaa68def11365f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('1810707256a978665979d2dfb149c507','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('18747d36882c9729b7f5d65f202f9412','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('1877ba055f5202329764c40e152771bb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('18c15de0081d2e5d8367110355f98d6b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('1b92e571b932ca34b506a041aebda910','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('1db0bd35a77d897e875ba87e05db7d77','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('1e8fe2ba951cbe87d1f774b7d24d86e8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('203a06d84b1217f4dabff7f2ef47b64e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('21469e0bce258d3420ae2aa3ebb5f03e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('21bbc35fa04341172782fb25f5f9a803','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('23e00a1859fec4bd8bd3500e964aa902','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('2735a057e26f8f61bdddcf943b5772d5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('27434853b16b31dda623ac30017a5051','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167934,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('286fdf3a5a85ad9266ef16a6b03c44cb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('28ba3cc65d9b4ddcf7bf3a797fec5123','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('29468154dd0550d02367fe6a55b4d833','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330163820,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:8:\"username\";s:8:\"cms-team\";s:5:\"email\";s:25:\"cms-team@googlegroups.com\";s:8:\"group_id\";s:1:\"1\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";s:19:\"0000-00-00 00:00:00\";s:12:\"CreationDTTM\";s:19:\"2012-02-05 00:00:00\";s:7:\"Enabled\";s:1:\"\";s:15:\"ChangedPassword\";s:1:\"\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('29d5968e93b4f88a341442e12a42e9b8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('2ae8076e656b9a62a67e74a7b37c9722','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('2aef44f26e790b6d7f26bb738b28ffa4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('2b1a01dcbea01f02ccabd6ab5ffdbd52','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('2b532621aebb87b6be06c63650b6492a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167612,'');
INSERT INTO `ci_sessions` VALUES ('2b9183721e1891567ea60eaae27e1ad0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('2bb5ee9fad8fb49cfb159969b9ae1c0c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('2c6d5edd54d17bd4974163a7ce55b9fa','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('2e7b8e7a055dc4c17d15bd3763eb1f39','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('2f671918e59f694869f2d582818b6517','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('303863db1f41ea0ca91ceca8913759d6','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('3176e3eeffc7af51ffbc09f76e58bed1','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('31ffda7205ba0cae8989f14d9c86aaba','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('327aa0dd7e671164294408a63ce7319e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('328d88053c9b707f6ffc8c27483f23e8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('32f4162c8967e653e343b88d34fbe604','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('350ed6a968b7a9c533f9b77bb3a5546b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168093,'');
INSERT INTO `ci_sessions` VALUES ('353c30023f7ad05e9dbf96b67614b3d2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('35cc12dfc6619f889d03f70a7b4d2f6e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('367c7233d70fcd0a15ec0cecf5ea87ea','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('372e3f6f2a7ebfc105b03b7298b68f89','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('383fbfca41241252c1ef37ab8325c0a0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('38c2d192943932f49295e5dacc6a963a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('39a37fa29a415d18f03e96ca2dd7c2e5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('3b99a49ee01c9e08d1f5a0b03ea3e63c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('3ba14fd7b32ed59e1a5ca1bf1ddaf08c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('3bac4bd07c23ea55916608a9242f692e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('3c760794de1235c113aca7a0af6627f7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('3c8e5d77cc1a6e01a0ed4723c346cf0f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('3e4b39ba6517738d54c710a2e8581a77','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('3e5baf420a55d9cf2ee31fc063613aff','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('3eda2d8be363f692c99071e549bebd9c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('3f52054c62fb8ede63854f043fddfb37','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('3ffaca2391a799a3a5a1e8195df8074d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('417708ff515475481338a627a6fd64ed','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('426f0cd6714fea2b2587153ba87080e6','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('439242faa7e386ed41f7957f01e1e33a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('43d155319805c57fbccfa5bac75943ac','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('43d7e30b9338212b060fc27b7157418a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('44a15cfa428707500487cfb529af7324','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('45c115119a3d34ffb92a820df11c263d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('47bcfbd5c1ae2c381c64437acfc7fd2d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('47ff6cd65c77272f2ef2cf1add910350','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('4984ccee9bd36a51b144fa9b82c77cc5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('4a1895078f987d3bac6e431cd68bd202','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('4af311eb5881adb698860efbef730825','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('4b45bc0aa3c9f27f72adbcb5113abd58','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168058,'');
INSERT INTO `ci_sessions` VALUES ('4b7f2374458318d2c98c7d2d09e0c702','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('4c9b6b240132f21c74890476a0b2d247','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('4cd033728171144d18cd772074a3027b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168053,'');
INSERT INTO `ci_sessions` VALUES ('4dba40cca465eb48547094d93e1f926f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('4ef2dc8f6f29dc27fca060d640a34547','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('4efb0e36be6044009a22e58c6872592d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('4faa529ff8c8a87cc7eb16cae306ae75','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('50a135c5a641316649216fad8307f99d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('51d345c701349c9b468fac4ce9950c98','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('52d3e1db01f3f6c63a6ca13786458be0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('5336d0af0c7639bd92574951350da119','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('54e6275575447c74c51eabc5b5c39b3b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('55d85e1c949ea6b3e9895339d390d035','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('564f2c0dcd4a2bf0e3b7e261787b4c7b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('5730e61e7d9cf81a57f186b2c06b9848','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('5856c3722adb017f3555dea4cc1c69a7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('5896f5fcdc31d1b5bee501fc4789c277','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('5b98973e9d431b7638b05d3a6e00611e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('5c6abc91ec5ae039f669e97b7102690a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('5c95fba2a2450a07a3ae0716843e2a43','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168050,'');
INSERT INTO `ci_sessions` VALUES ('5cf5fce42d60004d2d6e3fd83231aef6','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167622,'');
INSERT INTO `ci_sessions` VALUES ('61c5cd61b47166cbc1250b33ea8c2572','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('63b30577634aae3db0a4bfbf1ee5304d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('650053edf86ccdcd60a32a8f46b0d2e6','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('664d90c253d6f387c168f567f49be477','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('67bd5cb71bee1911f2eb4c3c412ed00a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('684375bef17909d947224aae4730147d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('68a8a0e4d31a74162571b90efdef40ab','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('6987915669528b947511f6a11568a330','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('69ebf9cba7c2ed78512e6a98af879729','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('69fa0d4070cb0b528698fa60159832b9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('6a12009d0435703409e0975760662443','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('6ad2aa90211309a17c42e137d7469439','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('6bf2093f8408642da49f8c17eac6fa7b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('6e26c7923edfd476284f1915b6cb4ecc','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('6e7ce67e8e1b1d7623ea46efae8993e1','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167622,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('6fedc5ebf8542b1807d4506f57cae737','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('702d30a509fa127327bd7833935b6aa8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('71d2d4540b110c5446d15d636dbf22f2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('721b976cd8fa4519090b871f53dd5b55','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('74420d24f7d8b9b5381b259fe3bf4072','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('74610581fedade51e0c9cb70ca3752a9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('7551cae4a13de2efb436fb174a516c31','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('7559a312c7e9760a88554323405eac6c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168191,'');
INSERT INTO `ci_sessions` VALUES ('7575ae4fd663f9c1d1df20b5fdd41451','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('75b2660a4ab4d392a2322d76f6167fae','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('76140bc8939d0eeace404b404e401f55','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('76d550f88b598a353a9abec83385d0c5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('7880cc518ac31b8138eacd74a6a12ce5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('78870092a73a9bd7401d9d28892c27ff','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('7890d996f37e883403da8789968a24b4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167934,'');
INSERT INTO `ci_sessions` VALUES ('7940268c2d3bc80e552f7881a9b2fe4a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('7953ac2bf1c14737735498f70c70d5ed','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('79d3727a577dd74d16afe8b318f0031c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('7acb472420980df989d8a1dbbacf0dee','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('7b12e7edfe36dcf790cdcfd0e749d8c7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('7b2bdaed8f20326880352812036bfc9b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('7c213cb35ad72fe91ba216d3a12fa7db','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('7c3d272c17eae313a088bd70725d7c7b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('7e56ef4466d8c37765fee87c47008d90','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('7ea20e3fa4e1734d0ff7af2a312f6bd4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168053,'');
INSERT INTO `ci_sessions` VALUES ('7fb1c50921f338a76547d81a7685ab93','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('7ff7beb852223257bb6874706f6ceedb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('807e4f4837440de7e24c1cd06e7cfba7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('8095a8a668675819cad0ef5536405e79','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167608,'');
INSERT INTO `ci_sessions` VALUES ('828ff8fb639df1bf609a24760dd5b71d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('8331e76ff870a394c6ecb10700830895','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('836b18f040a2c8bb56e410be40b39c9a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('84e1bf1a759ff7b613627ba59326f36c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('861daa641859a0b9a5000166fed96939','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('8663a392b033db501e9ae4579c444fd6','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('86fb4468d7c2df6b99b5d8cda44d94c2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('87500cbcb91c01f26bda310d728cf8b0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('897be90c468056ff6d8cc8f724c0cd51','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('89a0d420e4224dd250853c44b522da0c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('89dba00b693db3165ee668c024a6e71a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('89fe529765c73ad08586dd56255756e5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('8af6c83f4449edaf3c425e88f5d7c9ff','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('8c51dd067b1cc2eeb078d36c872764a0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('8d2ca28e51cf38f9a634ccdfc7af9f6d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('8dbf7758996429bdc3c8350cebd45e2f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('8e2e2dbe25741eff27cfd4fea95b5964','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('8fa98dbc070dc0004adae31d32fefa75','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('900b081e6e3d837446455bea02e11f9a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('92c889d979ef662c85e80d28bec5f25a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('933af61781a808182d7f677ce2e43413','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('941df2c4e09265f9e70a9f01a3884a43','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('94c6297b2e5b55b3349eaff7a26ec54b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('9633ba2996b87306927488940220d920','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('969ae3426ae390ada562c9e48955f1ca','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('97f4bab87fd1b1a25fc21a3c545c46a7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('98785e75cf3b792b0ad9ecc02d74a45b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168093,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('995956f342cb01fa99e06198d1c23acc','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('9b5d2c30f843b605e7efe5bd4d2425e8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('9b6448158acc9f493dc6900ed5703897','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('9c06730f7b2c66a86a69413163c2157c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('9e6aed1a1759aa4fbb00aba01efa1553','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('9e94f9f09b8b296f6313a75856607861','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('a029f61f04e718b84f48d7b9d2e68062','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('a13fee1b1670fc01aefe7cde088edc0d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('a20fee7ac290507173da8a182af767e0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('a55e80cb469da81d92daac89ccf9a80f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('a6095d6c0728d92e9eb50928eac79f07','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('a737232e3f2680592044cc2d24adb9c7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('a8a646e31bd5a6daa8fab232c80d01bc','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('afce2a4945b31db3af6e6b54b3bb479e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('b30c88e1fa09b42abab48420c298d3d9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('b497b49c31e6ab0f08091773a4521aa7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('b4b898d4f09362d2203c1d43d0095f7d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('b57fcac06b1289e7361be7db95cde505','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168194,'');
INSERT INTO `ci_sessions` VALUES ('b5aa5063df0f543c353a31628ce75c60','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('b5dfb701cb63f623849340b624f7f06a','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('b65bcd497c48ada516016f4f70e70086','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('b8b245062b8a69f2bb8392f98b7a5394','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167861,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:8:\"username\";s:8:\"cms-team\";s:5:\"email\";s:25:\"cms-team@googlegroups.com\";s:8:\"group_id\";s:1:\"1\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";s:19:\"0000-00-00 00:00:00\";s:12:\"CreationDTTM\";s:19:\"2012-02-05 00:00:00\";s:7:\"Enabled\";s:1:\"\";s:15:\"ChangedPassword\";s:1:\"\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('b8f0e728c7a8d77f99aa2f59069a77c9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('ba010fdcc6b72fbddb2b14dd6be5fc91','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('bacb8ba74fdf577577cb572d357796f0','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('bb14965b8cbccfd1274df2bc516fdeb7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('bd552e7c7fa5d5bb7051a20940c79970','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('bdaea34d28fa806fb7806aa35d6d378f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168062,'');
INSERT INTO `ci_sessions` VALUES ('be32d84eb365f7bb34292d5d665155da','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167934,'');
INSERT INTO `ci_sessions` VALUES ('be5d2a5d74a73bdaaf5fa0c13a390486','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('bf67daf49a2374d0e326f6c76ab72a7c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('c2b84ca2ae59224efc2f4080590b08e3','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('c56cebd7110e3be99fea56e6d9674e60','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('c7fbe48797532064c5e1b44bb15eb25f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('c855e71237de6c18d30e015e1fada472','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('c886f315996f657eb5254e52ab5df51b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('c951d536300cd116c55babbe7a5838f8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('cbb6ddb0e2ec4e27c2392702d8efabe5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('cc02e1cebc6483e0fd0affa9e0d98817','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('cd6fd40799f8a0a2bcb30c0dc2dfff92','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('cea2da8cf7ac5e550b23f41e39b1e058','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('d0a24d0a249792dd198fd846ac026eb5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167844,'');
INSERT INTO `ci_sessions` VALUES ('d176448dba347cad77d2754b18b96df8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('d1cf3ae52599901913fceeadbcffaec9','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('d1f7c3ee21ed252a767bd3556d44095e','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('d1f85f91dab52b83a583d14de6f844d2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('d275157c9ec0fedb8a1e480aa41fe40b','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168089,'');
INSERT INTO `ci_sessions` VALUES ('d276c099d44faaa4ea34e16a9f722dc7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('d280918760d5aff121a6284efad088f7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('d2855e53339a6a1d4c6c056a5420c35c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('d2aef75a4a5369a2aa6d6c207494b9cb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('d4c5f8f1135a2acb8df22a659de1208c','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167929,'');
INSERT INTO `ci_sessions` VALUES ('d63036902bd356be3d918a0e4ffafddb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('d720b66e9de837a9dccb61cdce046e37','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('d7c01f59b1106eca4179a3c1b5ed49bb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('d7c37c8bcfa57b2244ae56ec08a8666d','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('d9c8a64bd08799f40093b902500829b7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('da9bdccf9572f04d77e0b6be1f8f4db3','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('dd77393ef67e7320ff42872e91f87c39','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('ddbedad8e9a2353ff2f38296021e6132','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('de2575bca4552f6b412441f9198bff26','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('df4f7b39e2a4082115de54d91ad9cad7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('e0d5064723231c76c0d69b8973831013','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('e146d4e766f7c62ec0f21bb404201b87','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('e14abe13a1ea76c37582f67e30fbb590','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('e14fdf9c798be7d014acb99c48cc1124','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('e303edf89419aee78111ebdd63f5b960','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('e5138a6afca67f415ba8162c212c3826','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168202,'');
INSERT INTO `ci_sessions` VALUES ('e559c698ecd62df2c1ae7c08582672f1','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168053,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('e7251bdc673113c3765033894f309e35','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('e768fa4dbb185be95d664f0c8c1339f7','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('eb2cd8cdbde46b3003ca6d59a5790a17','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('ef9d28cc403afdf2102fafcdd7bdf707','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168199,'');
INSERT INTO `ci_sessions` VALUES ('f128662061fa96035cfc8ca18f151eb4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
INSERT INTO `ci_sessions` VALUES ('f12cbe89b455f06be95224544ce4fda3','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('f19d38a4940ad27eb095fe7536ec54d8','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168204,'');
INSERT INTO `ci_sessions` VALUES ('f20690a4b58945567ca0129f34bddd08','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('f366038c9a6340f7ce5dfa59bf7a2ce4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168093,'');
INSERT INTO `ci_sessions` VALUES ('f3d7be88a25d17b1d5d736d68dcc7a98','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168196,'');
INSERT INTO `ci_sessions` VALUES ('f6c7f196bb34879ffbb5d009c52753ca','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('f768a315d71cbcbcbbc114348ea1d18f','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('f83625e2d658bb8aee6e83d80af38aeb','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168197,'');
INSERT INTO `ci_sessions` VALUES ('f91d47c93efdb8db23a739b239e1b7c5','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168198,'');
INSERT INTO `ci_sessions` VALUES ('fb49c175312ec60355eebbf6ad1bd3f4','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('fb86b0c85f029d5f19a9692656cbb162','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('fbaf11e38144fecbfeaefc26b7e80e42','67.170.132.170','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330167848,'a:12:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"3\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:15:\"admin@admin.com\";s:8:\"group_id\";s:3:\"100\";s:5:\"token\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:13:\"LastLoginDTTM\";N;s:12:\"CreationDTTM\";s:19:\"0000-00-00 00:00:00\";s:7:\"Enabled\";s:1:\"\0\";s:15:\"ChangedPassword\";s:1:\"\0\";s:9:\"logged_in\";b:1;}');
INSERT INTO `ci_sessions` VALUES ('fcfa3ca505e01d6ed6a9a8aadb7802aa','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168203,'');
INSERT INTO `ci_sessions` VALUES ('fe8edc665438aabd723d990c40db2af2','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168195,'');
INSERT INTO `ci_sessions` VALUES ('feaf8030286480f833322ab3f03f7cfa','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168201,'');
INSERT INTO `ci_sessions` VALUES ('ffbcccb2f8f498a52aecb3de87ca0736','67.170.132.170','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',1330168200,'');
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
  `ChangedPassword` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cms-team','cms-team@googlegroups.com','1ab9e422fac04df35066e6491d39b745550ae4a65a9ac9f81a5504682a25b71a','1','','','0000-00-00 00:00:00','2012-02-05 00:00:00','','');
INSERT INTO `users` VALUES (2,'test','a@a.com','86c2982e3349c29255f99281593148a736386617f2cb53dec3aa851f8e86bfae','100','','',NULL,'0000-00-00 00:00:00','\0','\0');
INSERT INTO `users` VALUES (3,'admin','admin@admin.com','6f7c155805e64f13b752a222bf8f6528e958ed890cc149a53f0ab01f6d5d108c','100','','',NULL,'0000-00-00 00:00:00','\0','\0');
INSERT INTO `users` VALUES (4,'parent','parent@parent.com','0e04f84669bdcf3c97bc19cbba4e0ce4a5b6d8e889cfe58c9d64d1d107245df8','100','','',NULL,'0000-00-00 00:00:00','\0','\0');
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

-- Dump completed on 2012-02-25  3:14:01
