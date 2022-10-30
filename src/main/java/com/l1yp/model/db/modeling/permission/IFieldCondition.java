package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.system.DeptPlain;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface IFieldCondition {


    String PARAM_NAME = "args";

    void use(StringBuilder sb, String tableName, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem blockItem);

    /**
     * 获取子树 不包含当前层级
     * @param src 部门树
     * @param deptIds 要查询的部门ID列表
     * @return 子树id列表
     */
    default List<String> getDepartmentChildren(List<DeptPlain> src, List<String> deptIds) {
        Map<String, DeptPlain> deptIdMap = src.stream().collect(Collectors.toMap(DeptPlain::getId, it -> it));

        LinkedList<DeptPlain> candidateDeptList = deptIds.stream().map(deptIdMap::get).collect(Collectors.toCollection(LinkedList::new));

        Set<String> result = new HashSet<>();
        while (candidateDeptList.size() > 0) {
            DeptPlain deptPlain = candidateDeptList.pop();
            if (CollectionUtils.isEmpty(deptPlain.getChildren())) {
                continue;
            }

            for (DeptPlain child : deptPlain.getChildren()) {
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
        sb.append(" form_data_id IN ( ")
                .append("SELECT form_data_id FROM ").append(tableName)
                .append(" WHERE field_id = '").append(fieldName).append("' AND field_val IN ").append(strArgs);
        sb.append(")");
    }

}
