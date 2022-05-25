package com.l1yp.controller;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysDept;
import com.l1yp.model.db.SysRole;
import com.l1yp.model.param.dept.DeptAddParam;
import com.l1yp.model.param.dept.DeptUpdateParam;
import com.l1yp.model.param.role.RoleAddParam;
import com.l1yp.model.param.role.RoleUpdateParam;
import com.l1yp.model.view.SysDeptView;
import com.l1yp.service.DeptService;
import com.l1yp.service.RoleService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/dept")
public class DeptController {

    @Resource
    DeptService service;

    @PostMapping("/add")
    public ResultData<Void> addDept(@Validated @RequestBody DeptAddParam param) {
        return service.addDept(param);
    }

    @PostMapping("/update")
    public ResultData<Void> updateDept(@Validated @RequestBody DeptUpdateParam param) {
        return service.updateDept(param);
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteDept(@PathVariable("id") Long id) {
        return service.delDept(id);
    }

    @DeleteMapping("/batch/{ids}")
    public ResultData<Void> deleteMenu(@PathVariable("ids") List<Long> ids) {
        return service.batchDelDept(ids);
    }

    @GetMapping("/find")
    public ResultData<List<SysDeptView>> findDept() {
        return ResultData.ok(service.findDept());
    }


    @GetMapping("/search")
    public ResultData<List<SysDept>> searchDeptView(@RequestParam String keyword) {
        return service.searchDept(keyword);
    }

}
