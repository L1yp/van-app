package com.l1yp.model.param.modeling.entity;

import com.l1yp.model.db.modeling.ModelingModule;

import java.util.Map;

public class ModelingEntityInstanceUpdateParam {

    private String mkey;

    private String id;

    private Map<String, Object> data;

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
