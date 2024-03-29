-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: van
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('023394ce-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday.bpmn20.xml','023394cd-6d66-11ed-a5b6-50ebf6b3961b',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"holiday\" name=\"请假流程\"><startEvent id=\"startEvent_39f7426\" name=\"开始\" flowable:formKey=\"1595071632762552322\" flowable:initiator=\"creator\"><outgoing>Flow_002ih2x</outgoing></startEvent><userTask id=\"Activity_1ro616j\" name=\"发起人\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;create_by&#34;)}\" flowable:assigneeFields=\"create_by\"><incoming>Flow_002ih2x</incoming><incoming>Flow_1t3xfdq</incoming><incoming>Flow_0xmo5tz</incoming><incoming>Flow_09eiiut</incoming><outgoing>Flow_1is270g</outgoing></userTask><sequenceFlow id=\"Flow_002ih2x\" sourceRef=\"startEvent_39f7426\" targetRef=\"Activity_1ro616j\" /><exclusiveGateway id=\"Gateway_0qjovut\"><incoming>Flow_1is270g</incoming><outgoing>Flow_0185z70</outgoing><outgoing>Flow_0xoo0rv</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1is270g\" name=\"提交\" sourceRef=\"Activity_1ro616j\" targetRef=\"Gateway_0qjovut\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"提交\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_1a0z8wz\" name=\"主管审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;leader&#34;)}\" flowable:assigneeFields=\"leader\"><incoming>Flow_0185z70</incoming><outgoing>Flow_06nakbb</outgoing><outgoing>Flow_09eiiut</outgoing></userTask><sequenceFlow id=\"Flow_0185z70\" name=\"请假天数&#62;10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_1a0z8wz\"><conditionExpression xsi:type=\"tFormalExpression\">${days &gt; 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0lwiy64\" name=\"HR审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;hr&#34;)}\" flowable:assigneeFields=\"hr\"><incoming>Flow_0xoo0rv</incoming><outgoing>Flow_0e8qrct</outgoing><outgoing>Flow_0xmo5tz</outgoing></userTask><sequenceFlow id=\"Flow_0xoo0rv\" name=\"请假天数&#60;=10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_0lwiy64\"><conditionExpression xsi:type=\"tFormalExpression\">${days &lt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0t23scb\" name=\"总部审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${assigneeItem}\" flowable:assigneeType=\"user\" flowable:assigneeFields=\"headquarters,hr,leader\"><incoming>Flow_06nakbb</incoming><incoming>Flow_0e8qrct</incoming><outgoing>Flow_15fc7du</outgoing><outgoing>Flow_1t3xfdq</outgoing><multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"${psr.readList(execution, &#34;holiday&#34;, &#34;headquarters,hr,leader&#34;)}\" flowable:elementVariable=\"assigneeItem\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><sequenceFlow id=\"Flow_06nakbb\" name=\"同意\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e8qrct\" name=\"同意\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><endEvent id=\"Event_0hqfd5v\" flowable:formKey=\"1595071870168547329\"><incoming>Flow_15fc7du</incoming></endEvent><sequenceFlow id=\"Flow_15fc7du\" name=\"同意\" sourceRef=\"Activity_0t23scb\" targetRef=\"Event_0hqfd5v\" flowable:order=\"1\" flowable:completionRule=\"all\" flowable:completionExpression=\"11111\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1t3xfdq\" name=\"拒绝\" sourceRef=\"Activity_0t23scb\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1593094587354505217\" flowable:order=\"2\" flowable:completionRule=\"any\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"拒绝\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xmo5tz\" name=\"驳回\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_09eiiut\" name=\"驳回\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"holiday\"><bpmndi:BPMNEdge id=\"Flow_09eiiut_di\" bpmnElement=\"Flow_09eiiut\"><omgdi:waypoint x=\"-450\" y=\"-180\" /><omgdi:waypoint x=\"-450\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-50\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-631\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xmo5tz_di\" bpmnElement=\"Flow_0xmo5tz\"><omgdi:waypoint x=\"-450\" y=\"140\" /><omgdi:waypoint x=\"-450\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-616\" y=\"183\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1t3xfdq_di\" bpmnElement=\"Flow_1t3xfdq\"><omgdi:waypoint x=\"-220\" y=\"20\" /><omgdi:waypoint x=\"-220\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-516\" y=\"263\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15fc7du_di\" bpmnElement=\"Flow_15fc7du\"><omgdi:waypoint x=\"-170\" y=\"-20\" /><omgdi:waypoint x=\"-38\" y=\"-20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-115\" y=\"-38\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e8qrct_di\" bpmnElement=\"Flow_0e8qrct\"><omgdi:waypoint x=\"-400\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-331\" y=\"82\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06nakbb_di\" bpmnElement=\"Flow_06nakbb\"><omgdi:waypoint x=\"-400\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-60\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-321\" y=\"-158\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xoo0rv_di\" bpmnElement=\"Flow_0xoo0rv\"><omgdi:waypoint x=\"-630\" y=\"15\" /><omgdi:waypoint x=\"-630\" y=\"100\" /><omgdi:waypoint x=\"-500\" y=\"100\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-665\" y=\"113\" width=\"70\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0185z70_di\" bpmnElement=\"Flow_0185z70\"><omgdi:waypoint x=\"-630\" y=\"-35\" /><omgdi:waypoint x=\"-630\" y=\"-140\" /><omgdi:waypoint x=\"-500\" y=\"-140\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-662\" y=\"-157\" width=\"63\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1is270g_di\" bpmnElement=\"Flow_1is270g\"><omgdi:waypoint x=\"-740\" y=\"-10\" /><omgdi:waypoint x=\"-655\" y=\"-10\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-708\" y=\"-28\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_002ih2x_di\" bpmnElement=\"Flow_002ih2x\"><omgdi:waypoint x=\"-912\" y=\"-10\" /><omgdi:waypoint x=\"-840\" y=\"-10\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"startEvent_39f7426\"><omgdc:Bounds x=\"-948\" y=\"-28\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-941\" y=\"8\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1ro616j_di\" bpmnElement=\"Activity_1ro616j\"><omgdc:Bounds x=\"-840\" y=\"-50\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qjovut_di\" bpmnElement=\"Gateway_0qjovut\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-655\" y=\"-35\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1a0z8wz_di\" bpmnElement=\"Activity_1a0z8wz\"><omgdc:Bounds x=\"-500\" y=\"-180\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lwiy64_di\" bpmnElement=\"Activity_0lwiy64\"><omgdc:Bounds x=\"-500\" y=\"60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0t23scb_di\" bpmnElement=\"Activity_0t23scb\"><omgdc:Bounds x=\"-270\" y=\"-60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_0hqfd5v_di\" bpmnElement=\"Event_0hqfd5v\"><omgdc:Bounds x=\"-38\" y=\"-38\" width=\"36\" height=\"36\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('285ea4a2-7539-11ed-90fe-50ebf6b3961b',1,'holiday.bpmn20.xml','285ea4a1-7539-11ed-90fe-50ebf6b3961b',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"holiday\" name=\"请假流程\"><startEvent id=\"startEvent_39f7426\" name=\"开始\" flowable:formKey=\"1595071632762552322\" flowable:initiator=\"creator\"><outgoing>Flow_002ih2x</outgoing></startEvent><userTask id=\"Activity_1ro616j\" name=\"发起人\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;create_by&#34;)}\" flowable:assigneeFields=\"create_by\"><incoming>Flow_002ih2x</incoming><incoming>Flow_1t3xfdq</incoming><incoming>Flow_0xmo5tz</incoming><incoming>Flow_09eiiut</incoming><outgoing>Flow_1is270g</outgoing></userTask><sequenceFlow id=\"Flow_002ih2x\" sourceRef=\"startEvent_39f7426\" targetRef=\"Activity_1ro616j\" /><exclusiveGateway id=\"Gateway_0qjovut\"><incoming>Flow_1is270g</incoming><outgoing>Flow_0185z70</outgoing><outgoing>Flow_0xoo0rv</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1is270g\" name=\"提交\" sourceRef=\"Activity_1ro616j\" targetRef=\"Gateway_0qjovut\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"提交\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_1a0z8wz\" name=\"主管审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;leader&#34;)}\" flowable:assigneeFields=\"leader\"><incoming>Flow_0185z70</incoming><outgoing>Flow_06nakbb</outgoing><outgoing>Flow_09eiiut</outgoing></userTask><sequenceFlow id=\"Flow_0185z70\" name=\"请假天数&#62;10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_1a0z8wz\"><conditionExpression xsi:type=\"tFormalExpression\">${days &gt; 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0lwiy64\" name=\"HR审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;hr&#34;)}\" flowable:assigneeFields=\"hr\"><incoming>Flow_0xoo0rv</incoming><outgoing>Flow_0e8qrct</outgoing><outgoing>Flow_0xmo5tz</outgoing></userTask><sequenceFlow id=\"Flow_0xoo0rv\" name=\"请假天数&#60;=10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_0lwiy64\"><conditionExpression xsi:type=\"tFormalExpression\">${days &lt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0t23scb\" name=\"总部审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${assigneeItem}\" flowable:assigneeType=\"user\" flowable:assigneeFields=\"headquarters,hr,leader\"><incoming>Flow_06nakbb</incoming><incoming>Flow_0e8qrct</incoming><outgoing>Flow_15fc7du</outgoing><outgoing>Flow_1t3xfdq</outgoing><multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"${psr.readList(execution, &#34;holiday&#34;, &#34;headquarters,hr,leader&#34;)}\" flowable:elementVariable=\"assigneeItem\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><sequenceFlow id=\"Flow_06nakbb\" name=\"同意\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e8qrct\" name=\"同意\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><endEvent id=\"Event_0hqfd5v\" flowable:formKey=\"1595071870168547329\"><incoming>Flow_15fc7du</incoming></endEvent><sequenceFlow id=\"Flow_15fc7du\" name=\"同意\" sourceRef=\"Activity_0t23scb\" targetRef=\"Event_0hqfd5v\" flowable:order=\"1\" flowable:completionRule=\"all\" flowable:completionExpression=\"11111\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1t3xfdq\" name=\"拒绝\" sourceRef=\"Activity_0t23scb\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"2\" flowable:completionRule=\"any\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"拒绝\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xmo5tz\" name=\"驳回\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_09eiiut\" name=\"驳回\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"holiday\"><bpmndi:BPMNEdge id=\"Flow_09eiiut_di\" bpmnElement=\"Flow_09eiiut\"><omgdi:waypoint x=\"-450\" y=\"-180\" /><omgdi:waypoint x=\"-450\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-50\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-631\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xmo5tz_di\" bpmnElement=\"Flow_0xmo5tz\"><omgdi:waypoint x=\"-450\" y=\"140\" /><omgdi:waypoint x=\"-450\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-616\" y=\"183\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1t3xfdq_di\" bpmnElement=\"Flow_1t3xfdq\"><omgdi:waypoint x=\"-220\" y=\"20\" /><omgdi:waypoint x=\"-220\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-516\" y=\"263\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15fc7du_di\" bpmnElement=\"Flow_15fc7du\"><omgdi:waypoint x=\"-170\" y=\"-20\" /><omgdi:waypoint x=\"-38\" y=\"-20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-115\" y=\"-38\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e8qrct_di\" bpmnElement=\"Flow_0e8qrct\"><omgdi:waypoint x=\"-400\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-331\" y=\"82\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06nakbb_di\" bpmnElement=\"Flow_06nakbb\"><omgdi:waypoint x=\"-400\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-60\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-321\" y=\"-158\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xoo0rv_di\" bpmnElement=\"Flow_0xoo0rv\"><omgdi:waypoint x=\"-630\" y=\"15\" /><omgdi:waypoint x=\"-630\" y=\"100\" /><omgdi:waypoint x=\"-500\" y=\"100\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-665\" y=\"113\" width=\"70\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0185z70_di\" bpmnElement=\"Flow_0185z70\"><omgdi:waypoint x=\"-630\" y=\"-35\" /><omgdi:waypoint x=\"-630\" y=\"-140\" /><omgdi:waypoint x=\"-500\" y=\"-140\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-662\" y=\"-157\" width=\"63\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1is270g_di\" bpmnElement=\"Flow_1is270g\"><omgdi:waypoint x=\"-740\" y=\"-10\" /><omgdi:waypoint x=\"-655\" y=\"-10\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-708\" y=\"-28\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_002ih2x_di\" bpmnElement=\"Flow_002ih2x\"><omgdi:waypoint x=\"-912\" y=\"-10\" /><omgdi:waypoint x=\"-840\" y=\"-10\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"startEvent_39f7426\"><omgdc:Bounds x=\"-948\" y=\"-28\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-941\" y=\"8\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1ro616j_di\" bpmnElement=\"Activity_1ro616j\"><omgdc:Bounds x=\"-840\" y=\"-50\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qjovut_di\" bpmnElement=\"Gateway_0qjovut\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-655\" y=\"-35\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1a0z8wz_di\" bpmnElement=\"Activity_1a0z8wz\"><omgdc:Bounds x=\"-500\" y=\"-180\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lwiy64_di\" bpmnElement=\"Activity_0lwiy64\"><omgdc:Bounds x=\"-500\" y=\"60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0t23scb_di\" bpmnElement=\"Activity_0t23scb\"><omgdc:Bounds x=\"-270\" y=\"-60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_0hqfd5v_di\" bpmnElement=\"Event_0hqfd5v\"><omgdc:Bounds x=\"-38\" y=\"-38\" width=\"36\" height=\"36\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
INSERT INTO `ACT_HI_ACTINST` VALUES ('00a7fd34-750c-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Flow_0e8qrct',NULL,NULL,'同意','sequenceFlow',NULL,'2022-12-06 10:16:32.942','2022-12-06 10:16:32.942',1,0,NULL,''),('00adf0b1-750c-11ed-84c9-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b','Activity_0t23scb','00adf0b2-750c-11ed-84c9-50ebf6b3961b',NULL,'总部审核','userTask','1','2022-12-06 10:16:32.981','2022-12-06 10:16:34.560',2,1579,'MI_END',''),('01a76be8-750c-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','01a744d7-750c-11ed-84c9-50ebf6b3961b','Flow_15fc7du',NULL,NULL,'同意','sequenceFlow',NULL,'2022-12-06 10:16:34.616','2022-12-06 10:16:34.616',1,0,NULL,''),('01a76be9-750c-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','01a744d7-750c-11ed-84c9-50ebf6b3961b','Event_0hqfd5v',NULL,NULL,NULL,'endEvent',NULL,'2022-12-06 10:16:34.616','2022-12-06 10:16:34.618',2,2,NULL,''),('05d0bda2-717d-11ed-97ac-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Flow_06nakbb',NULL,NULL,'同意','sequenceFlow',NULL,'2022-12-01 21:35:30.077','2022-12-01 21:35:30.077',1,0,NULL,''),('05e04e0f-717d-11ed-97ac-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b','Activity_0t23scb','05e04e10-717d-11ed-97ac-50ebf6b3961b',NULL,'总部审核','userTask','1','2022-12-01 21:35:30.179','2022-12-01 21:38:14.448',2,164269,'MI_END',''),('0d20e1ea-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-06 23:02:50.017','2022-12-06 23:02:50.019',1,2,NULL,''),('0d21300b-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-06 23:02:50.019','2022-12-06 23:02:50.019',2,0,NULL,''),('0d21300c-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','Activity_1ro616j','0d21cc4d-7577-11ed-82e6-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-06 23:02:50.019',NULL,3,NULL,NULL,''),('12329523-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-11-26 16:41:07.775','2022-11-26 16:41:07.777',1,2,NULL,''),('12330a54-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-11-26 16:41:07.778','2022-11-26 16:41:07.778',2,0,NULL,''),('12330a55-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_1ro616j','12337f86-6d66-11ed-a5b6-50ebf6b3961b',NULL,'发起人','userTask','2','2022-11-26 16:41:07.778','2022-11-26 16:41:29.920',3,22142,NULL,''),('1f6974cb-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-11-26 16:41:29.945','2022-11-26 16:41:29.945',1,0,NULL,''),('1f6a381c-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-11-26 16:41:29.950','2022-11-26 16:41:29.951',2,1,NULL,''),('1f6a5f2d-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-11-26 16:41:29.951','2022-11-26 16:41:29.951',3,0,NULL,''),('1f6b498e-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_0lwiy64','1f6b709f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'HR审核','userTask','2','2022-11-26 16:41:29.957','2022-11-26 16:45:25.676',4,235719,NULL,''),('2f1b984f-6d67-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0e8qrct',NULL,NULL,'同意','sequenceFlow',NULL,'2022-11-26 16:49:05.775','2022-11-26 16:49:05.775',1,0,NULL,''),('4093f23c-6d67-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b','Activity_0t23scb','4094194d-6d67-11ed-a5b6-50ebf6b3961b',NULL,'总部审核','userTask','2','2022-11-26 16:49:35.085','2022-11-26 16:51:38.845',2,123760,'MI_END',''),('67d227e7-717d-11ed-b634-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','67d11676-717d-11ed-b634-50ebf6b3961b','Flow_15fc7du',NULL,NULL,'同意','sequenceFlow',NULL,'2022-12-01 21:38:14.503','2022-12-01 21:38:14.503',1,0,NULL,''),('67d227e8-717d-11ed-b634-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','67d11676-717d-11ed-b634-50ebf6b3961b','Event_0hqfd5v',NULL,NULL,NULL,'endEvent',NULL,'2022-12-01 21:38:14.503','2022-12-01 21:38:14.504',2,1,NULL,''),('6fb83d3d-7179-11ed-832f-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-12-01 21:09:49.768','2022-12-01 21:09:49.768',1,0,NULL,''),('6fb975be-7179-11ed-832f-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-12-01 21:09:49.776','2022-12-01 21:09:49.776',2,0,NULL,''),('6fb975bf-7179-11ed-832f-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Flow_0185z70',NULL,NULL,'请假天数>10','sequenceFlow',NULL,'2022-12-01 21:09:49.776','2022-12-01 21:09:49.776',3,0,NULL,''),('6fba6020-7179-11ed-832f-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Activity_1a0z8wz','6fba8731-7179-11ed-832f-50ebf6b3961b',NULL,'主管审核','userTask','1','2022-12-01 21:09:49.782','2022-12-01 21:35:30.052',4,1540270,NULL,''),('77603725-7175-11ed-92bd-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-01 20:41:24.626','2022-12-01 20:41:24.628',1,2,NULL,''),('7760ac56-7175-11ed-92bd-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-01 20:41:24.629','2022-12-01 20:41:24.629',2,0,NULL,''),('7760ac57-7175-11ed-92bd-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b','Activity_1ro616j','77612188-7175-11ed-92bd-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-01 20:41:24.629','2022-12-01 21:09:49.744',3,1705115,NULL,''),('7cffd213-7535-11ed-b3c7-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-06 15:13:30.921','2022-12-06 15:13:30.923',1,2,NULL,''),('7d004744-7535-11ed-b3c7-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-06 15:13:30.924','2022-12-06 15:13:30.924',2,0,NULL,''),('7d004745-7535-11ed-b3c7-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Activity_1ro616j','7d00e386-7535-11ed-b3c7-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-06 15:13:30.924','2022-12-06 23:07:04.224',3,28413300,NULL,''),('8a5c7f03-6d67-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Flow_1t3xfdq',NULL,NULL,'拒绝','sequenceFlow',NULL,'2022-11-26 16:51:38.873','2022-11-26 16:51:38.873',1,0,NULL,''),('8a5c7f04-6d67-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Activity_1ro616j','8a5c7f05-6d67-11ed-a5b6-50ebf6b3961b',NULL,'发起人','userTask','2','2022-11-26 16:51:38.873','2022-11-26 17:29:44.720',2,2285847,NULL,''),('a4a92642-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-12-06 23:07:04.246','2022-12-06 23:07:04.246',1,0,NULL,''),('a4aa5ec3-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-12-06 23:07:04.254','2022-12-06 23:07:04.256',2,2,NULL,''),('a4aaace4-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-12-06 23:07:04.256','2022-12-06 23:07:04.256',3,0,NULL,''),('a4ab9745-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Activity_0lwiy64','a4abbe56-7577-11ed-82e6-50ebf6b3961b',NULL,'HR审核','userTask','1','2022-12-06 23:07:04.262',NULL,4,NULL,NULL,''),('abec8693-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0xmo5tz',NULL,NULL,'驳回','sequenceFlow',NULL,'2022-11-26 16:45:25.685','2022-11-26 16:45:25.685',1,0,NULL,''),('abed70f4-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_1ro616j','abed70f5-6d66-11ed-a5b6-50ebf6b3961b',NULL,'发起人','userTask','2','2022-11-26 16:45:25.691','2022-11-26 16:45:40.213',2,14522,NULL,''),('b4972759-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-11-26 16:45:40.225','2022-11-26 16:45:40.225',1,0,NULL,''),('b497eaaa-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-11-26 16:45:40.230','2022-11-26 16:45:40.230',2,0,NULL,''),('b497eaab-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-11-26 16:45:40.230','2022-11-26 16:45:40.230',3,0,NULL,''),('b498adfc-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_0lwiy64','b498adfd-6d66-11ed-a5b6-50ebf6b3961b',NULL,'HR审核','userTask','2','2022-11-26 16:45:40.235','2022-11-26 16:46:42.420',4,62185,NULL,''),('d9ab0941-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0xmo5tz',NULL,NULL,'驳回','sequenceFlow',NULL,'2022-11-26 16:46:42.431','2022-11-26 16:46:42.431',1,0,NULL,''),('d9abf3a2-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_1ro616j','d9abf3a3-6d66-11ed-a5b6-50ebf6b3961b',NULL,'发起人','userTask','2','2022-11-26 16:46:42.437','2022-11-26 16:47:39.034',2,56597,NULL,''),('dcd70d49-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-11-26 17:29:44.733','2022-11-26 17:29:44.733',1,0,NULL,''),('dcd81eba-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-11-26 17:29:44.740','2022-11-26 17:29:44.740',2,0,NULL,''),('dcd81ebb-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-11-26 17:29:44.740','2022-11-26 17:29:44.740',3,0,NULL,''),('dcd8e20c-6d6c-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Activity_0lwiy64','dcd8e20d-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'HR审核','userTask','2','2022-11-26 17:29:44.745','2022-11-26 17:30:13.129',4,28384,NULL,''),('edc5ebe1-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b','Flow_0e8qrct',NULL,NULL,'同意','sequenceFlow',NULL,'2022-11-26 17:30:13.142','2022-11-26 17:30:13.142',1,0,NULL,''),('edc96e5e-6d6c-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b','Activity_0t23scb','edc96e5f-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'总部审核','userTask','2','2022-11-26 17:30:13.165','2022-11-26 17:30:22.153',2,8988,'MI_END',''),('f32929e5-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','f32929e4-6d6c-11ed-a5b6-50ebf6b3961b','Flow_15fc7du',NULL,NULL,'同意','sequenceFlow',NULL,'2022-11-26 17:30:22.181','2022-11-26 17:30:22.181',1,0,NULL,''),('f32929e6-6d6c-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','f32929e4-6d6c-11ed-a5b6-50ebf6b3961b','Event_0hqfd5v',NULL,NULL,NULL,'endEvent',NULL,'2022-11-26 17:30:22.181','2022-11-26 17:30:22.182',2,1,NULL,''),('f3cd1d9b-717d-11ed-a8ac-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-01 21:42:09.351','2022-12-01 21:42:09.353',1,2,NULL,''),('f3cd92cc-717d-11ed-a8ac-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-01 21:42:09.354','2022-12-01 21:42:09.354',2,0,NULL,''),('f3cd92cd-717d-11ed-a8ac-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Activity_1ro616j','f3ce561e-717d-11ed-a8ac-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-01 21:42:09.354','2022-12-06 10:16:30.819',3,390861465,NULL,''),('fb69a5a7-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-11-26 16:47:39.045','2022-11-26 16:47:39.045',1,0,NULL,''),('fb6a9008-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-11-26 16:47:39.051','2022-11-26 16:47:39.051',2,0,NULL,''),('fb6a9009-6d66-11ed-a5b6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-11-26 16:47:39.051','2022-11-26 16:47:39.051',3,0,NULL,''),('fb6bef9a-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b','Activity_0lwiy64','fb6c16ab-6d66-11ed-a5b6-50ebf6b3961b',NULL,'HR审核','userTask','2','2022-11-26 16:47:39.060','2022-11-26 16:49:05.758',4,86698,NULL,''),('ff6dcf7c-750b-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-12-06 10:16:30.883','2022-12-06 10:16:30.883',1,0,NULL,''),('ff70196d-750b-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-12-06 10:16:30.898','2022-12-06 10:16:30.900',2,2,NULL,''),('ff70678e-750b-11ed-84c9-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-12-06 10:16:30.900','2022-12-06 10:16:30.900',3,0,NULL,''),('ff73e9ff-750b-11ed-84c9-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b','Activity_0lwiy64','ff743820-750b-11ed-84c9-50ebf6b3961b',NULL,'HR审核','userTask','1','2022-12-06 10:16:30.923','2022-12-06 10:16:32.918',4,1995,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
INSERT INTO `ACT_HI_COMMENT` VALUES ('009845c2-750c-11ed-84c9-50ebf6b3961b','complete','2022-12-06 10:16:32.839','1','ff743820-750b-11ed-84c9-50ebf6b3961b','1598311490964471810','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('017e8724-750c-11ed-84c9-50ebf6b3961b','complete','2022-12-06 10:16:34.347','1','00adf0b2-750c-11ed-84c9-50ebf6b3961b','1598311490964471810','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('05c43a80-717d-11ed-97ac-50ebf6b3961b','complete','2022-12-01 21:35:29.995','1','6fba8731-7179-11ed-832f-50ebf6b3961b','1598296203884044289','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('1f5c5569-6d66-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:41:29.859','2','12337f86-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('2f12226d-6d67-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:49:05.713','2','fb6c16ab-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('67b15973-717d-11ed-b634-50ebf6b3961b','complete','2022-12-01 21:38:14.288','1','05e04e10-717d-11ed-97ac-50ebf6b3961b','1598296203884044289','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('6fa9220b-7179-11ed-832f-50ebf6b3961b','complete','2022-12-01 21:09:49.669','1','77612188-7175-11ed-92bd-50ebf6b3961b','1598296203884044289','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('7b05cc9f-6d67-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:51:13.139','2','4094194d-6d67-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"拒绝\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"拒绝\",\"comment\":null}'),('a49e50d0-7577-11ed-82e6-50ebf6b3961b','complete','2022-12-06 23:07:04.175','1','7d00e386-7535-11ed-b3c7-50ebf6b3961b','1600025625313964033','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('abe337c1-6d66-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:45:25.624','2','1f6b709f-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"驳回\",\"comment\":\"测试\"}',_binary '{\"type\":\"complete\",\"outcome\":\"驳回\",\"comment\":\"测试\"}'),('b48cee27-6d66-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:45:40.158','2','abed70f5-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('d9a1ba6f-6d66-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:46:42.370','2','b498adfd-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"驳回\",\"comment\":\"111111111\"}',_binary '{\"type\":\"complete\",\"outcome\":\"驳回\",\"comment\":\"111111111\"}'),('dccb9b97-6d6c-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 17:29:44.658','2','8a5c7f05-6d67-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('edbb8b9f-6d6c-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 17:30:13.074','2','dcd8e20d-6d6c-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('f3104ab1-6d6c-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 17:30:22.018','2','edc96e5f-6d6c-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"同意\",\"comment\":null}'),('fb607de5-6d66-11ed-a5b6-50ebf6b3961b','comment','2022-11-26 16:47:38.985','2','d9abf3a3-6d66-11ed-a5b6-50ebf6b3961b','1596423795937923073','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}'),('ff4b2c4a-750b-11ed-84c9-50ebf6b3961b','complete','2022-12-06 10:16:30.656','1','f3ce561e-717d-11ed-a8ac-50ebf6b3961b','1598311490964471810','AddComment','{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}',_binary '{\"type\":\"complete\",\"outcome\":\"提交\",\"comment\":null}');
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_HI_DETAIL` VALUES ('00ad0648-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'nrOfInstances','integer',0,'2022-12-06 10:16:32.975',NULL,NULL,1,'1',NULL),('00ad2d5a-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',0,'2022-12-06 10:16:32.976',NULL,NULL,0,'0',NULL),('00ad2d5c-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'nrOfActiveInstances','integer',0,'2022-12-06 10:16:32.976',NULL,NULL,1,'1',NULL),('00ada28e-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'assigneeItem','string',0,'2022-12-06 10:16:32.979',NULL,NULL,NULL,'1',NULL),('00adf0b0-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'loopCounter','integer',0,'2022-12-06 10:16:32.981',NULL,NULL,0,'0',NULL),('0191e816-750c-11ed-84c9-50ebf6b3961b','VariableUpdate','1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',1,'2022-12-06 10:16:34.475',NULL,NULL,1,'1',NULL),('05df3c96-717d-11ed-97ac-50ebf6b3961b','VariableUpdate','1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'nrOfInstances','integer',0,'2022-12-01 21:35:30.172',NULL,NULL,1,'1',NULL),('05df3c98-717d-11ed-97ac-50ebf6b3961b','VariableUpdate','1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',0,'2022-12-01 21:35:30.172',NULL,NULL,0,'0',NULL),('05df3c9a-717d-11ed-97ac-50ebf6b3961b','VariableUpdate','1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'nrOfActiveInstances','integer',0,'2022-12-01 21:35:30.172',NULL,NULL,1,'1',NULL),('05e026fc-717d-11ed-97ac-50ebf6b3961b','VariableUpdate','1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'assigneeItem','string',0,'2022-12-01 21:35:30.178',NULL,NULL,NULL,'1',NULL),('05e04e0e-717d-11ed-97ac-50ebf6b3961b','VariableUpdate','1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'loopCounter','integer',0,'2022-12-01 21:35:30.179',NULL,NULL,0,'0',NULL),('0d20bad7-7577-11ed-82e6-50ebf6b3961b','VariableUpdate','1600143733563346945','1600143733563346945',NULL,NULL,'creator','string',0,'2022-12-06 23:02:50.016',NULL,NULL,NULL,'1',NULL),('12326e11-6d66-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','1596423795937923073',NULL,NULL,'creator','null',0,'2022-11-26 16:41:07.774',NULL,NULL,NULL,NULL,NULL),('3b0892d3-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfInstances','integer',0,'2022-11-26 16:49:25.783',NULL,NULL,1,'1',NULL),('3b0892d5-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',0,'2022-11-26 16:49:25.783',NULL,NULL,0,'0',NULL),('3b0892d7-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfActiveInstances','integer',0,'2022-11-26 16:49:25.783',NULL,NULL,1,'1',NULL),('4093cb29-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'assigneeItem','string',0,'2022-11-26 16:49:35.084',NULL,NULL,NULL,'2',NULL),('4093f23b-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'loopCounter','integer',0,'2022-11-26 16:49:35.085',NULL,NULL,0,'0',NULL),('67be51c5-717d-11ed-b634-50ebf6b3961b','VariableUpdate','1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',1,'2022-12-01 21:38:14.372',NULL,NULL,1,'1',NULL),('77601013-7175-11ed-92bd-50ebf6b3961b','VariableUpdate','1598296203884044289','1598296203884044289',NULL,NULL,'creator','null',0,'2022-12-01 20:41:24.625',NULL,NULL,NULL,NULL,NULL),('7b11b381-6d67-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',1,'2022-11-26 16:51:13.217',NULL,NULL,1,'1',NULL),('7cffd211-7535-11ed-b3c7-50ebf6b3961b','VariableUpdate','1600025625313964033','1600025625313964033',NULL,NULL,'creator','null',0,'2022-12-06 15:13:30.920',NULL,NULL,NULL,NULL,NULL),('edc94745-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfInstances','integer',0,'2022-11-26 17:30:13.164',NULL,NULL,1,'1',NULL),('edc94747-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',0,'2022-11-26 17:30:13.164',NULL,NULL,0,'0',NULL),('edc94749-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfActiveInstances','integer',0,'2022-11-26 17:30:13.164',NULL,NULL,1,'1',NULL),('edc96e5b-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'assigneeItem','string',0,'2022-11-26 17:30:13.165',NULL,NULL,NULL,'2',NULL),('edc96e5d-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'loopCounter','integer',0,'2022-11-26 17:30:13.165',NULL,NULL,0,'0',NULL),('f31c7fb3-6d6c-11ed-a5b6-50ebf6b3961b','VariableUpdate','1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,'nrOfCompletedInstances','integer',1,'2022-11-26 17:30:22.098',NULL,NULL,1,'1',NULL),('f3ccf689-717d-11ed-a8ac-50ebf6b3961b','VariableUpdate','1598311490964471810','1598311490964471810',NULL,NULL,'creator','null',0,'2022-12-01 21:42:09.350',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('009e1223-750c-11ed-84c9-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 10:16:32.877','1598311490964471810',NULL,NULL,NULL,NULL),('00adf0b3-750c-11ed-84c9-50ebf6b3961b',NULL,'assignee','1','00adf0b2-750c-11ed-84c9-50ebf6b3961b','2022-12-06 10:16:32.981',NULL,NULL,NULL,NULL,NULL),('0187fd05-750c-11ed-84c9-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 10:16:34.410','1598311490964471810',NULL,NULL,NULL,NULL),('05c8ce61-717d-11ed-97ac-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-01 21:35:30.026','1598296203884044289',NULL,NULL,NULL,NULL),('05e07521-717d-11ed-97ac-50ebf6b3961b',NULL,'assignee','1','05e04e10-717d-11ed-97ac-50ebf6b3961b','2022-12-01 21:35:30.180',NULL,NULL,NULL,NULL,NULL),('0d20bad8-7577-11ed-82e6-50ebf6b3961b',NULL,'starter','1',NULL,'2022-12-06 23:02:50.016','1600143733563346945',NULL,NULL,NULL,NULL),('0d2379fe-7577-11ed-82e6-50ebf6b3961b',NULL,'assignee','1','0d21cc4d-7577-11ed-82e6-50ebf6b3961b','2022-12-06 23:02:50.034',NULL,NULL,NULL,NULL,NULL),('0d2379ff-7577-11ed-82e6-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 23:02:50.034','1600143733563346945',NULL,NULL,NULL,NULL),('12357b57-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','12337f86-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:41:07.794',NULL,NULL,NULL,NULL,NULL),('1235a268-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:41:07.795','1596423795937923073',NULL,NULL,NULL,NULL),('1f61376a-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:41:29.891','1596423795937923073',NULL,NULL,NULL,NULL),('1f6d9380-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','1f6b709f-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:41:29.972',NULL,NULL,NULL,NULL,NULL),('2f15a4de-6d67-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:49:05.736','1596423795937923073',NULL,NULL,NULL,NULL),('4094194e-6d67-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','4094194d-6d67-11ed-a5b6-50ebf6b3961b','2022-11-26 16:49:35.086',NULL,NULL,NULL,NULL,NULL),('67b6b0a4-717d-11ed-b634-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-01 21:38:14.323','1598296203884044289',NULL,NULL,NULL,NULL),('6faf8aac-7179-11ed-832f-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-01 21:09:49.712','1598296203884044289',NULL,NULL,NULL,NULL),('6fbe57c2-7179-11ed-832f-50ebf6b3961b',NULL,'assignee','1','6fba8731-7179-11ed-832f-50ebf6b3961b','2022-12-01 21:09:49.808',NULL,NULL,NULL,NULL,NULL),('77634469-7175-11ed-92bd-50ebf6b3961b',NULL,'assignee','1','77612188-7175-11ed-92bd-50ebf6b3961b','2022-12-01 20:41:24.646',NULL,NULL,NULL,NULL,NULL),('77636b7a-7175-11ed-92bd-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-01 20:41:24.647','1598296203884044289',NULL,NULL,NULL,NULL),('7b0b71f0-6d67-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:51:13.176','1596423795937923073',NULL,NULL,NULL,NULL),('7d035487-7535-11ed-b3c7-50ebf6b3961b',NULL,'assignee','1','7d00e386-7535-11ed-b3c7-50ebf6b3961b','2022-12-06 15:13:30.944',NULL,NULL,NULL,NULL,NULL),('7d037b98-7535-11ed-b3c7-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 15:13:30.945','1600025625313964033',NULL,NULL,NULL,NULL),('8a5db786-6d67-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','8a5c7f05-6d67-11ed-a5b6-50ebf6b3961b','2022-11-26 16:51:38.881',NULL,NULL,NULL,NULL,NULL),('a4a22161-7577-11ed-82e6-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 23:07:04.200','1600025625313964033',NULL,NULL,NULL,NULL),('a4ae2f57-7577-11ed-82e6-50ebf6b3961b',NULL,'assignee','1','a4abbe56-7577-11ed-82e6-50ebf6b3961b','2022-12-06 23:07:04.279',NULL,NULL,NULL,NULL,NULL),('abe69322-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:45:25.646','1596423795937923073',NULL,NULL,NULL,NULL),('abef93d6-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','abed70f5-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:45:25.705',NULL,NULL,NULL,NULL,NULL),('b490beb8-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:45:40.183','1596423795937923073',NULL,NULL,NULL,NULL),('b49b1efe-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','b498adfd-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:45:40.251',NULL,NULL,NULL,NULL,NULL),('d9a4a0a0-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:46:42.389','1596423795937923073',NULL,NULL,NULL,NULL),('d9ae64a4-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','d9abf3a3-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:46:42.453',NULL,NULL,NULL,NULL,NULL),('dccfe158-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 17:29:44.686','1596423795937923073',NULL,NULL,NULL,NULL),('dcdb2bfe-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','dcd8e20d-6d6c-11ed-a5b6-50ebf6b3961b','2022-11-26 17:29:44.760',NULL,NULL,NULL,NULL,NULL),('edbf0e10-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 17:30:13.097','1596423795937923073',NULL,NULL,NULL,NULL),('edc96e60-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','edc96e5f-6d6c-11ed-a5b6-50ebf6b3961b','2022-11-26 17:30:13.165',NULL,NULL,NULL,NULL,NULL),('f3166532-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 17:30:22.058','1596423795937923073',NULL,NULL,NULL,NULL),('f3d0a00f-717d-11ed-a8ac-50ebf6b3961b',NULL,'assignee','1','f3ce561e-717d-11ed-a8ac-50ebf6b3961b','2022-12-01 21:42:09.374',NULL,NULL,NULL,NULL,NULL),('f3d0c720-717d-11ed-a8ac-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-01 21:42:09.375','1598311490964471810',NULL,NULL,NULL,NULL),('fb6511c6-6d66-11ed-a5b6-50ebf6b3961b',NULL,'participant','2',NULL,'2022-11-26 16:47:39.015','1596423795937923073',NULL,NULL,NULL,NULL),('fb6e398c-6d66-11ed-a5b6-50ebf6b3961b',NULL,'assignee','2','fb6c16ab-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:47:39.075',NULL,NULL,NULL,NULL,NULL),('ff573a3b-750b-11ed-84c9-50ebf6b3961b',NULL,'participant','1',NULL,'2022-12-06 10:16:30.736','1598311490964471810',NULL,NULL,NULL,NULL),('ff7c2761-750b-11ed-84c9-50ebf6b3961b',NULL,'assignee','1','ff743820-750b-11ed-84c9-50ebf6b3961b','2022-12-06 10:16:30.977',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_HI_PROCINST` VALUES ('1596423795937923073',2,'1596423795937923073','1596423796009226241','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','2022-11-26 16:41:07.773','2022-11-26 17:30:22.274',2954501,NULL,'startEvent_39f7426','Event_0hqfd5v',NULL,NULL,'','ccccccccc',NULL,NULL,NULL,NULL,NULL,NULL),('1598296203884044289',2,'1598296203884044289','1598296203984707586','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','2022-12-01 20:41:24.624','2022-12-01 21:38:14.658',3410034,NULL,'startEvent_39f7426','Event_0hqfd5v',NULL,NULL,'','111',NULL,NULL,NULL,NULL,NULL,NULL),('1598311490964471810',2,'1598311490964471810','1598311491027386369','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','2022-12-01 21:42:09.349','2022-12-06 10:16:34.711',390865362,NULL,'startEvent_39f7426','Event_0hqfd5v',NULL,NULL,'','22',NULL,NULL,NULL,NULL,NULL,NULL),('1600025625313964033',1,'1600025625313964033','1600025625385267201','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','2022-12-06 15:13:30.919',NULL,NULL,NULL,'startEvent_39f7426',NULL,NULL,NULL,'','111',NULL,NULL,NULL,NULL,NULL,NULL),('1600143733563346945',1,'1600143733563346945','1600143733580124162','holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','2022-12-06 23:02:50.015',NULL,NULL,'1','startEvent_39f7426',NULL,NULL,NULL,'','测试',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
INSERT INTO `ACT_HI_TASKINST` VALUES ('00adf0b2-750c-11ed-84c9-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0t23scb','1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'总部审核',NULL,NULL,NULL,'1','2022-12-06 10:16:32.981',NULL,'2022-12-06 10:16:34.427',1446,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 10:16:34.427'),('05e04e10-717d-11ed-97ac-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0t23scb','1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'总部审核',NULL,NULL,NULL,'1','2022-12-01 21:35:30.179',NULL,'2022-12-01 21:38:14.330',164151,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-01 21:38:14.330'),('0d21cc4d-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',NULL,'Activity_1ro616j','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'1','2022-12-06 23:02:50.020',NULL,NULL,NULL,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 23:02:50.034'),('12337f86-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'2','2022-11-26 16:41:07.778',NULL,'2022-11-26 16:41:29.898',22120,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:41:29.898'),('1f6b709f-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'2','2022-11-26 16:41:29.957',NULL,'2022-11-26 16:45:25.651',235694,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:45:25.651'),('4094194d-6d67-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0t23scb','1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'总部审核',NULL,NULL,NULL,'2','2022-11-26 16:49:35.086',NULL,'2022-11-26 16:51:13.182',98096,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:51:13.182'),('6fba8731-7179-11ed-832f-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1a0z8wz','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'主管审核',NULL,NULL,NULL,'1','2022-12-01 21:09:49.782',NULL,'2022-12-01 21:35:30.032',1540250,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-01 21:35:30.032'),('77612188-7175-11ed-92bd-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1598296203884044289','77601014-7175-11ed-92bd-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'1','2022-12-01 20:41:24.629',NULL,'2022-12-01 21:09:49.721',1705092,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-01 21:09:49.721'),('7d00e386-7535-11ed-b3c7-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'1','2022-12-06 15:13:30.924',NULL,'2022-12-06 23:07:04.207',28413283,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 23:07:04.207'),('8a5c7f05-6d67-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'2','2022-11-26 16:51:38.873',NULL,'2022-11-26 17:29:44.694',2285821,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 17:29:44.694'),('a4abbe56-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'1','2022-12-06 23:07:04.263',NULL,NULL,NULL,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 23:07:04.279'),('abed70f5-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'2','2022-11-26 16:45:25.691',NULL,'2022-11-26 16:45:40.191',14500,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:45:40.191'),('b498adfd-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'2','2022-11-26 16:45:40.235',NULL,'2022-11-26 16:46:42.393',62158,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:46:42.393'),('d9abf3a3-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'2','2022-11-26 16:46:42.437',NULL,'2022-11-26 16:47:39.020',56583,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:47:39.020'),('dcd8e20d-6d6c-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1596423795937923073','8a5c7f02-6d67-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'2','2022-11-26 17:29:44.745',NULL,'2022-11-26 17:30:13.104',28359,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 17:30:13.104'),('edc96e5f-6d6c-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0t23scb','1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'总部审核',NULL,NULL,NULL,'2','2022-11-26 17:30:13.165',NULL,'2022-11-26 17:30:22.065',8900,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 17:30:22.065'),('f3ce561e-717d-11ed-a8ac-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_1ro616j','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,NULL,'1','2022-12-01 21:42:09.354',NULL,'2022-12-06 10:16:30.759',390861405,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 10:16:30.759'),('fb6c16ab-6d66-11ed-a5b6-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1596423795937923073','12329522-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'2','2022-11-26 16:47:39.061',NULL,'2022-11-26 16:49:05.743',86682,NULL,50,NULL,'1595071870168547329',NULL,'','2022-11-26 16:49:05.743'),('ff743820-750b-11ed-84c9-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'Activity_0lwiy64','1598311490964471810','f3cd1d9a-717d-11ed-a8ac-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,NULL,'1','2022-12-06 10:16:30.924',NULL,'2022-12-06 10:16:32.887',1963,NULL,50,NULL,'1595071870168547329',NULL,'','2022-12-06 10:16:32.887');
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
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_HI_VARINST` VALUES ('00acdf37-750c-11ed-84c9-50ebf6b3961b',0,'1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,'nrOfInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-06 10:16:32.975','2022-12-06 10:16:32.975'),('00ad2d59-750c-11ed-84c9-50ebf6b3961b',1,'1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,'nrOfCompletedInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-06 10:16:32.976','2022-12-06 10:16:34.489'),('00ad2d5b-750c-11ed-84c9-50ebf6b3961b',0,'1598311490964471810','00a9aae5-750c-11ed-84c9-50ebf6b3961b',NULL,'nrOfActiveInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-06 10:16:32.976','2022-12-06 10:16:32.976'),('00ada28d-750c-11ed-84c9-50ebf6b3961b',0,'1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b',NULL,'assigneeItem','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-12-06 10:16:32.979','2022-12-06 10:16:32.979'),('00adc99f-750c-11ed-84c9-50ebf6b3961b',0,'1598311490964471810','00acdf36-750c-11ed-84c9-50ebf6b3961b',NULL,'loopCounter','integer',NULL,NULL,NULL,NULL,NULL,0,'0',NULL,'2022-12-06 10:16:32.981','2022-12-06 10:16:32.981'),('05df1585-717d-11ed-97ac-50ebf6b3961b',0,'1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,'nrOfInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-01 21:35:30.172','2022-12-01 21:35:30.172'),('05df3c97-717d-11ed-97ac-50ebf6b3961b',1,'1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,'nrOfCompletedInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-01 21:35:30.172','2022-12-01 21:38:14.378'),('05df3c99-717d-11ed-97ac-50ebf6b3961b',0,'1598296203884044289','05d1cf13-717d-11ed-97ac-50ebf6b3961b',NULL,'nrOfActiveInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-12-01 21:35:30.172','2022-12-01 21:35:30.172'),('05e026fb-717d-11ed-97ac-50ebf6b3961b',0,'1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b',NULL,'assigneeItem','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-12-01 21:35:30.178','2022-12-01 21:35:30.178'),('05e026fd-717d-11ed-97ac-50ebf6b3961b',0,'1598296203884044289','05df1584-717d-11ed-97ac-50ebf6b3961b',NULL,'loopCounter','integer',NULL,NULL,NULL,NULL,NULL,0,'0',NULL,'2022-12-01 21:35:30.178','2022-12-01 21:35:30.178'),('0d2093c6-7577-11ed-82e6-50ebf6b3961b',0,'1600143733563346945','1600143733563346945',NULL,'creator','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-12-06 23:02:50.016','2022-12-06 23:02:50.016'),('12324700-6d66-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','1596423795937923073',NULL,'creator','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-26 16:41:07.774','2022-11-26 16:41:07.774'),('3b0892d2-6d67-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,'nrOfInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 16:49:25.783','2022-11-26 16:49:25.783'),('3b0892d4-6d67-11ed-a5b6-50ebf6b3961b',1,'1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,'nrOfCompletedInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 16:49:25.783','2022-11-26 16:51:13.226'),('3b0892d6-6d67-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','2f1c82b0-6d67-11ed-a5b6-50ebf6b3961b',NULL,'nrOfActiveInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 16:49:25.783','2022-11-26 16:49:25.783'),('4093cb28-6d67-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b',NULL,'assigneeItem','string',NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,'2022-11-26 16:49:35.084','2022-11-26 16:49:35.084'),('4093f23a-6d67-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','3b086bc1-6d67-11ed-a5b6-50ebf6b3961b',NULL,'loopCounter','integer',NULL,NULL,NULL,NULL,NULL,0,'0',NULL,'2022-11-26 16:49:35.085','2022-11-26 16:49:35.085'),('775fe902-7175-11ed-92bd-50ebf6b3961b',0,'1598296203884044289','1598296203884044289',NULL,'creator','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 20:41:24.625','2022-12-01 20:41:24.625'),('7cff83f0-7535-11ed-b3c7-50ebf6b3961b',0,'1600025625313964033','1600025625313964033',NULL,'creator','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-06 15:13:30.920','2022-12-06 15:13:30.920'),('edc94744-6d6c-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'nrOfInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 17:30:13.164','2022-11-26 17:30:13.164'),('edc94746-6d6c-11ed-a5b6-50ebf6b3961b',1,'1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'nrOfCompletedInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 17:30:13.164','2022-11-26 17:30:22.105'),('edc94748-6d6c-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','edc6d642-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'nrOfActiveInstances','integer',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2022-11-26 17:30:13.164','2022-11-26 17:30:13.164'),('edc96e5a-6d6c-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'assigneeItem','string',NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,'2022-11-26 17:30:13.165','2022-11-26 17:30:13.165'),('edc96e5c-6d6c-11ed-a5b6-50ebf6b3961b',0,'1596423795937923073','edc92033-6d6c-11ed-a5b6-50ebf6b3961b',NULL,'loopCounter','integer',NULL,NULL,NULL,NULL,NULL,0,'0',NULL,'2022-11-26 17:30:13.165','2022-11-26 17:30:13.165'),('f3cccf78-717d-11ed-a8ac-50ebf6b3961b',0,'1598311490964471810','1598311490964471810',NULL,'creator','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 21:42:09.350','2022-12-01 21:42:09.350');
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('023394cd-6d66-11ed-a5b6-50ebf6b3961b','请假流程',NULL,'holiday','','2022-11-26 08:40:40.938',NULL,NULL,'023394cd-6d66-11ed-a5b6-50ebf6b3961b',NULL),('285ea4a1-7539-11ed-90fe-50ebf6b3961b','请假流程',NULL,'holiday','','2022-12-06 07:39:46.923',NULL,NULL,'285ea4a1-7539-11ed-90fe-50ebf6b3961b',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_RE_PROCDEF` VALUES ('holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',1,'http://www.flowable.org/processdef','请假流程','holiday',1,'023394cd-6d66-11ed-a5b6-50ebf6b3961b','holiday.bpmn20.xml',NULL,NULL,1,1,1,'',NULL,NULL,NULL,0),('holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',1,'http://www.flowable.org/processdef','请假流程','holiday',2,'285ea4a1-7539-11ed-90fe-50ebf6b3961b','holiday.bpmn20.xml',NULL,NULL,1,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ACTINST`
--

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
INSERT INTO `ACT_RU_ACTINST` VALUES ('0d20e1ea-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-06 23:02:50.017','2022-12-06 23:02:50.019',2,1,NULL,''),('0d21300b-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-06 23:02:50.019','2022-12-06 23:02:50.019',0,2,NULL,''),('0d21300c-7577-11ed-82e6-50ebf6b3961b',1,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b','1600143733563346945','0d20e1e9-7577-11ed-82e6-50ebf6b3961b','Activity_1ro616j','0d21cc4d-7577-11ed-82e6-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-06 23:02:50.019',NULL,NULL,3,NULL,''),('7cffd213-7535-11ed-b3c7-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','startEvent_39f7426',NULL,NULL,'开始','startEvent',NULL,'2022-12-06 15:13:30.921','2022-12-06 15:13:30.923',2,1,NULL,''),('7d004744-7535-11ed-b3c7-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_002ih2x',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-12-06 15:13:30.924','2022-12-06 15:13:30.924',0,2,NULL,''),('7d004745-7535-11ed-b3c7-50ebf6b3961b',2,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Activity_1ro616j','7d00e386-7535-11ed-b3c7-50ebf6b3961b',NULL,'发起人','userTask','1','2022-12-06 15:13:30.924','2022-12-06 23:07:04.224',28413300,3,NULL,''),('a4a92642-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_1is270g',NULL,NULL,'提交','sequenceFlow',NULL,'2022-12-06 23:07:04.246','2022-12-06 23:07:04.246',0,1,NULL,''),('a4aa5ec3-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Gateway_0qjovut',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-12-06 23:07:04.254','2022-12-06 23:07:04.256',2,2,NULL,''),('a4aaace4-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Flow_0xoo0rv',NULL,NULL,'请假天数<=10','sequenceFlow',NULL,'2022-12-06 23:07:04.256','2022-12-06 23:07:04.256',0,3,NULL,''),('a4ab9745-7577-11ed-82e6-50ebf6b3961b',1,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b','1600025625313964033','7cffd212-7535-11ed-b3c7-50ebf6b3961b','Activity_0lwiy64','a4abbe56-7577-11ed-82e6-50ebf6b3961b',NULL,'HR审核','userTask','1','2022-12-06 23:07:04.262',NULL,NULL,4,NULL,'');
/*!40000 ALTER TABLE `ACT_RU_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_DEADLETTER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_RU_EXECUTION` VALUES ('0d20e1e9-7577-11ed-82e6-50ebf6b3961b',1,'1600143733563346945',NULL,'1600143733563346945','holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',NULL,'1600143733563346945','Activity_1ro616j',1,0,0,0,0,1,NULL,'',NULL,NULL,'2022-12-06 23:02:50.017',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('1600025625313964033',1,'1600025625313964033','1600025625385267201',NULL,'holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'1600025625313964033',NULL,1,0,1,0,0,1,NULL,'','111','startEvent_39f7426','2022-12-06 15:13:30.919',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('1600143733563346945',1,'1600143733563346945','1600143733580124162',NULL,'holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',NULL,'1600143733563346945',NULL,1,0,1,0,0,1,NULL,'','测试','startEvent_39f7426','2022-12-06 23:02:50.015','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('7cffd212-7535-11ed-b3c7-50ebf6b3961b',2,'1600025625313964033',NULL,'1600025625313964033','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,'1600025625313964033','Activity_0lwiy64',1,0,0,0,0,1,NULL,'',NULL,NULL,'2022-12-06 15:13:30.921',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXTERNAL_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('0d20bad8-7577-11ed-82e6-50ebf6b3961b',1,NULL,'starter','1',NULL,'1600143733563346945',NULL,NULL,NULL,NULL,NULL),('0d2379ff-7577-11ed-82e6-50ebf6b3961b',1,NULL,'participant','1',NULL,'1600143733563346945',NULL,NULL,NULL,NULL,NULL),('7d037b98-7535-11ed-b3c7-50ebf6b3961b',1,NULL,'participant','1',NULL,'1600025625313964033',NULL,NULL,NULL,NULL,NULL),('a4a22161-7577-11ed-82e6-50ebf6b3961b',1,NULL,'participant','1',NULL,'1600025625313964033',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_RU_TASK` VALUES ('0d21cc4d-7577-11ed-82e6-50ebf6b3961b',1,'0d20e1e9-7577-11ed-82e6-50ebf6b3961b','1600143733563346945','holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,'发起人',NULL,NULL,'Activity_1ro616j',NULL,'1',NULL,50,'2022-12-06 15:02:50.020',NULL,NULL,1,'','1595071870168547329',NULL,1,0,0,0),('a4abbe56-7577-11ed-82e6-50ebf6b3961b',1,'7cffd212-7535-11ed-b3c7-50ebf6b3961b','1600025625313964033','holiday:1:023f2d8f-6d66-11ed-a5b6-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,'HR审核',NULL,NULL,'Activity_0lwiy64',NULL,'1',NULL,50,'2022-12-06 15:07:04.263',NULL,NULL,1,'','1595071870168547329',NULL,1,0,0,0);
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TIMER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `ACT_RU_VARIABLE` VALUES ('0d2093c6-7577-11ed-82e6-50ebf6b3961b',1,'string','creator','1600143733563346945','1600143733563346945',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL),('7cff83f0-7535-11ed-b3c7-50ebf6b3961b',1,'null','creator','1600025625313964033','1600025625313964033',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLW_CHANNEL_DEFINITION`
--

DROP TABLE IF EXISTS `FLW_CHANNEL_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FLW_CHANNEL_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLW_EV_DATABASECHANGELOG`
--

LOCK TABLES `FLW_EV_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `FLW_EV_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-11-26 16:40:23',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.9.1',NULL,NULL,'9452023288'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-11-26 16:40:23',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.9.1',NULL,NULL,'9452023288'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-11-26 16:40:23',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.9.1',NULL,NULL,'9452023288');
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
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('quartzScheduler','STATE_ACCESS'),('quartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('quartzScheduler','Lyp1670387567115',1670570195689,5000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_product_line`
--

DROP TABLE IF EXISTS `me_product_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_product_line` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `from_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '来源类型',
  `from_id` bigint unsigned DEFAULT NULL COMMENT '来源ID',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cost_center` bigint unsigned DEFAULT NULL COMMENT 'cost_center',
  `cost_center_multiple` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'cost_center_multiple',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='产品线信息维护实体';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_product_line`
--

LOCK TABLES `me_product_line` WRITE;
/*!40000 ALTER TABLE `me_product_line` DISABLE KEYS */;
INSERT INTO `me_product_line` VALUES (1,'test','USER',NULL,1,'2022-11-22 19:06:34',1,'2022-10-29 23:42:24',1587088508426416129,'1584347991602769921,1584348027585703938'),(2,'test2','USER',NULL,1,'2022-11-22 19:06:59',2,'2022-10-29 23:42:43',1587088520011083778,'1584347991602769921,1584348027585703938'),(3,'test3','USER',NULL,1,'2022-11-22 19:07:10',3,'2022-10-29 05:10:55',1587088520011083778,'1583822690246844417,1583824814787584001,1587088508426416129,1587088520011083778'),(4,'test4','USER',NULL,1,'2022-11-22 19:07:17',4,'2022-10-29 12:55:44',1583826162119663617,'1584347991602769921,1584348027585703938,1583822690246844417'),(1590561827884687362,'1111','USER',NULL,1,'2022-11-22 19:06:14',1,'2022-11-10 12:27:46',1583822690246844417,'1584347991602769921,1584348027585703938,1587088498225868802'),(1590562947940016129,'22222','USER',NULL,1,'2022-11-22 19:06:26',1,'2022-11-10 12:32:13',1583822690246844417,'1584347991602769921,1584348027585703938'),(1590563064814297090,'333','USER',NULL,1,'2022-11-22 19:06:47',1,'2022-11-10 12:32:41',1584347991602769921,'1584347991602769921,1584348027585703938'),(1590715254166036481,'101100111','USER',NULL,1,'2022-11-22 19:06:05',1,'2022-11-10 22:37:25',1583824814787584001,'1584347991602769921,1584348027585703938,1583822690246844417'),(1594903927166140418,'1111111111111111111111111111111111111111111111111111111111','USER',NULL,1,'2022-11-22 19:05:59',1,'2022-11-22 12:01:43',1583824814787584001,'1584347991602769921,1584348027585703938,1583822690246844417'),(1595009783006257154,'222222222222222222222222222222222','USER',NULL,1,'2022-11-22 19:04:59',1,'2022-11-22 19:02:21',1583824814787584001,'1584347991602769921,1584348027585703938,1583822690246844417');
/*!40000 ALTER TABLE `me_product_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_product_line_ref`
--

DROP TABLE IF EXISTS `me_product_line_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_product_line_ref` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `instance_id` bigint unsigned NOT NULL,
  `field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名',
  `value` bigint unsigned NOT NULL COMMENT '值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `me_product_line_ref_pk` (`instance_id`,`field`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字段引用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_product_line_ref`
--

LOCK TABLES `me_product_line_ref` WRITE;
/*!40000 ALTER TABLE `me_product_line_ref` DISABLE KEYS */;
INSERT INTO `me_product_line_ref` VALUES (1595010843527626753,1,'cost_center_multiple',1584347991602769921),(1595010843527626754,1,'cost_center_multiple',1584348027585703938),(1595010951619035137,2,'cost_center_multiple',1584347991602769921),(1595010951619035138,2,'cost_center_multiple',1584348027585703938),(1595010996355481602,3,'cost_center_multiple',1583822690246844417),(1595010996355481603,3,'cost_center_multiple',1583824814787584001),(1595010996355481604,3,'cost_center_multiple',1587088508426416129),(1595010996355481605,3,'cost_center_multiple',1587088520011083778),(1595011024650256388,4,'cost_center_multiple',1583822690246844417),(1595011024650256386,4,'cost_center_multiple',1584347991602769921),(1595011024650256387,4,'cost_center_multiple',1584348027585703938),(1595010760413298689,1590561827884687362,'cost_center_multiple',1584347991602769921),(1595010760413298690,1590561827884687362,'cost_center_multiple',1584348027585703938),(1595010760413298691,1590561827884687362,'cost_center_multiple',1587088498225868802),(1595010812359753729,1590562947940016129,'cost_center_multiple',1584347991602769921),(1595010812359753730,1590562947940016129,'cost_center_multiple',1584348027585703938),(1595010900268171265,1590563064814297090,'cost_center_multiple',1584347991602769921),(1595010900268171266,1590563064814297090,'cost_center_multiple',1584348027585703938),(1595010725076287492,1590715254166036481,'cost_center_multiple',1583822690246844417),(1595010725076287490,1590715254166036481,'cost_center_multiple',1584347991602769921),(1595010725076287491,1590715254166036481,'cost_center_multiple',1584348027585703938),(1595010697842671620,1594903927166140418,'cost_center_multiple',1583822690246844417),(1595010697842671618,1594903927166140418,'cost_center_multiple',1584347991602769921),(1595010697842671619,1594903927166140418,'cost_center_multiple',1584348027585703938),(1595010478019198980,1595009783006257154,'cost_center_multiple',1583822690246844417),(1595010478019198978,1595009783006257154,'cost_center_multiple',1584347991602769921),(1595010478019198979,1595009783006257154,'cost_center_multiple',1584348027585703938);
/*!40000 ALTER TABLE `me_product_line_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_entity_def`
--

DROP TABLE IF EXISTS `modeling_entity_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_entity_def` (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务实体名称',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '实体说明',
  `status` tinyint NOT NULL COMMENT '状态',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='实体定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_entity_def`
--

LOCK TABLES `modeling_entity_def` WRITE;
/*!40000 ALTER TABLE `modeling_entity_def` DISABLE KEYS */;
INSERT INTO `modeling_entity_def` VALUES (1585918511255719937,'product_line','产品线信息','产品线信息维护实体12',0,1,'2022-11-20 16:03:21',1,'2022-10-28 16:56:53');
/*!40000 ALTER TABLE `modeling_entity_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_entity_page`
--

DROP TABLE IF EXISTS `modeling_entity_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_entity_page` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实体标识',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '页面类型(ADD/EDIT)',
  `scheme` json DEFAULT NULL COMMENT '页面定义',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='业务实体页面配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_entity_page`
--

LOCK TABLES `modeling_entity_page` WRITE;
/*!40000 ALTER TABLE `modeling_entity_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `modeling_entity_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_field_def`
--

DROP TABLE IF EXISTS `modeling_field_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_field_def` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据库字段/表单字段',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名/表单字段名',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段说明',
  `width` int NOT NULL DEFAULT '0' COMMENT '字段宽度',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段组件类型',
  `scheme` json NOT NULL COMMENT '字段定义',
  `scope` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段范围',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `modeling_field_def_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_field_def`
--

LOCK TABLES `modeling_field_def` WRITE;
/*!40000 ALTER TABLE `modeling_field_def` DISABLE KEYS */;
INSERT INTO `modeling_field_def` VALUES (1583622160878735361,'id','编号','主键',8,'number','{\"type\": \"number\", \"precision\": 0}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-22 08:52:00'),(1584160647990243329,'process_instance_id','流程实例ID','流程引擎实例ID',36,'text','{\"type\": \"text\", \"defaultValue\": null}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 20:32:04'),(1584161060399378434,'code','流水号','流程唯一编号',32,'text','{\"type\": \"text\", \"defaultValue\": null}','WORKFLOW_DEFAULT',1,'2022-11-22 21:57:54',1,'2022-10-23 20:33:24'),(1584161141097787394,'name','标题','流程标题',128,'text','{\"type\": \"text\", \"defaultValue\": null}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 20:33:43'),(1584161976175300609,'dept_id','所属部门','',32,'dept','{\"type\": \"dept\", \"multiple\": false}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 20:37:02'),(1584181666134118402,'create_by','创建人','发起流程的人',16,'user','{\"type\": \"user\", \"multiple\": false}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 21:55:17'),(1584181794765033473,'create_time','创建时间','发起流程的时间',16,'date','{\"type\": \"date\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\", \"defaultValue\": \"\"}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 21:55:47'),(1584182223049609217,'update_by','更新人','更新数据的人',16,'user','{\"type\": \"user\", \"multiple\": false}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 21:57:29'),(1584182320063860737,'update_time','更新时间','最后更新流程数据的时间',16,'date','{\"type\": \"date\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\", \"defaultValue\": \"\"}','WORKFLOW_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-23 21:57:52'),(1584339977915265025,'cost_center','成本中心','成本中心下拉单选字段',16,'option','{\"type\": \"option\", \"multiple\": false, \"optionTypeId\": \"1583739849538342914\", \"optionComponent\": \"single-select\", \"optionDefaultValue\": [\"1583824814787584001\"]}','GLOBAL',1,'2022-11-21 16:00:21',1,'2022-10-24 08:24:21'),(1585589188166483969,'id','主键ID','主键',8,'number','{\"type\": \"number\", \"precision\": 0}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:08:16'),(1585589346233024513,'name','名称','标题',64,'text','{\"type\": \"text\"}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:08:54'),(1585589426855936002,'from_type','来源类型','流程、实体key',16,'text','{\"type\": \"text\"}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-28 13:33:48'),(1585590177913176065,'from_id','来源ID','来源实体、流程ID',8,'number','{\"type\": \"number\", \"precision\": 0}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-28 13:36:57'),(1585590278232539138,'update_by','更新人','最后更新的用户',8,'user','{\"type\": \"user\", \"multiple\": false}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:09:13'),(1585590372281417730,'update_time','更新时间','最后更新时间',8,'date','{\"type\": \"date\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\", \"defaultValue\": \"\"}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:12:12'),(1585867406723325954,'create_by','创建人','创建此单据的用户',8,'user','{\"type\": \"user\", \"multiple\": false}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:12:36'),(1585868195659325441,'create_time','创建时间','创建此单据的时间',16,'date','{\"type\": \"date\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\", \"defaultValue\": \"\"}','ENTITY_DEFAULT',1,'2022-11-20 21:39:36',1,'2022-10-27 19:12:58'),(1589631844999802881,'cost_center_multiple','多选成本中心','多选成本中心',16,'option','{\"type\": \"option\", \"multiple\": true, \"optionTypeId\": \"1583739849538342914\", \"optionComponent\": \"multi-select\", \"optionDefaultValue\": [\"1584347991602769921\", \"1584348027585703938\"]}','GLOBAL',1,'2022-11-21 16:00:22',1,'2022-11-07 22:52:20'),(1593973328016416770,'days','天数','请假天数',8,'number','{\"type\": \"number\", \"precision\": 0, \"defaultValue\": 1}','WORKFLOW_PRIVATE',1,'2022-11-21 16:00:21',1,'2022-11-19 22:23:51'),(1593973507327107074,'leader','主管','上级主管',32,'user','{\"type\": \"user\", \"multiple\": false}','WORKFLOW_PRIVATE',1,'2022-11-20 21:39:36',1,'2022-11-19 22:24:33'),(1593973643990114305,'hr','HR专员','HR考勤专员',8,'user','{\"type\": \"user\", \"multiple\": false}','WORKFLOW_PRIVATE',1,'2022-11-20 21:39:36',1,'2022-11-19 22:25:06'),(1593974114628771842,'headquarters','总部领导','总部领导会签',128,'user','{\"type\": \"user\", \"multiple\": true}','WORKFLOW_PRIVATE',1,'2022-11-20 21:39:36',1,'2022-11-19 22:26:58');
/*!40000 ALTER TABLE `modeling_field_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_field_ref`
--

DROP TABLE IF EXISTS `modeling_field_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_field_ref` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `module` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模块',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模型标识',
  `field_id` bigint unsigned NOT NULL COMMENT '字段ID',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `key_unidx` (`module`,`mkey`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段引用关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_field_ref`
--

LOCK TABLES `modeling_field_ref` WRITE;
/*!40000 ALTER TABLE `modeling_field_ref` DISABLE KEYS */;
INSERT INTO `modeling_field_ref` VALUES (1586740378090631170,'ENTITY','product_line',1584339977915265025,1,'2022-10-30 23:22:41'),(1589242316271177729,'WORKFLOW','holiday',1584339977915265025,1,'2022-11-06 21:04:30'),(1589631884409483265,'ENTITY','product_line',1589631844999802881,1,'2022-11-07 22:52:30'),(1593973328117080066,'WORKFLOW','holiday',1593973328016416770,1,'2022-11-19 22:23:51'),(1593973507327107075,'WORKFLOW','holiday',1593973507327107074,1,'2022-11-19 22:24:33'),(1593973644057223169,'WORKFLOW','holiday',1593973643990114305,1,'2022-11-19 22:25:06'),(1593974114628771843,'WORKFLOW','holiday',1593974114628771842,1,'2022-11-19 22:26:58');
/*!40000 ALTER TABLE `modeling_field_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_option_type`
--

DROP TABLE IF EXISTS `modeling_option_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_option_type` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '信息名称',
  `scope` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '信息范围',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '私有所属模型标识',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='工作流选项类型定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_option_type`
--

LOCK TABLES `modeling_option_type` WRITE;
/*!40000 ALTER TABLE `modeling_option_type` DISABLE KEYS */;
INSERT INTO `modeling_option_type` VALUES (1583739849538342914,'测试树数据源','GLOBAL',NULL,'测试',1,'2022-10-22 22:18:01',1,'2022-10-22 22:18:01'),(1585922292546605057,'测试数据源1','ENTITY_PRIVATE','product_line','1111111111111111',1,'2022-10-28 17:11:54',1,'2022-10-28 17:11:54');
/*!40000 ALTER TABLE `modeling_option_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_option_value`
--

DROP TABLE IF EXISTS `modeling_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_option_value` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `type_id` bigint unsigned NOT NULL COMMENT '信息源ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '选项值名称',
  `pid` bigint DEFAULT NULL COMMENT '选项父级',
  `order_no` int DEFAULT NULL COMMENT '排序号',
  `disabled` tinyint NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程选项值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_option_value`
--

LOCK TABLES `modeling_option_value` WRITE;
/*!40000 ALTER TABLE `modeling_option_value` DISABLE KEYS */;
INSERT INTO `modeling_option_value` VALUES (1583820377780162561,1583739849538342914,'测试',NULL,1,0,1,'2022-10-22 22:07:58',1,'2022-10-22 22:07:58'),(1583822690246844417,1583739849538342914,'测试1',1583820377780162561,1,0,1,'2022-10-22 22:17:24',1,'2022-10-22 22:17:24'),(1583824814787584001,1583739849538342914,'测试2',1583820377780162561,2,0,1,'2022-10-22 22:17:28',1,'2022-10-22 22:17:28'),(1583826135649411074,1583739849538342914,'测试21',1583824814787584001,1,0,1,'2022-10-24 09:19:55',1,'2022-10-24 09:19:54'),(1583826162119663617,1583739849538342914,'测试211',1583826135649411074,1,0,1,'2022-10-22 22:22:37',1,'2022-10-22 22:22:37'),(1584347991602769921,1583739849538342914,'测试22',1583824814787584001,2,0,1,'2022-10-24 08:56:12',1,'2022-10-24 08:56:12'),(1584348027585703938,1583739849538342914,'测试23',1583824814787584001,3,0,1,'2022-10-24 08:56:20',1,'2022-10-24 08:56:20'),(1585922381004476418,1585922292546605057,'T1',NULL,1,0,1,'2022-10-28 17:12:15',1,'2022-10-28 17:12:15'),(1585922422700052481,1585922292546605057,'T2',NULL,2,0,1,'2022-10-28 17:12:25',1,'2022-10-28 17:12:25'),(1585922447207370754,1585922292546605057,'T3',NULL,3,0,1,'2022-10-28 17:12:31',1,'2022-10-28 17:12:31'),(1585922472754876418,1585922292546605057,'T4',1585922447207370754,1,0,1,'2022-10-28 17:12:37',1,'2022-10-28 17:12:37'),(1587088498225868802,1583739849538342914,'测试24',1583824814787584001,4,0,1,'2022-10-31 22:25:59',1,'2022-10-31 22:25:59'),(1587088508426416129,1583739849538342914,'测试25',1583824814787584001,5,0,1,'2022-10-31 22:26:02',1,'2022-10-31 22:26:02'),(1587088520011083778,1583739849538342914,'测试26',1583824814787584001,6,0,1,'2022-10-31 22:26:05',1,'2022-10-31 22:26:05'),(1589237578645434370,1585922292546605057,'11111',1585922472754876418,1,0,1,'2022-11-06 20:45:40',1,'2022-11-06 20:45:40'),(1589237611402948610,1585922292546605057,'2222',1585922472754876418,2,0,1,'2022-11-06 20:45:48',1,'2022-11-06 20:45:48'),(1589237628423434242,1585922292546605057,'3333',1585922472754876418,3,0,1,'2022-11-06 20:45:52',1,'2022-11-06 20:45:52'),(1589237646328918018,1585922292546605057,'4444',1585922472754876418,4,0,1,'2022-11-06 20:45:56',1,'2022-11-06 20:45:56');
/*!40000 ALTER TABLE `modeling_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_page`
--

DROP TABLE IF EXISTS `modeling_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_page` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `module` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模块',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模型标识',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '页面名称',
  `page_scheme` json NOT NULL COMMENT '页面定义',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_uidx` (`module`,`mkey`,`name`) COMMENT '唯一标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='建模页面绑定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_page`
--

LOCK TABLES `modeling_page` WRITE;
/*!40000 ALTER TABLE `modeling_page` DISABLE KEYS */;
INSERT INTO `modeling_page` VALUES (1594501486041550849,'ENTITY','product_line','VIEW','{\"mode\": \"read\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"id\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"number-input\", \"formItemAttrs\": {\"label\": \"主键ID\"}}, {\"id\": \"name\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"名称\"}}, {\"id\": \"from_type\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"来源类型\"}}, {\"id\": \"from_id\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"number-input\", \"formItemAttrs\": {\"label\": \"来源ID\"}}, {\"id\": \"update_by\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"更新人\"}}, {\"id\": \"update_time\", \"attrs\": {\"style\": \"width: 100%\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\"}, \"category\": \"form-item\", \"component\": \"date-picker\", \"formItemAttrs\": {\"label\": \"更新时间\"}}, {\"id\": \"create_by\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"创建人\"}}, {\"id\": \"create_time\", \"attrs\": {\"style\": \"width: 100%\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\"}, \"category\": \"form-item\", \"component\": \"date-picker\", \"formItemAttrs\": {\"label\": \"创建时间\"}}, {\"id\": \"cost_center\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": \"1583824814787584001\", \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"single-select\", \"formItemAttrs\": {\"label\": \"成本中心\"}}, {\"id\": \"cost_center_multiple\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": [\"1584347991602769921\", \"1584348027585703938\"], \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"multi-select\", \"formItemAttrs\": {\"label\": \"多选成本中心\"}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-24 09:51:57',1,'2022-11-21 09:22:33'),(1594501534712254465,'ENTITY','product_line','ADD','{\"mode\": \"edit\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"name\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"名称\", \"required\": true}}, {\"id\": \"cost_center\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": \"1583824814787584001\", \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"single-select\", \"formItemAttrs\": {\"label\": \"成本中心\", \"required\": true}}, {\"id\": \"cost_center_multiple\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": [\"1584347991602769921\", \"1584348027585703938\"], \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"multi-select\", \"formItemAttrs\": {\"label\": \"多选成本中心\", \"required\": true}}, {\"id\": \"from_type\", \"attrs\": {\"mode\": \"read\", \"style\": \"width: 100%\", \"defaultValue\": \"USER\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"来源类型\"}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-24 09:52:04',1,'2022-11-21 09:22:45'),(1594501608162906113,'ENTITY','product_line','UPDATE','{\"mode\": \"edit\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"name\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"名称\", \"required\": true}}, {\"id\": \"cost_center\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": \"1583824814787584001\", \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"single-select\", \"formItemAttrs\": {\"label\": \"成本中心\", \"required\": true}}, {\"id\": \"cost_center_multiple\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": [\"1584347991602769921\", \"1584348027585703938\"], \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"multi-select\", \"formItemAttrs\": {\"label\": \"多选成本中心\", \"required\": true}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-24 09:52:09',1,'2022-11-21 09:23:02'),(1595071632762552322,'WORKFLOW','holiday','启动界面','{\"mode\": \"edit\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"name\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"标题\", \"required\": true}}, {\"id\": \"dept_id\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"dept-select\", \"formItemAttrs\": {\"label\": \"所属部门\", \"required\": true}}, {\"id\": \"days\", \"attrs\": {\"style\": \"width: 100%\", \"defaultValue\": 1}, \"category\": \"form-item\", \"component\": \"number-input\", \"formItemAttrs\": {\"label\": \"天数\", \"required\": true}}, {\"id\": \"leader\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"主管\", \"required\": true}}, {\"id\": \"hr\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"HR专员\", \"required\": true}}, {\"id\": \"headquarters\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": true}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"总部领导\", \"required\": true}}, {\"id\": \"cost_center\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": \"1583824814787584001\", \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"single-select\", \"formItemAttrs\": {\"label\": \"成本中心\", \"required\": true}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-26 13:49:59',1,'2022-11-22 23:08:07'),(1595071870168547329,'WORKFLOW','holiday','基本查看界面','{\"mode\": \"read\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"code\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"流水号\"}}, {\"id\": \"name\", \"attrs\": {\"style\": \"width: 100%\"}, \"category\": \"form-item\", \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"标题\"}}, {\"id\": \"dept_id\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"dept-select\", \"formItemAttrs\": {\"label\": \"所属部门\"}}, {\"id\": \"days\", \"attrs\": {\"style\": \"width: 100%\", \"defaultValue\": 1}, \"category\": \"form-item\", \"component\": \"number-input\", \"formItemAttrs\": {\"label\": \"天数\"}}, {\"id\": \"leader\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"主管\"}}, {\"id\": \"headquarters\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": true}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"总部领导\"}}, {\"id\": \"hr\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"HR专员\"}}, {\"id\": \"cost_center\", \"attrs\": {\"style\": \"width: 100%\", \"expand\": false, \"options\": [], \"clearable\": true, \"filterable\": true, \"buttonOption\": false, \"defaultValue\": \"1583824814787584001\", \"optionTypeId\": \"1583739849538342914\", \"fitInputWidth\": true, \"renderAfterExpand\": false}, \"category\": \"form-item\", \"component\": \"single-select\", \"formItemAttrs\": {\"label\": \"成本中心\"}}, {\"id\": \"create_by\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"创建人\"}}, {\"id\": \"create_time\", \"attrs\": {\"style\": \"width: 100%\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\"}, \"category\": \"form-item\", \"component\": \"date-picker\", \"formItemAttrs\": {\"label\": \"创建时间\"}}, {\"id\": \"update_by\", \"attrs\": {\"style\": \"width: 100%\", \"multiple\": false}, \"category\": \"form-item\", \"component\": \"user-select\", \"formItemAttrs\": {\"label\": \"更新人\"}}, {\"id\": \"update_time\", \"attrs\": {\"style\": \"width: 100%\", \"format\": \"YYYY-MM-DD HH:mm:ss\", \"dateType\": \"datetime\", \"valueFormat\": \"YYYY-MM-DD HH:mm:ss\"}, \"category\": \"form-item\", \"component\": \"date-picker\", \"formItemAttrs\": {\"label\": \"更新时间\"}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-24 23:36:23',1,'2022-11-22 23:09:04'),(1596194297262936066,'WORKFLOW','holiday','驳回页面','{\"mode\": \"edit\", \"size\": \"default\", \"style\": \"\", \"children\": [{\"id\": \"comment\", \"attrs\": {\"rows\": 2, \"type\": \"textarea\", \"style\": \"width: 100%\", \"resize\": \"vertical\", \"autofocus\": false, \"clearable\": false, \"autoresize\": true, \"placeholder\": \"输入驳回原因\", \"showWordLimit\": false, \"validateEvent\": false}, \"category\": \"form-item\", \"children\": [], \"component\": \"text-input\", \"formItemAttrs\": {\"label\": \"驳回原因\", \"required\": true}}], \"labelWidth\": \"120px\", \"labelPosition\": \"auto\"}',1,'2022-11-26 02:12:43',1,'2022-11-26 01:29:11');
/*!40000 ALTER TABLE `modeling_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_permission`
--

DROP TABLE IF EXISTS `modeling_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_permission` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `module` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模块',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标识',
  `flags` int NOT NULL COMMENT '权限组合标志位',
  `content` json NOT NULL COMMENT '权限表达式内容',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `perm_unidx` (`role_id`,`module`,`mkey`),
  KEY `modeling_permission_module_mkey_index` (`module`,`mkey`),
  KEY `modeling_permission_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_permission`
--

LOCK TABLES `modeling_permission` WRITE;
/*!40000 ALTER TABLE `modeling_permission` DISABLE KEYS */;
INSERT INTO `modeling_permission` VALUES (1589271441010688002,1,'ENTITY','product_line',1,'[{\"type\": \"BLOCK\", \"content\": {\"field\": \"cost_center\", \"value\": {\"type\": \"option\", \"optionValueIdList\": [\"1583820377780162561\", \"1583822690246844417\", \"1583824814787584001\", \"1583826135649411074\"]}, \"operator\": \"EQ\"}}, {\"type\": \"OR\", \"content\": null}, {\"type\": \"BLOCK\", \"content\": {\"field\": \"update_by\", \"value\": {\"type\": \"user\", \"deptId\": \"7\", \"cascader\": true, \"userIdList\": [\"SELF\", \"SELF_DPT\", \"CHILD_DPT\", \"2\", \"3\"]}, \"operator\": \"EQ\"}}]',1,'2022-11-26 22:55:46',1,'2022-11-06 23:00:13');
/*!40000 ALTER TABLE `modeling_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_view`
--

DROP TABLE IF EXISTS `modeling_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_view` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `module` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务实体/工作流',
  `mkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模型标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `collation` json DEFAULT NULL COMMENT '排序规则',
  `sn` int NOT NULL COMMENT '排序号',
  `status` tinyint NOT NULL COMMENT '状态',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `view_name_unidx` (`module`,`mkey`,`name`) COMMENT '视图名称不可重复'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型列表视图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_view`
--

LOCK TABLES `modeling_view` WRITE;
/*!40000 ALTER TABLE `modeling_view` DISABLE KEYS */;
INSERT INTO `modeling_view` VALUES (1594323506409889794,'ENTITY','product_line','基本视图','[{\"id\": 0, \"field\": \"update_time\", \"order\": \"desc\"}]',1,1,1,'2022-11-21 15:59:43',1,'2022-11-20 21:35:20'),(1595044605841932289,'WORKFLOW','holiday','基本视图','[{\"id\": 0, \"field\": \"update_time\", \"order\": \"desc\"}]',1,1,1,'2022-11-22 21:20:43',1,'2022-11-22 21:20:43');
/*!40000 ALTER TABLE `modeling_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeling_view_column`
--

DROP TABLE IF EXISTS `modeling_view_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeling_view_column` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `view_id` bigint unsigned NOT NULL COMMENT '视图ID',
  `field_id` bigint unsigned NOT NULL COMMENT '字段ID',
  `sn` int NOT NULL COMMENT '排序号',
  `min_width` int NOT NULL DEFAULT '0' COMMENT '最小宽度',
  `width` int NOT NULL COMMENT '列宽',
  `align` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '对齐方式',
  `filterable` tinyint NOT NULL COMMENT '是否可筛选',
  `sortable` tinyint NOT NULL COMMENT '是否可排序',
  `resizable` tinyint NOT NULL COMMENT '是否可拖动列宽',
  `condition` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '初始条件',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型视图列配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeling_view_column`
--

LOCK TABLES `modeling_view_column` WRITE;
/*!40000 ALTER TABLE `modeling_view_column` DISABLE KEYS */;
INSERT INTO `modeling_view_column` VALUES (1600735699149852674,1595044605841932289,1584161060399378434,1,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699183407105,1595044605841932289,1584161141097787394,2,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699200184321,1595044605841932289,1584161976175300609,3,200,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699216961538,1595044605841932289,1593973328016416770,4,80,100,'right',0,1,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699246321666,1595044605841932289,1584339977915265025,5,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699267293186,1595044605841932289,1593973507327107074,6,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699292459010,1595044605841932289,1593973643990114305,7,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699305041921,1595044605841932289,1593974114628771842,8,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699330207745,1595044605841932289,1584181666134118402,9,100,150,'left',1,0,0,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699342790658,1595044605841932289,1584181794765033473,10,150,150,'left',0,1,0,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699363762178,1595044605841932289,1584182223049609217,11,100,150,'left',1,0,0,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735699388928002,1595044605841932289,1584182320063860737,12,150,150,'left',0,1,0,'',3,'2022-12-08 14:15:06',3,'2022-12-08 14:15:06'),(1600735736546267137,1594323506409889794,1585589346233024513,1,100,-1,'left',1,0,1,'',3,'2022-12-08 14:15:14',3,'2022-12-08 14:15:14'),(1600735736567238658,1594323506409889794,1585589426855936002,2,0,200,'left',1,0,1,'',3,'2022-12-08 14:15:14',3,'2022-12-08 14:15:14'),(1600735736588210178,1594323506409889794,1585590278232539138,3,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:14',3,'2022-12-08 14:15:14'),(1600735736600793089,1594323506409889794,1585590372281417730,4,150,300,'left',0,1,1,'',3,'2022-12-08 14:15:14',3,'2022-12-08 14:15:14'),(1600735736625958914,1594323506409889794,1585867406723325954,5,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:15',3,'2022-12-08 14:15:15'),(1600735736642736130,1594323506409889794,1585868195659325441,6,150,300,'left',0,1,1,'',3,'2022-12-08 14:15:15',3,'2022-12-08 14:15:15'),(1600735736659513345,1594323506409889794,1589631844999802881,7,150,200,'left',1,0,1,'',3,'2022-12-08 14:15:15',3,'2022-12-08 14:15:15');
/*!40000 ALTER TABLE `modeling_view_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
  `simple_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门简称',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门描述',
  `ident` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门编号',
  `order_no` int DEFAULT '0' COMMENT '排序号',
  `pid` bigint DEFAULT NULL COMMENT '行政上级',
  `biz_pid` bigint DEFAULT '0' COMMENT '业务上级',
  `owner` bigint DEFAULT NULL COMMENT '部门经理',
  `assistant` bigint DEFAULT NULL COMMENT '部门助理',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门电话',
  `office_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '办公地点',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '详细地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'admin' COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
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
INSERT INTO `sys_dept` VALUES (1,'Admin','Admin','','admin',1,NULL,0,1,1,NULL,NULL,NULL,0,'admin','2022-10-14 14:15:40','2022-02-20 00:33:19'),(2,'全球研发中心-Central Engineering','全球研发中心','','CE',1,1,0,1,1,NULL,NULL,NULL,0,'1','2022-11-06 23:37:10','2022-02-20 00:56:30'),(3,'总部-HQ','总部','','HQ',2,1,0,2,13,NULL,NULL,NULL,0,'admin','2022-10-14 14:16:08','2022-02-20 00:59:41'),(4,'长沙分公司','长沙','','WL',3,1,0,3,6,NULL,NULL,NULL,0,'1','2022-11-06 23:36:54','2022-02-20 01:00:14'),(5,'常州分公司','常州','','EX',4,1,0,3,2,NULL,NULL,NULL,0,'1','2022-11-06 23:37:00','2022-02-20 01:14:19'),(6,'杭州分公司','杭州','','DL',5,1,0,3,6,NULL,NULL,NULL,0,'1','2022-11-06 23:37:04','2022-02-20 01:14:48'),(7,'CE IT','数字信息','','CE001',1,2,0,8,5,NULL,NULL,NULL,0,'admin','2022-10-14 14:11:43','2022-02-20 01:17:21'),(8,'CE ID','工业设计','','CE013',2,2,0,4,7,NULL,NULL,NULL,0,'1','2022-11-08 22:30:57','2022-02-20 01:17:38'),(9,'CE Intelligent S&T','智能设计院','','CE006',3,2,0,1,2,NULL,NULL,NULL,0,'admin','2022-10-14 14:11:06','2022-02-20 01:18:31'),(10,'CE Big Data & AI R&D','大数据','','CE014',1,9,0,10,14,NULL,NULL,NULL,0,'1','2022-11-08 22:31:06','2022-02-20 01:18:48'),(11,'CE Smart Jobsite R&D','智能施工','','CE016',3,9,0,17,20,NULL,NULL,NULL,0,'1','2022-11-08 22:31:14','2022-02-20 01:24:25'),(12,'CE Smart Machine R&D','智能产品','','CE015',4,9,0,20,2,NULL,NULL,NULL,0,'1','2022-11-08 22:31:24','2022-02-20 01:26:03'),(13,'数字信息','总部DT','总部DT','HQ-DT',1,3,0,1,7,NULL,NULL,NULL,0,'1','2022-11-08 22:31:29','2022-08-26 00:50:28'),(14,'信息技术','HQ-IT','总部IT','HQ-IT',2,3,0,1,8,NULL,NULL,NULL,0,'1','2022-11-08 22:31:35','2022-08-26 21:56:08'),(15,'宁波分公司','宁波','1111111111','NB',5,1,0,2,4,NULL,NULL,NULL,0,'1','2022-11-06 23:37:18','2022-09-08 12:05:28'),(1580801456333443073,'市场营销','市场部','','Market',4,2,0,1,1,NULL,NULL,NULL,0,'admin','2022-10-14 14:05:54','2022-10-14 14:03:31');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `pid` bigint unsigned DEFAULT NULL COMMENT '上级菜单',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单类型',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由地址',
  `component` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件地址',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `order_no` int NOT NULL DEFAULT '1' COMMENT '排序号',
  `closeable` tinyint DEFAULT '1' COMMENT '可否关闭',
  `state` int DEFAULT NULL COMMENT '状态',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'Dashboard',NULL,'PAGE','/home','/home','House',1,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(2,'系统管理',NULL,'FOLDER',NULL,NULL,'Setting',2,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(3,'用户管理',2,'PAGE','/sys/user','/sys/user/user','User',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(4,'角色管理',2,'PAGE','/sys/role','/sys/role/role','UserRole',2,1,0,NULL,1,'2022-10-14 16:34:03',1,'2022-10-05 23:10:20'),(5,'菜单管理',2,'PAGE','/sys/menus','/sys/menu/menus','Menu',3,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:10:20'),(6,'部门管理',2,'PAGE','/sys/dept','/sys/dept/dept','Department',4,1,0,NULL,1,'2022-10-14 08:38:19',1,'2022-10-05 23:11:48'),(9,'个人设置',NULL,'FOLDER',NULL,NULL,'UserSettings',3,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:04:20'),(10,'个人信息',9,'PAGE','/user/profile','/user/profile','UserProfile',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:14:50'),(11,'修改密码',9,'PAGE','/user/password','/user/password','Password',2,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:14:50'),(12,'流程管理',NULL,'FOLDER',NULL,NULL,'Cluster',4,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:15:50'),(13,'待认领流程',12,'PAGE','/process/task/unclaim','/process/task/unclaim','InstanceVirtual',1,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:16:24'),(14,'我的待办',12,'PAGE','/workflow/todo/task/page','/workflow/task/todo/WorkflowTodoTaskPage','Task',2,1,0,NULL,1,'2022-12-07 12:33:44',1,'2022-10-05 23:16:24'),(15,'我经办的流程',12,'PAGE','/workflow/done/task/page','/workflow/task/done/WorkflowDoneTaskPage','Task',3,1,0,NULL,1,'2022-12-07 09:48:11',1,'2022-10-05 23:16:24'),(16,'流程设计',NULL,'FOLDER',NULL,NULL,'Cluster',5,1,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-05 23:18:00'),(17,'流程模型',16,'PAGE','/process/model','/workflow/model/WorkflowTypeList','Cluster',1,1,0,NULL,1,'2022-10-19 20:14:21',1,'2022-10-05 23:25:33'),(1580568369258364930,'创建用户',3,'BUTTON',NULL,'sysetm:user:create','Setting',2,0,0,NULL,1,'2022-10-14 08:38:18',1,'2022-10-13 22:37:19'),(1583611174964719617,'全局字段',16,'PAGE','/modeling/field','/modeling/field/GlobalField','TextField',3,1,0,'全局字段',1,'2022-11-06 20:10:10',1,'2022-10-22 08:08:20'),(1583661590087798785,'选项配置',16,'PAGE','/modeling/option/global','/modeling/option/GlobalOption','Operation',4,1,0,'全局数据源配置',1,'2022-11-06 20:47:22',1,'2022-10-22 11:28:40'),(1589232440304267265,'业务实体',16,'PAGE','/modeling/entity','/modeling/entity/ModelingEntity','Apple',2,1,0,'业务实体定义',1,'2022-11-06 20:44:52',1,'2022-11-06 20:25:15'),(1589243190770978817,'OA模块',NULL,'FOLDER',NULL,NULL,'ChromeFilled',1,1,0,'简单OA流程',1,'2022-11-06 21:07:58',1,'2022-11-06 21:07:58'),(1589243737485922305,'请假模块',1589243190770978817,'TAB','/oa/holiday','/modeling/ModelingPageTabsContainer','AlarmClock',1,1,0,'',1,'2022-11-06 21:10:08',1,'2022-11-06 21:10:08'),(1589245602978123777,'测试实体',1589243737485922305,'ENTITY','product_line','','AlarmClock',1,1,0,'',1,'2022-11-06 21:17:33',1,'2022-11-06 21:17:33'),(1595016845245300738,'请假流程',1589243737485922305,'WORKFLOW','holiday','','AlarmClock',2,1,0,'请求流程列表视图',1,'2022-11-22 19:31:30',1,'2022-11-22 19:30:25');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `order_no` int DEFAULT NULL COMMENT '排序号',
  `status` tinyint DEFAULT '0' COMMENT '状态',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `create_by` bigint NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_role_menu_role_id_menu_id_uindex` (`role_id`,`menu_id`),
  KEY `sys_role_menu_menu_idx` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1600347890383654914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1596783039237378049,2,1,1,'2022-11-27 16:28:38'),(1596783039308681218,2,2,1,'2022-11-27 16:28:38'),(1596783039308681219,2,3,1,'2022-11-27 16:28:38'),(1596783039308681220,2,4,1,'2022-11-27 16:28:38'),(1596783039367401473,2,5,1,'2022-11-27 16:28:38'),(1596783039367401474,2,6,1,'2022-11-27 16:28:38'),(1596783039434510338,2,9,1,'2022-11-27 16:28:38'),(1596783039434510339,2,10,1,'2022-11-27 16:28:38'),(1596783039434510340,2,11,1,'2022-11-27 16:28:38'),(1596783039497424897,2,12,1,'2022-11-27 16:28:38'),(1596783039497424898,2,16,1,'2022-11-27 16:28:38'),(1596783039497424899,2,17,1,'2022-11-27 16:28:38'),(1600347889796452353,1,1,1,'2022-12-07 12:34:05'),(1600347889830006785,1,2,1,'2022-12-07 12:34:05'),(1600347889859366914,1,3,1,'2022-12-07 12:34:05'),(1600347889897115649,1,4,1,'2022-12-07 12:34:05'),(1600347889922281474,1,5,1,'2022-12-07 12:34:05'),(1600347889943252993,1,6,1,'2022-12-07 12:34:05'),(1600347889985196034,1,9,1,'2022-12-07 12:34:05'),(1600347890027139074,1,10,1,'2022-12-07 12:34:05'),(1600347890048110593,1,11,1,'2022-12-07 12:34:05'),(1600347890073276417,1,12,1,'2022-12-07 12:34:05'),(1600347890102636546,1,15,1,'2022-12-07 12:34:05'),(1600347890127802370,1,16,1,'2022-12-07 12:34:05'),(1600347890157162497,1,17,1,'2022-12-07 12:34:05'),(1600347890194911233,1,1580568369258364930,1,'2022-12-07 12:34:05'),(1600347890211688450,1,1583611174964719617,1,'2022-12-07 12:34:05'),(1600347890236854274,1,1583661590087798785,1,'2022-12-07 12:34:05'),(1600347890253631490,1,1589232440304267265,1,'2022-12-07 12:34:05'),(1600347890278797313,1,1589243190770978817,1,'2022-12-07 12:34:05'),(1600347890308157442,1,1589243737485922305,1,'2022-12-07 12:34:05'),(1600347890329128962,1,1589245602978123777,1,'2022-12-07 12:34:05'),(1600347890362683394,1,1595016845245300738,1,'2022-12-07 12:34:05'),(1600347890383654913,1,14,1,'2022-12-07 12:34:05');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户姓名',
  `nickname_pinyin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称拼音',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `register_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '注册IP',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '用户状态',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
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
INSERT INTO `sys_user` VALUES (1,'admin',7,'Admin',NULL,'e10adc3949ba59abbe56e057f20f883e','18877811997','https://q4.qlogo.cn/g?b=qq&nk=942664114&s=0',NULL,0,'l1yp@qq.com','admin','2022-10-13 09:00:47','2022-02-16 15:32:27'),(2,'A52747',7,'不知火舞','buzhihuowu','e10adc3949ba59abbe56e057f20f883e','18077855148','https://q4.qlogo.cn/g?b=qq&nk=10001&s=0',NULL,0,'12353@qq.com','1','2022-11-26 20:42:10','2022-02-22 21:30:42'),(3,'A52736',8,'伽罗','jialuo','e10adc3949ba59abbe56e057f20f883e','18077855137','https://q4.qlogo.cn/g?b=qq&nk=10002&s=0',NULL,0,'18877185@qq.com','admin','2022-12-07 08:39:06','2022-02-22 20:11:26'),(4,'A52737',7,'公孙离','gongsunli','e10adc3949ba59abbe56e057f20f883e','18077855138','https://q4.qlogo.cn/g?b=qq&nk=10003&s=0',NULL,0,'18877195@qq.com','1','2022-12-07 08:39:06','2022-02-22 20:16:56'),(5,'A52738',7,'刘禅','liushan','e10adc3949ba59abbe56e057f20f883e','18077855139','https://q4.qlogo.cn/g?b=qq&nk=10004&s=0',NULL,0,'35295921@qq.com','1','2022-12-07 08:39:06','2022-02-22 21:12:05'),(6,'A52739',7,'不大知乔','budazhiqiao','e10adc3949ba59abbe56e057f20f883e','18077855140','https://q4.qlogo.cn/g?b=qq&nk=10005&s=0',NULL,0,'12345@qq.com','1','2022-12-07 08:39:06','2022-02-22 21:12:05'),(7,'A52740',5,'嫦娥','change','e10adc3949ba59abbe56e057f20f883e','18077855141','https://q4.qlogo.cn/g?b=qq&nk=10006&s=0',NULL,0,'12346@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:12:05'),(8,'A52741',6,'安琪拉','anqila','e10adc3949ba59abbe56e057f20f883e','18077855142','https://q4.qlogo.cn/g?b=qq&nk=10007&s=0',NULL,0,'12347@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:12:05'),(9,'A52742',15,'李白','libai','e10adc3949ba59abbe56e057f20f883e','18077855143','https://q4.qlogo.cn/g?b=qq&nk=10008&s=0',NULL,0,'12348@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:12:06'),(10,'A52743',13,'瑶','yao','e10adc3949ba59abbe56e057f20f883e','18077855144','https://q4.qlogo.cn/g?b=qq&nk=10009&s=0',NULL,0,'12349@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:12:06'),(12,'A52744',3,'甄姬','zhenji','e10adc3949ba59abbe56e057f20f883e','18077855145','https://q4.qlogo.cn/g?b=qq&nk=10010&s=0',NULL,0,'12350@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:30:41'),(13,'A52745',14,'百里玄策','bailixuance','e10adc3949ba59abbe56e057f20f883e','18077855146','https://q4.qlogo.cn/g?b=qq&nk=10011&s=0',NULL,0,'12351@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:30:41'),(14,'A52746',11,'花木兰','huamulan','e10adc3949ba59abbe56e057f20f883e','18077855147','https://q4.qlogo.cn/g?b=qq&nk=10012&s=0',NULL,0,'12352@qq.com','admin','2022-12-07 08:39:06','2022-02-22 21:30:41'),(17,'A52751',8,'虞姬','yuji','e10adc3949ba59abbe56e057f20f883e','18077855152','https://q4.qlogo.cn/g?b=qq&nk=10013&s=0',NULL,0,'12357@qq.com',NULL,'2022-12-07 08:39:06','2022-06-08 22:57:12'),(18,'A52748',7,'西施','xishi','e10adc3949ba59abbe56e057f20f883e','18077855149','https://q4.qlogo.cn/g?b=qq&nk=10014&s=0',NULL,0,'12354@qq.com',NULL,'2022-12-07 08:39:06','2022-06-08 22:57:12'),(19,'A52749',7,'诸葛亮','zhugeliang','e10adc3949ba59abbe56e057f20f883e','18077855150','https://q4.qlogo.cn/g?b=qq&nk=10015&s=0',NULL,0,'12355@qq.com',NULL,'2022-12-07 08:39:06','2022-06-08 22:57:12'),(20,'A52750',7,'貂蝉','diaochan','e10adc3949ba59abbe56e057f20f883e','18077855151','https://q4.qlogo.cn/g?b=qq&nk=10016&s=0',NULL,0,'12356@qq.com',NULL,'2022-12-07 08:39:06','2022-06-08 22:57:12');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_dept`
--

DROP TABLE IF EXISTS `sys_user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_dept_uid_dept_id_uindex` (`uid`,`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1582717323777470470 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='兼职部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_dept`
--

LOCK TABLES `sys_user_dept` WRITE;
/*!40000 ALTER TABLE `sys_user_dept` DISABLE KEYS */;
INSERT INTO `sys_user_dept` VALUES (1580448967646068737,1,2,1,'2022-10-23 20:22:00','2022-10-13 14:42:51'),(1580448967646068738,1,3,1,'2022-10-23 20:22:00','2022-10-13 14:42:51'),(1580448967646068739,1,7,1,'2022-10-23 20:22:00','2022-10-13 14:42:51'),(1580448967646068740,1,8,1,'2022-10-23 20:22:00','2022-10-13 14:42:51'),(1580448967646068741,1,9,1,'2022-10-23 20:22:00','2022-10-13 14:42:51'),(1580807330078765058,2,2,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765059,2,3,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765060,2,7,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765061,2,8,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1580807330078765062,2,9,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1582717285303119874,4,2,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717285303119875,4,3,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717285303119876,4,7,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717285303119877,4,8,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717285303119878,4,9,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717302201970689,5,2,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717302201970690,5,3,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717302201970691,5,7,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717302201970692,5,8,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717302201970693,5,9,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717323777470465,6,2,1,'2022-10-19 20:56:30','2022-10-19 20:56:30'),(1582717323777470466,6,3,1,'2022-10-19 20:56:30','2022-10-19 20:56:30'),(1582717323777470467,6,7,1,'2022-10-19 20:56:30','2022-10-19 20:56:30'),(1582717323777470468,6,8,1,'2022-10-19 20:56:30','2022-10-19 20:56:30'),(1582717323777470469,6,9,1,'2022-10-19 20:56:30','2022-10-19 20:56:30');
/*!40000 ALTER TABLE `sys_user_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1582717323777470471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (24,3,1,1,'2022-05-19 08:40:12','2022-05-19 08:40:12'),(25,7,1,1,'2022-05-19 08:40:22','2022-05-19 08:40:22'),(26,8,1,1,'2022-05-19 08:40:28','2022-05-19 08:40:28'),(27,9,1,1,'2022-05-19 08:40:31','2022-05-19 08:40:31'),(28,10,1,1,'2022-05-19 08:40:33','2022-05-19 08:40:33'),(29,12,1,1,'2022-05-19 08:40:36','2022-05-19 08:40:36'),(30,13,1,1,'2022-05-19 08:40:39','2022-05-19 08:40:39'),(31,14,1,1,'2022-05-19 08:40:45','2022-05-19 08:40:45'),(1580448967646068742,1,1,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068743,1,2,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068744,1,3,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068745,1,4,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068746,1,5,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068747,1,6,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580448967646068748,1,7,1,'2022-10-13 14:42:51','2022-10-13 14:42:51'),(1580807330103930881,2,1,1,'2022-10-14 14:26:52','2022-10-14 14:26:52'),(1582717285303119879,4,1,1,'2022-10-19 20:56:20','2022-10-19 20:56:20'),(1582717302201970694,5,1,1,'2022-10-19 20:56:24','2022-10-19 20:56:24'),(1582717323777470470,6,1,1,'2022-10-19 20:56:30','2022-10-19 20:56:30');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_holiday`
--

DROP TABLE IF EXISTS `wf_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_holiday` (
  `id` bigint unsigned NOT NULL COMMENT '编号',
  `process_instance_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程实例ID',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  `dept_id` bigint unsigned DEFAULT NULL COMMENT '所属部门',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `cost_center` bigint unsigned DEFAULT NULL COMMENT 'cost_center',
  `days` bigint unsigned DEFAULT NULL COMMENT '天数',
  `leader` bigint unsigned DEFAULT NULL COMMENT '主管',
  `hr` bigint unsigned DEFAULT NULL COMMENT 'HR专员',
  `headquarters` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '总部领导',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wf_holiday_code_key` (`code`),
  UNIQUE KEY `wf_holiday_process_instance_id_key` (`process_instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='员工通用的请假流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_holiday`
--

LOCK TABLES `wf_holiday` WRITE;
/*!40000 ALTER TABLE `wf_holiday` DISABLE KEYS */;
INSERT INTO `wf_holiday` VALUES (1596423796009226241,'1596423795937923073','HL2022112600001','ccccccccc',7,2,'2022-11-26 17:30:22',2,'2022-11-26 17:30:22',1583824814787584001,1,2,2,'2'),(1598296203984707586,'1598296203884044289','HL2022120100001','111',8,1,'2022-12-01 21:38:14',1,'2022-12-01 21:38:15',1583822690246844417,122,1,1,'1'),(1598311491027386369,'1598311490964471810','HL2022120100002','22',8,1,'2022-12-06 10:16:34',1,'2022-12-06 10:16:35',1583824814787584001,1,1,1,'1'),(1600025625385267201,'1600025625313964033','HL2022120600001','111',8,1,'2022-12-06 23:07:04',1,'2022-12-06 23:07:04',1583824814787584001,1,1,1,'1'),(1600143733580124162,'1600143733563346945','HL2022120600002','测试',8,1,'2022-12-06 23:02:50',1,'2022-12-06 23:02:50',1583824814787584001,1,1,1,'1');
/*!40000 ALTER TABLE `wf_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_holiday_ref`
--

DROP TABLE IF EXISTS `wf_holiday_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_holiday_ref` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名',
  `instance_id` bigint unsigned NOT NULL,
  `value` bigint unsigned NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wf_holiday_ref_pk` (`instance_id`,`field`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字段引用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_holiday_ref`
--

LOCK TABLES `wf_holiday_ref` WRITE;
/*!40000 ALTER TABLE `wf_holiday_ref` DISABLE KEYS */;
INSERT INTO `wf_holiday_ref` VALUES (1596436188948615169,'headquarters',1596423796009226241,2),(1598310507899305985,'headquarters',1598296203984707586,1),(1599950899975614466,'headquarters',1598311491027386369,1),(1600144800673976321,'headquarters',1600025625385267201,1),(1600143733647233026,'headquarters',1600143733580124162,1);
/*!40000 ALTER TABLE `wf_holiday_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_type_def`
--

DROP TABLE IF EXISTS `workflow_type_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_type_def` (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `key` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '流程标识',
  `category` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '流程名称',
  `remark` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '流程说明',
  `code_gen_rule` json NOT NULL COMMENT '编码生成规则',
  `process_definition_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '流程定义ID',
  `active_ver_id` bigint unsigned DEFAULT NULL COMMENT '激活的版本ID',
  `status` int DEFAULT NULL COMMENT '状态',
  `update_by` bigint unsigned NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint unsigned NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `def_key_uidx` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='流程类型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_type_def`
--

LOCK TABLES `workflow_type_def` WRITE;
/*!40000 ALTER TABLE `workflow_type_def` DISABLE KEYS */;
INSERT INTO `workflow_type_def` VALUES (1589241285277700097,'holiday',NULL,'请假流程','员工通用的请假流程','{\"type\": \"fixed\", \"joiner\": null, \"prefix\": \"HL\", \"delimiter\": null, \"numFormat\": 5, \"dateFormat\": \"yyyyMMdd\"}','holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b',1589241285311254529,0,1,'2022-12-06 15:39:47',1,'2022-11-06 21:00:24');
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
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程类型标识',
  `ver` int NOT NULL COMMENT '版本',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '升级备注',
  `status` tinyint NOT NULL COMMENT '激活状态: 0=挂起, 1=激活',
  `update_by` bigint unsigned NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xml` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `process_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程定义ID',
  PRIMARY KEY (`id`),
  KEY `def_id_idx` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程模型版本管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_type_ver`
--

LOCK TABLES `workflow_type_ver` WRITE;
/*!40000 ALTER TABLE `workflow_type_ver` DISABLE KEYS */;
INSERT INTO `workflow_type_ver` VALUES (1589241285311254529,'holiday',1,'测试部署',1,1,'2022-12-06 15:39:47',1,'2022-11-06 21:00:24','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"holiday\" name=\"请假流程\"><startEvent id=\"startEvent_39f7426\" name=\"开始\" flowable:formKey=\"1595071632762552322\" flowable:initiator=\"creator\"><outgoing>Flow_002ih2x</outgoing></startEvent><userTask id=\"Activity_1ro616j\" name=\"发起人\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;create_by&#34;)}\" flowable:assigneeFields=\"create_by\"><incoming>Flow_002ih2x</incoming><incoming>Flow_1t3xfdq</incoming><incoming>Flow_0xmo5tz</incoming><incoming>Flow_09eiiut</incoming><outgoing>Flow_1is270g</outgoing></userTask><sequenceFlow id=\"Flow_002ih2x\" sourceRef=\"startEvent_39f7426\" targetRef=\"Activity_1ro616j\" /><exclusiveGateway id=\"Gateway_0qjovut\"><incoming>Flow_1is270g</incoming><outgoing>Flow_0185z70</outgoing><outgoing>Flow_0xoo0rv</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1is270g\" name=\"提交\" sourceRef=\"Activity_1ro616j\" targetRef=\"Gateway_0qjovut\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"提交\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_1a0z8wz\" name=\"主管审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;leader&#34;)}\" flowable:assigneeFields=\"leader\"><incoming>Flow_0185z70</incoming><outgoing>Flow_06nakbb</outgoing><outgoing>Flow_09eiiut</outgoing></userTask><sequenceFlow id=\"Flow_0185z70\" name=\"请假天数&#62;10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_1a0z8wz\"><conditionExpression xsi:type=\"tFormalExpression\">${days &gt; 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0lwiy64\" name=\"HR审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${psr.read(execution, &#34;holiday&#34;, &#34;hr&#34;)}\" flowable:assigneeFields=\"hr\"><incoming>Flow_0xoo0rv</incoming><outgoing>Flow_0e8qrct</outgoing><outgoing>Flow_0xmo5tz</outgoing></userTask><sequenceFlow id=\"Flow_0xoo0rv\" name=\"请假天数&#60;=10\" sourceRef=\"Gateway_0qjovut\" targetRef=\"Activity_0lwiy64\"><conditionExpression xsi:type=\"tFormalExpression\">${days &lt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0t23scb\" name=\"总部审核\" flowable:formKey=\"1595071870168547329\" flowable:assignee=\"${assigneeItem}\" flowable:assigneeType=\"user\" flowable:assigneeFields=\"headquarters,hr,leader\"><incoming>Flow_06nakbb</incoming><incoming>Flow_0e8qrct</incoming><outgoing>Flow_15fc7du</outgoing><outgoing>Flow_1t3xfdq</outgoing><multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"${psr.readList(execution, &#34;holiday&#34;, &#34;headquarters,hr,leader&#34;)}\" flowable:elementVariable=\"assigneeItem\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><sequenceFlow id=\"Flow_06nakbb\" name=\"同意\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e8qrct\" name=\"同意\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_0t23scb\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><endEvent id=\"Event_0hqfd5v\" flowable:formKey=\"1595071870168547329\"><incoming>Flow_15fc7du</incoming></endEvent><sequenceFlow id=\"Flow_15fc7du\" name=\"同意\" sourceRef=\"Activity_0t23scb\" targetRef=\"Event_0hqfd5v\" flowable:order=\"1\" flowable:completionRule=\"all\" flowable:completionExpression=\"11111\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1t3xfdq\" name=\"拒绝\" sourceRef=\"Activity_0t23scb\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"2\" flowable:completionRule=\"any\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"拒绝\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xmo5tz\" name=\"驳回\" sourceRef=\"Activity_0lwiy64\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_09eiiut\" name=\"驳回\" sourceRef=\"Activity_1a0z8wz\" targetRef=\"Activity_1ro616j\" flowable:formKey=\"1596194297262936066\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"holiday\"><bpmndi:BPMNEdge id=\"Flow_09eiiut_di\" bpmnElement=\"Flow_09eiiut\"><omgdi:waypoint x=\"-450\" y=\"-180\" /><omgdi:waypoint x=\"-450\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-220\" /><omgdi:waypoint x=\"-790\" y=\"-50\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-631\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xmo5tz_di\" bpmnElement=\"Flow_0xmo5tz\"><omgdi:waypoint x=\"-450\" y=\"140\" /><omgdi:waypoint x=\"-450\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"170\" /><omgdi:waypoint x=\"-760\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-616\" y=\"183\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1t3xfdq_di\" bpmnElement=\"Flow_1t3xfdq\"><omgdi:waypoint x=\"-220\" y=\"20\" /><omgdi:waypoint x=\"-220\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"250\" /><omgdi:waypoint x=\"-790\" y=\"30\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-516\" y=\"263\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15fc7du_di\" bpmnElement=\"Flow_15fc7du\"><omgdi:waypoint x=\"-170\" y=\"-20\" /><omgdi:waypoint x=\"-38\" y=\"-20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-115\" y=\"-38\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e8qrct_di\" bpmnElement=\"Flow_0e8qrct\"><omgdi:waypoint x=\"-400\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"100\" /><omgdi:waypoint x=\"-240\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-331\" y=\"82\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06nakbb_di\" bpmnElement=\"Flow_06nakbb\"><omgdi:waypoint x=\"-400\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-140\" /><omgdi:waypoint x=\"-220\" y=\"-60\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-321\" y=\"-158\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xoo0rv_di\" bpmnElement=\"Flow_0xoo0rv\"><omgdi:waypoint x=\"-630\" y=\"15\" /><omgdi:waypoint x=\"-630\" y=\"100\" /><omgdi:waypoint x=\"-500\" y=\"100\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-665\" y=\"113\" width=\"70\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0185z70_di\" bpmnElement=\"Flow_0185z70\"><omgdi:waypoint x=\"-630\" y=\"-35\" /><omgdi:waypoint x=\"-630\" y=\"-140\" /><omgdi:waypoint x=\"-500\" y=\"-140\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-662\" y=\"-157\" width=\"63\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1is270g_di\" bpmnElement=\"Flow_1is270g\"><omgdi:waypoint x=\"-740\" y=\"-10\" /><omgdi:waypoint x=\"-655\" y=\"-10\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-708\" y=\"-28\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_002ih2x_di\" bpmnElement=\"Flow_002ih2x\"><omgdi:waypoint x=\"-912\" y=\"-10\" /><omgdi:waypoint x=\"-840\" y=\"-10\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"startEvent_39f7426\"><omgdc:Bounds x=\"-948\" y=\"-28\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-941\" y=\"8\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1ro616j_di\" bpmnElement=\"Activity_1ro616j\"><omgdc:Bounds x=\"-840\" y=\"-50\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qjovut_di\" bpmnElement=\"Gateway_0qjovut\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-655\" y=\"-35\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1a0z8wz_di\" bpmnElement=\"Activity_1a0z8wz\"><omgdc:Bounds x=\"-500\" y=\"-180\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lwiy64_di\" bpmnElement=\"Activity_0lwiy64\"><omgdc:Bounds x=\"-500\" y=\"60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0t23scb_di\" bpmnElement=\"Activity_0t23scb\"><omgdc:Bounds x=\"-270\" y=\"-60\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_0hqfd5v_di\" bpmnElement=\"Event_0hqfd5v\"><omgdc:Bounds x=\"-38\" y=\"-38\" width=\"36\" height=\"36\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>','holiday:2:2874c4b3-7539-11ed-90fe-50ebf6b3961b');
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

-- Dump completed on 2022-12-09 15:16:40
