package com.l1yp.mapper;

import com.l1yp.model.db.WFFieldDict;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public interface WFFieldDictMapper extends Mapper<WFFieldDict>, InsertListMapper<WFFieldDict> {


    @Select("SELECT dict_id FROM wf_field_dict WHERE process_key = #{processKey} AND wf_id = #{wfId}")
    List<Long> listDictIdByWFID(@Param("processKey") String processKey,
                                @Param("wfId") Long wfId);

    @Select("SELECT dict_id FROM wf_field_dict WHERE process_key = #{processKey} AND wf_id = #{wfId} AND field_id = #{fieldId}")
    List<Long> listDictIdByFieldAndWFID(@Param("processKey") String processKey,
                                        @Param("fieldId") Long fieldId,
                                        @Param("wfId") Long wfId);

    @Select("SELECT dict_id FROM wf_field_dict WHERE process_key = #{processKey} AND process_instance_id = #{processInstanceId}")
    List<Long> listDictIdByProcessInstanceId(@Param("processKey") String processKey,
                                             @Param("processInstanceId") String processInstanceId);

    @Select("SELECT * FROM wf_field_dict WHERE process_key = #{processKey} AND wf_id = #{wfId}")
    List<WFFieldDict> listByWFID(@Param("processKey") String processKey,
                                @Param("wfId") Long wfId);

    @DeleteProvider(type = Provider.class, method = "deleteFields")
    int deleteFields(@Param("processId") Long processId, @Param("fields") Collection<Long> fields);

    @Update("UPDATE wf_field_dict SET process_instance_id = #{processInstanceId} WHERE process_key = #{processKey} AND wf_id = #{wfId}")
    int updateProcessInstanceId(@Param("processKey") String processKey,
                                @Param("wfId") Long wfId,
                                @Param("processInstanceId") String processInstanceId);
    class Provider {
        public String deleteFields(Long processId, Collection<Long> fields) {
            return "DELETE FROM wf_field_dict WHERE wf_id = #{processId} AND field_id IN " + fields.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
        }
    }
}
