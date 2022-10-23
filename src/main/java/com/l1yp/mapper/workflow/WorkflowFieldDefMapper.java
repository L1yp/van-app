package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.TableScheme;
import com.l1yp.model.db.workflow.model.WorkflowFieldDef;
import com.l1yp.model.param.workflow.WorkflowFieldFindParam;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.ResultType;
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

    @ResultType(TableScheme.class)
    @Select("SELECT TABLE_NAME name, TABLE_COMMENT comment FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'van'")
    List<TableScheme> getTableName();


    @Select("SELECT COLUMN_NAME name, COLUMN_COMMENT comment FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'van' AND TABLE_NAME = #{tableName}")
    List<TableScheme> getTableColumn(@Param("tableName") String tableName);



}
