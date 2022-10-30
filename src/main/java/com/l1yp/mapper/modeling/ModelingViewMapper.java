package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingView;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ModelingViewMapper extends BaseMapper<ModelingView> {


    @Select("${sql}")
    int countEntity(@Param("sql") String sql,
                    @Param("args") List<Object> args);

    @Select("${sql}")
    List<Map<String, Object>> pageEntity(@Param("sql") String sql,
                         @Param("args") List<Object> args);

}
