-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: new_blog
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
-- Table structure for table `accounts_bloguser`
--

DROP TABLE IF EXISTS `accounts_bloguser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bloguser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `mugshot` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bloguser`
--

LOCK TABLES `accounts_bloguser` WRITE;
/*!40000 ALTER TABLE `accounts_bloguser` DISABLE KEYS */;
INSERT INTO `accounts_bloguser` VALUES (1,'pbkdf2_sha256$100000$Af86oTqCiJBH$4qtPDcss5vU2TpgtMYVtUZEgVV2hxf/OWloPVwcNmOI=','2018-05-15 12:03:09.255603',1,'root','','','465728296@qq.com',1,1,'2018-05-11 14:18:54.867597','','','2018-05-11 14:18:54.867614','2018-05-11 14:18:54.867618'),(2,'pbkdf2_sha256$100000$bpJ0iFqONoS5$SOluKbAjaQG32+uaTX83DzWyLKCAZDobLQwk4EUcVzo=','2018-05-13 15:17:10.702947',0,'zwhk','','','2245401705@qq.com',0,1,'2018-05-11 14:27:40.205203','','','2018-05-11 14:27:40.205230','2018-05-11 14:27:40.205235'),(3,'pbkdf2_sha256$100000$omvVgx32tqCm$Dt4DTlUxGWT27eDFAl9vzqhT/nHi1zfLrSK3dHofFzc=','2018-05-13 09:39:00.000000',0,'minbo666','','','465728296@qq.com',0,1,'2018-05-13 09:39:00.000000','','upload/mugshots/10117.jpg','2018-05-13 09:39:00.000000','2018-05-13 09:39:00.000000');
/*!40000 ALTER TABLE `accounts_bloguser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bloguser_groups`
--

DROP TABLE IF EXISTS `accounts_bloguser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bloguser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_bloguser_groups_bloguser_id_group_id_fc37e89b_uniq` (`bloguser_id`,`group_id`),
  KEY `accounts_bloguser_groups_group_id_98d76804_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_bloguser_gr_bloguser_id_a16ccbb7_fk_accounts_` FOREIGN KEY (`bloguser_id`) REFERENCES `accounts_bloguser` (`id`),
  CONSTRAINT `accounts_bloguser_groups_group_id_98d76804_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bloguser_groups`
--

LOCK TABLES `accounts_bloguser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_bloguser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bloguser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bloguser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_bloguser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bloguser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_bloguser_user_p_bloguser_id_permission_i_14808777_uniq` (`bloguser_id`,`permission_id`),
  KEY `accounts_bloguser_us_permission_id_ae5159b9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_bloguser_us_bloguser_id_7e1b5742_fk_accounts_` FOREIGN KEY (`bloguser_id`) REFERENCES `accounts_bloguser` (`id`),
  CONSTRAINT `accounts_bloguser_us_permission_id_ae5159b9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bloguser_user_permissions`
--

LOCK TABLES `accounts_bloguser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_bloguser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bloguser_user_permissions` ENABLE KEYS */;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add 侧边栏',7,'add_sidebar'),(20,'Can change 侧边栏',7,'change_sidebar'),(21,'Can delete 侧边栏',7,'delete_sidebar'),(22,'Can add 友情链接',8,'add_links'),(23,'Can change 友情链接',8,'change_links'),(24,'Can delete 友情链接',8,'delete_links'),(25,'Can add 文章',9,'add_article'),(26,'Can change 文章',9,'change_article'),(27,'Can delete 文章',9,'delete_article'),(28,'Can add 网站配置',10,'add_blogsettings'),(29,'Can change 网站配置',10,'change_blogsettings'),(30,'Can delete 网站配置',10,'delete_blogsettings'),(31,'Can add 标签',11,'add_tag'),(32,'Can change 标签',11,'change_tag'),(33,'Can delete 标签',11,'delete_tag'),(34,'Can add 分类',12,'add_category'),(35,'Can change 分类',12,'change_category'),(36,'Can delete 分类',12,'delete_category'),(37,'Can add user',13,'add_bloguser'),(38,'Can change user',13,'change_bloguser'),(39,'Can delete user',13,'delete_bloguser'),(40,'Can add oauth配置',14,'add_oauthconfig'),(41,'Can change oauth配置',14,'change_oauthconfig'),(42,'Can delete oauth配置',14,'delete_oauthconfig'),(43,'Can add oauth用户',15,'add_oauthuser'),(44,'Can change oauth用户',15,'change_oauthuser'),(45,'Can delete oauth用户',15,'delete_oauthuser'),(46,'Can add 评论',16,'add_comment'),(47,'Can change 评论',16,'change_comment'),(48,'Can delete 评论',16,'delete_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(160) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` longtext NOT NULL,
  `pub_time` datetime(6) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `comment_status` varchar(1) NOT NULL,
  `type` varchar(1) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `blog_article_author_id_905add38_fk_accounts_bloguser_id` (`author_id`),
  KEY `blog_article_slug_c3fca16d` (`slug`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_author_id_905add38_fk_accounts_bloguser_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_bloguser` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (3,'matlab','2018-05-12 03:30:51.406716','2018-05-12 03:30:51.406724','matlab','<p>实 验 报 告专业：应用物理               班级：15  级（ 2  ）班      指导老师：汪太月姓名：****             学号： ************              实验室：K7-405实验名称：MATLAB中图形的绘制                   时间：   2017-11-19一、 实验目的及要求（一）、实验目的1、熟悉MATLAB的图形绘制的基本要点；2、掌握在MATLAB中图形的标注；3、掌握在MATLAB中图形绘制中坐标轴的控制；4、掌握在MATLAB中基本图形的绘制；（二）、实验要求1、在MATLAB会绘制正弦、余弦等函数的基本图形；2、练习在MATLAB中对图形的标注、坐标轴的控制、颜色的选取、图形的注释等；3、练习在MATLAB中绘制饼图、柱状图、球等； 二、实验设备（环境）及要求1、支持Intel Pentium Ⅲ及其以上CPU，内存256MB以上、硬盘1GB以上容量的微机；软件配有Windows98/2000/XP操作系统及MATLAB软件；2、实验过程中，务必分析实验结果，按要求写出实验报告。（建议同时网上提交电子版实验报告：yw6895@126.com）三、实验内容与步骤 一..基本图形的绘制1.clc,clear allx=0:pi/20:2*piy=sin(x)figure(1)plot(x,y) 2.clc,clear allx=0:pi/50:2*pik=[1 26 51 76 101]x(k)=[]figure(1)subplot(2,2,1)plot(x,sin(x)),grid onsubplot(2,2,2)plot(x,cos(x)),grid onsubplot(2,2,3)plot(x,tan(x)),grid onsubplot(2,2,4)plot(x,cot(x)),grid on  二.图形标注1.clc,clear allx=-2:.1:2y1=x.^2y2=x.^3figure(1)plot(x,y1,’r-‘,x,y2,’k.’),grid onlegend(‘\\ity=x^2′,’\\ity=x.^3’)title(‘y=x^2和y=x^3quxian’)xlable(‘x’),ylable(‘y’) 2. clc,clear allx=0:pi/50:2*piy1=sin(x)y2=cos(x)figure(1)plot(x,y1,’k-‘,x,y2,’k-‘),grid ontext(pi,0.05,’\\leftarrow sin(\\alpha)’)text(pi/4-0.05,0,05,’cos(\\alpha)\\rightarrow’)title(‘sin(alpha)和cos(\\alpha’)xlable(‘\\alpha’),ylable(‘sin(\\alpha)和cos(alpha)’)3.坐标轴控制clc,clear allx=0:.025:pi/2;y=tan(x);figure(1)plot(x,y,’r-o’),grid onbox offtitle(‘正切函数’),xlable(‘角度（弧度）’)clc,clear allx=0:1/3000:1;y=cos(tan(pi*x));figure(1)subplot(2,1,1),plot(x,y)title(‘\\itcos(tan(\\pix))’)subplot(2,1,2),plot(x,y)axis([0.4 0.6 -1 1]);title(‘复杂函数的局部透视’)3.颜色控制clc,clear allcamp=colormap;L=length(camp);x=[1:L];y=x’*ones(size(x));figure(1)bar(x(1:2),y(1:2,:))title(‘gray颜色版的颜色’)colormap(‘gray’)             结 论	   经过这次的实验，我了解到matlab不仅仅可以用来科学运算，还可以用来处理图形，而且处理起来非常方便简介，功能十分强大，可以用作物理实验数据的分析和作图，使得实验数据更加直观。  2017年 11  月 19   日教师批阅	1.能按实验要求（很好， 好， 较差，  差）的完成实验。2.完成实验具有（很好， 好， 较差， 差）的独立性。3.实验结果、实验分析、结论（准确， 较准确， 不准确）。等级[      ]    教师签名                 年     月    日</p>','2017-12-21 22:37:00.000000','p','o','a',75,1,4),(5,'dajngo','2018-05-12 03:33:01.315889','2018-05-12 03:33:01.315899','dajngo','<pre><code class=\"lang-python\">from django.conf.urls import url, include\r\nfrom django.contrib import admin\r\nfrom django.contrib.sitemaps.views import sitemap\r\nfrom DjangoBlog.sitemap import StaticViewSitemap, ArticleSiteMap, CategorySiteMap, TagSiteMap, UserSiteMap\r\nfrom DjangoBlog.feeds import DjangoBlogFeed\r\nfrom django.views.decorators.cache import cache_page\r\nfrom django.conf import settings\r\nfrom django.conf.urls.static import static\r\nfrom DjangoBlog.admin_site import admin_site\r\n\r\nsitemaps = {\r\n    \'blog\': ArticleSiteMap,\r\n    \'Category\': CategorySiteMap,\r\n    \'Tag\': TagSiteMap,\r\n    \'User\': UserSiteMap,\r\n    \'static\': StaticViewSitemap\r\n}\r\n\r\nhandler404 = \'blog.views.page_not_found_view\'\r\nhandler500 = \'blog.views.server_error_view\'\r\nhandle403 = \'blog.views.permission_denied_view\'\r\nurlpatterns = [\r\n    url(r\'^admin/\', admin_site.urls),\r\n    url(r\'\', include(\'blog.urls\', namespace=\'blog\')),\r\n\r\n    url(r\'\', include(\'comments.urls\', namespace=\'comment\')),\r\n    url(r\'\', include(\'accounts.urls\', namespace=\'account\')),\r\n    url(r\'\', include(\'oauth.urls\', namespace=\'oauth\')),\r\n\r\n    #SiteMap\r\n    url(r\'^sitemap\\.xml$\', sitemap, {\'sitemaps\': sitemaps},\r\n        name=\'django.contrib.sitemaps.views.sitemap\'),\r\n\r\n    #RSS\r\n    url(r\'^feed/$\', DjangoBlogFeed()),\r\n\r\n    url(r\'^search\', include(\'haystack.urls\'), name=\'search\'),\r\n\r\n    url(r\'\', include(\'servermanager.urls\', namespace=\'servermanager\')),\r\n\r\n    #owntracks\r\n    url(r\'\', include(\'owntracks.urls\', namespace=\'owntracks\'))\r\n] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)\r\n<br></code></pre>','2018-05-01 21:15:00.000000','p','o','a',43,1,2),(6,'guan-yu-bo-zhu','2018-05-13 03:25:37.757243','2018-05-13 03:25:37.757252','关于博主','<p><b>乌云ID：只为花开linux系统、网络安全爱好者.</b></p><p><b>湖北理工学院2015在校大学生.</b></p><p><b>联系邮箱：465728296@qq.com</b></p><p><b>QQ：465728296</b></p><p><b><img alt=\"092958cz6jt6jw2vmmjmsc.jpg\" src=\"/media/uploads/2018/05/15/092958cz6jt6jw2vmmjmsc_gMaA0Rw.jpg\" width=\"700\" height=\"393.6231884057971\"><br></b></p>','2018-05-14 22:36:00.000000','p','o','p',59,1,3),(7,'na-ge-tian-shi','2018-05-13 08:03:24.290485','2018-05-13 08:03:24.290495','那个天使','<p><img alt=\"326239.jpg\" src=\"/media/uploads/2018/05/15/326239_0ahBgjN.jpg\" width=\"1920\" height=\"1080\"><br><br></p>','2018-05-14 22:36:00.000000','p','o','a',39,1,3),(8,'django-guo-ji-hua-shi-li-ji-yuan-li-fen-xi','2018-05-14 14:31:28.579281','2018-05-14 14:31:28.579293','Django 国际化实例及原理分析','<p>当 Web 服务搭建好以后，可以接收来自全球不同国家用户访问。这样就要求开发人员调整软件，使之能适用于不同的语言，即国际化和本地化。国际化 --  Internationalization，i 和 n 之间有 18 个字母，简称 I18N,。本地化 -- localization， l 和 n 之间有 10 个字母，简称 L10N。国际化意味着 Web 产品有适用于任何地方的潜力，针对程序开发人员；本地化则是指使一个国际化的程序为了在某个特定地区使用而进行实际翻译的过程，针对翻译人员而言。Django 提供了非常强大的翻译机制，开发者一旦理解它的实现，就能减少编码量，提高开发效率。本文通过两个 Django 国际化实例循序渐进地介绍在 Django 环境里进行 Web 程序国际化和本地化开发的相关方法和知识。并结合 Django 国际化现有代码进行分析，向读者阐述 Django 国际化的原理与内部实现。学习本文，可以很好的掌握国际化 Django 程序的技术。当 Web 服务搭建好以后，可以接收来自全球不同国家用户访问。这样就要求开发人员调整软件，使之能适用于不同的语言，即国际化和本地化。国际化 --  Internationalization，i 和 n 之间有 18 个字母，简称 I18N,。本地化 -- Localization， l 和 n 之间有 10 个字母，简称 L10N。国际化意味着 Web 产品有适用于任何地方的潜力，针对程序开发人员；本地化则是指使一个国际化的程序为了在某个特定地区使用而进行实际翻译的过程，针对翻译人员而言。Django 提供了非常强大的翻译机制，开发者一旦理解它的实现，就能减少编码量，提高开发效率。<br></p>','2017-11-17 22:31:00.000000','p','o','a',1,1,2),(9,'django-guo-ji-hua-jian-jie','2018-05-14 14:32:07.764855','2018-05-14 14:32:07.764867','Django 国际化简介','<p>Django 的开发和维护者对 Django 框架本身进行了完全国际化，我们可以在 ./Python2.5/site-packages/django/conf/locale/ 找到相关的语言文件。目前 Django-1.2.1 带着 52 个不同的本地化语言文件发行的，使用户能够方便的使用它现有的管理界面。Django 国际化的本质就是开发者对需要翻译的字符串进行标记，并对字符串进行相应的翻译。当用户访问该 Web 时，Django 内部框架根据用户使用偏好进行 Web 呈现。Django 国际化使用的翻译模块是使用 Python 自带的 gettext 标准模块。通过一个到 GNU gettext 消息目录库的接口，这个模块为 Python 程序提供了国际化 (I18N) 和本地化 (L10N)。开发人员和翻译人员需要完成一下 3 个步骤：1. 第一步：在 Python 代码和模板中嵌入待翻译的字符串，2. 第二步：把那些字符串翻译成需要支持的语言，并进行相应的编译3. 第三步：在 Django settings 文件中激活本地中间件，下面我们将通过这个几个步骤，介绍两个实例，然后在每个实例后结合 Django 代码来向读者介绍 Django 国际化的原理。本文环境：CentOS release 5.3 (Final)，Python 2.5.5 ， gettext 版本为 gettext-0.14.6-4.el5，浏览器为 Fixfox 3.6.3., Django-1.2.1。请前往 <a href=\"http://www.djangoproject.com/download/\" rel=\"nofollow\">http://www.djangoproject.com/download/</a>下载并安装 Django。读者最好能边阅读本文，边在计算机上进行操作，达到最佳学习效果。因此，需要读者具备以下技能：熟悉基本的 Linux 操作命令熟悉 Python 语法，对编写 Django 应用程序所有了解。本文附带相关源代码，直接下载并解压缩到配置好 Django 的环境中，就可以运行看到效果。<br></p>','2016-10-19 22:31:00.000000','p','o','a',2,1,2),(10,'zhen-dui-python-dai-ma-de-guo-ji-hua-shi-li-ji-yuan-li-fen-xi','2018-05-14 14:33:03.095274','2018-05-14 14:33:03.095286','针对 Python 代码的国际化实例及原理分析','<p>对 Django 中 Python 代码进行国际化主要用到 ugettext()，gettext_noop()，gettext_lazy() 和 ungettext() 等函数。在本 Django 应用程序实例中，主要 Python 代码都集中在 models.py 和 views.py。 我们将 ugettext() 使用对 views.py 中的相关字符串进行实例化。接着，我们将会结合 Django 代码对整个过程的原理实现做详细的介绍。一个简单的 Python Web 程序首先在 /home/jerry/ 目录下 , 创建名为 testsite 的 Project，请参考清单 1:清单 1. 创建一名为 testsite 的 project1234[root@localhost jerry]# django-admin.py startproject testsite [root@localhost jerry]# cd testsite/ [root@localhost testsite]# ls __init__.py&nbsp; manage.py&nbsp; settings.py&nbsp; urls.py接着，在 /home/jerry/testsite 目录下创建一个名为 test1 的 Django App, 请参看清单 2。清单 2. 创建名为 test1 的 Django App1234[root@localhost testsite]# Python manage.py startapp test1 [root@localhost testsite]# ls __init__.py&nbsp; __init__.pyc&nbsp; manage.py&nbsp; settings.py&nbsp; settings.pyc&nbsp; test1&nbsp; urls.py [root@localhost testsite]#cd test1接着，在 test1 的 views.py 中添加代码获取今天周期几，具体代码参看清单 3。清单 3. test1 的 views.py 中的代码12345678910111213141516[root@localhost test1]# vim views.py &nbsp;&nbsp;# Create your views here. &nbsp;from django.http import HttpResponse &nbsp;import time &nbsp;&nbsp;def test1_view(request): &nbsp;# 获得系统本地时间，返回的格式是 UTC 中的 struct_time 数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t&nbsp; = time.localtime() &nbsp;# 第 6 个元素是 tm_wday , 范围为 [0,6], 星期一 is 0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n&nbsp; = t[6] &nbsp;# 星期一到星期日字符串weekdays = [\'Monday\', \'Tuesday\', \'Wednesday\', \'Thursday\', \'Friday\', \'Saturday\', \'Sunday\'] &nbsp;# 返回一个 HttpResponse、，这段代码将用来返回服务器系统上是星期几。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return HttpResponse(weekdays[n])然后配置 URL, 在 url.py 增加用户访问 test1_view 的 url, 具体请参看清单 4。清单 4. test1_view 的 url 配置1234567891011[root@localhost testsite]# vim urls.py &nbsp;from testsite.test1 import views &nbsp;&nbsp;urlpatterns = patterns(\'\', &nbsp;&nbsp;&nbsp;&nbsp;…&nbsp;&nbsp;&nbsp;&nbsp;(r\'^test1_view$\', views.test1_view), &nbsp;) &nbsp;在 testsite 中，setting.py 中默认的语言设置为 en-us: &nbsp;&nbsp;LANGUAGE_CODE = \'en-us\'在更新 url.py 和 setting.py 后，在 /home/jerry/testsite 目录下启动服务，具体参看清单 5：清单 5. 启动 testsite 服务1root@localhost testsite]# Python manage.py runserver 0.0.0.0:8080当启动服务没有错误提示，就可以在在浏览器中输入 Web 服务地址 : <a href=\"http://192.168.174.128:8080/test1_view\" rel=\"nofollow\">http://192.168.174.128:8080/test1_view</a>，就会看到英文星期几，具体见图 1:图 1. test1 未国际化时的显示结果<br></p>','2017-11-15 12:00:00.000000','p','o','a',1,1,6);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (4,5,1),(5,5,2),(6,5,3),(7,8,1),(8,8,2),(9,9,2);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogsettings`
--

DROP TABLE IF EXISTS `blog_blogsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(200) NOT NULL,
  `site_description` longtext NOT NULL,
  `site_seo_description` longtext NOT NULL,
  `site_keywords` longtext NOT NULL,
  `article_sub_length` int(11) NOT NULL,
  `sidebar_article_count` int(11) NOT NULL,
  `sidebar_comment_count` int(11) NOT NULL,
  `show_google_adsense` tinyint(1) NOT NULL,
  `google_adsense_codes` longtext,
  `open_site_comment` tinyint(1) NOT NULL,
  `beiancode` varchar(2000) DEFAULT NULL,
  `analyticscode` longtext NOT NULL,
  `gongan_beiancode` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogsettings`
--

LOCK TABLES `blog_blogsettings` WRITE;
/*!40000 ALTER TABLE `blog_blogsettings` DISABLE KEYS */;
INSERT INTO `blog_blogsettings` VALUES (1,'只为花开的博客','a django blog','a django blog','a django blog',300,5,5,0,'',1,NULL,'123','');
/*!40000 ALTER TABLE `blog_blogsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(160) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blog_category_parent_category_id_f50c3c0c_fk_blog_category_id` (`parent_category_id`),
  KEY `blog_category_slug_92643dc5` (`slug`),
  CONSTRAINT `blog_category_parent_category_id_f50c3c0c_fk_blog_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (2,'python','2018-05-11 14:36:30.034387','2018-05-11 14:36:30.034397','python',NULL),(3,'qing-gan-wen-zhang','2018-05-12 03:15:50.463939','2018-05-12 03:15:50.463950','情感文章',NULL),(4,'matlab','2018-05-12 03:30:47.809876','2018-05-12 03:30:47.809884','matlab',NULL),(5,'route','2018-05-12 03:31:32.379311','2018-05-12 03:31:32.379318','route',NULL),(6,'django','2018-05-12 15:32:10.509157','2018-05-12 15:32:10.509165','django',2),(7,'flask','2018-05-12 15:32:20.388132','2018-05-12 15:32:20.388142','flask',2),(8,'pillow','2018-05-12 15:32:39.565744','2018-05-12 15:32:39.565752','pillow',2);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_links`
--

DROP TABLE IF EXISTS `blog_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `link` varchar(200) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_links`
--

LOCK TABLES `blog_links` WRITE;
/*!40000 ALTER TABLE `blog_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_sidebar`
--

DROP TABLE IF EXISTS `blog_sidebar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_sidebar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `sequence` int(11) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_sidebar`
--

LOCK TABLES `blog_sidebar` WRITE;
/*!40000 ALTER TABLE `blog_sidebar` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_sidebar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(160) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blog_tag_slug_01068d0e` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'python','2018-05-12 14:29:37.170835','2018-05-12 14:29:37.170845','python'),(2,'django','2018-05-12 14:29:54.623330','2018-05-12 14:29:54.623337','django'),(3,'route','2018-05-12 14:30:02.928389','2018-05-12 14:30:02.928406','route');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_comment`
--

DROP TABLE IF EXISTS `comments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_article_id_94fe60a2_fk_blog_article_id` (`article_id`),
  KEY `comments_comment_author_id_334ce9e2_fk_accounts_bloguser_id` (`author_id`),
  KEY `comments_comment_parent_comment_id_71289d4a_fk_comments_` (`parent_comment_id`),
  CONSTRAINT `comments_comment_article_id_94fe60a2_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `comments_comment_author_id_334ce9e2_fk_accounts_bloguser_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_bloguser` (`id`),
  CONSTRAINT `comments_comment_parent_comment_id_71289d4a_fk_comments_` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_comment`
--

LOCK TABLES `comments_comment` WRITE;
/*!40000 ALTER TABLE `comments_comment` DISABLE KEYS */;
INSERT INTO `comments_comment` VALUES (12,'测试评论','2018-05-13 09:07:14.189074','2018-05-13 09:07:14.189084',1,3,1,NULL),(13,'你是谁?','2018-05-13 09:40:27.227576','2018-05-13 09:40:27.227586',1,3,3,NULL),(14,'测试评论!','2018-05-13 12:48:41.840205','2018-05-13 12:48:41.840215',1,3,1,NULL),(15,'测试一下!','2018-05-13 12:49:10.360358','2018-05-13 12:49:10.360370',1,3,2,NULL),(16,'测试','2018-05-13 15:16:17.939603','2018-05-13 15:16:17.939618',1,3,1,12),(17,'ok','2018-05-13 15:17:24.792421','2018-05-13 15:17:24.792432',1,3,2,14),(18,'测试','2018-05-13 15:18:52.576106','2018-05-13 15:18:52.576116',1,3,2,13),(19,'测试','2018-05-13 15:19:08.968488','2018-05-13 15:19:08.968498',1,3,2,17),(20,'测色','2018-05-13 15:22:33.409419','2018-05-13 15:22:33.409429',1,3,2,15),(21,'嗯嗯','2018-05-13 15:24:05.665791','2018-05-13 15:24:05.665804',1,3,1,20);
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_bloguser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_bloguser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_bloguser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-11 14:36:30.056762','2','python',1,'[{\"added\": {}}]',12,1),(2,'2018-05-11 14:37:09.191460','2','测试文章',1,'[{\"added\": {}}]',9,1),(3,'2018-05-11 14:44:35.528012','2','测试文章',2,'[]',9,1),(4,'2018-05-11 14:48:33.201230','1','我是一个程序员',1,'[{\"added\": {}}]',16,1),(5,'2018-05-11 14:50:40.837339','1','只为花开的博客',1,'[{\"added\": {}}]',10,1),(6,'2018-05-12 03:15:50.602209','3','情感文章',1,'[{\"added\": {}}]',12,1),(7,'2018-05-12 03:20:41.003201','2','测试文章',2,'[{\"changed\": {\"fields\": [\"body\", \"category\"]}}]',9,1),(8,'2018-05-12 03:30:47.940845','4','matlab',1,'[{\"added\": {}}]',12,1),(9,'2018-05-12 03:30:52.300780','3','matlab',1,'[{\"added\": {}}]',9,1),(10,'2018-05-12 03:31:32.553557','5','route',1,'[{\"added\": {}}]',12,1),(11,'2018-05-12 03:31:35.107231','4','锐捷无线',1,'[{\"added\": {}}]',9,1),(12,'2018-05-12 03:33:01.525717','5','dajngo',1,'[{\"added\": {}}]',9,1),(13,'2018-05-12 12:50:44.969607','3','电子邮件地址不会被公开',3,'',16,1),(14,'2018-05-12 14:29:37.424850','1','python',1,'[{\"added\": {}}]',11,1),(15,'2018-05-12 14:29:54.786443','2','django',1,'[{\"added\": {}}]',11,1),(16,'2018-05-12 14:30:03.098993','3','route',1,'[{\"added\": {}}]',11,1),(17,'2018-05-12 14:30:12.315129','2','测试文章',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',9,1),(18,'2018-05-12 14:57:34.226104','1','我是一个程序员',2,'[{\"changed\": {\"fields\": [\"parent_comment\"]}}]',16,1),(19,'2018-05-12 14:58:07.806922','5','我是只为花开',2,'[{\"changed\": {\"fields\": [\"parent_comment\"]}}]',16,1),(20,'2018-05-12 15:32:10.678186','6','django',1,'[{\"added\": {}}]',12,1),(21,'2018-05-12 15:32:20.544186','7','flask',1,'[{\"added\": {}}]',12,1),(22,'2018-05-12 15:32:39.739635','8','pillow',1,'[{\"added\": {}}]',12,1),(23,'2018-05-13 03:25:38.004391','6','关于博主',1,'[{\"added\": {}}]',9,1),(24,'2018-05-13 05:50:22.199734','6','ok',3,'',16,1),(25,'2018-05-13 05:50:39.102801','4','发表评论',3,'',16,1),(26,'2018-05-13 05:50:39.107167','5','我是只为花开',3,'',16,1),(27,'2018-05-13 05:50:39.110229','7','kk',3,'',16,1),(28,'2018-05-13 08:01:25.079449','2','测试文章',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(29,'2018-05-13 08:02:30.573190','2','测试文章',3,'',9,1),(30,'2018-05-13 08:03:24.531664','7','那个天使',1,'[{\"added\": {}}]',9,1),(31,'2018-05-13 09:12:35.014660','7','那个天使',2,'[{\"changed\": {\"fields\": [\"comment_status\"]}}]',9,1),(32,'2018-05-13 09:17:35.447938','7','那个天使',2,'[{\"changed\": {\"fields\": [\"comment_status\"]}}]',9,1),(33,'2018-05-13 09:44:14.117281','3','465728296@qq.com',2,'[{\"changed\": {\"fields\": [\"last_login\", \"mugshot\"]}}]',13,1),(34,'2018-05-13 13:12:24.808315','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(35,'2018-05-13 13:13:41.299250','5','dajngo',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(36,'2018-05-13 13:15:24.714098','5','dajngo',2,'[{\"changed\": {\"fields\": [\"pub_time\", \"tags\"]}}]',9,1),(37,'2018-05-14 14:31:28.994423','8','Django 国际化实例及原理分析',1,'[{\"added\": {}}]',9,1),(38,'2018-05-14 14:32:07.821388','9','Django 国际化简介',1,'[{\"added\": {}}]',9,1),(39,'2018-05-14 14:33:03.166033','10','针对 Python 代码的国际化实例及原理分析',1,'[{\"added\": {}}]',9,1),(40,'2018-05-14 14:36:37.286858','4','锐捷无线',3,'',9,1),(41,'2018-05-14 14:36:44.389395','7','那个天使',2,'[{\"changed\": {\"fields\": [\"pub_time\"]}}]',9,1),(42,'2018-05-14 14:36:52.038750','6','关于博主',2,'[{\"changed\": {\"fields\": [\"body\", \"pub_time\"]}}]',9,1),(43,'2018-05-14 14:37:06.459538','5','dajngo',2,'[{\"changed\": {\"fields\": [\"pub_time\"]}}]',9,1),(44,'2018-05-14 14:37:21.138169','3','matlab',2,'[{\"changed\": {\"fields\": [\"body\", \"pub_time\"]}}]',9,1),(45,'2018-05-15 09:43:52.373133','1','只为花开的博客',2,'[{\"changed\": {\"fields\": [\"sidebar_article_count\"]}}]',10,1),(46,'2018-05-15 11:48:28.076505','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(47,'2018-05-15 12:03:29.110211','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(48,'2018-05-15 12:03:51.766143','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(49,'2018-05-15 12:19:46.038189','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(50,'2018-05-15 12:28:59.210980','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(51,'2018-05-15 12:55:24.146693','7','那个天使',2,'[]',9,1),(52,'2018-05-15 12:58:08.693180','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(53,'2018-05-15 13:01:56.593014','7','那个天使',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(54,'2018-05-15 13:10:49.402376','6','关于博主',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1),(55,'2018-05-15 13:11:13.559636','6','关于博主',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'accounts','bloguser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'blog','article'),(10,'blog','blogsettings'),(12,'blog','category'),(8,'blog','links'),(7,'blog','sidebar'),(11,'blog','tag'),(16,'comments','comment'),(4,'contenttypes','contenttype'),(14,'oauth','oauthconfig'),(15,'oauth','oauthuser'),(5,'sessions','session'),(6,'sites','site');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-11 14:18:27.942189'),(2,'contenttypes','0002_remove_content_type_name','2018-05-11 14:18:27.985409'),(3,'auth','0001_initial','2018-05-11 14:18:28.121359'),(4,'auth','0002_alter_permission_name_max_length','2018-05-11 14:18:28.149161'),(5,'auth','0003_alter_user_email_max_length','2018-05-11 14:18:28.156082'),(6,'auth','0004_alter_user_username_opts','2018-05-11 14:18:28.162114'),(7,'auth','0005_alter_user_last_login_null','2018-05-11 14:18:28.169438'),(8,'auth','0006_require_contenttypes_0002','2018-05-11 14:18:28.172060'),(9,'auth','0007_alter_validators_add_error_messages','2018-05-11 14:18:28.177511'),(10,'auth','0008_alter_user_username_max_length','2018-05-11 14:18:28.184571'),(11,'auth','0009_alter_user_last_name_max_length','2018-05-11 14:18:28.190554'),(12,'accounts','0001_initial','2018-05-11 14:18:28.372334'),(13,'admin','0001_initial','2018-05-11 14:18:28.441242'),(14,'admin','0002_logentry_remove_auto_add','2018-05-11 14:18:28.450218'),(15,'blog','0001_initial','2018-05-11 14:18:28.766054'),(16,'oauth','0001_initial','2018-05-11 14:18:28.829905'),(17,'sessions','0001_initial','2018-05-11 14:18:28.854477'),(18,'sites','0001_initial','2018-05-11 14:18:28.871038'),(19,'sites','0002_alter_domain_unique','2018-05-11 14:18:28.883769'),(20,'comments','0001_initial','2018-05-11 14:47:53.746253'),(21,'blog','0002_auto_20180513_1309','2018-05-13 13:09:19.961109');
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
INSERT INTO `django_session` VALUES ('0xkvsgcs0lpzgxrp7x7lso3karpmfzo7','YzcxOWFiNTBhYTQ0OTYwMDBiNDJiMTY5M2FiODk1NmJhMDZhN2UxYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkNzliYWE4ZjNkZjczZmY2NWY0MDdkNzcxNDI2N2ZiN2U1YjVjMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-26 04:33:21.374963'),('kub6nszi4brq7xxcv0oexghxfyzsaxk8','NTFhNTZhZmU5ODcyMGVjNDAyZjQzMWRjMWRiOWRkYWE3MGFiYjUyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQ3OWJhYThmM2RmNzNmZjY1ZjQwN2Q3NzE0MjY3ZmI3ZTViNWMwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-05-26 03:14:54.548890'),('liak0bzr0l99p8a9npicy1glpj5wtasx','OGVmNTVmNDM3MTM2ODg4NzhlM2I2ZjE3ZjA0OTcyN2UxYWE1MGU2ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkNzliYWE4ZjNkZjczZmY2NWY0MDdkNzcxNDI2N2ZiN2U1YjVjMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhY2NvdW50cy51c2VyX2xvZ2luX2JhY2tlbmQuRW1haWxPclVzZXJuYW1lTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-26 06:13:32.669173'),('qor3h4y0ygadfh1ror5pejtrgryy6c5i','NTFhNTZhZmU5ODcyMGVjNDAyZjQzMWRjMWRiOWRkYWE3MGFiYjUyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQ3OWJhYThmM2RmNzNmZjY1ZjQwN2Q3NzE0MjY3ZmI3ZTViNWMwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-05-25 14:28:04.077681'),('x4fcwlc9gi3igc4uth0kxg3u00enavc6','ZTJiNjQ0ZWNhN2I2MjQ4ZWZhY2NmZTFhMDgwOGMzMzAyOTAxOWRiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLnVzZXJfbG9naW5fYmFja2VuZC5FbWFpbE9yVXNlcm5hbWVNb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZDc5YmFhOGYzZGY3M2ZmNjVmNDA3ZDc3MTQyNjdmYjdlNWI1YzAzIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-26 15:12:27.107596'),('yw4k5m8ka1xf1h7m5f33tmtdzbm01yop','NzZjMDVlYTQ3MTg5YjkxMTYyMTYwMjk2YjI4ZWQ4YzA0Zjg5NDJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLnVzZXJfbG9naW5fYmFja2VuZC5FbWFpbE9yVXNlcm5hbWVNb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjFkNzliYWE4ZjNkZjczZmY2NWY0MDdkNzcxNDI2N2ZiN2U1YjVjMDMifQ==','2018-05-26 15:31:14.308519'),('zuw7eip6mko6sxlb7amx4elmm5vuulbm','OGVmNTVmNDM3MTM2ODg4NzhlM2I2ZjE3ZjA0OTcyN2UxYWE1MGU2ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkNzliYWE4ZjNkZjczZmY2NWY0MDdkNzcxNDI2N2ZiN2U1YjVjMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhY2NvdW50cy51c2VyX2xvZ2luX2JhY2tlbmQuRW1haWxPclVzZXJuYW1lTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-29 12:03:09.258830');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_oauthconfig`
--

DROP TABLE IF EXISTS `oauth_oauthconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_oauthconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `appkey` varchar(200) NOT NULL,
  `appsecret` varchar(200) NOT NULL,
  `callback_url` varchar(200) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_oauthconfig`
--

LOCK TABLES `oauth_oauthconfig` WRITE;
/*!40000 ALTER TABLE `oauth_oauthconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_oauthconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_oauthuser`
--

DROP TABLE IF EXISTS `oauth_oauthuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_oauthuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nikename` varchar(50) NOT NULL,
  `token` varchar(150) DEFAULT NULL,
  `picture` varchar(350) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `matedata` varchar(3000) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_oauthuser_author_id_a975bef0_fk_accounts_bloguser_id` (`author_id`),
  CONSTRAINT `oauth_oauthuser_author_id_a975bef0_fk_accounts_bloguser_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_bloguser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_oauthuser`
--

LOCK TABLES `oauth_oauthuser` WRITE;
/*!40000 ALTER TABLE `oauth_oauthuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_oauthuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-15 21:27:21
