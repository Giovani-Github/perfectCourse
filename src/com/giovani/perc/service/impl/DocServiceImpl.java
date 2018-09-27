package com.giovani.perc.service.impl;

import com.giovani.perc.mapper.DocMapper;
import com.giovani.perc.pojo.Doc;
import com.giovani.perc.pojo.DocQueryVo;
import com.giovani.perc.service.DocService;
import com.giovani.perc.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文档数据持久化接口实现类
 *
 * @Author: Giovani
 * @Date: 2018/9/19 11:45
 */
@Service
public class DocServiceImpl implements DocService {

    @Autowired
    private DocMapper docMapper;

    @Override
    public Page<Doc> findDocList(DocQueryVo docQueryVo) {

        // 设置从哪一条开始查询
        docQueryVo.setStart((docQueryVo.getPage() - 1) * docQueryVo.getRows());

        List<Doc> docList = docMapper.findDocList(docQueryVo);

        int docCount = docMapper.findDocCount(docQueryVo);

        Page<Doc> docPage = new Page<Doc>(docCount, docQueryVo.getPage(), docQueryVo.getRows(), docList);

        return docPage;
    }

    @Override
    public Doc findDocById(Long doc_id) {
        Doc doc = docMapper.findDocById(doc_id);
        return doc;
    }

}
