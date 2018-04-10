package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterTeacherServlet")
public class RegisterTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String university = request.getParameter("university");
        String title = request.getParameter("title");
        String introduce = request.getParameter("introduce");

        String sql = "update users set name='" + name + "', university='" + university + "', title='" + title
                + "', introduce='" + introduce + "', status='teacher' where username='" + username + "'";
        DataProcess.updateDatabase(sql);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacher_personal.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
