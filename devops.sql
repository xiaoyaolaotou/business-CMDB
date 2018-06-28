-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: devops
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `accounts_userinfo`
--

DROP TABLE IF EXISTS `accounts_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userinfo`
--

LOCK TABLES `accounts_userinfo` WRITE;
/*!40000 ALTER TABLE `accounts_userinfo` DISABLE KEYS */;
INSERT INTO `accounts_userinfo` VALUES (29,'pbkdf2_sha256$36000$xLZ4YQXbJn59$G9SJ3lWVbki+ii2xb/BbLgrjI5UcexLBnL6YXZZh4yE=','2018-06-21 06:40:25.104724',0,'alex','','','597274490@qq.com',0,1,'2018-06-19 10:09:45.163835','',NULL),(30,'pbkdf2_sha256$36000$BYYhayDzyM3P$QTGPAB3pHN8qv/piHI/WEMF5+c89UejOfGSjnEyUnY4=','2018-06-20 06:11:47.972392',0,'admin','','','admin@gome.com.cn',0,1,'2018-06-20 05:26:44.767137','',NULL),(31,'pbkdf2_sha256$36000$OAYT8H5SSO79$mkdSEljv272Ya2Tz0S/Fj8AgJR/saq5kncgeUyjnrXQ=','2018-06-25 09:05:17.087564',0,'zhangzihong','','','zhangzihong@gome.com.cn',0,1,'2018-06-20 06:27:14.951613','',NULL),(32,'pbkdf2_sha256$36000$JJp5dUKJ1J1D$s1mMKagS8EejNZsHju1DeZYTFIav6g9tmk3F0AoJkXE=','2018-06-21 06:47:11.999717',0,'zhangsan','','','123@11.com',0,1,'2018-06-21 06:47:03.843126','',NULL);
/*!40000 ALTER TABLE `accounts_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userinfo_groups`
--

DROP TABLE IF EXISTS `accounts_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_userinfo_groups_userinfo_id_group_id_01255cb3_uniq` (`userinfo_id`,`group_id`),
  KEY `accounts_userinfo_groups_group_id_49447a02_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_userinfo_gr_userinfo_id_c54a9ca8_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`),
  CONSTRAINT `accounts_userinfo_groups_group_id_49447a02_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userinfo_groups`
--

LOCK TABLES `accounts_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `accounts_userinfo_groups` DISABLE KEYS */;
INSERT INTO `accounts_userinfo_groups` VALUES (35,29,19),(30,30,9),(31,31,9);
/*!40000 ALTER TABLE `accounts_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `accounts_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_userinfo_user_p_userinfo_id_permission_i_ee1f32b9_uniq` (`userinfo_id`,`permission_id`),
  KEY `accounts_userinfo_us_permission_id_f151c89f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_userinfo_us_permission_id_f151c89f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_userinfo_us_userinfo_id_328e1363_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userinfo_user_permissions`
--

LOCK TABLES `accounts_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (9,'Administrator'),(19,'op');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (12,9,1),(13,9,2),(14,9,3),(15,9,4),(16,9,5),(17,9,6),(18,9,7),(19,9,8),(20,9,9),(21,9,10),(22,9,11),(23,9,12),(33,9,13),(34,9,14),(35,9,15),(7,9,16),(24,9,17),(25,9,18),(36,9,19),(37,9,20),(38,9,21),(39,9,22),(40,9,23),(41,9,24),(42,9,25),(43,9,26),(44,9,27),(45,9,28),(46,9,29),(47,9,30),(26,9,31),(27,9,32),(28,9,33),(29,9,34),(30,9,35),(31,9,36),(48,9,37),(49,9,38),(50,9,39),(32,9,40),(51,9,41),(52,9,42),(6,9,43);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_userinfo'),(17,'Can change user',6,'change_userinfo'),(18,'Can delete user',6,'delete_userinfo'),(19,'Can add bussiness',7,'add_bussiness'),(20,'Can change bussiness',7,'change_bussiness'),(21,'Can delete bussiness',7,'delete_bussiness'),(22,'Can add lalancing',8,'add_lalancing'),(23,'Can change lalancing',8,'change_lalancing'),(24,'Can delete lalancing',8,'delete_lalancing'),(25,'Can add idc',9,'add_idc'),(26,'Can change idc',9,'change_idc'),(27,'Can delete idc',9,'delete_idc'),(28,'Can add produce',10,'add_produce'),(29,'Can change produce',10,'change_produce'),(30,'Can delete produce',10,'delete_produce'),(31,'Can add produce',11,'add_produce'),(32,'Can change produce',11,'change_produce'),(33,'Can delete produce',11,'delete_produce'),(34,'Can add bussiness',12,'add_bussiness'),(35,'Can change bussiness',12,'change_bussiness'),(36,'Can delete bussiness',12,'delete_bussiness'),(37,'Can add lalancing',13,'add_lalancing'),(38,'Can change lalancing',13,'change_lalancing'),(39,'Can delete lalancing',13,'delete_lalancing'),(40,'Can add idc',14,'add_idc'),(41,'Can change idc',14,'change_idc'),(42,'Can delete idc',14,'delete_idc'),(43,'访问用户列表',6,'view_userinfo'),(44,'查看业务线管理',14,'view_idc');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','userinfo'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(12,'product','bussiness'),(14,'product','idc'),(13,'product','lalancing'),(11,'product','produce'),(7,'resources','bussiness'),(9,'resources','idc'),(8,'resources','lalancing'),(10,'resources','produce'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-05 02:40:35.106860'),(2,'contenttypes','0002_remove_content_type_name','2018-06-05 02:40:35.131865'),(3,'auth','0001_initial','2018-06-05 02:40:35.217382'),(4,'auth','0002_alter_permission_name_max_length','2018-06-05 02:40:35.236886'),(5,'auth','0003_alter_user_email_max_length','2018-06-05 02:40:35.246388'),(6,'auth','0004_alter_user_username_opts','2018-06-05 02:40:35.254889'),(7,'auth','0005_alter_user_last_login_null','2018-06-05 02:40:35.265391'),(8,'auth','0006_require_contenttypes_0002','2018-06-05 02:40:35.269892'),(9,'auth','0007_alter_validators_add_error_messages','2018-06-05 02:40:35.278894'),(10,'auth','0008_alter_user_username_max_length','2018-06-05 02:40:35.288896'),(11,'accounts','0001_initial','2018-06-05 02:40:35.368912'),(12,'admin','0001_initial','2018-06-05 02:40:35.410420'),(13,'admin','0002_logentry_remove_auto_add','2018-06-05 02:40:35.420922'),(14,'sessions','0001_initial','2018-06-05 02:40:35.434925'),(15,'resources','0001_initial','2018-06-08 07:58:44.700022'),(16,'product','0001_initial','2018-06-08 12:44:24.640324'),(17,'product','0002_auto_20180608_2117','2018-06-08 13:17:21.919201'),(18,'product','0003_auto_20180611_0945','2018-06-11 01:45:19.744706'),(19,'product','0004_auto_20180611_1137','2018-06-11 03:37:09.488286'),(20,'product','0005_auto_20180611_1354','2018-06-11 05:54:37.145263'),(21,'accounts','0002_auto_20180619_1138','2018-06-19 03:38:51.333641');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0e0hv8xoo2b1qpb2t5tlm3kqpql420cr','ZmMyYjk0MTJkNWFmOWY5ZWQ5OThmODgxZTdhNzJmMjU0MDRmNzgyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOThkNmQ3NDc0MWYwMDNkYzdkYTA2NmRhMTU4NmVlZDczODIyZTYyMCJ9','2018-06-15 06:43:16.709340'),('3f4r6t35h8d7pc7an7mx3qbenqaxzqxy','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:38:27.863755'),('8scedl7buchv7ghdqfkpzrpd0r9ukdj5','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:36:48.498489'),('drg2vb1fm3v30yscdmvg81upf3y5imt4','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-16 07:49:40.962122'),('ep1g3ewac0hvgrzy0ifps189frj4znqq','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:29:12.726132'),('h5u7mo0jhp0bikhmvrpx027zjx912nn1','YThhOTY3NTk5Yzg4NmExZGYzZmI4ZDU4MzYyMzkwNjRlNWYyNWEwYjp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjU3N2MyOWY3NWJjMGVhOTgwOGFkMDA2MjNjZDQyM2Q2MTJkNDk0NyJ9','2018-06-26 02:05:41.000361'),('hq8p74jkpyp5yucrjem66n3nssl5rc18','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:38:08.198112'),('ht5medko0ynfkj86iqwwo3ttte0z0u49','OTU3Y2Q1NjAwODhiZTY5MjY0YjMzOWRlYTdjODg5MTg3MGNhZjQyNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODY1OTNjYTU4NGMwNDIzZjRhNWRhYjQwYTVlMjNmZjk0NWZlZTI0In0=','2018-06-19 07:50:25.352738'),('i0cikyg9e5tf4ib0vo4g1s3vg50hvw3z','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:28:51.674885'),('jnxavdva53hctbz7d3m87iuzo5be4rva','YThhOTY3NTk5Yzg4NmExZGYzZmI4ZDU4MzYyMzkwNjRlNWYyNWEwYjp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjU3N2MyOWY3NWJjMGVhOTgwOGFkMDA2MjNjZDQyM2Q2MTJkNDk0NyJ9','2018-06-26 09:05:17.382046'),('n5s48poqnye76wrrwv1zj1ybd08ex89i','YThhOTY3NTk5Yzg4NmExZGYzZmI4ZDU4MzYyMzkwNjRlNWYyNWEwYjp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjU3N2MyOWY3NWJjMGVhOTgwOGFkMDA2MjNjZDQyM2Q2MTJkNDk0NyJ9','2018-06-22 06:47:41.663529'),('qchl6cfuaykuuxyynofzlb0znddfxw9x','ZmMyYjk0MTJkNWFmOWY5ZWQ5OThmODgxZTdhNzJmMjU0MDRmNzgyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOThkNmQ3NDc0MWYwMDNkYzdkYTA2NmRhMTU4NmVlZDczODIyZTYyMCJ9','2018-06-15 06:43:01.523989'),('qug8wx9dr306yxltba4alcv56mokhpsl','MTA1YTQ0ODQ4OTZhZjhhNzIyMDBkNDg0YjYyZGM3N2ZjNTkzN2NiYTp7Il9hdXRoX3VzZXJfaWQiOiIyNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1YzJlMmViOGJjODk0ZTk2NThmNDFkNGI5ODBkMWIxZjFkNTg4OCJ9','2018-06-15 06:44:44.182605'),('qy80mtytoz9bhl2fspfbxai3l5ifofvu','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:30:00.636445'),('tb7duoszgqd57noiej381knk346nar77','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:28:19.019310'),('tt7kv5h5dfid6ruae420jhk212vnlm6t','OTZjYTcxNDBlZTZjNDNmODUyMzljMWFlNzgyNTNmZTNhMGM5MjZhYjp7Il9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjRjZjcyZmE5MzJhOTQyMGE4NGFhMWYxODZkZjZlYTM5ZjE3Mzc4YiJ9','2018-06-21 06:11:47.977077'),('ukfhj1i4ti65mxsa35ru06v6ehkexwb2','ZmMyYjk0MTJkNWFmOWY5ZWQ5OThmODgxZTdhNzJmMjU0MDRmNzgyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOThkNmQ3NDc0MWYwMDNkYzdkYTA2NmRhMTU4NmVlZDczODIyZTYyMCJ9','2018-06-15 06:41:36.456225'),('uw0n26zhoxzk4tp5cgf2s3jxosjv4od4','MTA1YTQ0ODQ4OTZhZjhhNzIyMDBkNDg0YjYyZGM3N2ZjNTkzN2NiYTp7Il9hdXRoX3VzZXJfaWQiOiIyNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1YzJlMmViOGJjODk0ZTk2NThmNDFkNGI5ODBkMWIxZjFkNTg4OCJ9','2018-06-15 06:45:24.771818'),('ys44ya1ou6dry3gpkved6qwo2x40svgt','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:41:01.093848'),('zf0lgz8dd9amhl3oiqxotau1x33t5npz','NGYxYWI3MDUzNzc2MGViYjIxNzIwMGNjNWE2N2VhNjhkNzAzZDk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWZkY2Y0MDQyNjE0ZjRmYTQ0NzZmYjM3MjUxMjk5ZDg5MDU4NWFkZiJ9','2018-06-15 06:37:02.861787');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bussiness`
--

DROP TABLE IF EXISTS `product_bussiness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bussiness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bussiness`
--

LOCK TABLES `product_bussiness` WRITE;
/*!40000 ALTER TABLE `product_bussiness` DISABLE KEYS */;
INSERT INTO `product_bussiness` VALUES (1,'O2M300'),(2,'O2M500'),(3,'O2M800'),(4,'IM300'),(5,'IM500'),(6,'IM800');
/*!40000 ALTER TABLE `product_bussiness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_idc`
--

DROP TABLE IF EXISTS `product_idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virIP` char(39) NOT NULL,
  `physicalIP` char(39) DEFAULT NULL,
  `application` varchar(200) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `component` varchar(100) NOT NULL,
  `principal` varchar(32) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `uptime` datetime(6) NOT NULL,
  `note` varchar(100) DEFAULT NULL,
  `Bussiness_idc_id` int(11) NOT NULL,
  `lalancing_choices` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_idc_Bussiness_idc_id_7366b9fc_fk_product_bussiness_id` (`Bussiness_idc_id`),
  KEY `product_idc_virIP_9b9f5b33` (`virIP`),
  KEY `product_idc_application_da434271` (`application`),
  CONSTRAINT `product_idc_Bussiness_idc_id_7366b9fc_fk_product_bussiness_id` FOREIGN KEY (`Bussiness_idc_id`) REFERENCES `product_bussiness` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_idc`
--

LOCK TABLES `product_idc` WRITE;
/*!40000 ALTER TABLE `product_idc` DISABLE KEYS */;
INSERT INTO `product_idc` VALUES (4,'10.124.36.80','10.124.14.7','o2m-ac-job',1111,'账户会员定时任务','闫立玮','2018-06-11 05:50:02.549184','2018-06-11 05:50:02.549621','test',3,1),(6,'10.124.36.80','10.124.14.7','o2m-ac-job',21,'账户会员定时任务','闫立玮','2018-06-11 05:54:54.457195','2018-06-11 05:54:54.457888','',5,1),(9,'192.168.1.1','1.1.1.2','o2m-ac-job',58000,'账户会员定时任务','cunzhang','2018-06-11 09:17:20.697666','2018-06-11 09:17:20.698606','删除',6,1),(10,'10.124.36.80','1.1.1.2','o2m-ac-job',58000,'账户会员定时任务','闫立玮','2018-06-12 06:51:10.791723','2018-06-12 06:51:10.792223','',1,1),(11,'10.124.36.1','1.1.1.2','o2m-ac-job',58000,'账户会员定时任务','闫立玮','2018-06-12 06:51:22.866820','2018-06-12 06:51:22.867457','123',1,2);
/*!40000 ALTER TABLE `product_idc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-26  9:51:07
