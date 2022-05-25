package com.l1yp.service;

import com.l1yp.mapper.SysRoleMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysRole;
import com.l1yp.model.param.role.RoleAddParam;
import com.l1yp.model.param.role.RoleMenuBindParam;
import com.l1yp.model.param.role.RolePermissionBindParam;
import com.l1yp.model.param.role.RoleUpdateParam;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Service
public class RoleService {

    @Resource
    SysRoleMapper sysRoleMapper;


    @Transactional
    public ResultData<Void> bindMenu(RoleMenuBindParam param) {
        sysRoleMapper.deleteBoundMenu(param.getRoleId());
        sysRoleMapper.bindRoleMenu(param);
        return ResultData.OK;
    }

    public ResultData<List<Long>> menuBound(Long roleId) {
        List<Long> menuIds = sysRoleMapper.findMenuBound(roleId);
        return ResultData.ok(menuIds);
    }

    @Transactional
    public ResultData<Void> bindPermission(RolePermissionBindParam param) {
        sysRoleMapper.deleteBoundPermission(param.getRoleId());
        sysRoleMapper.bindRolePermission(param);
        return ResultData.OK;
    }

    public ResultData<List<Long>> permissionBound(Long roleId) {
        List<Long> menuIds = sysRoleMapper.findPermissionBound(roleId);
        return ResultData.ok(menuIds);
    }

    public ResultData<List<SysRole>> findRole() {
        List<SysRole> sysRoles = sysRoleMapper.selectAll();
        return ResultData.ok(sysRoles);
    }

    public ResultData<Void> addRole(RoleAddParam param) {
        SysRole role = new SysRole();
        BeanUtils.copyProperties(param, role);
        sysRoleMapper.insertSelective(role);
        return ResultData.OK;
    }

    public ResultData<Void> updateRole(RoleUpdateParam param) {
        SysRole role = new SysRole();
        BeanUtils.copyProperties(param, role);
        sysRoleMapper.updateByPrimaryKeySelective(role);
        return ResultData.OK;
    }

    public ResultData<Void> deleteRole(Long id) {
        sysRoleMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public ResultData<Void> batchDeleteRole(List<Long> ids) {
        sysRoleMapper.batchDeleteRole(ids);
        return ResultData.OK;
    }

}
