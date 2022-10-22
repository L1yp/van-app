package com.l1yp.service.workflow;

import com.l1yp.model.param.workflow.WorkflowFieldDefAddParam;
import com.l1yp.model.param.workflow.WorkflowFieldDefUpdateParam;
import com.l1yp.model.param.workflow.WorkflowFieldFindParam;
import com.l1yp.model.param.workflow.WorkflowFieldRefParam;
import com.l1yp.model.view.workflow.WorkflowFieldDefView;

import java.util.List;

public interface IWorkflowFieldDefService {

    List<WorkflowFieldDefView> findFields(WorkflowFieldFindParam param);

    void addField(WorkflowFieldDefAddParam param);

    void updateField(WorkflowFieldDefUpdateParam param);

    void deleteField(String fieldId);

    void refGlobalField(WorkflowFieldRefParam param);

    void unrefGlobalField(WorkflowFieldRefParam param);

}
