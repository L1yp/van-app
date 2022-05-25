package com.l1yp.controller;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.menu.MenuAddParam;
import com.l1yp.model.param.menu.MenuUpdateParam;
import com.l1yp.model.view.SysMenuView;
import com.l1yp.service.MenuService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Validated
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Resource
    MenuService service;

    @PostMapping("/add")
    public ResultData<Void> addMenu(@Validated @RequestBody MenuAddParam param) {
        return service.addMenu(param);
    }

    @PostMapping("/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody MenuUpdateParam param) {
        return service.updateMenu(param);
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") Long id) {
        return service.deleteMenu(id);
    }

    @GetMapping("/find")
    public ResultData<List<SysMenuView>> findMenu() {
        return ResultData.ok(service.findMenu());
    }


}
