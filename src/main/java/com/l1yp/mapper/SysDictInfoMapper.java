package com.l1yp.mapper;

import com.l1yp.model.db.SysDictInfo;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.stream.Collectors;

public interface SysDictInfoMapper extends Mapper<SysDictInfo> {

    @DeleteProvider(type = Provider.class, method = "batchDelete")
    int batchDelete(@Param("ids") List<Long> ids);

    class Provider {

        public String batchDelete(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM sys_dict_info WHERE id IN" + params;
        }

    }

}
