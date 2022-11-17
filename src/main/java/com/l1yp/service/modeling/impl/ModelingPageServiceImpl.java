package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.modeling.ModelingPageMapper;
import com.l1yp.mapper.modeling.ModelingPageRefMapper;
import com.l1yp.model.db.modeling.ModelingPage;
import com.l1yp.model.db.modeling.ModelingPageRef;
import com.l1yp.model.param.modeling.page.ModelingPageAddAndBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageAddParam;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUpdateParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.IModelingPageService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class ModelingPageServiceImpl extends ServiceImpl<ModelingPageMapper, ModelingPage> implements IModelingPageService {

    @Resource
    ModelingPageRefMapper modelingPageRefMapper;

    @Override
    public ModelingPageView findPage(ModelingPageFindParam param) {
        ModelingPage page = getBaseMapper().findEntityPage(param);
        if (page == null) {
            return null;
        }
        return page.toView();
    }

    @Override
    public void addPage(ModelingPageAddParam param) {
        ModelingPage page = new ModelingPage();
        BeanCopierUtil.copy(param, page);
        save(page);
    }

    @Override
    public void addAndBindPage(ModelingPageAddAndBindParam param) {
        if (StringUtils.isNotBlank(param.getPageId())) {
            ModelingPage page = new ModelingPage();
            page.setId(param.getPageId());
            page.setName(param.getName());
            page.setPageScheme(param.getPageScheme());
            updateById(page);
        } else {
            ModelingPage page = new ModelingPage();
            BeanCopierUtil.copy(param, page);
            save(page);
            ModelingPageRef modelingPageRef = new ModelingPageRef();
            modelingPageRef.setPageKey(param.getPageKey());
            modelingPageRef.setPageId(page.getId());
            modelingPageRefMapper.insert(modelingPageRef);
        }
    }

    @Override
    public void updatePage(ModelingPageUpdateParam param) {
        ModelingPage page = new ModelingPage();
        BeanCopierUtil.copy(param, page);
        updateById(page);
    }

    @Override
    public ModelingPageView getPageById(String pageId) {
        ModelingPage page = getById(pageId);
        if (page == null) {
            return null;
        }
        return page.toView();
    }

    @Override
    @Transactional
    public void bindPage(ModelingPageBindParam param) {
        modelingPageRefMapper.delete(Wrappers.<ModelingPageRef>lambdaQuery()
                .eq(ModelingPageRef::getPageKey, param.getPageKey())
                .eq(ModelingPageRef::getPageId, param.getPageId())
        );

        ModelingPageRef modelingPageRef = new ModelingPageRef();
        BeanCopierUtil.copy(param, modelingPageRef);
        modelingPageRefMapper.insert(modelingPageRef);
    }

    @Override
    @Transactional
    public void unbindPage(ModelingPageUnbindParam param) {
        modelingPageRefMapper.delete(Wrappers.<ModelingPageRef>lambdaQuery()
                .eq(ModelingPageRef::getPageKey, param.getPageKey())
                .eq(ModelingPageRef::getPageId, param.getPageId())
        );
    }

}
