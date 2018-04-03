package com.business;

import cn.superman.sandbox.core.RequestQueue;
import cn.superman.sandbox.core.ResponseQueue;
import cn.superman.sandbox.core.Sandbox;
import cn.superman.sandbox.dto.Request;
import com.DBQuery.DataProcess;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 描述一套试卷的类
 */
public class Paper {

    private int id; // 数据库自增id
    private String title; // 试卷的标题
    private String type; // 试卷的类型
    private int courseId; // 对应的课程id
    private List<Exercise> exerciseList = new ArrayList<>(); // 试卷包含的试题
    private int wrongCount; // 用户在此试题卷答错的提数
    private int checkCount;
    private List<String> userProgram;

    public Paper(){}

    /**
     * 构造出一份试卷并包含所有试题
     * @param title 试卷标题
     */
    public Paper(String title) {
        this.title = title;
        loadExerciseList();
    }

    public Paper(int id) {
        this.id = id;
        loadExerciseList();
        loadTitle();
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
     * @param id 试卷id
     * @param request 上一个页面的请求，带有用户的作答参数
     * @param userName 用户名，用户未登录则为null
     */
    public Paper(int id, HttpServletRequest request, String userName) {
        wrongCount = 0;
        checkCount = 0;
        this.id = id;
        loadExerciseList();
        for (Exercise exercise : exerciseList) {
            // 根据题目的id查找request的对应参数，得到用户选择的选项，再赋值给对应的Exercise对象，并判断正误，并保存错题
            exercise.setUserCheck(this, request.getParameter(Integer.toString(exercise.getId())), userName);
        }
        userProgram = new ArrayList<>();
        for (Program program : getProgramList()) {
            userProgram.add(request.getParameter("code" + program.getProgramId()));
        }
        // TODO 在此处判断程序题正误然后存入数据库

        Sandbox sandbox = new Sandbox();
        RequestQueue requestQueue = new RequestQueue();
        ResponseQueue responseQueue = new ResponseQueue();
        Request codeRequest = new Request();
        codeRequest.setData(userProgram.get(0));
        codeRequest.setuserId(userName);
        codeRequest.setproblemID("1");
        try {
            RequestQueue.requestQueue.put(codeRequest);
            sandbox.startSandbox();
            responseQueue.startResponseQueue();
            requestQueue.startRequestQueue();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public Paper(int id, String title, String type, int courseId) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.courseId = courseId;
    }

    /**
     * 根据id从数据库载入试卷的所有题目
     */
    private void loadExerciseList()  {
        String sql = "select * from exercises where paper_id='" + id + "'";
        Connection connection = DataProcess.getConnection();
        ResultSet resultSet = DataProcess.getResult(sql, connection);
        try {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void loadTitle() {
        String sql = "select * from papers where paper_id=" + id;
        Connection con = DataProcess.getConnection();
        try {
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                title = rs.getString("paper_title");
                courseId = rs.getInt("course_id");
            }
            rs.close();
            s.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Paper> getFivePaperList(String type) {
        List<Paper> paperList = new ArrayList<>();
        String sql = "select * from papers where paper_type='" + type + "' limit 5";
        DataProcess.loadPaperList(sql, paperList);
        return paperList;
    }

    public List<Exercise> getExerciseList() {
        return exerciseList;
    }

    public List<Program> getProgramList() {
        String sql = "select * from program where paper_id=" + id + " order by program_type";
        return DataProcess.getProgramList(sql);
    }

    public String getResultArray() {
        StringBuilder str = new StringBuilder();
        for (Exercise exercise : exerciseList) {
            if (exercise.isCorrect()) {
                str.append("1 ");
            } else {
                str.append("0 ");
            }
        }
        return str.toString();
    }

    public void addWrongCount() {
        wrongCount ++;
    }

    public void addCheckCount() {
        checkCount ++;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public void setExerciseList(List<Exercise> exerciseList) {
        this.exerciseList = exerciseList;
    }

    public int getWrongCount() {
        return wrongCount;
    }

    public List<String> getUserProgram() {
        return userProgram;
    }

    public void setUserProgram(List<String> userProgram) {
        this.userProgram = userProgram;
    }

    public int getCheckCount() {
        return checkCount;
    }

    public void setCheckCount(int checkCount) {
        this.checkCount = checkCount;
    }

    public void setWrongCount(int wrongCount) {
        this.wrongCount = wrongCount;
    }
}
