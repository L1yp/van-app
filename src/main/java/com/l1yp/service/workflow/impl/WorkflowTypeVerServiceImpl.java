package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.WorkflowTypeVerMapper;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeVerActiveParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerCopyParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerPendingParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import com.l1yp.service.workflow.IWorkflowTypeVerService;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class WorkflowTypeVerServiceImpl extends ServiceImpl<WorkflowTypeVerMapper, WorkflowTypeVer> implements IWorkflowTypeVerService {


    @Override
    @Transactional
    public void copy(WorkflowTypeVerCopyParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }

        Integer maxVer = getBaseMapper().findMaxVer(workflowTypeVer.getWfKey());
        WorkflowTypeVer newVer = getById(param.getId());
        newVer.setWfKey(workflowTypeVer.getWfKey());
        newVer.setVer(maxVer + 1);
        newVer.setRemark(workflowTypeVer.getRemark());
        newVer.setStatus(WorkflowTypeVer.PENDING);
        newVer.setXml(workflowTypeVer.getXml());

        save(newVer);

    }

    @Override
    @Transactional
    public void updateXml(WorkflowTypeVerUpdateXmlParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }
        getBaseMapper().updateXml(param);
    }

    @Override
    @Transactional
    public void activeVer(WorkflowTypeVerActiveParam param) {
        WorkflowTypeVer workflowTypeVer = getById(param.getId());
        if (workflowTypeVer == null) {
            throw new VanException(400, "找不到源版本");
        }
        getBaseMapper().pendingAllByWfKey(workflowTypeVer.getWfKey());
    }

    @Override
    @Transactional
    public void pendingVer(WorkflowTypeVerPendingParam param) {
        getBaseMapper().activeVer(param.getId());
    }
}
