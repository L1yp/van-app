package com.l1yp.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.system.UserRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper extends BaseMapper<UserRole> {
    @Delete("DELETE FROM sys_user_role WHERE uid = #{uid}")
    int deleteByUid(@Param("uid") String uid);

}
