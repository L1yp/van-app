package com.l1yp.service.modeling;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.param.modeling.field.ModelingFieldAddParam;
import com.l1yp.model.param.modeling.field.ModelingFieldUpdateParam;
import com.l1yp.model.param.modeling.field.ModelingFieldFindParam;
import com.l1yp.model.param.modeling.field.ModelingFieldRefParam;
import com.l1yp.model.view.modeling.ModelingFieldDefView;

import java.util.List;

public interface IModelingFieldService {

    List<ModelingFieldDefView> findFields(ModelingFieldFindParam param);

    List<ModelingField> findModelFields(ModelingModule module, String mkey);

    void addField(ModelingFieldAddParam param);

    void updateField(ModelingFieldUpdateParam param);

    void deleteField(String fieldId);

    void refGlobalField(ModelingFieldRefParam param);

    void unrefGlobalField(ModelingFieldRefParam param);

}
