package com.giovani.perc.service;

import com.giovani.perc.pojo.Doc;
import com.giovani.perc.pojo.DocQueryVo;
import com.giovani.perc.utils.Page;

/**
 * 文档数据业务逻辑接口
 *
 * @Author: Giovani
 * @Date: 2018/9/19 11:42
 */
public interface DocService {

    /**
     * 分页查询文档列表
     *
     * @Author: Giovani
     * @Date: 2018/9/19 11:44
     */
    public Page<Doc> findDocList(DocQueryVo docQueryVo);

    /**
     * 根据id查询文档
     *
     * @Param: [doc_id]
     * @return: com.giovani.perc.pojo.Doc
     * @Author: Giovani
     * @Date: 2018/9/19 11:44
     */
    public Doc findDocById(Long doc_id);

}
