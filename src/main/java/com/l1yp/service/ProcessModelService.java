package com.l1yp.service;

import com.l1yp.conf.constants.process.ProcessConstants;
import com.l1yp.conf.constants.process.ProcessConstants.PublishState;
import com.l1yp.mapper.*;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.*;
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
import com.l1yp.util.RequestUtils;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
     * 获取流程模型列表
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
     * 创建一个流程
     * @param param 流程信息
     */
    public ResultData<Void> createProcessModelDefinition(@RequestBody AddProcessModelDefinitionParam param) {
        ProcessModelDefinition pmd = new ProcessModelDefinition();
        BeanUtils.copyProperties(param, pmd);
        processModelMapper.insertSelective(pmd);

        createProcessBpmn(new AddProcessModelBpmnParam(param.getProcessKey()));

        return ResultData.OK;
    }

    /**
     * 更新流程模型
     */
    public ResultData<Void> updateProcessModelDefinition(@RequestBody UpdateProcessModelDefinitionParam param) {
        ProcessModelDefinition pmd = new ProcessModelDefinition();
        BeanUtils.copyProperties(param, pmd);
        processModelMapper.updateByPrimaryKey(pmd);
        return ResultData.OK;
    }

    /**
     * 查询BPMN版本信息
     */
    public ResultData<ProcessModelBPMNView> findProcessModelBPMN(Long id) {
        ProcessModelBpmn model = processModelBpmnMapper.find(id);
        if (model == null) {
            return ResultData.err(400, "ID不存在");
        }
        ProcessModelBPMNView view = new ProcessModelBPMNView();
        BeanUtils.copyProperties(model, view);
        return ResultData.ok(view);
    }


    /**
     * 基于流程模型创建一个流程版本
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

        processModelBpmnMapper.updateBpmnXML(bpmn.getId(), loginUser.getUsername(),"""
                <?xml version="1.0" encoding="UTF-8"?>
                <definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef">
                    <process id="Process_0dm6mw4">
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
                """);
        return ResultData.OK;

    }

    /**
     * 基于一个版本 复制一个版本出来
     */
    public ResultData<Void> copyProcessBpmn(CopyProcessModelBpmnParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmn pmb = processModelBpmnMapper.find(param.getProcessModelBpmnId());
        if (pmb == null) {
            return ResultData.err(400, "参数有误");
        }
        Integer maxVersion = processModelBpmnMapper.findMaxVersionByProcessKey(pmb.getProcessKey());
        if (maxVersion == null) {
            maxVersion = 0;
        }

        pmb.setId(null);
        pmb.setState(0);
        pmb.setVersion(maxVersion + 1);
        pmb.setProcessDefinitionId(null);
        pmb.setUpdateBy(loginUser.getUsername());
        pmb.setUpdateTime(null);
        pmb.setCreateTime(null);
        processModelBpmnMapper.insertProcessModelBPMN(pmb);

        List<ProcessModelNodePage> processModelPages = processNodePageMapper.listProcessPageByBpmnId(pmb.getId());

        processModelPages.forEach(it -> {
            it.setId(null);
            it.setProcessBpmnId(pmb.getId());
            it.setUpdateBy(loginUser.getUsername());
            it.setCreateTime(null);
            it.setUpdateTime(null);
        });

        processNodePageMapper.insertList(processModelPages);

        return ResultData.OK;
    }

    /**
     * 更新BPMN XML
     */
    public ResultData<Void> persistProcessModelXML(UpdateProcessModelBpmnParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmnBase pmb = processModelBpmnMapper.selectByPrimaryKey(param.getId());
        if (pmb.getState().equals(PublishState.PUBLISHED)) {
            return ResultData.err(400, "不能修改已发布的流程");
        }

        processModelBpmnMapper.updateBpmnXML(param.getId(), loginUser.getUsername(), param.getContent());
        return ResultData.OK;
    }

    /**
     * 发布流程
     */
    public ResultData<Void> publishProcessModelBpmn(ProcessModelBPMNPublishParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelBpmn pmb = processModelBpmnMapper.find(param.getProcessModelBpmnId());
        if (pmb == null) {
            return ResultData.err(400, "查询流程定义失败");
        }

        ProcessModelDefinition pmd = processModelMapper.findByProcessKey(pmb.getProcessKey());
        if (pmd == null) {
            return ResultData.err(400, "查询流程信息失败");
        }

        List<ProcessModelBpmnBase> pmbs = processModelBpmnMapper.listOfItems(pmb.getProcessKey());
        List<Integer> published = pmbs.stream().filter(it -> it.getState() == 1).map(ProcessModelBpmnBase::getVersion).toList();
        if (published.size() > 0) {
            return ResultData.err(400, "请先停用版本: " + published);
        }

        Deployment deployment = repositoryService.createDeployment()
                .category("https://l1yp.com/docs/flowable/bpmn/")
                .key(pmb.getProcessKey())
                .name(pmd.getTitle())
                .addString(pmb.getProcessKey() + ".bpmn20.xml", pmb.getContent())
                .deploy();

        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
        // 若查询不到 抛出异常 回滚事务


        ProcessModelBpmn pmb2 = new ProcessModelBpmn();
        pmb2.setId(param.getProcessModelBpmnId());
        pmb2.setProcessDefinitionId(processDefinition.getId());
        pmb2.setState(1);
        pmb2.setUpdateBy(loginUser.getUsername());
        processModelBpmnMapper.updateByPrimaryKeySelective(pmb2);
        return ResultData.OK;
    }

    /**
     * 停用BPMN版本
     */
    public ResultData<Void> stopProcessModelBpmn(Long processModelBpmnId) {
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessModelBpmnBase item = processModelBpmnMapper.selectByPrimaryKey(processModelBpmnId);
        if (item.getState().equals(PublishState.UNPUBLISHED)) {
            return ResultData.err(400, "不能停用未发布的流程");
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
     * 通过<b>流程标识(processKey)</b>获取流程模型字段列表
     */
    public List<ProcessFieldDefinition> listProcessFieldsDefinitionByProcessKey(String processKey) {
        return processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
    }

    /**
     * 创建流程模型字段信息
     */
    public void createProcessField(AddProcessFieldDefinitionParam param) {
        ProcessFieldDefinition pfd = new ProcessFieldDefinition();
        BeanUtils.copyProperties(param, pfd);
        processFieldDefinitionMapper.insertSelective(pfd);
    }

    /**
     * 更新流程字段信息
     */
    public void updateProcessField(UpdateProcessFieldDefinitionParam param) {
        ProcessFieldDefinition pfd = new ProcessFieldDefinition();
        BeanUtils.copyProperties(param, pfd);
        processFieldDefinitionMapper.updateByPrimaryKeySelective(pfd);
    }

    /**
     * 删除流程模型字段
     */
    public void deleteByProcessFieldById(Long id) {
        processFieldDefinitionMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除流程模型字段
     */
    public void batchDeleteByProcessField(List<Long> ids) {
        processFieldDefinitionMapper.batchDelete(ids);
    }

}
