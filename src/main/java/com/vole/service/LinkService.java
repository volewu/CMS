package com.vole.service;

import com.vole.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:16
 * 内容：友情链接 Service 接口
 */
public interface LinkService {

    /**
     * 根据条据分页查询友情链接
     * @return
     */
    List<Link> list(Map<String, Object> map);
}
