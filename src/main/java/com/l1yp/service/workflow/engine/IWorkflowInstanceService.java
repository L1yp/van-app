package com.l1yp.service.workflow.engine;

import com.l1yp.model.db.modeling.page.PageScheme;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceCreateResult;

public interface IWorkflowInstanceService {

    WorkflowInstanceCreateResult startWorkflowInstance(WorkflowEngineInstanceCreateParam param);

    ModelingPageView getStartForm(String mkey);

}
