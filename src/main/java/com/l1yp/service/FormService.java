package com.l1yp.service;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class FormService {

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    public void updateFields(ModelingModule module, String mkey, Map<String, Object> formData) {
        List<ModelingField> modelFields = modelingFieldService.findModelFields(module, mkey);
    }


}
