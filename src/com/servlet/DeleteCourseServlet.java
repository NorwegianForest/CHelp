package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");
        String courseId = request.getParameter("course_id");
        String sql = "delete from course where id=" + courseId;
        DataProcess.updateDatabase(sql);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacher_personal.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
