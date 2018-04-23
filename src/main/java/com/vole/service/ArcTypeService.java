package com.vole.service;

import com.vole.entity.ArcType;

import java.util.List;
import java.util.Map;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:16
 * 内容：帖子类别 Service 接口
 */
public interface ArcTypeService {

    /**
     * 根据条据分页查询帖子类别
     * @return
     */
    List<ArcType> list(Map<String, Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    Long getTotal(Map<String, Object> map);

    /**
     * 根据 id 查找帖子类型
     * @param id
     * @return
     */
    ArcType findById(Integer id);

    /**
     * 添加帖子类别
     * @param arcType
     * @return
     */
    Integer add(ArcType arcType);

    /**
     * 修改帖子类别
     * @param arcType
     * @return
     */
    Integer update(ArcType arcType);

    /**
     * 删除帖子类别
     * @param id
     * @return
     */
    Integer delete(Integer id);
}
