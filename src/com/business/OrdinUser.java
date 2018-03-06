package com.business;

import com.DBQuery.DataProcess;
import com.sun.jmx.remote.util.OrderClassLoaders;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 继承User，描述普通用户
 */
public class OrdinUser extends User {

    // 用户的错题或收藏列表，一般情况只会要求显示收藏或错题其中之一，故只定义一个List
    private List<Exercise> exerciseList;
    private List<Course> courseList;
    private List<Integer> courseIdList;

    public OrdinUser() {
        super();
    }

    public OrdinUser(int id) {
    }

    public OrdinUser(String userName) {
        super(userName);
        this.id = DataProcess.findUserId(userName);
        courseList = new ArrayList<>();
        String sql = "select * from user_course where user_id=" + id;
        courseIdList = new ArrayList<>();
        DataProcess.loadCourseIdList(sql, courseIdList);
        for (int courseId : courseIdList) {
            courseList.add(new Course(courseId));
        }
    }

    /**
     * 构造用户的收藏试题或错题
     * @param userName 用户名
     * @param collectionType mistakes表示错题;collection表示收藏
     */
    public OrdinUser(String userName, String collectionType) {
        super(userName);
        exerciseList = new ArrayList<>();
        String sql = "select * from " + collectionType + " where username='" + this.userName + "'";
        Connection connection = DataProcess.getConnection();
        try {
            ResultSet resultSet = DataProcess.getResult(sql, connection);
            while (resultSet.next()) {
                Exercise exercise = new Exercise(resultSet.getInt("exercise_id"));
                exercise.loadExerciseById();
                exerciseList.add(exercise);
            }
            resultSet.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public OrdinUser(int id, String userName, String passWord) {
        super(id, userName, passWord);
    }

    /**
     * 根据用户名，密码，用户类型判断是否合法
     * @return 合法true
     */
    public boolean checkLegal() {
        String sql = "select count(*) from users where username='" + userName + "' and password='" + passWord +
                "' and type='user'";
        int count = Integer.parseInt(DataProcess.getSingleResult(sql, "count(*)"));
        return count > 0;
    }

    public List<Exercise> getExerciseList() {
        return exerciseList;
    }

    /**
     * 用户收藏题目，并删除数据库中重复记录
     * @param exerciseId 要收藏的题目的id序号
     */
    public void collection(String exerciseId) {
        String sql = "insert into collection(exercise_id,username)values('" + exerciseId + "','" + userName + "')";
        DataProcess.updateDatabase(sql);
        String arrangementSql = "delete from collection where(exercise_id,username) in (select exercise_id,username " +
                "from(select exercise_id,username from collection group by exercise_id,username having count(*)>1) " +
                "s1) and id not in(select id from (select id from collection group by exercise_id,username having " +
                "count(*)>1) s2)";
        DataProcess.updateDatabase(arrangementSql);
    }

    public void setExerciseList(List<Exercise> exerciseList) {
        this.exerciseList = exerciseList;
    }

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }
}
