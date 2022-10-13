package com.l1yp.service.system;

import com.l1yp.model.param.system.menu.MenuCreateParam;
import com.l1yp.model.param.system.menu.MenuUpdateParam;
import com.l1yp.model.view.system.MenuView;

import java.util.List;

public interface IMenuService {

    void createMenu(MenuCreateParam param);

    void updateMenu(MenuUpdateParam param);

    void deleteMenu(Long id);

    List<MenuView> findAllMenu();


    List<MenuView> findUserMenu();

}
