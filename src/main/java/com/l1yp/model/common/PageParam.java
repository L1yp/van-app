package com.l1yp.model.common;

import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * 分页参数基类
 */
@Validated
public class PageParam {

    @Min(1)
    private int pageIdx;

    @Max(500)
    @Min(10)
    private int pageSize;

    public int getOffset(){
        return (pageIdx - 1) * pageSize;
    }

    public int getPageIdx() {
        return pageIdx;
    }

    public void setPageIdx(int pageIdx) {
        this.pageIdx = pageIdx;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
