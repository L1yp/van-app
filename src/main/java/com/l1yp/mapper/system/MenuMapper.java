package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.Menu;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

public interface MenuMapper extends BaseMapper<Menu> {
    @Select("""
            SELECT
              DISTINCT rm.menu_id
            FROM sys_user_role ur
            INNER JOIN sys_role_menu rm ON ur.role_id = rm.role_id AND ur.uid = #{uid}
            """)
    List<String> selectUserRoleMenuList(String uid);


}
