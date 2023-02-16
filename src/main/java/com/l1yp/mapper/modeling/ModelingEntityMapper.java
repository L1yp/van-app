package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingModule;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ModelingEntityMapper extends BaseMapper<ModelingEntity> {


    @Insert("${createDDL}")
    void createTable(@Param("createDDL") String createDDL);

    @Delete("drop table ${tableName}")
    void dropTable(@Param("tableName") String tableName);


    @Select("${sql}")
    void executeSQL(@Param("sql") String sql, @Param("args") List<Object> args);

    @Insert("""
            CREATE TABLE `${tableName}_ref` (
                id BIGINT UNSIGNED NOT NULL PRIMARY KEY COMMENT '主键ID',
                field VARCHAR(64) NOT NULL COMMENT '字段名',
                instance_id BIGINT UNSIGNED NOT NULL COMMENT '实例ID',
                value BIGINT UNSIGNED NOT NULL COMMENT '值',
                constraint ${tableName}_ref_unidx unique (field, instance_id, value) comment '唯一标识'
            ) COMMENT '字段引用表';
            """)
    void createRefTable(@Param("tableName")String tableName);

    @Select("SELECT * FROM ${tableName} WHERE id = #{id}")
    Map<String, Object> getInstance(@Param("tableName") String tableName, @Param("id") String id);




}
