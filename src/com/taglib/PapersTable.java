package com.taglib;

import com.DBQuery.DataProcess;
import com.business.Paper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 在jsp页面上输出试卷列表
 * 此类一般只有一个用法
 * 即在jsp页面中采用通过参数构造匿名类，调用getHtmlCode()方法
 * 例如<%= new PapersTable(PapersTable.CHAPTER, PapersTable.PAPER, 5) %>
 * 用法详见index.jsp
 */
public class PapersTable {

    private List<Paper> paperList; // 保存在数据库中查询到的试卷信息
    private String htmlCode; // 输出到jsp页面的html代码
    private String sql;
    private String url; // 即paper或者edit_paper

    public static final String PAPER = "paper";
    public static final String EDIT_PAPER = "edit_paper"; // 目标地址的url，决定连接是转跳到paper页面还是edit_paper页面

    public static final String CHAPTER = "chapter";
    public static final String SIMULATION = "simulation";
    public static final String OLD = "old"; // 试卷的类型，决定sql语句中搜索那个字段

    /**
     * 不指定最大输出记录数的构造方法
     * @param paperType 查询的试卷类型
     * @param url 链接转跳的目标页面
     */
    public PapersTable(String paperType, String url) {
        sql = new String("select * from papers where paper_type='" + paperType + "'");
        this.url = url;
    }

    /**
     * 指定最大输出记录数
     * @param paperType 查询的试卷类型
     * @param url 链接转跳的目标页面
     * @param count 最大输出记录数
     */
    public PapersTable(String paperType, String url, int count) {
        sql = new String("select * from papers where paper_type='" + paperType + "' limit 0," + count);
        this.url = url;
    }

    /**
     * 指定关键词，用于搜索功能
     * @param paperType 查询的试卷类型
     * @param url 连接转跳的目标页面
     * @param keyWord 指定搜索的关键词
     */
    public PapersTable(String paperType, String url, String keyWord) {
        sql = new String("select * from papers where paper_type='" + paperType + "' and paper_title like '%" + keyWord + "%'");
        this.url = url;
    }

    /**
     * 根据构造好的sql语句进行查询，保存查询结果于paperList
     * @throws SQLException
     */
    private void loadPaperList() {
        paperList = new ArrayList<>();
        DataProcess.loadPaperList(sql, paperList);
    }

    /**
     * 根据查询结果，构造HTML代码
     * @throws SQLException
     */
    private void loadHTMLCode() {
        loadPaperList();
        StringBuffer codeBuffer = new StringBuffer("<table align=left>");
        if (paperList.isEmpty()) {
            codeBuffer.append("<tr><td>无结果</td></tr>");
        } else {
            for (Paper paper : paperList) {
                codeBuffer.append("<tr><td>&nbsp;&nbsp;<a href=\"");
                codeBuffer.append(url);
                codeBuffer.append(".jsp?paper_id=");
                codeBuffer.append(paper.getId());
                codeBuffer.append("\">");
                codeBuffer.append(paper.getTitle());
                codeBuffer.append("</a></td></tr>");
            }
        }
        codeBuffer.append("</table>");
        htmlCode = codeBuffer.toString();
    }

    /**
     * 最重要的方法，加载并返回
     * @return 输出到jsp页面的HTML代码
     * @throws SQLException
     */
    public String getHtmlCode() {
        loadHTMLCode();
        return htmlCode;
    }
}
