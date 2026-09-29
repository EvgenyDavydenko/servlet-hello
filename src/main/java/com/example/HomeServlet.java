package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Получаем данные браузера
        String userAgent = req.getHeader("user-agent");

        String serverName = req.getServerName();
        int serverPort = req.getServerPort();
        
        // Кладем данные в request, чтобы JSP мог их забрать
        req.setAttribute("ua", userAgent);
        req.setAttribute("serverInfo", serverName + ":" + serverPort);
        
        // Передаем управление на JSP (View)
        // Forward сохраняет атрибуты request, в отличие от redirect
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }
}