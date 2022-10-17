package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.RoleMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    @Delete("DELETE FROM sys_role_menu WHERE role_id = #{roleId}")
    int deleteRoleMenu(@Param("roleId") String roleId);


    @Select("""
            SELECT
                m.component
            FROM sys_role_menu rm
            LEFT JOIN sys_user_role ur ON ur.role_id = rm.role_id AND ur.uid = #{userId}
            LEFT JOIN sys_menu m ON rm.menu_id = m.id
            WHERE m.type = 'BUTTON'
            """)
    List<String> selectPermissions(String userId);


}
