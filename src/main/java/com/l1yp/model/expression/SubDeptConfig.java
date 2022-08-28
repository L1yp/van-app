package com.l1yp.model.expression;

import com.l1yp.model.db.SysDept;
import com.l1yp.model.view.SysDeptView;

public class SubDeptConfig {

    public long id;

    public Long dept;

    /**
     * 1：本部门
     * 2：本部门及下级部门
     * 3：下级部门
     */
    public int scope;

    public int getScope() {
        return scope;
    }

    public Long getDept() {
        return dept;
    }
}
