package com.l1yp.service.workflow.def;

import com.l1yp.model.common.PageData;
import com.l1yp.model.param.workflow.WorkflowTypeDefAddParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefPageParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefUpdateParam;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;

public interface IWorkflowTypeDefService {

    /**
     * 新增流程模型
     */
    void add(WorkflowTypeDefAddParam param);

    /**
     * 更新流程模型
     */
    void update(WorkflowTypeDefUpdateParam param);

    /**
     * 查询流程模型及版本列表
     */
    PageData<WorkflowTypeDefView> pageWfTypeDef(WorkflowTypeDefPageParam param);
}
