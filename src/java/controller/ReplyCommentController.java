/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Channel;

/**
 *
 * @author acer
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name="ReplyCommentController", urlPatterns={"/video/rep-comment"})
public class ReplyCommentController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String comment = request.getParameter("content");
        String videoid = request.getParameter("videoId");
        String commentId = request.getParameter("commentId");
        Channel channel = (Channel) request.getSession().getAttribute("user");
        new CommentDAO().insertReplyComment(channel.getId(), Integer.parseInt(videoid),comment, Integer.parseInt(commentId));
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
