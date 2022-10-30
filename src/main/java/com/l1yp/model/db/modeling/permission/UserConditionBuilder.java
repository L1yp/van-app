package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.UserConditionModel;

import com.l1yp.model.db.system.DeptPlain;
import com.l1yp.util.RequestUtils;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class UserConditionBuilder implements IFieldCondition {

    static final Set<String> primitiveFields = new HashSet<>(Arrays.asList("created_by", "modified_by"));

    @Override
    public void use(StringBuilder sb, String tableName, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem content) {
        String userId = RequestUtils.getLoginUser().getId();
        String fieldId = field.getId();

        UserConditionModel userConditionModel = null;

        if (!CollectionUtils.isEmpty(userConditionModel.getUsers())) {
            List<String> users = userConditionModel.getUsers();
            List<String> varOptions = users.stream().filter(UserConditionModel.VAR_USER_OPTIONS::contains).collect(Collectors.toList());
            List<String> plainUsers = users.stream().filter(it -> !UserConditionModel.VAR_USER_OPTIONS.contains(it)).collect(Collectors.toList());


            // 纯用户查询
            if (varOptions.contains(UserConditionModel.SELF)) {
                plainUsers.add(userId);
            }

            if (!CollectionUtils.isEmpty(plainUsers)) {

                final int startIdx = args.size();
                args.addAll(plainUsers);
                String strInArgs = IntStream.range(0, plainUsers.size()).boxed().map(it -> "#{" + PARAM_NAME + "[" + (startIdx + it) + "]}").collect(Collectors.joining(",", "(", ")"));
                if (primitiveFields.contains(fieldId)) {
                    sb.append(fieldId).append(" IN ").append(strInArgs);
                } else {
                    sb.append("form_data_id IN ( ")
                            .append("SELECT form_data_id FROM ").append(tableName)
                            .append(" WHERE ").append("field_id = '").append(fieldId).append("' ")
                            .append(" AND field_val IN ").append(strInArgs);
                    sb.append(")");
                }
            }

            // 部门反查
            if (varOptions.contains(UserConditionModel.SELF_DPT) || varOptions.contains(UserConditionModel.CHILD_DPT)) {
                List<String> candidateDptIds = new ArrayList<>();
                if (varOptions.contains(UserConditionModel.SELF_DPT)) {
                    // 本人部门
                    candidateDptIds.addAll(selfDptIds);
                }

                if (varOptions.contains(UserConditionModel.CHILD_DPT)) {
                    // 下级部门
                    List<String> children = getDepartmentChildren(dptTree, selfDptIds);
                    candidateDptIds.addAll(children);
                }
                candidateDptIds = new ArrayList<>(new HashSet<>(candidateDptIds));

                int startIdx2 = args.size();
                args.addAll(candidateDptIds);

                String strDPTArgs = IntStream.range(0, candidateDptIds.size()).boxed()
                        .map(it -> "#{" + PARAM_NAME + "[" + (startIdx2 + it) + "]}")
                        .collect(Collectors.joining(",", "(", ")"));

                String masterDptArg = "SELECT user_id FROM sys_user WHERE department_id IN " + strDPTArgs;
                String extDptArg = "SELECT user_id FROM sys_ext_user_department WHERE department_id IN " + strDPTArgs;

                if (!CollectionUtils.isEmpty(plainUsers)) {
                    sb.append(" AND ");
                }
                appendDeptCondition(sb, tableName, fieldId, masterDptArg, extDptArg);
            }


        }
        // 部门 - 用户
        if (StringUtils.hasText(userConditionModel.getDptId())) {

            String masterDptArg, extDptArg;
            // 包含下级部门
            if (userConditionModel.isContainerChildren()) {
                List<String> children = getDepartmentChildren(dptTree, Collections.singletonList(userConditionModel.getDptId()));
                children.add(userConditionModel.getDptId());

                int startIdx = args.size();
                args.addAll(children);

                String strDPTArgs = IntStream.range(0, children.size()).boxed()
                        .map(it -> "#{" + PARAM_NAME + "[" + (startIdx + it) + "]}")
                        .collect(Collectors.joining(",", "(", ")"));

                masterDptArg = "SELECT user_id FROM sys_user WHERE department_id IN " + strDPTArgs;
                extDptArg = "SELECT user_id FROM sys_ext_user_department WHERE department_id IN " + strDPTArgs;
            }
            // 不包含下级部门
            else {
                int startIdx = args.size();
                args.add(userConditionModel.getDptId());

                masterDptArg = "SELECT user_id FROM sys_user WHERE department_id = #{" + PARAM_NAME + "[" + startIdx + "]}";
                extDptArg = "SELECT user_id FROM sys_ext_user_department WHERE department_id =#{" + PARAM_NAME + "[" + startIdx + "]}";
            }

            if (!CollectionUtils.isEmpty(userConditionModel.getUsers())) {
                sb.append(" AND ");
            }
            appendDeptCondition(sb, tableName, fieldId, masterDptArg, extDptArg);


        }

    }

    public void appendDeptCondition(StringBuilder sb, String tableName, String fieldId, String masterDptArg, String extDptArg) {
        if (primitiveFields.contains(fieldId)) {
            sb.append("(");
            sb.append(fieldId).append(" IN ").append("(").append(masterDptArg).append(")");
            sb.append(" OR ");
            sb.append(fieldId).append(" IN ").append("(").append(extDptArg).append(")");
            sb.append(")");
        }
        else {
            sb.append(" form_data_id IN ( ")
                    .append("SELECT form_data_id FROM ").append(tableName)
                    .append(" WHERE field_id = '").append(fieldId).append("' ")
                    .append(" AND ( field_val IN (").append(masterDptArg).append(")")
                    .append(" OR field_val IN (").append(extDptArg).append(")").append(")");
            sb.append(")");
        }
    }

}
