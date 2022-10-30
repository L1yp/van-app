package com.l1yp.workflow.base;

import com.l1yp.model.db.workflow.model.WorkflowTypeDef;

import java.util.Map;

public interface IGenCodeProvider {

    String generator(WorkflowTypeDef workflowTypeDef, Map<String, Object> params);

}
