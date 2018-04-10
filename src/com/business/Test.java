package com.business;

import com.DBQuery.DataProcess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class Test {
    private int id;
    private int userId;
    private int paperId;
    private String testDate;
    private String username;
    private String paperTitle;

    public Test(int id, int userId, int paperId, String testDate) {
        this.id = id;
        this.userId = userId;
        this.paperId = paperId;
        this.testDate = testDate;
        this.paperTitle = DataProcess.getPaperTitle(this.paperId);
        this.username = DataProcess.getUsername(userId);
    }

    public static List<Test> getTestList(String username) {
        int userId = DataProcess.findUserId(username);
        List<Test> testList = new ArrayList<>();
        String sql = "select * from test where user_id=" + userId + " order by test_date desc";
        DataProcess.loadTestList(sql, testList);
        return testList;
    }

    public static List<Test> getTestList(int paperId) {
        List<Test> testList = new ArrayList<>();
        String sql = "select * from test where paper_id=" + paperId + " order by test_date desc";
        DataProcess.loadTestList(sql, testList);
        return testList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

    public String getTestDate() {
        return testDate;
    }

    public void setTestDate(String testDate) {
        this.testDate = testDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }
}
