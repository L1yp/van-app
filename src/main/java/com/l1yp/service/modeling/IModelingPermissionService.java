package com.l1yp.service.modeling;

import com.l1yp.model.param.modeling.permission.ModelingPermissionBindParam;
import com.l1yp.model.param.modeling.permission.ModelingPermissionFindParam;
import com.l1yp.model.view.modeling.ModelingPermissionView;

public interface IModelingPermissionService {

    ModelingPermissionView getPermission(ModelingPermissionFindParam param);

    void bingPermission(ModelingPermissionBindParam param);


}

