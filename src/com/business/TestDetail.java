package com.business;

import com.DBQuery.DataProcess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TestDetail {
    private int id;
    private int testId;
    private int exerciseId;
    private String option;
    private int correct;
    private String paperTitle;
    private Exercise exercise;

    public TestDetail(int id, int testId, int exerciseId, String option, int correct) {
        this.id = id;
        this.testId = testId;
        this.exerciseId = exerciseId;
        this.option = option;
        this.correct = correct;
        this.exercise = new Exercise(exerciseId);
        this.exercise.loadExerciseById();
        this.paperTitle = this.exercise.getPaperTitle();
    }

    public static List<TestDetail> getDetailList(int testId) {
        List<TestDetail> detailList = new ArrayList<>();
        String sql = "select * from test_detail where test_id=" + testId;
        Connection con = DataProcess.getConnection();
        try {
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                detailList.add(new TestDetail(
                        rs.getInt("id"),
                        rs.getInt("test_id"),
                        rs.getInt("exercise_id"),
                        rs.getString("option"),
                        rs.getInt("correct")
                ));
            }
            rs.close();
            s.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailList;
    }

    public String getBackground(String option) {
        String background = "";
        if (this.option.equals(option)) {
            if (correct == 0) {
                background = " style='background-color: #FF4040;'";
            } else if (correct == 1) {
                background = " style='background-color: #7CCD7C;'";
            }
        }
        return background;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public int getCorrect() {
        return correct;
    }

    public void setCorrect(int correct) {
        this.correct = correct;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }
}
