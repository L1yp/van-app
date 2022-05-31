package com.l1yp.mapper;

import com.l1yp.model.db.ProcessModelBpmn;
import com.l1yp.model.db.ProcessModelBpmnBase;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface ProcessModelBpmnMapper extends Mapper<ProcessModelBpmnBase> {

    @Select("SELECT * FROM process_model_bpmn WHERE process_key = #{processKey} AND state = 1")
    ProcessModelBpmnBase findPublishBPMNVersionByProcessKey(String processKey);

    @Select("SELECT process_key FROM process_model_bpmn WHERE process_definition_id = #{processDefinitionId}")
    String findProcessKeyByProcessDefinitionId(@Param("processDefinitionId") String processDefinitionId);

    @SelectProvider(type = Provider.class, method = "listBaseByProcessDefinitionIds")
    List<ProcessModelBpmnBase> listBaseByProcessDefinitionIds(@Param("processDefinitionIds") Collection<String> processDefinitionIds);


    @Select("SELECT * FROM process_model_bpmn WHERE id = #{id}")
    ProcessModelBpmn find(Long id);

    @Select("SELECT * FROM process_model_bpmn WHERE process_key = #{processKey}")
    List<ProcessModelBpmnBase> listOfItems(@Param("processKey") String processKey);

    @Update("UPDATE process_model_bpmn SET content = #{content}, update_by = #{updateBy} WHERE id = #{id}")
    int updateBpmnXML(@Param("id") Long id, @Param("updateBy") String updateBy, @Param("content") String content);


    @Select("SELECT IFNULL(MAX(version), 0) FROM process_model_bpmn WHERE process_key = #{processKey}")
    Integer findMaxVersionByProcessKey(@Param("processKey") String processKey);


    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    @InsertProvider(type = Provider.class, method = "insertProcessModelBPMN")
    int insertProcessModelBPMN(ProcessModelBpmn pmb);

    class Provider {
        public String insertProcessModelBPMN(ProcessModelBpmn pmb) {
            StringBuilder sb = new StringBuilder();
            List<String> fields = new ArrayList<>();
            List<String> props = new ArrayList<>();
            if (pmb.getId() != null) {
                fields.add("id");
                props.add("id");
            }
            fields.add("process_key");
            props.add("processKey");
            fields.add("version");
            props.add("version");
            if (pmb.getProcessDefinitionId() != null) {
                fields.add("process_definition_id");
                props.add("processDefinitionId");
            }
            if (pmb.getState() != null) {
                fields.add("state");
                props.add("state");
            }
            if (pmb.getUpdateBy() != null) {
                fields.add("update_by");
                props.add("updateBy");
            }
            if (pmb.getUpdateTime() != null) {
                fields.add("update_time");
                props.add("updateTime");
            }
            if (pmb.getCreateTime() != null) {
                fields.add("create_time");
                props.add("createTime");
            }
            if (pmb.getContent() != null) {
                fields.add("content");
                props.add("content");
            }

            String dbFields = String.join(",", fields);
            String dbProps = props.stream().map(it -> String.format("#{%s}", it)).collect(Collectors.joining(","));

            sb.append("INSERT INTO process_model_bpmn(").append(dbFields).append(")");
            sb.append("VALUES(").append(dbProps).append(")");

            return sb.toString();
        }

        public String listBaseByProcessDefinitionIds(Collection<String> processDefinitionIds) {
            return "SELECT id,process_key,version,process_definition_id,state FROM process_model_bpmn WHERE process_definition_id IN"
                    + IntStream.range(0, processDefinitionIds.size())
                    .mapToObj(it -> "#{processDefinitionIds[" + it + "]}")
                    .collect(Collectors.joining(",", "(", ")"));
        }

    }

}
