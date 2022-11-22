package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface WorkflowTypeDefMapper extends BaseMapper<WorkflowTypeDef> {

    @Select("SELECT MAX(code) FROM ${tableName} WHERE CODE LIKE '${prefix}${delimiter}${date}${joiner}%'")
    String getInstanceMaxCode(@Param("tableName") String tableName,
                      @Param("prefix") String prefix,
                      @Param("delimiter") String delimiter,
                      @Param("date") String date,
                      @Param("joiner") String joiner);

}
