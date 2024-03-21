package controller.common;

import dao.*;
import model.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "QuizStatisticsServlet", urlPatterns = {"/statistics"})

public class QuizStatisticsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("user");
        int userId = u.getUserId();

        QuizStatisticsDAO qsttd = new QuizStatisticsDAO();
        List<QuizStatistics> list = new ArrayList<>();

        if (u.getRoleId() == 2) {
            list = qsttd.getQuizStatisticsForQuestioner(userId);
        } else if (u.getRoleId() == 3) {
            list = qsttd.getQuizStatisticsForAnswerer(userId);
        }

        TopicDAO td = new TopicDAO();
        List<Topic> listT = td.getAllTopic();
        request.setAttribute("listT", listT);
        
        request.setAttribute("list", list);
        request.getRequestDispatcher("quizStatistics.jsp").forward(request, response);

    }

}
