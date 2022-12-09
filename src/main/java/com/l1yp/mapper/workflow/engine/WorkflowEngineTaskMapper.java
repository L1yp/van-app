package com.l1yp.mapper.workflow.engine;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.engine.RuntimeTask;
import com.l1yp.model.db.workflow.engine.WorkflowTask;
import com.l1yp.model.param.workflow.task.WorkflowTaskFindParam;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;
import java.util.List;

public interface WorkflowEngineTaskMapper extends BaseMapper<RuntimeTask> {

    @Select("""
            <script>
            SELECT COUNT(T.ID_)
            FROM ACT_RU_TASK T
            LEFT JOIN ACT_HI_PROCINST I ON T.PROC_INST_ID_ = I.ID_
            WHERE T.ASSIGNEE_ = #{assignee}
            <if test="param.name != null and param.name != ''">
              AND I.NAME_ LIKE CONCAT('%', #{param.name}, '%')
            </if>
            </script>
            """)
    int countTodoTasks(@Param("assignee") String assignee,
                       @Param("param") WorkflowTaskFindParam param);

    @Select("""
            <script>
            SELECT COUNT(T.ID_)
            FROM ACT_HI_TASKINST T
            LEFT JOIN ACT_HI_PROCINST I ON T.PROC_INST_ID_ = I.ID_
            WHERE T.ASSIGNEE_ = #{assignee}
            <if test="param.name != null and param.name != ''">
              AND I.NAME_ LIKE CONCAT('%', #{param.name}, '%')
            </if>
            </script>
            """)
    int countDoneTasks(@Param("assignee") String assignee,
                       @Param("param") WorkflowTaskFindParam param);

    @Select("""
            <script>
            SELECT
              T.*, 
              I.NAME_ processInstanceName,
              I.START_USER_ID_ startUserId,
              I.START_TIME_ startTime
            FROM ACT_RU_TASK T
            LEFT JOIN ACT_HI_PROCINST I ON T.PROC_INST_ID_ = I.ID_
            WHERE T.ASSIGNEE_ = #{assignee}
            <if test="param.name != null and param.name != ''">
                AND I.NAME_ LIKE CONCAT('%', #{param.name}, '%')
            </if>
            ORDER BY I.START_TIME_ DESC
            LIMIT #{param.offset}, #{param.pageSize}
            </script>
            """)
    @Results(value = {
            @Result(column = "ID_", property = "id"),
            @Result(column = "REV_", property = "rev"),
            @Result(column = "EXECUTION_ID_", property = "executionId"),
            @Result(column = "PROC_INST_ID_", property = "processInstanceId"),
            @Result(column = "PROC_DEF_ID_", property = "processDefinitionId"),
            @Result(column = "TASK_DEF_ID_", property = "taskDefinitionId"),
            @Result(column = "SCOPE_ID_", property = "scopeId"),
            @Result(column = "SUB_SCOPE_ID_", property = "subScopeId"),
            @Result(column = "SCOPE_TYPE_", property = "scopeType"),
            @Result(column = "SCOPE_DEFINITION_ID_", property = "scopeDefinitionId"),
            @Result(column = "PROPAGATED_STAGE_INST_ID_", property = "propagatedStageInstanceId"),
            @Result(column = "NAME_", property = "name"),
            @Result(column = "PARENT_TASK_ID_", property = "parentTaskId"),
            @Result(column = "DESCRIPTION_", property = "description"),
            @Result(column = "TASK_DEF_KEY_", property = "taskDefinitionKey"),
            @Result(column = "OWNER_", property = "owner"),
            @Result(column = "ASSIGNEE_", property = "assignee"),
            @Result(column = "DELEGATION_", property = "delegation"),
            @Result(column = "PRIORITY_", property = "priority"),
            @Result(column = "CREATE_TIME_", property = "createTime", jdbcType = JdbcType.TIMESTAMP, javaType = Date.class),
            @Result(column = "DUE_DATE_", property = "dueDate"),
            @Result(column = "CATEGORY_", property = "category"),
            @Result(column = "SUSPENSION_STATE_", property = "suspensionState"),
            @Result(column = "TENANT_ID_", property = "tenantId"),
            @Result(column = "FORM_KEY_", property = "formKey"),
            @Result(column = "CLAIM_TIME_", property = "claimTime"),
            @Result(column = "IS_COUNT_ENABLED_", property = "isCountEnabled"),
            @Result(column = "VAR_COUNT_", property = "varCount"),
            @Result(column = "ID_LINK_COUNT_", property = "idLinkCount"),
            @Result(column = "SUB_TASK_COUNT_", property = "subTaskCount"),
    })
    List<WorkflowTask> listTodoTasks(@Param("assignee") String assignee,
                                     @Param("param") WorkflowTaskFindParam param);


