package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.modeling.ModelingPermissionMapper;
import com.l1yp.model.db.modeling.ModelingPermission;
import com.l1yp.model.param.modeling.permission.ModelingPermissionBindParam;
import com.l1yp.model.param.modeling.permission.ModelingPermissionFindParam;
import com.l1yp.model.view.modeling.ModelingPermissionView;
import com.l1yp.service.modeling.IModelingPermissionService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ModelingPermissionServiceImpl extends ServiceImpl<ModelingPermissionMapper, ModelingPermission> implements IModelingPermissionService {


    @Override
    public ModelingPermissionView getPermission(ModelingPermissionFindParam param) {
        ModelingPermission permission = getOne(Wrappers.<ModelingPermission>lambdaQuery()
                .eq(ModelingPermission::getRoleId, param.getRoleId())
                .eq(ModelingPermission::getModule, param.getModule())
                .eq(ModelingPermission::getMkey, param.getMkey())
        );
        if (permission == null) {
            return null;
        }
        ModelingPermissionView view = new ModelingPermissionView();
        BeanCopierUtil.copy(permission, view);
        return view;
    }

    @Override
    @Transactional
    public void bingPermission(ModelingPermissionBindParam param) {
        remove(Wrappers.<ModelingPermission>lambdaQuery().eq(ModelingPermission::getRoleId, param.getRoleId())
                .eq(ModelingPermission::getModule, param.getModule())
                .eq(ModelingPermission::getMkey, param.getMkey()));

        ModelingPermission permission = new ModelingPermission();
        BeanCopierUtil.copy(param, permission);
        save(permission);
    }
}
