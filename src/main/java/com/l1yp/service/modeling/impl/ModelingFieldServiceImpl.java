package com.l1yp.service.modeling.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.cache.CacheResultType;
import com.l1yp.cache.type.ModelingFieldListType;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingFieldMapper;
import com.l1yp.mapper.modeling.ModelingFieldRefMapper;
import com.l1yp.mapper.modeling.ModelingViewColumnMapper;
import com.l1yp.model.db.modeling.ModelingEntity;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingFieldRef;
import com.l1yp.model.db.modeling.ModelingViewColumn;
import com.l1yp.model.db.modeling.field.DeptFieldScheme;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.modeling.field.NumberInputFieldScheme;
import com.l1yp.model.db.modeling.field.OptionFieldScheme;
import com.l1yp.model.db.modeling.field.UserFieldScheme;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.modeling.field.ModelingFieldAddParam;
import com.l1yp.model.param.modeling.field.ModelingFieldUpdateParam;
import com.l1yp.model.param.modeling.field.ModelingFieldFindParam;
import com.l1yp.model.param.modeling.field.ModelingFieldRefParam;
import com.l1yp.model.view.modeling.ModelingFieldDefView;
import com.l1yp.service.modeling.IModelingFieldService;
import com.l1yp.util.BeanCopierUtil;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

@Service
public class ModelingFieldServiceImpl extends ServiceImpl<ModelingFieldMapper, ModelingField> implements IModelingFieldService {

    @Resource
    ModelingFieldRefMapper modelingFieldRefMapper;

    @Resource
    ModelingViewColumnMapper modelingViewColumnMapper;


    @Resource
    CacheManager cacheManager;

    @Override
    public List<ModelingFieldDefView> findFields(ModelingFieldFindParam param) {
        LambdaQueryWrapper<ModelingField> wrapper = Wrappers.lambdaQuery();
        if (param.getScope() != null) {
            wrapper.eq(ModelingField::getScope, param.getScope());
            List<ModelingField> workflowFieldDefs = getBaseMapper().selectList(wrapper);
            return workflowFieldDefs.stream().map(ModelingField::toView).toList();
        }

        if (StringUtils.hasText(param.getMkey())) {
            if (param.getModule() == ModelingModule.ENTITY || param.getModule() == ModelingModule.WORKFLOW) {
                return ((ModelingFieldServiceImpl) AopContext.currentProxy())
                        .findModelFields(param.getModule(), param.getMkey())
                        .stream().map(ModelingField::toView).toList();
            }
        }
        return Collections.emptyList();
    }

