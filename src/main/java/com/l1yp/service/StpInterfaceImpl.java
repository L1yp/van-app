package com.l1yp.service;

import cn.dev33.satoken.stp.StpInterface;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.l1yp.mapper.system.RoleMapper;
import com.l1yp.mapper.system.RoleMenuMapper;
import com.l1yp.mapper.system.UserRoleMapper;
import com.l1yp.model.db.system.UserRole;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 自定义权限验证接口扩展 
 */
@Component    // 保证此类被SpringBoot扫描，完成Sa-Token的自定义权限验证扩展 
public class StpInterfaceImpl implements StpInterface {

    @Resource
    RoleMapper roleMapper;

    @Resource
    UserRoleMapper userRoleMapper;

    @Resource
    RoleMenuMapper roleMenuMapper;


    /**
     * 返回一个账号所拥有的权限码集合 
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return roleMenuMapper.selectPermissions((String) loginId);
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (权限与角色可分开校验)
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        List<UserRole> userRoles = userRoleMapper.selectList(new LambdaQueryWrapper<UserRole>().eq(UserRole::getUid, loginId));
        return userRoles.stream().map(UserRole::getRoleId).toList();
    }

}