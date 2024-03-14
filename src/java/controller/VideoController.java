/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CommentDAO;
import dao.LikeVideoDAO;
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
import model.Comment;
import model.Video;

/**
 *
 * @author acer
 */
@WebServlet(name="VideoController", urlPatterns={"/video"})
public class VideoController extends HttpServlet {
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Channel channel = (Channel) request.getSession().getAttribute("user");
        String id = request.getParameter("id");
        
        Video video = new VideoDAO().getVideo(Integer.parseInt(id));
        request.setAttribute("video", video); 
        
        ArrayList<Comment> comments = new CommentDAO().getCommentsByVideoId(Integer.parseInt(id));
        request.setAttribute("comments", comments);
        
        ArrayList<Video> relatedVideos = new VideoDAO().getRelatedVideos(video.getId(), video.getCategory().getId());
        request.setAttribute("relatedVideos", relatedVideos);
        
        int totalLike = new LikeVideoDAO().countLikeByVideo(video.getId());
        request.setAttribute("totalLikes", totalLike);
        
        boolean isChannelLikeVideo = false;
        boolean isChannelSubscribed = false;
        if(channel != null) {
            isChannelLikeVideo = new LikeVideoDAO().isChannelLikeVideo(video.getId(), channel.getId());
            isChannelSubscribed = new SubscribeDAO().isChannelSubscribe(channel.getId(), video.getChannel().getId());
        }
        request.setAttribute("isChannelLikeVideo", isChannelLikeVideo);
        request.setAttribute("isChannelSubscribed", isChannelSubscribed);
        
        new VideoDAO().updateVideoView(video.getId(), video.getView()+1);
        video.setView(video.getView()+1); //xu ly tang view
        
        int totalSubscribe = new SubscribeDAO().countTotalSubscribe(video.getChannel().getId());
        request.setAttribute("totalSubscribe", totalSubscribe);
        
        request.getRequestDispatcher("video.jsp").forward(request, response);
    } 
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

  

}
