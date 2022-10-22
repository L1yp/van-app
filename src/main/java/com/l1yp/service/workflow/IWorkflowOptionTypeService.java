package com.l1yp.service.workflow;

import com.l1yp.model.param.workflow.WorkflowOptionTypeFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeUpdateParam;
import com.l1yp.model.view.workflow.WorkflowOptionTypeView;

import java.util.List;

public interface IWorkflowOptionTypeService {

    List<WorkflowOptionTypeView> findTypes(WorkflowOptionTypeFindParam param);

    /**
     * 添加数据源定义
     */
    void addType(WorkflowOptionTypeAddParam param);

    /**
     * 更新数据源定义
     */
    void updateType(WorkflowOptionTypeUpdateParam param);
}
