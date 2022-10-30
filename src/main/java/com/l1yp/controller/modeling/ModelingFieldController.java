package com.l1yp.controller.modeling;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.modeling.TableScheme;
import com.l1yp.model.param.modeling.field.ModelingFieldAddParam;
import com.l1yp.model.param.modeling.field.ModelingFieldUpdateParam;
import com.l1yp.model.param.modeling.field.ModelingFieldFindParam;
import com.l1yp.model.param.modeling.field.ModelingFieldRefParam;
import com.l1yp.model.view.modeling.ModelingFieldDefView;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
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
@RequestMapping("/modeling/field")
public class ModelingFieldController {

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @GetMapping("/find")
    public ResultData<List<ModelingFieldDefView>> findFields(ModelingFieldFindParam param) {
        return ResultData.ok(modelingFieldService.findFields(param));
    }

    /**
     * 新增字段
     */
    @PostMapping("/add")
    public ResultData<Void> addField(@Validated @RequestBody ModelingFieldAddParam param) {
        modelingFieldService.addField(param);
        return ResultData.OK;
    }

    /**
     * 更新字段
     */
    @PostMapping("/update")
    public ResultData<Void> updateField(@Validated @RequestBody ModelingFieldUpdateParam param) {
        modelingFieldService.updateField(param);
        return ResultData.OK;
    }

    /**
     * 引用全局字段
     */
    @PostMapping("/ref")
    public ResultData<Void> refField(@Validated @RequestBody ModelingFieldRefParam param) {
        modelingFieldService.refGlobalField(param);
        return ResultData.OK;
    }

    /**
     * 取消引用全局字段
     */
    @PostMapping("/unref")
    public ResultData<Void> unrefField(@Validated @RequestBody ModelingFieldRefParam param) {
        modelingFieldService.unrefGlobalField(param);
        return ResultData.OK;
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteField(@PathVariable("id") String id) {
        modelingFieldService.deleteField(id);
        return ResultData.OK;
    }

    @GetMapping("/table/list")
    public ResultData<List<TableScheme>> getTableList() {
        return ResultData.ok(modelingFieldService.getBaseMapper().getTableName());
    }

    @GetMapping("/table/column/list")
    public ResultData<List<TableScheme>> getTableColumnList(String tableName) {
        return ResultData.ok(modelingFieldService.getBaseMapper().getTableColumn(tableName));
    }

}
