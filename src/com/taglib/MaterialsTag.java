package com.taglib;

import com.DBQuery.DataProcess;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MaterialsTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String count;
	private String key_word;
	
	public void setCount(String count) {
		this.count = count;
	}
	
	public void setKey_word(Object key_word) {
		this.key_word = key_word.toString();
	}	
	
	public int doEndTag() {
		
		JspWriter out = pageContext.getOut();
		
		int max = Integer.parseInt(count);
		int countNumber = 0;
		String sql = "select * from materials ";
    	if (key_word != null) {
    		sql = sql + " where materials_title like '%" + key_word + "%'";
    	}
    	sql = sql + " order by order_number";
    	
		Connection con = DataProcess.getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while(rs.next() && countNumber < max) {
				out.print("&nbsp;&nbsp;<a href=\"materials.jsp?file_name=" + rs.getString("file_name") + "\" >" + rs.getString("materials_title") + "</a><br>");
				countNumber ++;
			}
			if (countNumber == 0) {
				out.print("无结果");
			}
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
