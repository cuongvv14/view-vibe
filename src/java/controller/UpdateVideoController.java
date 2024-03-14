/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
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
import model.Video;

/**
 *
 * @author acer
 */
@WebServlet(name="UpdateVideoController", urlPatterns={"/update-video"})
public class UpdateVideoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if (channel == null) {
            response.sendRedirect("login");
            return;
        }
        String videoId = request.getParameter("id");
        Video video = new VideoDAO().getVideo(Integer.parseInt(videoId));
        request.setAttribute("video", video);
        
        ArrayList<Category> categories = new CategoryDAO().getAllCategory();
        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("updateVideo.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        if (channel == null) {
            response.sendRedirect("login");
            return;
        }
        
        String videoId = request.getParameter("videoId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        String categoryId = request.getParameter("categoryId");
        
        new VideoDAO().updateVideo(Integer.parseInt(videoId), title, description, thumbnail, Integer.parseInt(categoryId), channel.getId());
    }

}
