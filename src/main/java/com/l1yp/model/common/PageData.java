package com.l1yp.model.common;

import java.util.Collections;
import java.util.List;

public class PageData<T> {

    private int pageIdx;
    private int pageSize;
    private int total;
    private List<T> data;

    public PageData(){}

    public PageData(PageParam param) {
        pageIdx = param.getPageIdx();
        pageSize = param.getPageSize();
    }

    public PageData(int pageIdx, int pageSize) {
        this.pageIdx = pageIdx;
        this.pageSize = pageSize;
    }

    public static <T> PageData<T> empty(PageParam param) {
        PageData<T> pageData = new PageData<>(param);
        pageData.setTotal(0);
        pageData.setData(Collections.emptyList());
        return pageData;
    }

    public static <T> PageData<T> empty(int pagenum, int pagesize) {
        PageData<T> pageData = new PageData<>(pagenum, pagesize);
        pageData.setTotal(0);
        pageData.setData(Collections.emptyList());
        return pageData;
    }

    public static <T> PageData<T> ok(int pagenum, int pagesize, int total, List<T> data) {
        PageData<T> pageData = new PageData<>(pagenum, pagesize);
        pageData.setTotal(total);
        pageData.setData(data);
        return pageData;
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

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}