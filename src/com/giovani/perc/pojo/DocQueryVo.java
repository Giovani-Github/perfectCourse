package com.giovani.perc.pojo;

/**
 * 文档查询条件数据模型
 *
 * @Author: Giovani
 * @Date: 2018/9/19 11:41
 */
public class DocQueryVo {

    private String docname;

    // 当前页码数
    private Integer page = 1;
    // 数据库从哪一条数据开始查
    private Integer start;
    // 每页显示数据条数
    private Integer rows = 9;

    public String getdocname() {
        return docname;
    }

    public void setdocname(String docname) {
        this.docname = docname;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
