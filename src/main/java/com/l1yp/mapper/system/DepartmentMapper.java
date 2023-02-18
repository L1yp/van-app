package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.Department;
import com.l1yp.model.db.system.SimpleDept;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DepartmentMapper extends BaseMapper<Department> {


    @Select("SELECT id, pid FROM sys_dept WHERE status = 0")
    List<SimpleDept> getAllDeptPlain();

}
