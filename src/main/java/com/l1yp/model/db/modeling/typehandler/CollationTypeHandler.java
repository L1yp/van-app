package com.l1yp.model.db.modeling.typehandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.l1yp.model.db.modeling.ModelingView.Collation;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CollationTypeHandler extends BaseTypeHandler<List<Collation>> {

    private static final ObjectMapper mapper = new ObjectMapper();
    private static final TypeReference<List<Collation>> typeReference = new TypeReference<List<Collation>>() {};


    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, List<Collation> parameter, JdbcType jdbcType) throws SQLException {
        try {
            String json = mapper.writeValueAsString(parameter);
            ps.setString(i, json);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Collation> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return parse(rs.getString(columnName));
    }

    @Override
    public List<Collation> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return parse(rs.getString(columnIndex));
    }

    @Override
    public List<Collation> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return parse(cs.getString(columnIndex));
    }

    private List<Collation> parse(String json) {
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
