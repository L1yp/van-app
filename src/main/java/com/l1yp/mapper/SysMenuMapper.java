package com.l1yp.mapper;

import com.l1yp.model.db.SysMenu;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SysMenuMapper extends Mapper<SysMenu> {

    @Select("""
            SELECT
             m.id, m.title, m.name, m.route, m.icon, m.close, m.hidden, m.pid
            FROM sys_user_role ur
            INNER JOIN sys_role_menu rm ON ur.role_id = rm.role_id AND ur.uid = #{uid}
            INNER JOIN sys_menu m ON m.id = rm.menu_id
            
            """)
    List<SysMenu> selectUserRoleMenu(Long uid);

    @Select("""
            SELECT
             rm.menu_id
            FROM sys_user_role ur
            INNER JOIN sys_role_menu rm ON ur.role_id = rm.role_id AND ur.uid = #{uid}
            """)
    List<Long> selectUserRoleMenuId(Long uid);



}
