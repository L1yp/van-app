package com.l1yp.model.db.modeling;

import com.l1yp.model.db.workflow.model.WorkflowTypeDef;

public enum ModelingModule {
    WORKFLOW,
    ENTITY,
    ;

    public String getTableName(String mkey) {
        if (this == WORKFLOW) {
            return WorkflowTypeDef.buildEntityTableName(mkey);
        } else if (this == ENTITY) {
            return ModelingEntity.buildEntityTableName(mkey);
        } else {
            return null;
        }
    }

}