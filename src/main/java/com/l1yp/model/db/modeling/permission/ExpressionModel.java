package com.l1yp.model.db.modeling.permission;

public class ExpressionModel {

    private ExpressionType type;

    private BlockExpressionModel content;

    public ExpressionType getType() {
        return type;
    }

    public void setType(ExpressionType type) {
        this.type = type;
    }

    public BlockExpressionModel getContent() {
        return content;
    }

    public void setContent(BlockExpressionModel content) {
        this.content = content;
    }

    public enum ExpressionType {
        /**
         * 表达式块
         */
        BLOCK,
        /**
         * 且
         */
        AND,
        /**
         * 或
         */
        OR,
        /**
         * (
         */
        START,
        /**
         * )
         */
        END,
    }

}