    @Select("""
            <script>
            SELECT
              T.*, 
              I.NAME_ processInstanceName,
              I.START_USER_ID_ startUserId,
              I.START_TIME_ startTime
            FROM ACT_HI_TASKINST T
            LEFT JOIN ACT_HI_PROCINST I ON T.PROC_INST_ID_ = I.ID_
            WHERE T.ASSIGNEE_ = #{assignee}
            <if test="param.name != null and param.name != ''">
                AND I.NAME_ LIKE CONCAT('%', #{param.name}, '%')
            </if>
            ORDER BY T.LAST_UPDATED_TIME_ DESC
            LIMIT #{param.offset}, #{param.pageSize}
            </script>
            """)
    @Results(value = {
            @Result(column = "ID_", property = "id"),
            @Result(column = "REV_", property = "rev"),
            @Result(column = "EXECUTION_ID_", property = "executionId"),
            @Result(column = "PROC_INST_ID_", property = "processInstanceId"),
            @Result(column = "PROC_DEF_ID_", property = "processDefinitionId"),
            @Result(column = "TASK_DEF_ID_", property = "taskDefinitionId"),
            @Result(column = "SCOPE_ID_", property = "scopeId"),
            @Result(column = "SUB_SCOPE_ID_", property = "subScopeId"),
            @Result(column = "SCOPE_TYPE_", property = "scopeType"),
            @Result(column = "SCOPE_DEFINITION_ID_", property = "scopeDefinitionId"),
            @Result(column = "PROPAGATED_STAGE_INST_ID_", property = "propagatedStageInstanceId"),
            @Result(column = "NAME_", property = "name"),
            @Result(column = "PARENT_TASK_ID_", property = "parentTaskId"),
            @Result(column = "DESCRIPTION_", property = "description"),
            @Result(column = "TASK_DEF_KEY_", property = "taskDefinitionKey"),
            @Result(column = "OWNER_", property = "owner"),
            @Result(column = "ASSIGNEE_", property = "assignee"),
            @Result(column = "DELEGATION_", property = "delegation"),
            @Result(column = "PRIORITY_", property = "priority"),
            @Result(column = "CREATE_TIME_", property = "createTime", jdbcType = JdbcType.TIMESTAMP, javaType = Date.class),
            @Result(column = "DUE_DATE_", property = "dueDate"),
            @Result(column = "CATEGORY_", property = "category"),
            @Result(column = "SUSPENSION_STATE_", property = "suspensionState"),
            @Result(column = "TENANT_ID_", property = "tenantId"),
            @Result(column = "FORM_KEY_", property = "formKey"),
            @Result(column = "CLAIM_TIME_", property = "claimTime"),
            @Result(column = "IS_COUNT_ENABLED_", property = "isCountEnabled"),
            @Result(column = "VAR_COUNT_", property = "varCount"),
            @Result(column = "ID_LINK_COUNT_", property = "idLinkCount"),
            @Result(column = "SUB_TASK_COUNT_", property = "subTaskCount"),
    })
    List<WorkflowTask> listDoneTasks(@Param("assignee") String assignee,
                                     @Param("param") WorkflowTaskFindParam param);


}
