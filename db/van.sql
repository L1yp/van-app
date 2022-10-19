-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: van
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `van`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `van` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `van`;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `id` bigint unsigned NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
  `simple_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门简称',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门描述',
  `ident` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门编号',
  `order_no` int DEFAULT '0',
  `pid` bigint DEFAULT NULL COMMENT '行政上级',
  `biz_pid` bigint DEFAULT '0' COMMENT '业务上级',
  `owner` bigint DEFAULT NULL COMMENT '部门经理',
  `assistant` bigint DEFAULT NULL COMMENT '部门助理',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门电话',
  `office_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '办公地点',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址',
  `status` tinyint NOT NULL DEFAULT '0',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_dept_ident_uindex` (`ident`),
  KEY `sys_dept_pid_order_no_index` (`pid`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,'Admin','Admin','','admin',1,NULL,0,1,1,NULL,NULL,NULL,0,'admin','2022-10-14 14:15:40','2022-02-20 00:33:19'),(2,'全球研发中心-Central Engineering','全球研发中心','','CE',1,1,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 00:56:30'),(3,'总部-HQ','总部','','HQ',2,1,0,2,13,NULL,NULL,NULL,0,'admin','2022-10-14 14:16:08','2022-02-20 00:59:41'),(4,'长沙分公司','长沙','','WL',3,1,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:00:14'),(5,'常州分公司','常州','','EX',4,1,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:14:19'),(6,'杭州分公司','杭州','','DL',5,1,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:14:48'),(7,'CE IT','数字信息','','CE001',1,2,0,8,5,NULL,NULL,NULL,0,'admin','2022-10-14 14:11:43','2022-02-20 01:17:21'),(8,'CE ID','工业设计','','CE013',2,2,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:17:38'),(9,'CE Intelligent S&T','智能设计院','','CE006',3,2,0,1,2,NULL,NULL,NULL,0,'admin','2022-10-14 14:11:06','2022-02-20 01:18:31'),(10,'CE Big Data & AI R&D','大数据','','CE014',1,9,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:18:48'),(11,'CE Smart Jobsite R&D','智能施工','','CE016',3,9,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:24:25'),(12,'CE Smart Machine R&D','智能产品','','CE015',4,9,0,NULL,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-02-20 01:26:03'),(13,'数字信息','总部DT','总部DT','HQ-DT',1,3,0,1,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-08-26 00:50:28'),(14,'信息技术','HQ-IT','总部IT','HQ-IT',2,3,0,1,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-08-26 21:56:08'),(15,'宁波分公司','宁波','1111111111','NB',5,1,0,2,NULL,NULL,NULL,NULL,0,'admin','2022-10-14 11:02:50','2022-09-08 12:05:28'),(1580801456333443073,'市场营销','市场部','','Market',4,2,0,1,1,NULL,NULL,NULL,0,'admin','2022-10-14 14:05:54','2022-10-14 14:03:31');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pid` bigint unsigned DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order_no` int NOT NULL DEFAULT '1',
  `closeable` tinyint DEFAULT '1',
  `state` int DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'Dashboard',NULL,'PAGE','/home','/home','House',1,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(2,'系统管理',NULL,'FOLDER',NULL,NULL,'Setting',2,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(3,'用户管理',2,'PAGE','/sys/user','/sys/user/user','User',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(4,'角色管理',2,'PAGE','/sys/role','/sys/role/role','UserRole',2,1,0,NULL,1,'2022-10-14 16:34:03',1,'2022-10-05 23:10:20'),(5,'菜单管理',2,'PAGE','/sys/menus','/sys/menu/menus','Menu',3,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:10:20'),(6,'部门管理',2,'PAGE','/sys/dept','/sys/dept/dept','Department',4,1,0,NULL,1,'2022-10-14 08:38:19',1,'2022-10-05 23:11:48'),(7,'字典配置',2,'PAGE','/sys/dict','/sys/dict','config',5,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:11:48'),(8,'权限管理',2,'PAGE','/sys/permission','/sys/permission','UserRole',6,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:11:48'),(9,'个人设置',NULL,'FOLDER',NULL,NULL,'UserSettings',3,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(10,'个人信息',9,'PAGE','/user/profile','/user/profile','UserProfile',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:14:50'),(11,'修改密码',9,'PAGE','/user/password','/user/password','Password',2,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:14:50'),(12,'流程管理',NULL,'FOLDER',NULL,NULL,'Cluster',4,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:15:50'),(13,'待认领流程',12,'PAGE','/process/task/unclaim','/process/task/unclaim','InstanceVirtual',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:16:24'),(14,'我的待办',12,'PAGE','/process/task/todo','/process/task/todo','Task',2,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:16:24'),(15,'我经办的流程',12,'PAGE','/process/manage/history/mine','/process/manage/history/mine','Task',3,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:16:24'),(16,'流程设计',NULL,'FOLDER',NULL,NULL,'Cluster',5,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:18:00'),(17,'流程模型',16,'PAGE','/process/model','/process/model','Cluster',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:25:33'),(18,'流程表单',16,'PAGE','/process/form/designer','/process/form/designer','Form',2,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:25:33'),(1580568369258364930,'创建用户',3,'BUTTON',NULL,'sysetm:user:create','Setting',2,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-13 22:37:19');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ident` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `owner_menu_id` bigint DEFAULT '0' COMMENT '所属菜单页面ID',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_permission_ident_uindex` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'system:user:query',3,'admin','2022-04-05 16:38:36'),(2,'system:user:update',3,'admin','2022-04-06 08:15:07'),(3,'system:user:delete',3,'admin','2022-04-06 08:15:14'),(4,'system:user:create',3,'admin','2022-04-06 08:15:18'),(5,'system:user:export',3,'admin','2022-04-05 16:31:31');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'系统管理员',1,0,'admin','2022-02-18 17:54:42','2022-02-18 17:54:42'),(2,'董事长',2,0,'admin','2022-02-18 17:54:58','2022-02-18 17:54:58'),(3,'总经理',3,0,'admin','2022-02-18 17:55:04','2022-02-18 17:55:04'),(4,'总监',4,0,'admin','2022-02-18 17:55:11','2022-02-18 17:55:11'),(5,'主管',5,0,'admin','2022-02-18 17:55:18','2022-02-18 17:55:18'),(7,'成员',7,0,'admin','2022-02-18 17:55:28','2022-02-18 17:55:28');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_role_menu_role_id_menu_id_uindex` (`role_id`,`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1581799650580299794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1581799622017089537,1,1,'admin'),(1581799622017089538,1,2,'admin'),(1581799622017089539,1,3,'admin'),(1581799622017089540,1,4,'admin'),(1581799622017089541,1,5,'admin'),(1581799622017089542,1,6,'admin'),(1581799622017089543,1,9,'admin'),(1581799622017089544,1,10,'admin'),(1581799622017089545,1,11,'admin'),(1581799622017089546,1,12,'admin'),(1581799622017089547,1,13,'admin'),(1581799622017089548,1,14,'admin'),(1581799622017089549,1,15,'admin'),(1581799622038061058,1,16,'admin'),(1581799622038061059,1,17,'admin'),(1581799622038061060,1,18,'admin'),(1581799650580299778,2,1,'admin'),(1581799650580299779,2,2,'admin'),(1581799650580299780,2,3,'admin'),(1581799650580299781,2,4,'admin'),(1581799650580299782,2,5,'admin'),(1581799650580299783,2,6,'admin'),(1581799650580299784,2,9,'admin'),(1581799650580299785,2,10,'admin'),(1581799650580299786,2,11,'admin'),(1581799650580299787,2,12,'admin'),(1581799650580299788,2,13,'admin'),(1581799650580299789,2,14,'admin'),(1581799650580299790,2,15,'admin'),(1581799650580299791,2,16,'admin'),(1581799650580299792,2,17,'admin'),(1581799650580299793,2,18,'admin');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `permission_id` bigint DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_role_permission_role_id_permission_id_uindex` (`role_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色权限表格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (17,1,1,'admin','2022-04-15 18:37:07'),(18,1,2,'admin','2022-04-15 18:37:07'),(19,1,3,'admin','2022-04-15 18:37:07'),(20,1,4,'admin','2022-04-15 18:37:07'),(21,1,5,'admin','2022-04-15 18:37:07'),(22,2,1,'admin','2022-04-15 18:37:40'),(23,2,2,'admin','2022-04-15 18:37:40'),(24,2,3,'admin','2022-04-15 18:37:40'),(25,2,4,'admin','2022-04-15 18:37:40'),(26,2,5,'admin','2022-04-15 18:37:40'),(27,3,1,'admin','2022-04-15 18:37:45'),(28,3,2,'admin','2022-04-15 18:37:45'),(29,3,3,'admin','2022-04-15 18:37:45'),(30,3,4,'admin','2022-04-15 18:37:45'),(31,3,5,'admin','2022-04-15 18:37:45');
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `register_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'username',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_username_uindex` (`username`),
  UNIQUE KEY `sys_user_email_uindex` (`email`),
  UNIQUE KEY `sys_user_phone_uindex` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin',7,'Admin','e10adc3949ba59abbe56e057f20f883e','18877811997','https://q4.qlogo.cn/g?b=qq&nk=942664114&s=0',NULL,0,'admin','l1yp@qq.com','2022-10-13 09:00:47','2022-02-16 15:32:27'),(2,'A52747',7,'不知火舞','e10adc3949ba59abbe56e057f20f883e','18077855148','https://q4.qlogo.cn/g?b=qq&nk=10001',NULL,0,'1','12353@qq.com','2022-10-14 14:26:52','2022-02-22 21:30:42'),(3,'A52736',8,'伽罗','e10adc3949ba59abbe56e057f20f883e','18077855137','/head/伽罗.jpg',NULL,0,'admin','18877185@qq.com','2022-10-12 23:46:09','2022-02-22 20:11:26'),(4,'A52737',9,'公孙离','e10adc3949ba59abbe56e057f20f883e','18077855138','/head/公孙离.jpg',NULL,0,'admin','18877195@qq.com','2022-10-12 23:46:13','2022-02-22 20:16:56'),(5,'A52738',10,'刘禅','e10adc3949ba59abbe56e057f20f883e','18077855139','/head/刘禅.jpg',NULL,0,'admin','35295921@qq.com','2022-10-12 23:46:18','2022-02-22 21:12:05'),(6,'A52739',4,'大乔','e10adc3949ba59abbe56e057f20f883e','18077855140','/head/大乔.jpg',NULL,0,'admin','12345@qq.com','2022-10-12 23:49:20','2022-02-22 21:12:05'),(7,'A52740',5,'嫦娥','e10adc3949ba59abbe56e057f20f883e','18077855141','/head/嫦娥.jpg',NULL,0,'admin','12346@qq.com','2022-10-12 23:50:03','2022-02-22 21:12:05'),(8,'A52741',6,'安琪拉','e10adc3949ba59abbe56e057f20f883e','18077855142','/head/安琪拉.jpg',NULL,0,'admin','12347@qq.com','2022-10-12 23:50:07','2022-02-22 21:12:05'),(9,'A52742',15,'李白','e10adc3949ba59abbe56e057f20f883e','18077855143','/head/李白.jpg',NULL,0,'admin','12348@qq.com','2022-10-12 23:50:12','2022-02-22 21:12:06'),(10,'A52743',13,'瑶','e10adc3949ba59abbe56e057f20f883e','18077855144','/head/瑶.jpg',NULL,0,'admin','12349@qq.com','2022-10-12 23:50:16','2022-02-22 21:12:06'),(12,'A52744',3,'甄姬','e10adc3949ba59abbe56e057f20f883e','18077855145','/head/甄姬.jpg',NULL,0,'admin','12350@qq.com','2022-10-12 23:50:22','2022-02-22 21:30:41'),(13,'A52745',14,'百里玄策','e10adc3949ba59abbe56e057f20f883e','18077855146','/head/百里玄策.jpg',NULL,0,'admin','12351@qq.com','2022-10-12 23:50:25','2022-02-22 21:30:41'),(14,'A52746',11,'花木兰','e10adc3949ba59abbe56e057f20f883e','18077855147','/head/花木兰.jpg',NULL,0,'admin','12352@qq.com','2022-10-12 23:50:30','2022-02-22 21:30:41'),(17,'A52751',8,'虞姬','e10adc3949ba59abbe56e057f20f883e','18077855152','/head/虞姬.jpg',NULL,0,NULL,'12357@qq.com','2022-10-12 23:54:13','2022-06-08 22:57:12'),(18,'A52748',7,'西施','e10adc3949ba59abbe56e057f20f883e','18077855149','/head/西施.jpg',NULL,0,NULL,'12354@qq.com','2022-10-12 23:52:32','2022-06-08 22:57:12'),(19,'A52749',7,'诸葛亮','e10adc3949ba59abbe56e057f20f883e','18077855150','/head/诸葛亮.jpg',NULL,0,NULL,'12355@qq.com','2022-10-12 23:52:39','2022-06-08 22:57:12'),(20,'A52750',7,'貂蝉','e10adc3949ba59abbe56e057f20f883e','18077855151','/head/貂蝉.jpg',NULL,0,NULL,'12356@qq.com','2022-10-12 23:52:44','2022-06-08 22:57:12');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_dept`
--

DROP TABLE IF EXISTS `sys_user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `dept_id` bigint DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_dept_uid_dept_id_uindex` (`uid`,`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1580807330078765063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='兼职部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_dept`
--

LOCK TABLES `sys_user_dept` WRITE;
/*!40000 ALTER TABLE `sys_user_dept` DISABLE KEYS */;
INSERT INTO `sys_user_dept` VALUES (1580448967646068737,1,2,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068738,1,3,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068739,1,7,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068740,1,8,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068741,1,9,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580807330078765058,2,2,'1','2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765059,2,3,'1','2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765060,2,7,'1','2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765061,2,8,'1','2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765062,2,9,'1','2022-10-14 14:26:52','2022-10-14 14:26:52');
/*!40000 ALTER TABLE `sys_user_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1580807330103930882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (20,4,1,'admin','2022-04-08 00:17:27','2022-04-08 00:17:27'),(21,5,1,'admin','2022-04-08 00:17:31','2022-04-08 00:17:31'),(22,6,1,'admin','2022-04-08 00:17:39','2022-04-08 00:17:39'),(24,3,1,'admin','2022-05-19 08:40:12','2022-05-19 08:40:12'),(25,7,1,'admin','2022-05-19 08:40:22','2022-05-19 08:40:22'),(26,8,1,'admin','2022-05-19 08:40:28','2022-05-19 08:40:28'),(27,9,1,'admin','2022-05-19 08:40:31','2022-05-19 08:40:31'),(28,10,1,'admin','2022-05-19 08:40:33','2022-05-19 08:40:33'),(29,12,1,'admin','2022-05-19 08:40:36','2022-05-19 08:40:36'),(30,13,1,'admin','2022-05-19 08:40:39','2022-05-19 08:40:39'),(31,14,1,'admin','2022-05-19 08:40:45','2022-05-19 08:40:45'),(1580448967646068742,1,1,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068743,1,2,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068744,1,3,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068745,1,4,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068746,1,5,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068747,1,6,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068748,1,7,'admin','2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580807330103930881,2,1,'1','2022-10-14 14:26:52','2022-10-14 14:26:52');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_field_def`
--

DROP TABLE IF EXISTS `workflow_field_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_field_def` (
  `id` bigint unsigned NOT NULL,
  `field` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT '数据库字段/表单字段',
  `label` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '字段名/表单字段名',
  `remark` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段说明',
  `width` int NOT NULL DEFAULT '0' COMMENT '字段宽度',
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '字段组件类型',
  `scheme` varchar(1024) COLLATE utf8mb4_bin NOT NULL COMMENT '字段定义',
  `scope` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'PRIVATE: 私有字段\nGLOBAL: 公共字段\nDEFAULT: 默认字段',
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_field_def`
--

LOCK TABLES `workflow_field_def` WRITE;
/*!40000 ALTER TABLE `workflow_field_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_field_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_field_ref`
--

DROP TABLE IF EXISTS `workflow_field_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_field_ref` (
  `id` bigint unsigned NOT NULL,
  `wf_key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `field_id` bigint unsigned NOT NULL,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wf_field_idx` (`wf_key`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段引用关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_field_ref`
--

LOCK TABLES `workflow_field_ref` WRITE;
/*!40000 ALTER TABLE `workflow_field_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_field_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_option_type`
--

DROP TABLE IF EXISTS `workflow_option_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_option_type` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '信息名称',
  `remark` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明',
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='工作流选项类型定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_option_type`
--

LOCK TABLES `workflow_option_type` WRITE;
/*!40000 ALTER TABLE `workflow_option_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_option_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_option_value`
--

DROP TABLE IF EXISTS `workflow_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_option_value` (
  `id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `disabled` tinyint NOT NULL DEFAULT '0',
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程选项值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_option_value`
--

LOCK TABLES `workflow_option_value` WRITE;
/*!40000 ALTER TABLE `workflow_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_type_def`
--

DROP TABLE IF EXISTS `workflow_type_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_type_def` (
  `id` bigint unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程标识',
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `code_gen_rule` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '编码生成规则',
  `status` int DEFAULT NULL,
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `def_key_uidx` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='流程类型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_type_def`
--

LOCK TABLES `workflow_type_def` WRITE;
/*!40000 ALTER TABLE `workflow_type_def` DISABLE KEYS */;
INSERT INTO `workflow_type_def` VALUES (1582616365887213570,'holiday','请假流程','用于员工请假的流程','{}',1,1,'2022-10-19 14:15:19',1,'2022-10-19 14:15:19');
/*!40000 ALTER TABLE `workflow_type_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_type_ver`
--

DROP TABLE IF EXISTS `workflow_type_ver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_type_ver` (
  `id` bigint unsigned NOT NULL,
  `wf_key` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '流程类型标识',
  `ver` int NOT NULL COMMENT '版本',
  `remark` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '升级备注',
  `status` tinyint NOT NULL COMMENT '激活状态: 0=挂起, 1=激活',
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xml` text COLLATE utf8mb4_bin NOT NULL,
  `process_definition_id` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程定义ID',
  PRIMARY KEY (`id`),
  KEY `def_id_idx` (`wf_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程模型版本管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_type_ver`
--

LOCK TABLES `workflow_type_ver` WRITE;
/*!40000 ALTER TABLE `workflow_type_ver` DISABLE KEYS */;
INSERT INTO `workflow_type_ver` VALUES (1582616365887213571,'holiday',1,'初始化',0,1,'2022-10-19 14:15:19',1,'2022-10-19 14:15:19','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\">\n    <process id=\"holiday\" name=\"请假流程\">\n        <startEvent id=\"startEvent_233ca0e\" name=\"开始\" flowable:initiator=\"creator\" />\n    </process>\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\n        <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"holiday\">\n            <bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"startEvent_233ca0e\">\n                <dc:Bounds x=\"156\" y=\"81\" width=\"36\" height=\"36\" />\n            </bpmndi:BPMNShape>\n        </bpmndi:BPMNPlane>\n    </bpmndi:BPMNDiagram>\n</definitions>\n',NULL);
/*!40000 ALTER TABLE `workflow_type_ver` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 14:16:38
