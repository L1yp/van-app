package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.WorkflowTypeVerMapper;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeVerActiveParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerCopyParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerPendingParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.service.workflow.IWorkflowTypeVerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class WorkflowTypeVerServiceImpl extends ServiceImpl<WorkflowTypeVerMapper, WorkflowTypeVer> implements IWorkflowTypeVerService {


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
        getBaseMapper().pendingAllByWfKey(workflowTypeVer.getKey());
        getBaseMapper().activeVer(param.getId());
        // TODO: 自动部署
    }

    @Override
    @Transactional
    public void pendingVer(WorkflowTypeVerPendingParam param) {
        getBaseMapper().pendingVer(param.getId());
    }

    @Override
    public WorkflowTypeVerView findVer(String verId) {
        WorkflowTypeVer workflowTypeVer = getById(verId);
        if (workflowTypeVer == null) {
            throw new VanException(400, "id有错误");
        }
        return workflowTypeVer.toView();
    }
}
