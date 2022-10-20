package com.l1yp.model.param.workflow;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

public class WorkflowTypeDefUpdateParam {

    @NotBlank
    private String id;

    private CodeGenRule codeGenRule;

    private String remark;

    @Min(0)
    @Max(1)
    private Integer status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public CodeGenRule getCodeGenRule() {
        return codeGenRule;
    }

    public void setCodeGenRule(CodeGenRule codeGenRule) {
        this.codeGenRule = codeGenRule;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
