package com.l1yp.model.db.modeling;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.view.modeling.ModelingViewView;
import com.l1yp.util.BeanCopierUtil;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@TableName(value = "modeling_view", autoResultMap = true)
public class ModelingView {

    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    private ModelingModule module;

    private String mkey;

    private String name;

    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<Collation> collation;

    private Integer sn;

    private Boolean status;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    public static class Collation {

        /**
         * 用于v-for标识的key
         */
        private Integer id;

        /**
         * 列名
         */
        @NotBlank
        private String field;

        /**
         * 排序方向
         */
        @NotNull
        private OrderDirection order;

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public String getField() {
            return field;
        }

        public void setField(String field) {
            this.field = field;
        }

        public OrderDirection getOrder() {
            return order;
        }

        public void setOrder(OrderDirection order) {
            this.order = order;
        }

        @Override
        public boolean equals(Object obj) {
            if (obj instanceof Collation collation) {
                return collation.getOrder().equals(order) && collation.getField().equals(field);
            }
            return false;
        }
    }

    public enum OrderDirection {
        asc, desc,
    }

    public List<Collation> getCollation() {
        return collation;
    }

    public void setCollation(List<Collation> collation) {
        this.collation = collation;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ModelingModule getModule() {
        return module;
    }

    public void setModule(ModelingModule module) {
        this.module = module;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
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

    public ModelingViewView toView() {
        ModelingViewView view = new ModelingViewView();
        BeanCopierUtil.copy(this, view);
        return view;
    }

}
