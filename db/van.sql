-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: van
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `ACT_APP_APPDEF`
--

DROP TABLE IF EXISTS `ACT_APP_APPDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_APPDEF`
--

LOCK TABLES `ACT_APP_APPDEF` WRITE;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOG`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2022-06-06 17:53:45',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'4.5.0',NULL,NULL,'4509225710'),('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2022-06-06 17:53:45',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'4.5.0',NULL,NULL,'4509225710'),('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2022-06-06 17:53:46',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'4.5.0',NULL,NULL,'4509225710');
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT`
--

LOCK TABLES `ACT_APP_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_APP_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_CONTENT_ITEM`
--

DROP TABLE IF EXISTS `ACT_CO_CONTENT_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_CO_CONTENT_ITEM` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_SIZE_` bigint DEFAULT '0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `idx_contitem_taskid` (`TASK_ID_`),
  KEY `idx_contitem_procid` (`PROC_INST_ID_`),
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_CONTENT_ITEM`
--

LOCK TABLES `ACT_CO_CONTENT_ITEM` WRITE;
/*!40000 ALTER TABLE `ACT_CO_CONTENT_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CO_CONTENT_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_CO_DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_DATABASECHANGELOG`
--

LOCK TABLES `ACT_CO_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_CO_DATABASECHANGELOG` VALUES ('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2022-06-06 17:53:45',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.5.0',NULL,NULL,'4509225531'),('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2022-06-06 17:53:45',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.5.0',NULL,NULL,'4509225531');
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_CO_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_CO_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_CO_DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_EVT_LOG`
--

LOCK TABLES `ACT_EVT_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_EVT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_EVT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('0e27787c-e598-11ec-a357-00e0705f49db',1,'zhicheng.bpmn20.xml','0e27787b-e598-11ec-a357-00e0705f49db',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:candidateGroups=\"董事长,总经理\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener event=\"complete\" class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"judge\" flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"不通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"不通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"9\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-15\" y=\"1893\" width=\"33\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"539\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"227\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-343\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-470\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-778\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-644\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-215\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('97c1c09a-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng.bpmn20.xml','97c1c099-e57e-11ec-87e2-d8bbc132d9b2',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener event=\"complete\" class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"judge\" flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"不通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"不通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"9\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-15\" y=\"1893\" width=\"33\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"539\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"227\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-343\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-470\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-778\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-644\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-215\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('batch.schema.version','6.7.2.0',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.7.2.0',1),('entitylink.schema.version','6.7.2.0',1),('eventsubscription.schema.version','6.7.2.0',1),('identitylink.schema.version','6.7.2.0',1),('job.schema.version','6.7.2.0',1),('next.dbid','1',1),('schema.history','create(6.7.2.0)',1),('schema.version','6.7.2.0',1),('task.schema.version','6.7.2.0',1),('variable.schema.version','6.7.2.0',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_ACTINST` VALUES ('1c49a283-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-06-06 20:56:41.402','2022-06-06 20:56:41.410',1,8,NULL,''),('1c4b7744-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Flow_1pl8zw7',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-06-06 20:56:41.414','2022-06-06 20:56:41.414',2,0,NULL,''),('1c4b7745-e598-11ec-a357-00e0705f49db',2,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Activity_0jqew3r','1c4e5d76-e598-11ec-a357-00e0705f49db',NULL,'填报申请（平台端）','userTask','1','2022-06-06 20:56:41.414','2022-06-06 20:56:52.370',3,10956,NULL,''),('22d3862a-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 20:56:52.372','2022-06-06 20:56:52.372',1,0,NULL,''),('22d3ad3b-e598-11ec-a357-00e0705f49db',3,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Activity_0vdh1ks','22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,'后台管理单位初审(登录单位帐号)','userTask',NULL,'2022-06-06 20:56:52.373',NULL,2,NULL,NULL,''),('9f2b55e1-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-06-06 17:54:14.070','2022-06-06 17:54:14.072',1,2,NULL,''),('9f2bcb12-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_1pl8zw7',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-06-06 17:54:14.073','2022-06-06 17:54:14.073',2,0,NULL,''),('9f2bcb13-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0jqew3r','9f2c6754-e57e-11ec-87e2-d8bbc132d9b2',NULL,'填报申请（平台端）','userTask','1','2022-06-06 17:54:14.073','2022-06-06 17:54:16.073',3,2000,NULL,''),('a05d4638-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 17:54:16.075','2022-06-06 17:54:16.075',1,0,NULL,''),('a05d4639-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0vdh1ks','a05d463a-e57e-11ec-87e2-d8bbc132d9b2',NULL,'后台管理单位初审(登录单位帐号)','userTask','1','2022-06-06 17:54:16.075','2022-06-06 17:54:17.516',2,1441,NULL,''),('a13a11ad-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_0tgdtni',NULL,NULL,'通过','sequenceFlow',NULL,'2022-06-06 17:54:17.522','2022-06-06 17:54:17.522',1,0,NULL,''),('a13a5fce-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0lfb8i2','a13a5fcf-e57e-11ec-87e2-d8bbc132d9b2',NULL,'平台端(上传文档)','userTask','1','2022-06-06 17:54:17.524','2022-06-06 17:54:18.550',2,1026,NULL,''),('a1d71502-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_13rvobl',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 17:54:18.551','2022-06-06 17:54:18.551',1,0,NULL,''),('a1d73c13-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0asr136','a1d73c14-e57e-11ec-87e2-d8bbc132d9b2',NULL,'后台管理端单位-初审公示(登录单位帐号)','userTask','1','2022-06-06 17:54:18.552','2022-06-06 17:54:20.060',2,1508,NULL,''),('a2bda477-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_1w0sc1q',NULL,NULL,'通过','sequenceFlow',NULL,'2022-06-06 17:54:20.062','2022-06-06 17:54:20.062',1,0,NULL,''),('a2bdcb88-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_042mne5','a2bdcb89-e57e-11ec-87e2-d8bbc132d9b2',NULL,'初审公示-待排序','userTask','1','2022-06-06 17:54:20.063','2022-06-06 17:54:21.331',2,1268,NULL,''),('a37f6ddc-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_0z74unv',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 17:54:21.332','2022-06-06 17:54:21.332',1,0,NULL,''),('a37f94ed-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0ruapc4','a37f94ee-e57e-11ec-87e2-d8bbc132d9b2',NULL,'后台管理端集团-形式审查(登录集团帐号)','userTask','1','2022-06-06 17:54:21.333','2022-06-06 17:54:23.226',2,1893,NULL,''),('a4a06e41-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_1oo9arp',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 17:54:23.227','2022-06-06 17:54:23.227',1,0,NULL,''),('a4a09552-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_14z3c2k','a4a09553-e57e-11ec-87e2-d8bbc132d9b2',NULL,'形式审查-待审核(查看申报材料)','userTask','1','2022-06-06 17:54:23.227','2022-06-06 17:54:25.173',2,1946,NULL,''),('a5cae486-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_0bctl9z',NULL,NULL,'退回','sequenceFlow',NULL,'2022-06-06 17:54:25.182','2022-06-06 17:54:25.182',1,0,NULL,''),('a5cb0b97-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Gateway_1micijx',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-06-06 17:54:25.183','2022-06-06 17:54:25.193',2,10,NULL,''),('a5cc9238-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_161kj6z',NULL,NULL,'首次退回','sequenceFlow',NULL,'2022-06-06 17:54:25.193','2022-06-06 17:54:25.193',3,0,NULL,''),('a5ccb949-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_1o3oq6z','a5ccb94a-e57e-11ec-87e2-d8bbc132d9b2',NULL,'单位管理员\n(形式审查退回-待处\n理)','userTask','1','2022-06-06 17:54:25.194','2022-06-06 17:54:26.771',4,1577,NULL,''),('a6bda8fd-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_1ovqlr8',NULL,NULL,'退回形式审查','sequenceFlow',NULL,'2022-06-06 17:54:26.773','2022-06-06 17:54:26.773',1,0,NULL,''),('a6bdd00e-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_14z3c2k','a6bdd00f-e57e-11ec-87e2-d8bbc132d9b2',NULL,'形式审查-待审核(查看申报材料)','userTask','1','2022-06-06 17:54:26.774','2022-06-06 17:54:30.173',2,3399,NULL,''),('a8c4eab2-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_0bctl9z',NULL,NULL,'退回','sequenceFlow',NULL,'2022-06-06 17:54:30.176','2022-06-06 17:54:30.176',1,0,NULL,''),('a8c511c3-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Gateway_1micijx',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-06-06 17:54:30.177','2022-06-06 17:54:30.179',2,2,NULL,''),('a8c55fe4-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_0fgonpp',NULL,NULL,'二次退回','sequenceFlow',NULL,'2022-06-06 17:54:30.179','2022-06-06 17:54:30.179',3,0,NULL,''),('a8c586f5-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Activity_0fkmkhz','a8c586f6-e57e-11ec-87e2-d8bbc132d9b2',NULL,'形式审查不通过-流程结束','userTask','1','2022-06-06 17:54:30.180','2022-06-06 17:54:31.602',4,1422,NULL,''),('a99e81d9-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Flow_09yyg42',NULL,NULL,'归档','sequenceFlow',NULL,'2022-06-06 17:54:31.602','2022-06-06 17:54:31.602',1,0,NULL,''),('a99ecffa-e57e-11ec-87e2-d8bbc132d9b2',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2','Event_1kud1qc',NULL,NULL,'结束','endEvent',NULL,'2022-06-06 17:54:31.604','2022-06-06 17:54:31.605',2,1,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
INSERT INTO `ACT_HI_COMMENT` VALUES ('35ae34ed-e5a0-11ec-86da-00e0705f49db','event','2022-06-06 21:54:39.978',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,'DeleteUserLink','1_|_assignee',NULL),('a6f7bda9-e59e-11ec-8a9a-00e0705f49db','event','2022-06-06 21:43:31.049',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,'AddUserLink','1_|_assignee',NULL);
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
INSERT INTO `ACT_HI_DETAIL` VALUES ('1c492d50-e598-11ec-a357-00e0705f49db','VariableUpdate','1c4869fe-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,'creator','string',0,'2022-06-06 20:56:41.399',NULL,NULL,NULL,'1',NULL),('9f2b2ece-e57e-11ec-87e2-d8bbc132d9b2','VariableUpdate','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,'creator','string',0,'2022-06-06 17:54:14.069',NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ENTITYLINK`
--

LOCK TABLES `ACT_HI_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('1c495461-e598-11ec-a357-00e0705f49db',NULL,'starter','1',NULL,'2022-06-06 20:56:41.400','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL),('1c4eab97-e598-11ec-a357-00e0705f49db',NULL,'assignee','1','1c4e5d76-e598-11ec-a357-00e0705f49db','2022-06-06 20:56:41.435',NULL,NULL,NULL,NULL,NULL),('1c4eab98-e598-11ec-a357-00e0705f49db',NULL,'participant','1',NULL,'2022-06-06 20:56:41.435','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL),('22d22699-e598-11ec-a357-00e0705f49db',NULL,'participant','1',NULL,'2022-06-06 20:56:52.363','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL),('22d3d44d-e598-11ec-a357-00e0705f49db','董事长','candidate',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db','2022-06-06 20:56:52.374',NULL,NULL,NULL,NULL,NULL),('22d4226e-e598-11ec-a357-00e0705f49db','总经理','candidate',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db','2022-06-06 20:56:52.376',NULL,NULL,NULL,NULL,NULL),('35ad4a8c-e5a0-11ec-86da-00e0705f49db',NULL,'assignee',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db','2022-06-06 21:54:39.972',NULL,NULL,NULL,NULL,NULL),('9f2b2ecf-e57e-11ec-87e2-d8bbc132d9b2',NULL,'starter','1',NULL,'2022-06-06 17:54:14.069','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('9f2c8e65-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','9f2c6754-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:14.078',NULL,NULL,NULL,NULL,NULL),('9f2c8e66-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:14.078','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a05c34c7-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:16.068','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a05e57ab-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a05d463a-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:16.082',NULL,NULL,NULL,NULL,NULL),('a1388b0c-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:17.512','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a13a5fd0-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a13a5fcf-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:17.524',NULL,NULL,NULL,NULL,NULL),('a1d651b1-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:18.547','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a1d78a35-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a1d73c14-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:18.554',NULL,NULL,NULL,NULL,NULL),('a2bcba16-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:20.056','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a2bdf29a-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a2bdcb89-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:20.064',NULL,NULL,NULL,NULL,NULL),('a37e837b-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:21.326','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a37fe30f-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a37f94ee-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:21.335',NULL,NULL,NULL,NULL,NULL),('a49ff910-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:23.223','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a4a0e374-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a4a09553-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:23.229',NULL,NULL,NULL,NULL,NULL),('a5c8e8b5-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:25.169','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a5ccb94b-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a5ccb94a-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:25.194',NULL,NULL,NULL,NULL,NULL),('a6bce5ac-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:26.768','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a6be1e30-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a6bdd00f-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:26.776',NULL,NULL,NULL,NULL,NULL),('a6f3ed18-e59e-11ec-8a9a-00e0705f49db',NULL,'assignee','1','22d3ad3c-e598-11ec-a357-00e0705f49db','2022-06-06 21:43:31.024',NULL,NULL,NULL,NULL,NULL),('a8c40051-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:30.170','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL),('a8c5ae07-e57e-11ec-87e2-d8bbc132d9b2',NULL,'assignee','1','a8c586f6-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:30.181',NULL,NULL,NULL,NULL,NULL),('a99e0ca8-e57e-11ec-87e2-d8bbc132d9b2',NULL,'participant','1',NULL,'2022-06-06 17:54:31.599','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_PROCINST` VALUES ('1c4869fe-e598-11ec-a357-00e0705f49db',1,'1c4869fe-e598-11ec-a357-00e0705f49db','2','zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','2022-06-06 20:56:41.394',NULL,NULL,'1','StartEvent_1iig6c2',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',2,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','1','zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','2022-06-06 17:54:14.068','2022-06-06 17:54:31.617',17549,'1','StartEvent_1iig6c2','Event_1kud1qc',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_TASKINST` VALUES ('1c4e5d76-e598-11ec-a357-00e0705f49db',2,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',NULL,'Activity_0jqew3r','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,'填报申请（平台端）',NULL,NULL,NULL,'1','2022-06-06 20:56:41.414',NULL,'2022-06-06 20:56:52.365',10951,NULL,50,NULL,NULL,NULL,'','2022-06-06 20:56:52.365'),('22d3ad3c-e598-11ec-a357-00e0705f49db',3,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',NULL,'Activity_0vdh1ks','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,'后台管理单位初审(登录单位帐号)',NULL,NULL,NULL,NULL,'2022-06-06 20:56:52.373',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2022-06-06 21:54:39.965'),('9f2c6754-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0jqew3r','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'填报申请（平台端）',NULL,NULL,NULL,'1','2022-06-06 17:54:14.073',NULL,'2022-06-06 17:54:16.069',1996,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:16.069'),('a05d463a-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0vdh1ks','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'后台管理单位初审(登录单位帐号)',NULL,NULL,NULL,'1','2022-06-06 17:54:16.075',NULL,'2022-06-06 17:54:17.513',1438,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:17.513'),('a13a5fcf-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0lfb8i2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'平台端(上传文档)',NULL,NULL,NULL,'1','2022-06-06 17:54:17.524',NULL,'2022-06-06 17:54:18.548',1024,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:18.548'),('a1d73c14-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0asr136','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'后台管理端单位-初审公示(登录单位帐号)',NULL,NULL,NULL,'1','2022-06-06 17:54:18.552',NULL,'2022-06-06 17:54:20.057',1505,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:20.057'),('a2bdcb89-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_042mne5','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'初审公示-待排序',NULL,NULL,NULL,'1','2022-06-06 17:54:20.063',NULL,'2022-06-06 17:54:21.328',1265,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:21.328'),('a37f94ee-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0ruapc4','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'后台管理端集团-形式审查(登录集团帐号)',NULL,NULL,NULL,'1','2022-06-06 17:54:21.333',NULL,'2022-06-06 17:54:23.224',1891,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:23.224'),('a4a09553-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_14z3c2k','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'形式审查-待审核(查看申报材料)',NULL,NULL,NULL,'1','2022-06-06 17:54:23.227',NULL,'2022-06-06 17:54:25.170',1943,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:25.170'),('a5ccb94a-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_1o3oq6z','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'单位管理员\n(形式审查退回-待处\n理)',NULL,NULL,NULL,'1','2022-06-06 17:54:25.194',NULL,'2022-06-06 17:54:26.769',1575,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:26.769'),('a6bdd00f-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_14z3c2k','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'形式审查-待审核(查看申报材料)',NULL,NULL,NULL,'1','2022-06-06 17:54:26.774',NULL,'2022-06-06 17:54:30.171',3397,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:30.171'),('a8c586f6-e57e-11ec-87e2-d8bbc132d9b2',2,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',NULL,'Activity_0fkmkhz','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b55e0-e57e-11ec-87e2-d8bbc132d9b2',NULL,NULL,NULL,NULL,NULL,'形式审查不通过-流程结束',NULL,NULL,NULL,'1','2022-06-06 17:54:30.180',NULL,'2022-06-06 17:54:31.600',1420,NULL,50,NULL,NULL,NULL,'','2022-06-06 17:54:31.600');
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TSK_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TSK_LOG`
--

LOCK TABLES `ACT_HI_TSK_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_VARINST` VALUES ('1c4869ff-e598-11ec-a357-00e0705f49db',0,'1c4869fe-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,'creator','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-06-06 20:56:41.398','2022-06-06 20:56:41.398'),('9f2b07bd-e57e-11ec-87e2-d8bbc132d9b2',0,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',NULL,'creator','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-06-06 17:54:14.069','2022-06-06 17:54:14.069');
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_PROCDEF_INFO`
--

LOCK TABLES `ACT_PROCDEF_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('0e27787b-e598-11ec-a357-00e0705f49db','职称申请流程','https://l1yp.com/docs/flowable/bpmn/','zhicheng','','2022-06-06 12:56:17.690',NULL,NULL,'0e27787b-e598-11ec-a357-00e0705f49db',NULL),('97c1c099-e57e-11ec-87e2-d8bbc132d9b2','职称申请流程','https://l1yp.com/docs/flowable/bpmn/','zhicheng','','2022-06-06 09:54:01.634',NULL,NULL,'97c1c099-e57e-11ec-87e2-d8bbc132d9b2',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_MODEL`
--

LOCK TABLES `ACT_RE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_RE_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',1,'http://www.flowable.org/processdef','职称评审流程','zhicheng',1,'97c1c099-e57e-11ec-87e2-d8bbc132d9b2','zhicheng.bpmn20.xml',NULL,'用于职称评审的流程哈哈',0,1,1,'',NULL,NULL,NULL,0),('zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',1,'http://www.flowable.org/processdef','职称评审流程','zhicheng',2,'0e27787b-e598-11ec-a357-00e0705f49db','zhicheng.bpmn20.xml',NULL,'用于职称评审的流程哈哈',0,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ACTINST`
--

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ACTINST`
--

LOCK TABLES `ACT_RU_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ACTINST` DISABLE KEYS */;
INSERT INTO `ACT_RU_ACTINST` VALUES ('1c49a283-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-06-06 20:56:41.402','2022-06-06 20:56:41.410',8,1,NULL,''),('1c4b7744-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Flow_1pl8zw7',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-06-06 20:56:41.414','2022-06-06 20:56:41.414',0,2,NULL,''),('1c4b7745-e598-11ec-a357-00e0705f49db',2,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Activity_0jqew3r','1c4e5d76-e598-11ec-a357-00e0705f49db',NULL,'填报申请（平台端）','userTask','1','2022-06-06 20:56:41.414','2022-06-06 20:56:52.370',10956,3,NULL,''),('22d3862a-e598-11ec-a357-00e0705f49db',1,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-06-06 20:56:52.372','2022-06-06 20:56:52.372',0,1,NULL,''),('22d3ad3b-e598-11ec-a357-00e0705f49db',3,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','1c49a282-e598-11ec-a357-00e0705f49db','Activity_0vdh1ks','22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,'后台管理单位初审(登录单位帐号)','userTask',NULL,'2022-06-06 20:56:52.373',NULL,NULL,2,NULL,'');
/*!40000 ALTER TABLE `ACT_RU_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_DEADLETTER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_DEADLETTER_JOB`
--

LOCK TABLES `ACT_RU_DEADLETTER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ENTITYLINK`
--

LOCK TABLES `ACT_RU_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
INSERT INTO `ACT_RU_EXECUTION` VALUES ('1c4869fe-e598-11ec-a357-00e0705f49db',1,'1c4869fe-e598-11ec-a357-00e0705f49db','2',NULL,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db',NULL,1,0,1,0,0,1,NULL,'',NULL,'StartEvent_1iig6c2','2022-06-06 20:56:41.394','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('1c49a282-e598-11ec-a357-00e0705f49db',2,'1c4869fe-e598-11ec-a357-00e0705f49db',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db','zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db','Activity_0vdh1ks',1,0,0,0,0,1,NULL,'',NULL,NULL,'2022-06-06 20:56:41.402',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXTERNAL_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXTERNAL_JOB`
--

LOCK TABLES `ACT_RU_EXTERNAL_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXTERNAL_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXTERNAL_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_HISTORY_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_HISTORY_JOB`
--

LOCK TABLES `ACT_RU_HISTORY_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('1c495461-e598-11ec-a357-00e0705f49db',1,NULL,'starter','1',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL),('1c4eab98-e598-11ec-a357-00e0705f49db',1,NULL,'participant','1',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL),('22d22699-e598-11ec-a357-00e0705f49db',1,NULL,'participant','1',NULL,'1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL),('22d3d44d-e598-11ec-a357-00e0705f49db',1,'董事长','candidate',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,NULL),('22d4226e-e598-11ec-a357-00e0705f49db',1,'总经理','candidate',NULL,'22d3ad3c-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_SUSPENDED_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_SUSPENDED_JOB`
--

LOCK TABLES `ACT_RU_SUSPENDED_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
INSERT INTO `ACT_RU_TASK` VALUES ('22d3ad3c-e598-11ec-a357-00e0705f49db',3,'1c49a282-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,NULL,'后台管理单位初审(登录单位帐号)',NULL,NULL,'Activity_0vdh1ks',NULL,NULL,NULL,50,'2022-06-06 12:56:52.373',NULL,NULL,1,'',NULL,NULL,1,0,2,0);
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TIMER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TIMER_JOB`
--

LOCK TABLES `ACT_RU_TIMER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
INSERT INTO `ACT_RU_VARIABLE` VALUES ('1c4869ff-e598-11ec-a357-00e0705f49db',1,'string','creator','1c4869fe-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_CHANNEL_DEFINITION`
--

DROP TABLE IF EXISTS `FLW_CHANNEL_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_CHANNEL_DEFINITION` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_CHANNEL_DEFINITION`
--

LOCK TABLES `FLW_CHANNEL_DEFINITION` WRITE;
/*!40000 ALTER TABLE `FLW_CHANNEL_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_CHANNEL_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_DEFINITION`
--

DROP TABLE IF EXISTS `FLW_EVENT_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_EVENT_DEFINITION` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_DEFINITION`
--

LOCK TABLES `FLW_EVENT_DEFINITION` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_DEPLOYMENT`
--

DROP TABLE IF EXISTS `FLW_EVENT_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_EVENT_DEPLOYMENT` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_DEPLOYMENT`
--

LOCK TABLES `FLW_EVENT_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EVENT_RESOURCE`
--

DROP TABLE IF EXISTS `FLW_EVENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_EVENT_RESOURCE` (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EVENT_RESOURCE`
--

LOCK TABLES `FLW_EVENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `FLW_EVENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_EVENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EV_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_EV_DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EV_DATABASECHANGELOG`
--

LOCK TABLES `FLW_EV_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `FLW_EV_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-06-06 17:53:45',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.5.0',NULL,NULL,'4509225221'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-06-06 17:53:45',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.5.0',NULL,NULL,'4509225221'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-06-06 17:53:45',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.5.0',NULL,NULL,'4509225221');
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_EV_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_EV_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EV_DATABASECHANGELOGLOCK`
--

LOCK TABLES `FLW_EV_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `FLW_EV_DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_RU_BATCH`
--

DROP TABLE IF EXISTS `FLW_RU_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_RU_BATCH` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_RU_BATCH`
--

LOCK TABLES `FLW_RU_BATCH` WRITE;
/*!40000 ALTER TABLE `FLW_RU_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_RU_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_RU_BATCH_PART`
--

DROP TABLE IF EXISTS `FLW_RU_BATCH_PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_RU_BATCH_PART` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `FLW_RU_BATCH` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_RU_BATCH_PART`
--

LOCK TABLES `FLW_RU_BATCH_PART` WRITE;
/*!40000 ALTER TABLE `FLW_RU_BATCH_PART` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLW_RU_BATCH_PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_ext`
--

DROP TABLE IF EXISTS `process_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_ext` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `process_ext_process_key_uindex` (`process_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_ext`
--

LOCK TABLES `process_ext` WRITE;
/*!40000 ALTER TABLE `process_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_bpmn`
--

DROP TABLE IF EXISTS `process_model_bpmn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_bpmn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `version` int NOT NULL,
  `process_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `state` tinyint NOT NULL DEFAULT '1' COMMENT '0=未发布，1=已发布',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `process_model_bpmn_process_key_version_uindex` (`process_key`,`version`),
  UNIQUE KEY `process_model_bpmn_process_model_definition_id_uindex` (`process_definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_bpmn`
--

LOCK TABLES `process_model_bpmn` WRITE;
/*!40000 ALTER TABLE `process_model_bpmn` DISABLE KEYS */;
INSERT INTO `process_model_bpmn` VALUES (3,'change_budget',1,NULL,0,'A52738','2022-05-24 20:49:34','2022-05-24 20:49:34','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\"><process id=\"change_budget\" name=\"预算调整流程\" isExecutable=\"true\"><documentation>1</documentation><startEvent id=\"startEvent1\" name=\"开始\" flowable:formFieldValidation=\"true\" flowable:initiator=\"creator\" /><userTask id=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\" name=\"填写调整信息\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${creator}\"><incoming>Flow_060o6tr</incoming><incoming>Flow_1x21u3i</incoming><incoming>Flow_05ts1h1</incoming><outgoing>Flow_0sqem18</outgoing></userTask><sequenceFlow id=\"sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575\" name=\"填写详细信息\" sourceRef=\"startEvent1\" targetRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\" /><exclusiveGateway id=\"sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\"><outgoing>Flow_06pyim2</outgoing><outgoing>Flow_0ofzj1m</outgoing></exclusiveGateway><sequenceFlow id=\"sid-ACD912CD-5F25-459B-8683-B63991F2D6EC\" name=\"提交\" sourceRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\" targetRef=\"sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交\"}</conditionExpression></sequenceFlow><userTask id=\"sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\" name=\"调整会签\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${psr.read(&#39;change_budget&#39;, &#39;sub_finance&#39;, execution)}\"><incoming>Flow_0ofzj1m</incoming><outgoing>Flow_060o6tr</outgoing></userTask><userTask id=\"sid-E7C3221C-7839-459D-A54C-DEDD5852329C\" name=\"月结调整\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}\"><incoming>Flow_06pyim2</incoming><outgoing>Flow_10ckl5d</outgoing></userTask><userTask id=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\" name=\"调整审核\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}\"><incoming>Flow_10ckl5d</incoming><outgoing>Flow_1x21u3i</outgoing></userTask><sequenceFlow id=\"sid-4889166D-2091-42A2-83CC-EACE1250842C\" name=\"提交\" sourceRef=\"sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\" targetRef=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交\"}</conditionExpression></sequenceFlow><userTask id=\"sid-85B02690-DD15-4842-8A02-8B3D7F960041\" name=\"调整批准\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${psr.read(&#39;change_budget&#39;, &#39;hq_high_leader&#39;, execution)}\"><outgoing>Flow_05ts1h1</outgoing></userTask><sequenceFlow id=\"sid-FA58C054-45D4-4889-A89F-21AB5D802EBD\" name=\"提交\" sourceRef=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\" targetRef=\"sid-85B02690-DD15-4842-8A02-8B3D7F960041\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交\"}</conditionExpression></sequenceFlow><userTask id=\"sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\" name=\"调整确认\" flowable:formFieldValidation=\"true\" flowable:assignee=\"${psr.read(&#39;change_budget&#39;, &#39;hq_finance&#39;, execution)}\" /><sequenceFlow id=\"sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695\" name=\"提交\" sourceRef=\"sid-85B02690-DD15-4842-8A02-8B3D7F960041\" targetRef=\"sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交\"}</conditionExpression></sequenceFlow><endEvent id=\"sid-7D7875DA-09BC-4720-ABC6-398E6B62790F\" name=\"归档\" /><sequenceFlow id=\"sid-7A5ABFED-018D-483A-B416-81426A2EC752\" name=\"归档\" sourceRef=\"sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\" targetRef=\"sid-7D7875DA-09BC-4720-ABC6-398E6B62790F\" /><sequenceFlow id=\"sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD\" name=\"预算同步调减\" sourceRef=\"sid-E7C3221C-7839-459D-A54C-DEDD5852329C\" targetRef=\"sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"预算同步调减\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06pyim2\" name=\"是\" sourceRef=\"sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\" targetRef=\"sid-E7C3221C-7839-459D-A54C-DEDD5852329C\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"change_budget\",\"end_monthly\", execution) == 39}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_10ckl5d\" name=\"提交\" sourceRef=\"sid-E7C3221C-7839-459D-A54C-DEDD5852329C\" targetRef=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_060o6tr\" name=\"驳回\" sourceRef=\"sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\" targetRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1x21u3i\" name=\"驳回\" sourceRef=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\" targetRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_05ts1h1\" name=\"驳回\" sourceRef=\"sid-85B02690-DD15-4842-8A02-8B3D7F960041\" targetRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><endEvent id=\"Event_0cfphnc\" name=\"流程取消\"><incoming>Flow_0sqem18</incoming></endEvent><sequenceFlow id=\"Flow_0sqem18\" name=\"流程取消\" sourceRef=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\" targetRef=\"Event_0cfphnc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"流程取消\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ofzj1m\" name=\"否\" sourceRef=\"sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\" targetRef=\"sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"change_budget\",\"end_monthly\", execution) == 40}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_change_budget\"><bpmndi:BPMNPlane id=\"BPMNPlane_change_budget\" bpmnElement=\"change_budget\"><bpmndi:BPMNEdge id=\"Flow_0ofzj1m_di\" bpmnElement=\"Flow_0ofzj1m\"><omgdi:waypoint x=\"250\" y=\"165\" /><omgdi:waypoint x=\"375\" y=\"165\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"307\" y=\"147\" width=\"11\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0sqem18_di\" bpmnElement=\"Flow_0sqem18\"><omgdi:waypoint x=\"35\" y=\"205\" /><omgdi:waypoint x=\"35\" y=\"310\" /><omgdi:waypoint x=\"-182\" y=\"310\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"13\" y=\"322\" width=\"43\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_05ts1h1_di\" bpmnElement=\"Flow_05ts1h1\"><omgdi:waypoint x=\"828\" y=\"125\" /><omgdi:waypoint x=\"828\" y=\"-50\" /><omgdi:waypoint x=\"20\" y=\"-50\" /><omgdi:waypoint x=\"20\" y=\"125\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"414\" y=\"-68\" width=\"21\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1x21u3i_di\" bpmnElement=\"Flow_1x21u3i\"><omgdi:waypoint x=\"620\" y=\"125\" /><omgdi:waypoint x=\"620\" y=\"20\" /><omgdi:waypoint x=\"35\" y=\"20\" /><omgdi:waypoint x=\"35\" y=\"125\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"317\" y=\"2\" width=\"21\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_060o6tr_di\" bpmnElement=\"Flow_060o6tr\"><omgdi:waypoint x=\"425\" y=\"125\" /><omgdi:waypoint x=\"425\" y=\"80\" /><omgdi:waypoint x=\"50\" y=\"80\" /><omgdi:waypoint x=\"50\" y=\"125\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"227\" y=\"62\" width=\"21\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_10ckl5d_di\" bpmnElement=\"Flow_10ckl5d\"><omgdi:waypoint x=\"475\" y=\"290\" /><omgdi:waypoint x=\"620\" y=\"290\" /><omgdi:waypoint x=\"620\" y=\"205\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"609\" y=\"293\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06pyim2_di\" bpmnElement=\"Flow_06pyim2\"><omgdi:waypoint x=\"230\" y=\"185\" /><omgdi:waypoint x=\"230\" y=\"310\" /><omgdi:waypoint x=\"375\" y=\"310\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"224\" y=\"322\" width=\"11\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD\" bpmnElement=\"sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"79.0\"><omgdi:waypoint x=\"475\" y=\"320\" /><omgdi:waypoint x=\"1010\" y=\"320\" /><omgdi:waypoint x=\"1010\" y=\"205\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"977\" y=\"332\" width=\"66\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-7A5ABFED-018D-483A-B416-81426A2EC752\" bpmnElement=\"sid-7A5ABFED-018D-483A-B416-81426A2EC752\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\"><omgdi:waypoint x=\"1060\" y=\"165\" /><omgdi:waypoint x=\"1136\" y=\"165\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"1087\" y=\"140\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695\" bpmnElement=\"sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.00000000000001\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\"><omgdi:waypoint x=\"878\" y=\"165\" /><omgdi:waypoint x=\"960\" y=\"165\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"908\" y=\"147\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-FA58C054-45D4-4889-A89F-21AB5D802EBD\" bpmnElement=\"sid-FA58C054-45D4-4889-A89F-21AB5D802EBD\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.00000000000001\"><omgdi:waypoint x=\"670\" y=\"165\" /><omgdi:waypoint x=\"778\" y=\"165\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"713\" y=\"147\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-4889166D-2091-42A2-83CC-EACE1250842C\" bpmnElement=\"sid-4889166D-2091-42A2-83CC-EACE1250842C\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\"><omgdi:waypoint x=\"475\" y=\"165\" /><omgdi:waypoint x=\"570\" y=\"165\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"512\" y=\"140\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-ACD912CD-5F25-459B-8683-B63991F2D6EC\" bpmnElement=\"sid-ACD912CD-5F25-459B-8683-B63991F2D6EC\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"20.5\" flowable:targetDockerY=\"20.5\"><omgdi:waypoint x=\"84.94999999999226\" y=\"165.1277493606138\" /><omgdi:waypoint x=\"210.44871794871796\" y=\"165.44871794871796\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"137\" y=\"147\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"BPMNEdge_sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575\" bpmnElement=\"sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\"><omgdi:waypoint x=\"-195.05000030455395\" y=\"165\" /><omgdi:waypoint x=\"-15\" y=\"165\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"BPMNShape_startEvent1\" bpmnElement=\"startEvent1\"><omgdc:Bounds x=\"-225\" y=\"150\" width=\"30\" height=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-221\" y=\"193\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\" bpmnElement=\"sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF\"><omgdc:Bounds x=\"-15\" y=\"125\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\" bpmnElement=\"sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"210\" y=\"145\" width=\"40\" height=\"40\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\" bpmnElement=\"sid-1F5A6456-402F-4760-9E14-FF44A176F7A5\"><omgdc:Bounds x=\"375\" y=\"125\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-E7C3221C-7839-459D-A54C-DEDD5852329C\" bpmnElement=\"sid-E7C3221C-7839-459D-A54C-DEDD5852329C\"><omgdc:Bounds x=\"375\" y=\"270\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\" bpmnElement=\"sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC\"><omgdc:Bounds x=\"570\" y=\"125\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-85B02690-DD15-4842-8A02-8B3D7F960041\" bpmnElement=\"sid-85B02690-DD15-4842-8A02-8B3D7F960041\"><omgdc:Bounds x=\"777.7777754884362\" y=\"124.99999999999999\" width=\"100\" height=\"80.00000000000001\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\" bpmnElement=\"sid-99757E3C-BB86-46AC-9328-64C7362EB7F3\"><omgdc:Bounds x=\"960\" y=\"125\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"BPMNShape_sid-7D7875DA-09BC-4720-ABC6-398E6B62790F\" bpmnElement=\"sid-7D7875DA-09BC-4720-ABC6-398E6B62790F\"><omgdc:Bounds x=\"1136\" y=\"151\" width=\"28\" height=\"28\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"1138\" y=\"193\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_0cfphnc_di\" bpmnElement=\"Event_0cfphnc\"><omgdc:Bounds x=\"-218\" y=\"292\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-221\" y=\"335\" width=\"43\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(5,'holiday',1,NULL,0,'admin','2022-05-30 21:02:28','2022-05-30 21:02:28','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"Process_0dm6mw4\"><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1ik6gh6</outgoing></startEvent><sequenceFlow id=\"Flow_1ik6gh6\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_1q5ylfn\" /><userTask id=\"Activity_1q5ylfn\" name=\"填写假条内容\" flowable:assignee=\"${creator}\"><incoming>Flow_1ik6gh6</incoming><incoming>Flow_14xs85z</incoming><incoming>Flow_1yk6wlf</incoming><outgoing>Flow_0g0bb7a</outgoing></userTask><exclusiveGateway id=\"Gateway_072fnqe\"><incoming>Flow_0g0bb7a</incoming><outgoing>Flow_1luztyb</outgoing><outgoing>Flow_19ai2ba</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0g0bb7a\" name=\"提交\" sourceRef=\"Activity_1q5ylfn\" targetRef=\"Gateway_072fnqe\" /><sequenceFlow id=\"Flow_1luztyb\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_0zsqisd\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &lt; 10}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19ai2ba\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_1ylj3fi\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &gt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0zsqisd\" name=\"主管审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;supervisor&#39;, execution)}\"><incoming>Flow_1luztyb</incoming><outgoing>Flow_14xs85z</outgoing><outgoing>Flow_1e1j8nx</outgoing></userTask><userTask id=\"Activity_1ylj3fi\" name=\"总监审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;dept_leader&#39;, execution)}\"><incoming>Flow_19ai2ba</incoming><outgoing>Flow_1yk6wlf</outgoing><outgoing>Flow_06bt0iu</outgoing></userTask><sequenceFlow id=\"Flow_14xs85z\" name=\"驳回\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1yk6wlf\" name=\"驳回\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1e1j8nx\" name=\"通过\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06bt0iu\" name=\"通过\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_18ueswk\" name=\"总部会签\" flowable:assignee=\"${hq_leader}\"><incoming>Flow_1e1j8nx</incoming><incoming>Flow_06bt0iu</incoming><outgoing>Flow_1yaad4o</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"hq_leader\" flowable:collection=\"${psr.read(&#39;holiday&#39;, &#39;hq_leaders&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${nrOfCompletedInstances/nrOfInstances&gt;=0.6}</completionCondition></multiInstanceLoopCharacteristics></userTask><endEvent id=\"Event_01vzvdx\" name=\"归档\"><incoming>Flow_1yaad4o</incoming></endEvent><sequenceFlow id=\"Flow_1yaad4o\" name=\"通过\" sourceRef=\"Activity_18ueswk\" targetRef=\"Event_01vzvdx\" /></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Process_0dm6mw4\"><bpmndi:BPMNEdge id=\"Flow_1yaad4o_di\" bpmnElement=\"Flow_1yaad4o\"><omgdi:waypoint x=\"20\" y=\"-220\" /><omgdi:waypoint x=\"122\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"60\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06bt0iu_di\" bpmnElement=\"Flow_06bt0iu\"><omgdi:waypoint x=\"-230\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-220\" /><omgdi:waypoint x=\"-80\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-173\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1e1j8nx_di\" bpmnElement=\"Flow_1e1j8nx\"><omgdi:waypoint x=\"-230\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-220\" /><omgdi:waypoint x=\"-80\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-273\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yk6wlf_di\" bpmnElement=\"Flow_1yk6wlf\"><omgdi:waypoint x=\"-280\" y=\"-80\" /><omgdi:waypoint x=\"-280\" y=\"-20\" /><omgdi:waypoint x=\"-620\" y=\"-20\" /><omgdi:waypoint x=\"-620\" y=\"-180\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-38\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_14xs85z_di\" bpmnElement=\"Flow_14xs85z\"><omgdi:waypoint x=\"-280\" y=\"-360\" /><omgdi:waypoint x=\"-280\" y=\"-430\" /><omgdi:waypoint x=\"-620\" y=\"-430\" /><omgdi:waypoint x=\"-620\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-448\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19ai2ba_di\" bpmnElement=\"Flow_19ai2ba\"><omgdi:waypoint x=\"-450\" y=\"-195\" /><omgdi:waypoint x=\"-450\" y=\"-120\" /><omgdi:waypoint x=\"-330\" y=\"-120\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1luztyb_di\" bpmnElement=\"Flow_1luztyb\"><omgdi:waypoint x=\"-450\" y=\"-245\" /><omgdi:waypoint x=\"-450\" y=\"-320\" /><omgdi:waypoint x=\"-330\" y=\"-320\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0g0bb7a_di\" bpmnElement=\"Flow_0g0bb7a\"><omgdi:waypoint x=\"-570\" y=\"-220\" /><omgdi:waypoint x=\"-475\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-533\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ik6gh6_di\" bpmnElement=\"Flow_1ik6gh6\"><omgdi:waypoint x=\"-762\" y=\"-220\" /><omgdi:waypoint x=\"-670\" y=\"-220\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-798\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-791\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_15nzmu9_di\" bpmnElement=\"Activity_1q5ylfn\"><omgdc:Bounds x=\"-670\" y=\"-260\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_072fnqe_di\" bpmnElement=\"Gateway_072fnqe\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-475\" y=\"-245\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_18a80hv_di\" bpmnElement=\"Activity_0zsqisd\"><omgdc:Bounds x=\"-330\" y=\"-360\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lz62dp_di\" bpmnElement=\"Activity_1ylj3fi\"><omgdc:Bounds x=\"-330\" y=\"-160\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_00s55jz_di\" bpmnElement=\"Activity_18ueswk\"><omgdc:Bounds x=\"-80\" y=\"-260\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_01vzvdx_di\" bpmnElement=\"Event_01vzvdx\"><omgdc:Bounds x=\"122\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"129\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(13,'holiday',2,NULL,0,'A52744','2022-05-31 14:13:08','2022-05-31 14:13:08','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"Process_0dm6mw4\"><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1ik6gh6</outgoing></startEvent><sequenceFlow id=\"Flow_1ik6gh6\" name=\"填写假条信息\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_1q5ylfn\" /><userTask id=\"Activity_1q5ylfn\" name=\"填写假条内容\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;creator&#39;, execution)}\"><incoming>Flow_1ik6gh6</incoming><incoming>Flow_14xs85z</incoming><incoming>Flow_1yk6wlf</incoming><outgoing>Flow_0g0bb7a</outgoing></userTask><exclusiveGateway id=\"Gateway_072fnqe\"><incoming>Flow_0g0bb7a</incoming><outgoing>Flow_1luztyb</outgoing><outgoing>Flow_19ai2ba</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0g0bb7a\" name=\"提交\" sourceRef=\"Activity_1q5ylfn\" targetRef=\"Gateway_072fnqe\" /><sequenceFlow id=\"Flow_1luztyb\" name=\"&#60;10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_0zsqisd\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &lt; 10}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19ai2ba\" name=\"≥ 10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_1ylj3fi\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &gt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0zsqisd\" name=\"主管审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;supervisor&#39;, execution)}\"><incoming>Flow_1luztyb</incoming><outgoing>Flow_14xs85z</outgoing><outgoing>Flow_1e1j8nx</outgoing></userTask><userTask id=\"Activity_1ylj3fi\" name=\"总监审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;dept_leader&#39;, execution)}\"><incoming>Flow_19ai2ba</incoming><outgoing>Flow_1yk6wlf</outgoing><outgoing>Flow_06bt0iu</outgoing></userTask><sequenceFlow id=\"Flow_14xs85z\" name=\"驳回\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1yk6wlf\" name=\"驳回\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1e1j8nx\" name=\"通过\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06bt0iu\" name=\"通过\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_18ueswk\" name=\"总部会签\" flowable:assignee=\"${hq_leader}\"><incoming>Flow_1e1j8nx</incoming><incoming>Flow_06bt0iu</incoming><outgoing>Flow_1yaad4o</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"hq_leader\" flowable:collection=\"${psr.read(&#39;holiday&#39;, &#39;hq_leaders&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${nrOfCompletedInstances/nrOfInstances&gt;=0.6}</completionCondition></multiInstanceLoopCharacteristics></userTask><endEvent id=\"Event_01vzvdx\" name=\"归档\"><incoming>Flow_1yaad4o</incoming></endEvent><sequenceFlow id=\"Flow_1yaad4o\" name=\"通过\" sourceRef=\"Activity_18ueswk\" targetRef=\"Event_01vzvdx\" /></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Process_0dm6mw4\"><bpmndi:BPMNEdge id=\"Flow_1yaad4o_di\" bpmnElement=\"Flow_1yaad4o\"><omgdi:waypoint x=\"20\" y=\"-220\" /><omgdi:waypoint x=\"122\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"60\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06bt0iu_di\" bpmnElement=\"Flow_06bt0iu\"><omgdi:waypoint x=\"-230\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-220\" /><omgdi:waypoint x=\"-80\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-173\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1e1j8nx_di\" bpmnElement=\"Flow_1e1j8nx\"><omgdi:waypoint x=\"-230\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-220\" /><omgdi:waypoint x=\"-80\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-273\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yk6wlf_di\" bpmnElement=\"Flow_1yk6wlf\"><omgdi:waypoint x=\"-280\" y=\"-80\" /><omgdi:waypoint x=\"-280\" y=\"-20\" /><omgdi:waypoint x=\"-620\" y=\"-20\" /><omgdi:waypoint x=\"-620\" y=\"-180\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-38\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_14xs85z_di\" bpmnElement=\"Flow_14xs85z\"><omgdi:waypoint x=\"-280\" y=\"-360\" /><omgdi:waypoint x=\"-280\" y=\"-430\" /><omgdi:waypoint x=\"-620\" y=\"-430\" /><omgdi:waypoint x=\"-620\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-448\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19ai2ba_di\" bpmnElement=\"Flow_19ai2ba\"><omgdi:waypoint x=\"-450\" y=\"-195\" /><omgdi:waypoint x=\"-450\" y=\"-120\" /><omgdi:waypoint x=\"-330\" y=\"-120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-467\" y=\"-107\" width=\"34\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1luztyb_di\" bpmnElement=\"Flow_1luztyb\"><omgdi:waypoint x=\"-450\" y=\"-245\" /><omgdi:waypoint x=\"-450\" y=\"-320\" /><omgdi:waypoint x=\"-330\" y=\"-320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-466\" y=\"-337\" width=\"31\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0g0bb7a_di\" bpmnElement=\"Flow_0g0bb7a\"><omgdi:waypoint x=\"-570\" y=\"-220\" /><omgdi:waypoint x=\"-475\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-533\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ik6gh6_di\" bpmnElement=\"Flow_1ik6gh6\"><omgdi:waypoint x=\"-762\" y=\"-220\" /><omgdi:waypoint x=\"-670\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-749\" y=\"-238\" width=\"66\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-798\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-791\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_15nzmu9_di\" bpmnElement=\"Activity_1q5ylfn\"><omgdc:Bounds x=\"-670\" y=\"-260\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_072fnqe_di\" bpmnElement=\"Gateway_072fnqe\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-475\" y=\"-245\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_18a80hv_di\" bpmnElement=\"Activity_0zsqisd\"><omgdc:Bounds x=\"-330\" y=\"-360\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lz62dp_di\" bpmnElement=\"Activity_1ylj3fi\"><omgdc:Bounds x=\"-330\" y=\"-160\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_00s55jz_di\" bpmnElement=\"Activity_18ueswk\"><omgdc:Bounds x=\"-80\" y=\"-260\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_01vzvdx_di\" bpmnElement=\"Event_01vzvdx\"><omgdc:Bounds x=\"122\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"129\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(15,'holiday',3,'Process_0dm6mw4:1:8fce0d6d-e576-11ec-997b-d8bbc132d9b2',0,'admin','2022-06-02 23:30:18','2022-06-02 23:30:18','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"Process_0dm6mw4\"><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1ik6gh6</outgoing></startEvent><sequenceFlow id=\"Flow_1ik6gh6\" name=\"填写假条信息\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_1q5ylfn\" /><userTask id=\"Activity_1q5ylfn\" name=\"填写假条内容\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;creator&#39;, execution)}\"><incoming>Flow_1ik6gh6</incoming><incoming>Flow_14xs85z</incoming><incoming>Flow_1yk6wlf</incoming><incoming>Flow_1f9ccn0</incoming><outgoing>Flow_0g0bb7a</outgoing></userTask><exclusiveGateway id=\"Gateway_072fnqe\"><incoming>Flow_0g0bb7a</incoming><outgoing>Flow_1luztyb</outgoing><outgoing>Flow_19ai2ba</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0g0bb7a\" name=\"提交\" sourceRef=\"Activity_1q5ylfn\" targetRef=\"Gateway_072fnqe\" /><sequenceFlow id=\"Flow_1luztyb\" name=\"&#60;10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_0zsqisd\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &lt; 10}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19ai2ba\" name=\"≥ 10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_1ylj3fi\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &gt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0zsqisd\" name=\"主管审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;supervisor&#39;, execution)}\"><incoming>Flow_1luztyb</incoming><outgoing>Flow_14xs85z</outgoing><outgoing>Flow_1e1j8nx</outgoing></userTask><userTask id=\"Activity_1ylj3fi\" name=\"总监审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;dept_leader&#39;, execution)}\"><incoming>Flow_19ai2ba</incoming><outgoing>Flow_1yk6wlf</outgoing><outgoing>Flow_06bt0iu</outgoing></userTask><sequenceFlow id=\"Flow_14xs85z\" name=\"驳回\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1yk6wlf\" name=\"驳回\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1e1j8nx\" name=\"通过\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06bt0iu\" name=\"通过\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_18ueswk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_18ueswk\" name=\"总部会签\" flowable:assignee=\"${hq_leader}\"><extensionElements><flowable:taskListener event=\"complete\" class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" /></extensionElements><incoming>Flow_1e1j8nx</incoming><incoming>Flow_06bt0iu</incoming><outgoing>Flow_1yaad4o</outgoing><outgoing>Flow_1f9ccn0</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"hq_leader\" flowable:collection=\"${psr.read(&#39;holiday&#39;, &#39;hq_leaders&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><endEvent id=\"Event_01vzvdx\" name=\"归档\"><incoming>Flow_1yaad4o</incoming></endEvent><sequenceFlow id=\"Flow_1yaad4o\" name=\"通过\" sourceRef=\"Activity_18ueswk\" targetRef=\"Event_01vzvdx\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1f9ccn0\" name=\"驳回\" sourceRef=\"Activity_18ueswk\" targetRef=\"Activity_1q5ylfn\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Process_0dm6mw4\"><bpmndi:BPMNEdge id=\"Flow_1f9ccn0_di\" bpmnElement=\"Flow_1f9ccn0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"-260\" /><omgdi:waypoint x=\"-30\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-350\" y=\"-468\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yaad4o_di\" bpmnElement=\"Flow_1yaad4o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"20\" y=\"-220\" /><omgdi:waypoint x=\"122\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"61\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06bt0iu_di\" bpmnElement=\"Flow_06bt0iu\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-210\" /><omgdi:waypoint x=\"-80\" y=\"-210\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-168\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1e1j8nx_di\" bpmnElement=\"Flow_1e1j8nx\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-230\" /><omgdi:waypoint x=\"-80\" y=\"-230\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-278\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yk6wlf_di\" bpmnElement=\"Flow_1yk6wlf\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-330\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-180\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-486\" y=\"-118\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_14xs85z_di\" bpmnElement=\"Flow_14xs85z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-280\" y=\"-360\" /><omgdi:waypoint x=\"-280\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-418\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19ai2ba_di\" bpmnElement=\"Flow_19ai2ba\"><omgdi:waypoint x=\"-450\" y=\"-195\" /><omgdi:waypoint x=\"-450\" y=\"-120\" /><omgdi:waypoint x=\"-330\" y=\"-120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-447\" y=\"-187\" width=\"34\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1luztyb_di\" bpmnElement=\"Flow_1luztyb\"><omgdi:waypoint x=\"-450\" y=\"-245\" /><omgdi:waypoint x=\"-450\" y=\"-320\" /><omgdi:waypoint x=\"-330\" y=\"-320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-446\" y=\"-257\" width=\"31\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0g0bb7a_di\" bpmnElement=\"Flow_0g0bb7a\"><omgdi:waypoint x=\"-570\" y=\"-220\" /><omgdi:waypoint x=\"-475\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-533\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ik6gh6_di\" bpmnElement=\"Flow_1ik6gh6\"><omgdi:waypoint x=\"-762\" y=\"-220\" /><omgdi:waypoint x=\"-670\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-749\" y=\"-238\" width=\"66\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-798\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-791\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_15nzmu9_di\" bpmnElement=\"Activity_1q5ylfn\"><omgdc:Bounds x=\"-670\" y=\"-260\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_072fnqe_di\" bpmnElement=\"Gateway_072fnqe\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-475\" y=\"-245\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_18a80hv_di\" bpmnElement=\"Activity_0zsqisd\"><omgdc:Bounds x=\"-330\" y=\"-360\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lz62dp_di\" bpmnElement=\"Activity_1ylj3fi\"><omgdc:Bounds x=\"-330\" y=\"-160\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_00s55jz_di\" bpmnElement=\"Activity_18ueswk\"><omgdc:Bounds x=\"-80\" y=\"-260\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_01vzvdx_di\" bpmnElement=\"Event_01vzvdx\"><omgdc:Bounds x=\"122\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"129\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(20,'zhicheng',1,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2',0,'admin','2022-06-06 17:48:26','2022-06-06 17:48:26','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener event=\"complete\" class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"judge\" flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"不通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"不通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"9\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-15\" y=\"1893\" width=\"33\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"539\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"227\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-343\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-470\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-778\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-644\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-215\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(21,'zhicheng',2,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db',1,'admin','2022-06-06 20:55:20','2022-06-06 20:55:20','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:candidateGroups=\"董事长,总经理\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener event=\"complete\" class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:elementVariable=\"judge\" flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"不通过\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"不通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"9\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-15\" y=\"1893\" width=\"33\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"539\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"227\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-343\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-470\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-778\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-644\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-215\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>');
/*!40000 ALTER TABLE `process_model_bpmn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_definition`
--

DROP TABLE IF EXISTS `process_model_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_definition` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程定义文件的ID属性',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code_prefix` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程编号前缀',
  `code_time_pattern` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '编号时间pattern',
  `code_joiner` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编号连接符',
  `code_joiner2` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `code_suffix` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '编号后缀：#代表序号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `process_definition_process_key_index` (`process_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程定义信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_definition`
--

LOCK TABLES `process_model_definition` WRITE;
/*!40000 ALTER TABLE `process_model_definition` DISABLE KEYS */;
INSERT INTO `process_model_definition` VALUES (1,'change_budget','预算调整流程','CB','yyyyMMdd','','','#####','2022-05-31 09:13:45','2022-04-27 14:23:49'),(3,'holiday','请假流程','HL','yyyyMMdd','','','#####','2022-05-31 09:13:45','2022-05-30 21:02:28'),(4,'zhicheng','职称申请流程','ZL','yyyyMMdd','','','#####','2022-06-02 21:10:14','2022-06-02 21:10:14');
/*!40000 ALTER TABLE `process_model_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_field_definition`
--

DROP TABLE IF EXISTS `process_model_field_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_field_definition` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段名称',
  `order_no` int NOT NULL DEFAULT '0' COMMENT '序号',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `component_type` bigint NOT NULL COMMENT '控件类型：单行文本/多行文本/字典单选/字典多选/数字/日期/用户/用户列表/动态标签/部门单选/部门多选/关联表单选/关联表多选',
  `db_field_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段类型',
  `db_default_value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '默认值',
  `nullable` tinyint DEFAULT '0' COMMENT '0=no, 1=yes',
  `dict_scope` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'global' COMMENT '字典范围',
  `dict_ident` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'admin',
  PRIMARY KEY (`id`),
  KEY `process_field_definition_process_key_order_no_index` (`process_key`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_field_definition`
--

LOCK TABLES `process_model_field_definition` WRITE;
/*!40000 ALTER TABLE `process_model_field_definition` DISABLE KEYS */;
INSERT INTO `process_model_field_definition` VALUES (1,'change_budget','sub_finance',1,'子公司财务','调整会签',6,'varchar(64)','0',0,'global',NULL,'2022-04-29 22:10:46','2022-05-02 08:27:26','admin'),(2,'change_budget','sub_high_leader',2,'子公司高层','调整审核',6,'varchar(64)','\'\'',0,'global',NULL,'2022-04-29 22:12:45','2022-05-03 22:49:28','admin'),(3,'change_budget','hq_high_leader',3,'总部高层','调整批准',6,'varchar(64)','\'\'',0,'global',NULL,'2022-04-29 22:13:10','2022-05-03 22:49:32','admin'),(4,'change_budget','hq_finance',4,'总部财务','调整确认',6,'varchar(64)','\'\'',0,'global',NULL,'2022-04-29 22:13:37','2022-05-03 22:49:35','admin'),(5,'change_budget','end_monthly',5,'是否月结调整','0：否；1：是',3,'tinyint','0',0,'global','yesno','2022-04-29 22:15:03','2022-05-17 11:18:45','admin'),(7,'holiday','id',1,'id','主键',5,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:28','2022-05-30 21:02:28','admin'),(8,'holiday','process_bpmn_id',2,'版本ID','流程版本ID',5,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:28','2022-05-30 21:02:28','admin'),(9,'holiday','process_definition_id',3,'定义ID','流程定义ID',1,'VARCHAR(128)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(10,'holiday','process_instance_id',4,'实例ID','流程实例ID',1,'VARCHAR(36)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(11,'holiday','name',5,'名称','流程名称',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(12,'holiday','creator',6,'创建者','流程发起者',6,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-31 09:52:52','admin'),(13,'holiday','update_by',7,'更新人','最后更新人',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(14,'holiday','update_time',8,'更新时间','最后更新时间',11,'DATETIME',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(15,'holiday','create_time',9,'创建时间','创建时间',11,'DATETIME',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(18,'holiday','dept_leader',10,'部门领导','直属上级',6,'BIGINT',NULL,0,'global',NULL,'2022-05-30 23:25:41','2022-05-30 23:25:41','admin'),(19,'holiday','hq_leaders',11,'总部领导','总部领导列表',7,'VARCHAR(128)',NULL,1,'global',NULL,'2022-05-31 09:08:51','2022-05-31 11:37:23','admin'),(20,'holiday','supervisor',12,'主管','主管',6,'BIGINT','',1,'global',NULL,'2022-05-31 09:48:22','2022-05-31 09:48:22','admin'),(21,'holiday','code',5,'编号','编号',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-31 11:24:56','2022-05-31 11:24:56','admin'),(22,'holiday','days',13,'天数','请假天数',5,'int','0',0,'global',NULL,'2022-05-31 11:26:45','2022-05-31 11:26:45','admin'),(23,'change_budget','name',6,'名称','流程名称',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-31 23:34:27','2022-05-31 23:34:27','admin'),(24,'zhicheng','id',1,'id','主键',5,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(25,'zhicheng','process_bpmn_id',2,'版本ID','流程版本ID',5,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(26,'zhicheng','process_definition_id',3,'定义ID','流程定义ID',1,'VARCHAR(128)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(27,'zhicheng','process_instance_id',4,'实例ID','流程实例ID',1,'VARCHAR(36)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(28,'zhicheng','name',5,'名称','流程名称',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(29,'zhicheng','creator',6,'创建者','流程发起者',6,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(30,'zhicheng','update_by',7,'更新人','最后更新人',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(31,'zhicheng','update_time',8,'更新时间','最后更新时间',11,'DATETIME',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(32,'zhicheng','create_time',9,'创建时间','创建时间',11,'DATETIME',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(33,'zhicheng','judges',10,'评委','评委用户列表',7,'varchar(128)','',1,'global',NULL,'2022-06-03 10:19:53','2022-06-03 11:57:00','A52738'),(34,'zhicheng','expert_status',11,'状态','专家审核',3,'BIGINT','',1,'global','pass_status','2022-06-03 10:44:05','2022-06-03 10:44:05','A52738'),(35,'zhicheng','expert_reject_count',12,'专家退回','专家退回次数',5,'int','0',0,'global',NULL,'2022-06-03 12:48:46','2022-06-03 12:48:46','admin'),(36,'zhicheng','form_reject_count',13,'形式退回','形式审查退回次数',5,'int','0',0,'global',NULL,'2022-06-03 12:53:32','2022-06-03 12:53:32','admin');
/*!40000 ALTER TABLE `process_model_field_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_node_page`
--

DROP TABLE IF EXISTS `process_model_node_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_node_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `process_bpmn_id` bigint NOT NULL,
  `node_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '节点ID',
  `process_model_page_id` bigint DEFAULT NULL COMMENT 'seqFlow可以无需配置界面，只需要配置评论字段',
  `page_width` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面总宽度',
  `label_width` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签宽度',
  `comment` tinyint DEFAULT '0' COMMENT '0: 不需要备注, 1: 可选, 2: 必填',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_bound_uindex` (`process_bpmn_id`,`node_id`),
  KEY `page_bound_uindex2` (`process_key`,`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_node_page`
--

LOCK TABLES `process_model_node_page` WRITE;
/*!40000 ALTER TABLE `process_model_node_page` DISABLE KEYS */;
INSERT INTO `process_model_node_page` VALUES (3,'change_budget',2,'sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF',1,'851px','120px',1,'admin','2022-05-19 22:51:06','2022-05-17 22:45:42'),(5,'change_budget',2,'sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575',1,'851px','120px',0,'admin','2022-05-17 22:49:25','2022-05-17 22:49:25'),(6,'change_budget',2,'Event_0cfphnc',4,'851px','120px',1,'admin','2022-05-24 21:12:01','2022-05-18 20:08:39'),(7,'change_budget',2,'sid-7D7875DA-09BC-4720-ABC6-398E6B62790F',4,'851px','120px',1,'admin','2022-05-24 21:11:54','2022-05-18 20:08:57'),(8,'change_budget',2,'sid-1F5A6456-402F-4760-9E14-FF44A176F7A5',1,'851px','120px',1,'admin','2022-05-24 21:13:35','2022-05-19 08:53:56'),(9,'change_budget',2,'sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC',4,'851px','120px',1,'admin','2022-05-24 21:11:43','2022-05-19 08:54:00'),(10,'change_budget',2,'sid-85B02690-DD15-4842-8A02-8B3D7F960041',4,'851px','120px',1,'admin','2022-05-24 21:11:46','2022-05-19 08:54:03'),(11,'change_budget',2,'sid-99757E3C-BB86-46AC-9328-64C7362EB7F3',4,'851px','120px',1,'admin','2022-05-24 21:11:49','2022-05-19 08:54:07'),(12,'change_budget',2,'sid-E7C3221C-7839-459D-A54C-DEDD5852329C',4,'851px','120px',1,'admin','2022-05-24 21:11:29','2022-05-19 08:54:09'),(13,'change_budget',1,'Task_04qlgi8',1,'851px','120px',1,'admin','2022-05-22 21:12:02','2022-05-22 21:07:30'),(16,'change_budget',1,'Task_1bqt7q4',4,'850px','120px',0,'admin','2022-05-22 21:14:44','2022-05-22 21:14:37'),(18,'change_budget',3,'sid-ACD912CD-5F25-459B-8683-B63991F2D6EC',5,'851px','120px',1,'admin','2022-05-24 21:04:40','2022-05-24 21:04:40'),(32,'change_budget',3,'sid-1F5A6456-402F-4760-9E14-FF44A176F7A5',1,'851px','120px',1,'admin','2022-05-24 21:15:30','2022-05-24 21:15:30'),(33,'change_budget',3,'sid-E7C3221C-7839-459D-A54C-DEDD5852329C',4,'851px','120px',1,'admin','2022-05-24 21:15:41','2022-05-24 21:15:41'),(34,'change_budget',3,'sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC',4,'851px','120px',1,'admin','2022-05-24 21:15:44','2022-05-24 21:15:44'),(35,'change_budget',3,'sid-85B02690-DD15-4842-8A02-8B3D7F960041',4,'851px','120px',1,'admin','2022-05-24 21:15:47','2022-05-24 21:15:47'),(36,'change_budget',3,'sid-99757E3C-BB86-46AC-9328-64C7362EB7F3',4,'851px','120px',1,'admin','2022-05-24 21:15:52','2022-05-24 21:15:52'),(37,'change_budget',3,'sid-7D7875DA-09BC-4720-ABC6-398E6B62790F',4,'851px','120px',1,'admin','2022-05-24 21:15:56','2022-05-24 21:15:56'),(38,'change_budget',3,'Event_0cfphnc',4,'851px','120px',1,'admin','2022-05-24 21:16:00','2022-05-24 21:16:00'),(39,'change_budget',3,'sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF',1,'851px','120px',1,'admin','2022-05-24 21:22:26','2022-05-24 21:22:26'),(43,'change_budget',3,'sid-4889166D-2091-42A2-83CC-EACE1250842C',1,'851px','120px',1,'admin','2022-05-29 16:14:13','2022-05-29 16:14:13'),(51,'holiday',0,'$$START_PAGE_KEY$$',7,'850px','120px',NULL,'admin','2022-05-31 11:34:29','2022-05-31 11:34:29'),(101,'holiday',13,'Activity_1q5ylfn',8,'851px','120px',1,'admin','2022-05-31 14:15:20','2022-05-31 14:15:20'),(102,'holiday',13,'Flow_0g0bb7a',9,'851px','120px',1,'admin','2022-05-31 14:15:24','2022-05-31 14:15:24'),(103,'holiday',13,'Activity_0zsqisd',8,'851px','120px',1,'admin','2022-05-31 14:15:27','2022-05-31 14:15:27'),(104,'holiday',13,'Activity_1ylj3fi',8,'851px','120px',1,'admin','2022-05-31 14:15:30','2022-05-31 14:15:30'),(105,'holiday',13,'Activity_18ueswk',8,'851px','120px',1,'admin','2022-05-31 14:15:33','2022-05-31 14:15:33'),(106,'holiday',13,'Event_01vzvdx',8,'851px','120px',1,'admin','2022-05-31 14:15:38','2022-05-31 14:15:38'),(109,'change_budget',0,'$$START_PAGE_KEY$$',6,'850px','120px',NULL,'admin','2022-05-31 23:38:17','2022-05-31 23:38:17'),(110,'holiday',15,'Activity_0zsqisd',8,'851px','120px',1,'A52744',NULL,NULL),(111,'holiday',15,'Activity_18ueswk',8,'851px','120px',1,'A52744',NULL,NULL),(112,'holiday',15,'Activity_1q5ylfn',8,'851px','120px',1,'A52744',NULL,NULL),(113,'holiday',15,'Activity_1ylj3fi',8,'851px','120px',1,'A52744',NULL,NULL),(114,'holiday',15,'Event_01vzvdx',8,'851px','120px',1,'A52744',NULL,NULL),(115,'holiday',15,'Flow_0g0bb7a',9,'851px','120px',1,'A52744',NULL,NULL),(116,'zhicheng',0,'$$START_PAGE_KEY$$',10,'850px','120px',NULL,'admin','2022-06-03 10:45:13','2022-06-03 10:45:13'),(117,'zhicheng',14,'Flow_1987ji2',12,'851px','120px',0,'admin','2022-06-03 10:53:04','2022-06-03 10:53:04'),(118,'zhicheng',14,'Activity_14spxxm',11,'851px','120px',1,'admin','2022-06-03 10:53:23','2022-06-03 10:53:23'),(119,'zhicheng',14,'Activity_0jqew3r',11,'851px','120px',1,'admin','2022-06-03 10:53:30','2022-06-03 10:53:30'),(120,'zhicheng',14,'Activity_07ykdvs',11,'851px','120px',1,'admin','2022-06-03 10:53:36','2022-06-03 10:53:36'),(121,'zhicheng',14,'Activity_021d8mc',11,'851px','120px',1,'admin','2022-06-03 10:53:39','2022-06-03 10:53:39'),(122,'zhicheng',14,'Activity_0vdh1ks',11,'851px','120px',1,'admin','2022-06-03 10:53:44','2022-06-03 10:53:44'),(123,'zhicheng',14,'Activity_12b79md',11,'851px','120px',1,'admin','2022-06-03 10:53:49','2022-06-03 10:53:49'),(124,'zhicheng',14,'Activity_0lfb8i2',11,'851px','120px',1,'admin','2022-06-03 10:53:51','2022-06-03 10:53:51'),(125,'zhicheng',14,'Activity_0asr136',11,'851px','120px',1,'admin','2022-06-03 10:53:55','2022-06-03 10:53:55'),(126,'zhicheng',14,'Activity_1he76ul',11,'851px','120px',1,'admin','2022-06-03 10:53:58','2022-06-03 10:53:58'),(127,'zhicheng',14,'Activity_042mne5',11,'851px','120px',1,'admin','2022-06-03 10:54:01','2022-06-03 10:54:01'),(128,'zhicheng',14,'Activity_0ruapc4',11,'851px','120px',1,'admin','2022-06-03 10:54:06','2022-06-03 10:54:06'),(129,'zhicheng',14,'Activity_14z3c2k',11,'851px','120px',1,'admin','2022-06-03 10:54:10','2022-06-03 10:54:10'),(130,'zhicheng',14,'Activity_1o3oq6z',11,'851px','120px',1,'admin','2022-06-03 10:54:15','2022-06-03 10:54:15'),(131,'zhicheng',14,'Activity_034nqqc',11,'851px','120px',1,'admin','2022-06-03 10:54:19','2022-06-03 10:54:19'),(132,'zhicheng',14,'Activity_0fkmkhz',11,'851px','120px',1,'admin','2022-06-03 10:54:22','2022-06-03 10:54:22'),(133,'zhicheng',14,'Activity_0vigf8t',11,'851px','120px',1,'admin','2022-06-03 10:54:32','2022-06-03 10:54:32'),(134,'zhicheng',14,'Activity_18eu7cy',11,'851px','120px',1,'admin','2022-06-03 10:54:35','2022-06-03 10:54:35'),(135,'zhicheng',14,'Activity_03ao98j',11,'851px','120px',1,'admin','2022-06-03 10:54:39','2022-06-03 10:54:39'),(136,'zhicheng',14,'Activity_0zriqf8',11,'851px','120px',1,'admin','2022-06-03 10:54:43','2022-06-03 10:54:43'),(137,'zhicheng',14,'Activity_0onst4q',11,'851px','120px',1,'admin','2022-06-03 10:54:46','2022-06-03 10:54:46'),(138,'zhicheng',14,'Activity_1et6ltk',11,'851px','120px',1,'admin','2022-06-03 10:54:49','2022-06-03 10:54:49'),(139,'zhicheng',14,'Activity_0zjkm7j',11,'851px','120px',1,'admin','2022-06-03 10:54:56','2022-06-03 10:54:56'),(140,'zhicheng',14,'Activity_1001vbk',11,'851px','120px',1,'admin','2022-06-03 10:55:01','2022-06-03 10:55:01'),(141,'zhicheng',14,'Activity_13zn5ne',11,'851px','120px',1,'admin','2022-06-03 10:55:04','2022-06-03 10:55:04'),(142,'zhicheng',14,'Activity_01isiwf',11,'851px','120px',1,'admin','2022-06-03 10:55:06','2022-06-03 10:55:06'),(143,'zhicheng',17,'Activity_01isiwf',11,'851px','120px',1,'admin',NULL,NULL),(144,'zhicheng',17,'Activity_021d8mc',11,'851px','120px',1,'admin',NULL,NULL),(145,'zhicheng',17,'Activity_034nqqc',11,'851px','120px',1,'admin',NULL,NULL),(146,'zhicheng',17,'Activity_03ao98j',11,'851px','120px',1,'admin',NULL,NULL),(147,'zhicheng',17,'Activity_042mne5',11,'851px','120px',1,'admin',NULL,NULL),(148,'zhicheng',17,'Activity_07ykdvs',11,'851px','120px',1,'admin',NULL,NULL),(149,'zhicheng',17,'Activity_0asr136',11,'851px','120px',1,'admin',NULL,NULL),(150,'zhicheng',17,'Activity_0fkmkhz',11,'851px','120px',1,'admin',NULL,NULL),(151,'zhicheng',17,'Activity_0jqew3r',11,'851px','120px',1,'admin',NULL,NULL),(152,'zhicheng',17,'Activity_0lfb8i2',11,'851px','120px',1,'admin',NULL,NULL),(153,'zhicheng',17,'Activity_0onst4q',11,'851px','120px',1,'admin',NULL,NULL),(154,'zhicheng',17,'Activity_0ruapc4',11,'851px','120px',1,'admin',NULL,NULL),(155,'zhicheng',17,'Activity_0vdh1ks',11,'851px','120px',1,'admin',NULL,NULL),(156,'zhicheng',17,'Activity_0vigf8t',11,'851px','120px',1,'admin',NULL,NULL),(157,'zhicheng',17,'Activity_0zjkm7j',11,'851px','120px',1,'admin',NULL,NULL),(158,'zhicheng',17,'Activity_0zriqf8',11,'851px','120px',1,'admin',NULL,NULL),(159,'zhicheng',17,'Activity_1001vbk',11,'851px','120px',1,'admin',NULL,NULL),(160,'zhicheng',17,'Activity_12b79md',11,'851px','120px',1,'admin',NULL,NULL),(161,'zhicheng',17,'Activity_13zn5ne',11,'851px','120px',1,'admin',NULL,NULL),(162,'zhicheng',17,'Activity_14spxxm',11,'851px','120px',1,'admin',NULL,NULL),(163,'zhicheng',17,'Activity_14z3c2k',11,'851px','120px',1,'admin',NULL,NULL),(164,'zhicheng',17,'Activity_18eu7cy',11,'851px','120px',1,'admin',NULL,NULL),(165,'zhicheng',17,'Activity_1et6ltk',11,'851px','120px',1,'admin',NULL,NULL),(166,'zhicheng',17,'Activity_1he76ul',11,'851px','120px',1,'admin',NULL,NULL),(167,'zhicheng',17,'Activity_1o3oq6z',11,'851px','120px',1,'admin',NULL,NULL),(168,'zhicheng',17,'Flow_1987ji2',12,'851px','120px',0,'admin',NULL,NULL),(169,'zhicheng',17,'Event_1kud1qc',11,'851px','120px',1,'admin','2022-06-03 11:36:24','2022-06-03 11:36:24'),(170,'zhicheng',17,'Activity_1rb8ybq',11,'851px','120px',1,'admin','2022-06-03 11:44:43','2022-06-03 11:44:43'),(171,'zhicheng',18,'Activity_01isiwf',11,'851px','120px',1,'admin',NULL,NULL),(172,'zhicheng',18,'Activity_021d8mc',11,'851px','120px',1,'admin',NULL,NULL),(173,'zhicheng',18,'Activity_034nqqc',11,'851px','120px',1,'admin',NULL,NULL),(174,'zhicheng',18,'Activity_03ao98j',11,'851px','120px',1,'admin',NULL,NULL),(175,'zhicheng',18,'Activity_042mne5',11,'851px','120px',1,'admin',NULL,NULL),(176,'zhicheng',18,'Activity_07ykdvs',11,'851px','120px',1,'admin',NULL,NULL),(177,'zhicheng',18,'Activity_0asr136',11,'851px','120px',1,'admin',NULL,NULL),(178,'zhicheng',18,'Activity_0fkmkhz',11,'851px','120px',1,'admin',NULL,NULL),(179,'zhicheng',18,'Activity_0jqew3r',11,'851px','120px',1,'admin',NULL,NULL),(180,'zhicheng',18,'Activity_0lfb8i2',11,'851px','120px',1,'admin',NULL,NULL),(181,'zhicheng',18,'Activity_0onst4q',11,'851px','120px',1,'admin',NULL,NULL),(182,'zhicheng',18,'Activity_0ruapc4',11,'851px','120px',1,'admin',NULL,NULL),(183,'zhicheng',18,'Activity_0vdh1ks',11,'851px','120px',1,'admin',NULL,NULL),(184,'zhicheng',18,'Activity_0vigf8t',11,'851px','120px',1,'admin',NULL,NULL),(185,'zhicheng',18,'Activity_0zjkm7j',11,'851px','120px',1,'admin',NULL,NULL),(186,'zhicheng',18,'Activity_0zriqf8',11,'851px','120px',1,'admin',NULL,NULL),(187,'zhicheng',18,'Activity_1001vbk',11,'851px','120px',1,'admin',NULL,NULL),(188,'zhicheng',18,'Activity_12b79md',11,'851px','120px',1,'admin',NULL,NULL),(189,'zhicheng',18,'Activity_13zn5ne',11,'851px','120px',1,'admin',NULL,NULL),(190,'zhicheng',18,'Activity_14spxxm',11,'851px','120px',1,'admin',NULL,NULL),(191,'zhicheng',18,'Activity_14z3c2k',11,'851px','120px',1,'admin',NULL,NULL),(192,'zhicheng',18,'Activity_18eu7cy',11,'851px','120px',1,'admin',NULL,NULL),(193,'zhicheng',18,'Activity_1et6ltk',11,'851px','120px',1,'admin',NULL,NULL),(194,'zhicheng',18,'Activity_1he76ul',11,'851px','120px',1,'admin',NULL,NULL),(195,'zhicheng',18,'Activity_1o3oq6z',11,'851px','120px',1,'admin',NULL,NULL),(196,'zhicheng',18,'Activity_1rb8ybq',11,'851px','120px',1,'admin',NULL,NULL),(197,'zhicheng',18,'Event_1kud1qc',11,'851px','120px',1,'admin',NULL,NULL),(198,'zhicheng',18,'Flow_1987ji2',12,'851px','120px',0,'admin',NULL,NULL),(199,'zhicheng',19,'Activity_01isiwf',11,'851px','120px',1,'admin',NULL,NULL),(200,'zhicheng',19,'Activity_021d8mc',11,'851px','120px',1,'admin',NULL,NULL),(201,'zhicheng',19,'Activity_034nqqc',11,'851px','120px',1,'admin',NULL,NULL),(202,'zhicheng',19,'Activity_03ao98j',11,'851px','120px',1,'admin',NULL,NULL),(203,'zhicheng',19,'Activity_042mne5',11,'851px','120px',1,'admin',NULL,NULL),(204,'zhicheng',19,'Activity_07ykdvs',11,'851px','120px',1,'admin',NULL,NULL),(205,'zhicheng',19,'Activity_0asr136',11,'851px','120px',1,'admin',NULL,NULL),(206,'zhicheng',19,'Activity_0fkmkhz',11,'851px','120px',1,'admin',NULL,NULL),(207,'zhicheng',19,'Activity_0jqew3r',11,'851px','120px',1,'admin',NULL,NULL),(208,'zhicheng',19,'Activity_0lfb8i2',11,'851px','120px',1,'admin',NULL,NULL),(209,'zhicheng',19,'Activity_0onst4q',11,'851px','120px',1,'admin',NULL,NULL),(210,'zhicheng',19,'Activity_0ruapc4',11,'851px','120px',1,'admin',NULL,NULL),(211,'zhicheng',19,'Activity_0vdh1ks',11,'851px','120px',1,'admin',NULL,NULL),(212,'zhicheng',19,'Activity_0vigf8t',11,'851px','120px',1,'admin',NULL,NULL),(213,'zhicheng',19,'Activity_0zjkm7j',11,'851px','120px',1,'admin',NULL,NULL),(214,'zhicheng',19,'Activity_0zriqf8',11,'851px','120px',1,'admin',NULL,NULL),(215,'zhicheng',19,'Activity_1001vbk',11,'851px','120px',1,'admin',NULL,NULL),(216,'zhicheng',19,'Activity_12b79md',11,'851px','120px',1,'admin',NULL,NULL),(217,'zhicheng',19,'Activity_13zn5ne',11,'851px','120px',1,'admin',NULL,NULL),(218,'zhicheng',19,'Activity_14spxxm',11,'851px','120px',1,'admin',NULL,NULL),(219,'zhicheng',19,'Activity_14z3c2k',11,'851px','120px',1,'admin',NULL,NULL),(220,'zhicheng',19,'Activity_18eu7cy',11,'851px','120px',1,'admin',NULL,NULL),(221,'zhicheng',19,'Activity_1et6ltk',11,'851px','120px',1,'admin',NULL,NULL),(222,'zhicheng',19,'Activity_1he76ul',11,'851px','120px',1,'admin',NULL,NULL),(223,'zhicheng',19,'Activity_1o3oq6z',11,'851px','120px',1,'admin',NULL,NULL),(224,'zhicheng',19,'Activity_1rb8ybq',11,'851px','120px',1,'admin',NULL,NULL),(225,'zhicheng',19,'Event_1kud1qc',11,'851px','120px',1,'admin',NULL,NULL),(226,'zhicheng',19,'Flow_1987ji2',12,'851px','120px',0,'admin',NULL,NULL),(227,'zhicheng',20,'Activity_01isiwf',11,'851px','120px',1,'admin',NULL,NULL),(228,'zhicheng',20,'Activity_021d8mc',11,'851px','120px',1,'admin',NULL,NULL),(229,'zhicheng',20,'Activity_034nqqc',11,'851px','120px',1,'admin',NULL,NULL),(230,'zhicheng',20,'Activity_03ao98j',11,'851px','120px',1,'admin',NULL,NULL),(231,'zhicheng',20,'Activity_042mne5',11,'851px','120px',1,'admin',NULL,NULL),(232,'zhicheng',20,'Activity_07ykdvs',11,'851px','120px',1,'admin',NULL,NULL),(233,'zhicheng',20,'Activity_0asr136',11,'851px','120px',1,'admin',NULL,NULL),(234,'zhicheng',20,'Activity_0fkmkhz',11,'851px','120px',1,'admin',NULL,NULL),(235,'zhicheng',20,'Activity_0jqew3r',11,'851px','120px',1,'admin',NULL,NULL),(236,'zhicheng',20,'Activity_0lfb8i2',11,'851px','120px',1,'admin',NULL,NULL),(237,'zhicheng',20,'Activity_0onst4q',11,'851px','120px',1,'admin',NULL,NULL),(238,'zhicheng',20,'Activity_0ruapc4',11,'851px','120px',1,'admin',NULL,NULL),(239,'zhicheng',20,'Activity_0vdh1ks',11,'851px','120px',1,'admin',NULL,NULL),(240,'zhicheng',20,'Activity_0vigf8t',11,'851px','120px',1,'admin',NULL,NULL),(241,'zhicheng',20,'Activity_0zjkm7j',11,'851px','120px',1,'admin',NULL,NULL),(242,'zhicheng',20,'Activity_0zriqf8',11,'851px','120px',1,'admin',NULL,NULL),(243,'zhicheng',20,'Activity_1001vbk',11,'851px','120px',1,'admin',NULL,NULL),(244,'zhicheng',20,'Activity_12b79md',11,'851px','120px',1,'admin',NULL,NULL),(245,'zhicheng',20,'Activity_13zn5ne',11,'851px','120px',1,'admin',NULL,NULL),(246,'zhicheng',20,'Activity_14spxxm',11,'851px','120px',1,'admin',NULL,NULL),(247,'zhicheng',20,'Activity_14z3c2k',11,'851px','120px',1,'admin',NULL,NULL),(248,'zhicheng',20,'Activity_18eu7cy',11,'851px','120px',1,'admin',NULL,NULL),(249,'zhicheng',20,'Activity_1et6ltk',11,'851px','120px',1,'admin',NULL,NULL),(250,'zhicheng',20,'Activity_1he76ul',11,'851px','120px',1,'admin',NULL,NULL),(251,'zhicheng',20,'Activity_1o3oq6z',11,'851px','120px',1,'admin',NULL,NULL),(252,'zhicheng',20,'Activity_1rb8ybq',11,'851px','120px',1,'admin',NULL,NULL),(253,'zhicheng',20,'Event_1kud1qc',11,'851px','120px',1,'admin',NULL,NULL),(254,'zhicheng',20,'Flow_1987ji2',12,'851px','120px',0,'admin',NULL,NULL),(255,'zhicheng',21,'Activity_01isiwf',11,'851px','120px',1,'admin',NULL,NULL),(256,'zhicheng',21,'Activity_021d8mc',11,'851px','120px',1,'admin',NULL,NULL),(257,'zhicheng',21,'Activity_034nqqc',11,'851px','120px',1,'admin',NULL,NULL),(258,'zhicheng',21,'Activity_03ao98j',11,'851px','120px',1,'admin',NULL,NULL),(259,'zhicheng',21,'Activity_042mne5',11,'851px','120px',1,'admin',NULL,NULL),(260,'zhicheng',21,'Activity_07ykdvs',11,'851px','120px',1,'admin',NULL,NULL),(261,'zhicheng',21,'Activity_0asr136',11,'851px','120px',1,'admin',NULL,NULL),(262,'zhicheng',21,'Activity_0fkmkhz',11,'851px','120px',1,'admin',NULL,NULL),(263,'zhicheng',21,'Activity_0jqew3r',11,'851px','120px',1,'admin',NULL,NULL),(264,'zhicheng',21,'Activity_0lfb8i2',11,'851px','120px',1,'admin',NULL,NULL),(265,'zhicheng',21,'Activity_0onst4q',11,'851px','120px',1,'admin',NULL,NULL),(266,'zhicheng',21,'Activity_0ruapc4',11,'851px','120px',1,'admin',NULL,NULL),(267,'zhicheng',21,'Activity_0vdh1ks',11,'851px','120px',1,'admin',NULL,NULL),(268,'zhicheng',21,'Activity_0vigf8t',11,'851px','120px',1,'admin',NULL,NULL),(269,'zhicheng',21,'Activity_0zjkm7j',11,'851px','120px',1,'admin',NULL,NULL),(270,'zhicheng',21,'Activity_0zriqf8',11,'851px','120px',1,'admin',NULL,NULL),(271,'zhicheng',21,'Activity_1001vbk',11,'851px','120px',1,'admin',NULL,NULL),(272,'zhicheng',21,'Activity_12b79md',11,'851px','120px',1,'admin',NULL,NULL),(273,'zhicheng',21,'Activity_13zn5ne',11,'851px','120px',1,'admin',NULL,NULL),(274,'zhicheng',21,'Activity_14spxxm',11,'851px','120px',1,'admin',NULL,NULL),(275,'zhicheng',21,'Activity_14z3c2k',11,'851px','120px',1,'admin',NULL,NULL),(276,'zhicheng',21,'Activity_18eu7cy',11,'851px','120px',1,'admin',NULL,NULL),(277,'zhicheng',21,'Activity_1et6ltk',11,'851px','120px',1,'admin',NULL,NULL),(278,'zhicheng',21,'Activity_1he76ul',11,'851px','120px',1,'admin',NULL,NULL),(279,'zhicheng',21,'Activity_1o3oq6z',11,'851px','120px',1,'admin',NULL,NULL),(280,'zhicheng',21,'Activity_1rb8ybq',11,'851px','120px',1,'admin',NULL,NULL),(281,'zhicheng',21,'Event_1kud1qc',11,'851px','120px',1,'admin',NULL,NULL),(282,'zhicheng',21,'Flow_1987ji2',12,'851px','120px',0,'admin',NULL,NULL);
/*!40000 ALTER TABLE `process_model_node_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_page`
--

DROP TABLE IF EXISTS `process_model_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面名称',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面备注',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程模型界面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_page`
--

LOCK TABLES `process_model_page` WRITE;
/*!40000 ALTER TABLE `process_model_page` DISABLE KEYS */;
INSERT INTO `process_model_page` VALUES (1,'change_budget','填写调整信息','填写调整信息','admin','2022-05-13 21:24:53','2022-05-13 21:24:53'),(2,'change_budget','完结界面','完结界面','admin','2022-05-18 20:01:03','2022-05-18 20:01:03'),(3,'change_budget','基础信息页面','基础信息页面','admin','2022-05-19 08:52:56','2022-05-19 08:52:56'),(4,'change_budget','基础信息','基础信息','admin','2022-05-19 22:52:12','2022-05-19 22:52:12'),(5,'change_budget','填写调整信息 - 提交','填写调整信息 - 页面','admin','2022-05-24 20:57:03','2022-05-24 20:57:03'),(6,'change_budget','START','启动界面','admin','2022-05-25 20:42:51','2022-05-25 20:42:51'),(7,'holiday','START','启动','admin','2022-05-31 09:45:06','2022-05-31 09:45:06'),(8,'holiday','基本信息','基本信息','admin','2022-05-31 11:23:55','2022-05-31 11:23:55'),(9,'holiday','请假明细提交','请假明细提交','admin','2022-05-31 11:27:17','2022-05-31 11:27:17'),(10,'zhicheng','启动表单',NULL,'admin','2022-06-03 10:44:24','2022-06-03 10:44:24'),(11,'zhicheng','基本信息',NULL,'admin','2022-06-03 10:45:20','2022-06-03 10:45:20'),(12,'zhicheng','专家审核界面',NULL,'admin','2022-06-03 10:46:42','2022-06-03 10:46:42');
/*!40000 ALTER TABLE `process_model_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_model_page_scheme`
--

DROP TABLE IF EXISTS `process_model_page_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_model_page_scheme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_model_page_id` bigint NOT NULL COMMENT '节点页面ID',
  `device` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'pc' COMMENT 'H5/PAD/PC',
  `field_id` bigint NOT NULL,
  `field_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名',
  `field_label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_no` int DEFAULT NULL COMMENT '序号',
  `span` tinyint DEFAULT NULL COMMENT '24栅格',
  `writeable` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `process_node_page_uindex` (`process_model_page_id`,`device`,`field_name`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_page_scheme`
--

LOCK TABLES `process_model_page_scheme` WRITE;
/*!40000 ALTER TABLE `process_model_page_scheme` DISABLE KEYS */;
INSERT INTO `process_model_page_scheme` VALUES (150,1,'h5',1,'sub_finance','子公司财务',1,24,0),(151,1,'h5',2,'sub_high_leader','子公司高层',2,24,0),(152,1,'h5',5,'end_monthly','是否月结调整',3,24,0),(153,1,'h5',3,'hq_high_leader','总部高层',4,24,0),(154,1,'h5',4,'hq_finance','总部财务',5,24,0),(155,1,'pad',2,'sub_high_leader','子公司高层',1,12,0),(156,1,'pad',1,'sub_finance','子公司财务',2,12,0),(157,1,'pad',4,'hq_finance','总部财务',3,12,0),(158,1,'pad',3,'hq_high_leader','总部高层',4,12,1),(159,1,'pad',5,'end_monthly','是否月结调整',5,24,1),(160,1,'pc',2,'sub_high_leader','子公司高层',1,8,0),(161,1,'pc',3,'hq_high_leader','总部高层',2,8,0),(162,1,'pc',1,'sub_finance','子公司财务',3,8,0),(163,1,'pc',4,'hq_finance','总部财务',4,8,0),(164,1,'pc',5,'end_monthly','是否月结调整',5,8,0),(285,2,'h5',4,'hq_finance','总部财务',1,24,0),(286,2,'h5',3,'hq_high_leader','总部高层',2,24,0),(287,2,'h5',1,'sub_finance','子公司财务',3,24,0),(288,2,'h5',2,'sub_high_leader','子公司高层',4,24,0),(289,2,'h5',5,'end_monthly','是否月结调整',5,24,0),(290,2,'pad',1,'sub_finance','子公司财务',0,24,0),(291,2,'pad',2,'sub_high_leader','子公司高层',1,24,0),(292,2,'pad',3,'hq_high_leader','总部高层',2,24,0),(293,2,'pad',4,'hq_finance','总部财务',3,24,0),(294,2,'pad',5,'end_monthly','是否月结调整',4,24,0),(295,2,'pc',4,'hq_finance','总部财务',1,12,0),(296,2,'pc',3,'hq_high_leader','总部高层',2,12,0),(297,2,'pc',1,'sub_finance','子公司财务',3,24,1),(298,2,'pc',2,'sub_high_leader','子公司高层',4,24,1),(299,2,'pc',5,'end_monthly','是否月结调整',5,24,1),(330,3,'h5',1,'sub_finance','子公司财务',0,24,0),(331,3,'h5',2,'sub_high_leader','子公司高层',1,24,0),(332,3,'h5',3,'hq_high_leader','总部高层',2,24,0),(333,3,'h5',4,'hq_finance','总部财务',3,24,0),(334,3,'h5',5,'end_monthly','是否月结调整',4,24,0),(335,3,'pad',1,'sub_finance','子公司财务',1,12,0),(336,3,'pad',2,'sub_high_leader','子公司高层',2,12,0),(337,3,'pad',3,'hq_high_leader','总部高层',3,12,0),(338,3,'pad',4,'hq_finance','总部财务',4,12,0),(339,3,'pad',5,'end_monthly','是否月结调整',5,24,0),(340,3,'pc',1,'sub_finance','子公司财务',1,8,0),(341,3,'pc',2,'sub_high_leader','子公司高层',2,8,0),(342,3,'pc',3,'hq_high_leader','总部高层',3,8,0),(343,3,'pc',4,'hq_finance','总部财务',4,12,0),(344,3,'pc',5,'end_monthly','是否月结调整',5,12,0),(360,4,'h5',1,'sub_finance','子公司财务',0,24,0),(361,4,'h5',2,'sub_high_leader','子公司高层',1,24,0),(362,4,'h5',3,'hq_high_leader','总部高层',2,24,0),(363,4,'h5',4,'hq_finance','总部财务',3,24,0),(364,4,'h5',5,'end_monthly','是否月结调整',4,24,0),(365,4,'pad',1,'sub_finance','子公司财务',0,24,0),(366,4,'pad',2,'sub_high_leader','子公司高层',1,24,0),(367,4,'pad',3,'hq_high_leader','总部高层',2,24,0),(368,4,'pad',4,'hq_finance','总部财务',3,24,0),(369,4,'pad',5,'end_monthly','是否月结调整',4,24,0),(370,4,'pc',1,'sub_finance','子公司财务',1,12,0),(371,4,'pc',2,'sub_high_leader','子公司高层',2,12,0),(372,4,'pc',3,'hq_high_leader','总部高层',3,12,0),(373,4,'pc',4,'hq_finance','总部财务',4,12,0),(374,4,'pc',5,'end_monthly','是否月结调整',5,24,0),(375,6,'h5',1,'sub_finance','子公司财务',0,24,1),(376,6,'h5',2,'sub_high_leader','子公司高层',1,24,1),(377,6,'h5',3,'hq_high_leader','总部高层',2,24,1),(378,6,'h5',4,'hq_finance','总部财务',3,24,1),(379,6,'h5',5,'end_monthly','是否月结调整',4,24,1),(380,6,'pad',1,'sub_finance','子公司财务',0,24,1),(381,6,'pad',2,'sub_high_leader','子公司高层',1,24,1),(382,6,'pad',3,'hq_high_leader','总部高层',2,24,1),(383,6,'pad',4,'hq_finance','总部财务',3,24,1),(384,6,'pad',5,'end_monthly','是否月结调整',4,24,1),(385,6,'pc',1,'sub_finance','子公司财务',1,12,1),(386,6,'pc',2,'sub_high_leader','子公司高层',2,12,1),(387,6,'pc',3,'hq_high_leader','总部高层',3,12,1),(388,6,'pc',4,'hq_finance','总部财务',4,12,1),(389,6,'pc',5,'end_monthly','是否月结调整',5,24,1),(390,5,'h5',1,'sub_finance','子公司财务',0,24,0),(391,5,'h5',2,'sub_high_leader','子公司高层',1,24,0),(392,5,'h5',3,'hq_high_leader','总部高层',2,24,0),(393,5,'h5',4,'hq_finance','总部财务',3,24,0),(394,5,'h5',5,'end_monthly','是否月结调整',4,24,0),(395,5,'pad',1,'sub_finance','子公司财务',0,24,1),(396,5,'pad',2,'sub_high_leader','子公司高层',1,24,1),(397,5,'pad',3,'hq_high_leader','总部高层',2,24,1),(398,5,'pad',4,'hq_finance','总部财务',3,24,1),(399,5,'pad',5,'end_monthly','是否月结调整',4,24,1),(400,5,'pc',1,'sub_finance','子公司财务',1,12,1),(401,5,'pc',2,'sub_high_leader','子公司高层',2,12,1),(402,5,'pc',3,'hq_high_leader','总部高层',3,12,1),(403,5,'pc',4,'hq_finance','总部财务',4,12,1),(404,5,'pc',5,'end_monthly','是否月结调整',5,24,1),(405,7,'h5',11,'name','名称',1,24,0),(406,7,'h5',20,'supervisor','主管',2,24,0),(407,7,'h5',18,'dept_leader','部门领导',3,24,0),(408,7,'h5',19,'hq_leaders','总部领导',3,24,0),(409,7,'pad',11,'name','名称',1,24,0),(410,7,'pad',20,'supervisor','主管',2,24,0),(411,7,'pad',18,'dept_leader','部门领导',3,24,0),(412,7,'pad',19,'hq_leaders','总部领导',3,24,0),(413,7,'pc',11,'name','名称',1,12,1),(414,7,'pc',20,'supervisor','主管',2,12,1),(415,7,'pc',18,'dept_leader','部门领导',3,12,1),(416,7,'pc',19,'hq_leaders','总部领导',4,12,1),(417,8,'h5',21,'code','编号',1,24,0),(418,8,'h5',11,'name','名称',2,24,0),(419,8,'h5',12,'creator','创建者',3,24,0),(420,8,'h5',20,'supervisor','主管',4,24,0),(421,8,'h5',18,'dept_leader','部门领导',5,24,0),(422,8,'h5',19,'hq_leaders','总部领导',6,24,0),(423,8,'pad',21,'code','编号',1,12,0),(424,8,'pad',11,'name','名称',2,12,0),(425,8,'pad',12,'creator','创建者',3,12,0),(426,8,'pad',20,'supervisor','主管',4,12,0),(427,8,'pad',18,'dept_leader','部门领导',5,12,0),(428,8,'pad',19,'hq_leaders','总部领导',6,12,0),(429,8,'pc',21,'code','编号',1,12,0),(430,8,'pc',11,'name','名称',2,12,0),(431,8,'pc',20,'supervisor','主管',3,12,0),(432,8,'pc',18,'dept_leader','部门领导',4,12,0),(433,8,'pc',19,'hq_leaders','总部领导',5,12,0),(434,9,'h5',22,'days','天数',0,24,1),(435,9,'pad',22,'days','天数',0,24,1),(436,9,'pc',22,'days','天数',0,24,1),(440,11,'h5',28,'name','名称',1,24,0),(441,11,'h5',29,'creator','创建者',2,24,0),(442,11,'h5',33,'judges','评委',2,24,0),(443,11,'pad',28,'name','名称',1,24,0),(444,11,'pad',29,'creator','创建者',2,24,0),(445,11,'pad',33,'judges','评委',2,24,0),(446,11,'pc',28,'name','名称',1,24,0),(447,11,'pc',29,'creator','创建者',2,24,0),(448,11,'pc',33,'judges','评委',2,24,0),(449,10,'h5',28,'name','名称',1,24,1),(450,10,'h5',33,'judges','评委',2,24,1),(451,10,'pad',28,'name','名称',1,24,1),(452,10,'pad',33,'judges','评委',2,24,1),(453,10,'pc',28,'name','名称',1,24,1),(454,10,'pc',33,'judges','评委',2,24,1),(455,12,'h5',34,'expert_status','状态',0,24,1),(456,12,'pad',34,'expert_status','状态',0,24,1),(457,12,'pc',34,'expert_status','状态',0,24,1);
/*!40000 ALTER TABLE `process_model_page_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `val` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置值',
  `scope` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '域',
  `order_no` int DEFAULT '0' COMMENT '键排序ID',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '0' COMMENT '状态,0=启用,1=禁用',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_config_scope_order_no_uindex` (`scope`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
  `simple_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门简称',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门描述',
  `ident` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门编号',
  `order_no` int DEFAULT '0',
  `pid` bigint DEFAULT '0' COMMENT '行政上级',
  `biz_pid` bigint DEFAULT '0' COMMENT '业务上级',
  `owner` bigint NOT NULL DEFAULT '0' COMMENT '部门经理',
  `assistant` bigint NOT NULL DEFAULT '0' COMMENT '部门助理',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,'Admin','Admin','','admin',1,0,0,0,0,NULL,NULL,NULL,0,'admin','2022-05-17 19:58:51','2022-02-20 00:33:19'),(2,'全球研发中心-Central Engineering','全球研发中心','','CE',1,1,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 08:42:43','2022-02-20 00:56:30'),(3,'总部-HQ','总部','','HQ',2,1,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 08:42:43','2022-02-20 00:59:41'),(4,'长沙分公司','长沙','','WL',3,1,0,0,0,NULL,NULL,NULL,0,'admin','2022-05-17 19:58:45','2022-02-20 01:00:14'),(5,'常州分公司','常州','','EX',4,1,0,0,0,NULL,NULL,NULL,0,'admin','2022-05-17 19:58:45','2022-02-20 01:14:19'),(6,'杭州分公司','杭州','','DL',5,1,0,0,0,NULL,NULL,NULL,0,'admin','2022-05-17 19:58:45','2022-02-20 01:14:48'),(7,'CE IT','数字信息','','CE001',1,2,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 08:42:43','2022-02-20 01:17:21'),(8,'CE ID','工业设计','','CE013',2,2,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 08:42:43','2022-02-20 01:17:38'),(9,'CE Intelligent S&T','智能设计院','','CE006',4,2,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 08:42:43','2022-02-20 01:18:31'),(10,'CE Big Data & AI R&D','大数据','','CE014',1,9,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 09:46:59','2022-02-20 01:18:48'),(11,'CE Smart Jobsite R&D','智能施工','','CE016',3,9,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 09:46:59','2022-02-20 01:24:25'),(12,'CE Smart Machine R&D','智能产品','','CE015',4,9,0,0,0,NULL,NULL,NULL,0,'admin','2022-02-22 09:46:59','2022-02-20 01:26:03');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_info`
--

DROP TABLE IF EXISTS `sys_dict_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scope` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'global',
  `ident` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0=normal,1=ban',
  `type` tinyint DEFAULT '1' COMMENT '1=list;2=tree',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_dict_info_scope_ident_uindex` (`scope`,`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_info`
--

LOCK TABLES `sys_dict_info` WRITE;
/*!40000 ALTER TABLE `sys_dict_info` DISABLE KEYS */;
INSERT INTO `sys_dict_info` VALUES (1,'通用状态','global','common_status',0,1,'通用状态','2022-04-03 00:50:54'),(2,'性别','global','sex',0,1,'性别','2022-04-03 01:11:29'),(3,'字典类型','global','dict_type',0,1,'字典类型','2022-04-03 15:14:24'),(4,'成本中心','global','cost_center',0,2,'成本中心','2022-04-03 23:27:24'),(5,'测测','global','test',0,1,'aaa','2022-04-04 11:00:27'),(6,'控件类型','global','component_type',0,1,'控件类型','2022-04-15 14:15:18'),(8,'是否','global','yesno',0,1,'','2022-04-24 22:01:54'),(9,'发布状态','global','publish',0,1,'','2022-04-27 13:36:18'),(10,'通过状态','global','pass_status',0,1,'通过/首次不通过/多次不通过','2022-06-03 10:41:50');
/*!40000 ALTER TABLE `sys_dict_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_value`
--

DROP TABLE IF EXISTS `sys_dict_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scope` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'global',
  `ident` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `val` bigint NOT NULL,
  `order_no` int DEFAULT '0',
  `status` tinyint DEFAULT NULL COMMENT '0=normal,1=ban',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'admin' COMMENT 'username',
  `pid` bigint NOT NULL DEFAULT '0',
  `meta` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"type":"success","effect":"light","size":"default"}' COMMENT 'TAG INFO JSON',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_dict_value_scope_ident_val_uindex` (`scope`,`ident`,`val`),
  UNIQUE KEY `sys_dict_value_scope_ident_pid_order_no_uindex` (`scope`,`ident`,`pid`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典值列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_value`
--

LOCK TABLES `sys_dict_value` WRITE;
/*!40000 ALTER TABLE `sys_dict_value` DISABLE KEYS */;
INSERT INTO `sys_dict_value` VALUES (1,'global','common_status','正常',0,1,0,'正常状态','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 00:51:37','2022-04-03 00:51:37'),(2,'global','common_status','禁用',1,2,0,'禁用状态','admin',0,'{\"type\":\"danger\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 03:28:51','2022-04-03 00:51:37'),(3,'global','sex','隐藏',0,1,0,'隐藏/空','admin',0,'{\"type\":\"\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 03:28:59','2022-04-03 01:12:38'),(4,'global','sex','男',1,2,0,'男','admin',0,'{\"type\":\"\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 03:29:00','2022-04-03 01:12:38'),(5,'global','sex','女',2,3,0,'女','admin',0,'{\"type\":\"\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 03:28:59','2022-04-03 01:12:38'),(6,'global','dict_type','列表',1,1,0,'列表','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-03 15:16:36','2022-04-03 15:16:36'),(7,'global','dict_type','树',2,2,0,'树','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 01:12:39','2022-04-03 15:16:37'),(12,'global','cost_center','测1',1,1,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 09:28:47','2022-04-03 23:44:28'),(13,'global','cost_center','测2',2,2,0,'测试2备注','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 00:49:22','2022-04-03 23:48:15'),(14,'global','cost_center','测3',3,3,0,'测试3备注','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 00:49:22','2022-04-03 23:48:31'),(16,'global','cost_center','子2',20,1,0,'子2','admin',12,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 10:40:09','2022-04-04 00:06:13'),(17,'global','cost_center','子1-1',6,1,0,'子1-1','admin',16,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 09:27:18','2022-04-04 00:07:52'),(18,'global','cost_center','测5',10,5,0,'测5','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 10:39:02','2022-04-04 00:34:44'),(19,'global','cost_center','子5-1',11,1,0,'子5-1','admin',18,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 00:35:43','2022-04-04 00:35:43'),(20,'global','cost_center','子5-1-1',13,1,0,'子5-1-1','admin',19,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 00:42:13','2022-04-04 00:36:18'),(21,'global','cost_center','子5-2',12,2,0,'子5-2','admin',18,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 00:44:14','2022-04-04 00:37:24'),(24,'global','test','c',1,1,0,'s','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 20:39:20','2022-04-04 11:23:19'),(25,'global','test','2',2,2,0,'s2','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-04 20:39:14','2022-04-04 11:23:25'),(26,'global','component_type','单行文本',1,1,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:15:48','2022-04-15 14:15:48'),(27,'global','component_type','多行文本',2,2,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:15:57','2022-04-15 14:15:57'),(28,'global','component_type','字典单选',3,3,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:06','2022-04-15 14:16:06'),(29,'global','component_type','字典多选',4,4,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:15','2022-04-15 14:16:15'),(30,'global','component_type','数字',5,5,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:23','2022-04-15 14:16:23'),(31,'global','component_type','用户',6,6,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:32','2022-04-15 14:16:32'),(32,'global','component_type','用户列表',7,7,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:40','2022-04-15 14:16:40'),(33,'global','component_type','动态标签',8,8,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:48','2022-04-15 14:16:48'),(34,'global','component_type','部门单选',9,9,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:16:57','2022-04-15 14:16:57'),(35,'global','component_type','部门多选',10,10,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 14:17:05','2022-04-15 14:17:05'),(36,'global','component_type','日期时间',11,11,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-15 18:01:54','2022-04-15 18:01:54'),(39,'global','yesno','是',1,1,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-25 22:44:34','2022-04-24 22:02:02'),(40,'global','yesno','否',0,2,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-04-25 22:44:31','2022-04-24 22:02:18'),(41,'global','publish','已发布',1,1,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-05-17 08:04:52','2022-04-27 13:38:11'),(42,'global','publish','未发布',0,2,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-05-17 08:09:04','2022-04-27 13:38:17'),(43,'global','pass_status','通过',1,1,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-06-03 10:42:06','2022-06-03 10:42:06'),(44,'global','pass_status','首次不通过',2,2,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-06-03 10:42:15','2022-06-03 10:42:15'),(45,'global','pass_status','多次不通过',3,3,0,'','admin',0,'{\"type\":\"success\",\"effect\":\"light\",\"size\":\"default\"}','2022-06-03 10:42:23','2022-06-03 10:42:23');
/*!40000 ALTER TABLE `sys_dict_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'route name',
  `route` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `close` tinyint NOT NULL DEFAULT '0' COMMENT '是否展示关闭按钮',
  `hidden` tinyint NOT NULL DEFAULT '0' COMMENT '不在菜单栏显示',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `pid` bigint NOT NULL DEFAULT '0',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_menu_name_uindex` (`name`),
  KEY `sys_menu_pid_index` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'Dashboard','dashboard','/home','House',0,0,'admin','admin',0,'2022-03-13 20:40:30','2022-02-18 18:49:02'),(2,'系统管理','sysManagement','/sys','Setting',0,0,'admin','admin',0,'2022-02-18 18:49:15','2022-02-18 18:49:15'),(3,'用户管理','userManagement','/sys/user','User',1,0,'admin','admin',2,'2022-02-18 19:05:56','2022-02-18 18:51:11'),(4,'角色管理','roleManagement','/sys/role','UserRole',1,0,'admin','admin',2,'2022-02-18 18:51:20','2022-02-18 18:51:20'),(5,'菜单管理','menuManagement','/sys/menu','Menu',1,0,'admin','admin',2,'2022-02-18 18:53:22','2022-02-18 18:53:22'),(6,'个人设置','userSetting','/user','UserSettings',0,0,'admin','admin',0,'2022-02-18 18:53:31','2022-02-18 18:53:31'),(7,'个人信息','userProfile','/user/profile','UserProfile',1,0,'admin','admin',6,'2022-02-18 21:43:31','2022-02-18 18:55:18'),(8,'修改密码','userPassword','/user/password','Password',1,0,'admin','admin',6,'2022-02-18 21:43:31','2022-02-18 18:55:21'),(9,'关联角色','userRelateRole','/sys/user/releta/role','relation',1,1,'admin','admin',0,'2022-02-20 13:47:23','2022-02-18 21:53:48'),(11,'关联菜单','roleRelateMenu','/sys/role/releta/menu','relation',1,1,'admin','admin',0,'2022-02-20 13:35:28','2022-02-18 22:36:15'),(12,'部门管理','deptManagement','/sys/dept','Department',1,0,'admin','admin',2,'2022-02-19 21:52:48','2022-02-19 21:52:48'),(13,'关联部门','userRelateDept','/sys/user/releta/dept','relation',1,1,'admin','admin',0,'2022-02-20 16:43:35','2022-02-20 16:43:35'),(14,'字典配置','dictConfig','/sys/config','config',1,0,'admin','admin',2,'2022-02-21 20:22:55','2022-02-21 20:22:55'),(16,'Shopee订单','shopeeOrder','/shopee','Order',1,0,'admin','admin',0,'2022-03-20 08:50:53','2022-03-20 08:50:53'),(17,'全部','shopeeAllOrder','/shopee/order/all','Order',1,0,'admin','admin',16,'2022-03-20 09:11:37','2022-03-20 09:11:37'),(18,'未完成','shopeePendingOrder','/shopee/order/pending','Order',1,0,'admin','admin',16,'2022-03-20 09:12:03','2022-03-20 09:11:53'),(19,'Lazada订单','lazadaOrder','/lazada','Order',1,0,'admin','admin',0,'2022-03-27 19:27:27','2022-03-27 19:27:27'),(20,'全部','lazadaAllOrder','/lazada/order/all','Order',1,0,'admin','admin',19,'2022-03-27 19:27:54','2022-03-27 19:27:54'),(21,'未完成','lazadaPendingOrder','/lazada/order/pending','Order',1,0,'admin','admin',19,'2022-03-27 19:28:12','2022-03-27 19:28:12'),(22,'流程设计','processDesign','/process/design','Cluster',1,0,'admin','admin',0,'2022-04-07 23:10:19','2022-04-02 10:08:30'),(23,'权限管理','permissionManagement','/sys/permission','UserRole',1,0,'admin','admin',2,'2022-04-04 02:17:18','2022-04-04 02:17:18'),(24,'流程管理','processManagement','/process/management','Cluster',1,0,'admin','admin',0,'2022-04-07 23:10:44','2022-04-07 23:10:44'),(25,'流程设计','processApp','/process/app','Cluster',1,0,'admin','admin',22,'2022-04-07 23:14:31','2022-04-07 23:11:38'),(28,'待认领流程','unclaimTask','/process/task/unclaim','InstanceVirtual',1,0,'admin','admin',24,'2022-05-22 23:36:47','2022-04-07 23:16:45'),(29,'我的待办','todoTask','/process/task/todo','Task',1,0,'admin','admin',24,'2022-05-21 00:51:50','2022-04-07 23:17:57'),(30,'我经办的流程','processHistoryInstance','/process/history/instance','Task',1,0,'admin','admin',24,'2022-05-22 23:37:08','2022-04-07 23:18:46'),(31,'流程列表','processInstanceByKey','/process/app/instance/:key','View',1,1,'admin','admin',22,'2022-04-08 08:30:35','2022-04-08 08:30:16'),(32,'流程图设计','processAppDesign','/process/app/design/:bpmnId','Cluster',1,1,'admin','admin',22,'2022-04-29 17:17:41','2022-04-12 10:19:44'),(33,'流程字段配置','processField','/process/field/:processKey','TextField',1,1,'admin','admin',22,'2022-04-15 08:46:17','2022-04-15 08:44:58'),(34,'流程模型','processModel','/process/model','Cluster',1,0,'admin','admin',22,'2022-04-25 22:53:04','2022-04-24 22:03:49'),(35,'流程明细','processInstanceInfo','/process/instance','InfoFilled',1,1,'admin','admin',22,'2022-05-04 11:26:23','2022-05-04 11:16:41'),(36,'流程页面','processModelPage','/process/model/page','Page',1,1,'admin','admin',22,'2022-05-16 19:07:40','2022-05-12 21:21:05');
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'系统管理员',1,0,'admin','2022-02-18 17:54:42','2022-02-18 17:54:42'),(2,'董事长',2,0,'admin','2022-02-18 17:54:58','2022-02-18 17:54:58'),(3,'总经理',3,0,'admin','2022-02-18 17:55:04','2022-02-18 17:55:04'),(4,'总监',4,0,'admin','2022-02-18 17:55:11','2022-02-18 17:55:11'),(5,'主管',5,0,'admin','2022-02-18 17:55:18','2022-02-18 17:55:18'),(6,'组长',6,0,'admin','2022-02-18 17:55:23','2022-02-18 17:55:23'),(7,'成员',7,0,'admin','2022-02-18 17:55:28','2022-02-18 17:55:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (288,2,1,'admin'),(289,2,3,'admin'),(290,2,4,'admin'),(291,2,5,'admin'),(292,2,7,'admin'),(293,2,8,'admin'),(294,2,12,'admin'),(295,2,14,'admin'),(296,2,23,'admin'),(297,2,25,'admin'),(298,2,28,'admin'),(299,2,29,'admin'),(300,2,30,'admin'),(301,2,31,'admin'),(302,2,32,'admin'),(303,2,33,'admin'),(376,1,1,'admin'),(377,1,3,'admin'),(378,1,4,'admin'),(379,1,5,'admin'),(380,1,7,'admin'),(381,1,8,'admin'),(382,1,12,'admin'),(383,1,14,'admin'),(384,1,23,'admin'),(385,1,29,'admin'),(386,1,30,'admin'),(387,1,31,'admin'),(388,1,32,'admin'),(389,1,33,'admin'),(390,1,34,'admin'),(391,1,35,'admin'),(392,1,36,'admin'),(393,1,28,'admin');
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','Admin','e10adc3949ba59abbe56e057f20f883e','18877811997','https://q4.qlogo.cn/g?b=qq&nk=942664114&s=0',NULL,0,'admin','l1yp@qq.com','2022-05-20 13:42:06','2022-02-16 15:32:27'),(2,'A52747','澜','e10adc3949ba59abbe56e057f20f883e','18077855148','/head/lan.jpg',NULL,0,'admin','12353@qq.com','2022-05-20 14:38:06','2022-02-22 21:30:42'),(3,'A52736','韩信','e10adc3949ba59abbe56e057f20f883e','18077855137','/head/hanxin.png',NULL,0,'admin','18877185@qq.com','2022-05-20 14:39:22','2022-02-22 20:11:26'),(4,'A52737','李白','e10adc3949ba59abbe56e057f20f883e','18077855138','/head/libai.png',NULL,0,'admin','18877195@qq.com','2022-05-20 14:40:42','2022-02-22 20:16:56'),(5,'A52738','不知婉儿','e10adc3949ba59abbe56e057f20f883e','18077855139','/head/waner.png',NULL,0,'admin','35295921@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:05'),(6,'A52739','马可波罗','e10adc3949ba59abbe56e057f20f883e','18077855140','/head/make.png',NULL,0,'admin','12345@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:05'),(7,'A52740','上官火舞','e10adc3949ba59abbe56e057f20f883e','18077855141','/head/huowu.png',NULL,0,'admin','12346@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:05'),(8,'A52741','露娜','e10adc3949ba59abbe56e057f20f883e','18077855142','/head/luna.png',NULL,0,'admin','12347@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:05'),(9,'A52742','小乔','e10adc3949ba59abbe56e057f20f883e','18077855143','/head/xiaoqiao.png',NULL,0,'admin','12348@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:06'),(10,'A52743','大乔','e10adc3949ba59abbe56e057f20f883e','18077855144','/head/daqiao.png',NULL,0,'admin','12349@qq.com','2022-05-20 14:41:21','2022-02-22 21:12:06'),(12,'A52744','孙策','e10adc3949ba59abbe56e057f20f883e','18077855145','/head/sunce.png',NULL,0,'admin','12350@qq.com','2022-05-20 14:41:21','2022-02-22 21:30:41'),(13,'A52745','妲己','e10adc3949ba59abbe56e057f20f883e','18077855146','/head/daji.png',NULL,0,'admin','12351@qq.com','2022-05-20 14:41:21','2022-02-22 21:30:41'),(14,'A52746','马超','e10adc3949ba59abbe56e057f20f883e','18077855147','/head/machao.png',NULL,0,'admin','12352@qq.com','2022-05-20 14:41:21','2022-02-22 21:30:41');
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
  `master` tinyint DEFAULT NULL COMMENT '0=兼职部门，1=主部门',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_dept_uid_dept_id_uindex` (`uid`,`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_dept`
--

LOCK TABLES `sys_user_dept` WRITE;
/*!40000 ALTER TABLE `sys_user_dept` DISABLE KEYS */;
INSERT INTO `sys_user_dept` VALUES (19,1,7,1,'admin','2022-02-24 15:38:51','2022-02-24 15:38:51'),(25,1,2,0,'admin','2022-02-24 15:49:26','2022-02-24 15:49:26'),(26,1,1,0,'admin','2022-02-24 15:49:26','2022-02-24 15:49:26'),(27,1,8,0,'admin','2022-02-24 15:49:26','2022-02-24 15:49:26'),(28,1,9,0,'admin','2022-02-24 15:49:26','2022-02-24 15:49:26'),(29,1,10,0,'admin','2022-02-24 15:49:26','2022-02-24 15:49:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (20,4,1,'admin','2022-04-08 00:17:27','2022-04-08 00:17:27'),(21,5,1,'admin','2022-04-08 00:17:31','2022-04-08 00:17:31'),(22,6,1,'admin','2022-04-08 00:17:39','2022-04-08 00:17:39'),(23,2,1,'admin','2022-05-19 08:38:59','2022-05-19 08:38:59'),(24,3,1,'admin','2022-05-19 08:40:12','2022-05-19 08:40:12'),(25,7,1,'admin','2022-05-19 08:40:22','2022-05-19 08:40:22'),(26,8,1,'admin','2022-05-19 08:40:28','2022-05-19 08:40:28'),(27,9,1,'admin','2022-05-19 08:40:31','2022-05-19 08:40:31'),(28,10,1,'admin','2022-05-19 08:40:33','2022-05-19 08:40:33'),(29,12,1,'admin','2022-05-19 08:40:36','2022-05-19 08:40:36'),(30,13,1,'admin','2022-05-19 08:40:39','2022-05-19 08:40:39'),(31,14,1,'admin','2022-05-19 08:40:45','2022-05-19 08:40:45'),(32,1,1,'admin','2022-06-06 21:04:46','2022-06-06 21:04:46'),(33,1,2,'admin','2022-06-06 21:04:46','2022-06-06 21:04:46'),(34,1,3,'admin','2022-06-06 21:04:46','2022-06-06 21:04:46'),(35,1,4,'admin','2022-06-06 21:04:46','2022-06-06 21:04:46');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_change_budget`
--

DROP TABLE IF EXISTS `wf_change_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_change_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_bpmn_id` bigint NOT NULL DEFAULT '0',
  `process_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `process_instance_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程实例ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `creator` bigint NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hq_high_leader` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '总部高层',
  `sub_high_leader` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子公司高层',
  `sub_finance` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子公司财务',
  `hq_finance` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '总部财务',
  `end_monthly` tinyint DEFAULT NULL COMMENT '是否月结调整',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_uindex` (`code`),
  UNIQUE KEY `process_instance_id_uindex` (`process_instance_id`),
  KEY `process_bpmn_id_index` (`process_bpmn_id`),
  KEY `process_definition_id_index` (`process_definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='预算调整流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_change_budget`
--

LOCK TABLES `wf_change_budget` WRITE;
/*!40000 ALTER TABLE `wf_change_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_change_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_field_dept`
--

DROP TABLE IF EXISTS `wf_field_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_field_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程标识',
  `wf_id` bigint DEFAULT NULL COMMENT '流程ID',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'flowable流程实例ID',
  `field_id` bigint NOT NULL COMMENT '字段ID(可更名不受影响)',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flowable_field_uindex` (`process_key`,`process_instance_id`,`field_id`,`dept_id`),
  UNIQUE KEY `process_model_field_uindex` (`process_key`,`wf_id`,`field_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门字段关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_field_dept`
--

LOCK TABLES `wf_field_dept` WRITE;
/*!40000 ALTER TABLE `wf_field_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_field_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_field_dict`
--

DROP TABLE IF EXISTS `wf_field_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_field_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程标识',
  `wf_id` bigint DEFAULT NULL COMMENT '流程ID',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `field_id` bigint NOT NULL COMMENT '字段ID(可更名不受影响)',
  `dict_id` bigint NOT NULL COMMENT '字典ID',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flowable_field_uindex` (`process_key`,`process_instance_id`,`field_id`,`dict_id`),
  UNIQUE KEY `process_model_field_uindex` (`process_key`,`wf_id`,`field_id`,`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典字段关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_field_dict`
--

LOCK TABLES `wf_field_dict` WRITE;
/*!40000 ALTER TABLE `wf_field_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_field_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_field_user`
--

DROP TABLE IF EXISTS `wf_field_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_field_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程标识',
  `wf_id` bigint DEFAULT NULL COMMENT '流程ID',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `field_id` bigint NOT NULL COMMENT '字段ID(可更名不受影响)',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flowable_field_uindex` (`process_key`,`process_instance_id`,`field_id`,`user_id`),
  UNIQUE KEY `process_model_field_uindex` (`process_key`,`wf_id`,`field_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_field_user`
--

LOCK TABLES `wf_field_user` WRITE;
/*!40000 ALTER TABLE `wf_field_user` DISABLE KEYS */;
INSERT INTO `wf_field_user` VALUES (1,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,2,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(2,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,3,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(3,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,4,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(4,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,5,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(5,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,6,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(6,'zhicheng',1,'9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2',33,7,'admin','2022-06-06 17:54:14','2022-06-06 17:54:14'),(7,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,2,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41'),(8,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,3,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41'),(9,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,4,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41'),(10,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,5,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41'),(11,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,6,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41'),(12,'zhicheng',2,'1c4869fe-e598-11ec-a357-00e0705f49db',33,7,'admin','2022-06-06 20:56:41','2022-06-06 20:56:41');
/*!40000 ALTER TABLE `wf_field_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_holiday`
--

DROP TABLE IF EXISTS `wf_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_holiday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_bpmn_id` bigint NOT NULL DEFAULT '0' COMMENT '流程版本ID',
  `process_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '流程定义ID',
  `process_instance_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程实例ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `creator` bigint NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dept_leader` bigint NOT NULL DEFAULT '0' COMMENT '直属上级',
  `hq_leaders` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '总部领导列表',
  `supervisor` bigint DEFAULT NULL COMMENT '主管',
  `days` int NOT NULL DEFAULT '0' COMMENT '请假天数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wf_holiday_code_uindex` (`code`),
  UNIQUE KEY `wf_holiday_process_instance_id_uindex` (`process_instance_id`),
  KEY `wf_holiday_process_bpmn_id_index` (`process_bpmn_id`),
  KEY `wf_holiday_process_definition_id_index` (`process_definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='请假流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_holiday`
--

LOCK TABLES `wf_holiday` WRITE;
/*!40000 ALTER TABLE `wf_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_zhicheng`
--

DROP TABLE IF EXISTS `wf_zhicheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_zhicheng` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_bpmn_id` bigint NOT NULL DEFAULT '0' COMMENT '流程版本ID',
  `process_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '流程定义ID',
  `process_instance_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程实例ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `creator` bigint NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `judges` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评委用户列表',
  `expert_status` bigint DEFAULT NULL COMMENT '专家审核',
  `expert_reject_count` int NOT NULL DEFAULT '0' COMMENT '专家退回次数',
  `form_reject_count` int NOT NULL DEFAULT '0' COMMENT '形式审查退回次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_uindex` (`code`),
  UNIQUE KEY `process_instance_id_uindex` (`process_instance_id`),
  KEY `process_bpmn_id_index` (`process_bpmn_id`),
  KEY `process_definition_id_index` (`process_definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='职称申请流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_zhicheng`
--

LOCK TABLES `wf_zhicheng` WRITE;
/*!40000 ALTER TABLE `wf_zhicheng` DISABLE KEYS */;
INSERT INTO `wf_zhicheng` VALUES (1,20,'zhicheng:1:97d129eb-e57e-11ec-87e2-d8bbc132d9b2','9f2b07bc-e57e-11ec-87e2-d8bbc132d9b2','ZL2022060600001','测试 退回',1,'1','2022-06-06 17:54:30','2022-06-06 17:54:14','2,3,4,5,6,7',NULL,0,2),(2,21,'zhicheng:2:0e61261d-e598-11ec-a357-00e0705f49db','1c4869fe-e598-11ec-a357-00e0705f49db','ZL2022060600002','测角色候选',1,'1','2022-06-06 20:56:41','2022-06-06 20:56:41','2,3,4,5,6,7',NULL,0,0);
/*!40000 ALTER TABLE `wf_zhicheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06 21:57:35