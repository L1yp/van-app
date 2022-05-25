package com.l1yp.model.param.process.model;

public class AddProcessModelDefinitionParam {
    private String processKey;

    private String title;

    private String codePrefix;

    private String codeTimePattern;

    private String codeJoiner;

    private String codeJoiner2;


    private String codeSuffix;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCodePrefix() {
        return codePrefix;
    }

    public void setCodePrefix(String codePrefix) {
        this.codePrefix = codePrefix;
    }

    public String getCodeJoiner2() {
        return codeJoiner2;
    }

    public void setCodeJoiner2(String codeJoiner2) {
        this.codeJoiner2 = codeJoiner2;
    }

    public String getCodeTimePattern() {
        return codeTimePattern;
    }

    public void setCodeTimePattern(String codeTimePattern) {
        this.codeTimePattern = codeTimePattern;
    }

    public String getCodeJoiner() {
        return codeJoiner;
    }

    public void setCodeJoiner(String codeJoiner) {
        this.codeJoiner = codeJoiner;
    }

    public String getCodeSuffix() {
        return codeSuffix;
    }

    public void setCodeSuffix(String codeSuffix) {
        this.codeSuffix = codeSuffix;
    }
}
