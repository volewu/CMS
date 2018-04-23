package com.vole.service.impl;

import com.vole.dao.ArcTypeDao;
import com.vole.entity.ArcType;
import com.vole.service.ArcTypeService;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:18
 * 内容：帖子类别 Service 实现类
 */
@Service("arcTypeService")
public class ArcTypeServiceImpl implements ArcTypeService {

    @Resource
    private ArcTypeDao arcTypeDao;

    public List<ArcType> list(Map<String, Object> map) {
        return arcTypeDao.list(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return arcTypeDao.getTotal(map);
    }

    public ArcType findById(Integer id) {
        return arcTypeDao.findById(id);
    }

    public Integer add(ArcType arcType) {
        return arcTypeDao.add(arcType);
    }

    public Integer update(ArcType arcType) {
        return arcTypeDao.update(arcType);
    }

    public Integer delete(Integer id) {
        return arcTypeDao.delete(id);
    }
}
