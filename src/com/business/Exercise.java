package com.business;

import com.DBQuery.DataProcess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 描述一道单选题，对应数据库exercises表
 */
public class Exercise {

    private int id;
    private String title; // 题目题干
    private String aOption;
    private String bOption;
    private String cOption;
    private String dOption; // ABCD选项
    private String answer; // 答案
    private String paperTitle; // 所属的试卷
    private int difficulty; // 难度
    private String analysis; // 试题解析
    private int userCheck; // 用户作答时选择的选项
    private boolean isCorrect; // 作答正误
    public static final String CORRECT = "正确";
    public static final String WRONG = "错误！正确答案："; // 用于在jsp页面显示

    public Exercise(int id) {
        this.id = id;
    }

    public Exercise(int id, String title, String aOption, String bOption, String cOption, String dOption, String answer, String paperTitle, int difficulty, String analysis) {
        this.id = id;
        this.title = title;
        this.aOption = aOption;
        this.bOption = bOption;
        this.cOption = cOption;
        this.dOption = dOption;
        this.answer = answer;
        this.paperTitle = paperTitle;
        this.difficulty = difficulty;
        this.analysis = analysis;
    }

    /**
     * 通过单参数构造的Exercise对象只有id一个参数吗，此方法用于补全对象的其他参数
     */
    public void loadExerciseById() {
        String sql = "select * from exercises where exercise_id='" + id + "'";
        Connection connection = DataProcess.getConnection();
        ResultSet resultSet = DataProcess.getResult(sql, connection);
        try {
            resultSet.next();
            title = resultSet.getString("exercise_title");
            aOption = resultSet.getString("a_option");
            bOption = resultSet.getString("b_option");
            cOption = resultSet.getString("c_option");
            dOption = resultSet.getString("d_option");
            answer = resultSet.getString("answer");
            paperTitle = resultSet.getString("paper_title");
            difficulty = resultSet.getInt("difficulty");
            analysis = resultSet.getString("analysis");
            resultSet.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置用户的选项并判断正误，错题自动保存
     * @param userCheck 用户的选项（ABCD），要先转换成1234再比较
     * @param userName 登录的用户名
     */
    public void setUserCheck(Paper paper, String userCheck, String userName) {
        this.userCheck = userCheck == null ? 0:Integer.parseInt(userCheck);
        if (this.userCheck != 0) {
            paper.addCheckCount();
        }
        isCorrect = parseAnswerToInt() == this.userCheck ? true : false; // 判断用户是否作答正确
        if (!isCorrect) { // 错误作答保存错题
            paper.addWrongCount();
            if (userName == null || "".equals(userName) || "null".equals(userName)) { // jsp页面有username参数才能保存错题
            } else {
                // 添加该用户错题进数据库
                String mistakesCollectionSql = "insert into mistakes(exercise_id,username)values('" + id + "','" + userName + "')";
                DataProcess.updateDatabase(mistakesCollectionSql);
                // 删除重复错题语句
                String arrangementSql = "delete from mistakes where(exercise_id,username) in (select exercise_id,username from(select exercise_id,username from mistakes group by exercise_id,username having count(*)>1) s1) and id not in(select id from (select id from mistakes group by exercise_id,username having count(*)>1) s2)";
                DataProcess.updateDatabase(arrangementSql);
            }
        }
    }

    /**
     * 将字符串类型的字母转换成数字
     * @return 1234对应ABCD
     */
    public int parseAnswerToInt() {
        switch (answer) {
            case "A": return 1;
            case "B": return 2;
            case "C": return 3;
            case "D": return 4;
            default: return 0;
        }
    }

    public String getCheck(int pos) {
        String check = "";
        if (pos == parseAnswerToInt()) {
            check = "checked";
        }
        return check;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public String getHTMLTitle() {
        return title.replaceAll(" ", "&nbsp;")
                .replaceAll("<", "&lt;").replaceAll("\n", "<br>");
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getaOption() {
        return aOption;
    }

    public String getbOption() {
        return bOption;
    }

    public String getcOption() {
        return cOption;
    }

    public String getdOption() {
        return dOption;
    }

    public String getAnswer() {
        return answer;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public int getUserCheck() {
        return userCheck;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public String getAnalysis() {
        return analysis;
    }
}
