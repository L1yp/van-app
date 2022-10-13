package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.mapper.system.RoleMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.system.Role;
import com.l1yp.model.db.system.RoleMenu;
import com.l1yp.model.param.system.role.RoleAddParam;
import com.l1yp.model.param.system.role.RoleMenuBindParam;
import com.l1yp.model.param.system.role.RolePageParam;
import com.l1yp.model.param.system.role.RoleUpdateParam;
import com.l1yp.model.view.system.RoleView;
import com.l1yp.service.system.IRoleService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    public PageData<RoleView> pageRole(RolePageParam param) {
        PageHelper.startPage(param.getPageIdx(), param.getPageSize());
        List<Role> roles = getBaseMapper().selectList(lambdaQuery().like(Role::getName, param.getName()));
        if (CollectionUtils.isEmpty(roles)) {
            return PageData.empty(param);
        }
        PageData<RoleView> pageData = new PageData<>();
        pageData.initPage(roles);
        List<RoleView> roleViews = roles.stream().map(Role::toView).toList();
        pageData.setData(roleViews);
        return pageData;
    }

    @Override
    public void addRole(RoleAddParam param) {
        Role role = new Role();
        BeanCopierUtil.copy(param, role);
        save(role);
    }

    @Override
    public void updateRole(RoleUpdateParam param) {
        Role role = new Role();
        BeanCopierUtil.copy(param, role);
        updateById(role);
    }

    @Override
    public void deleteRole(Long id) {
        removeById(id);
    }

    @Override
    public void batchDeleteRole(List<Long> ids) {
        removeBatchByIds(ids);
    }

    @Resource
    RoleMenuServiceImpl roleMenuService;

    @Override
    public void bindMenu(RoleMenuBindParam param) {
        roleMenuService.getBaseMapper().deleteRoleMenu(param.getRoleId());
        List<RoleMenu> roleMenus = new ArrayList<>();
        for (String menuId : param.getMenuIds()) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(param.getRoleId());
            roleMenu.setMenuId(menuId);
            roleMenus.add(roleMenu);
        }
        roleMenuService.saveBatch(roleMenus);
    }

    @Override
    public List<String> menuBound(String roleId) {
        List<RoleMenu> roleMenus = roleMenuService.getBaseMapper().selectList(roleMenuService.lambdaQuery().eq(RoleMenu::getRoleId, roleId));
        return roleMenus.stream().map(RoleMenu::getMenuId).toList();
    }
}
