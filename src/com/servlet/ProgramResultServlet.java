package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "ProgramResultServlet")
public class ProgramResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request. setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter pw = response.getWriter();

        String userProgramId = request.getParameter("user_program_id");

        String sql = "select * from user_program where id=" + userProgramId;
        String state = null;
        Connection con = DataProcess.getConnection();
        try {
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                state = rs.getString("state");
            }
            rs.close();
            s.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        pw.print(state);
        pw.flush();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
