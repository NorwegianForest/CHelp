package com.business;

import com.DBQuery.DataProcess;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述一章学习资料，对应数据库中的materials表
 */
public class Material {

    private int number; // 序号
    private String title; // 标题
    private String fileName; // 对应的文件名

    public Material(String title, String fileName) {
        this.title = title;
        this.fileName = fileName;
    }

    public static List<Material> getFiveMaterialList() {
        List<Material> materialList = new ArrayList<>();
        String sql = "select * from materials limit 5";
        DataProcess.loadMaterialList(sql, materialList);
        return materialList;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
