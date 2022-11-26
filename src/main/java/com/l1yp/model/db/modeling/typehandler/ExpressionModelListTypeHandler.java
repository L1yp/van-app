package com.l1yp.model.db.modeling.typehandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.l1yp.model.db.modeling.permission.ExpressionModel;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ExpressionModelListTypeHandler extends BaseTypeHandler<List<ExpressionModel>> {

    private static final ObjectMapper mapper = new ObjectMapper();
    private static final TypeReference<List<ExpressionModel>> typeReference = new TypeReference<List<ExpressionModel>>() {};


    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, List<ExpressionModel> parameter, JdbcType jdbcType) throws SQLException {
        try {
            String json = mapper.writeValueAsString(parameter);
            ps.setString(i, json);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<ExpressionModel> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return parse(rs.getString(columnName));
    }

    @Override
    public List<ExpressionModel> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return parse(rs.getString(columnIndex));
    }

    @Override
    public List<ExpressionModel> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return parse(cs.getString(columnIndex));
    }

    private List<ExpressionModel> parse(String json) {
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
