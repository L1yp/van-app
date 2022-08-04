package com.l1yp.service;

import com.l1yp.mapper.SysPermissionMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysPermission;
import com.l1yp.model.param.permission.PermissionAddParam;
import com.l1yp.model.param.permission.PermissionUpdateParam;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PermissionService {

    @Resource
    SysPermissionMapper sysPermissionMapper;

    public ResultData<List<SysPermission>> findPermission() {
        List<SysPermission> sysRoles = sysPermissionMapper.selectAll();
        return ResultData.ok(sysRoles);
    }

    public ResultData<Void> addPermission(PermissionAddParam param) {
        SysPermission permission = new SysPermission();
        BeanUtils.copyProperties(param, permission);
        sysPermissionMapper.insertSelective(permission);
        return ResultData.OK;
    }

    public ResultData<Void> updatePermission(PermissionUpdateParam param) {
        SysPermission permission = new SysPermission();
        BeanUtils.copyProperties(param, permission);
        sysPermissionMapper.updateByPrimaryKeySelective(permission);
        return ResultData.OK;
    }

    public ResultData<Void> deletePermission(Long id) {
        sysPermissionMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public ResultData<Void> batchDeletePermission(List<Long> ids) {
        sysPermissionMapper.batchDeleteRole(ids);
        return ResultData.OK;
    }

}
