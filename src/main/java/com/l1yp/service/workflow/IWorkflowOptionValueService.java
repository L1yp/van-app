package com.l1yp.service.workflow;

import com.l1yp.model.param.workflow.WorkflowOptionValueAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueUpdateParam;
import com.l1yp.model.view.workflow.WorkflowOptionValueView;

import java.util.List;

public interface IWorkflowOptionValueService {

    List<WorkflowOptionValueView> findValues(WorkflowOptionValueFindParam param);

    void addValue(WorkflowOptionValueAddParam param);

    void updateValue(WorkflowOptionValueUpdateParam param);

    void deleteOptionValue(String valueId);

    void resetOptionValue(String valueId);

}
