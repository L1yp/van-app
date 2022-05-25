package com.l1yp.mapper;

import com.l1yp.model.db.SysPermission;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.stream.Collectors;

public interface SysPermissionMapper extends Mapper<SysPermission> {

    @Select("""
            SELECT DISTINCT p.ident FROM sys_role_permission rp
            INNER JOIN sys_permission p ON rp.permission_id = p.id
            INNER JOIN sys_user_role ur ON rp.role_id = ur.role_id
            WHERE ur.uid = #{uid}
            """)
    List<String> findUserPermissions(@Param("uid") Object uid);

    @DeleteProvider(type = Provider.class, method = "batchDeleteRole")
    int batchDeleteRole(@Param("ids") List<Long> ids);

    class Provider {
        public String batchDeleteRole(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM sys_role WHERE id IN" + params;
        }

    }
}
