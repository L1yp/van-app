package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingOptionType;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ModelingOptionTypeMapper extends BaseMapper<ModelingOptionType> {

    @Select("SELECT COUNT(*) FROM modeling_field_def WHERE JSON_EXTRACT(scheme,'$.type') = 'option' AND JSON_EXTRACT(scheme,'$.optionContent.from') = 'DEFAULT' AND scheme -> '$.optionContent.optionTypeId' = #{typeId}")
    int countOfOptionFieldRef(@Param("typeId") String typeId);

    @Select("SELECT field, label FROM modeling_field_def WHERE JSON_EXTRACT(scheme,'$.type') = 'option' AND JSON_EXTRACT(scheme,'$.optionContent.from') = 'DEFAULT' AND scheme -> '$.optionContent.optionTypeId' = #{typeId}")
    List<ModelingField> selectOptionFieldRef(@Param("typeId") String typeId);


}
