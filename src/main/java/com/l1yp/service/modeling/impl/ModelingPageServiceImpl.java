package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.modeling.ModelingPageMapper;
import com.l1yp.model.db.modeling.ModelingPage;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.IModelingPageService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ModelingPageServiceImpl extends ServiceImpl<ModelingPageMapper, ModelingPage> implements IModelingPageService {


    @Override
    public ModelingPageView getPage(ModelingPageFindParam param) {
        ModelingPage page = getOne(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getPageKey, param.getPageKey())
        );
        if (page == null) {
            return null;
        }
        return page.toView();
    }

    @Override
    @Transactional
    public void bindPage(ModelingPageBindParam param) {
        remove(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getPageKey, param.getPageKey())
        );
        var page = new ModelingPage();
        BeanCopierUtil.copy(param, page);
        save(page);
    }

    @Override
    @Transactional
    public void unbindPage(ModelingPageUnbindParam param) {
        remove(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getPageKey, param.getPageKey())
        );
    }
}
