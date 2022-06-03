package com.l1yp.service;

import com.l1yp.conf.constants.process.ProcessConstants.ComponentType;
import com.l1yp.mapper.ProcessFieldDefinitionMapper;
import com.l1yp.mapper.ProcessModelBpmnMapper;
import com.l1yp.mapper.ProcessModelMapper;
import com.l1yp.mapper.ProcessModelPageSchemeMapper;
import com.l1yp.mapper.ProcessNodePageMapper;
import com.l1yp.mapper.SysDeptMapper;
import com.l1yp.mapper.SysDictValueMapper;
import com.l1yp.mapper.UserMapper;
import com.l1yp.mapper.WFFieldDeptMapper;
import com.l1yp.mapper.WFFieldDictMapper;
import com.l1yp.mapper.WFFieldUserMapper;
import com.l1yp.model.bpmn.HistoricActivityInstanceView;
import com.l1yp.model.bpmn.ProcessCreateParam;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.ProcessCommonInfo;
import com.l1yp.model.db.ProcessFieldDefinition;
import com.l1yp.model.db.ProcessModelBpmnBase;
import com.l1yp.model.db.ProcessModelDefinition;
import com.l1yp.model.db.ProcessModelNodePage;
import com.l1yp.model.db.ProcessModelPageScheme;
import com.l1yp.model.db.SysDept;
import com.l1yp.model.db.SysDictValue;
import com.l1yp.model.db.SysUser;
import com.l1yp.model.db.WFFieldDept;
import com.l1yp.model.db.WFFieldDict;
import com.l1yp.model.db.WFFieldUser;
import com.l1yp.model.param.process.ProcessTaskCompleteParam;
import com.l1yp.model.param.process.view.ProcessTodoTaskView;
import com.l1yp.model.view.ProcessModelPageInfoView;
import com.l1yp.model.view.ProcessModelPageSchemeView;
import com.l1yp.model.view.ProcessOutComeView;
import com.l1yp.model.view.ProcessTaskView;
import com.l1yp.model.view.SysUserView;
import com.l1yp.util.ProcessModelUtil;
import com.l1yp.util.RequestUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.FlowNode;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.HistoryService;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.impl.HistoricActivityInstanceQueryProperty;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskInfo;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProcessService {

    static final Logger log = LoggerFactory.getLogger(ProcessService.class);

    @Resource
    RuntimeService runtimeService;

    @Resource
    TaskService taskService;

    @Resource
    HistoryService historyService;

    @Resource
    RepositoryService repositoryService;

    @Resource
    ProcessEngine processEngine;

    @Resource
    ProcessModelMapper processModelMapper;

    @Resource
    ProcessNodePageMapper processNodePageMapper;

    @Resource
    ProcessModelPageSchemeMapper processModelPageSchemeMapper;

    @Resource
    ProcessFieldDefinitionMapper processFieldDefinitionMapper;

    @Resource
    WFFieldUserMapper wfFieldUserMapper;

    @Resource
    WFFieldDeptMapper wfFieldDeptMapper;

    @Resource
    WFFieldDictMapper wfFieldDictMapper;


    @Resource
    ProcessModelBpmnMapper processModelBpmnMapper;

    @Resource
    UserMapper userMapper;

    @Resource
    SysDeptMapper sysDeptMapper;

    @Resource
    SysDictValueMapper sysDictValueMapper;

    private final static Set<String> NOT_CLIENT_INPUT_FIELDS = Set.of(
            "id", "process_bpmn_id", "process_definition_id", "process_instance_id", "code",
            "creator", "update_by", "update_time", "create_time"
    );

    /**
     * 启动流程
     */
    @Transactional
    public ResultData<Void> createProcess(ProcessCreateParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();
        ProcessModelDefinition processModel = processModelMapper.findByProcessKey(param.getProcessKey());
        if (processModel == null) {
            return ResultData.err(400, "不存在该流程");
        }
        ProcessModelBpmnBase publishVersion = processModelBpmnMapper.findPublishBPMNVersionByProcessKey(param.getProcessKey());
        if (publishVersion == null) {
            return ResultData.err(400, "请先发布一个该流程的流程版本");
        }

        String maxCode = genCode(processModel);

        try {
            Authentication.setAuthenticatedUserId(loginUser.getId().toString());
            String tableName = ProcessModelUtil.getProcessModelTableName(param.getProcessKey());
            ProcessCommonInfo pci = new ProcessCommonInfo();
            pci.setProcessBpmnId(publishVersion.getId());
            pci.setProcessDefinitionId(publishVersion.getProcessDefinitionId());
            pci.setCode(maxCode); // TODO: gen code
            pci.setName((String) param.getParams().get("name")); // FIXME: 校验
            pci.setCreator(loginUser.getId());
            pci.setUpdateBy(loginUser.getUsername());
            pci.setTableName(tableName);
            processModelMapper.createProcess(pci);
            log.info("create process success, insert id: {}", pci.getId());

            List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByProcessKey(param.getProcessKey());
            Map<String, ProcessFieldDefinition> fieldMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getName, it -> it));
            Map<String, Object> params = new HashMap<>();
            Set<Entry<String, Object>> entries = param.getParams().entrySet(); // TODO 过滤 特殊字段：creator update_by update_time
            for (Entry<String, Object> entry : entries) {
                if (!NOT_CLIENT_INPUT_FIELDS.contains(entry.getKey())) {
                    params.put(entry.getKey(), entry.getValue());
                }
            }
            params.put("process_bpmn_id", publishVersion.getId());
            params.put("process_definition_id", publishVersion.getProcessDefinitionId());
            Map<String, Object> variables = new HashMap<>(params);
            processModelMapper.updateFields(tableName, pci.getId(), fieldMap, variables);

            updateAssociationTable(processFieldDefinitions, pci.getId(), null, param.getProcessKey(), params);


            ProcessInstance processInstance = runtimeService.startProcessInstanceById(publishVersion.getProcessDefinitionId(), pci.getId().toString());
            variables.clear();
            variables.put("process_instance_id", processInstance.getProcessInstanceId());
            processModelMapper.updateFields(tableName, pci.getId(), fieldMap, variables);

            updateAssociationTableProcessInstanceId(processModel.getProcessKey(), pci.getId(), processInstance.getProcessInstanceId());

        } finally {
            Authentication.setAuthenticatedUserId(null);
        }

        return ResultData.OK;
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public String genCode(ProcessModelDefinition processModelDefinition) {
        StringBuilder sb = new StringBuilder();
        sb.append(processModelDefinition.getCodePrefix());
        sb.append(processModelDefinition.getCodeJoiner());
        SimpleDateFormat df = new SimpleDateFormat(processModelDefinition.getCodeTimePattern());
        sb.append(df.format(new Date()));
        sb.append(processModelDefinition.getCodeJoiner2());
        String codePrefix = sb.toString();

        String codeSuffix = processModelDefinition.getCodeSuffix(); // ##
        int suffixLen = codeSuffix.length();
        // share lock
        String maxCode = processModelMapper.findMaxCode(ProcessModelUtil.getProcessModelTableName(processModelDefinition.getProcessKey()), codePrefix);
        if (maxCode == null) {
            sb.append(String.format("%0" + suffixLen + "d", 1));
        } else {
            String maxSeq = maxCode.substring(maxCode.length() - suffixLen);
            String seq = String.format("%0" + suffixLen + "d", Integer.parseInt(maxSeq) + 1);
            sb.append(seq);
        }

        return sb.toString();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateAssociationTable(List<ProcessFieldDefinition> processFieldDefinitions, Long processId, String processInstanceId, String processKey, Map<String, Object> params) {
        SysUser loginUser = RequestUtils.getLoginUser();
        List<WFFieldUser> wfFieldUsers = new ArrayList<>();
        List<WFFieldDept> wfFieldDepts = new ArrayList<>();
        List<WFFieldDict> wfFieldDicts = new ArrayList<>();
        for (ProcessFieldDefinition processFieldDefinition : processFieldDefinitions) {
            if (processFieldDefinition.getComponentType() == ComponentType.MULTI_USER) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    List<Object> userIds = (List<Object>) params.get(processFieldDefinition.getName());
                    for (Object userId : userIds) {
                        WFFieldUser fieldUser = new WFFieldUser();
                        fieldUser.setProcessKey(processKey);
                        fieldUser.setWfId(processId);
                        fieldUser.setProcessInstanceId(processInstanceId);
                        fieldUser.setFieldId(processFieldDefinition.getId());
                        fieldUser.setUserId(((Number) userId).longValue());
                        fieldUser.setUpdateBy(loginUser.getUsername());
                        wfFieldUsers.add(fieldUser);
                    }
                }
            }
            else if (processFieldDefinition.getComponentType() == ComponentType.SINGLE_USER) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    Number userId = (Number) params.get(processFieldDefinition.getName());
                    WFFieldUser fieldUser = new WFFieldUser();
                    fieldUser.setProcessKey(processKey);
                    fieldUser.setWfId(processId);
                    fieldUser.setProcessInstanceId(processInstanceId);
                    fieldUser.setFieldId(processFieldDefinition.getId());
                    fieldUser.setUserId(userId.longValue());
                    fieldUser.setUpdateBy(loginUser.getUsername());
                    wfFieldUsers.add(fieldUser);
                }
            }
            else if (processFieldDefinition.getComponentType() == ComponentType.SINGLE_DEPT) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    Number deptId = (Number) params.get(processFieldDefinition.getName());
                    WFFieldDept fieldDept = new WFFieldDept();
                    fieldDept.setProcessKey(processKey);
                    fieldDept.setWfId(processId);
                    fieldDept.setProcessInstanceId(processInstanceId);
                    fieldDept.setFieldId(processFieldDefinition.getId());
                    fieldDept.setDeptId(deptId.longValue());
                    fieldDept.setUpdateBy(loginUser.getUsername());
                    wfFieldDepts.add(fieldDept);
                }
            }
            else if (processFieldDefinition.getComponentType() == ComponentType.MULTI_DEPT) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    Number deptId = (Number) params.get(processFieldDefinition.getName());
                    WFFieldDept fieldDept = new WFFieldDept();
                    fieldDept.setProcessKey(processKey);
                    fieldDept.setWfId(processId);
                    fieldDept.setProcessInstanceId(processInstanceId);
                    fieldDept.setFieldId(processFieldDefinition.getId());
                    fieldDept.setDeptId(deptId.longValue());
                    fieldDept.setUpdateBy(loginUser.getUsername());
                    wfFieldDepts.add(fieldDept);
                }
            }
            else if (processFieldDefinition.getComponentType() == ComponentType.SINGLE_DICT) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    Number dictId = (Number) params.get(processFieldDefinition.getName());
                    WFFieldDict fieldDict = new WFFieldDict();
                    fieldDict.setProcessKey(processKey);
                    fieldDict.setWfId(processId);
                    fieldDict.setProcessInstanceId(processInstanceId);
                    fieldDict.setFieldId(processFieldDefinition.getId());
                    fieldDict.setDictId(dictId.longValue());
                    fieldDict.setUpdateBy(loginUser.getUsername());
                    wfFieldDicts.add(fieldDict);
                }
            }
            else if (processFieldDefinition.getComponentType() == ComponentType.MULTI_DICT) {
                if (params.containsKey(processFieldDefinition.getName())) {
                    Number deptId = (Number) params.get(processFieldDefinition.getName());
                    WFFieldDict fieldDict = new WFFieldDict();
                    fieldDict.setProcessKey(processKey);
                    fieldDict.setWfId(processId);
                    fieldDict.setProcessInstanceId(processInstanceId);
                    fieldDict.setFieldId(processFieldDefinition.getId());
                    fieldDict.setDictId(deptId.longValue());
                    fieldDict.setUpdateBy(loginUser.getUsername());
                    wfFieldDicts.add(fieldDict);
                }
            }
        }
        if (!CollectionUtils.isEmpty(wfFieldUsers)) {
            Set<Long> fieldIds = wfFieldUsers.stream().map(WFFieldUser::getFieldId).collect(Collectors.toSet());
            wfFieldUserMapper.deleteFields(processId, fieldIds);
            wfFieldUserMapper.insertList(wfFieldUsers);
        }
        if (!CollectionUtils.isEmpty(wfFieldDepts)) {
            Set<Long> fieldIds = wfFieldDepts.stream().map(WFFieldDept::getFieldId).collect(Collectors.toSet());
            wfFieldDeptMapper.deleteFields(processId, fieldIds);
            wfFieldDeptMapper.insertList(wfFieldDepts);
        }
        if (!CollectionUtils.isEmpty(wfFieldDicts)) {
            Set<Long> fieldIds = wfFieldDicts.stream().map(WFFieldDict::getFieldId).collect(Collectors.toSet());
            wfFieldDictMapper.deleteFields(processId, fieldIds);
            wfFieldDictMapper.insertList(wfFieldDicts);
        }
    }

    public void updateAssociationTableProcessInstanceId(String processKey, Long wfId, String processInstanceId) {
        wfFieldUserMapper.updateProcessInstanceId(processKey, wfId, processInstanceId);
        wfFieldDeptMapper.updateProcessInstanceId(processKey, wfId, processInstanceId);
        wfFieldDictMapper.updateProcessInstanceId(processKey, wfId, processInstanceId);
    }

    /**
     * 我的任务列表
     * @return
     */
    public ResultData<List<ProcessTaskView>> listAssigneeTask() {
        SysUser loginUser = RequestUtils.getLoginUser();

        List<Task> tasks = taskService.createTaskQuery().taskAssignee(loginUser.getId().toString()).active().list();
        return ResultData.ok(buildTaskView(loginUser.getId(), tasks));
    }


    /**
     * 我的待认领任务列表
     */
    public ResultData<List<ProcessTaskView>> listCandidateTask() {
        SysUser loginUser = RequestUtils.getLoginUser();

        List<Task> tasks = taskService.createTaskQuery().taskCandidateUser(loginUser.getId().toString()).active().list();
        return ResultData.ok(buildTaskView(loginUser.getId(), tasks));
    }

    /**
     * 构建任务视图
     * @param userId 用户ID可为null
     * @param tasks 任务列表
     * @return 任务视图列表
     */
    private List<ProcessTaskView> buildTaskView(Long userId, List<Task> tasks) {
        Map<String, List<Task>> processDefinitionTaskGroup = tasks.stream().collect(Collectors.groupingBy(TaskInfo::getProcessDefinitionId, Collectors.toList()));
        List<ProcessTaskView> result = new ArrayList<>();
        Set<Entry<String, List<Task>>> entries = processDefinitionTaskGroup.entrySet();
        for (Entry<String, List<Task>> entry : entries) {
            String processDefinitionId = entry.getKey();
            String processKey = processModelBpmnMapper.findProcessKeyByProcessDefinitionId(processDefinitionId);
            if (processKey == null) {
                log.info("cannot find processBPMN processKey with userId: {}, processDefinitionId: {}",
                        userId, processDefinitionId);
                continue;
            }

            ProcessModelDefinition pmd = processModelMapper.findByProcessKey(processKey);
            if (pmd == null) {
                log.info("cannot find processKey with userId: {}, processDefinitionId: {}",
                        userId, processDefinitionId);
                continue;
            }

            String tableName = ProcessModelUtil.getProcessModelTableName(processKey);
            List<Task> groupTasks = entry.getValue();
            List<String> processInstanceIds = groupTasks.stream().map(TaskInfo::getProcessInstanceId).toList();
            Map<String, Task> taskProcessInstanceMap = groupTasks.stream().collect(Collectors.toMap(TaskInfo::getProcessInstanceId, it -> it));


            List<ProcessCommonInfo> processCommonInfos = processModelMapper.selectProcessInfoByProcessInstanceId(tableName, processInstanceIds);
            for (ProcessCommonInfo processCommonInfo : processCommonInfos) {
                ProcessTaskView view = new ProcessTaskView();
                BeanUtils.copyProperties(processCommonInfo, view);
                view.setProcessTypeName(pmd.getTitle());
                view.setTaskId(taskProcessInstanceMap.get(processCommonInfo.getProcessInstanceId()).getId());
                view.setProcessInstanceId(processCommonInfo.getProcessInstanceId());
                result.add(view);
            }
        }
        return result;
    }


    /**
     * 认领任务
     */
    public ResultData<Void> claimTask(String taskId) {
        SysUser loginUser = RequestUtils.getLoginUser();

        taskService.claim(taskId, loginUser.getId().toString()); // task 必须是 candidateUser Task
//        taskService.setAssignee();
//        taskService.setOwner(); // 用于委托他人办理 不会校验

        return ResultData.OK;
    }

    /**
     * 撤回任务
     */
    public ResultData<Void> unclaimTask(String taskId) {
        SysUser loginUser = RequestUtils.getLoginUser();

        taskService.unclaim(taskId); // task 必须是 candidateUser Task
//        taskService.setAssignee();
//        taskService.setOwner(); // 用于委托他人办理 不会校验

        return ResultData.OK;
    }

    /**
     * 我的待办
     */
    public ResultData<List<ProcessTodoTaskView>> listTodoTasks() {
        SysUser loginUser = RequestUtils.getLoginUser();
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(String.valueOf(loginUser.getId()));
        long count = taskQuery.count();
        if (count == 0) {
            return ResultData.ok(Collections.emptyList());
        }

        // 任务列表
        List<Task> tasks = taskQuery.list();

        // 流程定义ID集合
        Set<String> processDefinitionIds = tasks.stream().map(TaskInfo::getProcessDefinitionId).collect(Collectors.toSet());

        // 流程版本定义列表
        List<ProcessModelBpmnBase> processModelInfos = processModelBpmnMapper.listBaseByProcessDefinitionIds(processDefinitionIds.stream().toList());

        // 流程标识列表
        Set<String> processKeySet = processModelInfos.stream().map(ProcessModelBpmnBase::getProcessKey).collect(Collectors.toSet());

        // 流程模型列表
        List<ProcessModelDefinition> processModelDefinitions = processModelMapper.listByProcessKeys(processKeySet.stream().toList());
        // 流程模型映射
        Map<String, ProcessModelDefinition> processDefinitionMap = processModelDefinitions.stream().collect(Collectors.toMap(ProcessModelDefinition::getProcessKey, it -> it));

        // 流程版本映射 [流程标识, 流程版本列表]
        Map<String, List<ProcessModelBpmnBase>> processKeyMap
                = processModelInfos.stream().collect(Collectors.groupingBy(ProcessModelBpmnBase::getProcessKey, Collectors.toList()));


        List<ProcessTodoTaskView> result = new ArrayList<>();
        List<ProcessCommonInfo> processList = new ArrayList<>();
        Set<Entry<String, List<ProcessModelBpmnBase>>> entries = processKeyMap.entrySet();
        for (Entry<String, List<ProcessModelBpmnBase>> entry : entries) {
            String processKey = entry.getKey();
            ProcessModelDefinition processModelDefinition = processDefinitionMap.get(processKey);
            String tableName = ProcessModelUtil.getProcessModelTableName(processKey);
            List<ProcessModelBpmnBase> list = entry.getValue();
            Set<String> processDefinitionIdSet = list.stream()
                    .map(ProcessModelBpmnBase::getProcessDefinitionId)
                    .collect(Collectors.toSet());

            List<String> processInstanceIds = tasks.stream()
                    .filter(it -> processDefinitionIdSet.contains(it.getProcessDefinitionId()))
                    .map(TaskInfo::getProcessInstanceId).toList();

            List<ProcessCommonInfo> processCommonInfos = processModelMapper.selectProcessInfoByProcessInstanceId(tableName, processInstanceIds);
            processList.addAll(processCommonInfos);

            for (ProcessCommonInfo processCommonInfo : processCommonInfos) {
                ProcessTodoTaskView item = new ProcessTodoTaskView();
                item.processType = processModelDefinition.getTitle();
                item.processId = processCommonInfo.getId();
                item.processBpmnId = processCommonInfo.getProcessBpmnId();
                item.processDefinitionId = processCommonInfo.getProcessDefinitionId();
                item.processKey = processKey;
                item.name = processCommonInfo.getName();
                item.creator = processCommonInfo.getCreator();
                item.createTime = processCommonInfo.getCreateTime();
                result.add(item);
            }
        }

        Set<Long> creators = processList.stream().map(ProcessCommonInfo::getCreator).collect(Collectors.toSet());
        List<SysUserView> userList = userMapper.listByIdList(List.copyOf(creators));
        Map<String, SysUserView> userMap = userList.stream().collect(Collectors.toMap(SysUserView::getUsername, it -> it));
        result.forEach(it -> it.creator = userMap.get(String.valueOf(it.creator)));

        return ResultData.ok(result);


    }

    /**
     * 我处理过的流程
     */
    public ResultData<List<ProcessTodoTaskView>> listMyHistoryTasks() {
        SysUser loginUser = RequestUtils.getLoginUser();
        HistoricTaskInstanceQuery taskInstanceQuery = historyService.createHistoricTaskInstanceQuery().taskAssignee(String.valueOf(loginUser.getId()));
        long count = taskInstanceQuery.count();
        if (count == 0) {
            return ResultData.ok(Collections.emptyList());
        }

        // 任务列表
        List<HistoricTaskInstance> taskInstances = taskInstanceQuery.list();

        // 流程定义ID集合
        Set<String> processDefinitionIds = taskInstances.stream().map(TaskInfo::getProcessDefinitionId).collect(Collectors.toSet());

        // 流程版本定义列表
        List<ProcessModelBpmnBase> processModelInfos = processModelBpmnMapper.listBaseByProcessDefinitionIds(processDefinitionIds.stream().toList());

        // 流程标识列表
        Set<String> processKeySet = processModelInfos.stream().map(ProcessModelBpmnBase::getProcessKey).collect(Collectors.toSet());

        // 流程模型列表
        List<ProcessModelDefinition> processModelDefinitions = processModelMapper.listByProcessKeys(processKeySet.stream().toList());
        // 流程模型映射
        Map<String, ProcessModelDefinition> processDefinitionMap = processModelDefinitions.stream().collect(Collectors.toMap(ProcessModelDefinition::getProcessKey, it -> it));

        // 流程版本映射 [流程标识, 流程版本列表]
        Map<String, List<ProcessModelBpmnBase>> processKeyMap
                = processModelInfos.stream().collect(Collectors.groupingBy(ProcessModelBpmnBase::getProcessKey, Collectors.toList()));


        List<ProcessTodoTaskView> result = new ArrayList<>();
        List<ProcessCommonInfo> processList = new ArrayList<>();
        Set<Entry<String, List<ProcessModelBpmnBase>>> entries = processKeyMap.entrySet();
        for (Entry<String, List<ProcessModelBpmnBase>> entry : entries) {
            String processKey = entry.getKey();
            ProcessModelDefinition processModelDefinition = processDefinitionMap.get(processKey);
            String tableName = ProcessModelUtil.getProcessModelTableName(processKey);
            List<ProcessModelBpmnBase> list = entry.getValue();
            Set<String> processDefinitionIdSet = list.stream()
                    .map(ProcessModelBpmnBase::getProcessDefinitionId)
                    .collect(Collectors.toSet());

            List<String> processInstanceIds = taskInstances.stream()
                    .filter(it -> processDefinitionIdSet.contains(it.getProcessDefinitionId()))
                    .map(TaskInfo::getProcessInstanceId).toList();

            List<ProcessCommonInfo> processCommonInfos = processModelMapper.selectProcessInfoByProcessInstanceId(tableName, processInstanceIds);
            processList.addAll(processCommonInfos);

            for (ProcessCommonInfo processCommonInfo : processCommonInfos) {
                ProcessTodoTaskView item = new ProcessTodoTaskView();
                item.processType = processModelDefinition.getTitle();
                item.processId = processCommonInfo.getId();
                item.processBpmnId = processCommonInfo.getProcessBpmnId();
                item.processDefinitionId = processCommonInfo.getProcessDefinitionId();
                item.processKey = processKey;
                item.name = processCommonInfo.getName();
                item.creator = processCommonInfo.getCreator();
                item.createTime = processCommonInfo.getCreateTime();
                result.add(item);
            }
        }

        Set<Long> creators = processList.stream().map(ProcessCommonInfo::getCreator).collect(Collectors.toSet());
        List<SysUserView> userList = userMapper.listByIdList(List.copyOf(creators));
        Map<String, SysUserView> userMap = userList.stream().collect(Collectors.toMap(SysUserView::getUsername, it -> it));
        result.forEach(it -> it.creator = userMap.get(it.creator));

        return ResultData.ok(result);
    }


    /**
     * 流程列表
     */
    public ResultData<List<Map<String, Object>>> processListByKey(String processKey) {
        String tableName = ProcessModelUtil.getProcessModelTableName(processKey);

        List<Map<String, Object>> list = processModelMapper.listOfWF(tableName);
        if (CollectionUtils.isEmpty(list)) {
            return ResultData.ok(Collections.emptyList());
        }

        Set<Long> userIds = new HashSet<>();

        for (Map<String, Object> map : list) {
            Number creator = (Number) map.get("creator");
            userIds.add(creator.longValue());

            String processInstanceId = (String) map.get("process_instance_id");

            long count = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).count();
            if (count == 0L) {
                // 流程已完结
                map.put("assignee", null);
            } else {
                Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
                String assignee = task.getAssignee();
                if (assignee != null) {
                    userIds.add(Long.valueOf(assignee));
                }
                map.put("assignee", assignee);
            }

        }

        if (CollectionUtils.isEmpty(userIds)) {
            return ResultData.ok(list);
        }

        List<SysUserView> userViews = userMapper.listByIdList(userIds);
        Map<Long, SysUserView> userIdMap = userViews.stream().collect(Collectors.toMap(SysUserView::getId, it -> it));

        for (Map<String, Object> map : list) {
            Number creator = (Number) map.get("creator");
            map.put("creator", userIdMap.get(creator.longValue()));

            String processInstanceId = (String) map.get("process_instance_id");
            String assignee = (String) map.get("assignee");
            if (assignee != null) {
                SysUserView userView = userIdMap.get(Long.valueOf(assignee));
                map.put("assignee", userView);
            }

        }

        return ResultData.ok(list);
    }

    /**
     * 流程详情
     */
    public ResultData<Map<String, Object>> processInfo(String processKey, Long id) {
        SysUser loginUser = RequestUtils.getLoginUser();
        String tableName = ProcessModelUtil.getProcessModelTableName(processKey);
        List<ProcessFieldDefinition> processFields = processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
        Map<Long, ProcessFieldDefinition> fieldDefinitionMap = processFields.stream().collect(Collectors.toMap(ProcessFieldDefinition::getId, it -> it));

        Map<String, Object> processInfo = processModelMapper.findProcessInfoById(tableName, id);
        if (processInfo == null) {
            return ResultData.err(400, "获取不到流程信息");
        }
        String processInstanceId = (String) processInfo.get("process_instance_id");
        Long processBpmnId = (Long) processInfo.get("process_bpmn_id");

        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        String creator = historicProcessInstance.getStartUserId();
        String endActivityId = historicProcessInstance.getEndActivityId();

        boolean hasUserField = processFields.stream().anyMatch(ProcessFieldDefinition::isUserType);
        Map<Long, SysUserView> userMap = Collections.emptyMap();
        List<WFFieldUser> WFFieldUsers = Collections.emptyList();
        Set<Long> userIds = new HashSet<>();
        if (hasUserField) {
            Object WFId = processInfo.get("id");
            WFFieldUsers = wfFieldUserMapper.listByWFID(processKey, ((Number) WFId).longValue());
            userIds.add(Long.parseLong(creator));
            WFFieldUsers.stream().map(WFFieldUser::getUserId).forEach(userIds::add);

        }
        List<SysUserView> userViews = userMapper.listByIdList(userIds);
        userMap = userViews.stream().collect(Collectors.toMap(SysUserView::getId, it -> it));
        processInfo.put("creator", userMap.get(Long.parseLong(creator)));

        boolean hasDeptField = processFields.stream().anyMatch(ProcessFieldDefinition::isDeptType);
        List<WFFieldDept> WFFieldDepts = Collections.emptyList();
        Map<Long, SysDept> deptMap = Collections.emptyMap();
        if (hasDeptField) {
            Object WFId = processInfo.get("id");
            WFFieldDepts = wfFieldDeptMapper.listByWFID(processKey, ((Number) WFId).longValue());
            List<SysDept> depts = sysDeptMapper.listByIdList(WFFieldDepts.stream().map(WFFieldDept::getDeptId).collect(Collectors.toSet()));
            deptMap = depts.stream().collect(Collectors.toMap(SysDept::getId, it -> it));
        }

        boolean hasDictField = processFields.stream().anyMatch(ProcessFieldDefinition::isDictType);
        Map<Long, SysDictValue> dictMap = Collections.emptyMap();
        List<WFFieldDict> WFFieldDicts = Collections.emptyList();

        if (hasDictField) {
            Object WFId = processInfo.get("id");
            WFFieldDicts = wfFieldDictMapper.listByWFID(processKey, ((Number) WFId).longValue());
            if (CollectionUtils.isEmpty(WFFieldDicts)) {
                dictMap = Collections.emptyMap();
            } else {
                List<SysDictValue> depts = sysDictValueMapper.listByIdList(WFFieldDicts.stream().map(WFFieldDict::getDictId).collect(Collectors.toSet()));
                dictMap = depts.stream().collect(Collectors.toMap(SysDictValue::getId, it -> it));
            }
        }


        for (ProcessFieldDefinition processField : processFields) {
            if (processField.isUserType()) {
                List<WFFieldUser> wfFieldUsers = WFFieldUsers.stream().filter(it -> it.getFieldId().equals(processField.getId())).toList();
                if (processField.getComponentType() == ComponentType.SINGLE_USER) {
                    if (CollectionUtils.isEmpty(wfFieldUsers)) {
                        if (!NOT_CLIENT_INPUT_FIELDS.contains(processField.getName())) {
                            processInfo.put(processField.getName(), null);
                        }
                    }
                    else {
                        // size 必须是1
                        processInfo.put(processField.getName(), userMap.get(wfFieldUsers.get(0).getUserId()));
                    }
                }
                else if (processField.getComponentType() == ComponentType.MULTI_USER) {
                    if (CollectionUtils.isEmpty(wfFieldUsers)) {
                        processInfo.put(processField.getName(), Collections.emptyList());
                    } else {
                        // size 必须是1
                        final Map<Long, SysUserView> localMap = userMap;
                        List<SysUserView> views = wfFieldUsers.stream().map(it -> localMap.get(it.getUserId())).toList();
                        processInfo.put(processField.getName(), views);
                    }
                }
            } // 用户类型
            else if (processField.isDictType()) {
                List<WFFieldDict> wfFieldDicts = WFFieldDicts.stream().filter(it -> it.getFieldId().equals(processField.getId())).toList();
                if (processField.getComponentType() == ComponentType.SINGLE_DICT) {
                    if (CollectionUtils.isEmpty(wfFieldDicts)) {
                        processInfo.put(processField.getName(), null);
                    }
                    else {
                        // size 必须是1
                        processInfo.put(processField.getName(), dictMap.get(wfFieldDicts.get(0).getDictId()));
                    }
                }
                else if (processField.getComponentType() == ComponentType.MULTI_DICT) {
                    if (CollectionUtils.isEmpty(wfFieldDicts)) {
                        processInfo.put(processField.getName(), Collections.emptyList());
                    }
                    else {
                        // size 必须是1
                        final Map<Long, SysDictValue> localMap = dictMap;
                        List<SysDictValue> views = wfFieldDicts.stream().map(it -> localMap.get(it.getDictId())).toList();
                        processInfo.put(processField.getName(), views);
                    }
                }
            }  // 字典类型
            else if (processField.isDeptType()) {
                List<WFFieldDept> wfFieldDepts = WFFieldDepts.stream().filter(it -> it.getFieldId().equals(processField.getId())).toList();
                if (processField.getComponentType() == ComponentType.SINGLE_DEPT) {
                    if (CollectionUtils.isEmpty(wfFieldDepts)) {
                        if (!NOT_CLIENT_INPUT_FIELDS.contains(processField.getName())) {
                            processInfo.put(processField.getName(), null);
                        }
                    } else {
                        // size 必须是1
                        processInfo.put(processField.getName(), dictMap.get(wfFieldDepts.get(0).getDeptId()));
                    }
                } else if (processField.getComponentType() == ComponentType.MULTI_DEPT) {
                    if (CollectionUtils.isEmpty(wfFieldDepts)) {
                        processInfo.put(processField.getName(), Collections.emptyList());
                    } else {
                        // size 必须是1
                        final Map<Long, SysDept> localMap = deptMap;
                        List<SysDept> views = wfFieldDepts.stream().map(it -> localMap.get(it.getDeptId())).toList();
                        processInfo.put(processField.getName(), views);
                    }
                }
            } // 部门类型
        }

        processInfo.put("field_definition", processFields);

        long count = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).count();
        if (count == 0L) {
            processInfo.put("outcomes", Collections.emptyList());
            processInfo.put("current_node_key", endActivityId);

            ProcessModelNodePage pageInfo = processNodePageMapper.findByBpmnIdAndNodeId(processBpmnId, endActivityId);
            if (pageInfo == null) {
                processInfo.put("page_info", null);
            } else {
                List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageScheme(pageInfo.getProcessModelPageId());
                pageScheme.forEach(it -> it.setField(fieldDefinitionMap.get(it.getFieldId())));
                ProcessModelPageInfoView view = buildProcessModelPageInfoView(pageInfo, pageScheme);
                view.fields = processFields;
                processInfo.put("page_info", view);
            }
            return ResultData.ok(processInfo);

        }

        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        final Map<Long, SysUserView> localMap = userMap;
        List<Long> assignees = tasks.stream().filter(task -> task.getAssignee() != null).map(TaskInfo::getAssignee).map(Long::valueOf).toList();
        List<Long> notExistUserIds = assignees.stream().filter(it -> !localMap.containsKey(it)).toList();
        if (!CollectionUtils.isEmpty(notExistUserIds)) {
            List<SysUserView> assigneeUserViews = userMapper.listByIdList(notExistUserIds);
            assigneeUserViews.forEach(it -> localMap.put(it.getId(), it));
        }
        List<SysUserView> assigneeUsers = assignees.stream().map(userMap::get).toList();
        processInfo.put("assignees", assigneeUsers);

        Task task = tasks.get(0);
        String taskDefinitionKey = task.getTaskDefinitionKey();
        processInfo.put("current_node_key", taskDefinitionKey);

        BpmnModel bpmnModel = repositoryService.getBpmnModel(historicProcessInstance.getProcessDefinitionId());
        List<SequenceFlow> outgoingFlows = ((FlowNode) bpmnModel.getFlowElement(taskDefinitionKey)).getOutgoingFlows();
