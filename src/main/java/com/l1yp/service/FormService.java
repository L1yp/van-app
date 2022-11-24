package com.l1yp.service;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.modeling.ModelingEntityMapper;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.field.DeptFieldScheme;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.modeling.field.OptionFieldScheme;
import com.l1yp.model.db.modeling.field.UserFieldScheme;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.CodeGenRule;
import com.l1yp.model.param.workflow.CodeGenRule.ClassGenRule;
import com.l1yp.model.param.workflow.CodeGenRule.FixedGenRule;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import com.l1yp.util.RequestUtils;
import com.l1yp.workflow.base.IGenCodeProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class FormService {

    private static final Logger log = LoggerFactory.getLogger(FormService.class);

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Resource
    ModelingEntityMapper modelingEntityMapper;

    private static final List<String> excludeInputFieldList = Arrays.asList("create_by", "create_time", "update_by", "update_time");
    private static final Set<String> excludeInputFields = new HashSet<>(excludeInputFieldList);

    private static final Set<FieldType> refFieldTypes = new HashSet<>(Arrays.asList(FieldType.user, FieldType.option, FieldType.dept, FieldType.entity, FieldType.workflow));

    @Transactional(propagation = Propagation.REQUIRED)
    public void createInstance(@NotNull ModelingModule module, String mkey, Map<String, Object> data) {
        String tableName = module.getTableName(mkey);
        String loginUserId = RequestUtils.getLoginUserId();

        String code = null;
        if (module == ModelingModule.WORKFLOW) {
            code = genCode(module, mkey, data);
        }

        String instanceId = IdWorker.getIdStr();


        List<ModelingField> modelFields = modelingFieldService.findModelFields(module, mkey);
        if (CollectionUtils.isEmpty(modelFields)) {
            throw new VanException(400, "标识有误，查询不到字段信息");
        }
        Map<String, ModelingField> fieldMap = modelFields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));

        // 获取非法字段列表
        List<String> excludeKeys = data.keySet().stream().filter(it -> it.equals("id") || !fieldMap.containsKey(it) || excludeInputFields.contains(it)).toList();

        // 过滤出有效的字段数据
        Map<String, Object> formData = data.entrySet().stream().filter(it -> !excludeKeys.contains(it.getKey())).collect(Collectors.toMap(Entry::getKey, Entry::getValue));
        List<String> columnFields = new ArrayList<>(formData.keySet());

        // 添加内置字段
        columnFields.add("id");
        if (module == ModelingModule.WORKFLOW) {
            columnFields.add("code");
        }
        columnFields.addAll(excludeInputFieldList);


        String insertFields = IntStream.range(0, columnFields.size()).boxed().map(i -> String.format("`%s`", columnFields.get(i))).collect(Collectors.joining(","));
        String insertValues = IntStream.range(0, columnFields.size()).boxed().map(i -> String.format("#{args[%d]}", i)).collect(Collectors.joining(","));


        List<Object> args = new ArrayList<>();
        columnFields.stream().filter(formData::containsKey).map(formData::get).forEach(args::add);
        args.add(instanceId);
        if (module == ModelingModule.WORKFLOW) {
            args.add(code);
        }
        args.add(loginUserId); // create_by
        Date now = new Date();
        args.add(now); // create_time
        args.add(loginUserId); // update_by
        args.add(now); // update_time


        String sql = String.format("INSERT INTO %s(%s) VALUES(%s)", tableName, insertFields, insertValues);
        modelingEntityMapper.executeSQL(sql, args);

        insertRefFields(instanceId, getFieldRefTableName(tableName), formData, fieldMap);

        data.put("id", instanceId);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateInstance(@NotNull ModelingModule module, String mkey, Map<String, Object> data) {
        String tableName = module.getTableName(mkey);
        String loginUserId = RequestUtils.getLoginUserId();

        String instanceId = (String) data.get("id");
        if (StringUtils.isBlank(instanceId)) {
            throw new VanException(400, "缺少ID字段");
        }

        List<ModelingField> modelFields = modelingFieldService.findModelFields(module, mkey);
        if (CollectionUtils.isEmpty(modelFields)) {
            throw new VanException(400, "标识有误，查询不到字段信息");
        }
        Map<String, ModelingField> fieldMap = modelFields.stream().collect(Collectors.toMap(ModelingField::getField, it -> it));

        // 获取非法字段列表
        List<String> excludeKeys = data.keySet().stream().filter(it -> it.equals("id") || !fieldMap.containsKey(it) || excludeInputFields.contains(it)).toList();

        // 过滤出有效的字段数据
        Map<String, Object> formData = data.entrySet().stream().filter(it -> !excludeKeys.contains(it.getKey())).collect(Collectors.toMap(Entry::getKey, Entry::getValue));
        List<String> columnFields = new ArrayList<>(formData.keySet());

        // get ref fields
        List<String> refFields = columnFields.stream().map(fieldMap::get)
                .filter(it -> refFieldTypes.contains(it.getType()) && Boolean.TRUE.equals(it.getScheme().getMultiple()))
                .map(ModelingField::getField)
                .toList();

        columnFields.add("update_by");
        columnFields.add("update_time");

        String updateFields = IntStream.range(0, columnFields.size()).boxed().map(i -> String.format("`%s` = #{args[%d]}", columnFields.get(i), i)).collect(Collectors.joining(","));


        List<Object> args = new ArrayList<>();
        columnFields.stream().filter(formData::containsKey).map(formData::get).forEach(args::add);
        args.add(loginUserId); // update_by
        args.add(new Date()); // update_time
        args.add(instanceId);

        String sql = String.format("UPDATE %s SET %s WHERE id = #{args[%d]}", tableName, updateFields, args.size() - 1);
        modelingEntityMapper.executeSQL(sql, args);

        // update ref fields
        deleteInstanceFieldRef(getFieldRefTableName(tableName), instanceId, refFields);
        insertRefFields(instanceId, getFieldRefTableName(tableName), formData, fieldMap);

    }

    public void updateProcessInstanceId(String mkey, String id, String processInstanceId) {
        String tableName = WorkflowTypeDef.buildEntityTableName(mkey);
        modelingEntityMapper.executeSQL(String.format("UPDATE %s SET process_instance_id = #{args[0]} WHERE id = #{args[1]}", tableName), Arrays.asList(processInstanceId, id));
    }


    private void insertRefFields(String instanceId, String refTableName, Map<String, Object> formData, Map<String, ModelingField> fieldMap) {
        List<Pair<String, String>> pairs = new ArrayList<>();
        Set<String> columnFields = formData.keySet();
        for (String field : columnFields) {
            Object value = formData.get(field);
            ModelingField modelingField = fieldMap.get(field);
            FieldType type = modelingField.getType();
            if (!refFieldTypes.contains(type)) {
                continue;
            }

            collectRefFields(pairs, field, value, modelingField.getScheme().getMultiple());
        }

        List<Object> args = new ArrayList<>();
        String sql = IntStream.range(0, pairs.size()).boxed()
                .map(it -> String.format("(#{args[%d]}, #{args[%d]}, #{args[%d]}, #{args[%d]})", it * 4, it * 4 + 1, it * 4 + 2, it * 4 + 3))
                .collect(Collectors.joining(",", String.format("INSERT INTO %s(id, instance_id, field, value) VALUES ", refTableName), ""));

        for (Pair<String, String> pair : pairs) {
            String field = pair.getFirst();
            String value = pair.getSecond();
            args.add(IdWorker.getIdStr());
            args.add(instanceId);
            args.add(field);
            args.add(value);
        }

        if (log.isDebugEnabled()) {
            log.debug("insertRefFields sql: {}, args: {}", sql, args);
        }

        modelingEntityMapper.executeSQL(sql, args);


    }

    private void deleteInstanceFieldRef(String refTableName, String instanceId, Collection<String> fieldList) {
        List<Object> args = new ArrayList<>(fieldList);
        String fields = IntStream.range(0, fieldList.size()).boxed().map(it -> String.format("#{args[%d]}", it)).collect(Collectors.joining(",", "(", ")"));
        String sql = String.format("DELETE FROM %s WHERE field IN %s AND instance_id = #{args[%d]} ", refTableName, fields, args.size());
        args.add(instanceId);


        if (log.isDebugEnabled()) {
            log.debug("deleteInstanceFieldRef sql: {}, args: {}", sql, args);
        }

        modelingEntityMapper.executeSQL(sql, args);


    }

    private void collectRefFields(List<Pair<String, String>> pairs, String field, Object value, boolean multiple) {
        String str = (String) value;
        if (multiple) {
            if (str.contains(",")) {
                String[] userIds = str.split(",");
                Arrays.stream(userIds).map(it -> Pair.of(field, it)).forEach(pairs::add);
            } else {
                pairs.add(Pair.of(field, str));
            }

        }
        // only save multiple field
    }

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    private String genCode(ModelingModule module, String mkey, Map<String, Object> params) {
        WorkflowTypeDef workflowTypeDef = workflowTypeDefService.getWorkflowTypeDefByKey(mkey);
        if (workflowTypeDef == null) {
            throw new VanException(400, "标识有误，找不到模型定义");
        }
        CodeGenRule codeGenRule = workflowTypeDef.getCodeGenRule();
        String type = codeGenRule.getType();
        if (type.equals("class")) {
            ClassGenRule classGenRule = (ClassGenRule) codeGenRule;
            String className = classGenRule.getClassName();
            try {
                Class<?> clazz = Class.forName(className);
                IGenCodeProvider instance = (IGenCodeProvider) clazz.getConstructor().newInstance();
                return instance.generator(workflowTypeDef, params);
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        } else if (type.equals("fixed")) {
            FixedGenRule fixedGenRule = (FixedGenRule) codeGenRule;
            String delimiter = "";
            if (StringUtils.isNotBlank(fixedGenRule.getDelimiter())) {
                delimiter = fixedGenRule.getDelimiter();
            }
            String joiner = "";
            if (StringUtils.isNotBlank(fixedGenRule.getJoiner())) {
                joiner = fixedGenRule.getJoiner();
            }
            Integer numFormat = fixedGenRule.getNumFormat();

            SimpleDateFormat df = new SimpleDateFormat(fixedGenRule.getDateFormat());
            String date = df.format(new Date());
            String maxCode = workflowTypeDefService.getBaseMapper().getInstanceMaxCode(
                    WorkflowTypeDef.buildEntityTableName(mkey),
                    fixedGenRule.getPrefix(),
                    delimiter,
                    date,
                    joiner
            );
            String newCode = null;
            if (maxCode != null) {
                String codeNo = maxCode.substring(maxCode.length() - numFormat);
                String codePrefix = maxCode.substring(0, maxCode.length() - numFormat);
                newCode = String.format("%s%0" + numFormat + "d", codePrefix, (Integer.parseInt(codeNo) + 1));
            } else {
                newCode = fixedGenRule.getPrefix() + delimiter + date + joiner + "0".repeat(numFormat - 1) + "1";
            }
            return newCode;
        }
        return null;
    }

    public String getFieldRefTableName(String tableName) {
        return tableName + "_ref";
    }

}
