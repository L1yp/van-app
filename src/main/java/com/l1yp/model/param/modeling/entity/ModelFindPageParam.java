package com.l1yp.model.param.modeling.entity;

import com.l1yp.model.common.PageParam;
import com.l1yp.model.db.modeling.ModelingField.FieldModule;
import com.l1yp.model.db.modeling.ModelingView.Collation;

import java.util.List;
import java.util.Map;

public class ModelFindPageParam extends PageParam {

    private FieldModule module;

    private String mkey;

    private Map<String, String> conditionMap;

    private List<Collation> collation;

    public FieldModule getModule() {
        return module;
    }

    public void setModule(FieldModule module) {
        this.module = module;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public Map<String, String> getConditionMap() {
        return conditionMap;
    }

    public void setConditionMap(Map<String, String> conditionMap) {
        this.conditionMap = conditionMap;
    }

    public List<Collation> getCollation() {
        return collation;
    }

    public void setCollation(List<Collation> collation) {
        this.collation = collation;
    }
}
