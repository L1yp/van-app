package com.l1yp.service.workflow;

import com.l1yp.model.common.PageData;
import com.l1yp.model.param.workflow.WorkflowTypeDefAddParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefPageParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefUpdateParam;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;

public interface IWorkflowTypeDefService {

    void add(WorkflowTypeDefAddParam param);

    void update(WorkflowTypeDefUpdateParam param);

    PageData<WorkflowTypeDefView> pageWfTypeDef(WorkflowTypeDefPageParam param);
}
