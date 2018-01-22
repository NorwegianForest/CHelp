package com.taglib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.DBQuery.DataProcess;

public class SimulationTag extends TagSupport {
	/**
	 * 用来在主页、管理页面输出模拟试题、真题列表链接
	 * method属性是链接名
	 * count为输出链接的最大数量
	 */
	private static final long serialVersionUID = 1L;
	
	private String method;
	private String type;
	private String count;
	
	public void setMethod(String method) {
		this.method = method;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setCount(String count) {
		this.count = count;
	}

	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		String sql = "select * from simulation where exam_type='" + type + "'";
		Connection con = DataProcess.getConnection();
		ResultSet rs = DataProcess.getResult(sql, con);
		
		int max = Integer.parseInt(count);
		int n = 0;
		
		try {
			out.print("<table align=left>");
			while (rs.next() && n < max) {
				String title = rs.getString("title");
				out.print("<tr><td><a href=\"" + method + ".jsp?title=" + title + "\">" + title + "</a></td></tr>");
				n ++;
			}
			out.print("</table>");
			rs.close();
			con.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
}
