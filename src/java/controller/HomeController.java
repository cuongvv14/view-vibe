/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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
@WebServlet(name="HomeController", urlPatterns={""})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        ArrayList<Video> videos = new VideoDAO().getLatestVideos(null);
        request.setAttribute("videos", videos);
        
        Channel currChanel = (Channel) request.getSession().getAttribute("user");
        if(currChanel != null) {
            ArrayList<Video> subscribedVideos = new VideoDAO().getSubscribedChannelVideos(currChanel.getId());
            request.setAttribute("subscribedVideos", subscribedVideos);
            request.setAttribute("subscribedVideosSize", subscribedVideos.size());
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}
