package controller.common;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.*;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})

public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //gọi ra dữ liệu của phiên người dùng hiện tại
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("user");
        int userId = u.getUserId();

        QuizDAO qd = new QuizDAO();
        List<Quiz> list = new ArrayList<>();
        List<Quiz> listQ = new ArrayList<>();

        if (u.getRoleId() == 2) {
            list = qd.getQuizByQuestionerId(userId);
        } else if (u.getRoleId() == 3) {
            list = qd.getQuizPublic();
        }

        String strTopicId = request.getParameter("topicId");
        if (strTopicId == null) {
            listQ = list;
        } else {
            int topicId = Integer.parseInt(strTopicId);
            for (Quiz q : list) {
                if (q.getTopicId() == topicId) {
                    listQ.add(q);
                }
            }
        }
        request.setAttribute("listQ", listQ);

        TopicDAO td = new TopicDAO();
        List<Topic> listT = td.getAllTopic();
        request.setAttribute("listT", listT);

        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String txt = request.getParameter("txt");
        //gọi ra dữ liệu của phiên người dùng hiện tại
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("user");
        int userId = u.getUserId();

        QuizDAO qd = new QuizDAO();
        List<Quiz> list = new ArrayList<>();
        List<Quiz> listQ = new ArrayList<>();
        if (u.getRoleId() == 2) {
            list = qd.getQuizByQuestionerId(userId);
            for (Quiz q : list) {
                if (q.getQuizName().toLowerCase().contains(txt.toLowerCase())) {
                    listQ.add(q);
                }
            }
        } else if (u.getRoleId() == 3) {
            list = qd.getQuizPublic();
            for (Quiz q : list) {
                if (q.getQuizName().toLowerCase().contains(txt.toLowerCase())) {
                    listQ.add(q);
                }
            }
        }
        request.setAttribute("listQ", listQ);

        TopicDAO td = new TopicDAO();
        List<Topic> listT = td.getAllTopic();
        request.setAttribute("listT", listT);

        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

}
