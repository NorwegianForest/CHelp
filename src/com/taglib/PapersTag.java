package com.taglib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.DBQuery.DataProcess;

public class PapersTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String paper_type;
	private String view_type;
	private String count;
	private Object key_word;

	public void setPaper_type(String paper_type) {//����ȱ
		this.paper_type = paper_type;
	}	
	
	public void setView_type(String view_type) {
		this.view_type = view_type;
	}
	
	public void setCount(String count) {
		this.count = count;
	}

	public void setKey_word(Object key_word) throws JspException {
		this.key_word = key_word.toString();
	}

	public int doEndTag() throws JspException {
		
		JspWriter out = pageContext.getOut();

        try {
        	String strSql = new String("select * from papers where paper_type='" + paper_type + "'");
        	if (key_word != null) {
        		strSql = strSql + " and paper_title like '%" + key_word + "%'";
        	}

        	Connection con = DataProcess.getConnection();
        	ResultSet rs = DataProcess.getResult(strSql, con);
        	
        	int max = Integer.parseInt(count);
        	int countNumber = 0;
        	out.print("<table align=left>");
			while(rs.next() && countNumber < max) {
				String paper_title = rs.getString("paper_title");
				out.print("<tr><td>&nbsp;&nbsp;<a href=\"" + view_type + ".jsp?paper_title=" + paper_title +"\">" + paper_title +"</a></td></tr>");
				countNumber++;
			}
			if (countNumber == 0) {
				out.print("<tr><td>无结果</td></tr>");
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
