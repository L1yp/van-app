package com.l1yp.mapper.modeling;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.l1yp.model.db.modeling.ModelingPage;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import static com.baomidou.mybatisplus.core.toolkit.Constants.MYBATIS_PLUS;
import static com.baomidou.mybatisplus.core.toolkit.StringPool.UNDERSCORE;

public interface ModelingPageMapper extends BaseMapper<ModelingPage> {

    @Select("""
            SELECT page.*
            FROM modeling_page_ref ref
            LEFT JOIN modeling_page page ON ref.page_id = page.id
            WHERE page.module = #{module} AND page.mkey = #{mkey} AND ref.page_key = #{pageKey}
            """)
    @ResultMap(MYBATIS_PLUS + UNDERSCORE + "ModelingPage")
    ModelingPage findEntityPage(ModelingPageFindParam param);

}
