package com.vole.dao;

import com.vole.entity.ArcType;

import java.util.List;
import java.util.Map;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:10
 * 内容：帖子类别 DAO 接口
 */
public interface ArcTypeDao {

    /**
     * 根据条据分页查询帖子类别
     * @return
     */
    List<ArcType> list(Map<String, Object> map);

    /**
     * 根据 id 查找帖子类型
     * @param id
     * @return
     */
    ArcType findById(Integer id);

}
