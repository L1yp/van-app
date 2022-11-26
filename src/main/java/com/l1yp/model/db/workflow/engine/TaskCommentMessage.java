package com.l1yp.model.db.workflow.engine;

public class TaskCommentMessage {

    private CommentType type;

    private String outcome;

    private String comment;


    public enum CommentType {
        complete, comment,
        ;
    }

    public CommentType getType() {
        return type;
    }

    public void setType(CommentType type) {
        this.type = type;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
