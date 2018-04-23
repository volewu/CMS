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

    /**
     * 获取总记录数
     * @param map
     * @return
     */
     Long getTotal(Map<String,Object> map);


    /**
     * 添加友情链接
     * @param link
     * @return
     */
     Integer add(Link link);

    /**
     * 修改友情链接
     * @param link
     * @return
     */
     Integer update(Link link);

    /**
     * 删除友情链接
     * @param id
     * @return
     */
     Integer delete(Integer id);

}
