package com.l1yp.service;

import com.l1yp.conf.constants.dict.DictConstants.YesNo;
import com.l1yp.conf.constants.process.ProcessConstants.ComponentType;
import com.l1yp.conf.constants.process.ProcessConstants.PublishState;
import com.l1yp.mapper.ProcessFieldDefinitionMapper;
import com.l1yp.mapper.ProcessModelBpmnMapper;
import com.l1yp.mapper.ProcessModelMapper;
import com.l1yp.mapper.ProcessNodePageMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.ProcessFieldDefinition;
import com.l1yp.model.db.ProcessModelBpmn;
import com.l1yp.model.db.ProcessModelBpmnBase;
import com.l1yp.model.db.ProcessModelDefinition;
import com.l1yp.model.db.ProcessModelNodePage;
import com.l1yp.model.db.SysUser;
import com.l1yp.model.param.process.AddProcessFieldDefinitionParam;
import com.l1yp.model.param.process.UpdateProcessFieldDefinitionParam;
import com.l1yp.model.param.process.model.AddProcessModelBpmnParam;
import com.l1yp.model.param.process.model.AddProcessModelDefinitionParam;
import com.l1yp.model.param.process.model.CopyProcessModelBpmnParam;
import com.l1yp.model.param.process.model.ProcessModelBPMNPublishParam;
import com.l1yp.model.param.process.model.UpdateProcessModelBpmnParam;
import com.l1yp.model.param.process.model.UpdateProcessModelDefinitionParam;
import com.l1yp.model.view.ProcessModelBPMNView;
import com.l1yp.model.view.ProcessModelTreeView;
import com.l1yp.util.ProcessModelUtil;
import com.l1yp.util.RequestUtils;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.sql.JDBCType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProcessModelService {

    @Resource
    ProcessModelMapper processModelMapper;

    @Resource
    ProcessModelBpmnMapper processModelBpmnMapper;

    @Resource
    ProcessNodePageMapper processNodePageMapper;

    @Resource
    RepositoryService repositoryService;

    /**
     * ????????????????????????
     */
    public ResultData<List<ProcessModelTreeView>> listOfProcessModel() {
        List<ProcessModelDefinition> processModelDefinitions = processModelMapper.selectAll();

        List<ProcessModelTreeView> tops = new ArrayList<>();
        for (ProcessModelDefinition processModelDefinition : processModelDefinitions) {
            ProcessModelTreeView top = new ProcessModelTreeView();
            top.setProcessKey(processModelDefinition.getProcessKey());
            top.setTitle(processModelDefinition.getTitle());
            top.setId(processModelDefinition.getId());
            top.setUpdateTime(processModelDefinition.getUpdateTime());
            top.setState(0);

            List<ProcessModelTreeView> items = new ArrayList<>();
            List<ProcessModelBpmnBase> bpmnList = processModelBpmnMapper.listOfItems(processModelDefinition.getProcessKey());
            for (ProcessModelBpmnBase bpmn : bpmnList) {
                ProcessModelTreeView item = new ProcessModelTreeView();
                item.setProcessKey(bpmn.getProcessKey());
                item.setTitle(top.getTitle() + " V" + bpmn.getVersion());
                item.setId(bpmn.getId());
                item.setState(bpmn.getState());
                item.setUpdateTime(bpmn.getUpdateTime());
                items.add(item);
            }
            top.setChildren(items);
            tops.add(top);
        }

        return ResultData.ok(tops);
    }

    /**
     * ??????????????????
     * @param param ????????????
     */
    public ResultData<Void> createProcessModelDefinition(@RequestBody AddProcessModelDefinitionParam param) {
        ProcessModelDefinition processModel = processModelMapper.findByProcessKey(param.getProcessKey());
        if (processModel != null) {
            return ResultData.err(400, "????????????????????????????????????");
        }

        ProcessModelDefinition pmd = new ProcessModelDefinition();
        BeanUtils.copyProperties(param, pmd);
        processModelMapper.insertSelective(pmd);

        createProcessBpmn(new AddProcessModelBpmnParam(param.getProcessKey(), param.getTitle()));

        initProcessFieldDefinition(param.getProcessKey());
        initProcessWFTable(param.getProcessKey(), param.getTitle());

        return ResultData.OK;
    }

    /**
     * ??????????????????
     */
    public ResultData<Void> updateProcessModelDefinition(@RequestBody UpdateProcessModelDefinitionParam param) {
        ProcessModelDefinition pmd = new ProcessModelDefinition();
        BeanUtils.copyProperties(param, pmd);
        processModelMapper.updateByPrimaryKey(pmd);
        return ResultData.OK;
    }

    /**
     * ??????BPMN????????????
     */
    public ResultData<ProcessModelBPMNView> findProcessModelBPMN(Long id) {
        ProcessModelBpmn model = processModelBpmnMapper.find(id);
        if (model == null) {
            return ResultData.err(400, "ID?????????");
        }
        ProcessModelBPMNView view = new ProcessModelBPMNView();
        BeanUtils.copyProperties(model, view);
        return ResultData.ok(view);
    }


    /**
     * ??????????????????????????????????????????
     */
    public ResultData<Void> createProcessBpmn(AddProcessModelBpmnParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        Integer maxVersion = processModelBpmnMapper.findMaxVersionByProcessKey(param.getProcessKey());
        if (maxVersion == null) {
            maxVersion = 0;
        }


        ProcessModelBpmnBase bpmn = new ProcessModelBpmnBase();
        bpmn.setProcessKey(param.getProcessKey());
        bpmn.setState(0); // UNPUBLISHED
        bpmn.setUpdateBy(loginUser.getUsername());
        bpmn.setVersion(maxVersion + 1);
        processModelBpmnMapper.insertSelective(bpmn);

        String content = """
                <?xml version="1.0" encoding="UTF-8"?>
                <definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef">
                    <process id="{{PROCESS_ID}}" name="{{PROCESS_NAME}}">
                        <startEvent id="StartEvent_1iig6c2" />
                    </process>
                    <bpmndi:BPMNDiagram id="BPMNDiagram_1">
                        <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_0dm6mw4">
                            <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="StartEvent_1iig6c2">
                                <dc:Bounds x="156" y="81" width="36" height="36" />
                            </bpmndi:BPMNShape>
                        </bpmndi:BPMNPlane>
                    </bpmndi:BPMNDiagram>
                </definitions>
                """;
        content = content.replace("{{PROCESS_ID}}", param.getProcessKey());
        content = content.replace("{{PROCESS_NAME}}", param.getTitle());
        processModelBpmnMapper.updateBpmnXML(bpmn.getId(), loginUser.getUsername(), content);
        return ResultData.OK;

    }

    /**
     * ?????????????????? ????????????????????????
     */
    public ResultData<Void> copyProcessBpmn(CopyProcessModelBpmnParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmn pmb = processModelBpmnMapper.find(param.getProcessModelBpmnId());
        if (pmb == null) {
            return ResultData.err(400, "????????????");
        }
        Integer maxVersion = processModelBpmnMapper.findMaxVersionByProcessKey(pmb.getProcessKey());
        if (maxVersion == null) {
            maxVersion = 0;
        }

        ProcessModelBpmn newVersionPmb = new ProcessModelBpmn();
        BeanUtils.copyProperties(pmb, newVersionPmb);
        newVersionPmb.setId(null);
        newVersionPmb.setState(PublishState.UNPUBLISHED);
        newVersionPmb.setVersion(maxVersion + 1);
        newVersionPmb.setProcessDefinitionId(null);
        newVersionPmb.setUpdateBy(loginUser.getUsername());
        newVersionPmb.setUpdateTime(null);
        newVersionPmb.setCreateTime(null);
        processModelBpmnMapper.insertProcessModelBPMN(newVersionPmb);

        List<ProcessModelNodePage> processModelPages = processNodePageMapper.listProcessPageByBpmnId(pmb.getId());
        if (CollectionUtils.isEmpty(processModelPages)) {
            return ResultData.OK;
        }

        processModelPages.forEach(it -> {
            it.setId(null);
            it.setProcessBpmnId(newVersionPmb.getId());
            it.setUpdateBy(loginUser.getUsername());
            it.setCreateTime(null);
            it.setUpdateTime(null);
        });

        processNodePageMapper.insertList(processModelPages);

        return ResultData.OK;
    }

    /**
     * ??????BPMN XML
     */
    public ResultData<Void> persistProcessModelXML(UpdateProcessModelBpmnParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmnBase pmb = processModelBpmnMapper.selectByPrimaryKey(param.getId());
        if (pmb.getState().equals(PublishState.PUBLISHED) || StringUtils.hasText(pmb.getProcessDefinitionId())) {
            return ResultData.err(400, "??????????????????????????????");
        }

        processModelBpmnMapper.updateBpmnXML(param.getId(), loginUser.getUsername(), param.getContent());
        return ResultData.OK;
    }

    /**
     * ????????????
     */
    public ResultData<Void> publishProcessModelBpmn(ProcessModelBPMNPublishParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmn pmb = processModelBpmnMapper.find(param.getProcessModelBpmnId());
        if (pmb == null) {
            return ResultData.err(400, "????????????????????????");
        }

        if (StringUtils.hasText(pmb.getProcessDefinitionId())) {
            // ???????????? ??????????????????
            ProcessModelBpmn pmb2 = new ProcessModelBpmn();
            pmb2.setId(param.getProcessModelBpmnId());
            pmb2.setState(1);
            pmb2.setUpdateBy(loginUser.getUsername());
            processModelBpmnMapper.updateByPrimaryKeySelective(pmb2);
            return ResultData.OK;
        }

        ProcessModelDefinition pmd = processModelMapper.findByProcessKey(pmb.getProcessKey());
        if (pmd == null) {
            return ResultData.err(400, "????????????????????????");
        }

        List<ProcessModelBpmnBase> pmbs = processModelBpmnMapper.listOfItems(pmb.getProcessKey());
        List<Integer> published = pmbs.stream().filter(it -> it.getState() == 1).map(ProcessModelBpmnBase::getVersion).toList();
        if (published.size() > 0) {
            return ResultData.err(400, "??????????????????: " + published);
        }

        Deployment deployment = repositoryService.createDeployment()
                .category("https://l1yp.com/docs/flowable/bpmn/")
                .key(pmb.getProcessKey())
                .name(pmd.getTitle())
                .addString(pmb.getProcessKey() + ".bpmn20.xml", pmb.getContent())
                .deploy();

        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
        // ??????????????? ???????????? ????????????


        ProcessModelBpmn pmb2 = new ProcessModelBpmn();
        pmb2.setId(param.getProcessModelBpmnId());
        pmb2.setProcessDefinitionId(processDefinition.getId());
        pmb2.setState(1);
        pmb2.setUpdateBy(loginUser.getUsername());
        processModelBpmnMapper.updateByPrimaryKeySelective(pmb2);
        return ResultData.OK;
    }

    /**
     * ??????BPMN??????
     */
    public ResultData<Void> stopProcessModelBpmn(Long processModelBpmnId) {
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessModelBpmnBase item = processModelBpmnMapper.selectByPrimaryKey(processModelBpmnId);
        if (item.getState().equals(PublishState.UNPUBLISHED)) {
            return ResultData.err(400, "??????????????????????????????");
        }

        ProcessModelBpmn pmb = new ProcessModelBpmn();
        pmb.setId(processModelBpmnId);
        pmb.setState(0);
        pmb.setUpdateBy(loginUser.getUsername());
        processModelBpmnMapper.updateByPrimaryKeySelective(pmb);
        return ResultData.OK;
    }

    @Resource
    ProcessFieldDefinitionMapper processFieldDefinitionMapper;

    /**
     * ??????<b>????????????(processKey)</b>??????????????????????????????
     */
    public List<ProcessFieldDefinition> listProcessFieldsDefinitionByProcessKey(String processKey) {
        return processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
    }

    public void initProcessFieldDefinition(String processKey) {
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessFieldDefinition pfd = new ProcessFieldDefinition();
        pfd.setProcessKey(processKey);
        pfd.setUpdateBy(loginUser.getUsername());

        pfd.setId(null);
        pfd.setName("id");
        pfd.setOrderNo(1);
        pfd.setLabel("id");
        pfd.setDescription("??????");
        pfd.setComponentType(ComponentType.NUMBER);
        pfd.setDbFieldType(JDBCType.BIGINT.getName());
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("process_bpmn_id");
        pfd.setOrderNo(2);
        pfd.setLabel("??????ID");
        pfd.setDescription("????????????ID");
        pfd.setComponentType(ComponentType.NUMBER);
        pfd.setDbFieldType(JDBCType.BIGINT.getName());
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("process_definition_id");
        pfd.setOrderNo(3);
        pfd.setLabel("??????ID");
        pfd.setDescription("????????????ID");
        pfd.setComponentType(ComponentType.SINGLE_LINE_TEXT);
        pfd.setDbFieldType("VARCHAR(128)");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("process_instance_id");
        pfd.setOrderNo(4);
        pfd.setLabel("??????ID");
        pfd.setDescription("????????????ID");
        pfd.setComponentType(ComponentType.SINGLE_LINE_TEXT);
        pfd.setDbFieldType("VARCHAR(36)");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("name");
        pfd.setOrderNo(5);
        pfd.setLabel("??????");
        pfd.setDescription("????????????");
        pfd.setComponentType(ComponentType.SINGLE_LINE_TEXT);
        pfd.setDbFieldType("VARCHAR(64)");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("creator");
        pfd.setOrderNo(6);
        pfd.setLabel("?????????");
        pfd.setDescription("???????????????");
        pfd.setComponentType(ComponentType.SINGLE_USER);
        pfd.setDbFieldType("BIGINT");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("update_by");
        pfd.setOrderNo(7);
        pfd.setLabel("?????????");
        pfd.setDescription("???????????????");
        pfd.setComponentType(ComponentType.SINGLE_LINE_TEXT);
        pfd.setDbFieldType("VARCHAR(64)");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("update_time");
        pfd.setOrderNo(8);
        pfd.setLabel("????????????");
        pfd.setDescription("??????????????????");
        pfd.setComponentType(ComponentType.DATETIME);
        pfd.setDbFieldType("DATETIME");
        processFieldDefinitionMapper.insertSelective(pfd);

        pfd.setId(null);
        pfd.setName("create_time");
        pfd.setOrderNo(9);
        pfd.setLabel("????????????");
        pfd.setDescription("????????????");
        pfd.setComponentType(ComponentType.DATETIME);
        pfd.setDbFieldType("DATETIME");
        processFieldDefinitionMapper.insertSelective(pfd);
    }

    public void initProcessWFTable(String processKey, String description) {
        processModelMapper.initWFTable(ProcessModelUtil.getProcessModelTableName(processKey), StringUtils.hasText(description) ? description : " ");
        processModelMapper.initBpmnIndex(ProcessModelUtil.getProcessModelTableName(processKey));
        processModelMapper.initProcessDefinitionIdIndex(ProcessModelUtil.getProcessModelTableName(processKey));
    }

    private final static Set<String> protectedFields = Set.of(
            "id", "process_bpmn_id", "process_definition_id", "process_instance_id", "code", "name",
            "creator", "update_by", "update_time", "create_time"
    );

    /**
     * ????????????????????????
     */
    public ResultData<Void> updateProcessField(UpdateProcessFieldDefinitionParam param) {
        if (protectedFields.contains(param.getName())) {
            return ResultData.err(400, "???????????????????????????");
        }
        ProcessFieldDefinition pfd = new ProcessFieldDefinition();
        BeanUtils.copyProperties(param, pfd);
        processFieldDefinitionMapper.updateByPrimaryKeySelective(pfd);
        return ResultData.OK;
    }

    /**
     * ????????????????????????
     */
    public void deleteByProcessFieldById(Long id) {
        processFieldDefinitionMapper.deleteByPrimaryKey(id);
    }

    /**
     * ??????????????????????????????
     */
    public void batchDeleteByProcessField(List<Long> ids) {
        processFieldDefinitionMapper.batchDelete(ids);
    }

    public ResultData<Void> addColumn(AddProcessFieldDefinitionParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelDefinition processModelDefinition = processModelMapper.findByProcessKey(param.getProcessKey());
        if (processModelDefinition == null) {
            return ResultData.err(400, "processKey?????????");
        }

        List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByProcessKey(param.getProcessKey());
        Set<String> columnNames = processFieldDefinitions.stream().map(ProcessFieldDefinition::getName).collect(Collectors.toSet());
        if (columnNames.contains(param.getName())) {
            return ResultData.err(400, String.format("???[%s]?????????", param.getName()));
        }
        Integer maxOrderNo = processFieldDefinitions.stream().map(ProcessFieldDefinition::getOrderNo).max(Integer::compareTo).get();

        ProcessFieldDefinition pfd = new ProcessFieldDefinition();
        pfd.setProcessKey(param.getProcessKey());
        pfd.setUpdateBy(loginUser.getUsername());

        pfd.setName(param.getName());
        pfd.setOrderNo(maxOrderNo + 1);
        pfd.setLabel(param.getLabel());
        pfd.setDescription(param.getDescription());
        pfd.setComponentType(param.getComponentType());
        pfd.setDbFieldType(param.getDbFieldType());
        pfd.setDbDefaultValue(param.getDbDefaultValue());
        pfd.setNullable(YesNo.YES);
        pfd.setDictIdent(param.getDictScope());
        pfd.setDictIdent(param.getDictIdent());

        processFieldDefinitionMapper.insertSelective(pfd);

        processFieldDefinitionMapper.addColumn(param);

        return ResultData.OK;
    }

}
