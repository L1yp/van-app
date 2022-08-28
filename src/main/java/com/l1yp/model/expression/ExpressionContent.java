package com.l1yp.model.expression;

public class ExpressionContent {
    public String type;
    public ExpressionValue attrs;

    public static class ExpressionValue {
        public long field_id;
        public String operator;
        public String val;
    }

}
