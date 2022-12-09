package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.MenuViewListType;
import com.l1yp.cache.type.StringListType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.system.MenuMapper;
import com.l1yp.mapper.system.RoleMenuMapper;
import com.l1yp.model.db.system.Menu;
import com.l1yp.model.db.system.RoleMenu;
import com.l1yp.model.param.system.menu.MenuCreateParam;
import com.l1yp.model.param.system.menu.MenuUpdateParam;
import com.l1yp.model.view.system.MenuView;
import com.l1yp.service.system.IMenuService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Resource
    RoleMenuMapper roleMenuMapper;

    @Cacheable(cacheNames = "menu", key = "#p0")
    @CacheResultType(Menu.class)
    public Menu getMenu(String menuId) {
        return getById(menuId);
    }

    public List<Menu> getMenuList(Collection<String> menuIds) {
        List<Menu> menuList = new ArrayList<>();
        for (String menuId : menuIds) {
            Menu menu = ((MenuServiceImpl) AopContext.currentProxy()).getMenu(menuId);
            if (menu != null) {
                menuList.add(menu);
            }
        }
        return menuList;
    }



    @Override
    @Transactional
    @CacheEvict(cacheNames = "menus", key = "'all'")
    public void createMenu(MenuCreateParam param) {
        Menu menu = new Menu();
        BeanCopierUtil.copy(param, menu);
        if (StringUtils.isBlank(menu.getPid())) {
            menu.setPid(null);
        }
        save(menu);
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "menus", key = "'all'"),
            @CacheEvict(cacheNames = "menu", key = "#p0.id"),
            @CacheEvict(cacheNames = "user_menu", allEntries = true),
    })
    public void updateMenu(MenuUpdateParam param) {
        Long count = getBaseMapper().selectCount(Wrappers.<Menu>lambdaQuery().eq(Menu::getId, param.getId()));
        if (count == null || count == 0) {
            throw new RuntimeException("ID NOT FOUND");
        }
        Menu menu = new Menu();
        BeanCopierUtil.copy(param, menu);
        if (StringUtils.isBlank(menu.getPid())) {
            menu.setPid(null);
        }
        getBaseMapper().updateById(menu);
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "menus", key = "'all'"),
            @CacheEvict(cacheNames = "menu", key = "#p0"),
            @CacheEvict(cacheNames = "user_menu", allEntries = true)
    })
    public void deleteMenu(String id) {
        Long count = roleMenuMapper.selectCount(Wrappers.<RoleMenu>lambdaQuery().eq(RoleMenu::getMenuId, id));
        if (count > 0) {
            throw new VanException(500, "请先解绑角色菜单的绑定信息");
        }
        getBaseMapper().deleteById(id);
    }

    @Override
    @Cacheable(cacheNames = "menus", key = "'all'")
    @CacheResultType(MenuViewListType.class)
    public List<MenuView> findAllMenu() {
        List<Menu> menus = getBaseMapper().selectList(null);
        return menus.stream().map(Menu::toView).collect(Collectors.toList());
    }

    @Override
    public List<MenuView> findUserMenu(String userId) {
        var proxy = (MenuServiceImpl) AopContext.currentProxy();
        List<String> menuIdList = proxy.findUserMenuIdList(userId);
        List<Menu> menuList = getMenuList(menuIdList);
        return menuList.stream().map(Menu::toView).collect(Collectors.toList());
    }

    @Cacheable(cacheNames = "user_menu", key = "#p0")
    @CacheResultType(StringListType.class)
    public List<String> findUserMenuIdList(String userId) {
        return getBaseMapper().selectUserRoleMenuList(userId);
    }


}
