package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.UserDept;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDeptMapper extends BaseMapper<UserDept> {


    @Select("""
            SELECT dept_id FROM sys_user_dept WHERE uid = #{uid}
            UNION ALL
            SELECT dept_id FROM sys_user WHERE id = #{uid}
            """)
    List<String> getDeptIdListByUid(@Param("uid") String uid);

}
