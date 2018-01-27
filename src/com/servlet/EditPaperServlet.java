package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBQuery.DataProcess;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class EditPaperServlet
 */
@WebServlet("/EditPaperServlet")
public class EditPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPaperServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
	    response.setContentType("text/html");  
	    response.setCharacterEncoding("utf-8");
	    request. setCharacterEncoding("UTF-8");
	    
		String[] exercise_title = request.getParameterValues("title");		
		String[] a_option = request.getParameterValues("option_a");
		String[] b_option = request.getParameterValues("option_b");
		String[] c_option = request.getParameterValues("option_c");
		String[] d_option = request.getParameterValues("option_d");
		String[] exercise_id = request.getParameterValues("exercise_id");
		String[] analysis = request.getParameterValues("analysis");
		
		if (exercise_title != null) {
			int n = 0;
			Connection con = DataProcess.getConnection();
			Statement state;
			while(n < exercise_title.length) {	
				String answer;
				String difficulty = request.getParameter("dif" + exercise_id[n]);
				answer = request.getParameter(exercise_id[n]);

				try {
					state = (Statement) con.createStatement();
					String sql = "update exercises set exercise_title='" + exercise_title[n]
							+ "', a_option='" + a_option[n]
							+ "', b_option='" + b_option[n]
							+ "', c_option='" + c_option[n]
							+ "', d_option='" + d_option[n]
							+ "', answer='" + answer 
							+ "', difficulty='"+ difficulty 
							+ "', analysis='" + analysis[n] + "' where exercise_id='" + exercise_id[n] + "'";
					state.executeUpdate(sql);
					state.close();				
				} catch (SQLException e) {
					e.printStackTrace();
				}
				n ++;
			}
			
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");			
		requestDispatcher.forward(request,response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
