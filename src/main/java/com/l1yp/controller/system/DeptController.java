package com.l1yp.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.dept.DeptAddParam;
import com.l1yp.model.param.system.dept.DeptUpdateParam;
import com.l1yp.model.view.system.DepartmentView;
import com.l1yp.service.system.IDepartmentService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/dept")
@SaCheckLogin
public class DeptController {

    @Value("${app.mode}")
    private String mode;

    @Resource
    IDepartmentService service;

    @PostMapping("/add")
    public ResultData<Void> addDept(@Validated @RequestBody DeptAddParam param) {
        service.add(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> updateDept(@Validated @RequestBody DeptUpdateParam param) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.update(param);
        return ResultData.OK;
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteDept(@PathVariable("id") String id) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.delete(id);
        return ResultData.OK;
    }

    @DeleteMapping("/batch/{ids}")
    public ResultData<Void> deleteMenu(@PathVariable("ids") List<String> ids) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.deleteByIds(ids);
        return ResultData.OK;
    }

    @GetMapping("/find")
    public ResultData<List<DepartmentView>> findDept() {
        return ResultData.ok(service.findDept());
    }


}
