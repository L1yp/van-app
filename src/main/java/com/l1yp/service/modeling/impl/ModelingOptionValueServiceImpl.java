package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.modeling.ModelingOptionValueMapper;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.param.modeling.option.ModelingOptionValueAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionValueView;
import com.l1yp.service.modeling.IModelingOptionValueService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ModelingOptionValueServiceImpl extends ServiceImpl<ModelingOptionValueMapper, ModelingOptionValue> implements IModelingOptionValueService {


    @Override
    public List<ModelingOptionValueView> findValues(ModelingOptionValueFindParam param) {
        List<ModelingOptionValue> modelingOptionValues = getBaseMapper().selectList(Wrappers.<ModelingOptionValue>lambdaQuery().eq(ModelingOptionValue::getTypeId, param.getTypeId()));
        return modelingOptionValues.stream().map(ModelingOptionValue::toView).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void addValue(ModelingOptionValueAddParam param) {
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        BeanCopierUtil.copy(param, modelingOptionValue);
        save(modelingOptionValue);

    }

    @Override
    @Transactional
    public void updateValue(ModelingOptionValueUpdateParam param) {
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        BeanCopierUtil.copy(param, modelingOptionValue);
        updateById(modelingOptionValue);
    }

    @Override
    public void deleteOptionValue(String valueId) {
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        modelingOptionValue.setId(valueId);
        modelingOptionValue.setDisabled(true);
        updateById(modelingOptionValue);
    }

    @Override
    public void resetOptionValue(String valueId) {
        ModelingOptionValue modelingOptionValue = new ModelingOptionValue();
        modelingOptionValue.setId(valueId);
        modelingOptionValue.setDisabled(false);
        updateById(modelingOptionValue);
    }
}
