package com.l1yp.model.expression;

import com.l1yp.model.view.SysUserView;

import java.util.List;

public class UserFieldConfig {

    /**
     * 1：本人
     * 2：本部门
     * 3：本部门及下级部门
     * 4：下级部门
     */
    public int my_dept_scope;

    public List<Long> users;

    public List<SubDeptConfig> user_of_dept;

}
