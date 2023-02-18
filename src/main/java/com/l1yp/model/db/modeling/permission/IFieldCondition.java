package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.system.SimpleDept;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface IFieldCondition {


    String PARAM_NAME = "args";

    void use(StringBuilder sb, String tableName, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem);

    /**
     * 获取子树 不包含当前层级
     * @param src 部门树
     * @param deptIds 要查询的部门ID列表
     * @return 子树id列表
     */
    default List<String> getDepartmentChildren(List<SimpleDept> src, List<String> deptIds) {
        Map<String, SimpleDept> deptIdMap = src.stream().collect(Collectors.toMap(SimpleDept::getId, it -> it));

        LinkedList<SimpleDept> candidateDeptList = deptIds.stream().map(deptIdMap::get).collect(Collectors.toCollection(LinkedList::new));

        Set<String> result = new HashSet<>();
        while (candidateDeptList.size() > 0) {
            SimpleDept simpleDept = candidateDeptList.pop();
            if (CollectionUtils.isEmpty(simpleDept.getChildren())) {
                continue;
            }

            for (SimpleDept child : simpleDept.getChildren()) {
                result.add(child.getId());
                if (!CollectionUtils.isEmpty(child.getChildren())) {
                    candidateDeptList.add(child);
                }
            }
        }

        return new ArrayList<>(result);
    }


    default void appendRefBlock(StringBuilder sb, String tableName, String fieldName, List<String> val, List<Object> args) {
        int startIdx = args.size();
        args.addAll(val);
        String strArgs = IntStream.range(0, val.size()).boxed()
                .map(it -> "#{" + PARAM_NAME + "[" + (startIdx + it) + "]}")
                .collect(Collectors.joining(",", "(", ")"));
        sb.append(" id IN ( ")
                .append("SELECT instance_id FROM ").append(tableName).append("_ref")
                .append(" WHERE field = '").append(fieldName).append("' AND value IN ").append(strArgs);
        sb.append(")");
    }

}
