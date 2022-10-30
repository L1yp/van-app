package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingFieldRef;
import com.l1yp.model.param.modeling.field.ModelingFieldRefParam;
import org.apache.ibatis.annotations.Delete;

public interface ModelingFieldRefMapper extends BaseMapper<ModelingFieldRef> {

    @Delete("DELETE FROM modeling_field_ref WHERE mkey = #{mkey} AND field_id = #{fieldId}")
    void unrefField(ModelingFieldRefParam param);

}
