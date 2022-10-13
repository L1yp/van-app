package com.l1yp.service.system;

import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.role.RoleAddParam;
import com.l1yp.model.param.system.role.RoleMenuBindParam;
import com.l1yp.model.param.system.role.RolePageParam;
import com.l1yp.model.param.system.role.RoleUpdateParam;
import com.l1yp.model.view.system.RoleView;

import java.util.List;

public interface IRoleService {

    List<RoleView> findRole();

    void addRole(RoleAddParam param);

    void updateRole(RoleUpdateParam param);

    void deleteRole(Long id);

    void batchDeleteRole(List<Long> ids);

    void bindMenu(RoleMenuBindParam param);

    List<String> menuBound(String roleId);
}
