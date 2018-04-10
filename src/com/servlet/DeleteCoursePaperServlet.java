package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteCoursePaperServlet")
public class DeleteCoursePaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request. setCharacterEncoding("UTF-8");

        String paperId = request.getParameter("paper_id");
        String courseId = request.getParameter("course_id");

        String sql = "delete from papers where paper_id=" + paperId;
        DataProcess.updateDatabase(sql);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacher_create_paper.jsp?id=" + courseId);
        requestDispatcher.forward(request,response);
    }
}
