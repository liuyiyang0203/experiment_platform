-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hk_db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_ruser'),(22,'Can change user',6,'change_ruser'),(23,'Can delete user',6,'delete_ruser'),(24,'Can view user',6,'view_ruser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_experimentapp_ruser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_experimentapp_ruser_id` FOREIGN KEY (`user_id`) REFERENCES `experimentapp_ruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'experimentapp','ruser'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-17 10:06:44.990010'),(2,'contenttypes','0002_remove_content_type_name','2019-09-17 10:06:46.306528'),(3,'auth','0001_initial','2019-09-17 10:06:47.812240'),(4,'auth','0002_alter_permission_name_max_length','2019-09-17 10:06:52.198031'),(5,'auth','0003_alter_user_email_max_length','2019-09-17 10:06:52.258835'),(6,'auth','0004_alter_user_username_opts','2019-09-17 10:06:52.338666'),(7,'auth','0005_alter_user_last_login_null','2019-09-17 10:06:52.413288'),(8,'auth','0006_require_contenttypes_0002','2019-09-17 10:06:52.480110'),(9,'auth','0007_alter_validators_add_error_messages','2019-09-17 10:06:52.561845'),(10,'auth','0008_alter_user_username_max_length','2019-09-17 10:06:52.633643'),(11,'auth','0009_alter_user_last_name_max_length','2019-09-17 10:06:52.708442'),(12,'auth','0010_alter_group_name_max_length','2019-09-17 10:06:53.854420'),(13,'auth','0011_update_proxy_permissions','2019-09-17 10:06:53.929235'),(14,'experimentapp','0001_initial','2019-09-17 10:06:54.935241'),(15,'admin','0001_initial','2019-09-17 10:06:59.507811'),(16,'admin','0002_logentry_remove_auto_add','2019-09-17 10:07:01.323146'),(17,'admin','0003_logentry_add_action_flag_choices','2019-09-17 10:07:01.382986'),(18,'sessions','0001_initial','2019-09-17 10:07:01.851770');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1hhstd3y3vo6u40b7dlxw5m7lap68umi','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-02 02:06:00.983577'),('daozcwzjn6kzby0636m0plnlsa68wfov','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-03 11:49:58.096647'),('gf2zbw5b42dngzkf8212bklh49ty9rk6','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-01 11:04:54.851722'),('h68covxmvh0te0cxlz8su6ajvqafh0is','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-08 01:50:23.394590'),('ok0a2l8fag75ml8h3g4470a3mexala85','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-02 00:18:43.237686'),('v76j9u1tw0pg2wxo5crmozhjyrc5x0xi','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-11-08 11:53:08.266525'),('wumosvtad0mv5hogdiozwk1viq9dip5c','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-01 12:25:40.126796'),('zg4xqs2zs30vg9nxafuu3lvswkzqbhwk','YjFmNjk0OWRjZmU2ZjNmMjEwMjZjN2NiMTRmYWJhYmQ4YWYwMDBiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjY5YjhjMGQxZjRkMzBjNDY2YTg5MjdiNzc1YjVhZjU5MzJjY2RkIn0=','2019-10-04 02:14:32.811540');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experimentapp_ruser`
--

DROP TABLE IF EXISTS `experimentapp_ruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `experimentapp_ruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experimentapp_ruser`
--

LOCK TABLES `experimentapp_ruser` WRITE;
/*!40000 ALTER TABLE `experimentapp_ruser` DISABLE KEYS */;
INSERT INTO `experimentapp_ruser` VALUES (1,'pbkdf2_sha256$150000$rqHwmNccyyn6$8n0CdhN0PGBSvcg3/M6Jr4H+NhYAIltgZbcUykkr+2g=','2019-10-25 11:53:07.848038',0,'liu','','','1@1.com',0,1,'2019-09-17 10:19:32.997529'),(2,'pbkdf2_sha256$150000$fx4DqFcXXC5U$8E05MFny4ZDUAWcaBBgsMLoMImzOGGHhA5O52YQktic=','2019-10-25 10:46:26.902095',1,'hky','','','1@1.com',1,1,'2019-09-17 10:20:15.841619'),(3,'pbkdf2_sha256$150000$X75qEfxPd6k1$97RDi7WUo3BesOyUGb0zVXiyHpy/TlTKu/ZMaQh1rfI=','2019-10-25 10:43:38.287488',0,'li','','','1@1.com',0,1,'2019-09-22 09:13:45.738447');
/*!40000 ALTER TABLE `experimentapp_ruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experimentapp_ruser_groups`
--

DROP TABLE IF EXISTS `experimentapp_ruser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `experimentapp_ruser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experimentapp_ruser_groups_ruser_id_group_id_df17c956_uniq` (`ruser_id`,`group_id`),
  KEY `experimentapp_ruser_groups_group_id_93d7df93_fk_auth_group_id` (`group_id`),
  CONSTRAINT `experimentapp_ruser__ruser_id_f61fdc72_fk_experimen` FOREIGN KEY (`ruser_id`) REFERENCES `experimentapp_ruser` (`id`),
  CONSTRAINT `experimentapp_ruser_groups_group_id_93d7df93_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experimentapp_ruser_groups`
--

LOCK TABLES `experimentapp_ruser_groups` WRITE;
/*!40000 ALTER TABLE `experimentapp_ruser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `experimentapp_ruser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experimentapp_ruser_user_permissions`
--

DROP TABLE IF EXISTS `experimentapp_ruser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `experimentapp_ruser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experimentapp_ruser_user_ruser_id_permission_id_06fad9a3_uniq` (`ruser_id`,`permission_id`),
  KEY `experimentapp_ruser__permission_id_5ac56ed8_fk_auth_perm` (`permission_id`),
  CONSTRAINT `experimentapp_ruser__permission_id_5ac56ed8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `experimentapp_ruser__ruser_id_704dc19e_fk_experimen` FOREIGN KEY (`ruser_id`) REFERENCES `experimentapp_ruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experimentapp_ruser_user_permissions`
--

LOCK TABLES `experimentapp_ruser_user_permissions` WRITE;
/*!40000 ALTER TABLE `experimentapp_ruser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `experimentapp_ruser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-27  8:35:41
