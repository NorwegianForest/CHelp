package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBQuery.DataProcess;


/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		
		if (DataProcess.isExist("users", "username", username)) {
			out.print("<SCRIPT language=javascript>alert('用户名已存在！');location.href='register.jsp';</SCRIPT>");
		} else if (!password.equals(confirm)) {
			out.print("<SCRIPT language=javascript>alert('确认密码错误！');location.href='register.jsp';</SCRIPT>");
		} else {
			String sql = "insert into users(username,password,type)values('" + username + "','" + password + "','user')";
			DataProcess.updateDatabase(sql);
			out.print("<SCRIPT language=javascript>alert('注册成功，请登录...');location.href='user_login.jsp';</SCRIPT>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
