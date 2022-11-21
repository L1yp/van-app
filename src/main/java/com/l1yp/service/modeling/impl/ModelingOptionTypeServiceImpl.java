package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.ModelingOptionTypeViewListType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingOptionTypeMapper;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingOptionType;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionTypeView;
import com.l1yp.service.modeling.IModelingOptionTypeService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ModelingOptionTypeServiceImpl extends ServiceImpl<ModelingOptionTypeMapper, ModelingOptionType> implements IModelingOptionTypeService {


    @Resource
    ModelingOptionValueServiceImpl workflowOptionValueService;

    @Resource
    CacheManager cacheManager;

    @Override
    @Cacheable(cacheNames = "option_types", key = "#p0.scope + ':' + #p0.mkey")
    @CacheResultType(ModelingOptionTypeViewListType.class)
    public List<ModelingOptionTypeView> findTypes(ModelingOptionTypeFindParam param) {
        LambdaQueryWrapper<ModelingOptionType> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ModelingOptionType::getScope, param.getScope());

        if (StringUtils.hasText(param.getMkey())) {
            wrapper.eq(ModelingOptionType::getMkey, param.getMkey());
        }
        List<ModelingOptionType> modelingOptionTypes = getBaseMapper().selectList(wrapper);
        return modelingOptionTypes.stream().map(ModelingOptionType::toView).collect(Collectors.toList());
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "option_types", key = "#p0.scope + ':' + #p0.mkey")
    public void addType(ModelingOptionTypeAddParam param) {
        ModelingOptionType modelingOptionType = new ModelingOptionType();
        BeanCopierUtil.copy(param, modelingOptionType);
        save(modelingOptionType);
    }

    @Override
    @Transactional
    public void updateType(ModelingOptionTypeUpdateParam param) {
        ModelingOptionType optionType = getById(param.getId());
        if (optionType == null) {
            throw new VanException(404, "选项类型不存在");
        }
        ModelingOptionType modelingOptionType = new ModelingOptionType();
        BeanCopierUtil.copy(param, modelingOptionType);
        updateById(modelingOptionType);

        Cache cache = cacheManager.getCache("option_types");
        if (cache != null) {
            cache.evict(optionType.getScope() + ":" + optionType.getMkey());
        }

    }

    @Override
    public void deleteType(String id) {
        ModelingOptionType optionType = getById(id);
        if (optionType == null) {
            throw new VanException(404, "选项类型不存在");
        }
        int count = getBaseMapper().countOfOptionFieldRef(id);
        if (count > 0) {
            List<ModelingField> workflowFieldDefs = getBaseMapper().selectOptionFieldRef(id);
            String strRefField = workflowFieldDefs.stream().map(it -> it.getLabel() + "(" + it.getField() + ")").collect(Collectors.joining("\n"));
            throw new VanException(500, "此数据源被以下字段引用: \n" + strRefField);
        }

        removeById(id);
        workflowOptionValueService.remove(Wrappers.<ModelingOptionValue>lambdaQuery().eq(ModelingOptionValue::getTypeId, id));

        Cache cache = cacheManager.getCache("option_types");
        if (cache != null) {
            cache.evict(optionType.getScope() + ":" + optionType.getMkey());
        }

    }
}
