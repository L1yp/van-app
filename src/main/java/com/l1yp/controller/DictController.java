package com.l1yp.controller;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysDictInfo;
import com.l1yp.model.db.SysDictValue;
import com.l1yp.model.param.dict.config.DictInfoAddParam;
import com.l1yp.model.param.dict.config.DictInfoUpdateParam;
import com.l1yp.model.param.dict.config.DictValueAddParam;
import com.l1yp.model.param.dict.config.DictValueUpdateParam;
import com.l1yp.service.DictService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 2022/2/21 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
@RestController
@RequestMapping("/dict")
public class DictController {

    @Resource
    DictService service;


    @GetMapping("/info/list")
    public ResultData<List<SysDictInfo>> findDictInfoList() {
        return service.findDictInfoList();
    }


    @PostMapping("/info/add")
    public ResultData<Void> addDictInfo(@Validated @RequestBody DictInfoAddParam param) {
        return service.addSysDictInfo(param);
    }

    @PostMapping("/info/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody DictInfoUpdateParam param) {
        return service.updateDictInfo(param);
    }

    @DeleteMapping("/info/{id}")
    public ResultData<Void> deleteDictInfo(@PathVariable("id") Long id) {
        return service.deleteDictInfo(id);
    }

    @DeleteMapping("/info/batch/{ids}")
    public ResultData<Void> deleteDictInfo(@PathVariable("ids") List<Long> ids) {
        return service.batchDeleteDictInfo(ids);
    }

    @GetMapping("/value/list/{scope}/{ident}")
    public ResultData<List<SysDictValue>> findDictValues(@PathVariable(name = "scope") String scope,
                                                         @PathVariable(name = "ident") String ident) {
        return service.findDictValueList(scope, ident);
    }

    @GetMapping("/value/list")
    public ResultData<List<SysDictValue>> findDictValues() {
        return service.findDictValueList();
    }


    @PostMapping("/value/add")
    public ResultData<Void> addDictValue(@Validated @RequestBody DictValueAddParam param) {
        return service.addSysDictValue(param);
    }

    @PostMapping("/value/update")
    public ResultData<Void> updateDictValue(@Validated @RequestBody DictValueUpdateParam param) {
        return service.updateDictValue(param);
    }

    @DeleteMapping("/value/{id}")
    public ResultData<Void> deleteDictValue(@PathVariable("id") Long id) {
        return service.deleteDictValue(id);
    }

    @DeleteMapping("/value/batch/{ids}")
    public ResultData<Void> deleteDictValue(@PathVariable("ids") List<Long> ids) {
        return service.batchDeleteDictValue(ids);
    }




}
