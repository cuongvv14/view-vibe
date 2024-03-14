/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
import dao.ChannelDAO;
import dao.NotificationDAO;
import dao.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;
import model.Channel;
import model.Notification;

/**
 *
 * @author acer
 */
@WebServlet(name="UploadVideoController", urlPatterns={"/upload-video"})
public class UploadVideoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if (channel == null) {
            response.sendRedirect("login");
            return;
        }
        
        ArrayList<Category> categories = new CategoryDAO().getAllCategory();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("uploadVideo.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if (channel == null) {
            response.sendRedirect("login");
            return;
        }
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String video = request.getParameter("video");
        String thumbnail = request.getParameter("thumbnail");
        String categoryId = request.getParameter("categoryId");
        
        int newVideoId = new VideoDAO().uploadVideo(video, title, description, thumbnail, Integer.parseInt(categoryId), channel.getId());
        ArrayList<Integer> followerChannelIds = new ChannelDAO().getFollowerChannelIds(channel.getId());
        for(Integer id : followerChannelIds) {
            Notification noti = new Notification();
            noti.setContent(channel.getChannelName() + " just posted a new video!");
            noti.setTarget("/video?id=" + newVideoId);
            new NotificationDAO().pushNotification(id, noti);
        }
        
        response.getWriter().print(newVideoId);
    }

}
