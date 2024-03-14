/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ChannelDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Channel;

/**
 *
 * @author acer
 */
@WebServlet(name="AdminChannelController", urlPatterns={"/admin/channel"})
public class AdminChannelController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if(channel == null) {
            response.sendRedirect("/login");
            return;
        }
        if(!channel.isAdmin()) {
            response.sendRedirect("/");
            return;
        }

        ArrayList<Channel> channels = new ChannelDAO().getChannels();
        request.setAttribute("channels", channels);
        request.getRequestDispatcher("channel.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
