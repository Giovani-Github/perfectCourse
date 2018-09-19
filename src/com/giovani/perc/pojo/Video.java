package com.giovani.perc.pojo;

/**
 * 视频表数据模型
 *
 * @Author Giovani
 * @Create: 2018/7/21 21:37
 */
public class Video {

    // 视频id
    private Long video_id;
    // 视频名称
    private String videoname;
    // 视频存放目录
    private String videodir;
    // 视频介绍
    private String videoinfo;
    // 视频文件类型
    private String filetype;
    // 视频文件名称
    private String filename;

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Long getVideo_id() {
        return video_id;
    }

    public void setVideo_id(Long video_id) {
        this.video_id = video_id;
    }

    public String getVideoname() {
        return videoname;
    }

    public void setVideoname(String videoname) {
        this.videoname = videoname;
    }

    public String getVideodir() {
        return videodir;
    }

    public void setVideodir(String videodir) {
        this.videodir = videodir;
    }

    public String getVideoinfo() {
        return videoinfo;
    }

    public void setVideoinfo(String videoinfo) {
        this.videoinfo = videoinfo;
    }

    @Override
    public String toString() {
        return "Video{" +
                "video_id='" + video_id + '\'' +
                ", videoname='" + videoname + '\'' +
                ", videodir='" + videodir + '\'' +
                ", videoinfo='" + videoinfo + '\'' +
                ", filetype='" + filetype + '\'' +
                ", filename='" + filename + '\'' +
                '}';
    }

}
