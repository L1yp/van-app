package com.l1yp.mapper;

import com.l1yp.conf.constants.process.ProcessConstants;
import com.l1yp.model.db.ProcessModelNodePage;
import com.l1yp.model.db.ProcessModelPage;
import com.l1yp.model.db.ProcessModelPageScheme;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProcessNodePageMapper extends Mapper<ProcessModelNodePage> {


    @Insert("""
            INSERT INTO process_model_node_page(process_key,process_bpmn_id,node_id,process_model_page_id,page_width,label_width,`comment`,update_by) 
            VALUES(#{processKey},#{processBpmnId},#{nodeId},#{processModelPageId},#{pageWidth},#{labelWidth},#{comment},#{updateBy})
            ON DUPLICATE KEY UPDATE
            process_model_page_id = VALUES(`process_model_page_id`),page_width = VALUES(`page_width`),label_width = VALUES(`label_width`),`comment` = VALUES(`comment`)
            """)
    int insertUpdate(ProcessModelNodePage page);

    @Select("SELECT * FROM process_model_node_page WHERE process_bpmn_id = #{bpmnId}")
    List<ProcessModelNodePage> listProcessPageByBpmnId(@Param("bpmnId") Long bpmnId);



    @Select("SELECT * FROM process_model_node_page WHERE node_id = #{nodeId} AND process_bpmn_id = #{bpmnId}")
    ProcessModelNodePage findByBpmnIdAndNodeId(@Param("bpmnId") Long bpmnId, @Param("nodeId") String nodeId);

    @Select("SELECT * FROM process_model_node_page WHERE process_key = #{processKey} AND node_id = '" + ProcessConstants.PROCESS_START_FORM_KEY + "'")
    ProcessModelNodePage findStartPage(@Param("processKey") String processKey);


}
