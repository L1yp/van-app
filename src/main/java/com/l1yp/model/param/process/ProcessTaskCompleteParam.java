package com.l1yp.model.param.process;

import javax.validation.constraints.NotBlank;
import java.util.Map;

public class ProcessTaskCompleteParam {

    public String processKey;
    public String processInstanceId;
    public String device;
    @NotBlank
    public String outcome;
    public String comment;
    public Map<String, Object> params;






}
