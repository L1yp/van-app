package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.RoleViewListType;
import com.l1yp.cache.type.StringListType;
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
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    @Cacheable(cacheNames = "roles", key = "'all'")
    @CacheResultType(RoleViewListType.class)
    public List<RoleView> findRole() {
        List<Role> roles = getBaseMapper().selectList(null);

        return roles.stream().map(Role::toView).collect(Collectors.toList());
    }

    @Override
    @CacheEvict(cacheNames = "roles", key = "'all'")
    public void addRole(RoleAddParam param) {
        Role role = new Role();
        BeanCopierUtil.copy(param, role);
        save(role);
    }

    @Override
    @CacheEvict(cacheNames = "roles", key = "'all'")
    public void updateRole(RoleUpdateParam param) {
        Role role = new Role();
        BeanCopierUtil.copy(param, role);
        updateById(role);
    }

    @Override
    @CacheEvict(cacheNames = "roles", key = "'all'")
    public void deleteRole(String id) {
        removeById(id);
    }

    @Override
    @CacheEvict(cacheNames = "roles", key = "'all'")
    public void batchDeleteRole(List<String> ids) {
        removeBatchByIds(ids);
    }

    @Resource
    RoleMenuServiceImpl roleMenuService;

    @Override
    @Caching(evict = {
            @CacheEvict(cacheNames = "role_menu", key = "#p0.roleId"),
            @CacheEvict(cacheNames = "user_menu", allEntries = true)
    })
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
    @Cacheable(cacheNames = "role_menu", key = "#p0")
    @CacheResultType(StringListType.class)
    public List<String> menuBound(String roleId) {
        List<RoleMenu> roleMenus = roleMenuService.getBaseMapper().selectList(Wrappers.<RoleMenu>lambdaQuery().eq(RoleMenu::getRoleId, roleId));
        return roleMenus.stream().map(RoleMenu::getMenuId).collect(Collectors.toList());
    }
}
