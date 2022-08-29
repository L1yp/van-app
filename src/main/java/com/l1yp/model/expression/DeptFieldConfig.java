package com.l1yp.model.expression;

import java.util.List;

public class DeptFieldConfig {

    /**
     * 1：本部门
     * 2：本部门及下级部门
     * 3：下级部门
     */
    public int my_dept_scope;

    public List<SubDeptConfig> user_of_dept;

}
