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
@WebServlet(name="ProfileController", urlPatterns={"/profile"})
public class ProfileController extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Channel channel = (Channel) request.getSession().getAttribute("user");
            if(channel == null) {
                response.sendRedirect("login");
                return;
            }
            ArrayList<Video> videos = new VideoDAO().getVideoByChannel(channel.getUsername());
            request.setAttribute("videos", videos);
            
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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
