package com.l1yp.service.modeling;

import com.l1yp.model.param.modeling.page.ModelingPageAddAndBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageAddParam;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUpdateParam;
import com.l1yp.model.view.modeling.ModelingPageView;

public interface IModelingPageService {

    ModelingPageView findPage(ModelingPageFindParam param);

    void addPage(ModelingPageAddParam param);

    void addAndBindPage(ModelingPageAddAndBindParam param);

    void updatePage(ModelingPageUpdateParam param);

    void bindPage(ModelingPageBindParam param);

    void unbindPage(ModelingPageUnbindParam param);

    ModelingPageView getPageById(String pageId);
}
