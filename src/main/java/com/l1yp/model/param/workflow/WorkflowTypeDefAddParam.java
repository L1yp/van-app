package com.l1yp.model.param.workflow;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class WorkflowTypeDefAddParam {

    @NotBlank
    @Pattern(regexp = "^\\w+_?\\w?$", message = "key格式不符合数据库规范")
    private String key;

    @NotBlank
    private String name;

    private CodeGenRule codeGenRule;

    private String remark;

    @Min(0)
    @Max(1)
    private Integer status;


    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
