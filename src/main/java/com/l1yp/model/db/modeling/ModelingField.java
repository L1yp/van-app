package com.l1yp.model.db.modeling;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.view.modeling.ModelingFieldDefView;
import com.l1yp.util.BeanCopierUtil;

import java.util.Date;

@TableName(value = "modeling_field_def", autoResultMap = true)
public class ModelingField {

    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 字段名
     */
    private String field;

    /**
     * 标签名
     */
    private String label;

    /**
     * 字段说明
     */
    private String remark;

    /**
     * 字段宽度
     */
    private Integer width;

    /**
     * 字段类型
     * 字符串
     * 数字
     */
    private String type;

    /**
     * 字段定义
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private FieldScheme scheme;

    private FieldScope scope;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    public enum FieldScope {
        /**
         * 业务实体默认字段
         */
        ENTITY_DEFAULT,

        /**
         * 工作流默认字段
         */
        WORKFLOW_DEFAULT,
        /**
         * 业务模型私有字段
         */
        ENTITY_PRIVATE,

        /**
         * 流程私有字段
         */
        WORKFLOW_PRIVATE,
        /**
         * 全局字段
         */
        GLOBAL,
    }

    public enum FieldModule {

        WORKFLOW,
        ENTITY,

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public FieldScheme getScheme() {
        return scheme;
    }

    public void setScheme(FieldScheme scheme) {
        this.scheme = scheme;
    }

    public FieldScope getScope() {
        return scope;
    }

    public void setScope(FieldScope scope) {
        this.scope = scope;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public ModelingFieldDefView toView() {
        ModelingFieldDefView view = new ModelingFieldDefView();
        BeanCopierUtil.copy(this, view);
        return view;
    }

}
