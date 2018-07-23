package com.giovani.perc.service.impl;

import com.giovani.perc.mapper.VideoMapper;
import com.giovani.perc.pojo.QueryVo;
import com.giovani.perc.pojo.Video;
import com.giovani.perc.service.VideoService;
import com.giovani.perc.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 视频数据持久化接口实现类
 *
 * @Author Giovani
 * @Create: 2018/7/21 22:07
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public Page<Video> findVideoList(QueryVo queryVo) {

        // 设置从哪一条开始查询
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());

        List<Video> videoList = videoMapper.findVideoList(queryVo);

        int videoCount = videoMapper.findVideoCount(queryVo);

        Page<Video> videoPage = new Page<>(videoCount, queryVo.getPage(), queryVo.getRows(), videoList);

        return videoPage;
    }

}
