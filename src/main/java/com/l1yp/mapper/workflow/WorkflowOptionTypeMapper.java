package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.form.WorkflowOptionType;
import com.l1yp.model.db.workflow.model.WorkflowFieldDef;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface WorkflowOptionTypeMapper extends BaseMapper<WorkflowOptionType> {

    @Select("SELECT COUNT(*) FROM workflow_field_def WHERE JSON_EXTRACT(scheme,'$.type') = 'option' AND JSON_EXTRACT(scheme,'$.option_content.from') = 'DEFAULT' AND scheme -> '$.option_content.option_type_id' = #{typeId}")
    int countOfOptionFieldRef(@Param("typeId") String typeId);

    @Select("SELECT field, label FROM workflow_field_def WHERE JSON_EXTRACT(scheme,'$.type') = 'option' AND JSON_EXTRACT(scheme,'$.option_content.from') = 'DEFAULT' AND scheme -> '$.option_content.option_type_id' = #{typeId}")
    List<WorkflowFieldDef> selectOptionFieldRef(@Param("typeId") String typeId);


}
