package com.l1yp.model.expression;

public class DeptFieldConfig {

    /**
     * 1：本人
     * 2：本部门
     * 3：本部门及下级部门
     * 4：下级部门
     */
    public int my_dept_scope;

    public SubDeptConfig user_of_dept;

}
