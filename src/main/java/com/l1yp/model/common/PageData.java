package com.l1yp.model.common;

import com.github.pagehelper.Page;

import java.util.Collections;
import java.util.List;

public class PageData<T> {

    private int pageIdx;
    private int pageSize;
    private int total;
    private List<T> data;

    private Object additional;

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

    public static <T> PageData<T> empty(int pageIdx, int pageSize) {
        PageData<T> pageData = new PageData<>(pageIdx, pageSize);
        pageData.setTotal(0);
        pageData.setData(Collections.emptyList());
        return pageData;
    }

    public static <T> PageData<T> ok(int pageIdx, int pagesize, int total, List<T> data) {
        PageData<T> pageData = new PageData<>(pageIdx, pagesize);
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

    public void initPage(List<?> data) {
        if (data instanceof Page<?> page) {
            setTotal((int) page.getTotal());
            setPageIdx(page.getPageNum());
            setPageSize(page.getPageSize());
        }
    }

    public void setData(List<T> data) {
        if (data instanceof Page<T> page) {
            setTotal((int) page.getTotal());
            setPageIdx(page.getPageNum());
            setPageSize(page.getPageSize());
        }
        this.data = data;
    }

    public Object getAdditional() {
        return additional;
    }

    public void setAdditional(Object additional) {
        this.additional = additional;
    }
}