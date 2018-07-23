package com.giovani.perc.mapper;

import com.giovani.perc.pojo.QueryVo;
import com.giovani.perc.pojo.Video;

import java.util.List;

/**
 * 视频数据持久化接口
 *
 * @Author Giovani
 * @Create: 2018/7/21 21:40
 */
public interface VideoMapper {
    // TODO: 2018/7/21 21:43 下一步编写VideoMapper.xml文件，编写查找视频列表的sql语句

    /**
     * 分页查找所有视频
     *
     * @Param: []
     * @return: java.util.List<com.giovani.perc.pojo.Video>
     * @Author: Giovani
     * @Date: 2018/7/21 21:42
     */
    public List<Video> findVideoList(QueryVo queryVo);

    /**
     * 根据条件查询视频总数目
     *
     * @Param: [queryVo]
     * @return: int
     * @Author: Giovani
     * @Date: 2018/7/23 10:38
     */
    public int findVideoCount(QueryVo queryVo);
}
