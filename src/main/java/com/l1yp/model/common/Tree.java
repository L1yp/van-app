package com.l1yp.model.common;

import java.util.List;

public class Tree<T extends Tree<T>> {

    private List<T> children;

    public List<T> getChildren() {
        return children;
    }

    public void setChildren(List<T> children) {
        this.children = children;
    }
}
