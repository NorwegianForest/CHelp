package com.business;

import com.DBQuery.DataProcess;

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
    private List<Exercise> exerciseList = new ArrayList<>();

    public OrdinUser(String userName) {
        super(userName);
    }

    /**
     * 构造用户的收藏试题或错题
     * @param userName 用户名
     * @param collectionType mistakes表示错题;collection表示收藏
     * @throws SQLException
     */
    public OrdinUser(String userName, String collectionType) throws SQLException {
        super(userName);
        String sql = "select * from " + collectionType + " where username='" + this.userName + "'";
        Connection connection = DataProcess.getConnection();
        ResultSet resultSet = DataProcess.getResult(sql, connection);
        while (resultSet.next()) {
            Exercise exercise = new Exercise(resultSet.getInt("exercise_id"));
            exercise.loadExerciseById();
            exerciseList.add(exercise);
        }
        resultSet.close();
        connection.close();
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
        return count > 0 ? true : false;
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
}
