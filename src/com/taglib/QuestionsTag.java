package com.taglib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.DBQuery.DataProcess;

@SuppressWarnings("serial")
public class QuestionsTag extends TagSupport{
	public int doEndTag() {
		
		JspWriter out = pageContext.getOut();
		
        try {
        	String strSql = new String("select * from questions order by id");
        	Connection con = DataProcess.getConnection();
        	ResultSet rs = DataProcess.getResult(strSql, con);
        	out.print("<table align=left>");
			while(rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				out.print("<tr><td>&nbsp;&nbsp;<a href=\"chapter.jsp?id=" + id +"\">" + title +"</a></td></tr>");
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
