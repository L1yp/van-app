package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingViewMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingField.FieldModule;
import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingView;
import com.l1yp.model.db.modeling.ModelingView.Collation;
import com.l1yp.model.db.modeling.ModelingViewColumn;
import com.l1yp.model.db.modeling.field.DateFieldScheme;
import com.l1yp.model.db.modeling.field.OptionFieldScheme;
import com.l1yp.model.db.modeling.field.UserFieldScheme;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.modeling.entity.ModelFindPageParam;
import com.l1yp.model.param.modeling.field.ModelingFieldFindParam;
import com.l1yp.model.param.modeling.view.ModelingViewAddParam;
import com.l1yp.model.param.modeling.view.ModelingViewColumnParam;
import com.l1yp.model.param.modeling.view.ModelingViewFindParam;
import com.l1yp.model.param.modeling.view.ModelingViewSearchParam;
import com.l1yp.model.param.modeling.view.ModelingViewUpdateParam;
import com.l1yp.model.view.modeling.ModelingFieldDefView;
import com.l1yp.model.view.modeling.ModelingViewColumnView;
import com.l1yp.model.view.modeling.ModelingViewDetailInfo;
import com.l1yp.model.view.modeling.ModelingViewSimpleInfo;
import com.l1yp.model.view.modeling.ModelingViewView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.modeling.IModelingViewService;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ModelingViewServiceImpl extends ServiceImpl<ModelingViewMapper, ModelingView> implements IModelingViewService {

    private final Logger log = LoggerFactory.getLogger(ModelingViewServiceImpl.class);

    @Resource
    ModelingViewColumnServiceImpl modelingViewColumnService;

    @Resource
    UserServiceImpl userService;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Override
    public List<ModelingViewSimpleInfo> findView(ModelingViewFindParam param) {
        LambdaQueryWrapper<ModelingView> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ModelingView::getModule, param.getModule());
        wrapper.eq(ModelingView::getMkey, param.getMkey());
        wrapper.orderByAsc(ModelingView::getSn);

        List<ModelingView> modelingViews = list(wrapper);
        if (CollectionUtils.isEmpty(modelingViews)) {
            return Collections.emptyList();
        }

        List<String> viewIds = modelingViews.stream().map(ModelingView::getId).toList();
        List<ModelingViewColumn> columnList = modelingViewColumnService.list(Wrappers.<ModelingViewColumn>lambdaQuery().in(ModelingViewColumn::getViewId, viewIds));
        List<ModelingViewColumnView> columnViewList = columnList.stream().map(ModelingViewColumn::toView).toList();
        Map<String, List<ModelingViewColumnView>> columnMap = columnViewList.stream().collect(Collectors.groupingBy(ModelingViewColumnView::getViewId, Collectors.toList()));

        var fieldParam = new ModelingFieldFindParam();
        fieldParam.setModule(param.getModule());
        fieldParam.setMkey(param.getMkey());
        List<ModelingFieldDefView> fields = modelingFieldService.findFields(fieldParam);
        Map<String, ModelingFieldDefView> fieldMap = fields.stream().collect(Collectors.toMap(ModelingFieldDefView::getId, it -> it));

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

        List<User> users = userService.listByIds(userIds);
        Map<String, UserView> userMap = users.stream().map(User::toView).collect(Collectors.toMap(UserView::getId, it -> it));

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
    public void addView(ModelingViewAddParam param) {
        var count = count(Wrappers.<ModelingView>lambdaQuery()
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
        var count = count(Wrappers.<ModelingView>lambdaQuery()
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
    }

    @Override
    public void deleteView(String id) {
        modelingViewColumnService.remove(Wrappers.<ModelingViewColumn>lambdaQuery().eq(ModelingViewColumn::getViewId, id));
    }


    @Override
    public PageData<Map<String, Object>> pageModeling(ModelFindPageParam param) {
        var fieldParam = new ModelingFieldFindParam();
        fieldParam.setModule(param.getModule());
        fieldParam.setMkey(param.getMkey());
        List<ModelingFieldDefView> fields = modelingFieldService.findFields(fieldParam);
        Map<String, ModelingFieldDefView> fieldNameMap = fields.stream().collect(Collectors.toMap(ModelingFieldDefView::getField, it -> it));

        String columns = fields.stream().filter(it -> it.getScope() == FieldScope.ENTITY_DEFAULT || it.getScope() == FieldScope.WORKFLOW_DEFAULT).map(it -> "`" + it.getField() + "`").collect(Collectors.joining(","));

        List<Object> args = new ArrayList<>();
        // PERMISSION
        String tableName = null;
        if (param.getModule() == FieldModule.ENTITY) {
            tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        } else {
            tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
        }

        List<String> filterConditions = new ArrayList<>();
        for (Entry<String, String> entry : param.getConditionMap().entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if (StringUtils.isBlank(value)) {
                continue;
            }
            ModelingFieldDefView field = fieldNameMap.get(key);
            String type = field.getType();
            if (type.equals("user")) {
                if (value.equals("SELF")) {
                    value = RequestUtils.getLoginUser().getId();
                }
                UserFieldScheme scheme = (UserFieldScheme) field.getScheme();
                if (scheme.getMultiple()) {
                    filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                } else {
                    filterConditions.add(String.format("`%s` = #{args[%d]}", key, args.size()));
                }
                args.add(value);
            }
            else if (type.equals("text")) {
                filterConditions.add(String.format("`%s` LIKE CONCAT('%%', #{args[%d]}, '%%')", key, args.size()));
                args.add(value);
            }
            else if (type.equals("date")) {
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
            else if (type.equals("option")) {
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
        PageData<Map<String, Object>> pageData = new PageData<>(param);
        pageData.setTotal(count);
        pageData.setData(data);

        return pageData;
    }
}
