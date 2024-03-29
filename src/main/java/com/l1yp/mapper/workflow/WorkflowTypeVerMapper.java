package com.l1yp.mapper.workflow;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.workflow.model.WorkflowTypeVer;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface WorkflowTypeVerMapper extends BaseMapper<WorkflowTypeVer> {

    @Select("SELECT IFNULL(MAX(ver), 0) ver FROM workflow_type_ver WHERE `key` = #{key}")
    Integer findMaxVer(@Param("key") String key);

    @Update("UPDATE workflow_type_ver SET xml = #{param.xml} WHERE id = #{param.id}")
    void updateXml(@Param("param") WorkflowTypeVerUpdateXmlParam param);

    @Update("UPDATE workflow_type_ver SET status = " + WorkflowTypeVer.PENDING + " WHERE `key` = #{key}")
    void pendingAllByWfKey(@Param("key") String key);

    @Update("UPDATE workflow_type_ver SET status = " + WorkflowTypeVer.ACTIVE + ", process_definition_id = #{processDefinitionId}, remark = #{remark} WHERE id = #{id}")
    void activeVer(@Param("id") String id,
                   @Param("processDefinitionId") String processDefinitionId,
                   @Param("remark") String remark);

    @Update("UPDATE workflow_type_ver SET status = " + WorkflowTypeVer.PENDING + " WHERE id = #{id}")
    void pendingVer(@Param("id") String id);

}
