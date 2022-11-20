package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingOptionValueMapper;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.param.modeling.option.ModelingOptionValueAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionValueView;
import com.l1yp.service.modeling.IModelingOptionValueService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ModelingOptionValueServiceImpl extends ServiceImpl<ModelingOptionValueMapper, ModelingOptionValue> implements IModelingOptionValueService {

    @Resource
    CacheManager cacheManager;

    @Override
    @Cacheable(cacheNames = "option_values", key = "#p0.typeId")
    public List<ModelingOptionValueView> findValues(ModelingOptionValueFindParam param) {
        List<ModelingOptionValue> modelingOptionValues = getBaseMapper().selectList(Wrappers.<ModelingOptionValue>lambdaQuery().eq(ModelingOptionValue::getTypeId, param.getTypeId()));
        List<ModelingOptionValueView> result = new ArrayList<>();
        return modelingOptionValues.stream().map(ModelingOptionValue::toView).collect(Collectors.toList());
//        return modelingOptionValues.stream().map(ModelingOptionValue::toView).toList(); // FIXME: Jackson cannot serialize class name of target to string
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "option_values", key = "#p0.typeId")
    public void addValue(ModelingOptionValueAddParam param) {
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        BeanCopierUtil.copy(param, modelingOptionValue);
        save(modelingOptionValue);

    }

    @Override
    @Transactional
    public void updateValue(ModelingOptionValueUpdateParam param) {
        ModelingOptionValue optionValue = getById(param.getId());
        if (optionValue == null) {
            throw new VanException(404, "选项值不存在");
        }
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        BeanCopierUtil.copy(param, modelingOptionValue);
        updateById(modelingOptionValue);

        Cache cache = cacheManager.getCache("option_values");
        if (cache != null) {
            cache.evict(optionValue.getTypeId());
        }
    }

    @Override
    public void deleteOptionValue(String valueId) {
        ModelingOptionValue optionValue = getById(valueId);
        if (optionValue == null) {
            throw new VanException(404, "选项值不存在");
        }
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        modelingOptionValue.setId(valueId);
        modelingOptionValue.setDisabled(true);
        updateById(modelingOptionValue);


        Cache cache = cacheManager.getCache("option_values");
        if (cache != null) {
            cache.evict(optionValue.getTypeId());
        }
    }

    @Override
    public void resetOptionValue(String valueId) {
        ModelingOptionValue optionValue = getById(valueId);
        if (optionValue == null) {
            throw new VanException(404, "选项值不存在");
        }
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        modelingOptionValue.setId(valueId);
        modelingOptionValue.setDisabled(false);
        updateById(modelingOptionValue);

        Cache cache = cacheManager.getCache("option_values");
        if (cache != null) {
            cache.evict(optionValue.getTypeId());
        }
    }


    public List<ModelingOptionValue> getOptionValueByIdList(Collection<String> idList) {
        ModelingOptionValueServiceImpl service = (ModelingOptionValueServiceImpl) AopContext.currentProxy();
        List<ModelingOptionValue> result = new ArrayList<>();
        for (String valueId : idList) {
            ModelingOptionValue optionValue = service.getValue(valueId);
            if (optionValue != null) {
                result.add(optionValue);
            }
        }
        return result;
    }

    @Cacheable(cacheNames = "option_value", key = "#p0")
    public ModelingOptionValue getValue(String valueId) {
        return getById(valueId);
    }

}
