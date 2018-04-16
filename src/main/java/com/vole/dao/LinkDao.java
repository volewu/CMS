package com.vole.dao;

import com.vole.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:09
 * 内容：超链接 dao 接口
 */
public interface LinkDao {

    /**
     * 根据条据分页查询友情链接
     * @return
     */
    List<Link> list(Map<String, Object> map);
}
