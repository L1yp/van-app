package com.l1yp.mapper;

import com.l1yp.model.db.ProcessModelPageScheme;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProcessModelPageSchemeMapper extends Mapper<ProcessModelPageScheme> {

    @Delete("DELETE FROM process_model_page_scheme WHERE process_model_page_id = #{processModelPageId}")
    int deleteByProcessModelPageId(Long processModelPageId);

    @Select("SELECT * FROM process_model_page_scheme WHERE process_model_page_id = #{pageId} ORDER BY order_no ASC")
    List<ProcessModelPageScheme> findPageScheme(@Param("pageId") Long pageId);

    @Select("SELECT * FROM process_model_page_scheme WHERE process_model_page_id = #{pageId} ORDER BY order_no ASC")
    List<ProcessModelPageScheme> findPageSchemeByDevice(@Param("pageId") Long pageId,
                                                        @Param("device") String device);

}
