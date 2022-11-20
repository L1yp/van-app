package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.Menu;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

public interface MenuMapper extends BaseMapper<Menu> {
    @Select("SELECT\n" +
            "  DISTINCT rm.menu_id\n" +
            "FROM sys_user_role ur\n" +
            "INNER JOIN sys_role_menu rm ON ur.role_id = rm.role_id AND ur.uid = #{uid}\n" +
            "INNER JOIN sys_menu m ON m.id = rm.menu_id\n" +
            "WHERE m.state = 0")
    List<String> selectUserRoleMenuList(String uid);


}
