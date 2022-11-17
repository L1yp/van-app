package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingView;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import java.util.List;
import java.util.Map;

public interface ModelingViewMapper extends BaseMapper<ModelingView> {


    @Select("${sql}")
    int countEntity(@Param("sql") String sql,
                    @Param("args") List<Object> args);

    @Select("${sql}")
    @Results({
            @Result(property = "id", column = "id", jdbcType = JdbcType.BIGINT, javaType = String.class),
            @Result(property = "updateBy", column = "update_by", jdbcType = JdbcType.BIGINT, javaType = String.class),
            @Result(property = "createBy", column = "create_by", jdbcType = JdbcType.BIGINT, javaType = String.class),
    })
    List<Map<String, Object>> pageEntity(@Param("sql") String sql,
                         @Param("args") List<Object> args);

}
