package com.l1yp.service.modeling;

import com.l1yp.model.common.PageData;
import com.l1yp.model.param.modeling.entity.ModelFindPageParam;
import com.l1yp.model.param.modeling.view.ModelingViewAddParam;
import com.l1yp.model.param.modeling.view.ModelingViewFindParam;
import com.l1yp.model.param.modeling.view.ModelingViewSearchParam;
import com.l1yp.model.param.modeling.view.ModelingViewUpdateParam;
import com.l1yp.model.view.modeling.ModelingViewDetailInfo;
import com.l1yp.model.view.modeling.ModelingViewSimpleInfo;

import java.util.List;
import java.util.Map;

public interface IModelingViewService {


    /**
     * 查询指定模型的视图列表
     */
    List<ModelingViewSimpleInfo> findView(ModelingViewFindParam param);

    /**
     * 搜索模型的视图列表
     */
    List<ModelingViewDetailInfo> searchView(ModelingViewSearchParam param);

    void addView(ModelingViewAddParam param);

    void updateView(ModelingViewUpdateParam param);

    void deleteView(String id);

    PageData<Map<String, Object>> pageModeling(ModelFindPageParam param);

}
