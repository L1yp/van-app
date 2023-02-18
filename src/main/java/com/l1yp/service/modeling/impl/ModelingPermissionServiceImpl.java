package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.modeling.ModelingPermissionMapper;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingPermission;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.DeptFieldConditionModel;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.UserFieldConditionModel;
import com.l1yp.model.db.modeling.permission.ConditionSQLBuilderRegistry;
import com.l1yp.model.db.modeling.permission.ExpressionModel;
import com.l1yp.model.db.modeling.permission.ExpressionModel.ExpressionType;
import com.l1yp.model.db.modeling.permission.IFieldCondition;
import com.l1yp.model.db.system.SimpleDept;
import com.l1yp.model.param.modeling.permission.ModelingPermissionBindParam;
import com.l1yp.model.param.modeling.permission.ModelingPermissionFindParam;
import com.l1yp.model.view.modeling.ModelingPermissionView;
import com.l1yp.service.modeling.IModelingPermissionService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    public List<ModelingPermission> getPermissionList(String uid, ModelingModule module, String mkey) {
        return getBaseMapper().getUserPermissionList(uid, module, mkey);
    }

    public boolean hasVarDept(List<ExpressionModel> permissionList, List<ModelingField> modelFields) {
        Map<String, ModelingField> fieldMap = modelFields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));
        for (ExpressionModel item : permissionList) {
            if (item.getType() == ExpressionType.BLOCK) {
                String field = item.getContent().getField();
                ModelingField modelingField = fieldMap.get(field);
                if (modelingField != null) {
                    if (modelingField.getType() == FieldType.dept) {
                        DeptFieldConditionModel deptFieldConditionModel = (DeptFieldConditionModel) item.getContent().getValue();
                        if (DeptFieldConditionModel.SELF_DPT.equals(deptFieldConditionModel.getDeptId()) && deptFieldConditionModel.isCascader()) {
                            return true;
                        }
                    }
                    else if (modelingField.getType() == FieldType.user) {
                        UserFieldConditionModel userFieldConditionModel = (UserFieldConditionModel) item.getContent().getValue();
                        // 指定用户 存在【本人部门】【下级部门】变量时
                        if (CollectionUtils.isNotEmpty(userFieldConditionModel.getUserIdList()) &&
                                (userFieldConditionModel.getUserIdList().contains(UserFieldConditionModel.SELF_DPT) ||
                                        userFieldConditionModel.getUserIdList().contains(UserFieldConditionModel.CHILD_DPT))
                        ) {
                            return true;
                        }

                        // 选择了下级部门时
                        if (StringUtils.isNotBlank(userFieldConditionModel.getDeptId()) && userFieldConditionModel.isCascader()) {
                            return true;
                        }
                    }
                }
            }
        }

        return false;
    }

    public void buildPermissionSQL(String tableName, List<ModelingField> modelFields, List<SimpleDept> departmentList, List<String> selfDeptIds, List<ExpressionModel> permissionList, List<String> conditionList, List<Object> args) {
        Map<String, ModelingField> fieldMap = modelFields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));
        for (ExpressionModel expressionModel : permissionList) {
            ExpressionType type = expressionModel.getType();
            if (type == ExpressionType.BLOCK) {
                // 字段名
                String field = expressionModel.getContent().getField();
                ModelingField modelingField = fieldMap.get(field);
                if (modelingField == null) {
                    throw new RuntimeException("计算权限时发现不存在的字段: " + field);
                }
                IFieldCondition builder = ConditionSQLBuilderRegistry.getBuilder(modelingField.getType().name());
                StringBuilder sb = new StringBuilder();
                sb.append("(");
                builder.use(sb, tableName, modelingField, departmentList, selfDeptIds, args, expressionModel.getContent());
                sb.append(")");
                String block = sb.toString();
                conditionList.add(block);
            } else if (type == ExpressionType.AND) {
                conditionList.add(" AND ");
            } else if (type == ExpressionType.OR) {
                conditionList.add(" OR ");
            } else if (type == ExpressionType.START) {
                conditionList.add(" ( ");
            } else if (type == ExpressionType.END) {
                conditionList.add(" ) ");
            }
        }
    }

}
