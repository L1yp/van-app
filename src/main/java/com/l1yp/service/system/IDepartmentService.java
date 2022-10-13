package com.l1yp.service.system;

import com.l1yp.model.param.system.dept.DeptAddParam;
import com.l1yp.model.param.system.dept.DeptUpdateParam;
import com.l1yp.model.view.system.DepartmentView;

import java.util.List;

public interface IDepartmentService {
    void add(DeptAddParam param);

    void update(DeptUpdateParam param);

    void delete(String id);

    void deleteByIds(List<String> ids);

    List<DepartmentView> findDept();
}
