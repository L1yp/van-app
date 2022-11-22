package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.ModelingEntityViewPageType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingEntityMapper;
import com.l1yp.mapper.modeling.ModelingFieldMapper;
import com.l1yp.mapper.modeling.ModelingFieldRefMapper;
import com.l1yp.mapper.modeling.ModelingOptionTypeMapper;
import com.l1yp.mapper.modeling.ModelingOptionValueMapper;
import com.l1yp.mapper.modeling.ModelingViewColumnMapper;
import com.l1yp.mapper.modeling.ModelingViewMapper;
import com.l1yp.mapper.system.UserMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingFieldRef;
import com.l1yp.model.db.modeling.ModelingOptionScope;
import com.l1yp.model.db.modeling.ModelingOptionType;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.db.modeling.ModelingView;
import com.l1yp.model.db.modeling.ModelingViewColumn;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.system.User;
import com.l1yp.model.param.modeling.entity.ModelingEntityAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceDeleteParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceUpdateParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityUpdateParam;
import com.l1yp.model.view.modeling.ModelingEntityView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.FormService;
import com.l1yp.service.modeling.IModelingEntityService;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.NumberUtil;
import com.l1yp.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class ModelingEntityServiceImpl extends ServiceImpl<ModelingEntityMapper, ModelingEntity> implements IModelingEntityService {

    private final Logger log = LoggerFactory.getLogger(ModelingEntityServiceImpl.class);

    @Resource
    ModelingFieldMapper modelingFieldMapper;

    @Resource
    ModelingFieldRefMapper modelingFieldRefMapper;

    @Resource
    ModelingOptionTypeMapper modelingOptionTypeMapper;

    @Resource
    ModelingOptionValueMapper modelingOptionValueMapper;

    @Resource
    UserServiceImpl userService;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Resource
    ModelingViewMapper modelingViewMapper;

    @Resource
    ModelingViewColumnMapper modelingViewColumnMapper;

    @Resource
    CacheManager cacheManager;

    @Override
    @Cacheable(cacheNames = "entity", key = "#p0")
    @CacheResultType(ModelingEntityView.class)
    public ModelingEntityView findEntity(String id) {
        ModelingEntity entity = getById(id);
        if (entity == null) {
            throw new VanException(400, "业务实体不存在");
        }
        return entity.toView();
    }

    @Override
    @Cacheable(cacheNames = "entity_search", key = "#p0.offset + ',' + #p0.pageSize", condition = "#p0.key == '' and #p0.name == '' and #p0.remark == '' and #p0.createBy == '' and #p0.updateBy == '' ")
    @CacheResultType(ModelingEntityViewPageType.class)
    public PageData<ModelingEntityView> searchEntity(ModelingEntityFindParam param) {
        LambdaQueryWrapper<ModelingEntity> wrapper = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(param.getKey())) {
            wrapper.like(ModelingEntity::getMkey, param.getKey());
        }
        if (StringUtils.isNotBlank(param.getName())) {
            wrapper.like(ModelingEntity::getName, param.getName());
        }
        if (StringUtils.isNotBlank(param.getRemark())) {
            wrapper.like(ModelingEntity::getRemark, param.getRemark());
        }
        if (StringUtils.isNotBlank(param.getUpdateBy())) {
            wrapper.like(ModelingEntity::getUpdateBy, param.getUpdateBy());
        }
        if (StringUtils.isNotBlank(param.getCreateBy())) {
            wrapper.like(ModelingEntity::getCreateBy, param.getCreateBy());
        }
        PageHelper.startPage(param.getPageIdx(), param.getPageSize());
        List<ModelingEntity> list = list(wrapper);

        Set<String> userIds = new HashSet<>();
        list.forEach(it -> {
            userIds.add(it.getUpdateBy());
            userIds.add(it.getCreateBy());
        });
        PageData<ModelingEntityView> pageData = new PageData<>();

        if (!userIds.isEmpty()) {
            List<UserView> userList = userService.listUserViewByIdList(userIds);
            Map<String, UserView> userMap = userList.stream().collect(Collectors.toMap(UserView::getId, it -> it));
            pageData.setAdditional(userMap);
        }

        List<ModelingEntityView> modelingEntityViews = list.stream().map(ModelingEntity::toView).collect(Collectors.toList());

        pageData.initPage(list);
        pageData.setData(modelingEntityViews);

        return pageData;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "entity_search")
    public void addEntity(ModelingEntityAddParam param) {
        ModelingEntity entity = new ModelingEntity();
        BeanCopierUtil.copy(param, entity);
        entity.setStatus(0);
        save(entity);


        List<ModelingField> defaultEntityFields = modelingFieldMapper.selectList(Wrappers.<ModelingField>lambdaQuery().eq(ModelingField::getScope, FieldScope.ENTITY_DEFAULT));
        List<String> columnDefs = new ArrayList<>();
        Set<String> notNullFields = new HashSet<>(Arrays.asList("id", "update_by", "update_time", "create_by", "create_time"));
        String primaryField = "id";
        for (ModelingField field : defaultEntityFields) {
            FieldScheme scheme = field.getScheme();
            String dbType = modelingFieldService.getDbType(field.getWidth(), scheme);
            String nullable = "NULL";
            String primaryKey = "";
            if (primaryField.equals(field.getField())) {
                primaryKey = "PRIMARY KEY";
            }
            if (notNullFields.contains(field.getField())) {
                nullable = "NOT NULL";
            }
            String columnDef = String.format("`%s` %s %s %s COMMENT '%s'", field.getField(), dbType, nullable, primaryKey, field.getLabel());
            if (field.getField().equals("create_time")) {
                columnDef = "create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'";
            }
            if (field.getField().equals("create_time")) {
                columnDef = "create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'";
            }
            columnDefs.add(columnDef);
        }
        String tableName = ModelingEntity.buildEntityTableName(param.getMkey());

        // TODO: 防止SQL注入
        String createDDL = columnDefs.stream().collect(Collectors.joining(",\n", "CREATE TABLE `" + tableName + "` (\n"  , "\n) COMMENT '" + entity.getRemark() + "'"));
        log.info("create table ddl: {}", createDDL);
        getBaseMapper().createTable(createDDL);
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "entity", key = "#p0.id"),
            @CacheEvict(cacheNames = "entity_search")
    })
    public void updateEntity(ModelingEntityUpdateParam param) {
        ModelingEntity fromEntity = getById(param.getId());
        if (fromEntity == null) {
            throw new VanException(400, "实体不存在");
        }

        ModelingEntity entity = new ModelingEntity();
        BeanCopierUtil.copy(param, entity);
        updateById(entity);

    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(cacheNames = "entity", key = "#p0"),
            @CacheEvict(cacheNames = "entity_search")
    })
    public void deleteEntity(String id) {
        ModelingEntity fromEntity = getById(id);
        if (fromEntity == null) {
            throw new VanException(400, "实体不存在");
        }

        removeById(id);

        getBaseMapper().dropTable(ModelingEntity.buildEntityTableName(fromEntity.getMkey()));

        // 查询字段引用列表
        List<ModelingFieldRef> refFields = modelingFieldRefMapper.selectList(Wrappers.<ModelingFieldRef>lambdaQuery()
                .eq(ModelingFieldRef::getModule, ModelingModule.ENTITY)
                .eq(ModelingFieldRef::getMkey, fromEntity.getMkey()));
        if (!CollectionUtils.isEmpty(refFields)) {
            List<String> fieldIds = refFields.stream().map(ModelingFieldRef::getFieldId).collect(Collectors.toList());

            // 只删除私有字段
            modelingFieldMapper.delete(Wrappers.<ModelingField>lambdaQuery()
                    .eq(ModelingField::getScope, FieldScope.ENTITY_PRIVATE)
                    .in(ModelingField::getId, fieldIds)
            );

            // 引用字段主键列表
            List<String> refIds = refFields.stream().map(ModelingFieldRef::getId).toList();

            // 接触所有引用关系 包括全局
            modelingFieldRefMapper.deleteBatchIds(refIds);

        }

        // 删除 私有数据源
        List<ModelingOptionType> modelingOptionTypes = modelingOptionTypeMapper.selectList(Wrappers.<ModelingOptionType>lambdaQuery()
                .eq(ModelingOptionType::getScope, ModelingOptionScope.ENTITY_PRIVATE)
                .eq(ModelingOptionType::getMkey, fromEntity.getMkey())
        );

        if (!CollectionUtils.isEmpty(modelingOptionTypes)) {
            List<String> typeIds = modelingOptionTypes.stream().map(ModelingOptionType::getId).toList();

            // 删除选项定义
            modelingOptionTypeMapper.delete(Wrappers.<ModelingOptionType>lambdaQuery().in(ModelingOptionType::getId, typeIds));

            // 删除选项值
            modelingOptionValueMapper.delete(Wrappers.<ModelingOptionValue>lambdaQuery().in(ModelingOptionValue::getTypeId, typeIds));

        }

        // 删除视图
        List<ModelingView> modelingViews = modelingViewMapper.selectList(Wrappers.<ModelingView>lambdaQuery()
                .eq(ModelingView::getModule, ModelingModule.ENTITY)
                .eq(ModelingView::getMkey, fromEntity.getMkey())
        );
        if (CollectionUtils.isNotEmpty(modelingViews)) {
            List<String> viewIdList = modelingViews.stream().map(ModelingView::getId).toList();
            modelingViewColumnMapper.delete(Wrappers.<ModelingViewColumn>lambdaQuery().in(ModelingViewColumn::getViewId, viewIdList));
            modelingViewMapper.delete(Wrappers.<ModelingView>lambdaQuery().in(ModelingView::getId, viewIdList));
        }


    }

    // instance methods

    private static final Set<String> excludeInputFields = new HashSet<>(Arrays.asList("id", "create_by", "create_time", "update_by", "update_time"));

    @Resource
    FormService formService;

    @Override
    @Transactional
    public void createInstance(ModelingEntityInstanceAddParam param) {
        ModelingEntity modelingEntity = getOne(Wrappers.<ModelingEntity>lambdaQuery().eq(ModelingEntity::getMkey, param.getMkey()));
        if (modelingEntity == null) {
            throw new VanException(404, "实体不存在: " + param.getMkey());
        }

        formService.createInstance(ModelingModule.ENTITY, param.getMkey(), param.getData());

//
//
//        // TODO: check 实体新增权限
//
//        User loginUser = RequestUtils.getLoginUser();
//
//        String tableName = ModelingEntity.buildEntityTableName(param.getMkey());
//        Map<String, Object> data = param.getData();
//
//        List<ModelingField> fields = modelingFieldService.findModelFields(ModelingModule.ENTITY, param.getMkey());
//        Map<String, ModelingField> fieldMap = fields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));
//        List<String> excludeKeys = data.keySet().stream().filter(it -> !fieldMap.containsKey(it) || excludeInputFields.contains(it)).toList();
//
//        Map<String, Object> formData = data.entrySet().stream().filter(it -> !excludeKeys.contains(it.getKey())).collect(Collectors.toMap(Entry::getKey, Entry::getValue));
//        List<String> columnFields = new ArrayList<>(formData.keySet());
//        columnFields.add("id");
//        columnFields.add("create_by");
//        columnFields.add("create_time");
//        columnFields.add("update_by");
//        columnFields.add("update_time");
//        String columns = columnFields.stream().map(it -> "`" + it + "`").collect(Collectors.joining(","));
//
//        List<Object> args = new ArrayList<>();
//        columnFields.stream().filter(formData::containsKey).map(formData::get).forEach(args::add);
//        args.add(IdWorker.getIdStr());
//        args.add(loginUser.getId());
//        args.add(new Date());
//        args.add(loginUser.getId());
//        args.add(new Date());
//
//        String values = IntStream.range(0, args.size()).boxed().map(it -> "#{args[" + it + "]}").collect(Collectors.joining(", "));
//
//        String sql = String.format("INSERT INTO %s(%s) VALUES(%s)", tableName, columns, values);
//        getBaseMapper().executeSQL(sql, args);

    }

    @Override
    @Transactional
    public void updateEntityInstance(ModelingEntityInstanceUpdateParam param) {
        ModelingEntity modelingEntity = getOne(Wrappers.<ModelingEntity>lambdaQuery().eq(ModelingEntity::getMkey, param.getMkey()));
        if (modelingEntity == null) {
            throw new VanException(404, "实体不存在: " + param.getMkey());
        }

        formService.updateInstance(ModelingModule.ENTITY, param.getMkey(), param.getData());
//
//        User loginUser = RequestUtils.getLoginUser();
//        // TODO: check 实体更新权限
//
//        String tableName = ModelingEntity.buildEntityTableName(param.getMkey());
//        Map<String, Object> data = param.getData();
//
//        List<ModelingField> fields = modelingFieldService.findModelFields(ModelingModule.ENTITY, param.getMkey());
//        Map<String, ModelingField> fieldMap = fields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));
//        List<String> excludeKeys = data.keySet().stream().filter(it -> !fieldMap.containsKey(it) || excludeInputFields.contains(it)).toList();
//
//        Map<String, Object> formData = data.entrySet().stream().filter(it -> !excludeKeys.contains(it.getKey())).collect(Collectors.toMap(Entry::getKey, Entry::getValue));
//        List<String> columnFields = new ArrayList<>(formData.keySet());
//        columnFields.add("update_by");
//        columnFields.add("update_time");
//
//        List<Object> args = new ArrayList<>();
//        columnFields.stream().filter(formData::containsKey).map(formData::get).forEach(args::add);
//
//        args.add(loginUser.getId());
//        args.add(new Date());
//        args.add(param.getId());
//
//        // exclude
//        String values = IntStream.range(0, columnFields.size()).boxed().map(it -> String.format("`%s` = #{args[%d]}", columnFields.get(it), it)).collect(Collectors.joining(", "));
//
//        String sql = String.format("UPDATE %s SET %s WHERE id = #{args[%d]}", tableName, values, args.size() - 1);
//        getBaseMapper().executeSQL(sql, args);

    }

    @Override
    @Transactional
    public void deleteEntityInstance(ModelingEntityInstanceDeleteParam param) {
        ModelingEntity modelingEntity = getOne(Wrappers.<ModelingEntity>lambdaQuery().eq(ModelingEntity::getMkey, param.getMkey()));
        if (modelingEntity == null) {
            throw new VanException(404, "实体不存在: " + param.getMkey());
        }
        // TODO: check 实体删除权限

        String tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        List<Object> args = new ArrayList<>();
        args.add(param.getId());
        String sql = "DELETE FROM " + tableName + " WHERE id = #{args[0]}";
        getBaseMapper().executeSQL(sql, args);

    }

    @Override
    public Map<String, Object> getInstance(ModelingEntityInstanceFindParam param) {
        ModelingEntity modelingEntity = getOne(Wrappers.<ModelingEntity>lambdaQuery().eq(ModelingEntity::getMkey, param.getMkey()));
        if (modelingEntity == null) {
            throw new VanException(404, "实体不存在: " + param.getMkey());
        }
        String tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        Map<String, Object> instance = getBaseMapper().getInstance(tableName, param.getId());
        NumberUtil.transformBigIntToString(instance);
        return instance;
    }
}
