package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.mapper.workflow.WorkflowTypeDefMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeDefAddParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefPageParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefUpdateParam;
import com.l1yp.model.view.system.UserView;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.service.workflow.IWorkflowTypeDefService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.HexUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
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

    @Override
    @Transactional
    public void add(WorkflowTypeDefAddParam param) {
        User loginUser = RequestUtils.getLoginUser();

        WorkflowTypeDef workflowTypeDef = new WorkflowTypeDef();
        BeanCopierUtil.copy(param, workflowTypeDef);

        workflowTypeDef.setUpdateBy(loginUser.getId());
        workflowTypeDef.setCreateBy(loginUser.getId());

        save(workflowTypeDef);

        WorkflowTypeVer workflowTypeVer = new WorkflowTypeVer();
        workflowTypeVer.setWfKey(workflowTypeDef.getKey());
        workflowTypeVer.setVer(1);
        workflowTypeVer.setStatus(WorkflowTypeVer.PENDING);
        workflowTypeVer.setRemark("初始化");
        String xml = """
                <?xml version="1.0" encoding="UTF-8"?>
                <definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef">
                    <process id="{{PROCESS_ID}}" name="{{PROCESS_NAME}}">
                        <startEvent id="{{START_EVENT_ID}}" name="开始" flowable:initiator="creator" />
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
        workflowTypeVer.setUpdateBy(loginUser.getId());
        workflowTypeVer.setCreateBy(loginUser.getId());
        workflowTypeVer.setXml(xml);
        workflowTypeVerService.save(workflowTypeVer);
    }


    @Override
    @Transactional
    public void update(WorkflowTypeDefUpdateParam param) {
        User loginUser = RequestUtils.getLoginUser();

        WorkflowTypeDef workflowTypeDef = new WorkflowTypeDef();
        BeanCopierUtil.copy(param, workflowTypeDef);

        workflowTypeDef.setUpdateBy(loginUser.getId());
        updateById(workflowTypeDef);

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

        List<WorkflowTypeVer> workflowTypeVers = workflowTypeVerService.getBaseMapper().selectList(Wrappers.<WorkflowTypeVer>lambdaQuery().in(WorkflowTypeVer::getWfKey, keys));
        Map<String, List<WorkflowTypeVerView>> verMap = workflowTypeVers.stream().map(WorkflowTypeVer::toView).collect(Collectors.groupingBy(WorkflowTypeVerView::getWfKey, Collectors.toList()));
        workflowTypeVers.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });


        data.forEach(it -> it.setChildren(verMap.get(it.getKey())));

        pageData.setData(data);



        List<User> users = userService.listByIds(userIds);
        Map<String, UserView> userMap = users.stream().map(User::toView).collect(Collectors.toMap(UserView::getId, it -> it));
        pageData.setAdditional(userMap);
        return pageData;
    }


}