    @Override
    @Cacheable(value = "modeling_field", key = "#p0.toString() + ':' + #p1", condition = "#p0 != null and #p1 != ''")
    @CacheResultType(ModelingFieldListType.class)
    public List<ModelingField> findModelFields(ModelingModule module, String mkey) {
        ModelingFieldFindParam param = new ModelingFieldFindParam();
        param.setModule(module);
        param.setMkey(mkey);
        if (module == ModelingModule.ENTITY) {
            return getBaseMapper().selectEntityFields(param);
        } else {
            return getBaseMapper().selectWFFields(param);
        }
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(
                    cacheNames = "modeling_field",
                    key = "#p0.scope.toModelingModule().toString() + ':' + #p0.mkey",
                    condition = "#p0.scope.toModelingModule() != null and #p0.mkey != ''"
            ),
            @CacheEvict(cacheNames = "modeling_view", allEntries = true)
    })
    public void addField(ModelingFieldAddParam param) {
        if (param.getScope() == FieldScope.WORKFLOW_PRIVATE || param.getScope() == FieldScope.ENTITY_PRIVATE) {
            if (!StringUtils.hasText(param.getMkey())) {
                throw new VanException(400, "私有字段必传mkey");
            }
        }

        ModelingField modelingField = new ModelingField();
        BeanCopierUtil.copy(param, modelingField);

        save(modelingField);
        if (StringUtils.hasText(param.getMkey())) {
            ModelingFieldRef modelingFieldRef = new ModelingFieldRef();
            if (param.getScope() == FieldScope.WORKFLOW_PRIVATE) {
                modelingFieldRef.setModule(ModelingModule.WORKFLOW);
            }
            if (param.getScope() == FieldScope.ENTITY_PRIVATE) {
                modelingFieldRef.setModule(ModelingModule.ENTITY);
            }
            modelingFieldRef.setFieldId(modelingField.getId());
            modelingFieldRef.setMkey(param.getMkey());
            modelingFieldRefMapper.insert(modelingFieldRef);

            // 开始添加字段
            String dbType = getDbType(param.getWidth(), param.getScheme());

            String tableName = null;
            FieldScope scope = param.getScope();
            if (scope == FieldScope.WORKFLOW_PRIVATE) {
                tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
            }
            else if (scope == FieldScope.ENTITY_PRIVATE) {
                tableName = ModelingEntity.buildEntityTableName(param.getMkey());
            }


            getBaseMapper().addTableColumn(tableName, param.getField(), dbType, param.getLabel());
        }



    }

    public String getDbType(int width, FieldScheme fieldScheme) {
        String dbType = "VARCHAR(" + width + ")";
        FieldType type = fieldScheme.getType();
        if (type == FieldType.user) {
            UserFieldScheme scheme = (UserFieldScheme) fieldScheme;
            if (!Boolean.TRUE.equals(scheme.getMultiple())) {
                dbType = "BIGINT UNSIGNED";
            }
        }
        else if (type == FieldType.option) {
            OptionFieldScheme scheme = (OptionFieldScheme) fieldScheme;
            if (!Boolean.TRUE.equals(scheme.getMultiple())) {
                dbType = "BIGINT UNSIGNED";
            }
        }
        else if (type == FieldType.dept) {
            DeptFieldScheme scheme = (DeptFieldScheme) fieldScheme;
            if (!Boolean.TRUE.equals(scheme.getMultiple())) {
                dbType = "BIGINT UNSIGNED";
            }
        }
        else if (type == FieldType.number) {
            NumberInputFieldScheme scheme = (NumberInputFieldScheme) fieldScheme;
            if (Integer.valueOf(0).equals(scheme.getPrecision())) {
                dbType = "BIGINT UNSIGNED";
            } else {
                dbType = "DECIMAL(65," + scheme.getPrecision() + ")";
            }
        }
        return dbType;
    }


    @Override
    @Transactional
    @CacheEvict(cacheNames = "modeling_view", allEntries = true)
    public void updateField(ModelingFieldUpdateParam param) {
        ModelingField originalField = getById(param.getId());
        if (originalField == null) {
            throw new VanException(400, "字段不存在");
        }



        ModelingField modelingField = new ModelingField();
        BeanCopierUtil.copy(param, modelingField);
        updateById(modelingField);

        // 宽度变化 更新表定义
        if (!param.getWidth().equals(modelingField.getWidth())) {

            // 查询引用此字段的 相关模型
            List<ModelingFieldRef> modelingFieldRefs = modelingFieldRefMapper.selectList(Wrappers.<ModelingFieldRef>lambdaQuery()
                    .eq(ModelingFieldRef::getFieldId, param.getId())
            );

            // 删除缓存
            for (ModelingFieldRef modelingFieldRef : modelingFieldRefs) {
                evictFieldsCache(originalField.getScope().toModelingModule(), modelingFieldRef.getMkey());
            }




            // 获取数据库类型
            String dbType = getDbType(param.getWidth(), originalField.getScheme());

            for (ModelingFieldRef modelingFieldRef : modelingFieldRefs) {
                ModelingModule module = modelingFieldRef.getModule();
                String mkey = modelingFieldRef.getMkey();
                if (module == ModelingModule.ENTITY) {
                    String tableName = ModelingEntity.buildEntityTableName(mkey);
                    // 字段label不允许修改 直接取数据库的即可
                    getBaseMapper().modifyColumn(tableName, originalField.getField(), dbType, originalField.getLabel());
                } else {
                    String tableName = WorkflowTypeDef.buildEntityTableName(mkey);
                    getBaseMapper().modifyColumn(tableName, originalField.getField(), dbType, originalField.getLabel());
                }
            }

        }

    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "modeling_view", allEntries = true)
    public void deleteField(String fieldId) {
        ModelingField modelingField = getById(fieldId);
        if (modelingField == null) {
            throw new VanException(400, "不存在的字段ID");
        }

        if (modelingField.getScope() == ModelingField.FieldScope.ENTITY_DEFAULT || modelingField.getScope() == FieldScope.WORKFLOW_DEFAULT) {
            throw new VanException(400, "禁止删除默认字段");
        }

        if (modelingField.getScope() == ModelingField.FieldScope.GLOBAL) {
            Long count = modelingFieldRefMapper.selectCount(Wrappers.<ModelingFieldRef>lambdaQuery().eq(ModelingFieldRef::getFieldId, fieldId));
            if (count > 0) {
                throw new VanException(400, "删除全局字段前请先解绑与其关联的流程");
            }
        }

        // TODO: 查询相关 视图排序规则 表单 等功能关联的字段 及 数据库表字段
        Long count = modelingViewColumnMapper.selectCount(Wrappers.<ModelingViewColumn>lambdaQuery().eq(ModelingViewColumn::getFieldId, fieldId));
        if (count > 0) {
            throw new VanException(400, "请先解绑视图中的字段");
        }


        // 最后删除字段
        removeById(fieldId);

        // 私有字段： 删除引用
        if (modelingField.getScope() == FieldScope.ENTITY_PRIVATE || modelingField.getScope() == FieldScope.WORKFLOW_PRIVATE) {
            // 私有字段不可能重复
            ModelingFieldRef modelingFieldRef = modelingFieldRefMapper.selectOne(Wrappers.<ModelingFieldRef>lambdaQuery().eq(ModelingFieldRef::getFieldId, fieldId));



            modelingFieldRefMapper.delete(Wrappers.<ModelingFieldRef>lambdaQuery().eq(ModelingFieldRef::getFieldId, fieldId));

            String tableName;
            if (FieldScope.ENTITY_PRIVATE == modelingField.getScope()) {
                tableName = ModelingEntity.buildEntityTableName(modelingFieldRef.getMkey());
            } else {
                tableName = WorkflowTypeDef.buildEntityTableName(modelingFieldRef.getMkey());
            }

            // 删除字段
            getBaseMapper().dropTableColumn(tableName, modelingField.getField());

            // 删除缓存
            evictFieldsCache(modelingField.getScope().toModelingModule(), modelingFieldRef.getMkey());
        }

    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "modeling_view", allEntries = true)
    public void refGlobalField(ModelingFieldRefParam param) {
        ModelingField modelingField = getById(param.getFieldId());
        if (modelingField == null) {
            throw new VanException(400, "不存在的字段");
        }
        ModelingFieldRef modelingFieldRef = new ModelingFieldRef();
        modelingFieldRef.setModule(param.getModule());
        modelingFieldRef.setFieldId(param.getFieldId());
        modelingFieldRef.setMkey(param.getMkey());
        modelingFieldRefMapper.insert(modelingFieldRef);
        // 新增字段

        String tableName;
        if (param.getModule() == ModelingModule.WORKFLOW) {
            tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
        } else {
            tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        }
        String dbType = getDbType(modelingField.getWidth(), modelingField.getScheme());

        getBaseMapper().addTableColumn(tableName, modelingField.getField(), dbType, modelingField.getField());

        // 删除缓存
        evictFieldsCache(param.getModule(), param.getMkey());
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "modeling_view", allEntries = true)
    public void unrefGlobalField(ModelingFieldRefParam param) {
        ModelingField modelingField = getById(param.getFieldId());
        if (modelingField == null) {
            throw new VanException(400, "不存在的字段");
        }

        modelingFieldRefMapper.unrefField(param);

        String tableName;
        if (param.getModule() == ModelingModule.WORKFLOW) {
            tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
        } else {
            tableName = ModelingEntity.buildEntityTableName(param.getMkey());
        }

        // 删除字段
        getBaseMapper().dropTableColumn(tableName, modelingField.getField());

        evictFieldsCache(param.getModule(), param.getMkey());
    }


    private void evictFieldsCache(ModelingModule module, String mkey) {
        Cache modelingFieldCache = cacheManager.getCache("modeling_field");
        if (modelingFieldCache != null) {
            modelingFieldCache.evictIfPresent(module.toString() + ":" + mkey);
        }
    }

}
