package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.model.WorkflowFieldDef;
import com.l1yp.model.param.workflow.WorkflowFieldFindParam;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import static com.baomidou.mybatisplus.core.toolkit.Constants.MYBATIS_PLUS;
import static com.baomidou.mybatisplus.core.toolkit.StringPool.UNDERSCORE;

public interface WorkflowFieldDefMapper extends BaseMapper<WorkflowFieldDef> {

    @Select("""
            SELECT *
            FROM workflow_field_def
            WHERE id IN ( SELECT field_id FROM workflow_field_ref WHERE wf_key = #{wfKey} ) OR scope = 'DEFAULT'
            """)
    @ResultMap(MYBATIS_PLUS + UNDERSCORE + "WorkflowFieldDef")
    List<WorkflowFieldDef> selectWFFields(WorkflowFieldFindParam param);

}
