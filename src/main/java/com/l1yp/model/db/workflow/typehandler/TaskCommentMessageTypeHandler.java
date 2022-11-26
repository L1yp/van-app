package com.l1yp.model.db.workflow.typehandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TaskCommentMessageTypeHandler extends BaseTypeHandler<TaskCommentMessage> {

    private static final ObjectMapper mapper = new ObjectMapper();
    private static final TypeReference<TaskCommentMessage> typeReference = new TypeReference<TaskCommentMessage>() {};


    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, TaskCommentMessage parameter, JdbcType jdbcType) throws SQLException {
        try {
            String json = mapper.writeValueAsString(parameter);
            ps.setString(i, json);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public TaskCommentMessage getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return parse(rs.getString(columnName));
    }

    @Override
    public TaskCommentMessage getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return parse(rs.getString(columnIndex));
    }

    @Override
    public TaskCommentMessage getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return parse(cs.getString(columnIndex));
    }

    private TaskCommentMessage parse(String json) {
        if (json == null) {
            return null;
        }
        try {
            return mapper.readValue(json, typeReference);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

}
