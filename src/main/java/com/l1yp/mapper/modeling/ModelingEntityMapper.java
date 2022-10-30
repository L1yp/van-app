package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface ModelingEntityMapper extends BaseMapper<ModelingEntity> {


    @Insert("""
            ${createDDL}
            """)
    void createTable(@Param("createDDL") String createDDL);

    @Delete("drop table ${tableName}")
    void dropTable(@Param("tableName") String tableName);

}
