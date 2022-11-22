package com.l1yp.service.workflow.def.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.cache.CacheResultType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.WorkflowTypeVerMapper;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeVerActiveParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerCopyParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerPendingParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.service.workflow.def.IWorkflowTypeVerService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class WorkflowTypeVerServiceImpl extends ServiceImpl<WorkflowTypeVerMapper, WorkflowTypeVer> implements IWorkflowTypeVerService {

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    @Resource
    CacheManager cacheManager;

    @Resource
    RepositoryService repositoryService;

    @Override
    @Transactional
    public void copy(WorkflowTypeVerCopyParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }

        Integer maxVer = getBaseMapper().findMaxVer(workflowTypeVer.getKey());
        WorkflowTypeVer newVer = getById(param.getId());
        newVer.setKey(workflowTypeVer.getKey());
        newVer.setVer(maxVer + 1);
        newVer.setRemark(workflowTypeVer.getRemark());
        newVer.setStatus(WorkflowTypeVer.PENDING);
        newVer.setXml(workflowTypeVer.getXml());


        save(newVer);

    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "wf_ver", key = "#p0.id")
    public void updateXml(WorkflowTypeVerUpdateXmlParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }
        getBaseMapper().updateXml(param);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "wf_ver", key = "#p0.id")
    public void activeVer(WorkflowTypeVerActiveParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }
        String key = workflowTypeVer.getKey();
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(key);
        if (workflowType == null) {
            throw new VanException(400, "流程模型不存在");
        }

        Deployment deployment = repositoryService.createDeployment()
                .key(workflowType.getKey())
                .name(workflowType.getName())
                .category(workflowType.getCategory())
                .addString(workflowType.getKey() + ".bpmn20.xml", workflowTypeVer.getXml())
                .deploy();

        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
        String processDefinitionId = processDefinition.getId();


        getBaseMapper().pendingAllByWfKey(workflowTypeVer.getKey());
        getBaseMapper().activeVer(param.getId(), processDefinitionId, param.getRemark());

        workflowTypeDefService.getBaseMapper().updateActiveInfo(workflowTypeVer.getId(), processDefinitionId, workflowType.getId());

        // 挂起版本 删除 流程模型缓存
        Cache cache = cacheManager.getCache("workflow_type");
        if (cache != null) {
            cache.evict("id:" + workflowType.getId());
            cache.evict("key:" + workflowType.getKey());
        }

    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "wf_ver", key = "#p0.id")
    public void pendingVer(WorkflowTypeVerPendingParam param) {
        WorkflowTypeVerServiceImpl proxy = (WorkflowTypeVerServiceImpl) AopContext.currentProxy();
        WorkflowTypeVerView workflowTypeVer = proxy.findVer(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "流程版本不存在");
        }

        String key = workflowTypeVer.getKey();
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(key);
        if (workflowType == null) {
            throw new VanException(400, "流程模型不存在");
        }

        getBaseMapper().pendingVer(param.getId());
        workflowTypeDefService.getBaseMapper().updateActiveInfo(null, null, workflowType.getId());

        // 挂起版本 删除 流程模型缓存
        Cache cache = cacheManager.getCache("workflow_type");
        if (cache != null) {
            cache.evict("id:" + workflowType.getId());
            cache.evict("key:" + workflowType.getKey());
        }

    }

    @Override
    @Cacheable(cacheNames = "wf_ver", key = "#p0", unless = "#p0 == null")
    @CacheResultType(WorkflowTypeVerView.class)
    public WorkflowTypeVerView findVer(String verId) {
        WorkflowTypeVer workflowTypeVer = getById(verId);
        if (workflowTypeVer == null) {
            throw new VanException(400, "id有错误");
        }
        return workflowTypeVer.toView();
    }
}
