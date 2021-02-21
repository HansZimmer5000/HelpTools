-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: leantime
-- ------------------------------------------------------
-- Server version	5.5.60-0+deb7u1

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
-- Table structure for table `zp_account`
--

DROP TABLE IF EXISTS `zp_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_account`
--

LOCK TABLES `zp_account` WRITE;
/*!40000 ALTER TABLE `zp_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_action_tabs`
--

DROP TABLE IF EXISTS `zp_action_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_action_tabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` text COLLATE utf8mb4_unicode_ci,
  `tab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabRights` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_action_tabs`
--

LOCK TABLES `zp_action_tabs` WRITE;
/*!40000 ALTER TABLE `zp_action_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_action_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_audit`
--

DROP TABLE IF EXISTS `zp_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `action` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entityId` int(11) DEFAULT NULL,
  `values` text COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projectId` (`projectId`),
  KEY `projectAction` (`projectId`,`action`),
  KEY `projectEntityEntityId` (`projectId`,`entity`,`entityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_audit`
--

LOCK TABLES `zp_audit` WRITE;
/*!40000 ALTER TABLE `zp_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_calendar`
--

DROP TABLE IF EXISTS `zp_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `kind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allDay` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_calendar`
--

LOCK TABLES `zp_calendar` WRITE;
/*!40000 ALTER TABLE `zp_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas`
--

DROP TABLE IF EXISTS `zp_canvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_canvas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectIdType` (`projectId`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas`
--

LOCK TABLES `zp_canvas` WRITE;
/*!40000 ALTER TABLE `zp_canvas` DISABLE KEYS */;
INSERT INTO `zp_canvas` VALUES (1,'Lean Canvas',1,'2015-11-13 13:03:46',3,'leancanvas'),(2,'Milestone1 Review',1,'2020-11-20 21:22:43',4,'retrospective');
/*!40000 ALTER TABLE `zp_canvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas_items`
--

DROP TABLE IF EXISTS `zp_canvas_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_canvas_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `assumptions` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `conclusion` text COLLATE utf8mb4_unicode_ci,
  `box` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `canvasId` int(11) DEFAULT NULL,
  `sortindex` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milestoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas_items`
--

LOCK TABLES `zp_canvas_items` WRITE;
/*!40000 ALTER TABLE `zp_canvas_items` DISABLE KEYS */;
INSERT INTO `zp_canvas_items` VALUES (1,'','','','','well',1,'2020-11-20 21:22:47','2020-11-20 21:22:47',2,NULL,'','');
/*!40000 ALTER TABLE `zp_canvas_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_clients`
--

DROP TABLE IF EXISTS `zp_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internet` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` int(1) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_clients`
--

LOCK TABLES `zp_clients` WRITE;
/*!40000 ALTER TABLE `zp_clients` DISABLE KEYS */;
INSERT INTO `zp_clients` VALUES (1,'HAW Hamburg','',0,'','','','','',NULL,NULL,'');
/*!40000 ALTER TABLE `zp_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_comment`
--

DROP TABLE IF EXISTS `zp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `commentParent` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_comment`
--

LOCK TABLES `zp_comment` WRITE;
/*!40000 ALTER TABLE `zp_comment` DISABLE KEYS */;
INSERT INTO `zp_comment` VALUES (1,'ticket',1,0,'2020-10-03 08:32:45',14,'ggf. früher fertig da Notizen und teile der Masterarbeit kontinuierlich erstellt werden soll.'),(2,'ticket',1,0,'2020-11-20 08:58:41',11,'Z.b. für Analyse: Anhand welcher Punkte (aus Literatur) mache ich jetzt eigentlich den Vergleich?'),(3,'ticket',1,0,'2020-11-20 09:00:02',12,'e.g. bei Analyse: Vergleiche theoretisch (z.b. Argumentation) wie auch praktisch (z.b. Ausfälle injecten) machen '),(4,'ticket',1,0,'2020-11-20 09:00:31',13,'e.g. bei Analyse sicherstellen dass Vergleichsresultate korrekt.');
/*!40000 ALTER TABLE `zp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_dashboard_widgets`
--

DROP TABLE IF EXISTS `zp_dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_dashboard_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text CHARACTER SET latin1,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_dashboard_widgets`
--

LOCK TABLES `zp_dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `zp_dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_file`
--

DROP TABLE IF EXISTS `zp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('project','ticket','client','user','lead','export','private') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_file`
--

LOCK TABLES `zp_file` WRITE;
/*!40000 ALTER TABLE `zp_file` DISABLE KEYS */;
INSERT INTO `zp_file` VALUES (3,'user',1,1,'png','5a8975e6c50ada0490efa493287f6d97','userPicture','2021-01-02 19:41:45');
/*!40000 ALTER TABLE `zp_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_gcallinks`
--

DROP TABLE IF EXISTS `zp_gcallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_gcallinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(255) DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colorClass` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_gcallinks`
--

LOCK TABLES `zp_gcallinks` WRITE;
/*!40000 ALTER TABLE `zp_gcallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_gcallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_lead`
--

DROP TABLE IF EXISTS `zp_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_lead` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('lead','opportunity','client') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refSource` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refValue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `potentialMoney` int(11) DEFAULT NULL,
  `actualMoney` int(11) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `proposal` text COLLATE utf8mb4_unicode_ci,
  `creatorId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_lead`
--

LOCK TABLES `zp_lead` WRITE;
/*!40000 ALTER TABLE `zp_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_message`
--

DROP TABLE IF EXISTS `zp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `date_sent` datetime DEFAULT NULL,
  `last_message` int(1) DEFAULT '0',
  `read` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_message`
--

LOCK TABLES `zp_message` WRITE;
/*!40000 ALTER TABLE `zp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_modulerights`
--

DROP TABLE IF EXISTS `zp_modulerights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_modulerights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` text,
  `roleIds` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49739 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_modulerights`
--

LOCK TABLES `zp_modulerights` WRITE;
/*!40000 ALTER TABLE `zp_modulerights` DISABLE KEYS */;
INSERT INTO `zp_modulerights` VALUES (49660,'calendar/class.addEvent.php','2,4,5,3'),(49661,'calendar/class.delEvent.php','2,4,5,3'),(49662,'calendar/class.delGCal.php','2,4,5,3'),(49663,'calendar/class.editEvent.php','2,4,5,3'),(49664,'calendar/class.editGCal.php','2,4,5,3'),(49665,'calendar/class.importGCal.php','2,4,5,3'),(49666,'calendar/class.showAllGCals.php','2,4,5,3'),(49667,'calendar/class.showMyCalendar.php','2,4,5,3'),(49668,'clients/class.delClient.php','2'),(49669,'clients/class.editClient.php','2'),(49670,'clients/class.newClient.php','2'),(49671,'clients/class.showAll.php','2'),(49672,'clients/class.showClient.php','2'),(49673,'comments/class.showAll.php','2,4,5,3'),(49674,'dashboard/class.addWidget.php','2,4,5'),(49675,'dashboard/class.show.php','2,4,5,3'),(49676,'dashboard/class.widgets.php','2,4,5,3'),(49677,'files/class.showAll.php','2,4,5,3'),(49678,'general/class.footer.php','2'),(49679,'general/class.header.php','2'),(49680,'general/class.main.php','2'),(49681,'general/class.menu.php','2'),(49682,'general/class.showMenu.php','2'),(49683,'leads/class.addLead.php','2,5'),(49684,'leads/class.addLeadContact.php','2,5'),(49685,'leads/class.addReferralSource.php','2,5'),(49686,'leads/class.convertToUser.php','2,5'),(49687,'leads/class.deleteLead.php','2,5'),(49688,'leads/class.editLead.php','2,5'),(49689,'leads/class.showAll.php','2,5'),(49690,'leads/class.showLead.php','2,5'),(49691,'leads/class.statistics.php','2,5'),(49692,'leancanvas/class.delCanvas.php','2,4,5'),(49693,'leancanvas/class.delCanvasItem.php','2,4,5'),(49694,'leancanvas/class.showCanvas.php','2,4,5'),(49695,'messages/class.compose.php','2,4,5,3'),(49696,'messages/class.showAll.php','2,4,5,3'),(49697,'projects/class.delProject.php','2,4,5,3'),(49698,'projects/class.editAccount.php','2,4,5,3'),(49699,'projects/class.editProject.php','2,4,5'),(49700,'projects/class.newProject.php','2,4,5'),(49701,'projects/class.showAll.php','2,4,5,3'),(49702,'projects/class.showProject.php','2,4,5,3'),(49703,'setting/class.addMenu.php','2'),(49704,'setting/class.delMenu.php','2'),(49705,'setting/class.delRole.php','2'),(49706,'setting/class.delSystemOrg.php','2'),(49707,'setting/class.editMenu.php','2'),(49708,'setting/class.editRole.php','2'),(49709,'setting/class.editSettings.php','2'),(49710,'setting/class.editSystemOrg.php','2'),(49711,'setting/class.editTabRights.php','2'),(49712,'setting/class.menuUser.php','2'),(49713,'setting/class.newRole.php','2'),(49714,'setting/class.newSystemOrg.php','2'),(49715,'setting/class.setModuleRights.php','2'),(49716,'setting/class.showAllMenu.php','2'),(49717,'setting/class.showAllRoles.php','2'),(49718,'setting/class.showAllSubmodules.php','2'),(49719,'setting/class.showAllSystemOrg.php','2'),(49720,'setting/class.userMenu.php','2'),(49721,'tickets/class.delTicket.php','2,5'),(49722,'tickets/class.editTicket.php','2,4,5,3'),(49723,'tickets/class.newTicket.php','2,4,5,3'),(49724,'tickets/class.showAll.php','2,4,5,3'),(49725,'tickets/class.showKanban.php','2,4,5,3'),(49726,'tickets/class.showMy.php','2,4,5,3'),(49727,'tickets/class.showTicket.php','2,4,5,3'),(49728,'timesheets/class.addTime.php','2,4,5'),(49729,'timesheets/class.delTime.php','2,4,5'),(49730,'timesheets/class.editTime.php','2,4,5'),(49731,'timesheets/class.showAll.php','2,5'),(49732,'timesheets/class.showMy.php','2,4,5'),(49733,'users/class.delUser.php','2'),(49734,'users/class.editOwn.php','2,4,5,3'),(49735,'users/class.editUser.php','2'),(49736,'users/class.newUser.php','2'),(49737,'users/class.showAll.php','2'),(49738,'users/class.showUser.php','2,3');
/*!40000 ALTER TABLE `zp_modulerights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_note`
--

DROP TABLE IF EXISTS `zp_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_note`
--

LOCK TABLES `zp_note` WRITE;
/*!40000 ALTER TABLE `zp_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_projects`
--

DROP TABLE IF EXISTS `zp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientId` int(100) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `state` int(2) DEFAULT NULL,
  `hourBudget` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dollarBudget` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_projects`
--

LOCK TABLES `zp_projects` WRITE;
/*!40000 ALTER TABLE `zp_projects` DISABLE KEYS */;
INSERT INTO `zp_projects` VALUES (3,'Leantime Onboarding',1,'<p>This is you first project to get you started</p>',-1,'0',0,NULL),(4,'Master\'s Thesis',1,'<p>Endtime Feburar = 21 KWs = 336 std.</p>\r\n<p>Endtime M&auml;rz = 26KWs = 416 std.</p>\r\n<div>Fault tolerance in Software Defined Networks</div>',0,'416',0,NULL);
/*!40000 ALTER TABLE `zp_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_punch_clock`
--

DROP TABLE IF EXISTS `zp_punch_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_punch_clock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `minutes` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `punchIn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_punch_clock`
--

LOCK TABLES `zp_punch_clock` WRITE;
/*!40000 ALTER TABLE `zp_punch_clock` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_punch_clock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_read`
--

DROP TABLE IF EXISTS `zp_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('ticket','message') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_read`
--

LOCK TABLES `zp_read` WRITE;
/*!40000 ALTER TABLE `zp_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_relationuserproject`
--

DROP TABLE IF EXISTS `zp_relationuserproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_relationuserproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `wage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_relationuserproject`
--

LOCK TABLES `zp_relationuserproject` WRITE;
/*!40000 ALTER TABLE `zp_relationuserproject` DISABLE KEYS */;
INSERT INTO `zp_relationuserproject` VALUES (12,1,3,NULL),(14,1,4,NULL),(15,2,3,NULL),(16,2,4,NULL);
/*!40000 ALTER TABLE `zp_relationuserproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_roles`
--

DROP TABLE IF EXISTS `zp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleDescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sysOrg` int(11) DEFAULT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_roles`
--

LOCK TABLES `zp_roles` WRITE;
/*!40000 ALTER TABLE `zp_roles` DISABLE KEYS */;
INSERT INTO `zp_roles` VALUES (2,'admin','Administrators',14,'zypro'),(3,'user','Clients',14,'zypro'),(4,'developer','Developer',14,'zypro'),(5,'manager','Manager',14,'zypro');
/*!40000 ALTER TABLE `zp_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_settings`
--

DROP TABLE IF EXISTS `zp_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_settings` (
  `key` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_settings`
--

LOCK TABLES `zp_settings` WRITE;
/*!40000 ALTER TABLE `zp_settings` DISABLE KEYS */;
INSERT INTO `zp_settings` VALUES ('db-version','2.1.4'),('projectsettings.4.ticketlabels','a:6:{i:3;s:14:\"TODO (Backlog)\";i:1;s:15:\"TODO (Selected)\";i:4;s:11:\"In Progress\";i:2;s:16:\"Testing / Review\";i:0;s:4:\"Done\";i:-1;s:8:\"Archived\";}'),('usersettings.1.lastProject','4'),('usersettings.2.lastProject','4');
/*!40000 ALTER TABLE `zp_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_sprints`
--

DROP TABLE IF EXISTS `zp_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_sprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_sprints`
--

LOCK TABLES `zp_sprints` WRITE;
/*!40000 ALTER TABLE `zp_sprints` DISABLE KEYS */;
INSERT INTO `zp_sprints` VALUES (2,4,'Sprint 01','2020-10-01 00:00:00','2020-10-24 00:00:00'),(3,4,'Sprint 02','2020-10-25 00:00:00','2020-11-14 00:00:00'),(4,4,'Sprint 03','2020-11-15 00:00:00','2020-11-28 00:00:00');
/*!40000 ALTER TABLE `zp_sprints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_stats`
--

DROP TABLE IF EXISTS `zp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_stats` (
  `sprintId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sum_todos` int(11) DEFAULT NULL,
  `sum_open_todos` int(11) DEFAULT NULL,
  `sum_progres_todos` int(11) DEFAULT NULL,
  `sum_closed_todos` int(11) DEFAULT NULL,
  `sum_planned_hours` float DEFAULT NULL,
  `sum_estremaining_hours` float DEFAULT NULL,
  `sum_logged_hours` float DEFAULT NULL,
  `sum_points` int(11) DEFAULT NULL,
  `sum_points_done` int(11) DEFAULT NULL,
  `sum_points_progress` int(11) DEFAULT NULL,
  `sum_points_open` int(11) DEFAULT NULL,
  `sum_todos_xs` int(11) DEFAULT NULL,
  `sum_todos_s` int(11) DEFAULT NULL,
  `sum_todos_m` int(11) DEFAULT NULL,
  `sum_todos_l` int(11) DEFAULT NULL,
  `sum_todos_xl` int(11) DEFAULT NULL,
  `sum_todos_xxl` int(11) DEFAULT NULL,
  `sum_todos_none` int(11) DEFAULT NULL,
  `tickets` text COLLATE utf8mb4_unicode_ci,
  `daily_avg_hours_booked_todo` float DEFAULT NULL,
  `daily_avg_hours_booked_point` float DEFAULT NULL,
  `daily_avg_hours_planned_todo` float DEFAULT NULL,
  `daily_avg_hours_planned_point` float DEFAULT NULL,
  `daily_avg_hours_remaining_point` float DEFAULT NULL,
  `daily_avg_hours_remaining_todo` float DEFAULT NULL,
  `sum_teammembers` int(11) DEFAULT NULL,
  KEY `projectId` (`projectId`,`sprintId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_stats`
--

LOCK TABLES `zp_stats` WRITE;
/*!40000 ALTER TABLE `zp_stats` DISABLE KEYS */;
INSERT INTO `zp_stats` VALUES (-1,3,'2020-10-01 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,'9',NULL,NULL,0,NULL,NULL,0,1),(-1,4,'2020-10-02 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,'17',NULL,NULL,0,NULL,NULL,0,1),(2,4,'2020-10-03 00:00:00',4,3,1,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,4,'18,19,20,21',NULL,NULL,0,NULL,NULL,0,1),(-1,4,'2020-10-03 00:00:00',4,3,1,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,4,'18,19,20,21',NULL,NULL,0,NULL,NULL,0,1),(2,4,'2020-10-07 00:00:00',10,5,3,2,0,0,NULL,24,3,9,12,3,2,4,1,0,0,0,'18,19,20,21,22,23,24,27,28,29',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-07 00:00:00',11,6,3,2,0,0,NULL,26,3,9,14,3,3,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29',NULL,NULL,0,0,0,0,1),(2,4,'2020-10-08 00:00:00',10,5,3,2,0,0,NULL,24,3,9,12,3,2,4,1,0,0,0,'18,19,20,21,22,23,24,27,28,29',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-08 00:00:00',11,6,3,2,0,0,NULL,26,3,9,14,3,3,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29',NULL,NULL,0,0,0,0,1),(2,4,'2020-10-10 00:00:00',11,6,3,2,0,0,NULL,26,3,8,15,3,3,4,1,0,0,0,'18,19,20,21,22,23,24,27,28,29,30',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-10 00:00:00',12,7,3,2,0,0,NULL,28,3,8,17,3,4,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29,30',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-15 00:00:00',12,7,3,2,0,0,NULL,28,3,8,17,3,4,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29,30',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-19 00:00:00',14,3,3,8,0,0,NULL,32,18,9,5,3,6,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29,30,31,32',NULL,NULL,0,0,0,0,1),(2,4,'2020-10-22 00:00:00',13,2,3,8,0,0,NULL,30,18,9,3,3,5,4,1,0,0,0,'18,19,20,21,22,23,24,27,28,29,30,31,32',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-22 00:00:00',14,3,3,8,0,0,NULL,32,18,9,5,3,6,4,1,0,0,0,'18,19,20,21,22,23,24,26,27,28,29,30,31,32',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-26 00:00:00',14,1,5,8,0,0,NULL,37,18,17,2,2,8,2,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-28 00:00:00',14,1,0,13,0,0,NULL,37,35,0,2,2,8,2,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39',NULL,NULL,0,0,0,0,1),(-1,4,'2020-10-31 00:00:00',17,4,0,13,0,0,NULL,45,35,0,10,2,9,4,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-04 00:00:00',18,1,3,14,0,0,NULL,47,38,7,2,2,10,4,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43',NULL,NULL,0,0,0,0,1),(3,4,'2020-11-05 00:00:00',11,7,1,3,0,0,NULL,22,6,3,13,3,5,3,0,0,0,0,'40,41,42,43,44,45,46,47,48,49,50',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-05 00:00:00',25,8,1,16,0,0,NULL,59,41,3,15,5,13,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-06 00:00:00',25,2,5,18,0,0,NULL,59,46,9,4,5,13,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-07 00:00:00',25,2,5,18,0,0,NULL,59,46,9,4,5,13,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-10 00:00:00',26,2,2,22,0,0,NULL,61,53,4,4,5,14,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-11 00:00:00',26,2,2,22,0,0,NULL,61,53,4,4,5,14,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-12 00:00:00',27,2,1,24,0,0,NULL,63,56,3,4,5,15,5,1,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-13 00:00:00',30,4,1,25,0,0,NULL,71,57,3,11,7,14,6,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-14 00:00:00',30,4,1,25,0,0,NULL,71,57,3,11,7,14,6,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-17 00:00:00',30,4,1,25,0,0,NULL,71,57,3,11,7,14,6,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-18 00:00:00',30,4,1,25,0,0,NULL,71,57,3,11,7,14,6,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-19 00:00:00',33,6,1,26,0,0,NULL,76,60,3,13,7,15,7,2,1,0,1,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66',NULL,NULL,0,0,0,0,1),(4,4,'2020-11-20 00:00:00',8,1,1,6,0,0,NULL,21,13,3,5,1,3,3,1,0,0,0,'53,58,63,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-20 00:00:00',36,6,1,29,0,0,NULL,85,66,3,16,7,18,8,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(4,4,'2020-11-21 00:00:00',8,1,1,6,0,0,NULL,21,13,3,5,1,3,3,1,0,0,0,'53,58,63,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-21 00:00:00',36,6,1,29,0,0,NULL,85,66,3,16,7,18,8,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(4,4,'2020-11-24 00:00:00',8,1,1,6,0,0,NULL,21,13,3,5,1,3,3,1,0,0,0,'53,58,63,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-24 00:00:00',36,6,1,29,0,0,NULL,85,66,3,16,7,18,8,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(4,4,'2020-11-25 00:00:00',8,1,1,6,0,0,NULL,21,13,3,5,1,3,3,1,0,0,0,'53,58,63,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-25 00:00:00',36,6,1,29,0,0,NULL,85,66,3,16,7,18,8,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(4,4,'2020-11-26 00:00:00',8,1,1,6,0,0,NULL,21,13,3,5,1,3,3,1,0,0,0,'53,58,63,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-26 00:00:00',36,6,1,29,0,0,NULL,85,66,3,16,7,18,8,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-27 00:00:00',41,7,3,31,0,0,NULL,97,72,6,19,7,21,10,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-28 00:00:00',41,6,2,33,0,0,NULL,97,77,4,16,7,21,10,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74',NULL,NULL,0,0,0,0,1),(-1,4,'2020-11-30 00:00:00',42,5,3,34,0,0,NULL,99,79,5,15,7,22,10,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-01 00:00:00',42,5,2,35,0,0,NULL,99,81,3,15,7,22,10,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-02 00:00:00',42,5,2,35,0,0,NULL,99,81,3,15,7,22,10,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-03 00:00:00',46,8,3,35,0,0,NULL,110,81,6,23,7,23,13,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-04 00:00:00',46,8,3,35,0,0,NULL,110,81,6,23,7,23,13,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-05 00:00:00',46,8,3,35,0,0,NULL,110,81,6,23,7,23,13,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-07 00:00:00',46,8,3,35,0,0,NULL,110,82,5,23,7,23,13,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-09 00:00:00',46,8,3,35,0,0,NULL,110,82,5,23,7,23,13,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-10 00:00:00',47,8,4,35,0,0,NULL,113,82,8,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-11 00:00:00',47,8,4,35,0,0,NULL,113,82,8,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-12 00:00:00',47,8,4,35,0,0,NULL,113,82,8,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-16 00:00:00',47,8,4,35,0,0,NULL,113,82,8,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-17 00:00:00',47,8,4,35,0,0,NULL,113,82,8,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-18 00:00:00',47,8,3,36,0,0,NULL,113,85,5,23,7,23,14,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83',NULL,NULL,0,0,0,0,1),(-1,4,'2020-12-31 00:00:00',51,11,3,37,0,0,NULL,124,87,6,31,7,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94',NULL,NULL,0,0,0,0,1),(-1,4,'2021-01-01 00:00:00',51,10,3,38,0,0,NULL,124,90,6,28,7,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94',NULL,NULL,0,0,0,0,1),(-1,4,'2021-01-02 00:00:00',51,10,3,38,0,0,NULL,124,90,6,28,7,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94',NULL,NULL,0,0,0,0,1),(-1,4,'2021-01-06 00:00:00',51,10,3,38,0,0,NULL,124,90,6,28,7,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94',NULL,NULL,0,0,0,0,1),(-1,4,'2021-01-07 00:00:00',52,10,3,39,0,0,NULL,125,91,6,28,8,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94,95',NULL,NULL,0,0,0,0,1),(-1,4,'2021-01-08 00:00:00',52,10,3,39,0,0,NULL,125,91,6,28,8,24,17,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94,95',NULL,NULL,0,0,0,0,2),(-1,4,'2021-01-09 00:00:00',54,10,5,39,0,0,NULL,131,91,11,29,8,24,19,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94,95,96,97',NULL,NULL,0,0,0,0,2),(-1,4,'2021-01-13 00:00:00',56,12,5,39,0,0,NULL,134,91,11,32,9,25,19,2,1,0,0,'18,20,23,24,26,27,28,29,30,31,32,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,58,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,83,91,92,93,94,95,96,97,98,99',NULL,NULL,0,0,0,0,2);
/*!40000 ALTER TABLE `zp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_submodulerights`
--

DROP TABLE IF EXISTS `zp_submodulerights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_submodulerights` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submodule` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleIds` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_submodulerights`
--

LOCK TABLES `zp_submodulerights` WRITE;
/*!40000 ALTER TABLE `zp_submodulerights` DISABLE KEYS */;
INSERT INTO `zp_submodulerights` VALUES (1,'comments-generalComment','COMMENTS','comments','generalComment.sub.php','2,4,5,3'),(2,'dashboard-calendar','CALENDAR','dashboard','calendar.sub.php','2,4,5,3'),(3,'dashboard-escalatingTickets','ESCALATING_TICKETS','dashboard','escalatingTickets.sub.php','2,4,5'),(4,'dashboard-hotLeads','HOT_LEADS','dashboard','hotLeads.sub.php','2,4,5'),(5,'dashboard-myHours','MY_HOURS','dashboard','myHours.sub.php','2,4,5'),(6,'dashboard-myProjects','MY_PROJECTS','dashboard','myProjects.sub.php','2,4,5'),(7,'dashboard-myTickets','MY_TICKETS','dashboard','myTickets.sub.php','2,4,5,3'),(8,'dashboard-notes','NOTES','dashboard','notes.sub.php','2,4,5,3'),(9,'dashboard-projectsProgress','PROJECT_PROGRESS','dashboard','projectsProgress.sub.php','2,4,5,3'),(10,'dashboard-statistics','STATISTICS','dashboard','statistics.sub.php','2,4,5'),(11,'dashboard-supportInfo','SUPPORT_INFO','dashboard','supportInfo.sub.php','2,4,5,3'),(12,'dashboard-timeTracker','','dashboard','timeTracker.sub.php','2,4,5'),(13,'projects-budgeting','BUDGETING','projects','budgeting.sub.php','2,5'),(14,'projects-tickets','TICKETS','projects','tickets.sub.php','2,4,5,3'),(15,'projects-timeline','TIMELINE','projects','timeline.sub.php','2,4,5,3'),(16,'projects-timesheet','TIMESHEET','projects','timesheet.sub.php','2,4,5'),(17,'tickets-assignUsers','ASSIGN_USERS','tickets','assignUsers.sub.php',NULL),(18,'tickets-attachments','FILES','tickets','attachments.sub.php','2,4,5,3'),(19,'tickets-comments','COMMENTS','tickets','comments.sub.php','2,4,5,3'),(20,'tickets-technicalDetails','TECHNICAL_DETAILS','tickets','technicalDetails.sub.php','2,4,5,3'),(21,'tickets-ticketDetails','TICKET_DETAILS','tickets','ticketDetails.sub.php','2,4,5,3'),(22,'tickets-ticketHistory','TICKET_HISTORY','tickets','ticketHistory.sub.php','2,4,5'),(23,'tickets-timesheet','TIMESHEET','tickets','timesheet.sub.php','2,4,5'),(24,'tickets-subTasks','SUBTASKS','tickets','subTasks.sub.php','2,4,5,3');
/*!40000 ALTER TABLE `zp_submodulerights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickethistory`
--

DROP TABLE IF EXISTS `zp_tickethistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_tickethistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `ticketId` int(11) DEFAULT NULL,
  `changeType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changeValue` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickethistory`
--

LOCK TABLES `zp_tickethistory` WRITE;
/*!40000 ALTER TABLE `zp_tickethistory` DISABLE KEYS */;
INSERT INTO `zp_tickethistory` VALUES (1,1,9,'type','story','2020-10-02 17:18:51'),(2,1,9,'description','<p>Look around and make yourself familiar with the system.</p>','2020-10-02 17:18:51'),(3,1,9,'status','0','2020-10-02 17:18:51'),(4,1,10,'fromDate','2020-10-05','2020-10-03 08:29:03'),(5,1,10,'toDate','2020-10-06','2020-10-03 08:29:03'),(6,1,10,'fromDate','2020-10-05','2020-10-03 08:29:04'),(7,1,10,'toDate','2020-10-06','2020-10-03 08:29:04'),(8,1,10,'fromDate','2020-09-27','2020-10-03 08:30:06'),(9,1,10,'toDate','2020-09-29','2020-10-03 08:30:06'),(10,1,11,'fromDate','2020-10-01','2020-10-03 08:30:06'),(11,1,11,'toDate','2020-11-01','2020-10-03 08:30:06'),(12,1,10,'fromDate','2020-08-27','2020-10-03 08:30:08'),(13,1,10,'toDate','2020-09-29','2020-10-03 08:30:08'),(14,1,11,'fromDate','2020-08-31','2020-10-03 08:30:08'),(15,1,11,'toDate','2020-10-01','2020-10-03 08:30:08'),(16,1,10,'fromDate','2020-08-04','2020-10-03 08:30:11'),(17,1,10,'toDate','2020-09-06','2020-10-03 08:30:11'),(18,1,11,'fromDate','2020-08-08','2020-10-03 08:30:11'),(19,1,11,'toDate','2020-09-08','2020-10-03 08:30:11'),(20,1,10,'fromDate','2020-08-04','2020-10-03 08:30:14'),(21,1,10,'toDate','2020-09-10','2020-10-03 08:30:14'),(22,1,10,'fromDate','2020-08-13','2020-10-03 08:30:16'),(23,1,10,'toDate','2020-09-19','2020-10-03 08:30:16'),(24,1,11,'fromDate','2020-08-17','2020-10-03 08:30:16'),(25,1,11,'toDate','2020-09-17','2020-10-03 08:30:16'),(26,1,10,'fromDate','2020-09-28','2020-10-03 08:30:20'),(27,1,10,'toDate','2020-11-03','2020-10-03 08:30:20'),(28,1,11,'fromDate','2020-10-02','2020-10-03 08:30:20'),(29,1,11,'toDate','2020-11-02','2020-10-03 08:30:20'),(30,1,10,'fromDate','2020-09-05','2020-10-03 08:30:22'),(31,1,10,'toDate','2020-11-03','2020-10-03 08:30:22'),(32,1,11,'fromDate','2020-09-09','2020-10-03 08:30:22'),(33,1,11,'toDate','2020-10-10','2020-10-03 08:30:22'),(34,1,10,'fromDate','2020-09-23','2020-10-03 08:30:26'),(35,1,10,'toDate','2020-11-03','2020-10-03 08:30:26'),(36,1,11,'fromDate','2020-09-27','2020-10-03 08:30:26'),(37,1,11,'toDate','2020-10-28','2020-10-03 08:30:26'),(38,1,10,'fromDate','2020-08-29','2020-10-03 08:30:27'),(39,1,10,'toDate','2020-10-10','2020-10-03 08:30:27'),(40,1,11,'fromDate','2020-09-02','2020-10-03 08:30:27'),(41,1,11,'toDate','2020-10-03','2020-10-03 08:30:27'),(42,1,11,'fromDate','2020-09-29','2020-10-03 08:30:29'),(43,1,11,'toDate','2020-10-30','2020-10-03 08:30:29'),(44,1,10,'fromDate','2020-08-24','2020-10-03 08:30:30'),(45,1,10,'toDate','2020-10-05','2020-10-03 08:30:30'),(46,1,11,'fromDate','2020-09-24','2020-10-03 08:30:30'),(47,1,11,'toDate','2020-10-25','2020-10-03 08:30:30'),(48,1,10,'fromDate','2020-09-02','2020-10-03 08:30:32'),(49,1,10,'toDate','2020-10-05','2020-10-03 08:30:32'),(50,1,11,'fromDate','2020-10-03','2020-10-03 08:30:32'),(51,1,11,'toDate','2020-11-03','2020-10-03 08:30:32'),(52,1,10,'fromDate','2020-08-30','2020-10-03 08:30:33'),(53,1,10,'toDate','2020-10-02','2020-10-03 08:30:33'),(54,1,11,'fromDate','2020-09-30','2020-10-03 08:30:33'),(55,1,11,'toDate','2020-10-31','2020-10-03 08:30:33'),(56,1,10,'fromDate','2020-08-29','2020-10-03 08:30:34'),(57,1,10,'toDate','2020-10-01','2020-10-03 08:30:34'),(58,1,11,'fromDate','2020-09-29','2020-10-03 08:30:34'),(59,1,11,'toDate','2020-10-30','2020-10-03 08:30:34'),(60,1,11,'fromDate','2020-10-02','2020-10-03 08:30:35'),(61,1,11,'toDate','2020-11-02','2020-10-03 08:30:35'),(62,1,10,'fromDate','2020-09-02','2020-10-03 08:30:37'),(63,1,10,'toDate','2020-10-02','2020-10-03 08:30:37'),(64,1,11,'fromDate','2020-10-06','2020-10-03 08:30:37'),(65,1,11,'toDate','2020-11-06','2020-10-03 08:30:37'),(66,1,11,'fromDate','2020-10-01 00:00:00','2020-10-03 08:33:44'),(67,1,11,'toDate','2020-10-31 00:00:00','2020-10-03 08:33:44'),(68,1,10,'fromDate','2020-09-01 00:00:00','2020-10-03 08:33:57'),(69,1,10,'toDate','2020-09-30 00:00:00','2020-10-03 08:33:57'),(70,1,16,'toDate','2020-08-31 00:00:00','2020-10-03 08:35:05'),(71,1,14,'fromDate','2021-01-02','2020-10-03 08:35:11'),(72,1,14,'toDate','2021-02-01','2020-10-03 08:35:11'),(73,1,15,'fromDate','2021-02-02','2020-10-03 08:35:12'),(74,1,15,'toDate','2021-03-01','2020-10-03 08:35:12'),(75,1,14,'fromDate','2021-01-01','2020-10-03 08:35:15'),(76,1,14,'toDate','2021-01-31','2020-10-03 08:35:15'),(77,1,15,'fromDate','2021-02-01','2020-10-03 08:35:15'),(78,1,15,'toDate','2021-02-28','2020-10-03 08:35:15'),(79,1,17,'type','task','2020-10-03 09:32:18'),(80,1,20,'headline','What are the popular SDN Controlers?','2020-10-03 15:32:24'),(81,1,20,'type','task','2020-10-03 15:32:24'),(82,1,19,'headline','Faul Tolerance ONOS','2020-10-04 06:31:49'),(83,1,19,'type','task','2020-10-04 06:31:49'),(84,1,19,'headline','Fault Tolerance ONOS','2020-10-04 16:43:00'),(85,1,30,'type','task','2020-10-09 07:50:36'),(86,1,30,'headline','Solutions for Fault-Tolerance in-band controler network','2020-10-09 07:51:05'),(87,1,33,'headline','Related - SDN Chaos Engineering','2020-10-23 07:58:16'),(88,1,33,'type','task','2020-10-23 07:58:16'),(89,1,32,'type','task','2020-10-23 12:12:16'),(90,1,32,'description','<p>Not entirely possible.&nbsp;<br />Have to get something small that is new.</p>','2020-10-23 12:12:16'),(91,1,41,'type','task','2020-10-29 08:32:22'),(92,1,41,'description','<p>Also check against ONOS describes it self tolerant!</p>','2020-10-29 08:32:22'),(93,1,43,'type','task','2020-11-05 14:02:51'),(94,1,43,'description','<p>Now done in their test VM with v1.15 and in own new ubuntu VM with v2.5</p>','2020-11-05 14:02:51'),(95,1,47,'type','task','2020-11-06 13:14:56'),(96,1,48,'type','task','2020-11-06 14:41:37'),(97,1,48,'description','<p>Docker Logs or via (in atomix containers) /opt/atomix/conf/atomix.log</p>','2020-11-06 14:41:37'),(98,1,51,'type','task','2020-11-06 19:16:38'),(99,1,54,'description','Also check history of relevant entries (e.g. the ones about faults)','2020-11-13 11:26:11'),(100,1,53,'type','task','2020-11-13 11:26:52'),(101,1,58,'type','task','2020-11-13 11:28:56'),(102,1,53,'headline','v1.13-v1.15 Theory Diff','2020-11-13 12:25:30'),(103,1,58,'headline','v1.13-v1.15 Practical Diff','2020-11-13 12:25:37'),(104,1,63,'type','task','2020-11-13 13:06:24'),(105,1,63,'description','<p>.0, but if that makes problem try v1.13.7. This ofcourse may make a rework of the notes mandatory.</p>','2020-11-13 13:06:24'),(106,1,54,'status','0','2020-11-13 15:01:50'),(107,1,55,'status','0','2020-11-13 15:01:54'),(108,1,54,'status','1','2020-11-13 15:02:03'),(109,1,54,'status','0','2020-11-13 18:53:27'),(110,1,62,'status','1','2020-11-15 11:54:59'),(111,1,65,'type','task','2020-11-19 07:22:50'),(112,1,65,'status','1','2020-11-19 07:22:50'),(113,1,66,'type','task','2020-11-19 09:17:20'),(114,1,66,'description','<p>Is it worth to gain Complexity and Flexbility? Was this done before?</p>','2020-11-19 09:17:20'),(115,1,62,'status','0','2020-11-19 16:45:59'),(116,1,56,'status','0','2020-11-19 16:53:08'),(117,1,57,'status','1','2020-11-19 17:06:25'),(118,1,11,'headline','Problem theoretisch gelöst ','2020-11-20 08:58:48'),(119,1,12,'headline','Problem praktisch gelöst','2020-11-20 08:59:06'),(120,1,40,'headline','Research SDN Faults & Fail Cases','2020-11-20 09:54:47'),(121,1,40,'type','task','2020-11-20 09:54:47'),(122,1,10,'status','0','2020-11-20 09:56:55'),(123,1,16,'status','0','2020-11-20 09:57:05'),(124,1,74,'type','task','2020-11-27 17:06:51'),(125,1,26,'headline','Make Template english','2020-11-29 16:00:44'),(126,1,76,'headline','Related: FMECA and Usage','2020-12-03 07:48:30'),(127,1,76,'type','task','2020-12-03 07:48:30'),(128,1,80,'status','1','2020-12-03 13:45:06'),(129,1,81,'status','1','2020-12-03 20:30:35'),(130,1,82,'status','1','2020-12-03 20:30:40'),(131,1,80,'status','0','2020-12-06 14:25:06'),(132,1,82,'status','0','2020-12-06 14:25:10'),(133,1,81,'status','0','2020-12-06 15:21:49'),(134,1,78,'type','task','2020-12-06 15:21:54'),(135,1,84,'status','0','2020-12-10 10:03:55'),(136,1,85,'status','1','2020-12-10 10:04:47'),(137,1,85,'status','2','2020-12-10 21:02:08'),(138,1,86,'status','2','2020-12-10 21:02:11'),(139,1,87,'status','2','2020-12-10 21:02:13'),(140,1,88,'status','2','2020-12-10 21:02:16'),(141,1,89,'status','4','2020-12-10 21:02:19'),(142,1,89,'status','0','2020-12-10 21:02:24'),(143,1,90,'status','2','2020-12-10 21:02:27'),(144,1,85,'status','0','2020-12-10 21:02:33'),(145,1,90,'status','0','2020-12-10 21:02:40'),(146,1,86,'status','0','2020-12-18 08:35:47'),(147,1,87,'status','0','2020-12-18 08:35:50'),(148,1,88,'status','0','2020-12-18 08:35:52'),(149,1,91,'type','task','2020-12-19 10:15:48'),(150,1,91,'description','<p>2-3 Publikationen</p>','2020-12-19 10:15:48'),(151,1,92,'type','task','2020-12-19 10:18:08'),(152,1,92,'description','<p>1-2 Publikationen f&uuml;r Ideen f&uuml;r Modellierung des Themas</p>','2020-12-19 10:18:08'),(153,1,40,'headline','Find SDN&Raft faults,errors,failures and their probability','2020-12-19 10:26:28'),(154,1,91,'description','<p>2-3 Publikationen<br />GSPN: Generalized and Great</p>','2020-12-19 10:28:24'),(155,1,11,'status','0','2021-01-14 07:41:12'),(156,1,15,'fromDate','2021-03-01','2021-01-14 07:41:48'),(157,1,15,'toDate','2021-03-29','2021-01-14 07:41:48'),(158,1,14,'fromDate','2021-01-11','2021-01-14 07:41:50'),(159,1,14,'toDate','2021-02-10','2021-01-14 07:41:50'),(160,1,15,'fromDate','2021-03-11','2021-01-14 07:41:50'),(161,1,15,'toDate','2021-04-08','2021-01-14 07:41:50'),(162,1,15,'fromDate','2021-02-10','2021-01-14 07:41:52'),(163,1,15,'toDate','2021-03-09','2021-01-14 07:41:52'),(164,1,15,'fromDate','2021-02-11','2021-01-14 07:41:53'),(165,1,15,'toDate','2021-03-10','2021-01-14 07:41:53'),(166,1,14,'fromDate','2021-02-01','2021-01-14 07:41:56'),(167,1,14,'toDate','2021-03-03','2021-01-14 07:41:56'),(168,1,15,'fromDate','2021-03-04','2021-01-14 07:41:56'),(169,1,15,'toDate','2021-04-01','2021-01-14 07:41:56'),(170,1,15,'fromDate','2021-03-02','2021-01-14 07:41:57'),(171,1,15,'toDate','2021-03-30','2021-01-14 07:41:57'),(172,1,14,'fromDate','2021-02-01','2021-01-14 07:42:00'),(173,1,14,'toDate','2021-03-02','2021-01-14 07:42:00'),(174,1,14,'fromDate','2021-02-01','2021-01-14 07:42:01'),(175,1,14,'toDate','2021-03-02','2021-01-14 07:42:01'),(176,1,14,'fromDate','2021-01-27','2021-01-14 07:42:03'),(177,1,14,'toDate','2021-03-02','2021-01-14 07:42:03'),(178,1,15,'fromDate','2021-02-25','2021-01-14 07:42:03'),(179,1,15,'toDate','2021-03-24','2021-01-14 07:42:03'),(180,1,15,'fromDate','2021-02-23','2021-01-14 07:42:04'),(181,1,15,'toDate','2021-03-22','2021-01-14 07:42:04'),(182,1,14,'fromDate','2021-01-25','2021-01-14 07:42:04'),(183,1,14,'toDate','2021-02-28','2021-01-14 07:42:04'),(184,1,15,'fromDate','2021-03-01','2021-01-14 07:42:06'),(185,1,15,'toDate','2021-03-29','2021-01-14 07:42:06'),(186,1,15,'fromDate','2021-03-01','2021-01-14 07:42:07'),(187,1,15,'toDate','2021-04-01','2021-01-14 07:42:07'),(188,1,13,'fromDate','2021-02-01','2021-01-14 07:42:17'),(189,1,13,'toDate','2021-03-03','2021-01-14 07:42:17'),(190,1,14,'fromDate','2021-03-28','2021-01-14 07:42:17'),(191,1,14,'toDate','2021-05-02','2021-01-14 07:42:17'),(192,1,15,'fromDate','2021-05-02','2021-01-14 07:42:17'),(193,1,15,'toDate','2021-06-02','2021-01-14 07:42:17'),(194,1,15,'fromDate','2021-02-19','2021-01-14 07:42:19'),(195,1,15,'toDate','2021-03-21','2021-01-14 07:42:19'),(196,1,14,'fromDate','2021-02-02','2021-01-14 07:42:19'),(197,1,14,'toDate','2021-03-08','2021-01-14 07:42:19'),(198,1,15,'fromDate','2021-02-03','2021-01-14 07:42:22'),(199,1,15,'toDate','2021-03-05','2021-01-14 07:42:22'),(200,1,14,'fromDate','2021-02-02','2021-01-14 07:42:22'),(201,1,14,'toDate','2021-03-08','2021-01-14 07:42:22'),(202,1,15,'fromDate','2021-02-24','2021-01-14 07:42:23'),(203,1,15,'toDate','2021-03-26','2021-01-14 07:42:23'),(204,1,11,'fromDate','2020-10-01','2021-01-14 07:42:30'),(205,1,11,'toDate','2020-12-01','2021-01-14 07:42:30'),(206,1,12,'fromDate','2020-11-01','2021-01-14 07:42:35'),(207,1,12,'toDate','2020-12-29','2021-01-14 07:42:35'),(208,1,12,'fromDate','2020-12-01','2021-01-14 07:42:38'),(209,1,12,'toDate','2021-01-28','2021-01-14 07:42:38'),(210,1,14,'fromDate','2021-03-04','2021-01-14 07:42:38'),(211,1,14,'toDate','2021-04-08','2021-01-14 07:42:38'),(212,1,13,'fromDate','2021-03-03','2021-01-14 07:42:38'),(213,1,13,'toDate','2021-04-03','2021-01-14 07:42:38'),(214,1,15,'fromDate','2021-03-26','2021-01-14 07:42:38'),(215,1,15,'toDate','2021-04-26','2021-01-14 07:42:38'),(216,1,14,'fromDate','2021-03-09','2021-01-14 07:42:43'),(217,1,14,'toDate','2021-04-13','2021-01-14 07:42:43'),(218,1,12,'fromDate','2020-12-06','2021-01-14 07:42:43'),(219,1,12,'toDate','2021-02-02','2021-01-14 07:42:43'),(220,1,13,'fromDate','2021-03-08','2021-01-14 07:42:43'),(221,1,13,'toDate','2021-04-08','2021-01-14 07:42:43'),(222,1,15,'fromDate','2021-03-31','2021-01-14 07:42:43'),(223,1,15,'toDate','2021-05-01','2021-01-14 07:42:43'),(224,1,11,'fromDate','2020-10-01','2021-01-14 07:42:44'),(225,1,11,'toDate','2020-12-12','2021-01-14 07:42:44'),(226,1,13,'fromDate','2021-03-14','2021-01-14 07:42:45'),(227,1,13,'toDate','2021-04-14','2021-01-14 07:42:45'),(228,1,12,'fromDate','2020-12-12','2021-01-14 07:42:45'),(229,1,12,'toDate','2021-02-08','2021-01-14 07:42:45'),(230,1,15,'fromDate','2021-04-06','2021-01-14 07:42:45'),(231,1,15,'toDate','2021-05-07','2021-01-14 07:42:45'),(232,1,14,'fromDate','2021-03-15','2021-01-14 07:42:45'),(233,1,14,'toDate','2021-04-19','2021-01-14 07:42:45'),(234,1,12,'fromDate','2020-12-12','2021-01-14 07:42:48'),(235,1,12,'toDate','2021-01-23','2021-01-14 07:42:48'),(236,1,12,'fromDate','2020-12-12','2021-01-14 07:42:55'),(237,1,12,'toDate','2021-02-11','2021-01-14 07:42:56'),(238,1,13,'fromDate','2020-12-12','2021-01-14 07:42:58'),(239,1,13,'toDate','2021-01-11','2021-01-14 07:42:58'),(240,1,15,'fromDate','2020-12-28','2021-01-14 07:42:58'),(241,1,15,'toDate','2021-01-27','2021-01-14 07:42:58'),(242,1,14,'fromDate','2020-12-12','2021-01-14 07:42:58'),(243,1,14,'toDate','2021-01-15','2021-01-14 07:42:58'),(244,1,13,'fromDate','2021-02-01','2021-01-14 07:42:59'),(245,1,13,'toDate','2021-03-03','2021-01-14 07:42:59'),(246,1,14,'fromDate','2021-02-01','2021-01-14 07:42:59'),(247,1,14,'toDate','2021-03-07','2021-01-14 07:42:59'),(248,1,15,'fromDate','2021-02-17','2021-01-14 07:42:59'),(249,1,15,'toDate','2021-03-19','2021-01-14 07:42:59'),(250,1,14,'fromDate','2021-02-01','2021-01-14 07:43:00'),(251,1,14,'toDate','2021-03-07','2021-01-14 07:43:00'),(252,1,15,'fromDate','2021-02-03','2021-01-14 07:43:00'),(253,1,15,'toDate','2021-03-05','2021-01-14 07:43:00'),(254,1,14,'fromDate','2021-02-01','2021-01-14 07:43:01'),(255,1,14,'toDate','2021-03-07','2021-01-14 07:43:01'),(256,1,15,'fromDate','2021-02-01','2021-01-14 07:43:01'),(257,1,15,'toDate','2021-03-03','2021-01-14 07:43:02'),(258,1,14,'fromDate','2021-02-08','2021-01-14 07:43:02'),(259,1,14,'toDate','2021-03-14','2021-01-14 07:43:02'),(260,1,15,'fromDate','2021-02-08','2021-01-14 07:43:03'),(261,1,15,'toDate','2021-03-10','2021-01-14 07:43:03'),(262,1,14,'fromDate','2021-02-02','2021-01-14 07:43:04'),(263,1,14,'toDate','2021-03-08','2021-01-14 07:43:04'),(264,1,15,'fromDate','2021-02-02','2021-01-14 07:43:04'),(265,1,15,'toDate','2021-03-04','2021-01-14 07:43:04'),(266,1,14,'fromDate','2020-12-15','2021-01-14 07:43:48'),(267,1,14,'toDate','2021-01-18','2021-01-14 07:43:48'),(268,1,15,'fromDate','2020-12-15','2021-01-14 07:43:48'),(269,1,15,'toDate','2021-01-14','2021-01-14 07:43:48'),(270,1,15,'fromDate','2020-12-14','2021-01-14 07:43:49'),(271,1,15,'toDate','2021-01-13','2021-01-14 07:43:49'),(272,1,14,'fromDate','2020-12-14','2021-01-14 07:43:49'),(273,1,14,'toDate','2021-01-17','2021-01-14 07:43:49'),(274,1,14,'fromDate','2020-12-14','2021-01-14 07:43:52'),(275,1,14,'toDate','2021-02-28','2021-01-14 07:43:52'),(276,1,13,'fromDate','2021-02-01','2021-01-14 07:43:54'),(277,1,13,'toDate','2021-03-02','2021-01-14 07:43:54'),(278,1,12,'fromDate','2020-12-12','2021-01-14 07:44:00'),(279,1,12,'toDate','2021-02-28','2021-01-14 07:44:00'),(280,1,13,'fromDate','2021-01-30','2021-01-14 07:44:02'),(281,1,13,'toDate','2021-02-28','2021-01-14 07:44:02'),(282,1,15,'fromDate','2021-03-01','2021-01-14 07:44:07'),(283,1,15,'toDate','2021-04-01','2021-01-14 07:44:07'),(284,1,107,'headline','Gather Failure probabilities','2021-01-15 09:23:44'),(285,1,107,'type','task','2021-01-15 09:23:44'),(286,1,109,'headline','Related: Upgrade to increase Reliab./Avail.','2021-01-15 09:27:50'),(287,1,109,'type','task','2021-01-15 09:27:50'),(288,1,109,'description','<p>Must this be justified?</p>','2021-01-15 09:27:50'),(289,1,100,'type','task','2021-01-15 09:37:44'),(290,1,100,'description','<p>Only if we want to model Atomix / old ONOS upgradeability</p>','2021-01-15 09:37:44'),(291,1,106,'headline','Write first idea of Introduction','2021-01-15 12:08:16'),(292,1,106,'type','task','2021-01-15 12:08:16'),(293,1,101,'type','task','2021-01-15 12:22:25'),(294,1,101,'description','<p>Its Raft</p>','2021-01-15 12:22:25'),(295,1,75,'headline','Write Basics: Consensus','2021-01-15 12:37:19'),(296,1,75,'type','task','2021-01-15 12:37:19'),(297,1,110,'type','task','2021-01-15 12:37:21'),(298,1,110,'description','<p>- Raft (not RAFT,raft)</p>\r\n<p>- an SDN (not a SDN, always handle shortcut as word start starts with vowel)</p>\r\n<p>- citations (with single quote ','2021-01-15 12:37:21'),(299,1,100,'description','<p>For no neglect, but maybe needed later on to extend work / make it more realistic.</p>','2021-01-15 15:22:16'),(300,1,104,'headline','Justify Model','2021-01-15 16:04:38'),(301,1,104,'type','task','2021-01-15 16:04:38'),(302,1,104,'description','<p>For each included and excluded element of the model!</p>\r\n<p>Element = Object or Object Behaviour</p>','2021-01-15 16:04:38'),(303,1,104,'type','story','2021-01-15 16:06:53'),(304,1,104,'type','task','2021-01-15 16:07:03');
/*!40000 ALTER TABLE `zp_tickethistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickets`
--

DROP TABLE IF EXISTS `zp_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `acceptanceCriteria` text COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT NULL,
  `dateToFinish` datetime DEFAULT NULL,
  `priority` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `os` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependingTicketId` int(100) DEFAULT NULL,
  `editFrom` datetime DEFAULT NULL,
  `editTo` datetime DEFAULT NULL,
  `editorId` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planHours` float DEFAULT NULL,
  `hourRemaining` float DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production` int(1) DEFAULT '0',
  `staging` int(1) DEFAULT '0',
  `storypoints` float DEFAULT NULL,
  `sprint` int(100) DEFAULT NULL,
  `sortindex` bigint(20) DEFAULT NULL,
  `kanbanSortIndex` bigint(20) DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milestoneid` int(11) DEFAULT NULL,
  `leancanvasitemid` int(11) DEFAULT NULL,
  `retrospectiveid` int(11) DEFAULT NULL,
  `ideaid` int(11) DEFAULT NULL,
  `zp_ticketscol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectUserId` (`projectId`,`userId`),
  KEY `StatusSprint` (`status`,`sprint`),
  KEY `Sorting` (`sortindex`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickets`
--

LOCK TABLES `zp_tickets` WRITE;
/*!40000 ALTER TABLE `zp_tickets` DISABLE KEYS */;
INSERT INTO `zp_tickets` VALUES (9,3,'Getting Started with Leantime','<p>Look around and make yourself familiar with the system.</p>','','2015-11-30 00:00:00','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,'',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'story',0,0,0,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(10,4,'Exaktes Thema Definiert','','','2020-10-03 01:28:49','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,16,'2020-09-01 00:00:00','2020-09-30 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#064779',NULL,NULL,NULL,NULL,NULL),(11,4,'Problem theoretisch gelöst ','','','2020-10-03 01:29:59','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'2020-10-01 00:00:00','2020-12-12 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#1B76BB',NULL,NULL,NULL,NULL,NULL),(12,4,'Problem praktisch gelöst','','','2020-10-03 01:30:56','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'2020-12-12 00:00:00','2021-02-28 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#00814A',NULL,NULL,NULL,NULL,NULL),(13,4,'Testing','','','2020-10-03 01:31:18','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'2021-01-30 00:00:00','2021-02-28 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#35CB8B',NULL,NULL,NULL,NULL,NULL),(14,4,'Notizen sammen und Masterarbeit erstellen','','','2020-10-03 01:31:59','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'2020-12-14 00:00:00','2021-02-28 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#F3B600',NULL,NULL,NULL,NULL,NULL),(15,4,'Prepare Defense Presentation','','','2020-10-03 01:33:25','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'2021-03-01 00:00:00','2021-04-01 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#FFD042',NULL,NULL,NULL,NULL,NULL),(16,4,'Ungefähres Thema finden','','','2020-10-03 01:34:43','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2020-07-19 00:00:00','2020-08-31 00:00:00','1',0,0,'milestone',0,0,0,0,0,0,'#BC3600',NULL,NULL,NULL,NULL,NULL),(18,4,'Create Tickets','','','2020-10-03 08:30:05','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,2,0,3200,'',NULL,NULL,NULL,NULL,NULL),(20,4,'What are the popular SDN Controlers?','','','2020-10-03 08:31:18','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,2,0,4400,'',NULL,NULL,NULL,NULL,NULL),(23,4,'Add latex documents','','','2020-10-04 00:22:29','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,1,2,0,4300,'',NULL,NULL,NULL,NULL,NULL),(24,4,'Fault tolerance in SDN','<p>ist praktisch Obermenge von \"Fault tolerance in ONOS\" / \"... Open Daylight\"</p>','','2020-10-04 07:51:36','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,5,2,0,4100,'',NULL,NULL,NULL,NULL,NULL),(26,4,'Make Template english','','','2020-10-04 08:59:32','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,1,0,0,600,'',NULL,NULL,NULL,NULL,NULL),(27,4,'Read','<p>https://thenewstack.io/opendaylight-onos-sdn-really-need-two-controllers/</p>','','2020-10-04 09:25:15','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,1,2,0,4600,'',NULL,NULL,NULL,NULL,NULL),(28,4,'Define crashes for controller comparison','','','2020-10-04 09:41:27','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,3,2,0,4900,'',NULL,NULL,NULL,NULL,NULL),(29,4,'Compare controllers with defined crashes','','','2020-10-04 09:41:58','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,2,2,0,4800,'',NULL,NULL,NULL,NULL,NULL),(30,4,'Solutions for Fault-Tolerance in-band controler network','','','2020-10-09 00:50:18','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,2,0,4700,'',NULL,NULL,NULL,NULL,NULL),(31,4,'Setup Spreadsheet with current Problems&solutions','','','2020-10-16 05:03:19','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,2,0,4200,'',NULL,NULL,NULL,NULL,NULL),(32,4,'Think about a problem,solution combination that is not present yet','<p>Not entirely possible.&nbsp;<br />Have to get something small that is new.</p>','','2020-10-16 05:04:22','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,8,2,0,3300,'',NULL,NULL,NULL,NULL,NULL),(37,4,'Set Interset Level of each Topic','','','2020-10-23 09:21:25','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,2,0,3900,'',NULL,NULL,NULL,NULL,NULL),(38,4,'Set Easiness Level of each Topic','','','2020-10-23 09:21:32','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,2,0,3600,'',NULL,NULL,NULL,NULL,NULL),(39,4,'Set Promise Level of each Topic','','','2020-10-23 09:21:38','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,2,0,3500,'',NULL,NULL,NULL,NULL,NULL),(40,4,'Find SDN&Raft faults,errors,failures and their probability','','','2020-10-29 01:26:27','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,3,0,800,'',NULL,NULL,NULL,NULL,NULL),(41,4,'Check which and how ONOS deals with these faults','<p>Also check against ONOS describes it self tolerant!</p>','','2020-10-29 01:31:16','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,3,0,1500,'',NULL,NULL,NULL,NULL,NULL),(42,4,'Select non-handled Faults/Ideas as topic','','','2020-10-29 01:34:07','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,3,0,1300,'',NULL,NULL,NULL,NULL,NULL),(43,4,'Creating ONOS Test VM','<p>Now done in their test VM with v1.15 and in own new ubuntu VM with v2.5</p>','','2020-11-01 09:08:14','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,3,0,4500,'',NULL,NULL,NULL,NULL,NULL),(44,4,'create CrashP05 cluster','','','2020-11-05 06:06:24','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,3,0,3000,'',NULL,NULL,NULL,NULL,NULL),(45,4,'create CrashP06 cluster','','','2020-11-05 06:06:42','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,3,0,2700,'',NULL,NULL,NULL,NULL,NULL),(46,4,'How to log a ONOS/Mininet/OVS cluster?','','','2020-11-05 06:07:09','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,3,0,3400,'',NULL,NULL,NULL,NULL,NULL),(47,4,'How to stop ATOMIX links?','','','2020-11-05 06:07:30','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,3,0,3800,'via docker stop',NULL,NULL,NULL,NULL,NULL),(48,4,'Read in logs how cluster reacted to ATOMIX link down','<p>Docker Logs or via (in atomix containers) /opt/atomix/conf/atomix.log</p>','','2020-11-05 06:08:08','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,3,0,3100,'',NULL,NULL,NULL,NULL,NULL),(49,4,'how to create Cluster?','','','2020-11-05 06:09:23','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,3,0,4000,'',NULL,NULL,NULL,NULL,NULL),(50,4,'Adjust Failures to out-of-band control network','','','2020-11-05 09:19:18','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,3,0,3700,'',NULL,NULL,NULL,NULL,NULL),(51,4,'Prepare scripts for upcoming evaluation','','','2020-11-07 23:31:29','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,3,0,2900,'',NULL,NULL,NULL,NULL,NULL),(52,4,'Test Pumba ','','','2020-11-12 07:53:11','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,2,0,2500,'',NULL,NULL,NULL,NULL,NULL),(53,4,'v1.13-v1.15 Theory Diff','','','2020-11-13 03:24:29','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,4,0,2300,'',NULL,NULL,NULL,NULL,NULL),(54,4,'Check ONOS Wiki','','','2020-11-13 03:25:32','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,53,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(55,4,'Check ONOS Release Notes','','','2020-11-13 03:25:38','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,53,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(56,4,'Check Forum / Mailing List','','','2020-11-13 03:26:26','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,53,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(58,4,'v1.13-v1.15 Practical Diff','','','2020-11-13 03:27:05','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,5,4,0,1600,'',NULL,NULL,NULL,NULL,NULL),(59,4,'Get relevant fault cases','From Research papers, Books, Publications, Surveys','','2020-11-13 03:27:38','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,58,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(60,4,'Test relevant fault cases','on v1.13 and v1.14','','2020-11-13 03:27:55','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,58,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(61,4,'Prepare a envrionment for fault cases execution','','','2020-11-13 03:28:14','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,58,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(62,4,'Check Diff in Code','for now concentrate on fault tolerance','','2020-11-13 03:29:22','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,53,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(63,4,'Compare which minor version of v1.13 and v1.15?','<p>.0, but if that makes problem try v1.13.7. This ofcourse may make a rework of the notes mandatory.</p>','','2020-11-13 04:54:18','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,1,4,0,2800,'',NULL,NULL,NULL,NULL,NULL),(64,4,'Fix Time of Leantime','','','2020-11-18 23:11:20','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'bug',0,0,2,0,0,1400,'',NULL,NULL,NULL,NULL,NULL),(65,4,'Prepare First Presentation','','','2020-11-18 23:22:23','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,4,0,2600,'',NULL,NULL,NULL,NULL,NULL),(66,4,'Research Architecture Change','<p>Is it worth to gain Complexity and Flexbility? Was this done before?</p>','','2020-11-19 01:16:49','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,4,0,2000,'',NULL,NULL,NULL,NULL,NULL),(67,4,'Specified reasearch topic & first title','','','2020-11-20 00:54:44','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,4,0,2400,'',NULL,NULL,NULL,NULL,NULL),(68,4,'Gather existing SDN/Fault Sources','','','2020-11-20 01:56:36','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,4,0,2200,'',NULL,NULL,NULL,NULL,NULL),(69,4,'Create PDF pipeline','','','2020-11-20 12:28:43','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0,0,'task',0,0,2,4,0,2100,'',NULL,NULL,NULL,NULL,NULL),(70,4,'Write Basics: ONOS','','','2020-11-27 00:19:21','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,4,0,1700,'',NULL,NULL,NULL,NULL,NULL),(71,4,'Write Basics: SDNs','','','2020-11-27 00:19:36','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,4,0,1600,'',NULL,NULL,NULL,NULL,NULL),(72,4,'Write Basics: Availability/Dependability','','','2020-11-27 00:19:57','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,4,0,1800,'',NULL,NULL,NULL,NULL,NULL),(73,4,'Read how others tackled availability of SDNs','','','2020-11-27 00:20:58','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,4,0,1900,'',NULL,NULL,NULL,NULL,NULL),(74,4,'Write Related: Analytical Approach','','','2020-11-27 09:06:32','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,4,0,900,'',NULL,NULL,NULL,NULL,NULL),(75,4,'Write Basics: Consensus','','','2020-11-29 07:15:07','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,0,0,100,'',NULL,NULL,NULL,NULL,NULL),(76,4,'Related: FMECA and Usage','','','2020-12-02 23:48:11','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,1100,'',NULL,NULL,NULL,NULL,NULL),(77,4,'Related: FTA and Usage','','','2020-12-02 23:48:22','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,1200,'',NULL,NULL,NULL,NULL,NULL),(78,4,'Create Presentation for KHB','','','2020-12-02 23:48:59','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,1500,'',NULL,NULL,NULL,NULL,NULL),(79,4,'Add Glossar','','','2020-12-03 05:20:32','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,1300,'',NULL,NULL,NULL,NULL,NULL),(80,4,'What is a \'Model\'?','','','2020-12-03 05:44:37','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,78,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(81,4,'What are Modellanguages?','','','2020-12-03 05:44:49','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,78,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(82,4,'What are my Analyseansätze?','','','2020-12-03 05:45:03','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,78,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(83,4,'Write Expose','','','2020-12-10 00:58:38','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,1400,'',NULL,NULL,NULL,NULL,NULL),(84,4,'What is a Expose?','Content, Structure\r\nLength = 2 Pages DinA4','','2020-12-10 00:59:21','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(85,4,'Write Motivation','','','2020-12-10 02:04:01','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(86,4,'Write Research Question','','','2020-12-10 02:04:08','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(87,4,'Write Subject of Interest','','','2020-12-10 02:04:18','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(88,4,'Write Procedure','','','2020-12-10 02:04:25','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(89,4,'Write Time Management','','','2020-12-10 02:04:30','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(90,4,'Write Starting Literatur','','','2020-12-10 02:04:35','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,83,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(91,4,'Write Related: Use of (G)SPN with Architecture','<p>2-3 Publikationen<br />GSPN: Generalized and Great</p>','','2020-12-19 02:14:16','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,600,'',NULL,NULL,NULL,NULL,NULL),(92,4,'Write Related: Reliability of Raft/Consensus','<p>1-2 Publikationen f&uuml;r Ideen f&uuml;r Modellierung des Themas</p>','','2020-12-19 02:16:55','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,700,'',NULL,NULL,NULL,NULL,NULL),(93,4,'Write Related: Reliability of SDNs','','','2020-12-19 02:19:14','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,800,'',NULL,NULL,NULL,NULL,NULL),(94,4,'Model first idea of model','','','2020-12-19 02:26:46','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,1200,'',NULL,NULL,NULL,NULL,NULL),(95,4,'Send Anmeldung (Email and Letter)','','','2021-01-06 23:03:33','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,0,0,1100,'',NULL,NULL,NULL,NULL,NULL),(96,4,'Basic: Fit to our context, strip everything else','','','2021-01-09 04:21:09','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,700,'',NULL,NULL,NULL,NULL,NULL),(97,4,'Related Work: Concentrate content ','','','2021-01-09 07:32:42','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,500,'',NULL,NULL,NULL,NULL,NULL),(98,4,'Citations: add [...] every where not a full sentence was cited!','','','2021-01-10 05:36:05','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,200,'',NULL,NULL,NULL,NULL,NULL),(99,4,'Fix \'a SDN\' to \'an SDN\'','','','2021-01-10 05:49:55','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,0,0,300,'',NULL,NULL,NULL,NULL,NULL),(100,4,'Insert Atomix Upgrade to model','<p>For no neglect, but maybe needed later on to extend work / make it more realistic.</p>','','2021-01-14 01:34:26','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,0,0,200,'',NULL,NULL,NULL,NULL,NULL),(101,4,'Raft or RAFT?','<p>Its Raft</p>','','2021-01-14 01:36:32','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,1,0,0,400,'',NULL,NULL,NULL,NULL,NULL),(102,4,'Justify (G)SPN','','','2021-01-14 23:07:59','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,900,'',NULL,NULL,NULL,NULL,NULL),(103,4,'Justify GreatSPN','','','2021-01-14 23:08:12','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,1000,'',NULL,NULL,NULL,NULL,NULL),(104,4,'Justify Model','<p>For each included and excluded element of the model!</p>\r\n<p>Element = Object or Object Behaviour</p>','','2021-01-14 23:08:32','0000-00-00 00:00:00',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(105,4,'Create final Model','','','2021-01-14 23:08:56','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,3,0,0,400,'',NULL,NULL,NULL,NULL,NULL),(106,4,'Write first idea of Introduction','','','2021-01-14 23:13:10','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,500,'',NULL,NULL,NULL,NULL,NULL),(107,4,'Gather Failure probabilities','','','2021-01-14 23:13:32','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(108,4,'Before \'\\ref\' write word big (e.g. Chaper, Figure)','','','2021-01-14 23:22:12','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,1,0,0,100,'',NULL,NULL,NULL,NULL,NULL),(109,4,'Related: Upgrade to increase Reliab./Avail.','<p>Must this be justified?</p>','','2021-01-15 01:27:19','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,300,'',NULL,NULL,NULL,NULL,NULL),(110,4,'At last check some stuff','<p>- Raft (not RAFT,raft)</p>\r\n<p>- an SDN (not a SDN, always handle shortcut as word start starts with vowel)</p>\r\n<p>- citations (with single quote \') must have [...] if not full sentence was cited!</p>\r\n<p>- Big words before \\ref (e.g. Chapter / Figure)</p>','','2021-01-15 04:24:33','0000-00-00 00:00:00',NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,1000,'',NULL,NULL,NULL,NULL,NULL),(111,4,'Write first Idea of model','','','2021-01-15 05:35:25','0000-00-00 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'Task',0,0,2,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(112,4,'List all model objects','','','2021-01-15 08:04:58','0000-00-00 00:00:00',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,104,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(113,4,'List all model behaviours','','','2021-01-15 08:05:07','0000-00-00 00:00:00',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,104,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(114,4,'Argue why object is in-/excluded','','','2021-01-15 08:05:54','0000-00-00 00:00:00',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,104,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL),(115,4,'Argue why behaviour is in-/excluded','','','2021-01-15 08:06:03','0000-00-00 00:00:00',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,104,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `zp_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_timesheets`
--

DROP TABLE IF EXISTS `zp_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_timesheets` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `ticketId` int(11) DEFAULT NULL,
  `workDate` datetime DEFAULT NULL,
  `hours` float DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `kind` varchar(175) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoicedEmpl` int(2) DEFAULT NULL,
  `invoicedComp` int(2) DEFAULT NULL,
  `invoicedEmplDate` datetime DEFAULT NULL,
  `invoicedCompDate` datetime DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique` (`userId`,`ticketId`,`workDate`,`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_timesheets`
--

LOCK TABLES `zp_timesheets` WRITE;
/*!40000 ALTER TABLE `zp_timesheets` DISABLE KEYS */;
INSERT INTO `zp_timesheets` VALUES (2,1,0,'2020-10-07 00:00:00',0,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(3,1,0,'2020-10-08 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(4,1,0,'2020-10-09 00:00:00',7,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(5,1,0,'2020-10-10 00:00:00',4,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(6,1,0,'2020-10-11 00:00:00',4,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(7,1,0,'2020-10-15 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(8,1,0,'2020-10-16 00:00:00',7.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(9,1,0,'2020-10-18 00:00:00',4,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(10,1,0,'2020-10-20 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(11,1,0,'2020-10-22 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(12,1,0,'2020-10-23 00:00:00',4,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(13,1,0,'2020-10-24 00:00:00',2,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(14,1,0,'2020-10-25 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(15,1,0,'2020-11-05 00:00:00',7.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(16,1,0,'2020-11-06 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(17,1,0,'2020-11-07 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(18,1,0,'2020-11-08 00:00:00',6.75,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(19,1,0,'2020-11-10 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(20,1,0,'2020-11-11 00:00:00',1.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(21,1,0,'2020-11-12 00:00:00',7,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(22,1,0,'2020-11-13 00:00:00',8.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(23,1,0,'2020-11-14 00:00:00',2,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(24,1,0,'2020-11-15 00:00:00',5.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(25,1,0,'2020-11-17 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(26,1,0,'2020-11-18 00:00:00',2,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(27,1,0,'2020-11-19 00:00:00',6,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(28,1,0,'2020-11-20 00:00:00',5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(29,1,0,'2020-11-21 00:00:00',4.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(30,1,0,'2020-11-22 00:00:00',5.75,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(31,1,0,'2020-11-25 00:00:00',1.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(32,1,0,'2020-11-26 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(33,1,0,'2020-11-27 00:00:00',6.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(34,1,0,'2020-11-28 00:00:00',4.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(35,1,0,'2020-11-29 00:00:00',3.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(36,1,0,'2020-12-01 00:00:00',1,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(37,1,0,'2020-12-02 00:00:00',2,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(38,1,0,'2020-12-03 00:00:00',8.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(39,1,0,'2020-12-04 00:00:00',8.75,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(40,1,0,'2020-12-05 00:00:00',5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(41,1,0,'2020-12-06 00:00:00',2.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(42,1,0,'2020-12-07 00:00:00',2,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(43,1,0,'2020-12-08 00:00:00',0.75,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(44,1,0,'2020-12-10 00:00:00',6.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(45,1,0,'2020-12-09 00:00:00',0.75,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(46,1,0,'2020-12-11 00:00:00',3,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(47,1,0,'2020-12-12 00:00:00',7,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(48,1,0,'2020-12-13 00:00:00',5.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(49,1,0,'2020-12-17 00:00:00',3.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(50,1,0,'2020-12-18 00:00:00',5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(51,1,0,'2020-12-19 00:00:00',6.25,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(52,1,0,'2021-01-01 00:00:00',1.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(53,1,0,'2021-01-06 00:00:00',0,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(54,1,0,'2021-01-07 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(55,1,0,'2021-01-08 00:00:00',6.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(56,1,0,'2021-01-09 00:00:00',3.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(57,1,0,'2021-01-10 00:00:00',3.5,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(58,1,0,'2021-01-13 00:00:00',0,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(59,1,0,'2021-01-14 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0'),(60,1,0,'2021-01-15 00:00:00',8,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `zp_timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_user`
--

DROP TABLE IF EXISTS `zp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profileId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastlogin` datetime DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `expires` datetime DEFAULT NULL,
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wage` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `clientId` int(11) DEFAULT NULL,
  `notifications` int(2) DEFAULT NULL,
  `pwReset` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwResetExpiration` datetime DEFAULT NULL,
  `pwResetCount` int(5) DEFAULT NULL,
  `forcePwReset` tinyint(4) DEFAULT NULL,
  `lastpwd_change` datetime DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `twoFAEnabled` tinyint(1) DEFAULT '0',
  `twoFASecret` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_user`
--

LOCK TABLES `zp_user` WRITE;
/*!40000 ALTER TABLE `zp_user` DISABLE KEYS */;
INSERT INTO `zp_user` VALUES (1,'a@b.de','$2y$10$YGE6dbmCD0oo1lMdnAhz9uRj4trE4rZcgNoe86OearwpwZdHS9oMm','Hape','Müller','','3','2021-01-15 16:07:28','a',NULL,'50','e490d7c9b329b675d2c3e03cf08e7bf660f7f784-fdc8d53b32939fdac04fab9c1707f4b01b947d9e','1610726848',0,0,NULL,0,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','a:2:{s:6:\"modals\";a:11:{s:9:\"dashboard\";i:1;s:12:\"showProjects\";i:1;s:10:\"newProject\";s:1:\"1\";s:11:\"showClients\";s:1:\"1\";s:14:\"projectSuccess\";s:1:\"1\";s:7:\"roadmap\";i:1;s:6:\"kanban\";i:1;s:7:\"backlog\";i:1;s:16:\"simpleLeanCanvas\";s:1:\"1\";s:12:\"mytimesheets\";s:1:\"1\";s:14:\"retrospectives\";s:1:\"1\";}s:5:\"views\";a:1:{s:7:\"roadmap\";s:5:\"Month\";}}',0,NULL,'2020-10-02 17:16:37'),(2,'b@b.de','$2y$10$DEKC69FTUXpktfZNGyAq6efgv7xW.K7H5wHfyuqFOSvosyGPwJQI6','Lin','Mom','','','2021-01-08 07:01:12','A',NULL,'40','','1610089272',NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `zp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_wiki`
--

DROP TABLE IF EXISTS `zp_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `projectId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_wiki`
--

LOCK TABLES `zp_wiki` WRITE;
/*!40000 ALTER TABLE `zp_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_wiki_articles`
--

DROP TABLE IF EXISTS `zp_wiki_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_wiki_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headline` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `authorId` int(255) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_wiki_articles`
--

LOCK TABLES `zp_wiki_articles` WRITE;
/*!40000 ALTER TABLE `zp_wiki_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_wiki_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_wiki_categories`
--

DROP TABLE IF EXISTS `zp_wiki_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_wiki_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_wiki_categories`
--

LOCK TABLES `zp_wiki_categories` WRITE;
/*!40000 ALTER TABLE `zp_wiki_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_wiki_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_wiki_comments`
--

DROP TABLE IF EXISTS `zp_wiki_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_wiki_comments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci,
  `userId` int(255) DEFAULT NULL,
  `articleId` int(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `commentParent` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_wiki_comments`
--

LOCK TABLES `zp_wiki_comments` WRITE;
/*!40000 ALTER TABLE `zp_wiki_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_wiki_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-15 16:20:10
