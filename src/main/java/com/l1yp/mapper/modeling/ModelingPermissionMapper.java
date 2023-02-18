package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingPermission;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import static com.baomidou.mybatisplus.core.toolkit.Constants.MYBATIS_PLUS;
import static com.baomidou.mybatisplus.core.toolkit.StringPool.UNDERSCORE;

public interface ModelingPermissionMapper extends BaseMapper<ModelingPermission> {


    @Select("SELECT * FROM modeling_permission WHERE role_id IN ( SELECT role_id FROM sys_user_role WHERE uid = #{uid}) AND module = #{module} AND mkey = #{mkey}")
    @ResultMap(MYBATIS_PLUS + UNDERSCORE + "ModelingPermission")
    List<ModelingPermission> getUserPermissionList(@Param("uid") String uid,
                                                   @Param("module") ModelingModule module,
                                                   @Param("mkey") String mkey);

}
