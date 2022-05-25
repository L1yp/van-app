package com.l1yp.mapper;

import com.l1yp.model.db.SysRole;
import com.l1yp.model.param.role.RoleMenuBindParam;
import com.l1yp.model.param.role.RolePermissionBindParam;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.stream.Collectors;

public interface SysRoleMapper extends Mapper<SysRole> {

    @Select("""
            SELECT r.name FROM sys_user_role ur
            INNER JOIN sys_role r ON ur.role_id = r.id
            WHERE ur.uid = #{uid}
            """)
    List<String> findUserRoleNames(@Param("uid") Object uid);

    @DeleteProvider(type = Provider.class, method = "batchDeleteRole")
    int batchDeleteRole(@Param("ids") List<Long> ids);

    @Delete("DELETE FROM sys_role_menu WHERE role_id = #{roleId}")
    int deleteBoundMenu(Long roleId);

    @Delete("DELETE FROM sys_role_permission WHERE role_id = #{roleId}")
    int deleteBoundPermission(Long roleId);

    @InsertProvider(type = Provider.class, method = "bindRoleMenu")
    int bindRoleMenu(RoleMenuBindParam param);

    @InsertProvider(type = Provider.class, method = "bindRolePermission")
    int bindRolePermission(RolePermissionBindParam param);


    @Select("SELECT menu_id FROM sys_role_menu WHERE role_id = #{roleId}")
    List<Long> findMenuBound(Long roleId);

    @Select("SELECT permission_id FROM sys_role_permission WHERE role_id = #{roleId}")
    List<Long> findPermissionBound(Long roleId);

    class Provider {

        public String batchDeleteRole(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM sys_role WHERE id IN" + params;
        }

        public String bindRoleMenu(RoleMenuBindParam param) {
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO sys_role_menu(role_id, menu_id) VALUES");
            List<Long> menuIds = param.getMenuIds();
            Long roleId = param.getRoleId();
            String values = menuIds.stream().map(it -> "(" + roleId + "," + it + ")").collect(Collectors.joining(","));
            sb.append(values);
            return sb.toString();
        }

        public String bindRolePermission(RolePermissionBindParam param) {
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO sys_role_permission(role_id, permission_id) VALUES");
            List<Long> permissionIds = param.getPermissionIds();
            Long roleId = param.getRoleId();
            String values = permissionIds.stream().map(it -> "(" + roleId + "," + it + ")").collect(Collectors.joining(","));
            sb.append(values);
            return sb.toString();
        }


    }

}
