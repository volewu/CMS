package com.vole.service.impl;

import com.vole.dao.LinkDao;
import com.vole.entity.Link;
import com.vole.service.LinkService;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:17
 * 内容：友情链接 Service 实现类
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService {

    @Resource
    private LinkDao linkDao;

    public List<Link> list(Map<String, Object> map) {
        return linkDao.list(map);
    }
}
