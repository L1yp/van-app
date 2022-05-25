package com.l1yp.mapper;

import com.l1yp.model.db.ProcessFieldDefinition;
import org.apache.ibatis.annotations.*;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public interface ProcessFieldDefinitionMapper extends Mapper<ProcessFieldDefinition> {

    @Select("SELECT * FROM process_model_field_definition WHERE process_key = #{processKey} ORDER BY order_no ASC")
    List<ProcessFieldDefinition> selectFieldsByProcessKey(@Param("processKey") String processKey);

    @Delete("DELETE FROM process_model_field_definition WHERE process_key = #{processKey}")
    int deleteFieldsByProcessKey(@Param("processKey") String processKey);

    @DeleteProvider(type = Provider.class, method = "batchDelete")
    int batchDelete(@Param("ids") List<Long> ids);


    @SelectProvider(type = Provider.class, method = "selectFieldsByIds")
    List<ProcessFieldDefinition> selectFieldsByIds(@Param("ids") Collection<Long> ids);

    class Provider {

        public String batchDelete(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM process_model_field_definition WHERE id IN" + params;
        }

        public String selectFieldsByIds(Collection<Long> ids) {
            if (CollectionUtils.isEmpty(ids)) {
                return null;
            }
            return "SELECT * FROM process_model_field_definition WHERE id IN " +
                    ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
        }

    }

}
