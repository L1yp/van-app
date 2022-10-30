package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;
import com.l1yp.model.db.modeling.ModelingView.Collation;

import java.util.List;

public class ModelingViewSimpleInfo {

    private String id;

    private String name;

    private Integer sn;

    private List<Collation> collation;

    private List<ModelingViewColumnView> columns;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public List<Collation> getCollation() {
        return collation;
    }

    public void setCollation(List<Collation> collation) {
        this.collation = collation;
    }

    public List<ModelingViewColumnView> getColumns() {
        return columns;
    }

    public void setColumns(List<ModelingViewColumnView> columns) {
        this.columns = columns;
    }
}
