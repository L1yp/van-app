package com.l1yp.service;

import com.l1yp.mapper.SysDictInfoMapper;
import com.l1yp.mapper.SysDictValueMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysDictInfo;
import com.l1yp.model.db.SysDictValue;
import com.l1yp.model.param.dict.config.DictInfoAddParam;
import com.l1yp.model.param.dict.config.DictInfoUpdateParam;
import com.l1yp.model.param.dict.config.DictValueAddParam;
import com.l1yp.model.param.dict.config.DictValueUpdateParam;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 2022/2/21 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
@Service
public class DictService {

    @Resource
    SysDictInfoMapper sysDictInfoMapper;

    @Resource
    SysDictValueMapper sysDictValueMapper;


    public ResultData<List<SysDictInfo>> findDictInfoList() {
        List<SysDictInfo> dictInfos = sysDictInfoMapper.selectAll();
        return ResultData.ok(dictInfos);
    }

    public ResultData<Void> addSysDictInfo(DictInfoAddParam param) {
        SysDictInfo dictInfo = new SysDictInfo();
        BeanUtils.copyProperties(param, dictInfo);
        sysDictInfoMapper.insertSelective(dictInfo);
        return ResultData.OK;
    }

    public ResultData<Void> updateDictInfo(DictInfoUpdateParam param) {
        SysDictInfo dictInfo = new SysDictInfo();
        BeanUtils.copyProperties(param, dictInfo);
        sysDictInfoMapper.updateByPrimaryKeySelective(dictInfo);
        return ResultData.OK;
    }

    public ResultData<Void> deleteDictInfo(Long id) {
        SysDictInfo sysDictInfo = sysDictInfoMapper.selectByPrimaryKey(id);
        if (sysDictInfo == null) {
            return ResultData.err(400, "id参数有误");
        }
        sysDictInfoMapper.deleteByPrimaryKey(id);
        sysDictValueMapper.deleteByDictInfoIdent(sysDictInfo.getIdent());
        return ResultData.OK;
    }

    public ResultData<Void> batchDeleteDictInfo(List<Long> ids) {
        sysDictInfoMapper.batchDelete(ids);
        return ResultData.OK;
    }

    public ResultData<List<SysDictValue>> findDictValueList() {
        return ResultData.ok(sysDictValueMapper.selectAll());
    }

    public ResultData<List<SysDictValue>> findDictValueList(String scope, String ident) {
        return ResultData.ok(sysDictValueMapper.selectDictValuesByIdent(scope, ident));
    }

    public ResultData<Void> addSysDictValue(DictValueAddParam param) {
        SysDictValue dictValue = new SysDictValue();
        BeanUtils.copyProperties(param, dictValue);
        sysDictValueMapper.insertSelective(dictValue);
        return ResultData.OK;
    }

    public ResultData<Void> updateDictValue(DictValueUpdateParam param) {
        SysDictValue dictValue = new SysDictValue();
        BeanUtils.copyProperties(param, dictValue);
        sysDictValueMapper.updateByPrimaryKeySelective(dictValue);
        return ResultData.OK;
    }

    public ResultData<Void> deleteDictValue(Long id) {
        sysDictValueMapper.deleteByPrimaryKey(id);
        return ResultData.OK;
    }

    public ResultData<Void> batchDeleteDictValue(List<Long> ids) {
        sysDictValueMapper.batchDelete(ids);
        return ResultData.OK;
    }





}
