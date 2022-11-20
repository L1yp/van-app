package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.TableScheme;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.param.modeling.field.ModelingFieldFindParam;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

import static com.baomidou.mybatisplus.core.toolkit.Constants.MYBATIS_PLUS;
import static com.baomidou.mybatisplus.core.toolkit.StringPool.UNDERSCORE;

public interface ModelingFieldMapper extends BaseMapper<ModelingField> {

    @ResultType(TableScheme.class)
    @Select("SELECT TABLE_NAME name, TABLE_COMMENT comment FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'van'")
    List<TableScheme> getTableName();


    @Select("SELECT COLUMN_NAME name, COLUMN_COMMENT comment FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'van' AND TABLE_NAME = #{tableName}")
    List<TableScheme> getTableColumn(@Param("tableName") String tableName);

    @Select("SELECT *\n" +
            "FROM modeling_field_def\n" +
            "WHERE id IN ( SELECT field_id FROM modeling_field_ref WHERE mkey = #{mkey} ) OR scope = 'WORKFLOW_DEFAULT'")
    @ResultMap(MYBATIS_PLUS + UNDERSCORE + "ModelingField")
    List<ModelingField> selectWFFields(ModelingFieldFindParam param);

    @Select("SELECT *\n" +
            "            FROM modeling_field_def\n" +
            "            WHERE id IN ( SELECT field_id FROM modeling_field_ref WHERE mkey = #{mkey} AND module = #{module} ) OR scope = 'ENTITY_DEFAULT'")
    @ResultMap(MYBATIS_PLUS + UNDERSCORE + "ModelingField")
    List<ModelingField> selectEntityFields(ModelingFieldFindParam param);


    @Insert("ALTER TABLE `${tableName}` ADD `${field}` ${dbType} NULL COMMENT '${label}'")
    void addTableColumn(@Param("tableName") String tableName,
                        @Param("field") String field,
                        @Param("dbType") String dbType,
                        @Param("label") String label);

    @Update("""
            ALTER TABLE `${tableName}` MODIFY `${field}` ${dbType} NULL COMMENT '${label}'
            """)
    void modifyColumn(@Param("tableName") String tableName,
                      @Param("field") String field,
                      @Param("dbType") String dbType,
                      @Param("label") String label);

    @Delete("""
            ALTER TABLE ${tableName} DROP COLUMN ${field}
            """)
    void dropTableColumn(@Param("tableName") String tableName, @Param("field") String field);



}
