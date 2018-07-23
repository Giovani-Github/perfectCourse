package com.giovani.perc.service;

import com.giovani.perc.pojo.QueryVo;
import com.giovani.perc.pojo.Video;
import com.giovani.perc.utils.Page;

/**
 * 视频数据业务逻辑接口
 *
 * @Author Giovani
 * @Create: 2018/7/21 22:04
 */
public interface VideoService {

    /**
     * 分页查询视频列表
     *
     * @Param: []
     * @return: java.util.List<com.giovani.perc.pojo.Video>
     * @Author: Giovani
     * @Date: 2018/7/21 22:06
     */
    public Page<Video> findVideoList(QueryVo queryVo);

}
