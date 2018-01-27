package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBQuery.DataProcess;

/**
 * Servlet implementation class CreatePaperServlet
 */
@WebServlet("/CreatePaperServlet")
public class CreatePaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePaperServlet() {
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
	    
	    String paper_title = request.getParameter("paper_title");
	    String paper_type = (String) request.getSession().getAttribute("paper_type");	    
	    
	    if (DataProcess.isExist("papers", "paper_title", paper_title)) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("error_simulation_exist.jsp");			
			requestDispatcher.forward(request,response); 	    		    	
	    }
	    else {
	    	String sql = "insert into papers(paper_title,paper_type)values('" + paper_title + "','" + paper_type + "')";
	    	DataProcess.updateDatabase(sql);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
			requestDispatcher.forward(request,response);
	    }	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
