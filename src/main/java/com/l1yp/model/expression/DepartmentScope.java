package com.l1yp.model.expression;

public abstract class DepartmentScope {

    public static final int OWNER_DEPARTMENT = 1;
    public static final int OWNER_DEPARTMENT_AND_SUB_DEPARTMENT = 2;
    public static final int SUB_DEPARTMENT = 3;

    public static final int OWNER_USER_ID = 10;

    public static boolean isDepartmentScope(int scope) {
        return scope > 0 && scope < 4;
    }

}
