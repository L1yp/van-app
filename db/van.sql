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
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('07142af6-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng.bpmn20.xml','07142af5-f9e2-11ec-a429-50ebf6b3961b',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:candidateGroups=\"董事长,总经理\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" event=\"complete\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\" flowable:elementVariable=\"judge\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"同意\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"拒绝\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"拒绝\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\" flowable:order=\"2\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\" flowable:order=\"2\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"20\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"10\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-10\" y=\"1893\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"540\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"228\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"590\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-342\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-469\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-777\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-643\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-214\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('b2f3df11-f9e0-11ec-a429-50ebf6b3961b',1,'holiday.bpmn20.xml','b2f3df10-f9e0-11ec-a429-50ebf6b3961b',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"Process_0dm6mw4\"><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1ik6gh6</outgoing></startEvent><sequenceFlow id=\"Flow_1ik6gh6\" name=\"填写假条信息\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_1q5ylfn\" /><userTask id=\"Activity_1q5ylfn\" name=\"填写假条内容\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;creator&#39;, execution)}\"><incoming>Flow_1ik6gh6</incoming><incoming>Flow_14xs85z</incoming><incoming>Flow_1yk6wlf</incoming><incoming>Flow_1f9ccn0</incoming><outgoing>Flow_0g0bb7a</outgoing></userTask><exclusiveGateway id=\"Gateway_072fnqe\"><incoming>Flow_0g0bb7a</incoming><outgoing>Flow_1luztyb</outgoing><outgoing>Flow_19ai2ba</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0g0bb7a\" name=\"提交\" sourceRef=\"Activity_1q5ylfn\" targetRef=\"Gateway_072fnqe\" /><sequenceFlow id=\"Flow_1luztyb\" name=\"&#60;10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_0zsqisd\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &lt; 10}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19ai2ba\" name=\"≥ 10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_1ylj3fi\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &gt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0zsqisd\" name=\"主管审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;supervisor&#39;, execution)}\"><incoming>Flow_1luztyb</incoming><outgoing>Flow_14xs85z</outgoing><outgoing>Flow_1e1j8nx</outgoing></userTask><userTask id=\"Activity_1ylj3fi\" name=\"总监审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;dept_leader&#39;, execution)}\"><incoming>Flow_19ai2ba</incoming><outgoing>Flow_1yk6wlf</outgoing><outgoing>Flow_06bt0iu</outgoing></userTask><sequenceFlow id=\"Flow_14xs85z\" name=\"驳回\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1yk6wlf\" name=\"驳回\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1e1j8nx\" name=\"通过\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_18ueswk\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06bt0iu\" name=\"通过\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_18ueswk\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_18ueswk\" name=\"总部会签\" flowable:assignee=\"${hq_leader}\"><extensionElements><flowable:taskListener class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" event=\"complete\" /></extensionElements><incoming>Flow_1e1j8nx</incoming><incoming>Flow_06bt0iu</incoming><outgoing>Flow_1yaad4o</outgoing><outgoing>Flow_1f9ccn0</outgoing><multiInstanceLoopCharacteristics flowable:collection=\"${psr.read(&#39;holiday&#39;, &#39;hq_leaders&#39;, execution)}\" flowable:elementVariable=\"hq_leader\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><endEvent id=\"Event_01vzvdx\" name=\"归档\"><incoming>Flow_1yaad4o</incoming></endEvent><sequenceFlow id=\"Flow_1yaad4o\" name=\"通过\" sourceRef=\"Activity_18ueswk\" targetRef=\"Event_01vzvdx\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1f9ccn0\" name=\"驳回\" sourceRef=\"Activity_18ueswk\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Process_0dm6mw4\"><bpmndi:BPMNEdge id=\"Flow_1f9ccn0_di\" bpmnElement=\"Flow_1f9ccn0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"-260\" /><omgdi:waypoint x=\"-30\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-350\" y=\"-468\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yaad4o_di\" bpmnElement=\"Flow_1yaad4o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"20\" y=\"-220\" /><omgdi:waypoint x=\"122\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"61\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06bt0iu_di\" bpmnElement=\"Flow_06bt0iu\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-210\" /><omgdi:waypoint x=\"-80\" y=\"-210\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-168\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1e1j8nx_di\" bpmnElement=\"Flow_1e1j8nx\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-230\" /><omgdi:waypoint x=\"-80\" y=\"-230\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-278\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yk6wlf_di\" bpmnElement=\"Flow_1yk6wlf\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-330\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-180\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-486\" y=\"-118\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_14xs85z_di\" bpmnElement=\"Flow_14xs85z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-280\" y=\"-360\" /><omgdi:waypoint x=\"-280\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-418\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19ai2ba_di\" bpmnElement=\"Flow_19ai2ba\"><omgdi:waypoint x=\"-450\" y=\"-195\" /><omgdi:waypoint x=\"-450\" y=\"-120\" /><omgdi:waypoint x=\"-330\" y=\"-120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-447\" y=\"-187\" width=\"34\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1luztyb_di\" bpmnElement=\"Flow_1luztyb\"><omgdi:waypoint x=\"-450\" y=\"-245\" /><omgdi:waypoint x=\"-450\" y=\"-320\" /><omgdi:waypoint x=\"-330\" y=\"-320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-446\" y=\"-257\" width=\"31\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0g0bb7a_di\" bpmnElement=\"Flow_0g0bb7a\"><omgdi:waypoint x=\"-570\" y=\"-220\" /><omgdi:waypoint x=\"-475\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-533\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ik6gh6_di\" bpmnElement=\"Flow_1ik6gh6\"><omgdi:waypoint x=\"-762\" y=\"-220\" /><omgdi:waypoint x=\"-670\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-749\" y=\"-238\" width=\"66\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-798\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-791\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_15nzmu9_di\" bpmnElement=\"Activity_1q5ylfn\"><omgdc:Bounds x=\"-670\" y=\"-260\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_072fnqe_di\" bpmnElement=\"Gateway_072fnqe\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-475\" y=\"-245\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_18a80hv_di\" bpmnElement=\"Activity_0zsqisd\"><omgdc:Bounds x=\"-330\" y=\"-360\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lz62dp_di\" bpmnElement=\"Activity_1ylj3fi\"><omgdc:Bounds x=\"-330\" y=\"-160\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_00s55jz_di\" bpmnElement=\"Activity_18ueswk\"><omgdc:Bounds x=\"-80\" y=\"-260\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_01vzvdx_di\" bpmnElement=\"Event_01vzvdx\"><omgdc:Bounds x=\"122\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"129\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0);
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
INSERT INTO `ACT_HI_ACTINST` VALUES ('15482f4d-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-07-02 16:36:35.662','2022-07-02 16:36:35.662',1,0,NULL,''),('15482f4e-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_1pl8zw7',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-07-02 16:36:35.662','2022-07-02 16:36:35.662',2,0,NULL,''),('15482f4f-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0jqew3r','15482f50-f9e2-11ec-a429-50ebf6b3961b',NULL,'填报申请（平台端）','userTask','1','2022-07-02 16:36:35.662','2022-07-02 16:36:51.724',3,16062,NULL,''),('1edb0d34-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:36:51.724','2022-07-02 16:36:51.724',1,0,NULL,''),('1edb3445-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0vdh1ks','1edb3446-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理单位初审(登录单位帐号)','userTask','1','2022-07-02 16:36:51.725','2022-07-02 16:37:12.955',2,21230,NULL,''),('2b82f34c-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_0tgdtni',NULL,NULL,'通过','sequenceFlow',NULL,'2022-07-02 16:37:12.957','2022-07-02 16:37:12.957',1,0,NULL,''),('2b82f34d-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0lfb8i2','2b831a5e-f9e2-11ec-a429-50ebf6b3961b',NULL,'平台端(上传文档)','userTask','1','2022-07-02 16:37:12.957','2022-07-02 16:37:21.621',2,8664,NULL,''),('30acf8d1-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_13rvobl',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:37:21.621','2022-07-02 16:37:21.621',1,0,NULL,''),('30ad1fe2-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0asr136','30ad1fe3-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理端单位-初审公示(登录单位帐号)','userTask','1','2022-07-02 16:37:21.622','2022-07-02 16:37:23.517',2,1895,NULL,''),('31ce6e66-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_1djsqed',NULL,NULL,'退回(平台端重新上传)','sequenceFlow',NULL,'2022-07-02 16:37:23.518','2022-07-02 16:37:23.518',1,0,NULL,''),('31ce6e67-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0jqew3r','31ce9578-f9e2-11ec-a429-50ebf6b3961b',NULL,'填报申请（平台端）','userTask','1','2022-07-02 16:37:23.518','2022-07-02 16:37:46.052',2,22534,NULL,''),('3f3cd8cb-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:37:46.052','2022-07-02 16:37:46.052',1,0,NULL,''),('3f3cffdc-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0vdh1ks','3f3cffdd-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理单位初审(登录单位帐号)','userTask','1','2022-07-02 16:37:46.053','2022-07-02 16:37:58.776',2,12723,NULL,''),('46d28723-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_0tgdtni',NULL,NULL,'通过','sequenceFlow',NULL,'2022-07-02 16:37:58.777','2022-07-02 16:37:58.777',1,0,NULL,''),('46d2ae34-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0lfb8i2','46d2ae35-f9e2-11ec-a429-50ebf6b3961b',NULL,'平台端(上传文档)','userTask','1','2022-07-02 16:37:58.778',NULL,2,NULL,NULL,''),('5d96f2e1-02ab-11ed-9d79-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_14xs85z',NULL,NULL,'驳回','sequenceFlow',NULL,'2022-07-13 20:57:35.119','2022-07-13 20:57:35.119',1,0,NULL,''),('5d9719f2-02ab-11ed-9d79-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1q5ylfn','5eddcac3-02ab-11ed-9d79-50ebf6b3961b',NULL,'填写假条内容','userTask','1','2022-07-13 20:57:35.120','2022-07-13 21:42:21.870',2,2686750,NULL,''),('9f04ebf2-02b1-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_0g0bb7a',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-13 21:42:21.872','2022-07-13 21:42:21.872',1,0,NULL,''),('9f051303-02b1-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Gateway_072fnqe',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-07-13 21:42:21.873','2022-07-13 21:50:22.822',2,480949,NULL,''),('bdb01154-02b2-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_19ai2ba',NULL,NULL,'≥ 10天','sequenceFlow',NULL,'2022-07-13 21:50:22.822','2022-07-13 21:50:22.822',3,0,NULL,''),('bdb01155-02b2-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1ylj3fi','bdb01156-02b2-11ed-a35a-50ebf6b3961b',NULL,'总监审批','userTask','1','2022-07-13 21:50:22.822',NULL,4,NULL,NULL,''),('be091738-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-07-02 16:26:59.790','2022-07-02 16:26:59.792',1,2,NULL,''),('be096559-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_1ik6gh6',NULL,NULL,'填写假条信息','sequenceFlow',NULL,'2022-07-02 16:26:59.792','2022-07-02 16:26:59.792',2,0,NULL,''),('be09655a-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1q5ylfn','be0a28ab-f9e0-11ec-a429-50ebf6b3961b',NULL,'填写假条内容','userTask','1','2022-07-02 16:26:59.792','2022-07-02 16:27:17.025',3,17233,NULL,''),('c84ef16f-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_0g0bb7a',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:27:17.025','2022-07-02 16:27:17.025',1,0,NULL,''),('c84f1880-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Gateway_072fnqe',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-07-02 16:27:17.026','2022-07-02 16:27:17.035',2,9,NULL,''),('c8507811-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_1luztyb',NULL,NULL,'<10天','sequenceFlow',NULL,'2022-07-02 16:27:17.035','2022-07-02 16:27:17.035',3,0,NULL,''),('c8509f22-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_0zsqisd','c8509f23-f9e0-11ec-a429-50ebf6b3961b',NULL,'主管审批','userTask','1','2022-07-02 16:27:17.036','2022-07-13 20:56:24.458',4,966547422,NULL,'');
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
INSERT INTO `ACT_HI_COMMENT` VALUES ('24d6e1aa-f9e2-11ec-a429-50ebf6b3961b','event','2022-07-02 16:37:01.762',NULL,'1edb3446-f9e2-11ec-a429-50ebf6b3961b',NULL,'AddUserLink','1_|_assignee',NULL),('437aa991-f9e2-11ec-a429-50ebf6b3961b','event','2022-07-02 16:37:53.168',NULL,'3f3cffdd-f9e2-11ec-a429-50ebf6b3961b',NULL,'AddUserLink','1_|_assignee',NULL);
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
INSERT INTO `ACT_HI_DETAIL` VALUES ('15482f4a-f9e2-11ec-a429-50ebf6b3961b','VariableUpdate','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,'creator','string',0,'2022-07-02 16:36:35.662',NULL,NULL,NULL,'1',NULL),('be08f025-f9e0-11ec-a429-50ebf6b3961b','VariableUpdate','be08c913-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,'creator','string',0,'2022-07-02 16:26:59.789',NULL,NULL,NULL,'1',NULL);
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
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('15482f4b-f9e2-11ec-a429-50ebf6b3961b',NULL,'starter','1',NULL,'2022-07-02 16:36:35.662','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('15485661-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','15482f50-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:36:35.663',NULL,NULL,NULL,NULL,NULL),('15485662-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:36:35.663','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('1edabf13-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:36:51.722','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('1edb3447-f9e2-11ec-a429-50ebf6b3961b','董事长','candidate',NULL,'1edb3446-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:36:51.725',NULL,NULL,NULL,NULL,NULL),('1edb5b58-f9e2-11ec-a429-50ebf6b3961b','总经理','candidate',NULL,'1edb3446-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:36:51.726',NULL,NULL,NULL,NULL,NULL),('24d69389-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','1edb3446-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:01.761',NULL,NULL,NULL,NULL,NULL),('2b822ffb-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:37:12.952','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('2b831a5f-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','2b831a5e-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:12.958',NULL,NULL,NULL,NULL,NULL),('30acaab0-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:37:21.619','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('30ad46f4-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','30ad1fe3-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:21.623',NULL,NULL,NULL,NULL,NULL),('31cdd225-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:37:23.514','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('31ce9579-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','31ce9578-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:23.519',NULL,NULL,NULL,NULL,NULL),('33740d90-02ab-11ed-9d79-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-13 20:56:24.426','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('3f3c8aaa-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:37:46.050','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('3f3cffde-f9e2-11ec-a429-50ebf6b3961b','董事长','candidate',NULL,'3f3cffdd-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:46.053',NULL,NULL,NULL,NULL,NULL),('3f3cffdf-f9e2-11ec-a429-50ebf6b3961b','总经理','candidate',NULL,'3f3cffdd-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:46.053',NULL,NULL,NULL,NULL,NULL),('437a3460-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','3f3cffdd-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:53.165',NULL,NULL,NULL,NULL,NULL),('46d211f2-f9e2-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:37:58.774','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('46d2ae36-f9e2-11ec-a429-50ebf6b3961b',NULL,'assignee','1','46d2ae35-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:37:58.778',NULL,NULL,NULL,NULL,NULL),('9f03b371-02b1-11ed-a35a-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-13 21:42:21.865','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('bdb01157-02b2-11ed-a35a-50ebf6b3961b',NULL,'assignee','1','bdb01156-02b2-11ed-a35a-50ebf6b3961b','2022-07-13 21:50:22.822',NULL,NULL,NULL,NULL,NULL),('be08f026-f9e0-11ec-a429-50ebf6b3961b',NULL,'starter','1',NULL,'2022-07-02 16:26:59.790','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('be0b3a1c-f9e0-11ec-a429-50ebf6b3961b',NULL,'assignee','1','be0a28ab-f9e0-11ec-a429-50ebf6b3961b','2022-07-02 16:26:59.804',NULL,NULL,NULL,NULL,NULL),('be0b3a1d-f9e0-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:26:59.804','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('c84e7c3e-f9e0-11ec-a429-50ebf6b3961b',NULL,'participant','1',NULL,'2022-07-02 16:27:17.022','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL),('c850c634-f9e0-11ec-a429-50ebf6b3961b',NULL,'assignee','1','c8509f23-f9e0-11ec-a429-50ebf6b3961b','2022-07-02 16:27:17.037',NULL,NULL,NULL,NULL,NULL),('dcc4d224-02ac-11ed-9d79-50ebf6b3961b',NULL,'assignee','1','5eddcac3-02ab-11ed-9d79-50ebf6b3961b','2022-07-13 21:08:17.987',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `ACT_HI_PROCINST` VALUES ('15482f48-f9e2-11ec-a429-50ebf6b3961b',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b','1','zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','2022-07-02 16:36:35.662',NULL,NULL,'1','StartEvent_1iig6c2',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('be08c913-f9e0-11ec-a429-50ebf6b3961b',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b','1','Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','2022-07-02 16:26:59.788',NULL,NULL,'1','StartEvent_1iig6c2',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `ACT_HI_TASKINST` VALUES ('15482f50-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0jqew3r','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'填报申请（平台端）',NULL,NULL,NULL,'1','2022-07-02 16:36:35.662',NULL,'2022-07-02 16:36:51.723',16061,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:36:51.723'),('1edb3446-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0vdh1ks','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'后台管理单位初审(登录单位帐号)',NULL,NULL,NULL,'1','2022-07-02 16:36:51.725','2022-07-02 16:37:01.759','2022-07-02 16:37:12.954',21229,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:12.954'),('2b831a5e-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0lfb8i2','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'平台端(上传文档)',NULL,NULL,NULL,'1','2022-07-02 16:37:12.957',NULL,'2022-07-02 16:37:21.619',8662,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:21.619'),('30ad1fe3-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0asr136','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'后台管理端单位-初审公示(登录单位帐号)',NULL,NULL,NULL,'1','2022-07-02 16:37:21.622',NULL,'2022-07-02 16:37:23.515',1893,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:23.515'),('31ce9578-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0jqew3r','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'填报申请（平台端）',NULL,NULL,NULL,'1','2022-07-02 16:37:23.519',NULL,'2022-07-02 16:37:46.050',22531,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:46.050'),('3f3cffdd-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0vdh1ks','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'后台管理单位初审(登录单位帐号)',NULL,NULL,NULL,'1','2022-07-02 16:37:46.053','2022-07-02 16:37:53.164','2022-07-02 16:37:58.775',12722,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:58.775'),('46d2ae35-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'Activity_0lfb8i2','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'平台端(上传文档)',NULL,NULL,NULL,'1','2022-07-02 16:37:58.778',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:37:58.778'),('5eddcac3-02ab-11ed-9d79-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'Activity_1q5ylfn','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'填写假条内容',NULL,NULL,NULL,'1','2022-07-13 20:57:35.120',NULL,'2022-07-13 21:42:21.866',2686746,NULL,50,NULL,NULL,NULL,'','2022-07-13 21:42:21.866'),('bdb01156-02b2-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'Activity_1ylj3fi','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'总监审批',NULL,NULL,NULL,'1','2022-07-13 21:50:22.822',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2022-07-13 21:50:22.822'),('be0a28ab-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'Activity_1q5ylfn','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'填写假条内容',NULL,NULL,NULL,'1','2022-07-02 16:26:59.792',NULL,'2022-07-02 16:27:17.023',17231,NULL,50,NULL,NULL,NULL,'','2022-07-02 16:27:17.023'),('c8509f23-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'Activity_0zsqisd','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,'主管审批',NULL,NULL,NULL,'1','2022-07-02 16:27:17.036',NULL,'2022-07-13 20:56:24.441',966547405,NULL,50,NULL,NULL,NULL,'','2022-07-13 20:56:24.441');
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
INSERT INTO `ACT_HI_VARINST` VALUES ('15482f49-f9e2-11ec-a429-50ebf6b3961b',0,'15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,'creator','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-07-02 16:36:35.662','2022-07-02 16:36:35.662'),('be08c914-f9e0-11ec-a429-50ebf6b3961b',0,'be08c913-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,'creator','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2022-07-02 16:26:59.789','2022-07-02 16:26:59.789');
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
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('07142af5-f9e2-11ec-a429-50ebf6b3961b','职称申请流程','https://l1yp.com/docs/flowable/bpmn/','zhicheng','','2022-07-02 08:36:11.833',NULL,NULL,'07142af5-f9e2-11ec-a429-50ebf6b3961b',NULL),('b2f3df10-f9e0-11ec-a429-50ebf6b3961b','请假流程','https://l1yp.com/docs/flowable/bpmn/','holiday','','2022-07-02 08:26:41.196',NULL,NULL,'b2f3df10-f9e0-11ec-a429-50ebf6b3961b',NULL);
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
INSERT INTO `ACT_RE_PROCDEF` VALUES ('Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',1,'http://www.flowable.org/processdef',NULL,'Process_0dm6mw4',1,'b2f3df10-f9e0-11ec-a429-50ebf6b3961b','holiday.bpmn20.xml',NULL,NULL,0,1,1,'',NULL,NULL,NULL,0),('zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',1,'http://www.flowable.org/processdef','职称评审流程','zhicheng',1,'07142af5-f9e2-11ec-a429-50ebf6b3961b','zhicheng.bpmn20.xml',NULL,'用于职称评审的流程哈哈',0,1,1,'',NULL,NULL,NULL,0);
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
INSERT INTO `ACT_RU_ACTINST` VALUES ('15482f4d-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-07-02 16:36:35.662','2022-07-02 16:36:35.662',0,1,NULL,''),('15482f4e-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_1pl8zw7',NULL,NULL,NULL,'sequenceFlow',NULL,'2022-07-02 16:36:35.662','2022-07-02 16:36:35.662',0,2,NULL,''),('15482f4f-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0jqew3r','15482f50-f9e2-11ec-a429-50ebf6b3961b',NULL,'填报申请（平台端）','userTask','1','2022-07-02 16:36:35.662','2022-07-02 16:36:51.724',16062,3,NULL,''),('1edb0d34-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:36:51.724','2022-07-02 16:36:51.724',0,1,NULL,''),('1edb3445-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0vdh1ks','1edb3446-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理单位初审(登录单位帐号)','userTask','1','2022-07-02 16:36:51.725','2022-07-02 16:37:12.955',21230,2,NULL,''),('2b82f34c-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_0tgdtni',NULL,NULL,'通过','sequenceFlow',NULL,'2022-07-02 16:37:12.957','2022-07-02 16:37:12.957',0,1,NULL,''),('2b82f34d-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0lfb8i2','2b831a5e-f9e2-11ec-a429-50ebf6b3961b',NULL,'平台端(上传文档)','userTask','1','2022-07-02 16:37:12.957','2022-07-02 16:37:21.621',8664,2,NULL,''),('30acf8d1-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_13rvobl',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:37:21.621','2022-07-02 16:37:21.621',0,1,NULL,''),('30ad1fe2-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0asr136','30ad1fe3-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理端单位-初审公示(登录单位帐号)','userTask','1','2022-07-02 16:37:21.622','2022-07-02 16:37:23.517',1895,2,NULL,''),('31ce6e66-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_1djsqed',NULL,NULL,'退回(平台端重新上传)','sequenceFlow',NULL,'2022-07-02 16:37:23.518','2022-07-02 16:37:23.518',0,1,NULL,''),('31ce6e67-f9e2-11ec-a429-50ebf6b3961b',2,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0jqew3r','31ce9578-f9e2-11ec-a429-50ebf6b3961b',NULL,'填报申请（平台端）','userTask','1','2022-07-02 16:37:23.518','2022-07-02 16:37:46.052',22534,2,NULL,''),('3f3cd8cb-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_010hbgc',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:37:46.052','2022-07-02 16:37:46.052',0,1,NULL,''),('3f3cffdc-f9e2-11ec-a429-50ebf6b3961b',3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0vdh1ks','3f3cffdd-f9e2-11ec-a429-50ebf6b3961b',NULL,'后台管理单位初审(登录单位帐号)','userTask','1','2022-07-02 16:37:46.053','2022-07-02 16:37:58.776',12723,2,NULL,''),('46d28723-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Flow_0tgdtni',NULL,NULL,'通过','sequenceFlow',NULL,'2022-07-02 16:37:58.777','2022-07-02 16:37:58.777',0,1,NULL,''),('46d2ae34-f9e2-11ec-a429-50ebf6b3961b',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f4c-f9e2-11ec-a429-50ebf6b3961b','Activity_0lfb8i2','46d2ae35-f9e2-11ec-a429-50ebf6b3961b',NULL,'平台端(上传文档)','userTask','1','2022-07-02 16:37:58.778',NULL,NULL,2,NULL,''),('5d96f2e1-02ab-11ed-9d79-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_14xs85z',NULL,NULL,'驳回','sequenceFlow',NULL,'2022-07-13 20:57:35.119','2022-07-13 20:57:35.119',0,1,NULL,''),('5d9719f2-02ab-11ed-9d79-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1q5ylfn','5eddcac3-02ab-11ed-9d79-50ebf6b3961b',NULL,'填写假条内容','userTask','1','2022-07-13 20:57:35.120','2022-07-13 21:42:21.870',2686750,2,NULL,''),('9f04ebf2-02b1-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_0g0bb7a',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-13 21:42:21.872','2022-07-13 21:42:21.872',0,1,NULL,''),('9f051303-02b1-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Gateway_072fnqe',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-07-13 21:42:21.873','2022-07-13 21:50:22.822',480949,2,NULL,''),('bdb01154-02b2-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_19ai2ba',NULL,NULL,'≥ 10天','sequenceFlow',NULL,'2022-07-13 21:50:22.822','2022-07-13 21:50:22.822',0,3,NULL,''),('bdb01155-02b2-11ed-a35a-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1ylj3fi','bdb01156-02b2-11ed-a35a-50ebf6b3961b',NULL,'总监审批','userTask','1','2022-07-13 21:50:22.822',NULL,NULL,4,NULL,''),('be091738-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','StartEvent_1iig6c2',NULL,NULL,'开始','startEvent',NULL,'2022-07-02 16:26:59.790','2022-07-02 16:26:59.792',2,1,NULL,''),('be096559-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_1ik6gh6',NULL,NULL,'填写假条信息','sequenceFlow',NULL,'2022-07-02 16:26:59.792','2022-07-02 16:26:59.792',0,2,NULL,''),('be09655a-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_1q5ylfn','be0a28ab-f9e0-11ec-a429-50ebf6b3961b',NULL,'填写假条内容','userTask','1','2022-07-02 16:26:59.792','2022-07-02 16:27:17.025',17233,3,NULL,''),('c84ef16f-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_0g0bb7a',NULL,NULL,'提交','sequenceFlow',NULL,'2022-07-02 16:27:17.025','2022-07-02 16:27:17.025',0,1,NULL,''),('c84f1880-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Gateway_072fnqe',NULL,NULL,NULL,'exclusiveGateway',NULL,'2022-07-02 16:27:17.026','2022-07-02 16:27:17.035',9,2,NULL,''),('c8507811-f9e0-11ec-a429-50ebf6b3961b',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Flow_1luztyb',NULL,NULL,'<10天','sequenceFlow',NULL,'2022-07-02 16:27:17.035','2022-07-02 16:27:17.035',0,3,NULL,''),('c8509f22-f9e0-11ec-a429-50ebf6b3961b',2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','be091737-f9e0-11ec-a429-50ebf6b3961b','Activity_0zsqisd','c8509f23-f9e0-11ec-a429-50ebf6b3961b',NULL,'主管审批','userTask','1','2022-07-02 16:27:17.036','2022-07-13 20:56:24.458',966547422,4,NULL,'');
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
INSERT INTO `ACT_RU_EXECUTION` VALUES ('15482f48-f9e2-11ec-a429-50ebf6b3961b',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b','1',NULL,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,1,0,1,0,0,1,NULL,'',NULL,'StartEvent_1iig6c2','2022-07-02 16:36:35.662','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('15482f4c-f9e2-11ec-a429-50ebf6b3961b',7,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b','zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b','Activity_0lfb8i2',1,0,0,0,0,1,NULL,'',NULL,NULL,'2022-07-02 16:36:35.662',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('be08c913-f9e0-11ec-a429-50ebf6b3961b',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b','1',NULL,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,1,0,1,0,0,1,NULL,'',NULL,'StartEvent_1iig6c2','2022-07-02 16:26:59.788','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('be091737-f9e0-11ec-a429-50ebf6b3961b',4,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b','Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b','Activity_1ylj3fi',1,0,0,0,0,1,NULL,'',NULL,NULL,'2022-07-02 16:26:59.790',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('15482f4b-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'starter','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('15485662-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('1edabf13-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('2b822ffb-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('30acaab0-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('31cdd225-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('33740d90-02ab-11ed-9d79-50ebf6b3961b',1,NULL,'participant','1',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('3f3c8aaa-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('46d211f2-f9e2-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('9f03b371-02b1-11ed-a35a-50ebf6b3961b',1,NULL,'participant','1',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('be08f026-f9e0-11ec-a429-50ebf6b3961b',1,NULL,'starter','1',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('be0b3a1d-f9e0-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL),('c84e7c3e-f9e0-11ec-a429-50ebf6b3961b',1,NULL,'participant','1',NULL,'be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `ACT_RU_TASK` VALUES ('46d2ae35-f9e2-11ec-a429-50ebf6b3961b',1,'15482f4c-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,'平台端(上传文档)',NULL,NULL,'Activity_0lfb8i2',NULL,'1',NULL,50,'2022-07-02 08:37:58.778',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('bdb01156-02b2-11ed-a35a-50ebf6b3961b',1,'be091737-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,'总监审批',NULL,NULL,'Activity_1ylj3fi',NULL,'1',NULL,50,'2022-07-13 13:50:22.822',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
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
INSERT INTO `ACT_RU_VARIABLE` VALUES ('15482f49-f9e2-11ec-a429-50ebf6b3961b',1,'string','creator','15482f48-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL),('be08c914-f9e0-11ec-a429-50ebf6b3961b',1,'string','creator','be08c913-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL);
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
INSERT INTO `FLW_EV_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-07-02 16:19:29',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.5.0',NULL,NULL,'6749969731'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-07-02 16:19:29',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.5.0',NULL,NULL,'6749969731'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2022-07-02 16:19:29',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.5.0',NULL,NULL,'6749969731');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_bpmn`
--

LOCK TABLES `process_model_bpmn` WRITE;
/*!40000 ALTER TABLE `process_model_bpmn` DISABLE KEYS */;
INSERT INTO `process_model_bpmn` VALUES (2,'holiday',1,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b',1,'admin','2022-06-02 23:30:18','2022-06-02 23:30:18','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"Process_0dm6mw4\"><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1ik6gh6</outgoing></startEvent><sequenceFlow id=\"Flow_1ik6gh6\" name=\"填写假条信息\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_1q5ylfn\" /><userTask id=\"Activity_1q5ylfn\" name=\"填写假条内容\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;creator&#39;, execution)}\"><incoming>Flow_1ik6gh6</incoming><incoming>Flow_14xs85z</incoming><incoming>Flow_1yk6wlf</incoming><incoming>Flow_1f9ccn0</incoming><outgoing>Flow_0g0bb7a</outgoing></userTask><exclusiveGateway id=\"Gateway_072fnqe\"><incoming>Flow_0g0bb7a</incoming><outgoing>Flow_1luztyb</outgoing><outgoing>Flow_19ai2ba</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0g0bb7a\" name=\"提交\" sourceRef=\"Activity_1q5ylfn\" targetRef=\"Gateway_072fnqe\" /><sequenceFlow id=\"Flow_1luztyb\" name=\"&#60;10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_0zsqisd\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &lt; 10}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19ai2ba\" name=\"≥ 10天\" sourceRef=\"Gateway_072fnqe\" targetRef=\"Activity_1ylj3fi\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\"holiday\", \"days\", execution) &gt;= 10}</conditionExpression></sequenceFlow><userTask id=\"Activity_0zsqisd\" name=\"主管审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;supervisor&#39;, execution)}\"><incoming>Flow_1luztyb</incoming><outgoing>Flow_14xs85z</outgoing><outgoing>Flow_1e1j8nx</outgoing></userTask><userTask id=\"Activity_1ylj3fi\" name=\"总监审批\" flowable:assignee=\"${psr.read(&#39;holiday&#39;, &#39;dept_leader&#39;, execution)}\"><incoming>Flow_19ai2ba</incoming><outgoing>Flow_1yk6wlf</outgoing><outgoing>Flow_06bt0iu</outgoing></userTask><sequenceFlow id=\"Flow_14xs85z\" name=\"驳回\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1yk6wlf\" name=\"驳回\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1e1j8nx\" name=\"通过\" sourceRef=\"Activity_0zsqisd\" targetRef=\"Activity_18ueswk\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_06bt0iu\" name=\"通过\" sourceRef=\"Activity_1ylj3fi\" targetRef=\"Activity_18ueswk\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_18ueswk\" name=\"总部会签\" flowable:assignee=\"${hq_leader}\"><extensionElements><flowable:taskListener class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" event=\"complete\" /></extensionElements><incoming>Flow_1e1j8nx</incoming><incoming>Flow_06bt0iu</incoming><outgoing>Flow_1yaad4o</outgoing><outgoing>Flow_1f9ccn0</outgoing><multiInstanceLoopCharacteristics flowable:collection=\"${psr.read(&#39;holiday&#39;, &#39;hq_leaders&#39;, execution)}\" flowable:elementVariable=\"hq_leader\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><endEvent id=\"Event_01vzvdx\" name=\"归档\"><incoming>Flow_1yaad4o</incoming></endEvent><sequenceFlow id=\"Flow_1yaad4o\" name=\"通过\" sourceRef=\"Activity_18ueswk\" targetRef=\"Event_01vzvdx\" flowable:order=\"1\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1f9ccn0\" name=\"驳回\" sourceRef=\"Activity_18ueswk\" targetRef=\"Activity_1q5ylfn\" flowable:order=\"2\"><conditionExpression xsi:type=\"tFormalExpression\">${outcome == \"驳回\"}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"Process_0dm6mw4\"><bpmndi:BPMNEdge id=\"Flow_1f9ccn0_di\" bpmnElement=\"Flow_1f9ccn0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"-260\" /><omgdi:waypoint x=\"-30\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-450\" /><omgdi:waypoint x=\"-650\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-350\" y=\"-468\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yaad4o_di\" bpmnElement=\"Flow_1yaad4o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"20\" y=\"-220\" /><omgdi:waypoint x=\"122\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"61\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_06bt0iu_di\" bpmnElement=\"Flow_06bt0iu\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-120\" /><omgdi:waypoint x=\"-175\" y=\"-210\" /><omgdi:waypoint x=\"-80\" y=\"-210\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-168\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1e1j8nx_di\" bpmnElement=\"Flow_1e1j8nx\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-230\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-320\" /><omgdi:waypoint x=\"-175\" y=\"-230\" /><omgdi:waypoint x=\"-80\" y=\"-230\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-171\" y=\"-278\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1yk6wlf_di\" bpmnElement=\"Flow_1yk6wlf\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-330\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-100\" /><omgdi:waypoint x=\"-620\" y=\"-180\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-486\" y=\"-118\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_14xs85z_di\" bpmnElement=\"Flow_14xs85z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-280\" y=\"-360\" /><omgdi:waypoint x=\"-280\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-400\" /><omgdi:waypoint x=\"-620\" y=\"-260\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-461\" y=\"-418\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19ai2ba_di\" bpmnElement=\"Flow_19ai2ba\"><omgdi:waypoint x=\"-450\" y=\"-195\" /><omgdi:waypoint x=\"-450\" y=\"-120\" /><omgdi:waypoint x=\"-330\" y=\"-120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-447\" y=\"-187\" width=\"34\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1luztyb_di\" bpmnElement=\"Flow_1luztyb\"><omgdi:waypoint x=\"-450\" y=\"-245\" /><omgdi:waypoint x=\"-450\" y=\"-320\" /><omgdi:waypoint x=\"-330\" y=\"-320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-446\" y=\"-257\" width=\"31\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0g0bb7a_di\" bpmnElement=\"Flow_0g0bb7a\"><omgdi:waypoint x=\"-570\" y=\"-220\" /><omgdi:waypoint x=\"-475\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-533\" y=\"-238\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ik6gh6_di\" bpmnElement=\"Flow_1ik6gh6\"><omgdi:waypoint x=\"-762\" y=\"-220\" /><omgdi:waypoint x=\"-670\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-749\" y=\"-238\" width=\"66\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-798\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-791\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_15nzmu9_di\" bpmnElement=\"Activity_1q5ylfn\"><omgdc:Bounds x=\"-670\" y=\"-260\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_072fnqe_di\" bpmnElement=\"Gateway_072fnqe\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"-475\" y=\"-245\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_18a80hv_di\" bpmnElement=\"Activity_0zsqisd\"><omgdc:Bounds x=\"-330\" y=\"-360\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0lz62dp_di\" bpmnElement=\"Activity_1ylj3fi\"><omgdc:Bounds x=\"-330\" y=\"-160\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_00s55jz_di\" bpmnElement=\"Activity_18ueswk\"><omgdc:Bounds x=\"-80\" y=\"-260\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_01vzvdx_di\" bpmnElement=\"Event_01vzvdx\"><omgdc:Bounds x=\"122\" y=\"-238\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"129\" y=\"-195\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>'),(3,'zhicheng',1,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b',1,'admin','2022-06-06 23:00:05','2022-06-06 23:00:05','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:color=\"http://www.omg.org/spec/BPMN/non-normative/color/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\"><process id=\"zhicheng\" name=\"职称评审流程\"><documentation>用于职称评审的流程哈哈</documentation><startEvent id=\"StartEvent_1iig6c2\" name=\"开始\" flowable:initiator=\"creator\"><outgoing>Flow_1pl8zw7</outgoing></startEvent><sequenceFlow id=\"Flow_1pl8zw7\" sourceRef=\"StartEvent_1iig6c2\" targetRef=\"Activity_0jqew3r\" /><userTask id=\"Activity_0jqew3r\" name=\"填报申请（平台端）\" flowable:assignee=\"${creator}\"><incoming>Flow_1pl8zw7</incoming><incoming>Flow_0eq8vig</incoming><incoming>Flow_1djsqed</incoming><outgoing>Flow_010hbgc</outgoing></userTask><sequenceFlow id=\"Flow_010hbgc\" name=\"提交\" sourceRef=\"Activity_0jqew3r\" targetRef=\"Activity_0vdh1ks\" /><userTask id=\"Activity_0vdh1ks\" name=\"后台管理单位初审(登录单位帐号)\" flowable:candidateGroups=\"董事长,总经理\"><incoming>Flow_010hbgc</incoming><incoming>Flow_0pk454l</incoming><incoming>Flow_0fgrwy0</incoming><outgoing>Flow_0eq8vig</outgoing><outgoing>Flow_0tgdtni</outgoing></userTask><sequenceFlow id=\"Flow_13rvobl\" name=\"提交\" sourceRef=\"Activity_0lfb8i2\" targetRef=\"Activity_0asr136\" /><userTask id=\"Activity_0asr136\" name=\"后台管理端单位-初审公示(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_13rvobl</incoming><outgoing>Flow_1djsqed</outgoing><outgoing>Flow_1w0sc1q</outgoing></userTask><userTask id=\"Activity_0lfb8i2\" name=\"平台端(上传文档)\" flowable:assignee=\"${creator}\"><incoming>Flow_0tgdtni</incoming><outgoing>Flow_13rvobl</outgoing></userTask><userTask id=\"Activity_042mne5\" name=\"初审公示-待排序\" flowable:assignee=\"${creator}\"><incoming>Flow_1w0sc1q</incoming><outgoing>Flow_0z74unv</outgoing></userTask><sequenceFlow id=\"Flow_0z74unv\" name=\"提交\" sourceRef=\"Activity_042mne5\" targetRef=\"Activity_0ruapc4\" /><userTask id=\"Activity_0ruapc4\" name=\"后台管理端集团-形式审查(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_0z74unv</incoming><outgoing>Flow_1oo9arp</outgoing></userTask><sequenceFlow id=\"Flow_1oo9arp\" name=\"提交\" sourceRef=\"Activity_0ruapc4\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_14z3c2k\" name=\"形式审查-待审核(查看申报材料)\" flowable:assignee=\"${creator}\"><incoming>Flow_1oo9arp</incoming><incoming>Flow_1ovqlr8</incoming><incoming>Flow_1oimepx</incoming><outgoing>Flow_0k6lt4x</outgoing><outgoing>Flow_0bctl9z</outgoing></userTask><userTask id=\"Activity_034nqqc\" name=\"形式审查通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0k6lt4x</incoming><outgoing>Flow_15naeqi</outgoing></userTask><userTask id=\"Activity_0fkmkhz\" name=\"形式审查不通过-流程结束\" flowable:assignee=\"${creator}\"><incoming>Flow_0fgonpp</incoming><outgoing>Flow_09yyg42</outgoing></userTask><sequenceFlow id=\"Flow_15naeqi\" name=\"通过\" sourceRef=\"Activity_034nqqc\" targetRef=\"Activity_0vigf8t\" /><userTask id=\"Activity_0vigf8t\" name=\"分配专家\" flowable:assignee=\"${creator}\"><incoming>Flow_15naeqi</incoming><outgoing>Flow_1ry1w5s</outgoing></userTask><sequenceFlow id=\"Flow_1ry1w5s\" name=\"提交\" sourceRef=\"Activity_0vigf8t\" targetRef=\"Activity_18eu7cy\" /><userTask id=\"Activity_18eu7cy\" name=\"后台管理端-专家审核(登录已分配的专家)\" flowable:assignee=\"${creator}\"><incoming>Flow_1ry1w5s</incoming><outgoing>Flow_0d1bu2s</outgoing></userTask><sequenceFlow id=\"Flow_0d1bu2s\" name=\"提交\" sourceRef=\"Activity_18eu7cy\" targetRef=\"Activity_03ao98j\" /><userTask id=\"Activity_03ao98j\" name=\"专家审核后-待&#10;审核\" flowable:assignee=\"${creator}\"><incoming>Flow_0d1bu2s</incoming><outgoing>Flow_19lanck</outgoing><outgoing>Flow_1oekiri</outgoing></userTask><userTask id=\"Activity_0zjkm7j\" name=\"评委会投票\" flowable:assignee=\"${judge}\"><extensionElements><flowable:taskListener class=\"com.l1yp.flowable.listener.MultiInstanceTaskCompleteListener\" event=\"complete\" /></extensionElements><incoming>Flow_0nvdpkz</incoming><incoming>Flow_19lanck</incoming><outgoing>Flow_04hk8dt</outgoing><outgoing>Flow_15w0nu6</outgoing><multiInstanceLoopCharacteristics flowable:collection=\"${psr.read(&#39;zhicheng&#39;, &#39;judges&#39;, execution)}\" flowable:elementVariable=\"judge\"><completionCondition xsi:type=\"tFormalExpression\">${completionStrategy.isCompletion2(execution)}</completionCondition></multiInstanceLoopCharacteristics></userTask><userTask id=\"Activity_0zriqf8\" name=\"专家评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_0e7xb19</incoming><outgoing>Flow_1xgg7nu</outgoing></userTask><userTask id=\"Activity_0onst4q\" name=\"后台管理端集团-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0qd6zvj</incoming><outgoing>Flow_0vogm92</outgoing></userTask><userTask id=\"Activity_1rb8ybq\" name=\"评委会评审不通过\" flowable:assignee=\"${creator}\"><incoming>Flow_15w0nu6</incoming><outgoing>Flow_1r92351</outgoing></userTask><userTask id=\"Activity_1001vbk\" name=\"后台管理端单位-公示结果反馈(登录单位帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_04hk8dt</incoming><outgoing>Flow_1so0aoq</outgoing></userTask><sequenceFlow id=\"Flow_1so0aoq\" name=\"修改公示状态 提交公示证明材料\" sourceRef=\"Activity_1001vbk\" targetRef=\"Activity_13zn5ne\" /><userTask id=\"Activity_13zn5ne\" name=\"后台管理端集团-公示结果反馈(登录集团帐号)\" flowable:assignee=\"${creator}\"><incoming>Flow_1so0aoq</incoming><outgoing>Flow_1mmqec7</outgoing></userTask><sequenceFlow id=\"Flow_1mmqec7\" name=\"提交\" sourceRef=\"Activity_13zn5ne\" targetRef=\"Activity_01isiwf\" /><userTask id=\"Activity_01isiwf\" name=\"入库\" flowable:assignee=\"${creator}\"><incoming>Flow_1mmqec7</incoming><outgoing>Flow_0idm0os</outgoing></userTask><endEvent id=\"Event_1kud1qc\" name=\"结束\"><incoming>Flow_0idm0os</incoming><incoming>Flow_1xgg7nu</incoming><incoming>Flow_1r92351</incoming><incoming>Flow_09yyg42</incoming></endEvent><sequenceFlow id=\"Flow_0idm0os\" name=\"归档\" sourceRef=\"Activity_01isiwf\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1xgg7nu\" sourceRef=\"Activity_0zriqf8\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_1r92351\" name=\"归档\" sourceRef=\"Activity_1rb8ybq\" targetRef=\"Event_1kud1qc\" /><sequenceFlow id=\"Flow_0vogm92\" name=\"退回申报单位\" sourceRef=\"Activity_0onst4q\" targetRef=\"Activity_1et6ltk\" /><userTask id=\"Activity_1et6ltk\" name=\"后台管理端单位-专家评审退&#10;回（待处理）\" flowable:assignee=\"${creator}\"><incoming>Flow_0vogm92</incoming><outgoing>Flow_096caz5</outgoing></userTask><sequenceFlow id=\"Flow_09yyg42\" name=\"归档\" sourceRef=\"Activity_0fkmkhz\" targetRef=\"Event_1kud1qc\" /><userTask id=\"Activity_021d8mc\" name=\"后台管理端单位-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_0xb1ck8</incoming><incoming>Flow_0vdmkgg</incoming><outgoing>Flow_1ajzz9c</outgoing><outgoing>Flow_0z7pkv3</outgoing></userTask><userTask id=\"Activity_1he76ul\" name=\"后台管理端集团-专家&#10;评审退回（待审核）\" flowable:assignee=\"${creator}\"><incoming>Flow_1ajzz9c</incoming><outgoing>Flow_0nvdpkz</outgoing><outgoing>Flow_0xb1ck8</outgoing></userTask><userTask id=\"Activity_12b79md\" name=\"单位管理员&#10;(形式审查退回-待审核)\" flowable:assignee=\"${creator}\"><incoming>Flow_0ir4u7o</incoming><outgoing>Flow_1oimepx</outgoing></userTask><userTask id=\"Activity_1o3oq6z\" name=\"单位管理员&#10;(形式审查退回-待处&#10;理)\" flowable:assignee=\"${creator}\"><incoming>Flow_161kj6z</incoming><outgoing>Flow_1ovqlr8</outgoing><outgoing>Flow_0y7cau8</outgoing></userTask><sequenceFlow id=\"Flow_0eq8vig\" name=\"驳回\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0jqew3r\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0tgdtni\" name=\"通过\" sourceRef=\"Activity_0vdh1ks\" targetRef=\"Activity_0lfb8i2\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1djsqed\" name=\"退回(平台端重新上传)\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_0jqew3r\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回(平台端重新上传)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1w0sc1q\" name=\"通过\" sourceRef=\"Activity_0asr136\" targetRef=\"Activity_042mne5\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0k6lt4x\" name=\"通过\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Activity_034nqqc\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1ovqlr8\" name=\"退回形式审查\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14z3c2k\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回形式审查\"}</conditionExpression></sequenceFlow><userTask id=\"Activity_14spxxm\" name=\"形式审查退回\" flowable:assignee=\"${creator}\"><incoming>Flow_0y7cau8</incoming><outgoing>Flow_0ir4u7o</outgoing><outgoing>Flow_0pk454l</outgoing></userTask><sequenceFlow id=\"Flow_0y7cau8\" name=\"退回申报人\" sourceRef=\"Activity_1o3oq6z\" targetRef=\"Activity_14spxxm\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回申报人\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0ir4u7o\" name=\"提交单位管理员(形式审查退回)\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_12b79md\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交单位管理员(形式审查退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0pk454l\" name=\"重头提交\" sourceRef=\"Activity_14spxxm\" targetRef=\"Activity_0vdh1ks\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_1oimepx\" name=\"提交\" sourceRef=\"Activity_12b79md\" targetRef=\"Activity_14z3c2k\" /><userTask id=\"Activity_07ykdvs\" name=\"专家退回\" flowable:assignee=\"${creator}\"><incoming>Flow_096caz5</incoming><incoming>Flow_0z7pkv3</incoming><outgoing>Flow_0fgrwy0</outgoing><outgoing>Flow_0vdmkgg</outgoing></userTask><sequenceFlow id=\"Flow_096caz5\" name=\"退回申报人\" sourceRef=\"Activity_1et6ltk\" targetRef=\"Activity_07ykdvs\" /><sequenceFlow id=\"Flow_1ajzz9c\" name=\"通过\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_1he76ul\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0z7pkv3\" name=\"驳回\" sourceRef=\"Activity_021d8mc\" targetRef=\"Activity_07ykdvs\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgrwy0\" name=\"重头提交\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_0vdh1ks\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"重头提交\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0nvdpkz\" name=\"通过\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_0zjkm7j\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0xb1ck8\" name=\"驳回\" sourceRef=\"Activity_1he76ul\" targetRef=\"Activity_021d8mc\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0vdmkgg\" name=\"提交(专家退回)\" sourceRef=\"Activity_07ykdvs\" targetRef=\"Activity_021d8mc\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"提交(专家退回)\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_04hk8dt\" name=\"同意\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1001vbk\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"同意\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_15w0nu6\" name=\"拒绝\" sourceRef=\"Activity_0zjkm7j\" targetRef=\"Activity_1rb8ybq\" flowable:order=\"2\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"拒绝\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_19lanck\" name=\"通过\" sourceRef=\"Activity_03ao98j\" targetRef=\"Activity_0zjkm7j\" flowable:order=\"1\"><extensionElements><flowable:properties><flowable:property name=\"order\" value=\"1\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"通过\"}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_0qn3dcb\"><incoming>Flow_1oekiri</incoming><outgoing>Flow_0qd6zvj</outgoing><outgoing>Flow_0e7xb19</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_1oekiri\" name=\"驳回\" sourceRef=\"Activity_03ao98j\" targetRef=\"Gateway_0qn3dcb\" flowable:order=\"2\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.ExpertRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"驳回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0qd6zvj\" name=\"首次\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0onst4q\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution)  &lt; 2}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0e7xb19\" name=\"二次退回\" sourceRef=\"Gateway_0qn3dcb\" targetRef=\"Activity_0zriqf8\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'expert_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><exclusiveGateway id=\"Gateway_1micijx\"><incoming>Flow_0bctl9z</incoming><outgoing>Flow_0fgonpp</outgoing><outgoing>Flow_161kj6z</outgoing></exclusiveGateway><sequenceFlow id=\"Flow_0bctl9z\" name=\"退回\" sourceRef=\"Activity_14z3c2k\" targetRef=\"Gateway_1micijx\" flowable:order=\"2\"><extensionElements><flowable:executionListener class=\"com.l1yp.flowable.listener.FormRejectExecutionListener\" event=\"start\"><flowable:field name=\"process_key\"><flowable:string>zhicheng</flowable:string></flowable:field></flowable:executionListener><flowable:properties><flowable:property name=\"order\" value=\"2\" /></flowable:properties></extensionElements><conditionExpression xsi:type=\"tFormalExpression\">${outcome==\"退回\"}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_0fgonpp\" name=\"二次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_0fkmkhz\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &gt; 1}</conditionExpression></sequenceFlow><sequenceFlow id=\"Flow_161kj6z\" name=\"首次退回\" sourceRef=\"Gateway_1micijx\" targetRef=\"Activity_1o3oq6z\"><conditionExpression xsi:type=\"tFormalExpression\">${psr.read(\'zhicheng\', \'form_reject_count\', execution) &lt; 2}</conditionExpression></sequenceFlow></process><bpmndi:BPMNDiagram id=\"BPMNDiagram_1\"><bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"zhicheng\"><bpmndi:BPMNEdge id=\"Flow_161kj6z_di\" bpmnElement=\"Flow_161kj6z\"><omgdi:waypoint x=\"145\" y=\"980\" /><omgdi:waypoint x=\"-630\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"87\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgonpp_di\" bpmnElement=\"Flow_0fgonpp\"><omgdi:waypoint x=\"195\" y=\"980\" /><omgdi:waypoint x=\"740\" y=\"980\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"207\" y=\"962\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0bctl9z_di\" bpmnElement=\"Flow_0bctl9z\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"740\" /><omgdi:waypoint x=\"170\" y=\"955\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"20\" y=\"722\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0e7xb19_di\" bpmnElement=\"Flow_0e7xb19\"><omgdi:waypoint x=\"105\" y=\"1710\" /><omgdi:waypoint x=\"-190\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"41\" y=\"1692\" width=\"44\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0qd6zvj_di\" bpmnElement=\"Flow_0qd6zvj\"><omgdi:waypoint x=\"155\" y=\"1710\" /><omgdi:waypoint x=\"280\" y=\"1710\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"186\" y=\"1692\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oekiri_di\" bpmnElement=\"Flow_1oekiri\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1600\" /><omgdi:waypoint x=\"130\" y=\"1685\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"10\" y=\"1573\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_19lanck_di\" bpmnElement=\"Flow_19lanck\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1640\" /><omgdi:waypoint x=\"-50\" y=\"1800\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"1653\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15w0nu6_di\" bpmnElement=\"Flow_15w0nu6\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-30\" y=\"1880\" /><omgdi:waypoint x=\"-30\" y=\"1950\" /><omgdi:waypoint x=\"120\" y=\"1950\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-10\" y=\"1893\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_04hk8dt_di\" bpmnElement=\"Flow_04hk8dt\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"1880\" /><omgdi:waypoint x=\"-50\" y=\"2040\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"1893\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vdmkgg_di\" bpmnElement=\"Flow_0vdmkgg\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"380\" y=\"-240\" /><omgdi:waypoint x=\"530\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"419\" y=\"-258\" width=\"73\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0xb1ck8_di\" bpmnElement=\"Flow_0xb1ck8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"560\" y=\"130\" /><omgdi:waypoint x=\"560\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"540\" y=\"-55\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0nvdpkz_di\" bpmnElement=\"Flow_0nvdpkz\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"210\" /><omgdi:waypoint x=\"580\" y=\"1840\" /><omgdi:waypoint x=\"0\" y=\"1840\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"589\" y=\"228\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0fgrwy0_di\" bpmnElement=\"Flow_0fgrwy0\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"280\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-240\" /><omgdi:waypoint x=\"200\" y=\"-110\" /><omgdi:waypoint x=\"0\" y=\"-110\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"228\" y=\"-267\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z7pkv3_di\" bpmnElement=\"Flow_0z7pkv3\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-280\" /><omgdi:waypoint x=\"580\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-360\" /><omgdi:waypoint x=\"330\" y=\"-280\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"590\" y=\"-307\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ajzz9c_di\" bpmnElement=\"Flow_1ajzz9c\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"580\" y=\"-200\" /><omgdi:waypoint x=\"580\" y=\"130\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"585\" y=\"-169\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_096caz5_di\" bpmnElement=\"Flow_096caz5\"><omgdi:waypoint x=\"330\" y=\"1290\" /><omgdi:waypoint x=\"330\" y=\"-200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"342\" y=\"1265\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oimepx_di\" bpmnElement=\"Flow_1oimepx\"><omgdi:waypoint x=\"-380\" y=\"100\" /><omgdi:waypoint x=\"-380\" y=\"740\" /><omgdi:waypoint x=\"-100\" y=\"740\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-412\" y=\"104\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0pk454l_di\" bpmnElement=\"Flow_0pk454l\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-360\" y=\"-150\" /><omgdi:waypoint x=\"-360\" y=\"-80\" /><omgdi:waypoint x=\"-100\" y=\"-80\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-342\" y=\"-127\" width=\"45\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0ir4u7o_di\" bpmnElement=\"Flow_0ir4u7o\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-380\" y=\"-150\" /><omgdi:waypoint x=\"-380\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-469\" y=\"-137\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0y7cau8_di\" bpmnElement=\"Flow_0y7cau8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-700\" y=\"940\" /><omgdi:waypoint x=\"-700\" y=\"-190\" /><omgdi:waypoint x=\"-430\" y=\"-190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-777\" y=\"913\" width=\"56\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ovqlr8_di\" bpmnElement=\"Flow_1ovqlr8\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-660\" y=\"940\" /><omgdi:waypoint x=\"-660\" y=\"770\" /><omgdi:waypoint x=\"-100\" y=\"770\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-643\" y=\"916\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0k6lt4x_di\" bpmnElement=\"Flow_0k6lt4x\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"780\" /><omgdi:waypoint x=\"-50\" y=\"1120\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-41\" y=\"793\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1w0sc1q_di\" bpmnElement=\"Flow_1w0sc1q\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"280\" /><omgdi:waypoint x=\"-50\" y=\"370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"322\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1djsqed_di\" bpmnElement=\"Flow_1djsqed\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"0\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"240\" /><omgdi:waypoint x=\"100\" y=\"-220\" /><omgdi:waypoint x=\"0\" y=\"-220\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"19\" y=\"256\" width=\"81\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0tgdtni_di\" bpmnElement=\"Flow_0tgdtni\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-50\" y=\"-70\" /><omgdi:waypoint x=\"-50\" y=\"20\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-45\" y=\"-30\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0eq8vig_di\" bpmnElement=\"Flow_0eq8vig\" bioc:stroke=\"#000000\" color:border-color=\"#000000\"><omgdi:waypoint x=\"-100\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-110\" /><omgdi:waypoint x=\"-220\" y=\"-240\" /><omgdi:waypoint x=\"-100\" y=\"-240\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-214\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_09yyg42_di\" bpmnElement=\"Flow_09yyg42\"><omgdi:waypoint x=\"790\" y=\"1020\" /><omgdi:waypoint x=\"790\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2550\" /><omgdi:waypoint x=\"-50\" y=\"2498\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"799\" y=\"1044\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0vogm92_di\" bpmnElement=\"Flow_0vogm92\"><omgdi:waypoint x=\"330\" y=\"1670\" /><omgdi:waypoint x=\"330\" y=\"1370\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"347\" y=\"1609\" width=\"67\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1r92351_di\" bpmnElement=\"Flow_1r92351\"><omgdi:waypoint x=\"170\" y=\"1990\" /><omgdi:waypoint x=\"170\" y=\"2480\" /><omgdi:waypoint x=\"-32\" y=\"2480\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"173\" y=\"2003\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1xgg7nu_di\" bpmnElement=\"Flow_1xgg7nu\"><omgdi:waypoint x=\"-240\" y=\"1750\" /><omgdi:waypoint x=\"-240\" y=\"2480\" /><omgdi:waypoint x=\"-68\" y=\"2480\" /></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0idm0os_di\" bpmnElement=\"Flow_0idm0os\"><omgdi:waypoint x=\"-50\" y=\"2400\" /><omgdi:waypoint x=\"-50\" y=\"2462\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-47\" y=\"2428\" width=\"24\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1mmqec7_di\" bpmnElement=\"Flow_1mmqec7\"><omgdi:waypoint x=\"-50\" y=\"2270\" /><omgdi:waypoint x=\"-50\" y=\"2320\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"2292\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1so0aoq_di\" bpmnElement=\"Flow_1so0aoq\"><omgdi:waypoint x=\"-50\" y=\"2120\" /><omgdi:waypoint x=\"-50\" y=\"2190\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-44\" y=\"2152\" width=\"88\" height=\"27\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0d1bu2s_di\" bpmnElement=\"Flow_0d1bu2s\"><omgdi:waypoint x=\"-50\" y=\"1490\" /><omgdi:waypoint x=\"-50\" y=\"1560\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1522\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1ry1w5s_di\" bpmnElement=\"Flow_1ry1w5s\"><omgdi:waypoint x=\"-50\" y=\"1350\" /><omgdi:waypoint x=\"-50\" y=\"1410\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1377\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_15naeqi_di\" bpmnElement=\"Flow_15naeqi\"><omgdi:waypoint x=\"-50\" y=\"1200\" /><omgdi:waypoint x=\"-50\" y=\"1270\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"1232\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1oo9arp_di\" bpmnElement=\"Flow_1oo9arp\"><omgdi:waypoint x=\"-50\" y=\"600\" /><omgdi:waypoint x=\"-50\" y=\"700\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"646\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_0z74unv_di\" bpmnElement=\"Flow_0z74unv\"><omgdi:waypoint x=\"-50\" y=\"450\" /><omgdi:waypoint x=\"-50\" y=\"520\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"482\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_13rvobl_di\" bpmnElement=\"Flow_13rvobl\"><omgdi:waypoint x=\"-50\" y=\"100\" /><omgdi:waypoint x=\"-50\" y=\"200\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"149\" width=\"23\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_010hbgc_di\" bpmnElement=\"Flow_010hbgc\"><omgdi:waypoint x=\"-50\" y=\"-200\" /><omgdi:waypoint x=\"-50\" y=\"-150\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-46\" y=\"-178\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNEdge><bpmndi:BPMNEdge id=\"Flow_1pl8zw7_di\" bpmnElement=\"Flow_1pl8zw7\"><omgdi:waypoint x=\"-50\" y=\"-332\" /><omgdi:waypoint x=\"-50\" y=\"-280\" /></bpmndi:BPMNEdge><bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1iig6c2\"><omgdc:Bounds x=\"-68\" y=\"-368\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-61\" y=\"-398\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ncgt1g_di\" bpmnElement=\"Activity_0jqew3r\"><omgdc:Bounds x=\"-100\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_07cnx2i_di\" bpmnElement=\"Activity_0vdh1ks\"><omgdc:Bounds x=\"-100\" y=\"-150\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0vsxtj8_di\" bpmnElement=\"Activity_0asr136\"><omgdc:Bounds x=\"-100\" y=\"200\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1eb1bsb_di\" bpmnElement=\"Activity_0lfb8i2\"><omgdc:Bounds x=\"-100\" y=\"20\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_126dq3t_di\" bpmnElement=\"Activity_042mne5\"><omgdc:Bounds x=\"-100\" y=\"370\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1og4oyn_di\" bpmnElement=\"Activity_0ruapc4\"><omgdc:Bounds x=\"-100\" y=\"520\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_04yv3ur_di\" bpmnElement=\"Activity_14z3c2k\"><omgdc:Bounds x=\"-100\" y=\"700\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_01kkjwd_di\" bpmnElement=\"Activity_034nqqc\"><omgdc:Bounds x=\"-100\" y=\"1120\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_13yla91_di\" bpmnElement=\"Activity_0fkmkhz\"><omgdc:Bounds x=\"740\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0g0ma6v_di\" bpmnElement=\"Activity_0vigf8t\"><omgdc:Bounds x=\"-100\" y=\"1270\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0uwkfo4_di\" bpmnElement=\"Activity_18eu7cy\"><omgdc:Bounds x=\"-100\" y=\"1410\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_02032f5_di\" bpmnElement=\"Activity_03ao98j\"><omgdc:Bounds x=\"-100\" y=\"1560\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0ndmpx8_di\" bpmnElement=\"Activity_0zjkm7j\"><omgdc:Bounds x=\"-100\" y=\"1800\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1wpyxwb_di\" bpmnElement=\"Activity_0zriqf8\"><omgdc:Bounds x=\"-290\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0p522v4_di\" bpmnElement=\"Activity_0onst4q\"><omgdc:Bounds x=\"280\" y=\"1670\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0eykp6k_di\" bpmnElement=\"Activity_1rb8ybq\"><omgdc:Bounds x=\"120\" y=\"1910\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0gdo8iy_di\" bpmnElement=\"Activity_1001vbk\"><omgdc:Bounds x=\"-100\" y=\"2040\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0n00x7n_di\" bpmnElement=\"Activity_13zn5ne\"><omgdc:Bounds x=\"-100\" y=\"2190\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_06aylzb_di\" bpmnElement=\"Activity_01isiwf\"><omgdc:Bounds x=\"-100\" y=\"2320\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Event_1kud1qc_di\" bpmnElement=\"Event_1kud1qc\"><omgdc:Bounds x=\"-68\" y=\"2462\" width=\"36\" height=\"36\" /><bpmndi:BPMNLabel><omgdc:Bounds x=\"-81\" y=\"2505\" width=\"22\" height=\"14\" /></bpmndi:BPMNLabel></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0198fy2_di\" bpmnElement=\"Activity_1et6ltk\"><omgdc:Bounds x=\"280\" y=\"1290\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0hp2pdv_di\" bpmnElement=\"Activity_021d8mc\"><omgdc:Bounds x=\"530\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_182bw3z_di\" bpmnElement=\"Activity_1he76ul\"><omgdc:Bounds x=\"530\" y=\"130\" width=\"100\" height=\"80\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0k7n6cv_di\" bpmnElement=\"Activity_12b79md\"><omgdc:Bounds x=\"-430\" y=\"20\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_052hvht_di\" bpmnElement=\"Activity_1o3oq6z\"><omgdc:Bounds x=\"-730\" y=\"940\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_0b83gxs_di\" bpmnElement=\"Activity_14spxxm\"><omgdc:Bounds x=\"-430\" y=\"-230\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Activity_1fpg48q_di\" bpmnElement=\"Activity_07ykdvs\"><omgdc:Bounds x=\"280\" y=\"-280\" width=\"100\" height=\"80\" /><bpmndi:BPMNLabel /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_0qn3dcb_di\" bpmnElement=\"Gateway_0qn3dcb\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"105\" y=\"1685\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape><bpmndi:BPMNShape id=\"Gateway_1micijx_di\" bpmnElement=\"Gateway_1micijx\" isMarkerVisible=\"true\"><omgdc:Bounds x=\"145\" y=\"955\" width=\"50\" height=\"50\" /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>');
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
INSERT INTO `process_model_definition` VALUES (3,'holiday','请假流程','HL','yyyyMMdd','','','#####','2022-05-31 09:13:45','2022-05-30 21:02:28'),(4,'zhicheng','职称申请流程','ZL','yyyyMMdd','','','#####','2022-06-02 21:10:14','2022-06-02 21:10:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='流程字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_field_definition`
--

LOCK TABLES `process_model_field_definition` WRITE;
/*!40000 ALTER TABLE `process_model_field_definition` DISABLE KEYS */;
INSERT INTO `process_model_field_definition` VALUES (7,'holiday','id',1,'id','主键',5,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:28','2022-05-30 21:02:28','admin'),(8,'holiday','process_bpmn_id',2,'版本ID','流程版本ID',5,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:28','2022-05-30 21:02:28','admin'),(9,'holiday','process_definition_id',3,'定义ID','流程定义ID',1,'VARCHAR(128)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(10,'holiday','process_instance_id',4,'实例ID','流程实例ID',1,'VARCHAR(36)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(11,'holiday','name',5,'名称','流程名称',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(12,'holiday','creator',6,'创建者','流程发起者',6,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-08-26 22:02:55','admin'),(13,'holiday','update_by',7,'更新人','最后更新人',6,'BIGINT',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-08-26 22:02:55','admin'),(14,'holiday','update_time',8,'更新时间','最后更新时间',11,'DATETIME',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(15,'holiday','create_time',9,'创建时间','创建时间',11,'DATETIME',NULL,0,'global',NULL,'2022-05-30 21:02:29','2022-05-30 21:02:29','admin'),(18,'holiday','dept_leader',10,'部门领导','直属上级',6,'BIGINT',NULL,1,'global',NULL,'2022-05-30 23:25:41','2022-07-02 16:16:37','admin'),(19,'holiday','hq_leaders',11,'总部领导','总部领导列表',7,'VARCHAR(128)',NULL,1,'global',NULL,'2022-05-31 09:08:51','2022-05-31 11:37:23','admin'),(20,'holiday','supervisor',12,'主管','主管',6,'BIGINT','',1,'global',NULL,'2022-05-31 09:48:22','2022-05-31 09:48:22','admin'),(21,'holiday','code',5,'编号','编号',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-05-31 11:24:56','2022-05-31 11:24:56','admin'),(22,'holiday','days',13,'天数','请假天数',5,'int','0',1,'global',NULL,'2022-05-31 11:26:45','2022-07-02 16:16:53','admin'),(24,'zhicheng','id',1,'id','主键',5,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(25,'zhicheng','process_bpmn_id',2,'版本ID','流程版本ID',5,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(26,'zhicheng','process_definition_id',3,'定义ID','流程定义ID',1,'VARCHAR(128)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(27,'zhicheng','process_instance_id',4,'实例ID','流程实例ID',1,'VARCHAR(36)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(28,'zhicheng','name',5,'名称','流程名称',1,'VARCHAR(64)',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(29,'zhicheng','creator',6,'创建者','流程发起者',6,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(30,'zhicheng','update_by',7,'更新人','最后更新人',6,'BIGINT',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-08-26 22:02:55','A52740'),(31,'zhicheng','update_time',8,'更新时间','最后更新时间',11,'DATETIME',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(32,'zhicheng','create_time',9,'创建时间','创建时间',11,'DATETIME',NULL,0,'global',NULL,'2022-06-02 21:10:14','2022-06-02 21:10:14','A52740'),(33,'zhicheng','judges',10,'评委','评委用户列表',7,'varchar(128)','',1,'global',NULL,'2022-06-03 10:19:53','2022-06-03 11:57:00','A52738'),(34,'zhicheng','expert_status',11,'状态','专家审核',3,'BIGINT','',1,'global','pass_status','2022-06-03 10:44:05','2022-06-03 10:44:05','A52738'),(35,'zhicheng','expert_reject_count',12,'专家退回','专家退回次数',5,'int','0',0,'global',NULL,'2022-06-03 12:48:46','2022-06-03 12:48:46','admin'),(36,'zhicheng','form_reject_count',13,'形式退回','形式审查退回次数',5,'int','0',0,'global',NULL,'2022-06-03 12:53:32','2022-06-03 12:53:32','admin'),(37,'holiday','sex',14,'性别','性别',3,'BIGINT','',1,'global','sex','2022-08-19 19:48:47','2022-08-19 19:48:47','admin'),(38,'holiday','cost_center',15,'成本中心','成本中心',4,'BIGINT','',1,'global','cost_center','2022-08-19 19:49:16','2022-08-19 19:49:16','admin'),(39,'holiday','department',16,'部门','部门',9,'BIGINT','',1,'global',NULL,'2022-08-21 21:26:07','2022-08-21 21:26:07','admin');
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
  UNIQUE KEY `kbi_uindex` (`process_key`,`process_bpmn_id`,`node_id`),
  KEY `page_bound_uindex` (`process_bpmn_id`,`node_id`),
  KEY `page_bound_uindex2` (`process_key`,`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_node_page`
--

LOCK TABLES `process_model_node_page` WRITE;
/*!40000 ALTER TABLE `process_model_node_page` DISABLE KEYS */;
INSERT INTO `process_model_node_page` VALUES (51,'holiday',0,'$$START_PAGE_KEY$$',7,'850px','120px',NULL,'admin','2022-05-31 11:34:29','2022-05-31 11:34:29'),(101,'holiday',2,'Activity_1q5ylfn',8,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:20'),(102,'holiday',2,'Flow_0g0bb7a',9,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:24'),(103,'holiday',2,'Activity_0zsqisd',8,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:27'),(104,'holiday',2,'Activity_1ylj3fi',8,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:30'),(105,'holiday',2,'Activity_18ueswk',8,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:33'),(106,'holiday',2,'Event_01vzvdx',8,'851px','120px',1,'admin','2022-06-27 22:24:26','2022-05-31 14:15:38'),(116,'zhicheng',0,'$$START_PAGE_KEY$$',10,'850px','120px',NULL,'admin','2022-06-03 10:45:13','2022-06-03 10:45:13'),(339,'zhicheng',3,'Activity_0jqew3r',11,'851px','120px',1,'admin','2022-06-07 08:19:58','2022-06-07 08:19:58'),(340,'zhicheng',3,'Activity_14spxxm',11,'851px','120px',1,'admin','2022-06-07 08:20:05','2022-06-07 08:20:05'),(341,'zhicheng',3,'Activity_07ykdvs',11,'851px','120px',1,'admin','2022-06-07 08:20:08','2022-06-07 08:20:08'),(342,'zhicheng',3,'Activity_021d8mc',11,'851px','120px',1,'admin','2022-06-07 08:20:11','2022-06-07 08:20:11'),(343,'zhicheng',3,'Activity_0vdh1ks',11,'851px','120px',1,'admin','2022-06-07 08:20:14','2022-06-07 08:20:14'),(344,'zhicheng',3,'Activity_12b79md',11,'851px','120px',1,'admin','2022-06-07 08:20:17','2022-06-07 08:20:17'),(345,'zhicheng',3,'Activity_0lfb8i2',11,'851px','120px',1,'admin','2022-06-07 08:20:20','2022-06-07 08:20:20'),(346,'zhicheng',3,'Activity_0asr136',11,'851px','120px',1,'admin','2022-06-07 08:20:24','2022-06-07 08:20:24'),(347,'zhicheng',3,'Activity_1he76ul',11,'851px','120px',1,'admin','2022-06-07 08:20:27','2022-06-07 08:20:27'),(348,'zhicheng',3,'Activity_042mne5',11,'851px','120px',1,'admin','2022-06-07 08:20:35','2022-06-07 08:20:35'),(349,'zhicheng',3,'Activity_0ruapc4',11,'851px','120px',1,'admin','2022-06-07 08:20:39','2022-06-07 08:20:39'),(350,'zhicheng',3,'Activity_14z3c2k',11,'851px','120px',1,'admin','2022-06-07 08:20:42','2022-06-07 08:20:42'),(351,'zhicheng',3,'Activity_1o3oq6z',11,'851px','120px',1,'admin','2022-06-07 08:20:46','2022-06-07 08:20:46'),(352,'zhicheng',3,'Activity_0fkmkhz',11,'851px','120px',1,'admin','2022-06-07 08:20:50','2022-06-07 08:20:50'),(353,'zhicheng',3,'Activity_034nqqc',11,'851px','120px',1,'admin','2022-06-07 08:20:53','2022-06-07 08:20:53'),(354,'zhicheng',3,'Activity_0vigf8t',11,'851px','120px',0,'admin','2022-06-07 08:20:58','2022-06-07 08:20:58'),(355,'zhicheng',3,'Activity_1et6ltk',11,'851px','120px',0,'admin','2022-06-07 08:21:05','2022-06-07 08:21:05'),(356,'zhicheng',3,'Activity_18eu7cy',11,'851px','120px',0,'admin','2022-06-07 08:21:12','2022-06-07 08:21:12'),(357,'zhicheng',3,'Activity_03ao98j',11,'851px','120px',0,'admin','2022-06-07 08:21:16','2022-06-07 08:21:16'),(358,'zhicheng',3,'Activity_0zriqf8',11,'851px','120px',0,'admin','2022-06-07 08:21:21','2022-06-07 08:21:21'),(359,'zhicheng',3,'Activity_0onst4q',11,'851px','120px',0,'admin','2022-06-07 08:21:26','2022-06-07 08:21:26'),(360,'zhicheng',3,'Activity_0zjkm7j',11,'851px','120px',0,'admin','2022-06-07 08:21:32','2022-06-07 08:21:32'),(361,'zhicheng',3,'Activity_1rb8ybq',11,'851px','120px',0,'admin','2022-06-07 08:21:37','2022-06-07 08:21:37'),(362,'zhicheng',3,'Activity_1001vbk',11,'851px','120px',0,'admin','2022-06-07 08:21:42','2022-06-07 08:21:42'),(363,'zhicheng',3,'Activity_13zn5ne',11,'851px','120px',0,'admin','2022-06-07 08:21:47','2022-06-07 08:21:47'),(364,'zhicheng',3,'Activity_01isiwf',11,'851px','120px',0,'admin','2022-06-07 08:21:52','2022-06-07 08:21:52'),(365,'zhicheng',3,'Event_1kud1qc',11,'851px','120px',0,'admin','2022-06-07 08:21:58','2022-06-07 08:21:58');
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
INSERT INTO `process_model_page` VALUES (7,'holiday','START','启动','admin','2022-05-31 09:45:06','2022-05-31 09:45:06'),(8,'holiday','基本信息','基本信息','admin','2022-05-31 11:23:55','2022-05-31 11:23:55'),(9,'holiday','请假明细提交','请假明细提交','admin','2022-05-31 11:27:17','2022-05-31 11:27:17'),(10,'zhicheng','启动表单','启动表单','admin','2022-06-03 10:44:24','2022-06-03 10:44:24'),(11,'zhicheng','基本信息','基本信息','admin','2022-06-03 10:45:20','2022-06-03 10:45:20'),(12,'zhicheng','专家审核界面','专家审核界面','admin','2022-06-03 10:46:42','2022-06-03 10:46:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_model_page_scheme`
--

LOCK TABLES `process_model_page_scheme` WRITE;
/*!40000 ALTER TABLE `process_model_page_scheme` DISABLE KEYS */;
INSERT INTO `process_model_page_scheme` VALUES (405,7,'h5',11,'name','名称',1,24,0),(406,7,'h5',20,'supervisor','主管',2,24,0),(407,7,'h5',18,'dept_leader','部门领导',3,24,0),(408,7,'h5',19,'hq_leaders','总部领导',3,24,0),(409,7,'pad',11,'name','名称',1,24,0),(410,7,'pad',20,'supervisor','主管',2,24,0),(411,7,'pad',18,'dept_leader','部门领导',3,24,0),(412,7,'pad',19,'hq_leaders','总部领导',3,24,0),(413,7,'pc',11,'name','名称',1,12,1),(414,7,'pc',20,'supervisor','主管',2,12,1),(415,7,'pc',18,'dept_leader','部门领导',3,12,1),(416,7,'pc',19,'hq_leaders','总部领导',4,12,1),(434,9,'h5',22,'days','天数',0,24,1),(435,9,'pad',22,'days','天数',0,24,1),(436,9,'pc',22,'days','天数',0,24,1),(440,11,'h5',28,'name','名称',1,24,0),(441,11,'h5',29,'creator','创建者',2,24,0),(442,11,'h5',33,'judges','评委',2,24,0),(443,11,'pad',28,'name','名称',1,24,0),(444,11,'pad',29,'creator','创建者',2,24,0),(445,11,'pad',33,'judges','评委',2,24,0),(446,11,'pc',28,'name','名称',1,24,0),(447,11,'pc',29,'creator','创建者',2,24,0),(448,11,'pc',33,'judges','评委',2,24,0),(449,10,'h5',28,'name','名称',1,24,1),(450,10,'h5',33,'judges','评委',2,24,1),(451,10,'pad',28,'name','名称',1,24,1),(452,10,'pad',33,'judges','评委',2,24,1),(453,10,'pc',28,'name','名称',1,24,1),(454,10,'pc',33,'judges','评委',2,24,1),(455,12,'h5',34,'expert_status','状态',0,24,1),(456,12,'pad',34,'expert_status','状态',0,24,1),(457,12,'pc',34,'expert_status','状态',0,24,1),(458,8,'h5',21,'code','编号',1,24,0),(459,8,'h5',11,'name','名称',2,24,0),(460,8,'h5',12,'creator','创建者',3,24,0),(461,8,'h5',20,'supervisor','主管',4,24,0),(462,8,'h5',18,'dept_leader','部门领导',5,24,0),(463,8,'h5',19,'hq_leaders','总部领导',6,24,0),(464,8,'h5',22,'days','天数',6,24,0),(465,8,'pad',21,'code','编号',1,12,0),(466,8,'pad',11,'name','名称',2,12,0),(467,8,'pad',12,'creator','创建者',3,12,0),(468,8,'pad',20,'supervisor','主管',4,12,0),(469,8,'pad',18,'dept_leader','部门领导',5,12,0),(470,8,'pad',19,'hq_leaders','总部领导',6,12,0),(471,8,'pad',22,'days','天数',6,24,0),(472,8,'pc',21,'code','编号',1,12,0),(473,8,'pc',11,'name','名称',2,12,0),(474,8,'pc',20,'supervisor','主管',3,12,0),(475,8,'pc',18,'dept_leader','部门领导',4,12,0),(476,8,'pc',19,'hq_leaders','总部领导',5,12,0),(477,8,'pc',22,'days','天数',5,24,0);
/*!40000 ALTER TABLE `process_model_page_scheme` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (288,2,1,'admin'),(289,2,2,'admin'),(290,2,3,'admin'),(291,2,4,'admin'),(292,2,5,'admin'),(293,2,6,'admin'),(294,2,7,'admin'),(295,2,8,'admin'),(296,2,9,'admin'),(298,2,10,'admin'),(299,2,11,'admin'),(300,2,12,'admin'),(301,2,13,'admin'),(302,2,14,'admin'),(303,2,15,'admin'),(394,1,1,'admin'),(395,1,2,'admin'),(396,1,3,'admin'),(397,1,4,'admin'),(398,1,5,'admin'),(399,1,6,'admin'),(400,1,7,'admin'),(401,1,8,'admin'),(402,1,9,'admin'),(403,1,10,'admin'),(404,1,11,'admin'),(405,1,12,'admin'),(406,1,13,'admin'),(407,1,14,'admin'),(408,1,15,'admin'),(409,1,16,'admin'),(410,1,17,'admin'),(411,1,18,'admin'),(413,2,16,'admin'),(414,2,17,'admin'),(415,2,18,'admin');
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
INSERT INTO `wf_field_user` VALUES (1,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',18,1,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(2,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',19,2,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(3,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',19,3,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(4,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',19,4,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(5,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',19,5,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(6,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',19,6,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(7,'holiday',1,'be08c913-f9e0-11ec-a429-50ebf6b3961b',20,1,'admin','2022-07-02 16:26:59','2022-07-02 16:26:59'),(8,'zhicheng',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b',33,2,'admin','2022-07-02 16:36:35','2022-07-02 16:36:35'),(9,'zhicheng',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b',33,3,'admin','2022-07-02 16:36:35','2022-07-02 16:36:35'),(10,'zhicheng',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b',33,4,'admin','2022-07-02 16:36:35','2022-07-02 16:36:35'),(11,'zhicheng',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b',33,5,'admin','2022-07-02 16:36:35','2022-07-02 16:36:35'),(12,'zhicheng',1,'15482f48-f9e2-11ec-a429-50ebf6b3961b',33,6,'admin','2022-07-02 16:36:35','2022-07-02 16:36:35');
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
  `update_by` bigint NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dept_leader` bigint NOT NULL DEFAULT '0' COMMENT '直属上级',
  `hq_leaders` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '总部领导列表',
  `supervisor` bigint DEFAULT NULL COMMENT '主管',
  `days` int NOT NULL DEFAULT '0' COMMENT '请假天数',
  `sex` bigint DEFAULT NULL COMMENT '性别',
  `cost_center` bigint DEFAULT NULL COMMENT '成本中心',
  `department` bigint DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wf_holiday_code_uindex` (`code`),
  UNIQUE KEY `wf_holiday_process_instance_id_uindex` (`process_instance_id`),
  KEY `wf_holiday_process_bpmn_id_index` (`process_bpmn_id`),
  KEY `wf_holiday_process_definition_id_index` (`process_definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='请假流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_holiday`
--

LOCK TABLES `wf_holiday` WRITE;
/*!40000 ALTER TABLE `wf_holiday` DISABLE KEYS */;
INSERT INTO `wf_holiday` VALUES (1,2,'Process_0dm6mw4:1:b2fc91a2-f9e0-11ec-a429-50ebf6b3961b','be08c913-f9e0-11ec-a429-50ebf6b3961b','HL2022070200001','测试请假流程',1,1,'2022-07-13 21:42:21','2022-07-02 16:26:59',1,'2,3,4,5,6',1,11,NULL,NULL,NULL);
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
  `update_by` bigint NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='职称申请流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_zhicheng`
--

LOCK TABLES `wf_zhicheng` WRITE;
/*!40000 ALTER TABLE `wf_zhicheng` DISABLE KEYS */;
INSERT INTO `wf_zhicheng` VALUES (1,3,'zhicheng:1:071849a7-f9e2-11ec-a429-50ebf6b3961b','15482f48-f9e2-11ec-a429-50ebf6b3961b','ZL2022070200001','测试职称流程',1,1,'2022-07-02 16:36:35','2022-07-02 16:36:35','2,3,4,5,6',NULL,0,0);
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

-- Dump completed on 2022-10-14 17:28:46
