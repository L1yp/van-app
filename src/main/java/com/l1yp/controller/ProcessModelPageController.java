package com.l1yp.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.ProcessModelNodePage;
import com.l1yp.model.db.ProcessModelPage;
import com.l1yp.model.db.ProcessModelPageScheme;
import com.l1yp.model.param.process.model.AddProcessModelPageParam;
import com.l1yp.model.param.process.model.AddProcessModelPageSchemeParam;
import com.l1yp.model.param.process.model.BindProcessModelNodePageParam;
import com.l1yp.model.view.ProcessModelPageSchemeView;
import com.l1yp.service.ProcessModelPageService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Validated
@SaCheckLogin
@RestController
@RequestMapping("/process/model/page")
public class ProcessModelPageController {

    @Resource
    ProcessModelPageService processModelPageService;


    /**
     * 查询页面列表
     */
    @GetMapping("/list")
    public ResultData<List<ProcessModelPage>> listProcessPage(@RequestParam(name = "processKey") String processKey) {
        return processModelPageService.listProcessPage(processKey);
    }

    @GetMapping("/listByBpmnId")
    public ResultData<List<ProcessModelNodePage>> listProcessPageByBpmnId(@RequestParam(name = "bpmnId") Long bpmnId) {
        return processModelPageService.listProcessPageByBpmnId(bpmnId);
    }

    /**
     * 创建流程界面
     */
    @PostMapping("/create")
    public ResultData<Void> createPage(@RequestBody AddProcessModelPageParam param) {
        processModelPageService.createPage(param);
        return ResultData.OK;
    }

    @GetMapping("/scheme/{pageId}")
    public ResultData<ProcessModelPageSchemeView> listProcessPageScheme(@PathVariable("pageId") Long pageId) {
        return processModelPageService.listProcessPageScheme(pageId);
    }

    /**
     * 创建流程页面定义
     */
    @PostMapping("/scheme/create")
    public ResultData<Void> createPageScheme(@RequestBody AddProcessModelPageSchemeParam param) {
        processModelPageService.createPageScheme(param);
        return ResultData.OK;
    }

    /**
     * 流程节点绑定界面
     */
    @PostMapping("/bind")
    public ResultData<Void> bindProcessNode(@RequestBody BindProcessModelNodePageParam param) {
        processModelPageService.bindProcessModelBpmnPage(param);
        return ResultData.OK;
    }

}
