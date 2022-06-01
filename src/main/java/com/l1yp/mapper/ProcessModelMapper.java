package com.l1yp.mapper;

import com.l1yp.conf.constants.process.ProcessConstants.ComponentType;
import com.l1yp.model.db.ProcessCommonInfo;
import com.l1yp.model.db.ProcessFieldDefinition;
import com.l1yp.model.db.ProcessModelDefinition;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.TypeMismatchException;
import tk.mybatis.mapper.common.Mapper;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface ProcessModelMapper extends Mapper<ProcessModelDefinition> {

    @Select("SELECT CODE FROM ${tableName} WHERE CODE LIKE '${prefix}%' ORDER BY CODE DESC LIMIT 1 LOCK IN SHARE MODE")
    String findMaxCode(@Param("tableName") String tableName,
                       @Param("prefix") String prefix);

    @Select("SELECT * FROM process_model_definition WHERE process_key = #{processKey}")
    ProcessModelDefinition findByProcessKey(@Param("processKey") String processKey);

    @SelectProvider(type = Provider.class, method = "listByProcessKeys")
    List<ProcessModelDefinition> listByProcessKeys(@Param("processKeys") Collection<String> processKeys);

    @Select("SELECT ${field} FROM ${tableName} WHERE process_instance_id = #{processInstanceId}")
    Object findField(@Param("tableName") String tableName,
                     @Param("processInstanceId") String processInstanceId,
                     @Param("field") String field);

    @Select("SELECT ${field} FROM ${tableName} WHERE id = #{wfId}")
    Object findFieldByWFID(@Param("tableName") String tableName,
                     @Param("wfId") Long wfId,
                     @Param("field") String field);

    @Select("SELECT id,code,name,process_bpmn_id,process_definition_id,process_instance_id,creator,create_time FROM ${tableName} WHERE process_instance_id = #{processInstanceId}")
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
            INSERT INTO ${tableName}(code, name, process_bpmn_id, process_definition_id, creator, update_by)
            VALUES(#{code}, #{name}, #{processBpmnId}, #{processDefinitionId}, #{creator}, #{creator})
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
                     Map<String, ProcessFieldDefinition> fieldMap,
                     @Param("params") Map<String, Object> params);


    @Update("""
            CREATE TABLE ${tableName}(
                id                    BIGINT AUTO_INCREMENT PRIMARY KEY,
                process_bpmn_id       BIGINT       DEFAULT 0                 NOT NULL COMMENT '流程版本ID',
                process_definition_id VARCHAR(128) DEFAULT ''                NOT NULL COMMENT '流程定义ID',
                process_instance_id   VARCHAR(36)                            NULL COMMENT '流程实例ID',
                code                  VARCHAR(64)                            NOT NULL,
                name                  VARCHAR(64)                            NOT NULL,
                creator               VARCHAR(64)                            NOT NULL,
                update_by             VARCHAR(64)                            NOT NULL,
                update_time           DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
                create_time           DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL,
                constraint code_uindex unique (code),
                constraint process_instance_id_uindex unique (process_instance_id)
            ) COMMENT '${description}'
            """)
    int initWFTable(@Param("tableName") String tableName,
                    @Param("description") String description);

    @Insert("create index process_bpmn_id_index on ${tableName}(process_bpmn_id)")
    int initBpmnIndex(@Param("tableName") String tableName);

    @Insert("create index process_definition_id_index on ${tableName}(process_definition_id)")
    int initProcessDefinitionIdIndex(@Param("tableName") String tableName);
    class Provider {

        private static final Set<Integer> multiRefIdSet = new HashSet<>(Arrays.asList(ComponentType.MULTI_DICT, ComponentType.MULTI_DEPT, ComponentType.MULTI_USER));
        private static final Set<Integer> singleRefIdSet = new HashSet<>(Arrays.asList(ComponentType.SINGLE_DICT, ComponentType.SINGLE_DEPT, ComponentType.SINGLE_USER));

        public String updateFields(String tableName, Long id, Map<String, ProcessFieldDefinition> fieldMap, Map<String, Object> params) {
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE ").append(tableName).append(" SET ");

            Set<Entry<String, Object>> entries = params.entrySet();
            for (Entry<String, Object> entry : entries) {
                String field = entry.getKey();

                ProcessFieldDefinition processFieldDefinition = fieldMap.get(field);
                if (processFieldDefinition == null) {
                    continue;
                }

                // 重置  id列表的值
                if (multiRefIdSet.contains(processFieldDefinition.getComponentType())) {
                    List<Object> ids = (List<Object>) entry.getValue();
                    for (Object itemId : ids) {
                        if (!(itemId instanceof Number)) {
                            throw new TypeMismatchException(itemId, Number.class);
                        }
                    }
                    String newVal = ids.stream().map(Objects::toString).collect(Collectors.joining(","));
                    params.put(field, newVal);
                }


            }

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
            return "SELECT id,code,name,process_instance_id,creator,create_time FROM ${tableName} WHERE process_instance_id IN " +
                    IntStream.range(0, processInstanceIds.size())
                            .mapToObj(it -> "#{processInstanceIds[" + it + "]}")
                            .collect(Collectors.joining(",","(",")"));
        }


    }


}
