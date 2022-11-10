package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ModelingEntityMapper extends BaseMapper<ModelingEntity> {


    @Insert("""
            ${createDDL}
            """)
    void createTable(@Param("createDDL") String createDDL);

    @Delete("drop table ${tableName}")
    void dropTable(@Param("tableName") String tableName);


    @Select("${sql}")
    void executeSQL(@Param("sql") String sql, @Param("args") List<Object> args);

    @Select("SELECT * FROM ${tableName} WHERE id = #{id}")
    Map<String, Object> getInstance(@Param("tableName") String tableName, @Param("id") String id);

}
