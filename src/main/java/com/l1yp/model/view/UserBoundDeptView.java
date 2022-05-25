package com.l1yp.model.view;

import java.util.List;

public class UserBoundDeptView {

    private Long masterDeptId;

    private List<Long> partTimeDeptId;


    public Long getMasterDeptId() {
        return masterDeptId;
    }

    public void setMasterDeptId(Long masterDeptId) {
        this.masterDeptId = masterDeptId;
    }

    public List<Long> getPartTimeDeptId() {
        return partTimeDeptId;
    }

    public void setPartTimeDeptId(List<Long> partTimeDeptId) {
        this.partTimeDeptId = partTimeDeptId;
    }
}
