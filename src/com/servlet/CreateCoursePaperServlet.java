package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateCoursePaperServlet")
public class CreateCoursePaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String title = request.getParameter("title");

        String sql = "insert into papers(paper_title,paper_type,course_id)values('" + title + "','upload','" + id + "')";
        DataProcess.updateDatabase(sql);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacher_course.jsp?id=" + id);
        requestDispatcher.forward(request,response);
    }
}
