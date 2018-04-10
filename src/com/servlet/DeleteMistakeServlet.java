package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteMistakeServlet")
public class DeleteMistakeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");

        String exerciseId = request.getParameter("exercise_id");
        String username = request.getParameter("username");

        if (username != null && !username.equals("") && !username.equals("null")) {
            String sql = "delete from mistakes where exercise_id=" + exerciseId + " and username='" + username + "'";
            DataProcess.updateDatabase(sql);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
