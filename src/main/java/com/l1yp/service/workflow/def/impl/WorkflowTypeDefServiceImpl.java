package com.l1yp.service.workflow.def.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.cache.CacheResultType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingEntityMapper;
import com.l1yp.mapper.modeling.ModelingFieldMapper;
import com.l1yp.mapper.workflow.WorkflowTypeDefMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeDefAddParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefPageParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefUpdateParam;
import com.l1yp.model.view.system.UserView;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.service.workflow.def.IWorkflowTypeDefService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.HexUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class WorkflowTypeDefServiceImpl extends ServiceImpl<WorkflowTypeDefMapper, WorkflowTypeDef> implements IWorkflowTypeDefService {

    @Resource
    WorkflowTypeVerServiceImpl workflowTypeVerService;

    @Resource
    UserServiceImpl userService;

    @Resource
    ModelingFieldMapper modelingFieldMapper;

    @Resource
    ModelingEntityMapper modelingEntityMapper;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    private final Logger log = LoggerFactory.getLogger(WorkflowTypeDefServiceImpl.class);

    @Resource
    CacheManager cacheManager;

    @Override
    @Transactional
    public void add(WorkflowTypeDefAddParam param) {

        WorkflowTypeDef workflowTypeDef = new WorkflowTypeDef();
        BeanCopierUtil.copy(param, workflowTypeDef);

        save(workflowTypeDef);

        WorkflowTypeVer workflowTypeVer = new WorkflowTypeVer();
        workflowTypeVer.setKey(workflowTypeDef.getKey());
        workflowTypeVer.setVer(1);
        workflowTypeVer.setStatus(WorkflowTypeVer.PENDING);
        workflowTypeVer.setRemark("初始化");
        String xml = """
                <?xml version="1.0" encoding="UTF-8"?>
                <definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef">
                    <process id="{{PROCESS_ID}}" name="{{PROCESS_NAME}}">
                        <startEvent id="{{START_EVENT_ID}}" name="开始" />
                    </process>
                    <bpmndi:BPMNDiagram id="BPMNDiagram_1">
                        <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="{{PROCESS_ID}}">
                            <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="{{START_EVENT_ID}}">
                                <dc:Bounds x="156" y="81" width="36" height="36" />
                            </bpmndi:BPMNShape>
                        </bpmndi:BPMNPlane>
                    </bpmndi:BPMNDiagram>
                </definitions>
                """;
        xml = xml.replace("{{PROCESS_ID}}", param.getKey());
        xml = xml.replace("{{PROCESS_NAME}}", param.getName());
        xml = xml.replace("{{START_EVENT_ID}}", "startEvent_" + HexUtil.randomCode(7));
        workflowTypeVer.setXml(xml);
        workflowTypeVerService.save(workflowTypeVer);



        List<ModelingField> defaultEntityFields = modelingFieldMapper.selectList(Wrappers.<ModelingField>lambdaQuery().eq(ModelingField::getScope, FieldScope.WORKFLOW_DEFAULT));
        List<String> columnDefs = new ArrayList<>();
        Set<String> notNullFields = new HashSet<>(Arrays.asList("id", "code", "update_by", "update_time", "create_by", "create_time"));
        String primaryField = "id";
        for (ModelingField field : defaultEntityFields) {
            FieldScheme scheme = field.getScheme();
            String dbType = modelingFieldService.getDbType(field.getWidth(), scheme);
            String nullable = "NULL";
            String primaryKey = "";
            if (primaryField.equals(field.getField())) {
                primaryKey = "PRIMARY KEY";
            }
            if (notNullFields.contains(field.getField())) {
                nullable = "NOT NULL";
            }
            String columnDef = String.format("`%s` %s %s %s COMMENT '%s'", field.getField(), dbType, nullable, primaryKey, field.getLabel());
            if (field.getField().equals("create_time")) {
                columnDef = "create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'";
            }
            if (field.getField().equals("create_time")) {
                columnDef = "create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'";
            }
            columnDefs.add(columnDef);
        }
        String tableName = WorkflowTypeDef.buildEntityTableName(param.getKey());

        Set<String> uniqueFields = new HashSet<>(Arrays.asList("process_instance_id", "code"));
        String uniqueConstraint =  uniqueFields.stream().map(it -> "constraint " + tableName + "_" + it + " unique (" + it + ")").collect(Collectors.joining(","));


        // TODO: 防止SQL注入
        String createDDL = columnDefs.stream().collect(Collectors.joining(",\n", "CREATE TABLE `" + tableName + "` (\n"  ,
                ",\n" + uniqueConstraint + "\n) COMMENT '" + param.getRemark() + "'"));
        log.info("create table ddl: {}", createDDL);
        modelingEntityMapper.createTable(createDDL);

        modelingEntityMapper.createRefTable(tableName);

    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "workflow_type", key = "'id:' + #p0")
    public void update(WorkflowTypeDefUpdateParam param) {
        WorkflowTypeDefServiceImpl service = (WorkflowTypeDefServiceImpl) AopContext.currentProxy();
        WorkflowTypeDef workflowType = service.getWorkflowTypeDefById(param.getId());
        if (workflowType == null) {
            throw new VanException(400, "流程定义不存在");
        }

        WorkflowTypeDef workflowTypeDef = new WorkflowTypeDef();
        BeanCopierUtil.copy(param, workflowTypeDef);

        updateById(workflowTypeDef);

        Cache cache = cacheManager.getCache("workflow_type");
        if (cache != null) {
            cache.evict("key:" + workflowType.getKey());
        }

    }



    @Override
    public PageData<WorkflowTypeDefView> pageWfTypeDef(WorkflowTypeDefPageParam param) {
        PageHelper.startPage(param.getPageIdx(), param.getPageSize());
        LambdaQueryWrapper<WorkflowTypeDef> wrapper = Wrappers.<WorkflowTypeDef>lambdaQuery();
        if (StringUtils.hasText(param.getName())) {
            wrapper.like(WorkflowTypeDef::getName, param.getName());
        }
        if (StringUtils.hasText(param.getRemark())) {
            wrapper.like(WorkflowTypeDef::getRemark, param.getRemark());
        }
        if (StringUtils.hasText(param.getRemark())) {
            wrapper.like(WorkflowTypeDef::getRemark, param.getRemark());
        }
        if (!CollectionUtils.isEmpty(param.getUpdateBy())) {
            wrapper.in(WorkflowTypeDef::getUpdateBy, param.getUpdateBy());
        }
        if (!CollectionUtils.isEmpty(param.getCreateBy())) {
            wrapper.in(WorkflowTypeDef::getCreateBy, param.getCreateBy());
        }

        wrapper.orderByDesc(WorkflowTypeDef::getUpdateTime);

        List<WorkflowTypeDef> workflowTypeDefs = getBaseMapper().selectList(wrapper);
        if (CollectionUtils.isEmpty(workflowTypeDefs)) {
            return PageData.empty(param);
        }


        PageData<WorkflowTypeDefView> pageData = new PageData<>();
        pageData.initPage(workflowTypeDefs);

        List<WorkflowTypeDefView> data = workflowTypeDefs.stream().map(WorkflowTypeDef::toView).toList();

        Set<String> userIds = new HashSet<>();
        data.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });

        List<String> keys = data.stream().map(WorkflowTypeDefView::getKey).toList();

        List<WorkflowTypeVer> workflowTypeVers = workflowTypeVerService.getBaseMapper().selectList(Wrappers.<WorkflowTypeVer>lambdaQuery().in(WorkflowTypeVer::getKey, keys));
        Map<String, List<WorkflowTypeVerView>> verMap = workflowTypeVers.stream().map(WorkflowTypeVer::toView).collect(Collectors.groupingBy(WorkflowTypeVerView::getKey, Collectors.toList()));
        workflowTypeVers.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });


        data.forEach(it -> it.setChildren(verMap.get(it.getKey())));

        pageData.setData(data);



        List<UserView> users = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = users.stream().collect(Collectors.toMap(UserView::getId, it -> it));
        pageData.setAdditional(userMap);
        return pageData;
    }

    @Override
    public PageData<WorkflowTypeDefView> pageWfTypeDefWithoutVer(WorkflowTypeDefPageParam param) {
        PageHelper.startPage(param.getPageIdx(), param.getPageSize());
        LambdaQueryWrapper<WorkflowTypeDef> wrapper = Wrappers.<WorkflowTypeDef>lambdaQuery();
        if (StringUtils.hasText(param.getName())) {
            wrapper.like(WorkflowTypeDef::getName, param.getName());
        }
        if (StringUtils.hasText(param.getRemark())) {
            wrapper.like(WorkflowTypeDef::getRemark, param.getRemark());
        }
        if (StringUtils.hasText(param.getRemark())) {
            wrapper.like(WorkflowTypeDef::getRemark, param.getRemark());
        }
        if (!CollectionUtils.isEmpty(param.getUpdateBy())) {
            wrapper.in(WorkflowTypeDef::getUpdateBy, param.getUpdateBy());
        }
        if (!CollectionUtils.isEmpty(param.getCreateBy())) {
            wrapper.in(WorkflowTypeDef::getCreateBy, param.getCreateBy());
        }

        wrapper.orderByDesc(WorkflowTypeDef::getUpdateTime);

        List<WorkflowTypeDef> workflowTypeDefs = getBaseMapper().selectList(wrapper);
        if (CollectionUtils.isEmpty(workflowTypeDefs)) {
            return PageData.empty(param);
        }


        PageData<WorkflowTypeDefView> pageData = new PageData<>();
        pageData.initPage(workflowTypeDefs);

        List<WorkflowTypeDefView> data = workflowTypeDefs.stream().map(WorkflowTypeDef::toView).toList();

        Set<String> userIds = new HashSet<>();
        data.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });

        pageData.setData(data);

        List<UserView> users = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = users.stream().collect(Collectors.toMap(UserView::getId, it -> it));
        pageData.setAdditional(userMap);
        return pageData;
    }


    @Cacheable(cacheNames = "workflow_type", key = "'key:' + #p0", unless = "#result == null")
    @CacheResultType(WorkflowTypeDef.class)
    public WorkflowTypeDef getWorkflowTypeDefByKey(String mkey) {
        WorkflowTypeDef workflowType = getBaseMapper().selectOne(Wrappers.<WorkflowTypeDef>lambdaQuery().eq(WorkflowTypeDef::getKey, mkey));
        if (workflowType != null) {
            Cache cache = cacheManager.getCache("workflow_type");
            if (cache != null) {
                cache.put("id:" + workflowType.getId(), workflowType);
            }
        }
        return workflowType;
    }

    @Cacheable(cacheNames = "workflow_type", key = "'id:' + #p0", unless = "#result == null")
    @CacheResultType(WorkflowTypeDef.class)
    public WorkflowTypeDef getWorkflowTypeDefById(String id) {
        WorkflowTypeDef workflowType = getBaseMapper().selectById(id);
        if (workflowType != null) {
            Cache cache = cacheManager.getCache("workflow_type");
            if (cache != null) {
                cache.put("key:" + workflowType.getKey(), workflowType);
            }
        }
        return workflowType;
    }

}
