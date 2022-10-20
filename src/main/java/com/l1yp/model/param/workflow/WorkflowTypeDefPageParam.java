package com.l1yp.model.param.workflow;

import com.l1yp.model.common.PageParam;

import java.util.List;

public class WorkflowTypeDefPageParam extends PageParam {

    private String name;

    private String remark;

    private List<String> updateBy;
    private List<String> createBy;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<String> getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(List<String> updateBy) {
        this.updateBy = updateBy;
    }

    public List<String> getCreateBy() {
        return createBy;
    }

    public void setCreateBy(List<String> createBy) {
        this.createBy = createBy;
    }
}
