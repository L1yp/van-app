package com.l1yp.mapper;

import com.l1yp.model.db.SysDept;
import com.l1yp.model.view.SysUserView;
import com.l1yp.util.SQLTool;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.common.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 2022/2/19 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public interface SysDeptMapper extends Mapper<SysDept> {

    @DeleteProvider(type = Provider.class, method = "batchDeleteDept")
    int batchDeleteDept(@Param("ids") List<Long> ids);

    @SelectProvider(type = Provider.class, method = "listByIdList")
    List<SysDept> listByIdList(@Param("deptIds") Collection<Long> deptIds);

    @SelectProvider(type = Provider.class, method = "search")
    List<SysDept> search(@Param("keyword") String keyword);

    @Select("SELECT id,pid FROM sys_dept")
    List<SysDept> selectAllId();

    class Provider {

        public String batchDeleteDept(List<Long> ids) {
            String params = ids.stream().map(String::valueOf).collect(Collectors.joining(",", "(", ")"));
            return "DELETE FROM sys_dept WHERE id IN" + params;
        }

        public String listByIdList(Collection<Long> deptIds) {
            if (CollectionUtils.isEmpty(deptIds)) {
                return null;
            }
            return deptIds.stream().map(String::valueOf).collect(Collectors.joining(",", "SELECT * FROM sys_dept WHERE id IN (", ")"));
        }

        public String search(String keyword) {
            String key = SQLTool.escapeSql(keyword);
            return "SELECT * FROM sys_dept WHERE title LIKE '%" +
                    key + "%' OR simple_name LIKE '%" + key + "%' OR description LIKE '%" +
                    key + "%' OR ident LIKE '%" + key + "%'";
        }

    }


}
