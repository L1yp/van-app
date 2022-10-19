package com.l1yp.controller.workflow;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.WorkflowTypeVerActiveParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerCopyParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerPendingParam;
import com.l1yp.model.param.workflow.WorkflowTypeVerUpdateXmlParam;
import com.l1yp.service.workflow.IWorkflowTypeVerService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Validated
@SaCheckLogin
@RestController
@RequestMapping("/workflow/type/ver")
public class WorkflowTypeVerController {

    @Resource
    IWorkflowTypeVerService workflowTypeVerService;

    @PostMapping("/copy")
    public ResultData<Void> copy(@RequestBody @Validated WorkflowTypeVerCopyParam param) {
        workflowTypeVerService.copy(param);
        return ResultData.OK;
    }

    @PostMapping("/updateXml")
    public ResultData<Void> updateXml(@RequestBody @Validated WorkflowTypeVerUpdateXmlParam param) {
        workflowTypeVerService.updateXml(param);
        return ResultData.OK;
    }

    @PostMapping("/active")
    public ResultData<Void> activeVer(@RequestBody @Validated WorkflowTypeVerActiveParam param) {
        workflowTypeVerService.activeVer(param);
        return ResultData.OK;
    }


    @PostMapping("/pending")
    public ResultData<Void> pendingVer(@RequestBody @Validated WorkflowTypeVerPendingParam param) {
        workflowTypeVerService.pendingVer(param);
        return ResultData.OK;
    }


}
