package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CollectionServlet")
public class CollectionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");

        String exerciseId = request.getParameter("exercise_id");
        String username = request.getParameter("username");

        if (username != null && !username.equals("") && !username.equals("null")) {
            String sql = "select count(*) from collection where exercise_id=" + exerciseId + " and username='" + username + "'";
            int count = DataProcess.getCount(sql);
            if (count == 0) {
                sql = "insert into collection(exercise_id,username)values(" + exerciseId + ",'" + username + "')";
                DataProcess.updateDatabase(sql);
            } else if (count == 1) {
                sql = "delete from collection where exercise_id=" + exerciseId + " and username='" + username + "'";
                DataProcess.updateDatabase(sql);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
