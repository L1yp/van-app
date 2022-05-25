package com.l1yp.service;

import com.l1yp.mapper.SysDeptMapper;
import com.l1yp.mapper.UserMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysDept;
import com.l1yp.model.param.dept.DeptAddParam;
import com.l1yp.model.param.dept.DeptUpdateParam;
import com.l1yp.model.view.SysDeptView;
import com.l1yp.model.view.SysUserView;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 2022/2/19 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
@Service
public class DeptService {

    @Resource
    SysDeptMapper sysDeptMapper;

    public ResultData<Void> addDept(DeptAddParam param) {
        SysDept dept = new SysDept();
        BeanUtils.copyProperties(param, dept);
        sysDeptMapper.insertSelective(dept);
        return ResultData.OK;
    }

    public ResultData<Void> updateDept(DeptUpdateParam param) {
        SysDept dept = new SysDept();
        BeanUtils.copyProperties(param, dept);
        sysDeptMapper.updateByPrimaryKeySelective(dept);
        return ResultData.OK;
    }

    public ResultData<Void> delDept(Long id) {
        sysDeptMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public ResultData<Void> batchDelDept(List<Long> ids) {
        sysDeptMapper.batchDeleteDept(ids);
        return ResultData.OK;
    }

    @Resource
    UserMapper userMapper;

    public List<SysDeptView> findDept() {

        List<SysDept> sysDepts = sysDeptMapper.selectAll();
        if (CollectionUtils.isEmpty(sysDepts)) {
            return Collections.emptyList();
        }

        List<Long> ownerIds = sysDepts.stream().filter(sysDept -> sysDept.getOwner() > 0).map(SysDept::getOwner).toList();
        Map<Long, SysUserView> map = new HashMap<>();
        if (!CollectionUtils.isEmpty(ownerIds)) {
            List<SysUserView> sysUserViews = userMapper.listByIdList(ownerIds);
            map = sysUserViews.stream().collect(Collectors.toMap(SysUserView::getId, it -> it));
        }

        List<SysDeptView> result = sysDepts.stream().map(SysDept::convertToView).toList();

        Map<Long, SysDeptView> menuViewMap = result.stream().collect(Collectors.toMap(SysDeptView::getId, it -> it));
        for (SysDeptView sysDeptView : result) {
            if (sysDeptView.getPid() > 0 && menuViewMap.containsKey(sysDeptView.getPid())) {
                SysDeptView parentDept = menuViewMap.get(sysDeptView.getPid());
                parentDept.getChildren().add(sysDeptView);
            }

            if (sysDeptView.getOwner() > 0) {
                sysDeptView.setOwnerInfo(map.get(sysDeptView.getOwner()));
            }

        }

        return result.stream().filter(it -> it.getPid() == 0L).toList();
    }


    public ResultData<List<SysDept>> searchDept(String keyword) {
        return ResultData.ok(sysDeptMapper.search(keyword));
    }

}
