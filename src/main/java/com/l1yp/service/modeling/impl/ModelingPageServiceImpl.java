package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.ModelingPageViewListType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingPageMapper;
import com.l1yp.model.db.modeling.ModelingPage;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageModuleFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.IModelingPageService;
import com.l1yp.util.BeanCopierUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ModelingPageServiceImpl extends ServiceImpl<ModelingPageMapper, ModelingPage> implements IModelingPageService {

    @Resource
    CacheManager cacheManager;

    private static final Logger log = LoggerFactory.getLogger(ModelingPageServiceImpl.class);

    @Override
    @Cacheable(cacheNames = "modeling_page", key = "'id:' + #p0")
    @CacheResultType(ModelingPageView.class)
    public ModelingPageView getPageById(String pageId) {
        ModelingPage page = getById(pageId);
        if (page == null) {
            return null;
        }
        ModelingPageView view = page.toView();
        Cache cache = cacheManager.getCache("modeling_page");
        if (cache != null) {
            cache.put("name:" + page.getModule().toString() + ":" + page.getMkey() + ":" + page.getName(), view);
        }

        return view;
    }

    @Override
    @Cacheable(cacheNames = "modeling_page_list", key = "#p0.module + ':' + #p0.mkey", unless = "#result.size() == 0")
    @CacheResultType(ModelingPageViewListType.class)
    public List<ModelingPageView> getModulePages(ModelingPageModuleFindParam param) {
        List<ModelingPage> pageList = list(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
        );
        return pageList.stream().map(ModelingPage::toView).collect(Collectors.toList());
    }

    @Override
    @Cacheable(cacheNames = "modeling_page", key = "'name:' + #p0.module + ':' + #p0.mkey + ':' + #p0.name")
    @CacheResultType(ModelingPageView.class)
    public ModelingPageView getPage(ModelingPageFindParam param) {
        ModelingPage page = getOne(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getName, param.getName())
        );
        if (page == null) {
            return null;
        }
        return page.toView();
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "modeling_page_list", key = "#p0.module + ':' + #p0.mkey"),
            @CacheEvict(cacheNames = "modeling_page", key = "'name:' + #p0.module + ':' + #p0.mkey + ':' + #p0.name")
    })
    public void bindPage(ModelingPageBindParam param) {
        ModelingPage page = getOne(Wrappers.<ModelingPage>lambdaQuery()
                        .eq(ModelingPage::getModule, param.getModule())
                        .eq(ModelingPage::getMkey, param.getMkey())
                        .eq(ModelingPage::getName, param.getName()));
        if (page == null) {
            page = new ModelingPage();
            BeanCopierUtil.copy(param, page);
            save(page);
        } else {
            ModelingPage newPage = new ModelingPage();
            newPage.setId(page.getId());
            newPage.setPageScheme(param.getPageScheme());
            updateById(newPage);

            Cache cache = cacheManager.getCache("modeling_page");
            if (cache != null) {
                cache.evict("id:" + page.getId());
            }
        }



    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "modeling_page_list", key = "#p0.module + ':' + #p0.mkey"),
            @CacheEvict(cacheNames = "modeling_page", key = "'name:' + #p0.module + ':' + #p0.mkey + ':' + #p0.name")
    })
    public void unbindPage(ModelingPageUnbindParam param) {
        ModelingPage page = getOne(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getName, param.getName()));
        if (page == null) {
            throw new VanException(400, "参数有误，不存在的绑定关系");
        }
        remove(Wrappers.<ModelingPage>lambdaQuery()
                .eq(ModelingPage::getModule, param.getModule())
                .eq(ModelingPage::getMkey, param.getMkey())
                .eq(ModelingPage::getName, param.getName())
        );
        Cache cache = cacheManager.getCache("modeling_page");
        if (cache != null) {
            cache.evict("id:" + page.getId());
        }
    }
}
