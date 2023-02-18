package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.ModelingViewSimpleInfoListType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingViewMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.db.modeling.ModelingPermission;
import com.l1yp.model.db.modeling.ModelingView;
import com.l1yp.model.db.modeling.ModelingView.Collation;
import com.l1yp.model.db.modeling.ModelingViewColumn;
import com.l1yp.model.db.modeling.field.DeptFieldScheme;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.modeling.field.OptionFieldScheme;
import com.l1yp.model.db.modeling.field.UserFieldScheme;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.DeptFieldConditionModel;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.UserFieldConditionModel;
import com.l1yp.model.db.modeling.permission.DeptConditionBuilder;
import com.l1yp.model.db.modeling.permission.ExpressionModel;
import com.l1yp.model.db.modeling.permission.IFieldCondition;
import com.l1yp.model.db.modeling.permission.UserConditionBuilder;
import com.l1yp.model.db.system.Department;
import com.l1yp.model.db.system.SimpleDept;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.modeling.entity.ModelFindPageParam;
import com.l1yp.model.param.modeling.view.ModelingViewAddParam;
import com.l1yp.model.param.modeling.view.ModelingViewColumnParam;
import com.l1yp.model.param.modeling.view.ModelingViewFindParam;
import com.l1yp.model.param.modeling.view.ModelingViewSearchParam;
import com.l1yp.model.param.modeling.view.ModelingViewUpdateParam;
import com.l1yp.model.view.modeling.ModelingFieldDefView;
import com.l1yp.model.view.modeling.ModelingOptionValueView;
import com.l1yp.model.view.modeling.ModelingViewColumnView;
import com.l1yp.model.view.modeling.ModelingViewDetailInfo;
import com.l1yp.model.view.modeling.ModelingViewSimpleInfo;
import com.l1yp.model.view.system.DepartmentView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.modeling.IModelingViewService;
import com.l1yp.service.system.impl.DepartmentServiceImpl;
import com.l1yp.service.system.impl.UserDeptServiceImpl;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.NumberUtil;
import com.l1yp.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class ModelingViewServiceImpl extends ServiceImpl<ModelingViewMapper, ModelingView> implements IModelingViewService {

    private final Logger log = LoggerFactory.getLogger(ModelingViewServiceImpl.class);

    @Resource
    ModelingViewColumnServiceImpl modelingViewColumnService;

    @Resource
    UserServiceImpl userService;

    @Resource
    DepartmentServiceImpl departmentService;

    @Resource
    ModelingOptionValueServiceImpl optionValueService;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Resource
    CacheManager cacheManager;

    @Override
    @Cacheable(cacheNames = "modeling_view", key = "#p0.module + ':' + #p0.mkey")
    @CacheResultType(ModelingViewSimpleInfoListType.class)
    public List<ModelingViewSimpleInfo> findView(ModelingViewFindParam param) {
        LambdaQueryWrapper<ModelingView> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ModelingView::getModule, param.getModule());
        wrapper.eq(ModelingView::getMkey, param.getMkey());
        wrapper.orderByAsc(ModelingView::getSn);

        List<ModelingView> modelingViews = list(wrapper);
        if (CollectionUtils.isEmpty(modelingViews)) {
            return new ArrayList<>();
        }

        List<String> viewIds = modelingViews.stream().map(ModelingView::getId).toList();
        List<ModelingViewColumn> columnList = modelingViewColumnService.list(Wrappers.<ModelingViewColumn>lambdaQuery().in(ModelingViewColumn::getViewId, viewIds));
        List<ModelingViewColumnView> columnViewList = columnList.stream().map(ModelingViewColumn::toView).toList();
        Map<String, List<ModelingViewColumnView>> columnMap = columnViewList.stream().collect(Collectors.groupingBy(ModelingViewColumnView::getViewId, Collectors.toList()));

        List<ModelingField> fields = modelingFieldService.findModelFields(param.getModule(), param.getMkey());
        Map<String, ModelingFieldDefView> fieldMap = fields.stream().collect(Collectors.toMap(ModelingField::getId, ModelingField::toView));

        List<ModelingViewSimpleInfo> result = new ArrayList<>();
        for (ModelingView modelingView : modelingViews) {
            ModelingViewSimpleInfo simpleInfo = new ModelingViewSimpleInfo();
            BeanCopierUtil.copy(modelingView, simpleInfo);
            List<ModelingViewColumnView> columns = columnMap.get(modelingView.getId());
            columns.forEach(it -> it.setField(fieldMap.get(it.getFieldId())));
            simpleInfo.setColumns(columns);
            result.add(simpleInfo);
        }

        return result;
    }

    @Override
    public List<ModelingViewDetailInfo> searchView(ModelingViewSearchParam param) {
        LambdaQueryWrapper<ModelingView> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ModelingView::getModule, param.getModule());
        wrapper.eq(ModelingView::getMkey, param.getMkey());
        if (StringUtils.isNotBlank(param.getName())) {
            wrapper.like(ModelingView::getName, param.getName());
        }
        if (StringUtils.isNotBlank(param.getUpdateBy())) {
            wrapper.eq(ModelingView::getUpdateBy, param.getUpdateBy());
        }
        if (StringUtils.isNotBlank(param.getCreateBy())) {
            wrapper.eq(ModelingView::getUpdateBy, param.getUpdateBy());
        }
        wrapper.orderByAsc(ModelingView::getSn);
        List<ModelingView> modelingViews = list(wrapper);
        if (CollectionUtils.isEmpty(modelingViews)) {
            return Collections.emptyList();
        }

        Set<String> userIds = new HashSet<>();
        modelingViews.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });

        List<UserView> users = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = users.stream().collect(Collectors.toMap(UserView::getId, it -> it));

        // 查询视图配置详情
        List<String> viewIds = modelingViews.stream().map(ModelingView::getId).toList();
        List<ModelingViewColumn> columnList = modelingViewColumnService.list(Wrappers.<ModelingViewColumn>lambdaQuery().in(ModelingViewColumn::getViewId, viewIds));
        List<ModelingViewColumnView> columnViewList = columnList.stream().map(ModelingViewColumn::toView).toList();
        // 视图ID -> column list
        Map<String, List<ModelingViewColumnView>> columnMap = columnViewList.stream().collect(Collectors.groupingBy(ModelingViewColumnView::getViewId, Collectors.toList()));

        List<ModelingViewDetailInfo> detailInfoList = new ArrayList<>();
        for (ModelingView modelingView : modelingViews) {
            ModelingViewDetailInfo detailInfo = new ModelingViewDetailInfo();
            BeanCopierUtil.copy(modelingView, detailInfo);
            detailInfo.setCreateBy(userMap.get(modelingView.getCreateBy()));
            detailInfo.setUpdateBy(userMap.get(modelingView.getUpdateBy()));
            detailInfo.setColumns(columnMap.get(modelingView.getId()));
            detailInfoList.add(detailInfo);
        }

        return detailInfoList;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "modeling_view", key = "#p0.module + ':' + #p0.mkey")
    public void addView(ModelingViewAddParam param) {
        long count = count(Wrappers.<ModelingView>lambdaQuery()
                .eq(ModelingView::getModule, param.getModule())
                .eq(ModelingView::getMkey, param.getMkey())
                .eq(ModelingView::getName, param.getName()));
        if (count > 0) {
            throw new VanException(400, "视图名称重复，请更换一个视图名称");
        }

        ModelingView modelingView = new ModelingView();
        BeanCopierUtil.copy(param, modelingView);
        save(modelingView);

        if (!CollectionUtils.isEmpty(param.getColumns())) {
            List<ModelingViewColumn> viewColumns = new ArrayList<>();
            for (int i = 0; i < param.getColumns().size(); i++) {
                ModelingViewColumnParam columnParam = param.getColumns().get(i);
                ModelingViewColumn column = new ModelingViewColumn();
                BeanCopierUtil.copy(columnParam, column);
                column.setViewId(modelingView.getId());
                column.setSn(i + 1);
                viewColumns.add(column);
            }

            modelingViewColumnService.saveBatch(viewColumns);
        }
    }

    @Override
    @Transactional
    public void updateView(ModelingViewUpdateParam param) {

        ModelingView modelingView = getById(param.getId());
        if (modelingView == null) {
            throw new VanException(400, "视图ID有误");
        }
        long count = count(Wrappers.<ModelingView>lambdaQuery()
                .eq(ModelingView::getModule, modelingView.getModule())
                .eq(ModelingView::getMkey, modelingView.getMkey())
                .ne(ModelingView::getId, param.getId())
                .eq(ModelingView::getName, param.getName()));
        if (count > 0) {
            throw new VanException(400, "视图名称重复，请更换一个视图名称");
        }
        ModelingView view = new ModelingView();
        BeanCopierUtil.copy(param, view);
        boolean sameView = view.getName().equals(modelingView.getName());
        sameView = sameView && view.getSn().equals(modelingView.getSn());
        sameView = sameView && view.getStatus().equals(modelingView.getStatus());
        sameView = sameView && view.getCollation().equals(modelingView.getCollation());
        if (!sameView) {
            updateById(view);
        }

        if (!CollectionUtils.isEmpty(param.getColumns())) {
            modelingViewColumnService.remove(Wrappers.<ModelingViewColumn>lambdaQuery().eq(ModelingViewColumn::getViewId, param.getId()));
            List<ModelingViewColumn> viewColumns = new ArrayList<>();
            for (int i = 0; i < param.getColumns().size(); i++) {
                ModelingViewColumnParam columnParam = param.getColumns().get(i);
                ModelingViewColumn column = new ModelingViewColumn();
                BeanCopierUtil.copy(columnParam, column);
                column.setViewId(modelingView.getId());
                column.setSn(i + 1);
                viewColumns.add(column);
            }
            modelingViewColumnService.saveBatch(viewColumns);
        }

        Cache cache = cacheManager.getCache("modeling_view");
        if (cache != null) {
            cache.evictIfPresent(modelingView.getModule() + ":" + modelingView.getMkey());
        }

    }

    @Override
    public void deleteView(String id) {
        ModelingView modelingView = getById(id);
        if (modelingView == null) {
            throw new VanException(404, "此视图不存在");
        }
        modelingViewColumnService.remove(Wrappers.<ModelingViewColumn>lambdaQuery().eq(ModelingViewColumn::getViewId, id));

        Cache cache = cacheManager.getCache("modeling_view");
        if (cache != null) {
            cache.evictIfPresent(modelingView.getModule() + ":" + modelingView.getMkey());
        }
    }

    /******  instance *******/

    @Resource
    ModelingPermissionServiceImpl modelingPermissionService;

    @Resource
    UserDeptServiceImpl userDeptService;

    @Override
    public PageData<Map<String, Object>> pageModelingInstance(ModelFindPageParam param) {
        String loginUserId = RequestUtils.getLoginUserId();

        String tableName = null;
        if (param.getModule() == ModelingModule.ENTITY) {
            tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        } else {
            tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
        }
        List<ModelingField> fields = modelingFieldService.findModelFields(param.getModule(), param.getMkey());
        Map<String, ModelingField> fieldNameMap = fields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));

        List<String> columnNames = new ArrayList<>(param.getConditionMap().keySet());
        columnNames.add("id");
