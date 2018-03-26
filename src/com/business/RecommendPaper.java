package com.business;

import com.DBQuery.DataProcess;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RecommendPaper {

    private String username;
    private List<Exercise> exerciseList; // 试卷包含的试题
    private List<Integer> mistakeList; // 错题
    private List<Integer> selectedList;
    private int wrongCount; // 用户在此试题卷答错的提数
    private int checkCount;
    private int type;

    public RecommendPaper() {

    }

    public RecommendPaper(String username) {
        this.username = username;
        if (this.username == null || this.username.equals("")) {
            type = 1;
        } else {
            mistakeList = new ArrayList<>();
            String sql = "select * from mistakes where username='" + username + "'";
            Connection con = DataProcess.getConnection();
            Statement s = null;
            ResultSet rs = null;
            try {
                if (con != null) {
                    s = con.createStatement();
                }
                if (s != null) {
                    rs = s.executeQuery(sql);
                    while (rs.next()) {
                        mistakeList.add(rs.getInt("exercise_id"));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) {
                    rs.close();
                }
                if (s != null) {
                    s.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            chooseType();
        }
        loadExerciseList();
    }

    public RecommendPaper(String []list, HttpServletRequest request) {
        exerciseList = new ArrayList<>();
        for (String id : list) {
            String sql = "select * from exercises where exercise_id=" + id;
            Connection con = DataProcess.getConnection();
            Statement s = null;
            ResultSet rs = null;
            try {
                if (con != null) {
                    s = con.createStatement();
                }
                if (s != null) {
                    rs = s.executeQuery(sql);
                    while (rs.next()) {
                        exerciseList.add(new Exercise(rs.getInt("exercise_id"),
                                rs.getString("exercise_title"),
                                rs.getString("a_option"),
                                rs.getString("b_option"),
                                rs.getString("c_option"),
                                rs.getString("d_option"),
                                rs.getString("answer"),
                                rs.getString("paper_title"),
                                rs.getInt("difficulty"),
                                rs.getString("analysis")));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) {
                    rs.close();
                }
                if (s != null) {
                    s.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        wrongCount = 0;
        checkCount = 0;

        Paper paper = new Paper();
        for (Exercise exercise : exerciseList) {
            // 根据题目的id查找request的对应参数，得到用户选择的选项，再赋值给对应的Exercise对象，并判断正误，并保存错题
            exercise.setUserCheck(paper, request.getParameter(Integer.toString(exercise.getId())), null);
        }
        wrongCount = paper.getWrongCount();
        checkCount = paper.getCheckCount();
    }

    private void chooseType() {
        int count1 = 0;
        int count2 = 0;
        int count3 = 0;
        for (Integer integer : mistakeList) {
            if (getExerciseType(integer) == 1) {
                count1++;
            } else if (getExerciseType(integer) == 2) {
                count2++;
            } else if (getExerciseType(integer) == 3) {
                count3++;
            }
        }
        type = 1;
        if (count1 < count2) {
            type = 2;
            if (count2 < count3) {
                type = 3;
            }
        } else {
            if (count1 < count3) {
                type = 3;
            }
        }
    }

    private int getExerciseType(int exercise_id) {
        int type = 0;
        String sql = "select * from exercises where exercise_id=" + exercise_id;
        Connection con = DataProcess.getConnection();
        Statement s = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                s = con.createStatement();
            }
            if (s != null) {
                rs = s.executeQuery(sql);
                if (rs.next()) {
                    type = rs.getInt("type");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs != null) {
                rs.close();
            }
            if (s != null) {
                s.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return type;
    }

    private void loadExerciseList() {
        exerciseList = new ArrayList<>();
        String sql = "select * from exercises where type=" + type + " order by rand() limit 10";
        Connection con = DataProcess.getConnection();
        Statement s = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                s = con.createStatement();
            }
            if (s != null) {
                rs = s.executeQuery(sql);
                selectedList = new ArrayList<>();
                while (rs.next()) {
                    selectedList.add(rs.getInt("exercise_id"));
                    exerciseList.add(new Exercise(rs.getInt("exercise_id"),
                            rs.getString("exercise_title"),
                            rs.getString("a_option"),
                            rs.getString("b_option"),
                            rs.getString("c_option"),
                            rs.getString("d_option"),
                            rs.getString("answer"),
                            rs.getString("paper_title"),
                            rs.getInt("difficulty"),
                            rs.getString("analysis")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs != null) {
                rs.close();
            }
            if (s != null) {
                s.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getSelectedStr() {
        StringBuilder builder = new StringBuilder();
        for (Integer integer : selectedList) {
            builder.append(integer).append(" ");
        }
        return builder.toString();
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Exercise> getExerciseList() {
        return exerciseList;
    }

    public void setExerciseList(List<Exercise> exerciseList) {
        this.exerciseList = exerciseList;
    }

    public List<Integer> getMistakeList() {
        return mistakeList;
    }

    public void setMistakeList(List<Integer> mistakeList) {
        this.mistakeList = mistakeList;
    }

    public int getWrongCount() {
        return wrongCount;
    }

    public void setWrongCount(int wrongCount) {
        this.wrongCount = wrongCount;
    }

    public int getCheckCount() {
        return checkCount;
    }

    public void setCheckCount(int checkCount) {
        this.checkCount = checkCount;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
