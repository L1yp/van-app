package com.l1yp.mapper;

import com.l1yp.model.bpmn.ProcessCreateParam;
import com.l1yp.model.db.ProcessCommonInfo;
import com.l1yp.model.db.ProcessModelDefinition;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface ProcessModelMapper extends Mapper<ProcessModelDefinition> {


    @Select("SELECT * FROM process_model_definition WHERE process_key = #{processKey}")
    ProcessModelDefinition findByProcessKey(@Param("processKey") String processKey);

    @SelectProvider(type = Provider.class, method = "listByProcessKeys")
    List<ProcessModelDefinition> listByProcessKeys(@Param("processKeys") Collection<String> processKeys);

    @Select("SELECT ${field} FROM ${tableName} WHERE process_instance_id = #{processInstanceId}")
    Object findField(@Param("tableName") String tableName,
                     @Param("processInstanceId") String processInstanceId,
                     @Param("field") String field);


    @Select("SELECT id,name,process_bpmn_id,process_definition_id,process_instance_id,creator,create_time FROM ${tableName} WHERE process_instance_id = #{processInstanceId}")
    ProcessCommonInfo findProcessInfoByProcessInstanceId(@Param("tableName") String tableName,
                                                         @Param("processInstanceId") String processInstanceId);

    @Select("SELECT * FROM ${tableName} WHERE id = #{id}")
    Map<String, Object> findProcessInfoById(@Param("tableName") String tableName,
                                            @Param("id") Long id);

    @SelectProvider(type = Provider.class, method = "selectProcessInfoByProcessInstanceId")
    List<ProcessCommonInfo> selectProcessInfoByProcessInstanceId(@Param("tableName") String tableName,
                                                                 @Param("processInstanceIds") List<String> processInstanceIds);

    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    @Insert("""
            INSERT INTO ${tableName}(name, process_bpmn_id, process_definition_id, creator, update_by)
            VALUES(#{name}, #{processBpmnId}, #{processDefinitionId}, #{creator}, #{creator})
            """)
    int createProcess(ProcessCommonInfo processCommonInfo);

    @Update("UPDATE ${tableName} SET process_instance_id = #{processInstanceId} WHERE id = #{id}")
    int setProcessInstanceId(@Param("tableName") String tableName,
                             @Param("processInstanceId") String processInstanceId,
                             @Param("id") Long id);

    @Select("SELECT * FROM ${tableName}")
    List<Map<String, Object>> listOfWF(@Param("tableName") String tableName);


    @InsertProvider(type = Provider.class, method = "updateFields")
    int updateFields(@Param("tableName") String tableName,
                     @Param("id") Long id,
                     @Param("params") Map<String, Object> params);




    class Provider {
        public String updateFields(String tableName, Long id, Map<String, Object> params) {
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE ").append(tableName).append(" SET ");
            String setFields = params.keySet().stream().map(key -> String.format("%s = #{params.%s}", key, key)).collect(Collectors.joining(", "));
            sb.append(setFields);
            sb.append(" WHERE id = ").append(id);
            String sql = sb.toString();
            System.out.println("sql = " + sql);
            return sql;
        }

        public String listByProcessKeys(@Param("processKeys") Collection<String> processKeys) {
            return "SELECT * FROM process_model_definition WHERE process_key IN " +
                    IntStream.range(0, processKeys.size())
                            .mapToObj(it -> "#{processKeys[" + it + "]}")
                            .collect(Collectors.joining(",","(",")"));
        }

        public String selectProcessInfoByProcessInstanceId(@Param("tableName") String tableName,
                                                           @Param("processInstanceIds") List<String> processInstanceIds) {
            return "SELECT id,name,process_instance_id,creator,create_time FROM ${tableName} WHERE process_instance_id IN " +
                    IntStream.range(0, processInstanceIds.size())
                            .mapToObj(it -> "#{processInstanceIds[" + it + "]}")
                            .collect(Collectors.joining(",","(",")"));
        }


    }


}
