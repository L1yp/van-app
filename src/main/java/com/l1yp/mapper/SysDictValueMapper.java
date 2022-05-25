package com.l1yp.mapper;

import com.l1yp.model.db.SysDictValue;
import org.apache.ibatis.annotations.*;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public interface SysDictValueMapper extends Mapper<SysDictValue> {

    @Select("SELECT * FROM sys_dict_value WHERE scope = #{scope} AND ident = #{ident} ORDER BY pid ASC,order_no ASC")
    List<SysDictValue> selectDictValuesByIdent(@Param("scope") String scope, @Param("ident") String ident);

    @DeleteProvider(type = Provider.class, method = "batchDelete")
    int batchDelete(@Param("ids") List<Long> ids);

    @SelectProvider(type = Provider.class, method = "listByIdList")
    List<SysDictValue> listByIdList(@Param("dictIds") Collection<Long> dictIds);

    @Delete("DELETE FROM dict_value WHERE ident = #{ident}")
    int deleteByDictInfoIdent(String ident);


    class Provider {

        public String batchDelete(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM sys_dict_value WHERE id IN" + params;
        }

        public String listByIdList(Collection<Long> dictIds) {
            if (CollectionUtils.isEmpty(dictIds)) {
                return null;
            }
            return dictIds.stream().map(String::valueOf).collect(Collectors.joining(",", "SELECT * FROM sys_dict_value WHERE id IN (", ")"));
        }

    }

}
