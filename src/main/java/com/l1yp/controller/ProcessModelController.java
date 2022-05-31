package com.l1yp.controller;


import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.ProcessFieldDefinition;
import com.l1yp.model.param.process.AddProcessFieldDefinitionParam;
import com.l1yp.model.param.process.UpdateProcessFieldDefinitionParam;
import com.l1yp.model.param.process.model.AddProcessModelBpmnParam;
import com.l1yp.model.param.process.model.AddProcessModelDefinitionParam;
import com.l1yp.model.param.process.model.AddWFColumnParam;
import com.l1yp.model.param.process.model.CopyProcessModelBpmnParam;
import com.l1yp.model.param.process.model.ProcessModelBPMNPublishParam;
import com.l1yp.model.param.process.model.UpdateProcessModelBpmnParam;
import com.l1yp.model.param.process.model.UpdateProcessModelDefinitionParam;
import com.l1yp.model.view.ProcessModelBPMNView;
import com.l1yp.model.view.ProcessModelTreeView;
import com.l1yp.service.ProcessModelService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@SaCheckLogin
@RestController
@RequestMapping("/process/model")
public class ProcessModelController {


    @Resource
    ProcessModelService processModelService;


    /**
     * 获取流程模型列表
     */
    @GetMapping("/definition/list")
    public ResultData<List<ProcessModelTreeView>> listProcessModel() {
        return processModelService.listOfProcessModel();
    }

    /**
     * 创建流程模型
     */
    @PostMapping("/definition/create")
    public ResultData<Void> createProcessModelDefinition(@RequestBody AddProcessModelDefinitionParam param) {
        return processModelService.createProcessModelDefinition(param);
    }

    /**
     * 创建流程模型
     */
    @PostMapping("/definition/update")
    public ResultData<Void> updateProcessModelDefinition(@RequestBody UpdateProcessModelDefinitionParam param) {
        return processModelService.updateProcessModelDefinition(param);
    }

    /**
     * 创建BPMN流程版本
     */
    @GetMapping("/bpmn/{id}")
    public ResultData<ProcessModelBPMNView> getProcessModelBpmn(@PathVariable("id") Long id) {
        return processModelService.findProcessModelBPMN(id);
    }


    /**
     * 创建BPMN流程版本
     */
    @PostMapping("/bpmn/create")
    public ResultData<Void> createProcessModelBpmn(@RequestBody AddProcessModelBpmnParam param) {
        return processModelService.createProcessBpmn(param);
    }

    @PostMapping("/bpmn/copy")
    public ResultData<Void> copyProcessModelBpmn(@RequestBody CopyProcessModelBpmnParam param) {
        return processModelService.copyProcessBpmn(param);
    }

    /**
     * 保存BPMN XML
     */
    @PostMapping("/bpmn/persist/xml")
    public ResultData<Void> persistProcessModelXML(@RequestBody UpdateProcessModelBpmnParam param) {
        return processModelService.persistProcessModelXML(param);
    }

    @PostMapping("/bpmn/publish")
    public ResultData<Void> publishProcessModelBPMN(@RequestBody ProcessModelBPMNPublishParam param) {
        return processModelService.publishProcessModelBpmn(param);
    }


    @PostMapping("/bpmn/stop")
    public ResultData<Void> stopProcessModelBPMN(@RequestBody ProcessModelBPMNPublishParam param) {
        return processModelService.stopProcessModelBpmn(param.getProcessModelBpmnId());
    }

    /**
     * 获取流程模型字段列表
     */
    @GetMapping("/field/definition/{processKey}")
    public ResultData<List<ProcessFieldDefinition>> listProcessFieldsDefinitionByProcessKey(@PathVariable("processKey") String processKey) {
        return ResultData.ok(processModelService.listProcessFieldsDefinitionByProcessKey(processKey));
    }

    /**
     * 创建流程模型字段
     */
    @PostMapping("/field/definition/create")
    public ResultData<Void> addProcessFieldDefinition(@RequestBody AddProcessFieldDefinitionParam param) {
        processModelService.addColumn(param);
        return ResultData.OK;
    }

    /**
     * 更新流程模型字段
     */
    @PostMapping("/field/definition/update")
    public ResultData<Void> updateProcessFieldDefinition(@RequestBody UpdateProcessFieldDefinitionParam param) {
        processModelService.updateProcessField(param);
        return ResultData.OK;
    }

    /**
     * 删除流程模型字段
     */
    @DeleteMapping("/field/definition/{id}")
    public ResultData<Void> deleteByProcessFieldById(@PathVariable("id") Long id) {
        processModelService.deleteByProcessFieldById(id);
        return ResultData.OK;
    }

    /**
     * 批量删除流程模型字段
     */
    @DeleteMapping("/field/definition/batch/{ids}")
    public ResultData<Void> batchDeleteByProcessField(@PathVariable("ids") List<Long> ids) {
        processModelService.batchDeleteByProcessField(ids);
        return ResultData.OK;
    }



}
