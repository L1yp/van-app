package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import java.util.Map;

public interface WorkflowTypeDefMapper extends BaseMapper<WorkflowTypeDef> {

    @Select("SELECT MAX(code) FROM ${tableName} WHERE CODE LIKE '${prefix}${delimiter}${date}${joiner}%'")
    String getInstanceMaxCode(@Param("tableName") String tableName,
                      @Param("prefix") String prefix,
                      @Param("delimiter") String delimiter,
                      @Param("date") String date,
                      @Param("joiner") String joiner);

    @Update("""
            UPDATE workflow_type_def SET active_ver_id = #{activeVerId}, process_definition_id = #{processDefinitionId} WHERE id = #{id}
            """)
    void updateActiveInfo(@Param("activeVerId") String activeVerId,
                          @Param("processDefinitionId") String processDefinitionId,
                          @Param("id") String id);


    @Select("SELECT * FROM ${tableName} WHERE process_instance_id = #{instanceId}")
    Map<String, Object> getInstanceByInstanceId(@Param("tableName") String tableName,
                                         @Param("instanceId") String instanceId);

    @Select("SELECT * FROM ${tableName} WHERE id = #{id}")
    Map<String, Object> getInstanceById(@Param("tableName") String tableName,
                                         @Param("id") String id);

    @Select("SELECT ${fields} FROM ${tableName} WHERE process_instance_id = #{instanceId}")
    Map<String, Object> getInstanceFieldsByInstanceId(@Param("tableName") String tableName,
                                                      @Param("instanceId") String instanceId,
                                                      @Param("fields") String fields);

}
