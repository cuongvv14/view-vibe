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
@WebServlet(name="RegisterController", urlPatterns={"/register"})
public class RegisterController extends HttpServlet {
    private static final String USER_EXIST_MSG = "Account exist, please login!";
    private static final String MISSING_INFO_MSG = "Please fill infomation!";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        Channel currChannel = (Channel) request.getSession().getAttribute("user");
        if(currChannel != null) {
            response.sendRedirect("/");
            return;
        }
        request.getRequestDispatcher("register.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        Channel currChannel = (Channel) request.getSession().getAttribute("user");
        
        if(currChannel != null) {
            response.sendRedirect("/");
            return;
        }
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String channelName = request.getParameter("channelName");
        
        Channel registerChannel = new ChannelDAO().getChannelByUsername(username);
        
        if(registerChannel != null) {
            request.getSession().setAttribute("user", null);
            request.setAttribute("message", USER_EXIST_MSG);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if(username.isEmpty() || password.isEmpty() || channelName.isEmpty()) {
            request.getSession().setAttribute("user", null);
            request.setAttribute("message", MISSING_INFO_MSG);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        Channel newChannel = new ChannelDAO().register(username, password, channelName);
        request.getSession().setAttribute("user", newChannel);
        response.sendRedirect("/");
    }


}