//        List<String> outcomes = outgoingFlows.stream()
//                .sorted(Comparator.comparingInt(a -> Integer.parseInt(Objects.requireNonNullElse(a.getAttributeValue("", "order"), "0"))))
//                .map(FlowElement::getName)
//                .toList();
//        processInfo.put("outcomes", outcomes);

        ProcessModelNodePage pageInfo = processNodePageMapper.findByBpmnIdAndNodeId(processBpmnId, taskDefinitionKey);
        if (pageInfo == null) {
            processInfo.put("page_info", null);
        } else {
            List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageScheme(pageInfo.getProcessModelPageId());
            pageScheme.forEach(it -> it.setField(fieldDefinitionMap.get(it.getFieldId())));
            ProcessModelPageInfoView view = buildProcessModelPageInfoView(pageInfo, pageScheme);
            view.fields = processFields;
            processInfo.put("page_info", view);
        }


        long taskCnt = taskService.createTaskQuery().processInstanceId(processInstanceId).taskAssignee(String.valueOf(loginUser.getId())).count();
        if (taskCnt == 0) {
            // 无权审批
            processInfo.put("outcomes", Collections.emptyList());
            return ResultData.ok(processInfo);
        }

        List<ProcessOutComeView> outcomes = new ArrayList<>();
        for (SequenceFlow outgoingFlow : outgoingFlows) {
            ProcessOutComeView outcome = new ProcessOutComeView();
            outcome.name = outgoingFlow.getName();
            String orderStr = outgoingFlow.getAttributeValue("", "order");
            if (StringUtils.hasText(orderStr)) {
                outcome.order = Integer.parseInt(orderStr);
            }
            String nodeId = outgoingFlow.getId();
            pageInfo = processNodePageMapper.findByBpmnIdAndNodeId(processBpmnId, nodeId);
            if (pageInfo == null) {
                outcomes.add(outcome);
                continue;
            }
            List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageScheme(pageInfo.getProcessModelPageId());
            pageScheme.forEach(it -> it.setField(fieldDefinitionMap.get(it.getFieldId())));
            outcome.page = buildProcessModelPageInfoView(pageInfo, pageScheme);
            outcome.page.fields = processFields;

            outcomes.add(outcome);
            // FIXME: 若无关联界面，则只关注comment字段
        }
        processInfo.put("outcomes", outcomes);





        return ResultData.ok(processInfo);
    }

    private ProcessModelPageInfoView buildProcessModelPageInfoView(ProcessModelNodePage pageInfo, List<ProcessModelPageScheme> pageScheme) {
        ProcessModelPageInfoView view = new ProcessModelPageInfoView();
        view.processModelPageSchemeView = new ProcessModelPageSchemeView();
        view.processModelNodePage = pageInfo;
        if (CollectionUtils.isEmpty(pageScheme)) {
            // TODO: 提交界面可以不配界面
            return view;
        }
        view.processModelPageSchemeView.h5 = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("h5")).toList();
        view.processModelPageSchemeView.pad = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("pad")).toList();
        view.processModelPageSchemeView.pc = pageScheme.stream().filter(it -> it.getDevice().equalsIgnoreCase("pc")).toList();
        return view;
    }

    /**
     * 查询历史操作记录
     */
    public ResultData<List<HistoricActivityInstanceView>> readProcessHistory(String processInstanceId) {
        List<HistoricActivityInstance> activityInstances = historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(processInstanceId)
                .orderBy(HistoricActivityInstanceQueryProperty.START)
                .asc().list();

        Set<Long> userIds = activityInstances.stream().filter(it -> it.getAssignee() != null).map(HistoricActivityInstance::getAssignee).map(Long::valueOf).collect(Collectors.toSet());
        Map<String, SysUserView> userMap = Collections.emptyMap();
        if (!CollectionUtils.isEmpty(userIds)) {
            List<SysUserView> userViews = userMapper.listByIdList(userIds);
            userMap = userViews.stream().collect(Collectors.toMap(it -> String.valueOf(it.getId()), it -> it));
        }

        List<HistoricActivityInstanceView> historyViews = new ArrayList<>();
        for (HistoricActivityInstance activity : activityInstances) {
            HistoricActivityInstanceView view = new HistoricActivityInstanceView();
            view.id = activity.getId();
            view.activityId = activity.getActivityId();
            view.activityName = activity.getActivityName();
            view.activityType = activity.getActivityType();
            view.executionId = activity.getExecutionId();
            view.processInstanceId = activity.getProcessInstanceId();
            view.processDefinitionId = activity.getProcessDefinitionId();
            view.durationInMillis = activity.getDurationInMillis();
            view.startTime = activity.getStartTime();
            view.endTime = activity.getEndTime();
            view.deleteReason = activity.getDeleteReason();
            view.assignee = userMap.get(activity.getAssignee());
            view.taskId = activity.getTaskId();
            view.calledProcessInstanceId = activity.getCalledProcessInstanceId();
            historyViews.add(view);
        }

        return ResultData.ok(historyViews);

    }

    /**
     * 提交任务
     */
    public ResultData<Void> completeTask(ProcessTaskCompleteParam param) {
        SysUser loginUser = RequestUtils.getLoginUser();
        String tableName = ProcessModelUtil.getProcessModelTableName(param.processKey);
        ProcessCommonInfo processCommonInfo = processModelMapper.findProcessInfoByProcessInstanceId(tableName, param.processInstanceId);
        if (processCommonInfo == null) {
            return ResultData.err(400, "参数有误: 无法查询到流程信息");
        }

        // 查询流程字段列表
        List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByProcessKey(param.processKey);
        Map<Long, ProcessFieldDefinition> fieldMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getId, it -> it));
        Map<String, ProcessFieldDefinition> fieldNameMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getName, it -> it));

        // 获取当前用户的任务
        Task task = taskService.createTaskQuery().processInstanceId(param.processInstanceId).taskAssignee(String.valueOf(loginUser.getId())).singleResult();
        if (task == null) {
            // 当前用户无权限审批
            return ResultData.err(400, "无权审批");
        }

        String taskId = task.getId();
        // 获取当前流程的模型
        BpmnModel bpmnModel = repositoryService.getBpmnModel(task.getProcessDefinitionId());
        List<SequenceFlow> outgoingFlows = ((FlowNode) bpmnModel.getFlowElement(task.getTaskDefinitionKey())).getOutgoingFlows();
        Optional<SequenceFlow> flow = outgoingFlows.stream().filter(it -> it.getName().equals(param.outcome)).findAny();
        if (flow.isEmpty()) {
            // 不存在的出口
            String outcomes = outgoingFlows.stream().map(FlowElement::getName).collect(Collectors.joining(","));
            return ResultData.err(400, "参数有误: 不存在的出口: " + param.outcome + "(" + outcomes + ")");
        }
        SequenceFlow sequenceFlow = flow.get();
        String flowId = sequenceFlow.getId();
        // 查询绑定的页面信息
        ProcessModelNodePage pageInfo = processNodePageMapper.findByBpmnIdAndNodeId(processCommonInfo.getProcessBpmnId(), flowId);
        if (pageInfo != null) {
            List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageSchemeByDevice(pageInfo.getProcessModelPageId(), param.device);
            if (CollectionUtils.isEmpty(pageScheme)) {
                // 没配置界面
                Integer comment = pageInfo.getComment();
                if (comment == 2 && !StringUtils.hasText(param.comment)) {
                    // 必选
                    return ResultData.err(400, "请填写评论");
                }
            } else {
                List<ProcessModelPageScheme> writeableFields = pageScheme.stream()
                        .filter(it -> it.getWriteable().equals(1) && param.device.equals(it.getDevice()))
                        .toList();
                if (CollectionUtils.isEmpty(writeableFields)) {
                    // 没有可写字段
                } else {
                    // 需要更新的字段列表
                    writeableFields.forEach(it -> it.setField(fieldMap.get(it.getFieldId())));
                    Map<String, Object> fields = new HashMap<>();
                    for (ProcessModelPageScheme writeableField : writeableFields) {
                        fields.put(writeableField.getField().getName(), param.params.get(writeableField.getField().getName()));
                    }
                    // TODO: add UPDATE BEFORE interceptor
                    processModelMapper.updateFields(tableName, processCommonInfo.getId(), fieldNameMap, fields); // 更新的字段
                    List<ProcessFieldDefinition> fieldDefinitions = writeableFields.stream().map(ProcessModelPageScheme::getField).collect(Collectors.toList());
                    updateAssociationTable(fieldDefinitions, processCommonInfo.getId(), param.processInstanceId, param.processKey, fields);
                    // TODO: add UPDATE AFTER interceptor
                }
            }
            if (StringUtils.hasText(param.comment)) {
                taskService.addComment(taskId, param.processInstanceId, param.comment);
            }
        } else {
            // FIXME: 完全没配置界面信息则不校验
        }

        try {
            Authentication.setAuthenticatedUserId(loginUser.getId().toString());
            taskService.complete(taskId, null, Map.of("outcome", param.outcome));
        } finally {
            Authentication.setAuthenticatedUserId(null);
        }


        return ResultData.OK;
    }

    public ResultData<ProcessModelPageInfoView> getStartFormInfo(String processKey) {
        ProcessModelNodePage nodePage = processNodePageMapper.findStartPage(processKey);
        if (nodePage == null) {
            return ResultData.err(500, "请先配置启动界面");
        }

        List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
        Map<Long, ProcessFieldDefinition> fieldDefinitionMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getId, it -> it));

        List<ProcessModelPageScheme> pageScheme = processModelPageSchemeMapper.findPageScheme(nodePage.getProcessModelPageId());
        pageScheme.forEach(it -> it.setField(fieldDefinitionMap.get(it.getFieldId())));

        if (CollectionUtils.isEmpty(pageScheme)) {
            return ResultData.err(500, "启动界面尚未配置字段");
        }
        ProcessModelPageInfoView pageInfoView = buildProcessModelPageInfoView(nodePage, pageScheme);
        pageInfoView.fields = processFieldDefinitions;
        return ResultData.ok(pageInfoView);
    }

}
