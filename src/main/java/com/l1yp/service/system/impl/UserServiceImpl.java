package com.l1yp.service.system.impl;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.system.UserMapper;
import com.l1yp.mapper.system.UserRoleMapper;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.system.Department;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.system.UserDept;
import com.l1yp.model.db.system.UserRole;
import com.l1yp.model.param.system.user.UserLoginParam.UserBindRoleParam;
import com.l1yp.model.param.system.user.UserUpdateParam;
import com.l1yp.model.param.system.user.UserListFindParam;
import com.l1yp.model.view.LoginResult;
import com.l1yp.model.view.LoginResult.UserInfo;
import com.l1yp.model.view.system.DepartmentView;
import com.l1yp.model.view.system.MenuView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.system.IDepartmentService;
import com.l1yp.service.system.IMenuService;
import com.l1yp.service.system.IUserService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.PinyinUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Resource
    IMenuService menuService;

    @Resource
    DepartmentServiceImpl departmentService;

    @Resource
    UserDeptServiceImpl userDeptService;

    @Resource
    UserRoleServiceImpl userRoleService;

    @Override
    public LoginResult login(String uid, String pwd) {

        User user = getBaseMapper().selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, uid).eq(User::getPassword, pwd));
        if (user == null) {
            throw new VanException(400, "帐号或密码错误");
        }

        StpUtil.login(user.getId());
        RequestUtils.putLoginUser(user);

        return requestLoginState();
    }

    @Override
    public LoginResult requestLoginState() {
        var user = RequestUtils.getLoginUser();
        if (user == null) {
            throw new VanException(401, "请先登录");
        }
        var userInfo = new UserInfo();
        BeanCopierUtil.copy(user, userInfo);

        List<MenuView> userMenu = menuService.findUserMenu();
        var result = new LoginResult();
        result.setUserInfo(userInfo);
        result.setMenus(userMenu);
        SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
        result.setToken(tokenInfo.getTokenValue());
        return result;
    }


    @Override
    public PageData<UserView> pageUserList(UserListFindParam param) {
        PageData<UserView> pageData = new PageData<>();
        PageHelper.startPage(param.getPageIdx(), param.getPageSize());
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery();
        if (StringUtils.isNotBlank(param.getUsername())) {
            wrapper.like(User::getUsername, param.getUsername());
        }
        if (StringUtils.isNotBlank(param.getNickname())) {
            wrapper.like(User::getNickname, param.getNickname());
        }
        if (StringUtils.isNotBlank(param.getPhone())) {
            wrapper.like(User::getPhone, param.getPhone());
        }
        if (StringUtils.isNotBlank(param.getEmail())) {
            wrapper.like(User::getEmail, param.getEmail());
        }
        if (StringUtils.isNotBlank(param.getDeptId())) {
            wrapper.eq(User::getDeptId, param.getDeptId());
        }
        if (param.getStatus() != null) {
            wrapper.eq(User::getStatus, param.getStatus());
        }

        List<User> users = getBaseMapper().selectList(wrapper);
        pageData.initPage(users);

        List<UserView> userViews = users.stream().map(User::toView).toList();

        Set<String> deptIds = userViews.stream().map(UserView::getDeptId).filter(Objects::nonNull).collect(Collectors.toSet());
        Map<String, Object> additional = new HashMap<>();
        pageData.setAdditional(additional);
        if (!CollectionUtils.isEmpty(deptIds)) {
            List<Department> departments = departmentService.listByIds(deptIds);
            List<DepartmentView> departmentViews = departments.stream().map(Department::toView).toList();
            Map<String, DepartmentView> deptMap = departmentViews.stream().collect(Collectors.toMap(DepartmentView::getId, it -> it));
            additional.put("dept", deptMap);
        }

        pageData.setData(userViews);
        return pageData;
    }

    @Override
    public List<UserView> searchUserList(String key) {
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery();
        if (StringUtils.isNotBlank(key)) {
            wrapper.like(User::getUsername, key).or();
            wrapper.like(User::getNickname, key).or();
            wrapper.like(User::getPhone, key).or();
            wrapper.like(User::getEmail, key).or();
            if (PinyinUtil.isPureLetter(key)) {
                wrapper.like(User::getNicknamePinyin, String.join("%", key.toLowerCase(Locale.ROOT).split("")));
            }
        }

        List<User> users = getBaseMapper().selectList(wrapper);
        return users.stream().map(User::toView).toList();
    }

    @Override
    @Transactional
    public void update(UserUpdateParam param) {
        User nowUser = getById(param.getId());
        if (nowUser == null) {
            throw new VanException(400, "用户ID不存在");
        }

        User user = new User();
        BeanCopierUtil.copy(param, user);
        if (StringUtils.isNotBlank(param.getNickname()) && !nowUser.getNickname().equals(param.getNickname())) {
            String pinyin = PinyinUtil.getPinyin(param.getNickname());
            user.setNicknamePinyin(pinyin);
        }

        updateById(user);

        userDeptService.getBaseMapper().delete(Wrappers.<UserDept>lambdaQuery().eq(UserDept::getUid, param.getId()));
        if (!CollectionUtils.isEmpty(param.getPtDeptIds())) {
            List<UserDept> userDeptList = new ArrayList<>();
            for (String ptDeptId : param.getPtDeptIds()) {
                UserDept userDept = new UserDept();
                userDept.setUid(param.getId());
                userDept.setDeptId(ptDeptId);
                userDeptList.add(userDept);
            }

            userDeptService.saveBatch(userDeptList);
        }

        userRoleService.getBaseMapper().deleteByUid(param.getId());
        if (!CollectionUtils.isEmpty(param.getRoleIds())) {
            List<UserRole> userRoles = new ArrayList<>();
            for (String roleId : param.getRoleIds()) {
                UserRole userRole = new UserRole();
                userRole.setUid(param.getId());
                userRole.setRoleId(roleId);
                userRoles.add(userRole);
            }
            userRoleService.saveBatch(userRoles);
        }

    }

    @Override
    @Transactional
    public void bindRole(UserBindRoleParam param) {
        userRoleService.getBaseMapper().deleteByUid(param.getUid());
        List<UserRole> userRoles = new ArrayList<>();
        for (String roleId : param.getRoleIds()) {
            UserRole userRole = new UserRole();
            userRole.setUid(param.getUid());
            userRole.setRoleId(roleId);
            userRoles.add(userRole);
        }
        userRoleService.saveBatch(userRoles);
    }

    @Override
    public List<String> findPartTimeDept() {
        User loginUser = RequestUtils.getLoginUser();
        List<UserDept> userDeptList = userDeptService.getBaseMapper().selectList(Wrappers.<UserDept>lambdaQuery().eq(UserDept::getUid, loginUser.getId()));
        return userDeptList.stream().map(UserDept::getDeptId).toList();
    }

    @Override
    public List<String> findRoles(String uid) {
        List<UserRole> userRoles = userRoleService.getBaseMapper().selectList(Wrappers.<UserRole>lambdaQuery().eq(UserRole::getUid, uid));
        return userRoles.stream().map(UserRole::getRoleId).toList();
    }

    @Override
    public List<UserView> listUserViewByIdList(List<String> idList) {
        List<User> users = listByIds(idList);
        return users.stream().map(User::toView).toList();
    }
}
