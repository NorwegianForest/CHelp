package com.DBQuery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataProcess {
	/**
	 * 涉及数据库的各种操作
	 */
	DataProcess(){}

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
}
