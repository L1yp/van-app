package com.l1yp.service.modeling;

import com.l1yp.model.param.modeling.option.ModelingOptionValueAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionValueView;

import java.util.List;

public interface IModelingOptionValueService {

    List<ModelingOptionValueView> findValues(ModelingOptionValueFindParam param);

    void addValue(ModelingOptionValueAddParam param);

    void updateValue(ModelingOptionValueUpdateParam param);

    void deleteOptionValue(String valueId);

    void resetOptionValue(String valueId);

}
