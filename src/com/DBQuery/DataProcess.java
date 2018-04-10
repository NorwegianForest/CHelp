package com.DBQuery;

import com.business.*;

import javax.swing.plaf.nimbus.State;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		Connection connection = getConnection();
		Statement statement = null;
		try {
			if (connection != null) {
				statement = connection.createStatement();
				statement.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (statement != null) {
				statement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//	public static void updateDatabase(String sql) {
//		Connection con = DataProcess.getConnection();
//		try {
//			Statement state = con.createStatement();
//			state.executeUpdate(sql);
//			state.close();
//			con.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

	/**
	 * 判断某数据表的某字段中，是否存在这条记录
	 * @param tableName 数据表名
	 * @param fieldName 字段名
	 * @param record 要查找的字段内容
	 * @return 存在返回true，不存在返回false
	 */
	public static boolean isExist(String tableName, String fieldName, String record) {
		String sql = "select * from " + tableName + " where " + fieldName + "='" + record + "'";
		return isExist(sql);
	}

	public static boolean isExist(String sql) {
		Connection con = getConnection();
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

	/**
	 * 通过sql语句查找教师信息
	 * @param sql 查询语句
	 * @param teacher 教师用户对象
	 */
	public static void findTeacher(String sql, TeacherUser teacher) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				teacher.setId(rs.getInt("id"));
				teacher.setUniversity(rs.getString("university"));
				teacher.setName(rs.getString("name"));
				teacher.setTitle(rs.getString("title"));
				teacher.setIntroduce(rs.getString("introduce"));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过用户名查找对应的id
	 * @param username 用户名
	 * @return
	 */
	public static int findUserId(String username) {
	    int userId = -1;
	    if (username != null) {
			String sql = "select * from users where username='" + username + "'";
			Connection con = getConnection();
			try {
				Statement s = con.createStatement();
				ResultSet rs = s.executeQuery(sql);
				rs.next();
				userId = rs.getInt("id");
				rs.close();
				s.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userId;
	}

	/**
	 * 根据教师用户id加载所开课程
     * @param sql 查询语句
	 * @param courseList 课程列表对象
	 */
	public static void loadCourseList(String sql, List<Course> courseList) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				courseList.add(new Course(rs.getInt("id"),
						rs.getString("title"),
						rs.getString("start_date"),
						rs.getString("end_date"),
						rs.getString("introduce"),
						rs.getString("img_url"),
						rs.getInt("teacher_id")));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void loadVideoList(String sql, List<Video> videoList) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				videoList.add(new Video(rs.getString("order_number"),
						rs.getString("video_title"),
						rs.getString("youku_path"),
						rs.getString("img_url"),
						rs.getString("time")));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据课程id加载课程其他数据
	 * @param id 课程id
	 * @param course 课程对象
	 */
	public static void loadCourse(int id, Course course) {
		String sql = "select * from course where id=" + id;
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			rs.next();
			course.setTitle(rs.getString("title"));
			course.setStartDate(rs.getString("start_date"));
			course.setEndDate(rs.getString("end_date"));
			course.setIntroduce(rs.getString("introduce"));
			course.setImgUrl(rs.getString("img_url"));
			course.setTeacherId(rs.getInt("teacher_id"));
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 加载课程的试题列表
     * @param sql 查询语句
	 * @param paperList 试题对象列表
	 */
	public static void loadPaperList(String sql, List<Paper> paperList) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				paperList.add(new Paper(rs.getInt("paper_id"),
						rs.getString("paper_title"),
						rs.getString("paper_type"),
						rs.getInt("course_id")));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void loadMaterialList(String sql, List<Material> materialList) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				materialList.add(new Material(rs.getString("materials_title"),
						rs.getString("file_name")));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static TeacherUser findTeacher(int teacherId) {
		String sql = "select * from users where id=" + teacherId;
		TeacherUser teacherUser = null;
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				teacherUser = new TeacherUser();
				teacherUser.setId(rs.getInt("id"));
				teacherUser.setUserName(rs.getString("username"));
				teacherUser.setUniversity(rs.getString("university"));
				teacherUser.setName(rs.getString("name"));
				teacherUser.setTitle(rs.getString("title"));
				teacherUser.setIntroduce(rs.getString("introduce"));
			}
			rs.close();
			s.close();
			con.close();
			return teacherUser;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<Video> getVideoList(int page) {
		List<Video> videoList = new ArrayList<>();
		int count = 30;
		String from = Integer.toString(1 + count * (page - 1));
		String to = Integer.toString(count * page);
		String sql = "select * from videos where order_number between '" + from + "' and '" + to + "' order by order_number";
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				videoList.add(new Video(rs.getString("order_number"),
						rs.getString("video_title"),
						rs.getString("youku_path"),
						rs.getString("img_url"),
						rs.getString("time")));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return videoList;
	}

	public static void loadCourseIdList(String sql, List<Integer> courseIdList) {
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				courseIdList.add(rs.getInt("course_id"));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Course findCourse(String sql) {
	    Course course = null;
	    Connection con = getConnection();
	    try {
	    	Statement s = con.createStatement();
	    	ResultSet rs = s.executeQuery(sql);
	    	rs.next();
	    	course = new Course(rs.getInt("id"),
					rs.getString("title"),
					rs.getString("start_date"),
					rs.getString("end_date"),
					rs.getString("introduce"),
					rs.getString("img_url"),
					rs.getInt("teacher_id"));
	    	rs.close();
	    	s.close();
	    	con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return course;
	}

	public static List<Program> getProgramList(String sql) {
		List<Program> programList = new ArrayList<>();
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				programList.add(new Program(rs.getInt("program_id"),
						rs.getString("program_title"),
						rs.getString("program_code"),
						rs.getString("program_answer"),
						rs.getString("program_analysis"),
						rs.getInt("program_type"),
						rs.getInt("paper_id")));
			}
			rs.close();
			s.close();
			con.close();
			return programList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int getCount(String sql) {
		int count = 0;
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static int getTestId(String sql) {
		int testId = -1;
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				testId = rs.getInt("id");
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return testId;
	}

	public static String getPaperTitle(int paperId) {
		String sql = "select * from papers where paper_id=" + paperId;
		String title = null;
		Connection con = getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				title = rs.getString("paper_title");
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return title;
	}

	public static void loadTestList(String sql, List<Test> testList) {
		Connection con = DataProcess.getConnection();
		try {
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				testList.add(new Test(
						rs.getInt("id"),
						rs.getInt("user_id"),
						rs.getInt("paper_id"),
						rs.getString("test_date")
				));
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static String getUsername(int userId) {
	    String username = null;
	    String sql = "select * from users where id=" + userId;
	    Connection con = getConnection();
	    try {
	    	Statement s = con.createStatement();
	    	ResultSet rs = s.executeQuery(sql);
	    	if (rs.next()) {
	    		username = rs.getString("username");
			}
			rs.close();
	    	s.close();
	    	con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return username;
	}
}
