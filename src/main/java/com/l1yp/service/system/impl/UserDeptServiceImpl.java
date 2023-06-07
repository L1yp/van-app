package com.l1yp.service.system.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.system.UserDeptMapper;
import com.l1yp.model.db.system.UserDept;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class UserDeptServiceImpl extends ServiceImpl<UserDeptMapper, UserDept> {

    @Cacheable(cacheNames = "user_dept", key = "'id:' + #p0", unless = "#result.size() == 0")
    public List<String> getDeptIdListByUid(String uid) {
        List<String> deptIdList = getBaseMapper().getDeptIdListByUid(uid);
        return new ArrayList<>(new HashSet<>(deptIdList));
    }


}
