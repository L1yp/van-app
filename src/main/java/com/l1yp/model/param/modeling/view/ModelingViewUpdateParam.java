package com.l1yp.model.param.modeling.view;

import com.l1yp.model.db.modeling.ModelingView.Collation;

import javax.validation.constraints.NotBlank;
import java.util.List;

public class ModelingViewUpdateParam {

    @NotBlank
    private String id;

    @NotBlank
    private String name;

    private List<Collation> collation;

    private Integer sn;

    private Boolean status;

    private List<ModelingViewColumnParam> columns;


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

    public List<Collation> getCollation() {
        return collation;
    }

    public void setCollation(List<Collation> collation) {
        this.collation = collation;
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<ModelingViewColumnParam> getColumns() {
        return columns;
    }

    public void setColumns(List<ModelingViewColumnParam> columns) {
        this.columns = columns;
    }
}
