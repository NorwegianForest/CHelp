package com.taglib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.DBQuery.DataProcess;

public class VideosTag extends TagSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String page;	
	private String key_word;
	
	public void setPage(Object page) {
		this.page = page.toString();
	}

	public void setKey_word(Object key_word) throws JspException {
		this.key_word = key_word.toString();
	}
	
	public int doEndTag() throws JspException {
		
		JspWriter out = pageContext.getOut();
		
		String sql = "select * from videos ";
		if (key_word != null) {
			sql = sql + "where video_title like '%" + key_word + "%'";
		}
		
		sql = sql + " order by order_number";
		
		Connection con = DataProcess.getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			
			out.print("<table align=center width=900 style=\"border-collapse:separate; border-spacing:10px 60px;\" >");
			int col = 0;
			int row = 0;
			int pageNumber = Integer.parseInt(page);
			int count = 0;
			
			if (pageNumber > 1) {
				while (count < 20 * (pageNumber - 1)) {
					rs.next();
					count ++;
				}
			}
			
		  	while(rs.next() && row < 5) {
		  		if (col == 4) { // 一行4个
		  			col = 0;
		  		}
		  		
		  		if (col == 0) {
		  			out.print("<tr>");
		  		}
		  		out.print("<td align=center>");
		  		out.print("<a href=\'video.jsp?path=" + rs.getString("youku_path") + "\' ><img src=\"/images/timg (1).jpg\" alt=\"insert logo\" name=\"Insert_logo\" width=\"160\" height=\"120\" id=\"Insert_logo\" style=\"background-color: #B0C4DE; display:block;\" />" + rs.getString("video_title") + "</a>");
		  		out.print("</td>");
		  		if (col == 3) {
		  			out.print("</tr>");
		  			row ++;
		  		}
		  		
		  		col ++;
		  	}
		  	if (col == 0) {
		  		out.print("无结果");
		  	}
		  	out.print("</table>");
		  	rs.close();
		  	state.close();
		  	con.close();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return SKIP_BODY;
	}

}
