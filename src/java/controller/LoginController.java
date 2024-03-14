/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChannelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Channel;

/**
 *
 * @author acer
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("");
            return;
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Channel channel = new ChannelDAO().getChannelByUsername(username);

        if (channel == null) {
            request.getSession().setAttribute("user", null);
            request.setAttribute("message", "Invalid account!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!channel.getPassword().equals(password)) {
            request.getSession().setAttribute("user", null);
            request.setAttribute("message", "Invalid password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        request.getSession().setAttribute("user", channel);
        if(channel.isAdmin()) {
            response.sendRedirect("/admin");
            return;
        }
        response.sendRedirect("/");
    }

}
