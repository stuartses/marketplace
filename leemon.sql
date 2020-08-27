-- MySQL dump 10.13  Distrib 5.7.31, for Linux (i686)
--
-- Host: localhost    Database: leemon
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add customers',8,'add_customers'),(30,'Can change customers',8,'change_customers'),(31,'Can delete customers',8,'delete_customers'),(32,'Can view customers',8,'view_customers'),(33,'Can add image',9,'add_image'),(34,'Can change image',9,'change_image'),(35,'Can delete image',9,'delete_image'),(36,'Can view image',9,'view_image'),(37,'Can add purchases',10,'add_purchases'),(38,'Can change purchases',10,'change_purchases'),(39,'Can delete purchases',10,'delete_purchases'),(40,'Can view purchases',10,'view_purchases'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$NJ82kDLa1jnu$uOyqHj4NtAbtM10My97Y2rRcckgu3SeKfQGPdx3o4MI=','2020-08-25 00:53:04.653503',1,'leemon','','','',1,1,'2020-08-24 23:48:15.267317');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Ferretería'),(2,'Alimentos'),(3,'Mascotas'),(4,'Herrajes'),(5,'Jardinería');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nit` varchar(10) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_exp` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `text_image` longtext NOT NULL,
  `id_image` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'qwert','asdfg','1234fgty','1234567','8909876','1234fr','asdcf frt56 hj 8','None',0),(4,'','asdfg','1234fgty','1234567','8909876','1234fr','asdcf frt56 hj 8','None',0),(6,'','ciudad nombre','nombre_usuario@correo.com','123456789','4561234567890987','3/5/2025','ASDF 34 # RT-34','None',0),(7,'','mi ciudad es','mi_nombre@micorreo.com','98765432','98654312345','3/8/2024','XXX 123 # 89-qw','None',0),(8,'','mi ciudad es','mi_nombre@micorreo.com','98765432','98654312345','3/8/2024','XXX 123 # 89-qw','ommmm',6),(9,'','','','','','','','None',0),(10,'','la ciudad','el email','34656789','6556565656','3/8/2024','qwert 4567','om mani peme hung',9),(11,'','Santiago de Cali','stuart.ses@gmail.com','1234567','4561234567890987','3/5/2025','asdcf frt56 hj 8','Karmapachenno',1),(12,'','la ciudad','mi_nombre@micorreo.com','123456789','4561234567890987','3/8/2024','ASDF 34 # RT-34','pppppp',8),(37,'','','','','','','','',5),(38,'','','','','','','','',5),(39,'','','','','','','','',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-08-25 01:04:53.711681','1','Ferretería',1,'[{\"added\": {}}]',7,1),(2,'2020-08-25 01:05:07.316890','2','Alimentos',1,'[{\"added\": {}}]',7,1),(3,'2020-08-25 01:05:35.632598','3','Mascotas',1,'[{\"added\": {}}]',7,1),(4,'2020-08-25 01:06:37.608347','4','Herrajes',1,'[{\"added\": {}}]',7,1),(5,'2020-08-25 01:13:48.027580','5','Jardinería',1,'[{\"added\": {}}]',7,1),(6,'2020-08-25 01:36:10.345546','1','Plaguicida',1,'[{\"added\": {}}]',11,1),(7,'2020-08-25 01:37:58.571481','2','Fertilizante a base de insectos',1,'[{\"added\": {}}]',11,1),(8,'2020-08-25 01:40:02.884054','3','Candado',1,'[{\"added\": {}}]',11,1),(9,'2020-08-25 01:40:45.615916','4','Candado con clave',1,'[{\"added\": {}}]',11,1),(10,'2020-08-25 01:41:29.642150','5','Herradura para caballo',1,'[{\"added\": {}}]',11,1),(11,'2020-08-25 01:42:12.270626','6','Adorno en forma de herradura',1,'[{\"added\": {}}]',11,1),(12,'2020-08-25 01:43:44.692980','7','Alimiento para perros',1,'[{\"added\": {}}]',11,1),(13,'2020-08-25 01:44:52.593150','8','Juguete para perros',1,'[{\"added\": {}}]',11,1),(14,'2020-08-25 01:45:39.975472','9','Combo Hamburguesa con coca cola',1,'[{\"added\": {}}]',11,1),(15,'2020-08-25 01:46:29.363798','10','Combo haburguesa vegetariana',1,'[{\"added\": {}}]',11,1),(16,'2020-08-25 21:33:21.279281','1','Image object (1)',1,'[{\"added\": {}}]',9,1),(17,'2020-08-25 21:33:28.769043','2','Image object (2)',1,'[{\"added\": {}}]',9,1),(18,'2020-08-25 21:33:43.426794','3','Image object (3)',1,'[{\"added\": {}}]',9,1),(19,'2020-08-25 21:33:50.526546','4','Image object (4)',1,'[{\"added\": {}}]',9,1),(20,'2020-08-25 21:33:57.219395','5','Image object (5)',1,'[{\"added\": {}}]',9,1),(21,'2020-08-25 21:34:06.504799','6','Image object (6)',1,'[{\"added\": {}}]',9,1),(22,'2020-08-25 21:34:16.896144','7','Image object (7)',1,'[{\"added\": {}}]',9,1),(23,'2020-08-25 21:34:24.307122','8','Image object (8)',1,'[{\"added\": {}}]',9,1),(24,'2020-08-25 21:34:32.521272','9','Image object (9)',1,'[{\"added\": {}}]',9,1),(25,'2020-08-26 01:54:57.786855','10','Combo haburguesa vegetariana',2,'[{\"changed\": {\"fields\": [\"Id discount\"]}}]',11,1),(26,'2020-08-26 01:55:22.263738','4','Candado con clave',2,'[{\"changed\": {\"fields\": [\"Id discount\"]}}]',11,1),(27,'2020-08-27 00:31:40.311990','10','Combo haburguesa vegetariana',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(28,'2020-08-27 00:31:58.091790','9','Combo Hamburguesa con coca cola',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(29,'2020-08-27 00:32:18.531005','8','Juguete para perros',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(30,'2020-08-27 00:32:31.903269','7','Alimiento para perros',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(31,'2020-08-27 00:32:51.697993','6','Adorno en forma de herradura',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(32,'2020-08-27 00:33:07.200888','5','Herradura para caballo',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(33,'2020-08-27 00:33:23.944737','4','Candado con clave',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(34,'2020-08-27 00:33:39.684238','3','Candado',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(35,'2020-08-27 00:33:54.210838','2','Fertilizante a base de insectos',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(36,'2020-08-27 00:34:07.257485','1','Plaguicida',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',11,1),(37,'2020-08-27 02:20:00.015383','1','Image object (1)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(38,'2020-08-27 02:20:20.020715','2','Image object (2)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(39,'2020-08-27 02:20:36.791412','3','Image object (3)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(40,'2020-08-27 02:20:53.354239','3','Image object (3)',2,'[]',9,1),(41,'2020-08-27 02:20:59.426305','4','Image object (4)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(42,'2020-08-27 02:21:15.341729','5','Image object (5)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(43,'2020-08-27 02:21:29.005350','6','Image object (6)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(44,'2020-08-27 02:21:41.604167','7','Image object (7)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(45,'2020-08-27 02:21:53.547099','8','Image object (8)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(46,'2020-08-27 02:22:07.571592','9','Image object (9)',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',9,1),(47,'2020-08-27 02:22:20.079343','10','Image object (10)',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'leemon','category'),(8,'leemon','customers'),(9,'leemon','image'),(11,'leemon','product'),(10,'leemon','purchases'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-24 23:44:29.060765'),(2,'auth','0001_initial','2020-08-24 23:44:30.880852'),(3,'admin','0001_initial','2020-08-24 23:44:36.714849'),(4,'admin','0002_logentry_remove_auto_add','2020-08-24 23:44:38.076510'),(5,'admin','0003_logentry_add_action_flag_choices','2020-08-24 23:44:38.131401'),(6,'contenttypes','0002_remove_content_type_name','2020-08-24 23:44:39.122858'),(7,'auth','0002_alter_permission_name_max_length','2020-08-24 23:44:39.231540'),(8,'auth','0003_alter_user_email_max_length','2020-08-24 23:44:39.340341'),(9,'auth','0004_alter_user_username_opts','2020-08-24 23:44:39.383626'),(10,'auth','0005_alter_user_last_login_null','2020-08-24 23:44:39.835569'),(11,'auth','0006_require_contenttypes_0002','2020-08-24 23:44:39.868515'),(12,'auth','0007_alter_validators_add_error_messages','2020-08-24 23:44:39.915758'),(13,'auth','0008_alter_user_username_max_length','2020-08-24 23:44:40.044182'),(14,'auth','0009_alter_user_last_name_max_length','2020-08-24 23:44:40.161055'),(15,'auth','0010_alter_group_name_max_length','2020-08-24 23:44:40.269002'),(16,'auth','0011_update_proxy_permissions','2020-08-24 23:44:40.311983'),(17,'auth','0012_alter_user_first_name_max_length','2020-08-24 23:44:40.419465'),(18,'sessions','0001_initial','2020-08-24 23:44:40.691945'),(19,'leemon','0001_initial','2020-08-25 00:04:35.916624'),(20,'leemon','0002_auto_20200825_0048','2020-08-25 00:48:46.099772'),(21,'leemon','0003_auto_20200825_0116','2020-08-25 01:16:35.339138'),(22,'leemon','0004_auto_20200825_0121','2020-08-25 01:21:55.286727'),(23,'leemon','0005_auto_20200825_0134','2020-08-25 01:35:04.489906'),(24,'leemon','0006_auto_20200825_0252','2020-08-25 02:53:34.532439'),(25,'leemon','0007_auto_20200825_1608','2020-08-25 16:08:42.041919'),(26,'leemon','0008_auto_20200825_1612','2020-08-25 16:13:13.841124'),(27,'leemon','0009_auto_20200825_1613','2020-08-25 16:13:52.134321'),(28,'leemon','0010_auto_20200825_1616','2020-08-25 16:17:02.291358'),(29,'leemon','0011_auto_20200825_1620','2020-08-25 16:20:18.074571'),(30,'leemon','0012_auto_20200825_1628','2020-08-25 16:28:46.143408'),(31,'leemon','0013_auto_20200825_1700','2020-08-25 17:00:34.335148');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vyg56yok1oerm8h3td5u71yp1911l9ex','.eJxVjEEOwiAQRe_C2hCgMFNcuvcMBGZAqoYmpV0Z765NutDtf-_9lwhxW2vYel7CxOIstDj9binSI7cd8D222yxpbusyJbkr8qBdXmfOz8vh_h3U2Ou3JlOIMRJz0Qk0ZEiDU37QzjMrVIxI3iDw6JDAjhZNtsrFYgE4GS3eH_X4N6w:1kANCy:I92cC2QzPQuhTDyHp_s9NiN5R4adqVRvBUs9i2yEvOg','2020-09-08 00:53:04.720497');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Bicho_1.png'),(2,'Bicho_2.png'),(3,'Candado_1.png'),(4,'Candado_2.png'),(5,'Combo_1.png'),(6,'Combo_2.png'),(7,'Iman_1.png'),(8,'Iman_2.png'),(9,'Perro_1.png'),(10,'Perro_2.png');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `value` int(11) NOT NULL,
  `id_discount` int(11) NOT NULL,
  `id_category_id` int(11) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_category_id_b5bb3785_fk_employee_id` (`id_category_id`),
  CONSTRAINT `product_id_category_id_b5bb3785_fk_employee_id` FOREIGN KEY (`id_category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Plaguicida','Plaguicida orgánico, origen natural. 250 g, la unidad.',20000,0,5,'Bicho_2.png'),(2,'Fertilizante a base de insectos','Biopolímeros biodegradables de origen natural para fertilizar las plantas. 100 g,  la unidad',15000,0,5,'Bicho_1.png'),(3,'Candado','Candado tradicional grande',15000,0,1,'Candado_1.png'),(4,'Candado con clave','Candado grande con clave numérica.',30000,1,1,'Candado_2.png'),(5,'Herradura para caballo','Herradura para caballo, unidad.',18000,0,4,'Iman_2.png'),(6,'Adorno en forma de herradura','Decoración en forma de herradura por unidad',22000,0,4,'Iman_1.png'),(7,'Alimiento para perros','Nutrición necesaria para crecer sano y fuerte. Para todas las razas. 500 g, la unidad',50000,0,3,'Perro_2.png'),(8,'Juguete para perros','Juguete de goma durable.',5000,0,3,'Perro_1.png'),(9,'Combo Hamburguesa con coca cola','Haburguesa tamaño estandar acompañada de papas y coca cola',20000,0,2,'Combo_1.png'),(10,'Combo haburguesa vegetariana','Haburguesa de lenteja tamaño estandar acomapada de papas y limonada',18500,2,2,'Combo_2.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `id_customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_id_customer_id_12d9aacb_fk_customers_id` (`id_customer_id`),
  CONSTRAINT `purchases_id_customer_id_12d9aacb_fk_customers_id` FOREIGN KEY (`id_customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-27  9:29:46
