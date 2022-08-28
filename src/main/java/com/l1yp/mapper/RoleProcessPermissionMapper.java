package com.l1yp.mapper;

import com.l1yp.model.db.RoleProcessPermissionModel;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface RoleProcessPermissionMapper extends Mapper<RoleProcessPermissionModel> {

    @SelectProvider(type = Provider.class, method = "findPermissionsByRoles")
    List<RoleProcessPermissionModel> findPermissionsByRoles(@Param("roleIds") List<Long> roleIds);

    class Provider {

        public String findPermissionsByRoles(List<Long> roleIds) {
            return "SELECT * FROM role_process_permission WHERE role_id IN " +
                    IntStream.range(0, roleIds.size())
                    .mapToObj(it -> "#{roleIds[" + it + "]}")
                    .collect(Collectors.joining(",", "(", ")"));
        }
    }

}
