package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingEntityMapper;
import com.l1yp.mapper.modeling.ModelingFieldMapper;
import com.l1yp.mapper.modeling.ModelingFieldRefMapper;
import com.l1yp.mapper.modeling.ModelingOptionTypeMapper;
import com.l1yp.mapper.modeling.ModelingOptionValueMapper;
import com.l1yp.mapper.system.UserMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingField.FieldModule;
import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingFieldRef;
import com.l1yp.model.db.modeling.ModelingOptionScope;
import com.l1yp.model.db.modeling.ModelingOptionType;
import com.l1yp.model.db.modeling.ModelingOptionValue;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.system.User;
import com.l1yp.model.param.modeling.entity.ModelingEntityAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityUpdateParam;
import com.l1yp.model.view.modeling.ModelingEntityView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.modeling.IModelingEntityService;
import com.l1yp.util.BeanCopierUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

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
    UserMapper userMapper;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Override
    public ModelingEntityView findEntity(String id) {
        ModelingEntity entity = getById(id);
        if (entity == null) {
            throw new VanException(400, "业务实体不存在");
        }
        return entity.toView();
    }

    @Override
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
            List<User> users = userMapper.selectBatchIds(userIds);
            List<UserView> userList = users.stream().map(User::toView).toList();
            Map<String, UserView> userMap = userList.stream().collect(Collectors.toMap(UserView::getId, it -> it));
            pageData.setAdditional(userMap);
        }

        List<ModelingEntityView> modelingEntityViews = list.stream().map(ModelingEntity::toView).toList();

        pageData.initPage(list);
        pageData.setData(modelingEntityViews);

        return pageData;
    }

    @Override
    @Transactional
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
    public void deleteEntity(String id) {
        ModelingEntity fromEntity = getById(id);
        if (fromEntity == null) {
            throw new VanException(400, "实体不存在");
        }

        removeById(id);

        getBaseMapper().dropTable(ModelingEntity.buildEntityTableName(fromEntity.getMkey()));

        // 查询字段引用列表
        List<ModelingFieldRef> refFields = modelingFieldRefMapper.selectList(Wrappers.<ModelingFieldRef>lambdaQuery()
                .eq(ModelingFieldRef::getModule, FieldModule.ENTITY)
                .eq(ModelingFieldRef::getMkey, fromEntity.getMkey()));
        if (!CollectionUtils.isEmpty(refFields)) {
            List<String> fieldIds = refFields.stream().map(ModelingFieldRef::getFieldId).toList();

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


    }
}