//        columnNames.addAll(fields.stream().filter(it -> it.getScope() == FieldScope.ENTITY_DEFAULT || it.getScope() == FieldScope.WORKFLOW_DEFAULT).map(ModelingFieldDefView::getField).toList());
        if (param.getModule() == ModelingModule.WORKFLOW) {
            columnNames.add("process_instance_id");
        }

        String columns = columnNames.stream().map(it -> "`" + it + "`").collect(Collectors.joining(","));

        // 部门列表
        List<SimpleDept> departmentList = departmentService.getSimpleDeptList();
        // 本人部门
        List<String> selfDeptIdList = userDeptService.getDeptIdListByUid(loginUserId);

        List<Object> args = new ArrayList<>();
        List<String> filterConditions = new ArrayList<>();
        // TODO: PERMISSION

        List<ModelingPermission> permissionList = modelingPermissionService.getPermissionList(loginUserId, param.getModule(), param.getMkey());
        if (CollectionUtils.isNotEmpty(permissionList)) {
            List<ExpressionModel> expressionModels = permissionList.stream().map(ModelingPermission::getContent).filter(Objects::nonNull).flatMap(Collection::stream).toList();
            boolean hasVarDept = modelingPermissionService.hasVarDept(expressionModels, fields);
            if (hasVarDept) {

                List<String> conditionList = new ArrayList<>();
                modelingPermissionService.buildPermissionSQL(tableName, fields, departmentList, selfDeptIdList, expressionModels, conditionList, args);

                String permissionCondition = String.join("", conditionList);
                filterConditions.add(permissionCondition);
            }
        }



        for (Entry<String, String> entry : param.getConditionMap().entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if (StringUtils.isBlank(value)) {
                continue;
            }
            ModelingField field = fieldNameMap.get(key);
            FieldType type = field.getType();
            if (type == FieldType.user) {
                UserFieldScheme scheme = (UserFieldScheme) field.getScheme();
                if (UserFieldConditionModel.SELF.equals(value)) {
                    value = RequestUtils.getLoginUser().getId();
                    if (scheme.getMultiple()) {
                        filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                    } else {
                        filterConditions.add(String.format("`%s` = #{args[%d]}", key, args.size()));
                    }
                    args.add(value);
                }
                // 本人部门
                else if (UserFieldConditionModel.SELF_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                    String conditionSQL = new UserConditionBuilder().buildUserConditionSQLByDept(tableName, args, field.getField(), selfDeptIdList);
                    filterConditions.add(conditionSQL);
                }
                // 下级部门
                else if (UserFieldConditionModel.CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                    UserConditionBuilder builder = new UserConditionBuilder();
                    List<String> selfChildrenDeptIdList = builder.getDepartmentChildren(departmentList, selfDeptIdList);
                    // 无下级部门时 无需过滤
                    if (CollectionUtils.isNotEmpty(selfChildrenDeptIdList)) {
                        String conditionSQL = new UserConditionBuilder().buildUserConditionSQLByDept(tableName, args, field.getField(), selfChildrenDeptIdList);
                        filterConditions.add(conditionSQL);
                    }
                }
                // 本人部门及下级部门
                else if (UserFieldConditionModel.SELF_CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                    UserConditionBuilder builder = new UserConditionBuilder();
                    List<String> selfChildrenDeptIdList = builder.getDepartmentChildren(departmentList, selfDeptIdList);
                    List<String> deptIdList = new ArrayList<>();
                    deptIdList.addAll(selfDeptIdList);
                    deptIdList.addAll(selfChildrenDeptIdList);
                    String conditionSQL = new UserConditionBuilder().buildUserConditionSQLByDept(tableName, args, field.getField(), deptIdList);
                    filterConditions.add(conditionSQL);
                }
                else {
                    if (scheme.getMultiple()) {
                        filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                    } else {
                        filterConditions.add(String.format("`%s` = #{args[%d]}", key, args.size()));
                    }
                }
            }
            else if (type == FieldType.dept) {
                DeptFieldScheme scheme = (DeptFieldScheme) field.getScheme();
                // 多选部门
                if (scheme.getMultiple()) {
                    var builder = new DeptConditionBuilder();
                    StringBuilder sb = new StringBuilder();
                    if (DeptFieldConditionModel.SELF_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        builder.appendRefBlock(sb, tableName, field.getField(), selfDeptIdList, args);
                    }
                    else if (DeptFieldConditionModel.CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        List<String> children = builder.getDepartmentChildren(departmentList, selfDeptIdList);
                        if (CollectionUtils.isNotEmpty(children)) {
                            builder.appendRefBlock(sb, tableName, field.getField(), children, args);
                        }
                    }
                    else if (DeptFieldConditionModel.SELF_CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        List<String> children = builder.getDepartmentChildren(departmentList, selfDeptIdList);
                        children.addAll(selfDeptIdList);
                        builder.appendRefBlock(sb, tableName, field.getField(), children, args);
                    } else {
                        List<String> deptIdList = new ArrayList<>();
                        deptIdList.add(value);
                        builder.appendRefBlock(sb, tableName, field.getField(), deptIdList, args);
                    }
                    String conditionSQL = sb.toString();
                    filterConditions.add(conditionSQL);

                }
                // 单选部门
                else {
                    var startIdx = args.size();
                    String conditionSQL = null;
                    if (DeptFieldConditionModel.SELF_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        args.addAll(selfDeptIdList);
                        conditionSQL = IntStream.range(0, selfDeptIdList.size()).boxed()
                                .map(it -> "#{" + IFieldCondition.PARAM_NAME + "[" + (startIdx + it) + "]}")
                                .collect(Collectors.joining(",", "`" + field.getField() + "` IN (", ")"));
                    }
                    else if (DeptFieldConditionModel.CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        List<String> departmentChildren = new DeptConditionBuilder().getDepartmentChildren(departmentList, selfDeptIdList);
                        if (CollectionUtils.isNotEmpty(departmentChildren)) {
                            args.addAll(departmentChildren);
                            conditionSQL = IntStream.range(0, departmentChildren.size()).boxed()
                                    .map(it -> "#{" + IFieldCondition.PARAM_NAME + "[" + (startIdx + it) + "]}")
                                    .collect(Collectors.joining(",", "`" + field.getField() + "` IN (", ")"));
                        }
                    }
                    else if (DeptFieldConditionModel.SELF_CHILD_DPT.equals(value) && CollectionUtils.isNotEmpty(selfDeptIdList)) {
                        List<String> departmentChildren = new DeptConditionBuilder().getDepartmentChildren(departmentList, selfDeptIdList);
                        departmentChildren.addAll(selfDeptIdList);
                        args.addAll(departmentChildren);
                        conditionSQL = IntStream.range(0, departmentChildren.size()).boxed()
                                .map(it -> "#{" + IFieldCondition.PARAM_NAME + "[" + (startIdx + it) + "]}")
                                .collect(Collectors.joining(",", "`" + field.getField() + "` IN (", ")"));
                    } else {
                        args.add(value);
                        conditionSQL = "`" + field.getField() + "` = #{" +
                                IFieldCondition.PARAM_NAME + "[" + startIdx + "]}";
                        filterConditions.add(conditionSQL);
                    }
                    if (conditionSQL != null) {
                        filterConditions.add(conditionSQL);
                    }

                }
            }
            else if (type == FieldType.text) {
                filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                args.add(value);
            }
            else if (type == FieldType.date) {
                if (!value.contains(",")) {
                    continue;
                }
                String[] dateRangeValue = value.split(",");
                String startTime = dateRangeValue[0].substring(0, 10);
                String endTime = dateRangeValue[1].substring(0, 10);
                filterConditions.add(String.format("`%s` >= FROM_UNIXTIME(%d)", key, args.size()));
                args.add(startTime);
                filterConditions.add(String.format("`%s` <= FROM_UNIXTIME(%d)", key, args.size()));
                args.add(endTime);
            }
            else if (type == FieldType.option) {
                OptionFieldScheme scheme = (OptionFieldScheme) field.getScheme();
                if (scheme.getMultiple()) {
                    filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                } else {
                    filterConditions.add(String.format("`%s` = #{args[%d]}", key, args.size()));
                }
                args.add(value);
            }
        }

        String countSql = "SELECT COUNT(*) FROM `" + tableName + "`";
        if (!CollectionUtils.isEmpty(filterConditions)) {
            countSql = countSql + filterConditions.stream().map(it -> "(" + it + ")").collect(Collectors.joining(" AND ", " WHERE ", ""));
        }
        int count = getBaseMapper().countEntity(countSql, args);
        if (count == 0) {
            return PageData.empty(param);
        }

        String pageSql = "SELECT " + columns + " FROM `" + tableName + "`";
        if (!CollectionUtils.isEmpty(filterConditions)) {
            pageSql = pageSql + filterConditions.stream().map(it -> "(" + it + ")").collect(Collectors.joining(" AND ", " WHERE ", ""));
        }

        if (!CollectionUtils.isEmpty(param.getCollation())) {
            List<String> orderFields = new ArrayList<>();
            for (Collation collation : param.getCollation()) {
                if (!fieldNameMap.containsKey(collation.getField())) {
                    // 排除非法字段
                    continue;
                }
                orderFields.add("`" + collation.getField() + "` " + collation.getOrder().toString());
            }
            pageSql = pageSql + orderFields.stream().collect(Collectors.joining(",", " ORDER BY ", ""));
        }

        pageSql = pageSql + String.format(" LIMIT %d,%d", param.getOffset(), param.getPageSize());

        List<Map<String, Object>> data = getBaseMapper().pageEntity(pageSql, args);

        List<ModelingField> columnList = columnNames.stream().map(fieldNameMap::get).toList();

        Set<String> optionIds = new HashSet<>();
        Set<String> userIds = new HashSet<>();
        Set<String> deptIds = new HashSet<>();
        for (ModelingField field : columnList) {
            FieldScheme scheme = field.getScheme();
            FieldType type = scheme.getType();
            if (type == FieldType.option) {
                OptionFieldScheme optionFieldScheme = (OptionFieldScheme) scheme;
                collectOptionFieldId(data, optionIds, field, optionFieldScheme.getMultiple());
            }
            else if (type == FieldType.user) {
                UserFieldScheme userFieldScheme = (UserFieldScheme) scheme;
                collectOptionFieldId(data, userIds, field, userFieldScheme.getMultiple());
            }
            else if (type == FieldType.dept) {
                DeptFieldScheme deptFieldScheme = (DeptFieldScheme) scheme;
                collectOptionFieldId(data, deptIds, field, deptFieldScheme.getMultiple());
            }
        }
        log.info("optionIds: {}, userIds: {}, deptIds: {}", optionIds, userIds, deptIds);
        Map<String, Object> additional = new HashMap<>();
        if (!CollectionUtils.isEmpty(userIds)) {
            Map<String, UserView> userMap = userService.listUserViewByIdList(userIds).stream().collect(Collectors.toMap(UserView::getId, it -> it));
            additional.put("userMap", userMap);
        }
        if (!CollectionUtils.isEmpty(deptIds)) {
            Map<String, DepartmentView> deptMap = departmentService.getDepartmentListByIds(deptIds)
                    .stream().map(Department::toView)
                    .collect(Collectors.toMap(DepartmentView::getId, it -> it));
            additional.put("deptMap", deptMap);
        }
        if (!CollectionUtils.isEmpty(optionIds)) {
            Map<String, ModelingOptionValueView> optionMap = optionValueService.getOptionValueByIdList(optionIds).stream().map(ModelingOptionValue::toView).collect(Collectors.toMap(ModelingOptionValueView::getId, it -> it));
            additional.put("optionMap", optionMap);
        }

        // 处理BigInteger类型为字符串
        data.forEach(NumberUtil::transformBigIntToString);

        PageData<Map<String, Object>> pageData = new PageData<>(param);
        pageData.setTotal(count);
        pageData.setData(data);
        pageData.setAdditional(additional);

        return pageData;
    }

    private void collectOptionFieldId(List<Map<String, Object>> data, Set<String> fieldValueIds, ModelingField field, boolean multiple) {
        if (multiple) {
            data.stream()
                    .map(it -> it.get(field.getField()))
                    .filter(Objects::nonNull)
                    .map(String::valueOf)
                    .filter(StringUtils::isNotBlank)
                    .map(it -> Arrays.asList(it.split(",")))
                    .flatMap(Collection::stream)
                    .forEach(fieldValueIds::add);
        } else {
            data.forEach(it -> {
                Object value = it.get(field.getField());
                if (value instanceof Number number) {
                    it.put(field.getField(), String.valueOf(number));
                }
            });
            data.stream()
                    .map(it -> it.get(field.getField()))
                    .filter(Objects::nonNull)
                    .map(String::valueOf)
                    .filter(StringUtils::isNotBlank)
                    .forEach(fieldValueIds::add);
        }
    }
}
