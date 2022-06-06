package com.l1yp.service;

import cn.dev33.satoken.stp.StpUtil;
import com.l1yp.mapper.SysMenuMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysMenu;
import com.l1yp.model.db.SysUser;
import com.l1yp.model.param.menu.MenuAddParam;
import com.l1yp.model.param.menu.MenuUpdateParam;
import com.l1yp.model.view.SysMenuView;
import com.l1yp.util.RequestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class MenuService {

    @Resource
    SysMenuMapper sysMenuMapper;

    public ResultData<Void> addMenu(MenuAddParam param) {
        SysMenu menu = new SysMenu();
        BeanUtils.copyProperties(param, menu);
        sysMenuMapper.insertSelective(menu);
        return ResultData.OK;
    }

    public ResultData<Void> updateMenu(MenuUpdateParam param) {
        SysMenu menu = new SysMenu();
        BeanUtils.copyProperties(param, menu);
        sysMenuMapper.updateByPrimaryKeySelective(menu);
        return ResultData.OK;
    }

    public ResultData<Void> deleteMenu(Long id) {
        // TODO: 若子菜单被删除完毕 则更新leaf节点
        // TODO: 删除role_menu permission
        sysMenuMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public List<SysMenuView> findMenu() {

        List<SysMenu> sysRoleMenus = sysMenuMapper.selectAll();
        if (CollectionUtils.isEmpty(sysRoleMenus)) {
            return Collections.emptyList();
        }
        List<SysMenuView> result = sysRoleMenus.stream().map(SysMenu::convertToView).toList();

        Map<Long, SysMenuView> menuViewMap = result.stream().collect(Collectors.toMap(SysMenuView::getId, it -> it));
        for (SysMenuView sysMenuView : result) {
            if (sysMenuView.getPid() > 0 && menuViewMap.containsKey(sysMenuView.getPid())) {
                SysMenuView parentMenu = menuViewMap.get(sysMenuView.getPid());
                parentMenu.getChildren().add(sysMenuView);
            }

        }

        return result.stream().filter(it -> it.getPid() == 0L).toList();
    }

    public List<SysMenuView> findUserMenu() {
        SysUser loginUser = RequestUtils.getLoginUser();
        if (loginUser == null) {
            return Collections.emptyList();
        }
        List<Long> sysRoleMenuIds = sysMenuMapper.selectUserRoleMenuId(loginUser.getId());
        if (CollectionUtils.isEmpty(sysRoleMenuIds)) {
            return Collections.emptyList();
        }
        LinkedHashSet<Long> orderMenuIds = new LinkedHashSet<>(sysRoleMenuIds);
        sysRoleMenuIds = orderMenuIds.stream().toList(); // 顺序去重

        List<SysMenuView> result = new ArrayList<>();
        Set<Long> rootIds = new HashSet<>();
        List<SysMenu> sysMenus = sysMenuMapper.selectAll();
        Map<Long, SysMenuView> menuViewMap = sysMenus.stream().map(SysMenu::convertToView).collect(Collectors.toMap(SysMenuView::getId, it -> it));
        for (Long menuId : sysRoleMenuIds) {
            SysMenuView sysMenuView = menuViewMap.get(menuId);
            SysMenuView tmpView = sysMenuView;
            while (tmpView.getPid() > 0 && menuViewMap.containsKey(tmpView.getPid())) {
                SysMenuView parentMenu = menuViewMap.get(sysMenuView.getPid());
                parentMenu.getChildren().add(sysMenuView);
                tmpView = parentMenu;
            }
            if (!rootIds.contains(tmpView.getId())) {
                rootIds.add(tmpView.getId());
                result.add(tmpView);
            }
        }

        return result;
    }

}
