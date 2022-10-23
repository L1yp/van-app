package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.system.MenuMapper;
import com.l1yp.model.db.system.Menu;
import com.l1yp.model.db.system.User;
import com.l1yp.model.param.system.menu.MenuCreateParam;
import com.l1yp.model.param.system.menu.MenuUpdateParam;
import com.l1yp.model.view.system.MenuView;
import com.l1yp.service.system.IMenuService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Override
    @Transactional
    public void createMenu(MenuCreateParam param) {
        User loginUser = RequestUtils.getLoginUser();
        Menu menu = new Menu();
        BeanCopierUtil.copy(param, menu);
        save(menu);
    }

    @Override
    @Transactional
    public void updateMenu(MenuUpdateParam param) {
        Long count = getBaseMapper().selectCount(Wrappers.<Menu>lambdaQuery().eq(Menu::getId, param.getId()));
        if (count == null || count == 0) {
            throw new RuntimeException("ID NOT FOUND");
        }
        User loginUser = RequestUtils.getLoginUser();
        Menu menu = new Menu();
        BeanCopierUtil.copy(param, menu);
        getBaseMapper().updateById(menu);
    }

    @Override
    public void deleteMenu(Long id) {
        getBaseMapper().deleteById(id);
    }

    @Override
    public List<MenuView> findAllMenu() {
        List<Menu> menus = getBaseMapper().selectList(null);
        return menus.stream().map(it -> {
            MenuView view = new MenuView();
            BeanCopierUtil.copy(it, view);
            return view;
        }).toList();
    }

    @Override
    public List<MenuView> findUserMenu() {
        User loginUser = RequestUtils.getLoginUser();
        List<String> menuIdList = getBaseMapper().selectUserRoleMenuList(loginUser.getId());
        List<Menu> menuList = getBaseMapper().selectBatchIds(menuIdList);
        return menuList.stream().map(Menu::toView).toList();
    }
}
