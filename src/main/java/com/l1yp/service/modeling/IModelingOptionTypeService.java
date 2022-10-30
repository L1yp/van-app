package com.l1yp.service.modeling;

import com.l1yp.model.param.modeling.option.ModelingOptionTypeFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionTypeView;

import java.util.List;

public interface IModelingOptionTypeService {

    List<ModelingOptionTypeView> findTypes(ModelingOptionTypeFindParam param);

    /**
     * 添加数据源定义
     */
    void addType(ModelingOptionTypeAddParam param);

    /**
     * 更新数据源定义
     */
    void updateType(ModelingOptionTypeUpdateParam param);

    void deleteType(String id);

}
