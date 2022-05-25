create table process_model_bpmn
(
    id                    bigint auto_increment
        primary key,
    process_key           varchar(64)                        not null,
    version               int                                not null,
    process_definition_id varchar(128)                       null,
    state                 tinyint  default 1                 not null comment '0=未发布，1=已发布',
    update_by             varchar(64)                        not null,
    update_time           datetime default CURRENT_TIMESTAMP not null,
    create_time           datetime default CURRENT_TIMESTAMP not null,
    content               longtext                           null,
    constraint process_model_bpmn_process_key_version_uindex
        unique (process_key, version),
    constraint process_model_bpmn_process_model_definition_id_uindex
        unique (process_definition_id)
);

INSERT INTO van.process_model_bpmn (id, process_key, version, process_definition_id, state, update_by, update_time, create_time, content) VALUES (1, 'change_budget', 1, 'process_1649923504161:1:af5ebf14-ca27-11ec-a5f5-00e0705f49db', 0, 'admin', '2022-04-27 14:23:51', '2022-04-27 14:23:51', '<?xml version="1.0" encoding="UTF-8"?>
<bpmn2:definitions xmlns:bpmn2="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:activiti="http://activiti.org/bpmn" id="sample-diagram" targetNamespace="http://www.jeecg.com" xsi:schemaLocation="http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd">
  <bpmn2:process id="process_1649923504161" name="流程_1649923504161">
    <bpmn2:extensionElements />
    <bpmn2:startEvent id="Start" name="开始" activiti:initiator="creator">
      <bpmn2:outgoing>Flow_0ime1de</bpmn2:outgoing>
    </bpmn2:startEvent>
    <bpmn2:userTask id="Task_04qlgi8" name="填写调整信息">
      <bpmn2:extensionElements />
      <bpmn2:incoming>Flow_0ime1de</bpmn2:incoming>
      <bpmn2:incoming>Flow_1soxe2f</bpmn2:incoming>
      <bpmn2:incoming>Flow_07ic3g6</bpmn2:incoming>
      <bpmn2:incoming>Flow_1vpmgql</bpmn2:incoming>
      <bpmn2:outgoing>Flow_1bqh92k</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_117uxqt</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_0ime1de" name="填写详细信息" sourceRef="Start" targetRef="Task_04qlgi8" />
    <bpmn2:endEvent id="End_0p2rtsm" name="流程取消">
      <bpmn2:incoming>Flow_1bqh92k</bpmn2:incoming>
    </bpmn2:endEvent>
    <bpmn2:sequenceFlow id="Flow_1bqh92k" name="取消流程" sourceRef="Task_04qlgi8" targetRef="End_0p2rtsm" />
    <bpmn2:exclusiveGateway id="Gateway_1f2cp6f" name="是否月结调整">
      <bpmn2:incoming>Flow_117uxqt</bpmn2:incoming>
      <bpmn2:outgoing>Flow_06ihzgm</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_0soxgwi</bpmn2:outgoing>
    </bpmn2:exclusiveGateway>
    <bpmn2:sequenceFlow id="Flow_117uxqt" sourceRef="Task_04qlgi8" targetRef="Gateway_1f2cp6f" />
    <bpmn2:userTask id="Task_1bqt7q4" name="调整会签">
      <bpmn2:incoming>Flow_06ihzgm</bpmn2:incoming>
      <bpmn2:outgoing>Flow_1h31pxz</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_1soxe2f</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_06ihzgm" name="否" sourceRef="Gateway_1f2cp6f" targetRef="Task_1bqt7q4">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 0}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:userTask id="Task_13z3c2k" name="月结调整">
      <bpmn2:incoming>Flow_0soxgwi</bpmn2:incoming>
      <bpmn2:outgoing>Flow_0wsg5g6</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_1k6x2e4</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_0soxgwi" name="是" sourceRef="Gateway_1f2cp6f" targetRef="Task_13z3c2k">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 1}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:userTask id="Task_0cb2trb" name="调整审核">
      <bpmn2:incoming>Flow_1h31pxz</bpmn2:incoming>
      <bpmn2:incoming>Flow_0wsg5g6</bpmn2:incoming>
      <bpmn2:outgoing>Flow_1o3n9cq</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_07ic3g6</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_1h31pxz" name="提交" sourceRef="Task_1bqt7q4" targetRef="Task_0cb2trb">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="提交"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:userTask id="Task_0rqa8iy" name="调整批准">
      <bpmn2:incoming>Flow_1o3n9cq</bpmn2:incoming>
      <bpmn2:outgoing>Flow_1vpmgql</bpmn2:outgoing>
      <bpmn2:outgoing>Flow_09ebmz8</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_1o3n9cq" name="提交" sourceRef="Task_0cb2trb" targetRef="Task_0rqa8iy">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="提交"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:sequenceFlow id="Flow_1soxe2f" name="驳回" sourceRef="Task_1bqt7q4" targetRef="Task_04qlgi8">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="驳回"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:sequenceFlow id="Flow_07ic3g6" name="驳回" sourceRef="Task_0cb2trb" targetRef="Task_04qlgi8">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="驳回"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:sequenceFlow id="Flow_1vpmgql" name="驳回" sourceRef="Task_0rqa8iy" targetRef="Task_04qlgi8">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="驳回"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:userTask id="Task_0m513n9" name="调整确认">
      <bpmn2:incoming>Flow_09ebmz8</bpmn2:incoming>
      <bpmn2:incoming>Flow_1k6x2e4</bpmn2:incoming>
      <bpmn2:outgoing>Flow_0jv0b13</bpmn2:outgoing>
    </bpmn2:userTask>
    <bpmn2:sequenceFlow id="Flow_09ebmz8" name="提交" sourceRef="Task_0rqa8iy" targetRef="Task_0m513n9">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="提交"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:endEvent id="End_0nlf4zk" name="归档">
      <bpmn2:incoming>Flow_0jv0b13</bpmn2:incoming>
    </bpmn2:endEvent>
    <bpmn2:sequenceFlow id="Flow_0jv0b13" name="归档" sourceRef="Task_0m513n9" targetRef="End_0nlf4zk" />
    <bpmn2:sequenceFlow id="Flow_0wsg5g6" name="提交" sourceRef="Task_13z3c2k" targetRef="Task_0cb2trb">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome="提交"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
    <bpmn2:sequenceFlow id="Flow_1k6x2e4" name="预算同步调减" sourceRef="Task_13z3c2k" targetRef="Task_0m513n9">
      <bpmn2:conditionExpression xsi:type="bpmn2:tFormalExpression">${outcome=="预算同步调减"}</bpmn2:conditionExpression>
    </bpmn2:sequenceFlow>
  </bpmn2:process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_1">
    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="process_1649923504161">
      <bpmndi:BPMNEdge id="Flow_1k6x2e4_di" bpmnElement="Flow_1k6x2e4">
        <di:waypoint x="820" y="430" />
        <di:waypoint x="1450" y="430" />
        <di:waypoint x="1450" y="320" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="1417" y="443" width="66" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0wsg5g6_di" bpmnElement="Flow_0wsg5g6">
        <di:waypoint x="820" y="430" />
        <di:waypoint x="1000" y="430" />
        <di:waypoint x="1000" y="320" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="969" y="373" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0jv0b13_di" bpmnElement="Flow_0jv0b13">
        <di:waypoint x="1500" y="280" />
        <di:waypoint x="1612" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="1545" y="262" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_09ebmz8_di" bpmnElement="Flow_09ebmz8">
        <di:waypoint x="1290" y="280" />
        <di:waypoint x="1400" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="1334" y="262" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1vpmgql_di" bpmnElement="Flow_1vpmgql">
        <di:waypoint x="1240" y="240" />
        <di:waypoint x="1240" y="40" />
        <di:waypoint x="430" y="40" />
        <di:waypoint x="430" y="240" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="825" y="22" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_07ic3g6_di" bpmnElement="Flow_07ic3g6">
        <di:waypoint x="1000" y="240" />
        <di:waypoint x="1000" y="100" />
        <di:waypoint x="430" y="100" />
        <di:waypoint x="430" y="240" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="705" y="82" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1soxe2f_di" bpmnElement="Flow_1soxe2f">
        <di:waypoint x="770" y="240" />
        <di:waypoint x="770" y="160" />
        <di:waypoint x="430" y="160" />
        <di:waypoint x="430" y="240" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="590" y="142" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1o3n9cq_di" bpmnElement="Flow_1o3n9cq">
        <di:waypoint x="1050" y="280" />
        <di:waypoint x="1190" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="1109" y="262" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1h31pxz_di" bpmnElement="Flow_1h31pxz">
        <di:waypoint x="820" y="280" />
        <di:waypoint x="950" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="874" y="262" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0soxgwi_di" bpmnElement="Flow_0soxgwi">
        <di:waypoint x="600" y="305" />
        <di:waypoint x="600" y="430" />
        <di:waypoint x="720" y="430" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="609" y="353" width="12" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_06ihzgm_di" bpmnElement="Flow_06ihzgm">
        <di:waypoint x="625" y="280" />
        <di:waypoint x="720" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="667" y="262" width="12" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_117uxqt_di" bpmnElement="Flow_117uxqt">
        <di:waypoint x="480" y="280" />
        <di:waypoint x="575" y="280" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1bqh92k_di" bpmnElement="Flow_1bqh92k">
        <di:waypoint x="430" y="320" />
        <di:waypoint x="430" y="430" />
        <di:waypoint x="208" y="430" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="407" y="443" width="45" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0ime1de_di" bpmnElement="Flow_0ime1de">
        <di:waypoint x="208" y="280" />
        <di:waypoint x="380" y="280" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="261" y="262" width="67" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="Start_di" bpmnElement="Start">
        <dc:Bounds x="172" y="262" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="179" y="302" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_04qlgi8_di" bpmnElement="Task_04qlgi8">
        <dc:Bounds x="380" y="240" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_0p2rtsm_di" bpmnElement="End_0p2rtsm">
        <dc:Bounds x="172" y="412" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="168" y="455" width="44" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_1f2cp6f_di" bpmnElement="Gateway_1f2cp6f" isMarkerVisible="true">
        <dc:Bounds x="575" y="255" width="50" height="50" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="566" y="231" width="67" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1bqt7q4_di" bpmnElement="Task_1bqt7q4">
        <dc:Bounds x="720" y="240" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_13z3c2k_di" bpmnElement="Task_13z3c2k">
        <dc:Bounds x="720" y="390" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0cb2trb_di" bpmnElement="Task_0cb2trb">
        <dc:Bounds x="950" y="240" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0rqa8iy_di" bpmnElement="Task_0rqa8iy">
        <dc:Bounds x="1190" y="240" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0m513n9_di" bpmnElement="Task_0m513n9">
        <dc:Bounds x="1400" y="240" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_0nlf4zk_di" bpmnElement="End_0nlf4zk">
        <dc:Bounds x="1612" y="262" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="1619" y="305" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</bpmn2:definitions>
');
INSERT INTO van.process_model_bpmn (id, process_key, version, process_definition_id, state, update_by, update_time, create_time, content) VALUES (2, 'change_budget', 2, 'change_budget:1:5bcbdf5b-d855-11ec-aa63-00e0705f49db', 0, 'A52736', '2022-05-02 19:52:31', '2022-05-02 19:52:31', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef" exporter="Flowable Open Source Modeler" exporterVersion="6.7.2">
  <process id="change_budget" name="预算调整流程" isExecutable="true">
    <documentation>1</documentation>
    <startEvent id="startEvent1" name="开始" flowable:formFieldValidation="true" flowable:initiator="creator" />
    <userTask id="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" name="填写调整信息" flowable:formFieldValidation="true" flowable:assignee="${creator}">
      <incoming>Flow_060o6tr</incoming>
      <incoming>Flow_1x21u3i</incoming>
      <incoming>Flow_05ts1h1</incoming>
      <outgoing>Flow_0sqem18</outgoing>
    </userTask>
    <sequenceFlow id="sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" name="填写详细信息" sourceRef="startEvent1" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" />
    <exclusiveGateway id="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3">
      <outgoing>Flow_06pyim2</outgoing>
      <outgoing>Flow_0ofzj1m</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" name="提交" sourceRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" targetRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" name="调整会签" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_finance&#39;, execution)}">
      <incoming>Flow_0ofzj1m</incoming>
      <outgoing>Flow_060o6tr</outgoing>
    </userTask>
    <userTask id="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" name="月结调整" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}">
      <incoming>Flow_06pyim2</incoming>
      <outgoing>Flow_10ckl5d</outgoing>
    </userTask>
    <userTask id="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" name="调整审核" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}">
      <incoming>Flow_10ckl5d</incoming>
      <outgoing>Flow_1x21u3i</outgoing>
    </userTask>
    <sequenceFlow id="sid-4889166D-2091-42A2-83CC-EACE1250842C" name="提交" sourceRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" targetRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-85B02690-DD15-4842-8A02-8B3D7F960041" name="调整批准" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;hq_high_leader&#39;, execution)}">
      <outgoing>Flow_05ts1h1</outgoing>
    </userTask>
    <sequenceFlow id="sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" name="提交" sourceRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" targetRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" name="调整确认" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;hq_finance&#39;, execution)}" />
    <sequenceFlow id="sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" name="提交" sourceRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041" targetRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <endEvent id="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" name="归档" />
    <sequenceFlow id="sid-7A5ABFED-018D-483A-B416-81426A2EC752" name="归档" sourceRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" targetRef="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" />
    <sequenceFlow id="sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" name="预算同步调减" sourceRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" targetRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="预算同步调减"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_06pyim2" name="是" sourceRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" targetRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C">
      <conditionExpression xsi:type="tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 39}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_10ckl5d" name="提交" sourceRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" targetRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_060o6tr" name="驳回" sourceRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_1x21u3i" name="驳回" sourceRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_05ts1h1" name="驳回" sourceRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <endEvent id="Event_0cfphnc" name="流程取消">
      <incoming>Flow_0sqem18</incoming>
    </endEvent>
    <sequenceFlow id="Flow_0sqem18" name="流程取消" sourceRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" targetRef="Event_0cfphnc">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="流程取消"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_0ofzj1m" name="否" sourceRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" targetRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5">
      <conditionExpression xsi:type="tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 40}</conditionExpression>
    </sequenceFlow>
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_change_budget">
    <bpmndi:BPMNPlane id="BPMNPlane_change_budget" bpmnElement="change_budget">
      <bpmndi:BPMNEdge id="Flow_0ofzj1m_di" bpmnElement="Flow_0ofzj1m">
        <omgdi:waypoint x="250" y="165" />
        <omgdi:waypoint x="375" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="307" y="147" width="11" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0sqem18_di" bpmnElement="Flow_0sqem18">
        <omgdi:waypoint x="35" y="205" />
        <omgdi:waypoint x="35" y="310" />
        <omgdi:waypoint x="-182" y="310" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="13" y="322" width="43" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_05ts1h1_di" bpmnElement="Flow_05ts1h1">
        <omgdi:waypoint x="828" y="125" />
        <omgdi:waypoint x="828" y="-50" />
        <omgdi:waypoint x="20" y="-50" />
        <omgdi:waypoint x="20" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="414" y="-68" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1x21u3i_di" bpmnElement="Flow_1x21u3i">
        <omgdi:waypoint x="620" y="125" />
        <omgdi:waypoint x="620" y="20" />
        <omgdi:waypoint x="35" y="20" />
        <omgdi:waypoint x="35" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="317" y="2" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_060o6tr_di" bpmnElement="Flow_060o6tr">
        <omgdi:waypoint x="425" y="125" />
        <omgdi:waypoint x="425" y="80" />
        <omgdi:waypoint x="50" y="80" />
        <omgdi:waypoint x="50" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="227" y="62" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_10ckl5d_di" bpmnElement="Flow_10ckl5d">
        <omgdi:waypoint x="475" y="290" />
        <omgdi:waypoint x="620" y="290" />
        <omgdi:waypoint x="620" y="205" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="609" y="293" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_06pyim2_di" bpmnElement="Flow_06pyim2">
        <omgdi:waypoint x="230" y="185" />
        <omgdi:waypoint x="230" y="310" />
        <omgdi:waypoint x="375" y="310" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="224" y="322" width="11" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" bpmnElement="sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="79.0">
        <omgdi:waypoint x="475" y="320" />
        <omgdi:waypoint x="1010" y="320" />
        <omgdi:waypoint x="1010" y="205" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="977" y="332" width="66" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-7A5ABFED-018D-483A-B416-81426A2EC752" bpmnElement="sid-7A5ABFED-018D-483A-B416-81426A2EC752" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="14.0" flowable:targetDockerY="14.0">
        <omgdi:waypoint x="1060" y="165" />
        <omgdi:waypoint x="1136" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="1087" y="140" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" bpmnElement="sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.00000000000001" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="878" y="165" />
        <omgdi:waypoint x="960" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="908" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" bpmnElement="sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.00000000000001">
        <omgdi:waypoint x="670" y="165" />
        <omgdi:waypoint x="778" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="713" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-4889166D-2091-42A2-83CC-EACE1250842C" bpmnElement="sid-4889166D-2091-42A2-83CC-EACE1250842C" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="475" y="165" />
        <omgdi:waypoint x="570" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="512" y="140" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" bpmnElement="sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="20.5" flowable:targetDockerY="20.5">
        <omgdi:waypoint x="84.94999999999226" y="165.1277493606138" />
        <omgdi:waypoint x="210.44871794871796" y="165.44871794871796" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="137" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" bpmnElement="sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" flowable:sourceDockerX="15.0" flowable:sourceDockerY="15.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="-195.05000030455395" y="165" />
        <omgdi:waypoint x="-15" y="165" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent1" bpmnElement="startEvent1">
        <omgdc:Bounds x="-225" y="150" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="-221" y="193" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" bpmnElement="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
        <omgdc:Bounds x="-15" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" bpmnElement="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" isMarkerVisible="true">
        <omgdc:Bounds x="210" y="145" width="40" height="40" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" bpmnElement="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5">
        <omgdc:Bounds x="375" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-E7C3221C-7839-459D-A54C-DEDD5852329C" bpmnElement="sid-E7C3221C-7839-459D-A54C-DEDD5852329C">
        <omgdc:Bounds x="375" y="270" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" bpmnElement="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
        <omgdc:Bounds x="570" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-85B02690-DD15-4842-8A02-8B3D7F960041" bpmnElement="sid-85B02690-DD15-4842-8A02-8B3D7F960041">
        <omgdc:Bounds x="777.7777754884362" y="124.99999999999999" width="100" height="80.00000000000001" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" bpmnElement="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
        <omgdc:Bounds x="960" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" bpmnElement="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F">
        <omgdc:Bounds x="1136" y="151" width="28" height="28" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="1138" y="193" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_0cfphnc_di" bpmnElement="Event_0cfphnc">
        <omgdc:Bounds x="-218" y="292" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="-221" y="335" width="43" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
