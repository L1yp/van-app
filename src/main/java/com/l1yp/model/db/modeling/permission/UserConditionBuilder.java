package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.UserFieldConditionModel;

import com.l1yp.model.db.system.SimpleDept;
import com.l1yp.util.RequestUtils;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class UserConditionBuilder implements IFieldCondition {

    static final Set<String> primitiveFields = new HashSet<>(Arrays.asList("create_by", "update_by"));

    @Override
    public void use(StringBuilder sb, String tableName, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel content) {
        String userId = RequestUtils.getLoginUser().getId();
        String fieldName = field.getField();

        UserFieldConditionModel userFieldConditionModel = (UserFieldConditionModel) content.getValue();

        if (!CollectionUtils.isEmpty(userFieldConditionModel.getUserIdList())) {
            List<String> userIdList = userFieldConditionModel.getUserIdList();
            List<String> varOptions = userIdList.stream().filter(UserFieldConditionModel.VAR_USER_OPTIONS::contains).toList();
            List<String> plainUsers = userIdList.stream().filter(it -> !UserFieldConditionModel.VAR_USER_OPTIONS.contains(it)).toList();
            plainUsers = new ArrayList<>(plainUsers); // toList返回的List不可变 需要重新构造

            // 纯用户查询
            if (varOptions.contains(UserFieldConditionModel.SELF)) {
                plainUsers.add(userId);
            }

            if (!CollectionUtils.isEmpty(plainUsers)) {

                final int startIdx = args.size();
                args.addAll(plainUsers);
                String strInArgs = IntStream.range(0, plainUsers.size()).boxed().map(it -> "#{" + PARAM_NAME + "[" + (startIdx + it) + "]}").collect(Collectors.joining(",", "(", ")"));
                if (primitiveFields.contains(fieldName)) {
                    sb.append(fieldName).append(" IN ").append(strInArgs);
                } else {
                    sb.append("id IN ( ")
                            .append("SELECT instance_id FROM ").append(tableName).append("_ref ")
                            .append(" WHERE ").append("field = '").append(fieldName).append("' ")
                            .append(" AND value IN ").append(strInArgs);
                    sb.append(")");
                }
            }

            // 部门反查
            if (varOptions.contains(UserFieldConditionModel.SELF_DPT) || varOptions.contains(UserFieldConditionModel.CHILD_DPT)) {
                List<String> candidateDptIds = new ArrayList<>();
                if (varOptions.contains(UserFieldConditionModel.SELF_DPT)) {
                    // 本人部门
                    candidateDptIds.addAll(selfDptIds);
                }

                if (varOptions.contains(UserFieldConditionModel.CHILD_DPT)) {
                    // 下级部门
                    List<String> children = getDepartmentChildren(dptTree, selfDptIds);
                    candidateDptIds.addAll(children);
                }
                candidateDptIds = new ArrayList<>(new HashSet<>(candidateDptIds));

                if (!CollectionUtils.isEmpty(candidateDptIds)) {

                    if (!CollectionUtils.isEmpty(plainUsers)) {
                        sb.append(" AND ");
                    }
                    String conditionSQL = buildUserConditionSQLByDept(tableName, args, fieldName, candidateDptIds);
                    sb.append(conditionSQL);
                }
            }


        }
        // 部门 - 用户
        if (StringUtils.hasText(userFieldConditionModel.getDeptId())) {

            List<String> deptIdList = new ArrayList<>();
            deptIdList.add(userFieldConditionModel.getDeptId());
            // 包含下级部门
            if (userFieldConditionModel.isCascader()) {
                List<String> children = getDepartmentChildren(dptTree, Collections.singletonList(userFieldConditionModel.getDeptId()));
                deptIdList.addAll(children);
            }

            if (!CollectionUtils.isEmpty(userFieldConditionModel.getUserIdList())) {
                sb.append(" AND ");
            }

            String conditionSQL = buildUserConditionSQLByDept(tableName, args, fieldName, deptIdList);
            sb.append(conditionSQL);


        }

    }

    /**
     * 构建部门反查用户条件SQL
     * @param tableName 表名
     * @param args 参数
     * @param field 用户字段名
     * @param deptIdList 部门列表
     */
    public String buildUserConditionSQLByDept(String tableName, List<Object> args, String field, List<String> deptIdList) {
        if (CollectionUtils.isEmpty(deptIdList)) {
            return "";
        }
        int startIdx = args.size();
        args.addAll(deptIdList);
        StringBuilder sb = new StringBuilder();
        String masterDptArg = null, extDptArg = null;
        if (deptIdList.size() == 1) {
            masterDptArg = "SELECT id FROM sys_user WHERE dept_id = #{" + PARAM_NAME + "[" + startIdx + "]}";
            extDptArg = "SELECT uid FROM sys_user_dept WHERE dept_id =#{" + PARAM_NAME + "[" + startIdx + "]}";
        } else if (deptIdList.size() > 1) {
            String strDPTArgs = IntStream.range(0, deptIdList.size()).boxed()
                    .map(it -> "#{" + PARAM_NAME + "[" + (startIdx + it) + "]}")
                    .collect(Collectors.joining(",", "(", ")"));
            masterDptArg = "SELECT id FROM sys_user WHERE dept_id IN " + strDPTArgs;
            extDptArg = "SELECT uid FROM sys_user_dept WHERE dept_id IN " + strDPTArgs;
        }

        if (masterDptArg != null) {
            appendDeptCondition(sb, tableName, field, masterDptArg, extDptArg);
        }

        return sb.toString();
    }

    public void appendDeptCondition(StringBuilder sb, String tableName, String field, String masterDptArg, String extDptArg) {
        if (primitiveFields.contains(field)) {
            sb.append("(");
            sb.append(field).append(" IN ").append("(").append(masterDptArg).append(")");
            sb.append(" OR ");
            sb.append(field).append(" IN ").append("(").append(extDptArg).append(")");
            sb.append(")");
        }
        else {
            sb.append(" id IN ( ")
                    .append("SELECT instance_id FROM ").append(tableName).append("_ref ")
                    .append(" WHERE field = '").append(field).append("' ")
                    .append(" AND ( value IN (").append(masterDptArg).append(")")
                    .append(" OR value IN (").append(extDptArg).append(")").append(")");
            sb.append(")");
        }
    }

}
