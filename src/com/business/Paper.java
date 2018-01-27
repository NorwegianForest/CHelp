package com.business;

import com.DBQuery.DataProcess;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 描述一套试卷的类
 */
public class Paper {

    private String title; // 试卷的标题
    private String type; // 试卷的类型
    private List<Exercise> exerciseList = new ArrayList<>(); // 试卷包含的试题
    private int wrongCount; // 用户在此试题卷答对的提数

    /**
     * 构造出一份试卷并包含所有试题
     * @param title 试卷标题
     * @throws SQLException
     */
    public Paper(String title) throws SQLException {
        this.title = title;
        loadExerciseList();
    }

    /**
     * 仅描述一份试卷标题和类型，不关心试卷的内容，用于显示试卷列表
     * @param title 试卷标题
     * @param type 试卷类型
     */
    public Paper(String title, String type) {
        this.title = title;
        this.type = type;
    }

    /**
     * 构造出一份由用户作答过的试卷，带有额外参数
     * @param title 试卷标题
     * @param request 上一个页面的请求，带有用户的作答参数
     * @param userName 用户名，用户未登录则为null
     * @throws SQLException
     */
    public Paper(String title, HttpServletRequest request, String userName) throws SQLException {
        wrongCount = 0;
        this.title = title;
        loadExerciseList();
        for (Exercise exercise : exerciseList) {
            // 根据题目的id查找request的对应参数，得到用户选择的选项，再赋值给对应的Exercise对象，并判断正误，并保存错题
            exercise.setUserCheck(this, request.getParameter(Integer.toString(exercise.getId())), userName);
        }
    }

    /**
     * 根据标题从数据库载入试卷的所有题目
     * @throws SQLException
     */
    private void loadExerciseList() throws SQLException {
        String sql = "select * from exercises where paper_title='" + title + "'";
        Connection connection = DataProcess.getConnection();
        ResultSet resultSet = DataProcess.getResult(sql, connection);
        while (resultSet.next()) {
            exerciseList.add(new Exercise(resultSet.getInt("exercise_id"),
                resultSet.getString("exercise_title"),
                resultSet.getString("a_option"),
                resultSet.getString("b_option"),
                resultSet.getString("c_option"),
                resultSet.getString("d_option"),
                resultSet.getString("answer"),
                resultSet.getString("paper_title"),
                resultSet.getInt("difficulty"),
                resultSet.getString("analysis")));
        }
        resultSet.close();
        connection.close();
    }

    public List<Exercise> getExerciseList() {
        return exerciseList;
    }

    public void addWrongCount() {
        wrongCount ++;
    }

    public int getRightCount() {
        return exerciseList.size() - wrongCount;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
