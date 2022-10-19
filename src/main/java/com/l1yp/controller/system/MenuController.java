package com.l1yp.controller.system;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.menu.MenuCreateParam;
import com.l1yp.model.param.system.menu.MenuUpdateParam;
import com.l1yp.model.view.system.MenuView;
import com.l1yp.service.system.IMenuService;
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
public class MenuController {

    @Resource
    IMenuService service;

    @PostMapping("/add")
    public ResultData<Void> addMenu(@Validated @RequestBody MenuCreateParam param) {
        service.createMenu(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody MenuUpdateParam param) {
        service.updateMenu(param);
        return ResultData.OK;
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") Long id) {
        service.deleteMenu(id);
        return ResultData.OK;
    }

    @GetMapping("/find")
    public ResultData<List<MenuView>> findMenu() {
        return ResultData.ok(service.findAllMenu());
    }


}
