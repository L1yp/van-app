package com.l1yp.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.l1yp.conf.constants.process.ProcessConstants.ComponentType;
import com.l1yp.mapper.ProcessFieldDefinitionMapper;
import com.l1yp.mapper.ProcessModelMapper;
import com.l1yp.mapper.RoleProcessPermissionMapper;
import com.l1yp.mapper.SysDeptMapper;
import com.l1yp.mapper.SysRoleMapper;
import com.l1yp.mapper.UserMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.ProcessFieldDefinition;
import com.l1yp.model.db.RoleProcessPermissionModel;
import com.l1yp.model.db.SysDept;
import com.l1yp.model.db.SysRole;
import com.l1yp.model.db.SysUser;
import com.l1yp.model.expression.DepartmentScope;
import com.l1yp.model.expression.DeptFieldConfig;
import com.l1yp.model.expression.ExpressionContent;
import com.l1yp.model.expression.SubDeptConfig;
import com.l1yp.model.expression.UserFieldConfig;
import com.l1yp.model.param.role.RoleAddParam;
import com.l1yp.model.param.role.RoleMenuBindParam;
import com.l1yp.model.param.role.RolePermissionBindParam;
import com.l1yp.model.param.role.RoleUpdateParam;
import com.l1yp.model.view.SysDeptView;
import com.l1yp.model.view.SysUserView;
import com.l1yp.util.JsonTool;
import com.l1yp.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.*;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class RoleService {

    private static final Logger log = LoggerFactory.getLogger(RoleService.class);

    @Resource
    SysRoleMapper sysRoleMapper;

    @Resource
    SysDeptMapper sysDeptMapper;

    @Resource
    UserMapper userMapper;

    @Resource
    RoleProcessPermissionMapper roleProcessPermissionMapper;

    @Resource
    ProcessModelMapper processModelMapper;

    @Resource
    ProcessFieldDefinitionMapper processFieldDefinitionMapper;

    public void permissionPOC() {
        SysUser loginUser = RequestUtils.getLoginUser();
        List<Long> boundRoles = userMapper.findBoundRoles(loginUser.getId());
        List<RoleProcessPermissionModel> permissionExpressionList = roleProcessPermissionMapper.findPermissionsByRoles(boundRoles);

        List<SysDept> sysDepts = sysDeptMapper.selectAllId();
        List<SysDeptView> boundDept = userMapper.findBoundDept(loginUser.getId());
        List<Long> myDptIds = boundDept.stream().map(SysDeptView::getId).toList();
        List<SysDeptView> deptViews = sysDepts.stream().map(SysDept::convertToView).toList();
        Map<Long, SysDeptView> deptMap = deptViews.stream().collect(Collectors.toMap(SysDeptView::getId, it -> it));
        for (SysDeptView deptView : deptViews) {
            if (deptView.getPid() != null && deptView.getPid() > 0) {
                deptMap.get(deptView.getPid()).getChildren().add(deptView);
            }
        }

        for (RoleProcessPermissionModel item : permissionExpressionList) {
            String expression = item.getExpression();
            String processKey = item.getProcessKey();
            List<ProcessFieldDefinition> processFieldDefinitions = processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
            Map<Long, ProcessFieldDefinition> fieldIdMap = processFieldDefinitions.stream().collect(Collectors.toMap(ProcessFieldDefinition::getId, it -> it));

            List<ExpressionContent> contents = JsonTool.deserialize(expression, new TypeReference<List<ExpressionContent>>() {});
            if (CollectionUtils.isEmpty(contents)) {
                continue;
            }
            StringBuilder sb = new StringBuilder();
            List<Object> params = new ArrayList<>();
            for (ExpressionContent content : contents) {
                long fieldId = content.attrs.field_id;
                ProcessFieldDefinition processFieldDefinition = fieldIdMap.get(fieldId);
                if (content.type.equals("START")) {
                    sb.append("(");
                }
                else if (content.type.equals("END")) {
                    sb.append(")");
                }
                else if (content.type.equals("AND")) {
                    sb.append(" AND ");
                }
                else if (content.type.equals("OR")) {
                    sb.append(" OR ");
                }
                else if (content.type.equals("BLOCK")) {

                    if (processFieldDefinition.getComponentType() == ComponentType.MULTI_USER || processFieldDefinition.getComponentType() == ComponentType.SINGLE_USER) {
                        sb.append("(");
                        UserFieldConfig userFieldConfig = JsonTool.deserialize(content.attrs.val, UserFieldConfig.class);
                        if (userFieldConfig == null) {
                            log.warn("user config is null");
                            continue;
                        }

                        Set<Long> candidateUserIds = new HashSet<>();
                        if (!CollectionUtils.isEmpty(userFieldConfig.users)) {
                            candidateUserIds.addAll(userFieldConfig.users);
                        }

                        if (userFieldConfig.my_dept_scope == DepartmentScope.OWNER_USER_ID) {
                            candidateUserIds.add(loginUser.getId());
                        }



                        if (CollectionUtils.isEmpty(userFieldConfig.user_of_dept)) {
                            userFieldConfig.user_of_dept = new ArrayList<>();
                        }
                        if (DepartmentScope.isDepartmentScope(userFieldConfig.my_dept_scope)) {
                            for (Long myDptId : myDptIds) {
                                SubDeptConfig config = new SubDeptConfig();
                                config.scope = userFieldConfig.my_dept_scope;
                                config.dept = myDptId;
                                userFieldConfig.user_of_dept.add(config);
                            }
                        }
                        Set<Long> candidateDptIds = getScopeDept(userFieldConfig.user_of_dept, deptViews);

                        boolean empty = true;
                        if (!CollectionUtils.isEmpty(candidateUserIds)) {
                            if (processFieldDefinition.getComponentType() == ComponentType.MULTI_USER) {
                                sb.append("id IN (");
                                sb.append("SELECT wf_id FROM wf_field_user WHERE process_key = ? AND field_id = ? AND user_id IN ");
                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateUserIds.size()).forEach( it -> args.add("?"));
                                sb.append("(").append(String.join(",", args)).append(")");
                                sb.append(")");
                                params.add(processKey);
                                params.add(fieldId);
                                params.addAll(candidateUserIds);
                            }
                            else {
                                sb.append("`").append(processFieldDefinition.getName()).append("` IN ");
                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateUserIds.size()).forEach( it -> args.add("?"));
                                sb.append("(").append(String.join(",", args)).append(")");
                                params.addAll(candidateUserIds);
                            }
                            empty = false;
                        }

                        if (!CollectionUtils.isEmpty(candidateDptIds)) {
                            if (!empty) {
                                sb.append(" OR ");
                            }
                            if (processFieldDefinition.getComponentType() == ComponentType.MULTI_USER) {
                                // dept
                                sb.append("id IN ("); // start 1

                                sb.append(" SELECT wf_id FROM wf_field_user WHERE process_key = ? AND field_id = ? AND user_id IN ( SELECT uid FROM sys_user_dept WHERE dept_id IN");

                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateDptIds.size()).forEach( it -> args.add("?"));

                                sb.append("(").append(String.join(",", args)).append(")");

                                sb.append(" )");

                                sb.append(")"); // end 1
                                params.add(processKey);
                                params.add(fieldId);
                                params.addAll(candidateDptIds);
                            } else {
                                sb.append(" `").append(processFieldDefinition.getName()).append("` IN (");

                                sb.append(" SELECT uid FROM sys_user_dept WHERE dept_id IN ");
                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateDptIds.size()).forEach( it -> args.add("?"));
                                sb.append("(").append(String.join(",", args)).append(")");

                                sb.append(")");

                                params.addAll(candidateDptIds);
                            }
                        }

                        sb.append(")");

                    }
                    else if (processFieldDefinition.getComponentType() == ComponentType.MULTI_DEPT || processFieldDefinition.getComponentType() == ComponentType.SINGLE_DEPT) {
                        sb.append("(");
                        DeptFieldConfig deptFieldConfig = JsonTool.deserialize(content.attrs.val, DeptFieldConfig.class);
                        if (deptFieldConfig == null) {
                            log.warn("err expression val: {}", content.attrs.val);
                            continue;
                        }

                        if (CollectionUtils.isEmpty(deptFieldConfig.user_of_dept)) {
                            deptFieldConfig.user_of_dept = new ArrayList<>();
                        }

                        if (deptFieldConfig.my_dept_scope > 0) {
                            for (Long myDptId : myDptIds) {
                                SubDeptConfig config = new SubDeptConfig();
                                config.scope = deptFieldConfig.my_dept_scope;
                                config.dept = myDptId;
                                deptFieldConfig.user_of_dept.add(config);
                            }
                        }

                        Set<Long> candidateDptIds = getScopeDept(deptFieldConfig.user_of_dept, deptViews);

                        if (!CollectionUtils.isEmpty(candidateDptIds)) {
                            if (processFieldDefinition.getComponentType() == ComponentType.MULTI_USER) {
                                // dept
                                sb.append("id IN ("); // start 1

                                sb.append(" SELECT wf_id FROM wf_field_user WHERE process_key = ? AND field_id = ? AND user_id IN ( SELECT uid FROM sys_user_dept WHERE dept_id IN");

                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateDptIds.size()).forEach( it -> args.add("?"));

                                sb.append("(").append(String.join(",", args)).append(")");

                                sb.append(" )");

                                sb.append(")"); // end 1
                                params.add(processKey);
                                params.add(fieldId);
                                params.addAll(candidateDptIds);
                            } else {
                                sb.append(" `").append(processFieldDefinition.getName()).append("` IN (");

                                sb.append(" SELECT uid FROM sys_user_dept WHERE dept_id IN ");
                                List<String> args = new ArrayList<>();
                                IntStream.range(0, candidateDptIds.size()).forEach( it -> args.add("?"));
                                sb.append("(").append(String.join(",", args)).append(")");

                                sb.append(")");

                                params.addAll(candidateDptIds);
                            }
                        }

                        sb.append(")");
                    }
                    else if (processFieldDefinition.getComponentType() == ComponentType.MULTI_DICT || processFieldDefinition.getComponentType() == ComponentType.SINGLE_DICT) {
                        sb.append("(");




                        sb.append(")");
                    }

                }
            }
            String condition = sb.toString();
            System.out.println("condition: " + condition);
            System.out.println("params: " + params);
        }


    }

    private Set<Long> getScopeDept(List<SubDeptConfig> subDeptConfigs, List<SysDeptView> src) {
        Set<Long> dptIds = new HashSet<>();
        for (SubDeptConfig subDeptConfig : subDeptConfigs) {
            if (subDeptConfig.scope == 1) {
                dptIds.add(subDeptConfig.dept);
            } else if (subDeptConfig.scope == 2) {
                List<SysDeptView> list = src.stream().filter(it -> it.getId().equals(subDeptConfig.dept)).toList();
                List<Long> subChildrenDept = getSubChildrenDept(list);
                dptIds.addAll(subChildrenDept);
            } else if (subDeptConfig.scope == 3) {
                List<SysDeptView> list = src.stream().filter(it -> it.getId().equals(subDeptConfig.dept)).toList();
                List<Long> subChildrenDept = getSubChildrenDept(list);
                List<Long> excludeOwnerDptIds = subChildrenDept.stream().filter(it -> !it.equals(subDeptConfig.dept)).toList();
                dptIds.addAll(excludeOwnerDptIds);
            }
        }
        return dptIds;
    }

    private List<Long> getSubChildrenDept(List<SysDeptView> deptViews) {
        List<Long> list = new ArrayList<>();
        for (SysDeptView deptView : deptViews) {
            if (deptView.getHasChildren()) {
                List<Long> result = getSubChildrenDept(deptView.getChildren());
                list.addAll(result);
            } else {
                list.add(deptView.getId());
            }
        }
        return list;
    }



    @Transactional
    public ResultData<Void> bindMenu(RoleMenuBindParam param) {
        sysRoleMapper.deleteBoundMenu(param.getRoleId());
        sysRoleMapper.bindRoleMenu(param);
        return ResultData.OK;
    }

    public ResultData<List<Long>> menuBound(Long roleId) {
        List<Long> menuIds = sysRoleMapper.findMenuBound(roleId);
        return ResultData.ok(menuIds);
    }

    @Transactional
    public ResultData<Void> bindPermission(RolePermissionBindParam param) {
        sysRoleMapper.deleteBoundPermission(param.getRoleId());
        sysRoleMapper.bindRolePermission(param);
        return ResultData.OK;
    }

    public ResultData<List<Long>> permissionBound(Long roleId) {
        List<Long> menuIds = sysRoleMapper.findPermissionBound(roleId);
        return ResultData.ok(menuIds);
    }

    public ResultData<List<SysRole>> findRole() {
        List<SysRole> sysRoles = sysRoleMapper.selectAll();
        return ResultData.ok(sysRoles);
    }

    public ResultData<Void> addRole(RoleAddParam param) {
        SysRole role = new SysRole();
        BeanUtils.copyProperties(param, role);
        sysRoleMapper.insertSelective(role);
        return ResultData.OK;
    }

    public ResultData<Void> updateRole(RoleUpdateParam param) {
        SysRole role = new SysRole();
        BeanUtils.copyProperties(param, role);
        sysRoleMapper.updateByPrimaryKeySelective(role);
        return ResultData.OK;
    }

    public ResultData<Void> deleteRole(Long id) {
        sysRoleMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public ResultData<Void> batchDeleteRole(List<Long> ids) {
        sysRoleMapper.batchDeleteRole(ids);
        return ResultData.OK;
    }

}
