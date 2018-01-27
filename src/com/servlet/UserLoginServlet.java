package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.business.OrdinUser;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>非法</title></head>");
		out.println("<body bgcolor=\"#ffffff\">");
		out.println("<p>服务器忙 请稍后再来！</p>");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 如果此用户存在
		if(new OrdinUser(1, username, password).checkLegal())	{
			ses.setAttribute("username",username);			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");			
			requestDispatcher.forward(request,response);
		}else{
			ses.setAttribute("error","error");			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("failure.jsp");			
			requestDispatcher.forward(request,response);
		}
	}

}
