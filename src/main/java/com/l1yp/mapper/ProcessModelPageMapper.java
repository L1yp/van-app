package com.l1yp.mapper;

import com.l1yp.model.db.ProcessModelPage;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProcessModelPageMapper extends Mapper<ProcessModelPage> {


    @Select("SELECT * FROM process_model_page WHERE process_key = #{processKey}")
    List<ProcessModelPage> listProcessPage(@Param("processKey") String processKey);



}
