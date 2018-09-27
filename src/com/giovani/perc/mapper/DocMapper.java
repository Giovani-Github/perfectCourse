package com.giovani.perc.mapper;

import com.giovani.perc.pojo.Doc;
import com.giovani.perc.pojo.DocQueryVo;

import java.util.List;

/**
 * 文档数据持久化接口
 *
 * @Author: Giovani
 * @Date: 2018/9/19 11:48
 */
public interface DocMapper {

    /**
     * 分页查找所有文档
     *
     * @Param: [docQueryVo]
     * @return: java.util.List<com.giovani.perc.pojo.Doc>
     * @Author: Giovani
     * @Date: 2018/9/19 11:51
     */
    public List<Doc> findDocList(DocQueryVo docQueryVo);

    /**
     * 根据条件查询文档总数目
     *
     * @Param: [docQueryVo]
     * @return: int
     * @Author: Giovani
     * @Date: 2018/9/19 11:51
     */
    public int findDocCount(DocQueryVo docQueryVo);

    /**
     * 根据id查询文档
     *
     * @Param: [doc_id]
     * @return: com.giovani.perc.pojo.Doc
     * @Author: Giovani
     * @Date: 2018/9/19 11:51
     */
    public Doc findDocById(Long doc_id);
}
