package com.l1yp.mapper;

import com.l1yp.model.db.WFFieldDept;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public interface WFFieldDeptMapper extends Mapper<WFFieldDept>, InsertListMapper<WFFieldDept> {


    @Select("SELECT dept_id FROM wf_field_dept WHERE process_key = #{processKey} AND wf_id = #{wfId}")
    List<Long> listDeptIdByWFID(@Param("processKey") String processKey,
                                @Param("wfId") Long wfId);

    @Select("SELECT dept_id FROM wf_field_dept WHERE process_key = #{processKey} AND process_instance_id = #{processInstanceId}")
    List<Long> listDeptIdByProcessInstanceId(@Param("processKey") String processKey,
                                             @Param("processInstanceId") String processInstanceId);

    @Select("SELECT * FROM wf_field_dept WHERE process_key = #{processKey} AND wf_id = #{wfId}")
    List<WFFieldDept> listByWFID(@Param("processKey") String processKey,
                                @Param("wfId") Long wfId);

    @DeleteProvider(type = Provider.class, method = "deleteFields")
    int deleteFields(@Param("processId") Long processId, @Param("fields") Collection<Long> fields);

    class Provider {
        public String deleteFields(Long processId, Collection<Long> fields) {
            return "DELETE FROM wf_field_dept WHERE wf_id = #{processId} AND field_id IN " + fields.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
        }
    }
}
