package com.DBQuery;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 涉及数据库的各种操作，所有方法都是静态方法
 */
public class DataProcess {

	/**
	 * 连接到数据库，数据库名ctest2,用户名root,密码root
	 * 需要mysql的相关jar包的支持
	 * @return 连接的Connection对象
	 */
	public static Connection getConnection()	{
		String CLASSFORNAME="com.mysql.jdbc.Driver";	  
		String SERVANDDB = "jdbc:mysql://localhost:3306/ctest2?user=root&password=root&useUnicode=true&characterEncoding=gb2312";
		Connection con;
		try	{
			Class.forName(CLASSFORNAME);			
			con = DriverManager.getConnection(SERVANDDB);			
			return con;
		}catch(Exception e){
			e.printStackTrace();			
			return null;
		}
	}

	/**
	 * 获取ResultSet对象，根据给定的sql语句
	 * @param SQL 查询语句
	 * @param con Connection对象
	 * @return ResultSet对象
	 */
	public static ResultSet getResult(String SQL,Connection con){		
		ResultSet rs = null;		
		try{
			Statement stmt = con.createStatement();			
			rs = stmt.executeQuery(SQL);			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;		
	}

	/**
	 * 获取单一的查询结果
	 * @param sql 查询语句
	 * @param fieldName 要获取的字段名
	 * @return 查询结果字符串
	 */
	public static String getSingleResult(String sql, String fieldName) {
		String resultStr = null;
		Connection con = DataProcess.getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rs.next();
			resultStr = rs.getString(fieldName);
			rs.close();
			state.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultStr;
	}

	/**
	 * 执行一次sql更新语句
	 * @param sql 要执行的语句
	 */
	public static void updateDatabase(String sql) {
		Connection con = DataProcess.getConnection();
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
			state.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 判断某数据表的某字段中，是否存在这条记录
	 * @param tableName 数据表名
	 * @param fieldName 字段名
	 * @param record 要查找的字段内容
	 * @return 存在返回true，不存在返回false
	 */
	public static boolean isExist(String tableName, String fieldName, String record) {
		String sql = "select * from " + tableName + " where " + fieldName + "='" + record + "'";
		Connection con = DataProcess.getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			if (rs.next()) {
				rs.close();
				state.close();
				con.close();
				return true;
			}
			rs.close();
			state.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 在某表中查询一条指定记录，并返回记录中的其他字段的值
	 * @param tableName 数据表名
	 * @param fieldName 要检索的字段名
	 * @param record 与要检索的字段名对应的要检索的值
	 * @param columnName 要获取的字段名
	 * @return 要获取的字段名的值
	 */
	public static String query(String tableName, String fieldName, String record, String columnName) {
		String sql = "select * from " + tableName + " where " + fieldName + "='" + record + "'";
		Connection connection = DataProcess.getConnection();
		ResultSet resultSet = DataProcess.getResult(sql, connection);
		String queryResult = null;
		try {
			resultSet.next();
			queryResult = resultSet.getString(columnName);
			resultSet.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return queryResult;
	}

	/**
	 * 将ISO字符编码转为UTF-8
	 * 很多jsp页面在获取参数的时候，会有字符编码的问题，则需要用到此方法
	 * @param str 需要转码的字符串
	 * @return 转码后的UTF-8编码的字符串
	 */
	public static String transformToUTF8(String str) {
		try {
			return new String(str.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			return "";
		}
	}

	/**
	 * 添加一道各参数都是默认值的题目到指定试卷
	 * @param paperTitle 试卷名
	 */
	public static void addExercise(String paperTitle) {
		String sql = "insert into exercises(exercise_title, a_option, b_option, c_option, d_option, answer, " +
				"paper_title, difficulty, analysis)values('请输入题目','请输入A选项','请输入B选项','请输入C选项'," +
				"'请输入D选项','1','" + paperTitle + "','1','无解析')";
		DataProcess.updateDatabase(sql);
	}
}
