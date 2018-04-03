package com.taglib;

import com.DBQuery.DataProcess;
import com.business.Material;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 在jsp页面上输出学习资料列表
 * 具体用法与PapersTable类似，详见PapersTable
 */
public class MaterialsTable {

    private List<Material> materialList = new ArrayList<>(); // 保存查询到的学习资源列表
    private String htmlCode; // 写入jsp页面的HTML代码
    private StringBuffer sqlBuffer = new StringBuffer("select * from materials"); // 查询语句

    public MaterialsTable() {
        loadMaterialsList();
    }

    /**
     * 带最大输出记录数的构造方法
     * @param count 最大输出记录数
     */
    public MaterialsTable(int count) {
        sqlBuffer.append(" limit 0,");
        sqlBuffer.append(count);
    }

    /**
     * 带关键字查询，用于搜索框搜索
     * @param keyWord 查询关键字
     */
    public MaterialsTable(String keyWord) {
        sqlBuffer.append(" where materials_title like '%");
        sqlBuffer.append(keyWord);
        sqlBuffer.append("%'");
    }

    /**
     * 查询并将结果保存于materialsList中
     */
    private void loadMaterialsList() {
        Connection con = DataProcess.getConnection();
        ResultSet rs = DataProcess.getResult(sqlBuffer.toString(), con);
        try {
            while (rs.next()) {
                materialList.add(new Material(rs.getString("materials_title"), rs.getString("file_name")));
            }
            rs.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据查询结果，构造HTML代码，并幅值给htmlCode
     * @throws SQLException
     */
    private void loadHTMLCode() throws SQLException {
        loadMaterialsList();
        StringBuffer codeBuffer = new StringBuffer("<table align=left>");
        if (materialList.isEmpty()) {
            codeBuffer.append("<tr><td>无结果</td></tr>");
        } else {
            for (Material material : materialList) {
                codeBuffer.append("<tr><td>&nbsp;&nbsp;<a href=\"materials.jsp?file_name=");
                codeBuffer.append(material.getFileName());
                codeBuffer.append("\">");
                codeBuffer.append(material.getTitle());
                codeBuffer.append("</a></td></tr>");
            }
        }
        codeBuffer.append("</table>");
        htmlCode = codeBuffer.toString();
    }

    /**
     * 在jsp中调用，获取HTML代码
     * @return 构造好的HTML代码
     * @throws SQLException
     */
    public String getHtmlCode() throws SQLException {
        loadHTMLCode();
        return htmlCode;
    }

    public List<Material> getMaterialList() {
        return materialList;
    }
}
