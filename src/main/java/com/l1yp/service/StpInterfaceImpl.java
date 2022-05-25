package com.l1yp.service;

import java.util.ArrayList;
import java.util.List;

import com.l1yp.mapper.SysPermissionMapper;
import com.l1yp.mapper.SysRoleMapper;
import org.springframework.stereotype.Component;
import cn.dev33.satoken.stp.StpInterface;

import javax.annotation.Resource;

/**
 * 自定义权限验证接口扩展 
 */
@Component    // 保证此类被SpringBoot扫描，完成Sa-Token的自定义权限验证扩展 
public class StpInterfaceImpl implements StpInterface {

    @Resource
    SysRoleMapper sysRoleMapper;

    @Resource
    SysPermissionMapper sysPermissionMapper;


    /**
     * 返回一个账号所拥有的权限码集合 
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return sysPermissionMapper.findUserPermissions(loginId);
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (权限与角色可分开校验)
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return sysRoleMapper.findUserRoleNames(loginId);
    }

}