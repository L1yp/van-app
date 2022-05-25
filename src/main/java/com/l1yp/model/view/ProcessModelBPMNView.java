package com.l1yp.model.view;

public class ProcessModelBPMNView {

    private Long id;

    private String processKey;

    private Integer version;

    private String processModelDefinitionId;

    private String content;

    private Integer state;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getProcessModelDefinitionId() {
        return processModelDefinitionId;
    }

    public void setProcessModelDefinitionId(String processModelDefinitionId) {
        this.processModelDefinitionId = processModelDefinitionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
