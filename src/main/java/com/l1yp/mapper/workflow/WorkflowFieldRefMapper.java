package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.model.WorkflowFieldRef;
import com.l1yp.model.param.workflow.WorkflowFieldRefParam;
import org.apache.ibatis.annotations.Delete;

public interface WorkflowFieldRefMapper extends BaseMapper<WorkflowFieldRef> {


    @Delete("DELETE FROM workflow_field_ref WHERE wf_key = #{wfKey} AND field_id = #{fieldId}")
    void unrefGlobalField(WorkflowFieldRefParam param);

}
