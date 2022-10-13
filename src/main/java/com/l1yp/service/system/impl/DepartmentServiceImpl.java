package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.system.DepartmentMapper;
import com.l1yp.model.db.system.Department;
import com.l1yp.model.param.system.dept.DeptAddParam;
import com.l1yp.model.param.system.dept.DeptUpdateParam;
import com.l1yp.model.view.system.DepartmentView;
import com.l1yp.service.system.IDepartmentService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {


    @Override
    public void add(DeptAddParam param) {
        Department department = new Department();
        BeanCopierUtil.copy(param, department);
        save(department);
    }

    @Override
    public void update(DeptUpdateParam param) {
        Department department = new Department();
        BeanCopierUtil.copy(param, department);
        updateById(department);
    }

    @Override
    public void delete(String id) {
        removeById(id);
    }

    @Override
    public void deleteByIds(List<String> ids) {
        removeByIds(ids);
    }

    @Override
    public List<DepartmentView> findDept() {
        List<Department> departments = getBaseMapper().selectList(null);
        return departments.stream().map(Department::toView).toList();
    }
}
