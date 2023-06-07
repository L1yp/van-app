package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.system.DepartmentMapper;
import com.l1yp.model.db.system.Department;
import com.l1yp.model.db.system.SimpleDept;
import com.l1yp.model.param.system.dept.DeptAddParam;
import com.l1yp.model.param.system.dept.DeptUpdateParam;
import com.l1yp.model.view.system.DepartmentView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.system.IDepartmentService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

    @Resource
    UserServiceImpl userService;

    @Override
    @Caching(evict = {
            @CacheEvict(cacheNames = "departments", key = "'all'"),
            @CacheEvict(cacheNames = "departments", key = "'simple_all'"),
    })
    public void add(DeptAddParam param) {
        Department department = new Department();
        BeanCopierUtil.copy(param, department);
        save(department);
    }

    @Override
    @Caching(evict = {
            @CacheEvict(cacheNames = "departments", key = "'all'"),
            @CacheEvict(cacheNames = "departments", key = "'simple_all'"),
    })
    public void update(DeptUpdateParam param) {
        Department department = new Department();
        BeanCopierUtil.copy(param, department);
        updateById(department);
    }

    @Override
    @Caching(evict = {
            @CacheEvict(cacheNames = "departments", key = "'all'"),
            @CacheEvict(cacheNames = "departments", key = "'simple_all'"),
    })
    public void delete(String id) {
        removeById(id);
    }

    @Override
    @Caching(evict = {
            @CacheEvict(cacheNames = "departments", key = "'all'"),
            @CacheEvict(cacheNames = "departments", key = "'simple_all'"),
    })
    public void deleteByIds(List<String> ids) {
        removeByIds(ids);
    }

    @Override
    public List<DepartmentView> findDept() {
        DepartmentServiceImpl service = (DepartmentServiceImpl) AopContext.currentProxy();
        List<Department> departments = service.getAllDepartment();

        Set<String> userIds = new HashSet<>();
        for (Department department : departments) {
            if (StringUtils.hasText(department.getOwner())) {
                userIds.add(department.getOwner());
            }
            if (StringUtils.hasText(department.getAssistant())) {
                userIds.add(department.getAssistant());
            }
        }

        List<UserView> users = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = users.stream().collect(Collectors.toMap(UserView::getId, it -> it));

        List<DepartmentView> departmentViews = departments.stream().map(Department::toView).toList();

        departmentViews.stream().filter(it -> StringUtils.hasText(it.getOwner())).forEach(it -> it.setOwnerInfo(userMap.get(it.getOwner())));
        departmentViews.stream().filter(it -> StringUtils.hasText(it.getAssistant())).forEach(it -> it.setAssistantInfo(userMap.get(it.getAssistant())));

        return departmentViews;
    }

    @Cacheable(cacheNames = "departments", key = "'all'")
    public List<Department> getAllDepartment() {
        return getBaseMapper().selectList(null);
    }

    @Cacheable(cacheNames = "departments", key = "'simple_all'")
    public List<SimpleDept> getSimpleDeptList() {
        return getBaseMapper().getAllDeptPlain();
    }

    public List<Department> getDepartmentListByIds(Collection<String> idList) {
        Set<String> ids = new HashSet<>(idList);
        DepartmentServiceImpl service = (DepartmentServiceImpl) AopContext.currentProxy();
        List<Department> departmentList = service.getAllDepartment();
        return departmentList.stream().filter(it -> ids.contains(it.getId())).collect(Collectors.toList());
    }


}
