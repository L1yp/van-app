package com.l1yp.service.modeling;

import com.l1yp.model.common.PageData;
import com.l1yp.model.param.modeling.entity.ModelingEntityAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceDeleteParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceUpdateParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityUpdateParam;
import com.l1yp.model.view.modeling.ModelingEntityView;

import java.util.Map;

public interface IModelingEntityService {

    ModelingEntityView findEntity(String id);

    PageData<ModelingEntityView> searchEntity(ModelingEntityFindParam param);

    void addEntity(ModelingEntityAddParam param);

    void updateEntity(ModelingEntityUpdateParam param);

    void deleteEntity(String id);

    void createInstance(ModelingEntityInstanceAddParam param);

    void updateEntityInstance(ModelingEntityInstanceUpdateParam param);

    void deleteEntityInstance(ModelingEntityInstanceDeleteParam param);

    Map<String, Object> getInstance(ModelingEntityInstanceFindParam param);
}
