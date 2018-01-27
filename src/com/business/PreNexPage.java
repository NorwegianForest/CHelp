package com.business;

import com.DBQuery.DataProcess;

/**
 * 构造学习资源的翻页功能
 */
public class PreNexPage {

    private boolean pre = true; // 是否有上一页
    private boolean nex = true; // 是否有下一页
    private String preTitle = null; // 上一页的标题
    private String nexTitle = null; // 下一页的标题
    private String preName = null; // 上一页的文件名
    private String nexName = null; // 下一页的文件名

    /**
     * 构造某一篇学习资源是否有上下页
     * @param fileName 学习资源的文件名
     */
    public PreNexPage(String fileName) {
        String sql = "select * from materials where file_name='" + fileName + "'";
        int orderNumber = Integer.parseInt(DataProcess.getSingleResult(sql, "order_number"));

        sql = "select count(*) from materials";
        int count = Integer.parseInt(DataProcess.getSingleResult(sql, "count(*)"));

        if (orderNumber == 1) {
            pre = false;
        } else {
            int previousOrderNumber = orderNumber - 1;
            sql = "select * from materials where order_number='" + previousOrderNumber + "'";
            preTitle = DataProcess.getSingleResult(sql, "materials_title");
            preName = DataProcess.getSingleResult(sql, "file_name");
        }
        if (orderNumber == count) {
            nex = false;
        } else {
            int nextOrderNumber = orderNumber + 1;
            sql = "select * from materials where order_number='" + nextOrderNumber + "'";
            nexTitle = DataProcess.getSingleResult(sql, "materials_title");
            nexName = DataProcess.getSingleResult(sql, "file_name");
        }
	}

    public boolean isPre() {
        return pre;
    }

    public boolean isNex() {
        return nex;
    }

    public String getPreTitle() {
        return preTitle;
    }

    public String getNexTitle() {
        return nexTitle;
    }

    public String getPreName() {
        return preName;
    }

    public String getNexName() {
        return nexName;
    }
}
