package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/JoinCourseServlet")
public class JoinCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request. setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String courseId = request.getParameter("course_id");

        if (username == null || username.equals("null")) {
            response.getWriter().print("<HTML><SCRIPT language=javascript>alert('请先登录...');location.href='user_login.jsp';</SCRIPT></HTML>");
        } else {
            int userId = DataProcess.findUserId(username);
            String sql = "insert into user_course(user_id,course_id)values('" + userId + "','" + courseId + "')";
            DataProcess.updateDatabase(sql);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("course.jsp?id=" + courseId);
            requestDispatcher.forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
