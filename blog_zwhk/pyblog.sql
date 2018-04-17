-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: pyblog
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add tag',8,'add_tag'),(23,'Can change tag',8,'change_tag'),(24,'Can delete tag',8,'delete_tag'),(28,'Can add post',10,'add_post'),(29,'Can change post',10,'change_post'),(30,'Can delete post',10,'delete_post'),(31,'Can add comment',11,'add_comment'),(32,'Can change comment',11,'change_comment'),(33,'Can delete comment',11,'delete_comment');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$w6avG0Kigi0E$zH3aktyl1GPqjOOJjCWEMCzkbPQIed5VcQpptQ8BLD0=','2018-03-19 13:44:53.955241',1,'root','','','',1,1,'2018-03-17 12:59:41.971838');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_comment`
--

DROP TABLE IF EXISTS `comments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_post_id_4f96c2b22d998900_fk_myblog_post_id` (`post_id`),
  CONSTRAINT `comments_comment_post_id_4f96c2b22d998900_fk_myblog_post_id` FOREIGN KEY (`post_id`) REFERENCES `myblog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_comment`
--

LOCK TABLES `comments_comment` WRITE;
/*!40000 ALTER TABLE `comments_comment` DISABLE KEYS */;
INSERT INTO `comments_comment` VALUES (1,'admin','2245401705@qq.com','http://www.zwhk.site','qqq','2018-03-18 15:46:58.421425',1),(2,'admin','2245401705@qq.com','http://www.zwhk.site','qqq','2018-03-18 15:47:13.858686',1),(3,'admin','2245401705@qq.com','http://www.zwhk.site','qqq','2018-03-18 15:56:49.307420',1),(4,'admin','2245401705@qq.com','http://www.zwhk.site','qqq','2018-03-18 15:57:35.568190',1),(5,'admin','2245401705@qq.com','http://www.zwhk.site','qqq','2018-03-18 15:58:21.627479',1),(6,'minbo','2245401705@qq.com','','测试评论','2018-03-18 16:08:53.247480',1),(7,'春天的虫虫','2245401705@qq.com','','写的不错,继续努力!','2018-03-18 16:14:53.255391',4);
/*!40000 ALTER TABLE `comments_comment` ENABLE KEYS */;
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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-03-17 13:02:26.850434','1','技术',1,'',7,1),(2,'2018-03-17 13:02:42.195045','2','生活',1,'',7,1),(3,'2018-03-17 13:02:57.700086','2','python',2,'已修改 name 。',7,1),(4,'2018-03-17 13:03:03.663457','1','linux',2,'已修改 name 。',7,1),(5,'2018-03-17 13:03:08.708211','3','php',1,'',7,1),(6,'2018-03-17 13:03:14.279590','4','javascript',1,'',7,1),(7,'2018-03-17 13:03:30.479032','1','python',1,'',8,1),(8,'2018-03-17 13:03:36.268064','2','django',1,'',8,1),(12,'2018-03-17 14:49:29.332720','4','我的第四篇博客',1,'',10,1),(13,'2018-03-19 04:42:37.100906','5','情感',1,'',7,1),(14,'2018-03-19 04:42:41.199798','5','那个天使',1,'',10,1),(15,'2018-03-19 04:45:39.124126','6','我的第五篇博客',1,'',10,1),(16,'2018-03-19 05:25:07.944536','6','关于',1,'',7,1),(17,'2018-03-19 05:27:54.174307','7','关于博主',1,'',10,1),(18,'2018-03-19 05:33:11.446543','7','关于博主',2,'已修改 content 。',10,1),(19,'2018-03-19 05:33:32.508088','7','关于博主',2,'已修改 content 。',10,1),(20,'2018-03-19 13:45:34.270368','7','关于博主',2,'已修改 content 。',10,1),(21,'2018-03-19 13:48:21.449243','7','关于博主',2,'已修改 content 。',10,1),(22,'2018-03-19 13:49:05.003469','7','关于博主',2,'已修改 content 。',10,1),(23,'2018-03-19 13:49:38.565700','7','关于博主',2,'已修改 content 。',10,1);
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
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'comments','comment'),(5,'contenttypes','contenttype'),(7,'myblog','category'),(10,'myblog','post'),(8,'myblog','tag'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-17 12:59:31.715145'),(2,'auth','0001_initial','2018-03-17 12:59:31.984937'),(3,'admin','0001_initial','2018-03-17 12:59:32.053170'),(4,'contenttypes','0002_remove_content_type_name','2018-03-17 12:59:32.120597'),(5,'auth','0002_alter_permission_name_max_length','2018-03-17 12:59:32.155273'),(6,'auth','0003_alter_user_email_max_length','2018-03-17 12:59:32.188431'),(7,'auth','0004_alter_user_username_opts','2018-03-17 12:59:32.198807'),(8,'auth','0005_alter_user_last_login_null','2018-03-17 12:59:32.228950'),(9,'auth','0006_require_contenttypes_0002','2018-03-17 12:59:32.231751'),(10,'sessions','0001_initial','2018-03-17 12:59:32.257111'),(11,'myblog','0001_initial','2018-03-17 12:59:51.471493'),(12,'myblog','0002_auto_20180317_1301','2018-03-17 13:01:13.028158'),(13,'myblog','0003_auto_20180317_1446','2018-03-17 14:46:35.044700'),(14,'comments','0001_initial','2018-03-18 13:15:50.453050'),(15,'myblog','0004_auto_20180319_0523','2018-03-19 05:23:20.704803');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9fbzqy9h8i3sn6rgcac2jdg9rwlxna9a','N2IwNzI3ZDZiM2NmZDQ0Y2RhOGMzZDU3MDYzMmUzY2FiYWNjMzA0MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA2Y2E2NzExZjk5NGI1NWJiNjBjYTA1NTM0ZGFhNjYwYzMwYmE2YjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-02 13:44:53.957137'),('9g73mznmb24fxr2bhheyizqrlmtf6t5l','N2IwNzI3ZDZiM2NmZDQ0Y2RhOGMzZDU3MDYzMmUzY2FiYWNjMzA0MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA2Y2E2NzExZjk5NGI1NWJiNjBjYTA1NTM0ZGFhNjYwYzMwYmE2YjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-01 13:16:12.512188'),('r0ygq2gruytniu56epdokla0412nskef','N2IwNzI3ZDZiM2NmZDQ0Y2RhOGMzZDU3MDYzMmUzY2FiYWNjMzA0MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA2Y2E2NzExZjk5NGI1NWJiNjBjYTA1NTM0ZGFhNjYwYzMwYmE2YjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-31 13:00:09.957022');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_category`
--

