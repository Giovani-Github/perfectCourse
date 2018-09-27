package com.giovani.perc.pojo;

/**
 * 文档表数据模型
 *
 * @Author: Giovani
 * @Date: 2018/9/19 11:30
 */
public class Doc {

    // 视频id
    private Long doc_id;
    // 视频名称
    private String docname;
    // 视频存放目录
    private String docdir;
    // 视频介绍
    private String docinfo;
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

    public Long getdoc_id() {
        return doc_id;
    }

    public void setdoc_id(Long doc_id) {
        this.doc_id = doc_id;
    }

    public String getdocname() {
        return docname;
    }

    public void setdocname(String docname) {
        this.docname = docname;
    }

    public String getdocdir() {
        return docdir;
    }

    public void setdocdir(String docdir) {
        this.docdir = docdir;
    }

    public String getdocinfo() {
        return docinfo;
    }

    public void setdocinfo(String docinfo) {
        this.docinfo = docinfo;
    }

    @Override
    public String toString() {
        return "doc{" +
                "doc_id='" + doc_id + '\'' +
                ", docname='" + docname + '\'' +
                ", docdir='" + docdir + '\'' +
                ", docinfo='" + docinfo + '\'' +
                ", filetype='" + filetype + '\'' +
                ", filename='" + filename + '\'' +
                '}';
    }

}
