package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Логика счетчика
        Integer visitCounter = (Integer) session.getAttribute("counter");
        if (visitCounter == null) {
            visitCounter = 1;
        } else {
            visitCounter++;
        }
        // Сохраняем обратно в сессию под тем же ключом "counter"
        session.setAttribute("counter", visitCounter);

        // Логика приветствия
        String username = req.getParameter("username");
        String greeting;
        
        if (username == null || username.trim().isEmpty()) {
            greeting = "Привет, Гость!";
        } else {
            greeting = "Привет, " + username + "!";
        }
        
        // Подготовка данных для View
        req.setAttribute("greeting", greeting);
        req.setAttribute("counter", visitCounter);
        
        // Перенаправляем на JSP
        RequestDispatcher dispatcher = req.getRequestDispatcher("hello.jsp");
        dispatcher.forward(req, resp);
    }
}