DROP TABLE IF EXISTS `myblog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_category`
--

LOCK TABLES `myblog_category` WRITE;
/*!40000 ALTER TABLE `myblog_category` DISABLE KEYS */;
INSERT INTO `myblog_category` VALUES (1,'linux'),(2,'python'),(3,'php'),(4,'javascript'),(5,'情感'),(6,'关于');
/*!40000 ALTER TABLE `myblog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_post`
--

DROP TABLE IF EXISTS `myblog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` longtext,
  `pub_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myblog_article_b583a629` (`category_id`),
  CONSTRAINT `myblog_articl_category_id_47a29e76c075b5ab_fk_myblog_category_id` FOREIGN KEY (`category_id`) REFERENCES `myblog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_post`
--

LOCK TABLES `myblog_post` WRITE;
/*!40000 ALTER TABLE `myblog_post` DISABLE KEYS */;
INSERT INTO `myblog_post` VALUES (1,'测试博客','minbo','我的第一个django blog\r\n','2018-03-17 13:04:07.103081','2018-03-17 13:04:07.103111',88,2),(2,'我的第二篇博客','minbo','我的第二篇博客','2018-03-17 13:21:06.144794','2018-03-17 13:21:06.144819',10,2),(3,'我的第三篇博客','minbo','我的第三篇博客','2018-03-17 13:21:27.379785','2018-03-17 13:21:27.379807',6,2),(4,'我的第四篇博客','minbo','我的第四篇博客','2018-03-17 14:49:29.329148','2018-03-17 14:49:29.329171',24,1),(5,'那个天使','minbo','天使那年只有十六岁，在一个雷电交加的夜晚飞行时不慎掉了下来。\r\n　　第二天，她被一个男孩救了起来。。。\r\n　　“你是天使吗？”男孩问。\r\n　　于是天使点了点头。\r\n　　“你呢？”\r\n　　“一个水手。”\r\n\r\n\r\n　　于是天使和男孩就这么认识了。\r\n　　那时，天使的翅膀受了伤，不能够飞回天堂，于是就和男孩住在一起。\r\n　　那男孩是个孤儿，从小自己长大。后来做了水手。\r\n　　男孩一出海，就要好几个、好几个星期不回来。于是天使就在家中料理家务。\r\n　　每当男孩出海一回来，那也就是他们最为快乐的时候。\r\n　　“天上很美吗？”\r\n　　男孩常常这样问天使。\r\n　　天使总要思考一阵子，然后说：“天上很美，但没有人间美。”\r\n　　“人间有什么好呢。到处全是虚伪与欺骗。”\r\n　　于是天使就不再说话。真的，天使也不知道为什么喜欢人间。\r\n　　于是就在这样的分分合合中，一年过去了。\r\n　　天使的翅膀也慢慢恢复了。\r\n　　那依然是一双洁白的翅膀，因为天堂就是洁白纯洁的。\r\n　　可是这时，天使决定留下来。\r\n　　“为什么呢，天上多好呀。”\r\n　　“可是我爱的人在这里。”\r\n　　对着面前的男孩，天使说。\r\n　　于是，两个人紧紧的拥在了一起。\r\n　　那一刻，一切都已无所谓，他们是最快乐的。\r\n\r\n\r\n　　可是，不幸总是在幸福中来临。\r\n　　那一天，男孩出海就再也没有回来。\r\n　　天使伤心欲绝，飞回天堂恳求上帝让男孩复活。\r\n　　上帝沉思了一下，说：“办法倒是有一个，只不过……。”\r\n　　“什么，您说吧，无论是什么我都会接受。”\r\n　　“好，只不过你不能再做天使并且永远不能再见到那个男孩。”\r\n　　天堂里顿时一片肃静，听到的是天使抽泣的声音。\r\n　　“我愿意。”天使最终还是这么说了，因为为了心爱的男孩，她什么都愿意去做。\r\n　　……\r\n\r\n　　而后的一个月发生了奇迹。那个男孩在海边被人救起，就在天使曾经倒下的地方。\r\n　　可是天使却再也不能见到男孩了。她被迫去了一个很远的地方，一个永远不可能见到男孩的地方。\r\n　　她依旧背着一双翅膀，但看起来却已没那么纯洁，拂上了些许的黑尘，因为她已不再是天使。','2018-03-19 04:42:41.198244','2018-03-19 04:42:41.198267',3,5),(6,'我的第五篇博客','minbo','测试文章','2018-03-19 04:45:39.120018','2018-03-19 04:45:39.120055',2,2),(7,'关于博主','只为花开','<p><strong>乌云ID</strong>：<em>只为花开</em></p>\r\n\r\n<p>linux系统、网络安全爱好者.</p>\r\n\r\n<p>湖北理工学院2015在校大学生.</p>\r\n\r\n<p>联系邮箱：465728296@qq.com</p>\r\n\r\n<p>QQ：465728296</p>\r\n\r\n<p><img alt=\"\" class=\"img-responsive\" src=\"/media/upload/2018/03/19/img_2noBHFT.jpg\" style=\"height:710px; width:400px\" /></p>\r\n','2018-03-19 05:27:54.171717','2018-03-19 13:49:38.564119',19,6);
/*!40000 ALTER TABLE `myblog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_post_tags`
--

DROP TABLE IF EXISTS `myblog_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`post_id`,`tag_id`),
  KEY `myblog_article_tags_tag_id_74b863538221b789_fk_myblog_tag_id` (`tag_id`),
  CONSTRAINT `myblog_article_tags_tag_id_74b863538221b789_fk_myblog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `myblog_tag` (`id`),
  CONSTRAINT `myblog_post_tags_post_id_3f1c6ec935722f03_fk_myblog_post_id` FOREIGN KEY (`post_id`) REFERENCES `myblog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_post_tags`
--

LOCK TABLES `myblog_post_tags` WRITE;
/*!40000 ALTER TABLE `myblog_post_tags` DISABLE KEYS */;
INSERT INTO `myblog_post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2);
/*!40000 ALTER TABLE `myblog_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myblog_tag`
--

DROP TABLE IF EXISTS `myblog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myblog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myblog_tag`
--

LOCK TABLES `myblog_tag` WRITE;
/*!40000 ALTER TABLE `myblog_tag` DISABLE KEYS */;
INSERT INTO `myblog_tag` VALUES (1,'python'),(2,'django');
/*!40000 ALTER TABLE `myblog_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20 13:12:55
