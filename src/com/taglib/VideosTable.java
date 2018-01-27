package com.taglib;

import com.DBQuery.DataProcess;
import com.business.Video;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 在jsp页面上输出视频列表
 */
public class VideosTable {

    private List<Video> videoList = new ArrayList<>();
    private String htmlCode;
    private StringBuffer sqlBuffer = new StringBuffer("select * from videos"); // 查询语句
    private final int numOfVideos = 20; // 每页显示视频的数量
    private int numOfPages; // 所有视频的页数

    /**
     * 根据要显示的页数编号来构造sql语句
     * @param page 第page页
     */
    public VideosTable(int page) {
        int from = (page - 1) * numOfVideos;
        sqlBuffer.append(" limit " + from + "," + numOfVideos);
    }

    public VideosTable(String keyWord) {
        sqlBuffer.append(" where video_title like '%" + keyWord + "%'");
    }

    private void loadVideosList() throws SQLException {
        Connection con = DataProcess.getConnection();
        ResultSet rs = DataProcess.getResult(sqlBuffer.toString(), con);
        while (rs.next()) {
            videoList.add(new Video(rs.getString("video_title"), rs.getString("order_number")));
        }
        rs.close();
        con.close();
    }

    private void loadHTMLCode() throws SQLException {
        loadVideosList();
        int col = 0;
        StringBuffer codeBuffer = new StringBuffer("<table align=center width=900 style=\"border-collapse:separate; border-spacing:10px 60px;\" >");
        if (videoList.isEmpty()) {
            codeBuffer.append("<tr><td>无结果</td></tr>");
        } else {
            for (Video video : videoList) {
                if (col == 4 || col == 0) { // 视频显示每4个一行
                    codeBuffer.append("<tr>");
                    col = 0;
                }
                codeBuffer.append("<td align=center><a href=\"video.jsp?number=")
                .append(video.getNumber())
                .append("\" ><img src=\"/images/timg (1).jpg\" width=160 height=120 style=\"background-color: #B0C4DE; display:block;\" />")
                .append(video.getTitle())
                .append("</a></td>");
                if (col ++ == 3) {
                    codeBuffer.append("</tr>");
                }
            }
        }
        codeBuffer.append("</table>");
        htmlCode = codeBuffer.toString();
    }

    public String getHtmlCode() throws SQLException {
        loadHTMLCode();
        return htmlCode;
    }

    /**
     * 根据视频总数计算视频的页数
     * @return 视频总页数
     * @throws SQLException
     */
    public int getNumOfPages() throws SQLException {
        String sql = "select count(*) from videos";
        Connection con = DataProcess.getConnection();
        ResultSet rs = DataProcess.getResult(sql, con);
        rs.next();
        int count = Integer.parseInt(rs.getString("count(*)"));
        numOfPages = count / numOfVideos;
        if (count % numOfVideos != 0) {
            numOfPages ++;
        }
        rs.close();
        con.close();

        return numOfPages;
    }
}
