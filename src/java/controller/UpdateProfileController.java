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
@WebServlet(name="UpdateProfileController", urlPatterns={"/profile/update"})
public class UpdateProfileController extends HttpServlet {

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
        String username = request.getParameter("username");
        String channelName = request.getParameter("channelName");
        String description = request.getParameter("description");
        String avatar = request.getParameter("avatar");
        
        channel.setUsername(username);
        channel.setChannelName(channelName);
        channel.setDescription(description);
        if(avatar == null || avatar.isEmpty()) {
            avatar = null;
        } else {
            channel.setAvatar(avatar);
        }
        new ChannelDAO().updateProfile(username, channelName, description, avatar, channel.getId());
        
    }
}
