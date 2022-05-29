package com.l1yp.mapper;

import com.l1yp.model.db.SysUser;
import com.l1yp.model.param.user.UserListFindParam;
import com.l1yp.model.view.SysDeptView;
import com.l1yp.model.view.SysUserView;
import com.l1yp.util.SQLTool;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public interface UserMapper extends Mapper<SysUser> {

    @Select("SELECT id,username,nickname,phone,avatar,email FROM sys_user WHERE id = #{id} AND status = 0")
    SysUserView findSimpleInfoById(@Param("id") Long id);

    @Select("SELECT * FROM sys_user WHERE username = #{username} AND password = #{pwd}")
    SysUser login(@Param("username") String username, @Param("pwd") String pwd);


    @SelectProvider(type = Provider.class, method = "pageList")
    List<SysUserView> pageList(UserListFindParam param);

    @SelectProvider(type = Provider.class, method = "listByIdList")
    List<SysUserView> listByIdList(@Param("userIds") Collection<Long> userIds);

    @SelectProvider(type = Provider.class, method = "listByUsername")
    List<SysUserView> listByUsername(@Param("userNames") List<String> userNames);


    @Delete("DELETE FROM sys_user_role WHERE uid = #{uid}")
    int cancelBindRole(Long uid);

    @Delete("DELETE FROM sys_user_dept WHERE uid = #{uid} AND master = #{master}")
    int cancelBindDept(@Param("uid") Long uid, @Param("master") Integer master);

    @InsertProvider(type = Provider.class, method = "bindDept")
    int bindPartTimeDept(@Param("uid") Long uid,
                 @Param("deptIds")List<Long> deptIds);

    @Insert("INSERT INTO sys_user_dept(uid, dept_id, master) VALUES(#{uid}, #{primaryDeptId}, 1)")
    int bindPrimaryDept(@Param("uid") Long uid, @Param("primaryDeptId") Long primaryDeptId);

    @InsertProvider(type = Provider.class, method = "bindRole")
    int bindRole(@Param("uid") Long uid,
                 @Param("roleIds")List<Long> roleIds);

    @Select("SELECT dept_id FROM sys_user_dept  WHERE uid = #{uid} AND master = 1")
    Long findMasterDeptId(Long uid);

    @Select("SELECT dept_id FROM sys_user_dept  WHERE uid = #{uid} AND master = 0")
    List<Long> findBoundPartTimeDeptId(Long uid);

    @Select("SELECT * FROM sys_dept WHERE id IN ( SELECT dept_id FROM sys_user_dept WHERE uid = #{uid} )")
    List<SysDeptView> findBoundDept(Long uid);

    @Select("SELECT role_id FROM sys_user_role WHERE uid = #{uid}")
    List<Long> findBoundRoles(Long uid);

    @Select("SELECT DISTINCT sp.ident \n" +
            "FROM sys_user_role ur \n" +
            "LEFT JOIN sys_role_permission rp ON ur.role_id = rp.ROLE_ID \n" +
            "LEFT JOIN sys_permission sp on rp.permission_id = sp.id WHERE ur.uid = 1")
    List<String> permissions(Long uid);


    class Provider {

        public String bindRole(Long uid, List<Long> roleIds) {
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO sys_user_role(uid, role_id) VALUES");

            if (!CollectionUtils.isEmpty(roleIds)) {
                String str = roleIds.stream().map(it -> String.format("(%d, %d)", uid, it)).collect(Collectors.joining(",", "", ""));
                sb.append(str);
            }
            return sb.toString();
        }

        public String bindDept(Long uid, List<Long> deptIds) {
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO sys_user_dept(uid, dept_id, master) VALUES");
            if (!CollectionUtils.isEmpty(deptIds)) {
                String str = deptIds.stream().map(it -> String.format("(%d, %d, 0)", uid, it)).collect(Collectors.joining(",", "", ""));
                sb.append(str);
            }
            return sb.toString();
        }

        public String listByIdList(Collection<Long> userIds) {
            if (CollectionUtils.isEmpty(userIds)) {
                return null;
            }
            return userIds.stream().map(String::valueOf).collect(Collectors.joining(",", "SELECT id,username,nickname,phone,email,avatar,register_ip,status,update_by FROM sys_user WHERE id IN (", ")"));
        }

        public String listByUsername(List<String> userNames) {
            if (CollectionUtils.isEmpty(userNames)) {
                return null;
            }

            return IntStream.range(0, userNames.size())
                            .mapToObj(it -> "#{userNames[" + it + "]}")
                            .collect(Collectors.joining(",",
                                    "SELECT id,username,nickname,phone,email,avatar,register_ip,status,update_by FROM sys_user WHERE username IN (",
                                    ")"));

        }

        public String pageList(UserListFindParam param) {
            StringBuilder sb = new StringBuilder(128);
            sb.append("SELECT id,username,nickname,phone,email,avatar,register_ip,status,update_by FROM sys_user WHERE 1=1 ");
            if (param.getStatus() != null) {
                sb.append(" AND status = ").append(param.getStatus());
            }

            if (StringUtils.hasText(param.getUsername()) ||
                StringUtils.hasText(param.getNickname()) ||
                StringUtils.hasText(param.getPhone()) ||
                StringUtils.hasText(param.getEmail()) ||
                StringUtils.hasText(param.getUpdateBy())
            ) {
                sb.append("AND ( 1 != 1 ");
                if (StringUtils.hasText(param.getUsername())) {
                    sb.append(" OR username LIKE '%");
                    sb.append(SQLTool.escapeSql(param.getUsername()));
                    sb.append("%'");
                }

                if (StringUtils.hasText(param.getNickname())) {
                    sb.append(" OR nickname LIKE '%");
                    sb.append(SQLTool.escapeSql(param.getNickname()));
                    sb.append("%'");
                }

                if (StringUtils.hasText(param.getPhone())) {
                    sb.append(" OR phone LIKE '%");
                    sb.append(SQLTool.escapeSql(param.getPhone()));
                    sb.append("%'");
                }

                if (StringUtils.hasText(param.getEmail())) {
                    sb.append(" OR email LIKE '%");
                    sb.append(SQLTool.escapeSql(param.getEmail()));
                    sb.append("%'");
                }

                if (StringUtils.hasText(param.getUpdateBy())) {
                    sb.append(" OR update_by LIKE '%");
                    sb.append(SQLTool.escapeSql(param.getUpdateBy()));
                    sb.append("%'");
                }
                sb.append(")");
            }
            sb.append(" LIMIT ").append(param.getOffset()).append(",").append(param.getPageSize());
            return sb.toString();

        }
    }

}
