/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChannelDAO;
import dao.SubscribeDAO;
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
@WebServlet(name = "ChannelController", urlPatterns = {"/channel"})
public class ChannelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            Channel currChannel = (Channel) request.getSession().getAttribute("user");

            String username = request.getParameter("username");
            
            Channel channel = new ChannelDAO().getChannelByUsername(username);
            request.setAttribute("channel", channel);
            
            ArrayList<Video> videos = new VideoDAO().getVideoByChannel(username);
            request.setAttribute("videos", videos);
            
            int totalSubscribe = new SubscribeDAO().countTotalSubscribe(channel.getId());
            request.setAttribute("totalSubscribe", totalSubscribe);
            
            boolean isChannelSubscribed = false;
            if(currChannel != null) {
                isChannelSubscribed = new SubscribeDAO().isChannelSubscribe(currChannel.getId(), channel.getId());
            }
            request.setAttribute("isChannelSubscribed", isChannelSubscribed);
            
            int totalView = 0;
            for(Video video : videos) {
                totalView += video.getView();
            }
            request.setAttribute("totalView", totalView);
            
            request.getRequestDispatcher("channel.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
