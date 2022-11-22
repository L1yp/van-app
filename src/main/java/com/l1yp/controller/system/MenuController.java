package com.l1yp.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.menu.MenuCreateParam;
import com.l1yp.model.param.system.menu.MenuUpdateParam;
import com.l1yp.model.view.system.MenuView;
import com.l1yp.service.system.IMenuService;
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

@Validated
@RestController
@RequestMapping("/menu")
@SaCheckLogin
public class MenuController {

    @Value("${app.mode}")
    private String mode;

    @Resource
    IMenuService service;

    @PostMapping("/add")
    public ResultData<Void> addMenu(@Validated @RequestBody MenuCreateParam param) {
        service.createMenu(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody MenuUpdateParam param) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.updateMenu(param);
        return ResultData.OK;
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") String id) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.deleteMenu(id);
        return ResultData.OK;
    }

    @GetMapping("/find")
    public ResultData<List<MenuView>> findMenu() {
        return ResultData.ok(service.findAllMenu());
    }


}
