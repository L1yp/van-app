package com.l1yp.service.workflow;

import com.l1yp.model.param.workflow.WorkflowTypeVerActiveParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerCopyParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerPendingParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;

public interface IWorkflowTypeVerService {
    /**
     * 复制一个流程版本
     */
    void copy(WorkflowTypeVerCopyParam param);

    /**
     * 更新xml
     * @param param
     */
    void updateXml(WorkflowTypeVerUpdateXmlParam param);

    /**
     * 激活一个版本
     */
    void activeVer(WorkflowTypeVerActiveParam param);

    /**
     * 挂起一个版本
     */
    void pendingVer(WorkflowTypeVerPendingParam param);

    WorkflowTypeVerView findVer(String verId);
}
