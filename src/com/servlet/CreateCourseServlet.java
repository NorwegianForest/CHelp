package com.servlet;

import com.DBQuery.DataProcess;
import com.business.TeacherUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateCourseServlet")
public class CreateCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String title = request.getParameter("title");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String introduce = request.getParameter("introduce");

        int teacherId = new TeacherUser(username).getId();

        String sql = "insert into course(title,start_date,end_date,introduce,img_url,teacher_id)values('"
                + title + "','"
                + start + "','"
                + end + "','"
                + introduce + "','logo260.png','" + teacherId + "')";
        DataProcess.updateDatabase(sql);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacher_personal.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
