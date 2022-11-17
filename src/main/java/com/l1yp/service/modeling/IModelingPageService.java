package com.l1yp.service.modeling;

import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageModuleFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.view.modeling.ModelingPageView;

import java.util.List;

public interface IModelingPageService {

    ModelingPageView getPage(ModelingPageFindParam param);

    void bindPage(ModelingPageBindParam param);

    void unbindPage(ModelingPageUnbindParam param);

    ModelingPageView getPageById(String pageId);

    List<ModelingPageView> getModulePages(ModelingPageModuleFindParam param);
}