');
INSERT INTO van.process_model_bpmn (id, process_key, version, process_definition_id, state, update_by, update_time, create_time, content) VALUES (3, 'change_budget', 3, 'change_budget:2:8dd11303-db62-11ec-87a1-00e0705f49db', 1, 'A52736', '2022-05-24 20:49:34', '2022-05-24 20:49:34', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef" exporter="Flowable Open Source Modeler" exporterVersion="6.7.2">
  <process id="change_budget" name="预算调整流程" isExecutable="true">
    <documentation>1</documentation>
    <startEvent id="startEvent1" name="开始" flowable:formFieldValidation="true" flowable:initiator="creator" />
    <userTask id="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" name="填写调整信息" flowable:formFieldValidation="true" flowable:assignee="${creator}">
      <incoming>Flow_060o6tr</incoming>
      <incoming>Flow_1x21u3i</incoming>
      <incoming>Flow_05ts1h1</incoming>
      <outgoing>Flow_0sqem18</outgoing>
    </userTask>
    <sequenceFlow id="sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" name="填写详细信息" sourceRef="startEvent1" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" />
    <exclusiveGateway id="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3">
      <outgoing>Flow_06pyim2</outgoing>
      <outgoing>Flow_0ofzj1m</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" name="提交" sourceRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" targetRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" name="调整会签" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_finance&#39;, execution)}">
      <incoming>Flow_0ofzj1m</incoming>
      <outgoing>Flow_060o6tr</outgoing>
    </userTask>
    <userTask id="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" name="月结调整" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}">
      <incoming>Flow_06pyim2</incoming>
      <outgoing>Flow_10ckl5d</outgoing>
    </userTask>
    <userTask id="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" name="调整审核" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;sub_high_leader&#39;, execution)}">
      <incoming>Flow_10ckl5d</incoming>
      <outgoing>Flow_1x21u3i</outgoing>
    </userTask>
    <sequenceFlow id="sid-4889166D-2091-42A2-83CC-EACE1250842C" name="提交" sourceRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" targetRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-85B02690-DD15-4842-8A02-8B3D7F960041" name="调整批准" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;hq_high_leader&#39;, execution)}">
      <outgoing>Flow_05ts1h1</outgoing>
    </userTask>
    <sequenceFlow id="sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" name="提交" sourceRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" targetRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <userTask id="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" name="调整确认" flowable:formFieldValidation="true" flowable:assignee="${psr.read(&#39;change_budget&#39;, &#39;hq_finance&#39;, execution)}" />
    <sequenceFlow id="sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" name="提交" sourceRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041" targetRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <endEvent id="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" name="归档" />
    <sequenceFlow id="sid-7A5ABFED-018D-483A-B416-81426A2EC752" name="归档" sourceRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" targetRef="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" />
    <sequenceFlow id="sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" name="预算同步调减" sourceRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" targetRef="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="预算同步调减"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_06pyim2" name="是" sourceRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" targetRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C">
      <conditionExpression xsi:type="tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 39}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_10ckl5d" name="提交" sourceRef="sid-E7C3221C-7839-459D-A54C-DEDD5852329C" targetRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="提交"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_060o6tr" name="驳回" sourceRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_1x21u3i" name="驳回" sourceRef="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_05ts1h1" name="驳回" sourceRef="sid-85B02690-DD15-4842-8A02-8B3D7F960041" targetRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="驳回"}</conditionExpression>
    </sequenceFlow>
    <endEvent id="Event_0cfphnc" name="流程取消">
      <incoming>Flow_0sqem18</incoming>
    </endEvent>
    <sequenceFlow id="Flow_0sqem18" name="流程取消" sourceRef="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" targetRef="Event_0cfphnc">
      <conditionExpression xsi:type="tFormalExpression">${outcome=="流程取消"}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_0ofzj1m" name="否" sourceRef="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" targetRef="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5">
      <conditionExpression xsi:type="tFormalExpression">${psr.read("change_budget","end_monthly", execution) == 40}</conditionExpression>
    </sequenceFlow>
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_change_budget">
    <bpmndi:BPMNPlane id="BPMNPlane_change_budget" bpmnElement="change_budget">
      <bpmndi:BPMNEdge id="Flow_0ofzj1m_di" bpmnElement="Flow_0ofzj1m">
        <omgdi:waypoint x="250" y="165" />
        <omgdi:waypoint x="375" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="307" y="147" width="11" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0sqem18_di" bpmnElement="Flow_0sqem18">
        <omgdi:waypoint x="35" y="205" />
        <omgdi:waypoint x="35" y="310" />
        <omgdi:waypoint x="-182" y="310" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="13" y="322" width="43" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_05ts1h1_di" bpmnElement="Flow_05ts1h1">
        <omgdi:waypoint x="828" y="125" />
        <omgdi:waypoint x="828" y="-50" />
        <omgdi:waypoint x="20" y="-50" />
        <omgdi:waypoint x="20" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="414" y="-68" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1x21u3i_di" bpmnElement="Flow_1x21u3i">
        <omgdi:waypoint x="620" y="125" />
        <omgdi:waypoint x="620" y="20" />
        <omgdi:waypoint x="35" y="20" />
        <omgdi:waypoint x="35" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="317" y="2" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_060o6tr_di" bpmnElement="Flow_060o6tr">
        <omgdi:waypoint x="425" y="125" />
        <omgdi:waypoint x="425" y="80" />
        <omgdi:waypoint x="50" y="80" />
        <omgdi:waypoint x="50" y="125" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="227" y="62" width="21" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_10ckl5d_di" bpmnElement="Flow_10ckl5d">
        <omgdi:waypoint x="475" y="290" />
        <omgdi:waypoint x="620" y="290" />
        <omgdi:waypoint x="620" y="205" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="609" y="293" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_06pyim2_di" bpmnElement="Flow_06pyim2">
        <omgdi:waypoint x="230" y="185" />
        <omgdi:waypoint x="230" y="310" />
        <omgdi:waypoint x="375" y="310" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="224" y="322" width="11" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" bpmnElement="sid-F2D7D89A-F103-42ED-87AA-EE45E0F8D4CD" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="79.0">
        <omgdi:waypoint x="475" y="320" />
        <omgdi:waypoint x="1010" y="320" />
        <omgdi:waypoint x="1010" y="205" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="977" y="332" width="66" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-7A5ABFED-018D-483A-B416-81426A2EC752" bpmnElement="sid-7A5ABFED-018D-483A-B416-81426A2EC752" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="14.0" flowable:targetDockerY="14.0">
        <omgdi:waypoint x="1060" y="165" />
        <omgdi:waypoint x="1136" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="1087" y="140" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" bpmnElement="sid-DC6E5EB4-FAF3-4B9C-8CF9-D61F71758695" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.00000000000001" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="878" y="165" />
        <omgdi:waypoint x="960" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="908" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" bpmnElement="sid-FA58C054-45D4-4889-A89F-21AB5D802EBD" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.00000000000001">
        <omgdi:waypoint x="670" y="165" />
        <omgdi:waypoint x="778" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="713" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-4889166D-2091-42A2-83CC-EACE1250842C" bpmnElement="sid-4889166D-2091-42A2-83CC-EACE1250842C" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="475" y="165" />
        <omgdi:waypoint x="570" y="165" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="512" y="140" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" bpmnElement="sid-ACD912CD-5F25-459B-8683-B63991F2D6EC" flowable:sourceDockerX="50.0" flowable:sourceDockerY="40.0" flowable:targetDockerX="20.5" flowable:targetDockerY="20.5">
        <omgdi:waypoint x="84.94999999999226" y="165.1277493606138" />
        <omgdi:waypoint x="210.44871794871796" y="165.44871794871796" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="137" y="147" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="BPMNEdge_sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" bpmnElement="sid-6EAD1BDB-F5EE-4F18-ACD2-88719DF05575" flowable:sourceDockerX="15.0" flowable:sourceDockerY="15.0" flowable:targetDockerX="50.0" flowable:targetDockerY="40.0">
        <omgdi:waypoint x="-195.05000030455395" y="165" />
        <omgdi:waypoint x="-15" y="165" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent1" bpmnElement="startEvent1">
        <omgdc:Bounds x="-225" y="150" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="-221" y="193" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF" bpmnElement="sid-F99CA3CA-785B-46CF-BB2B-8DB534AE3FAF">
        <omgdc:Bounds x="-15" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" bpmnElement="sid-2BBA5DE3-01EE-4644-828F-4257CB7F9EF3" isMarkerVisible="true">
        <omgdc:Bounds x="210" y="145" width="40" height="40" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-1F5A6456-402F-4760-9E14-FF44A176F7A5" bpmnElement="sid-1F5A6456-402F-4760-9E14-FF44A176F7A5">
        <omgdc:Bounds x="375" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-E7C3221C-7839-459D-A54C-DEDD5852329C" bpmnElement="sid-E7C3221C-7839-459D-A54C-DEDD5852329C">
        <omgdc:Bounds x="375" y="270" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC" bpmnElement="sid-C49483FE-9DD9-4DDD-A341-7EAFCA809FEC">
        <omgdc:Bounds x="570" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-85B02690-DD15-4842-8A02-8B3D7F960041" bpmnElement="sid-85B02690-DD15-4842-8A02-8B3D7F960041">
        <omgdc:Bounds x="777.7777754884362" y="124.99999999999999" width="100" height="80.00000000000001" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-99757E3C-BB86-46AC-9328-64C7362EB7F3" bpmnElement="sid-99757E3C-BB86-46AC-9328-64C7362EB7F3">
        <omgdc:Bounds x="960" y="125" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="BPMNShape_sid-7D7875DA-09BC-4720-ABC6-398E6B62790F" bpmnElement="sid-7D7875DA-09BC-4720-ABC6-398E6B62790F">
        <omgdc:Bounds x="1136" y="151" width="28" height="28" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="1138" y="193" width="23" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_0cfphnc_di" bpmnElement="Event_0cfphnc">
        <omgdc:Bounds x="-218" y="292" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <omgdc:Bounds x="-221" y="335" width="43" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
');
