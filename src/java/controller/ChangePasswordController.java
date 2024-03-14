/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChannelDAO;
import dao.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Channel;
import model.Video;

/**
 *
 * @author acer
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/change-password"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if (channel == null) {
            response.sendRedirect("login");
            return;
        }
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        ArrayList<Video> videos = new VideoDAO().getVideoByChannel(channel.getUsername());
        request.setAttribute("videos", videos);

        if (!oldPassword.equals(channel.getPassword())) {
            request.setAttribute("errorMsg", "Old password incorrect!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMsg", "New password does not match!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        new ChannelDAO().updatePassword(newPassword, channel.getId());
        channel.setPassword(newPassword);
        request.getSession().setAttribute("user", channel);
        request.setAttribute("successMsg", "Change password successfully!");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

}
