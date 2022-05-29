package com.l1yp.service;

import com.l1yp.conf.constants.process.ProcessConstants;
import com.l1yp.mapper.*;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.*;
import com.l1yp.model.param.process.model.AddProcessModelPageParam;
import com.l1yp.model.param.process.model.AddProcessModelPageSchemeParam;
import com.l1yp.model.param.process.model.AddProcessModelPageSchemeParam.PageFieldScheme;
import com.l1yp.model.param.process.model.BindProcessModelNodePageParam;
import com.l1yp.model.param.process.model.ConfigProcessStartPageParam;
import com.l1yp.model.view.ProcessModelPageSchemeView;
import com.l1yp.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProcessModelPageService {

    private static final Logger log = LoggerFactory.getLogger(ProcessModelPageService.class);

    @Resource
    ProcessModelMapper processModelMapper;

    @Resource
    ProcessModelPageMapper processModelPageMapper;

    @Resource
    ProcessNodePageMapper processNodePageMapper;

    @Resource
    ProcessModelPageSchemeMapper processModelPageSchemeMapper;

    @Resource
    ProcessModelBpmnMapper processModelBpmnMapper;

    @Resource
    ProcessFieldDefinitionMapper processFieldDefinitionMapper;

    /**
     * 创建/更新 流程模型的 界面
     */
    public ResultData<Void> createPage(AddProcessModelPageParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();

        ProcessModelDefinition definition = processModelMapper.findByProcessKey(param.getProcessKey());
        if (definition == null) {
            return ResultData.err(400, "processKey参数有误");
        }

        ProcessModelPage page = new ProcessModelPage();
        BeanUtils.copyProperties(param, page);
        page.setUpdateBy(loginUser.getUpdateBy());
        processModelPageMapper.insertSelective(page);

        return ResultData.OK;
    }

    /**
     * 查询流程的页面列表
     * @param processKey 流程标识
     */
    public ResultData<List<ProcessModelPage>> listProcessPage(String processKey) {
        List<ProcessModelPage> processModelPages = processModelPageMapper.listProcessPage(processKey);
        return ResultData.ok(processModelPages);
    }

    /**
     * 查询BPMN流程节点绑定的页面列表
     * @param bpmnId BPMN流程Id
     */
    public ResultData<List<ProcessModelNodePage>> listProcessPageByBpmnId(Long bpmnId) {
        List<ProcessModelNodePage> processModelPages = processNodePageMapper.listProcessPageByBpmnId(bpmnId);
        return ResultData.ok(processModelPages);
    }

    /**
     * 创建页面定义
     */
    public ResultData<Void> createPageScheme(AddProcessModelPageSchemeParam param) {

        processModelPageSchemeMapper.deleteByProcessModelPageId(param.processModelPageId);

        if (!CollectionUtils.isEmpty(param.h5)) {
            insertPageScheme(param.processModelPageId, "h5", param.h5);
        }
        if (!CollectionUtils.isEmpty(param.pad)) {
            insertPageScheme(param.processModelPageId, "pad", param.pad);
        }
        if (!CollectionUtils.isEmpty(param.pc)) {
            insertPageScheme(param.processModelPageId, "pc", param.pc);
        }

        return ResultData.OK;
    }

    public void insertPageScheme(Long processModelPageId, String device, List<PageFieldScheme> fields) {
        for (PageFieldScheme field : fields) {
            if (field == null) continue;
            ProcessModelPageScheme pmps = new ProcessModelPageScheme();
            pmps.setProcessModelPageId(processModelPageId);
            pmps.setDevice(device);
            pmps.setFieldId(field.fieldId);
            pmps.setFieldName(field.fieldName);
            pmps.setFieldLabel(field.fieldLabel);
            pmps.setOrderNo(field.orderNo);
            pmps.setSpan(field.span);
            pmps.setWriteable(field.writeable);
            processModelPageSchemeMapper.insertSelective(pmps);
        }
    }

    /**
     * 流程节点绑定界面
     */
    public ResultData<Void> bindProcessModelBpmnPage(BindProcessModelNodePageParam param) {
        if (ProcessConstants.PROCESS_START_FORM_KEY.equals(param.getNodeId())) {
            return ResultData.err(400, "节点标识与启动表单标识冲突，请更换");
        }
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessModelNodePage page = new ProcessModelNodePage();
        BeanUtils.copyProperties(param, page);
        page.setUpdateBy(loginUser.getUpdateBy());

        processNodePageMapper.insertUpdate(page);


        return ResultData.OK;
    }

    /**
     * 配置流程启动表单页面
     */
    public ResultData<Void> configProcessModelStartPage(ConfigProcessStartPageParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessModelNodePage page = new ProcessModelNodePage();
        BeanUtils.copyProperties(param, page);
        page.setUpdateBy(loginUser.getUpdateBy());
        page.setNodeId(ProcessConstants.PROCESS_START_FORM_KEY);
        page.setProcessBpmnId(0L);

        processNodePageMapper.insertUpdate(page);
        return ResultData.OK;
    }


    /**
     * 查询流程界面定义
     * @param pageId
     * @return
     */
    public ResultData<ProcessModelPageSchemeView> listProcessPageScheme(Long pageId) {
        List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageScheme(pageId);

        ProcessModelPageSchemeView view = new ProcessModelPageSchemeView();

        if (CollectionUtils.isEmpty(pageScheme)) {
            return ResultData.ok(view);
        }

        Set<Long> fieldIds = pageScheme.stream().map(ProcessModelPageScheme::getFieldId).collect(Collectors.toSet());
        if (CollectionUtils.isEmpty(fieldIds)) {
            log.warn("listProcessPageScheme({}): scheme size: {}, fieldIds: {}", pageId, pageScheme.size(), fieldIds);
            return ResultData.err(500, "field_id字段异常");
        }
        List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByIds(fieldIds);
        Map<Long, ProcessFieldDefinition> fieldDefinitionMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getId, it -> it));

        pageScheme.forEach(it -> it.setField(fieldDefinitionMap.get(it.getFieldId())));

        view.h5 = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("h5")).toList();
        view.pad = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("pad")).toList();
        view.pc = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("pc")).toList();



        return ResultData.ok(view);
    }


}
