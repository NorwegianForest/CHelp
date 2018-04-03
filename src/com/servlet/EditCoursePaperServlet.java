package com.servlet;

import com.DBQuery.DataProcess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditCoursePaperServlet")
public class EditCoursePaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request. setCharacterEncoding("UTF-8");

        String paperId = request.getParameter("paper_id");
        String deleteId = request.getParameter("delete_id");
        String add = request.getParameter("add");
        String paperTitle = request.getParameter("title");
        String[] exerciseId = request.getParameterValues("exercise_id");

        String sql = "update papers set paper_title='" + paperTitle + "' where paper_id=" + paperId;
        DataProcess.updateDatabase(sql);
        sql = "update exercises set paper_title='" + paperTitle + "' where paper_id=" + paperId;
        DataProcess.updateDatabase(sql);

        for (String id : exerciseId) {
            String title = request.getParameter("tit" + id);
            String aOption = request.getParameter("opa" + id);
            String bOption = request.getParameter("opb" + id);
            String cOption = request.getParameter("opc" + id);
            String dOption = request.getParameter("opd" + id);
            String answer = request.getParameter("ans" + id);
            String analysis = request.getParameter("ana" + id);
            sql = "update exercises set exercise_title='" + title
                    + "', a_option='" + aOption
                    + "', b_option='" + bOption
                    + "', c_option='" + cOption
                    + "', d_option='" + dOption
                    + "', answer='" + answer
                    + "', analysis='" + analysis + "' where exercise_id=" + id;
            DataProcess.updateDatabase(sql);
        }

        if (!deleteId.equals("0")) {
            sql = "delete from exercises where exercise_id=" + deleteId;
            DataProcess.updateDatabase(sql);
        }

        if (add.equals("1")) {
            sql = "insert into exercises(answer,paper_id,paper_title)values('A','" + paperId + "','" + paperTitle + "')";
            DataProcess.updateDatabase(sql);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit_course_paper.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
