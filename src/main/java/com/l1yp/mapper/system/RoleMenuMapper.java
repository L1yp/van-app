package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.RoleMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    @Delete("DELETE FROM sys_role_menu WHERE role_id = #{roleId}")
    int deleteRoleMenu(@Param("roleId") String roleId);




}
