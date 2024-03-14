/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CommentDAO;
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
@WebServlet(name="deleteCommentController", urlPatterns={"/video/delete-comment"})
public class DeleteCommentController extends HttpServlet {
   
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String commentId = request.getParameter("commentId");
        Channel currentChannel = (Channel)request.getSession().getAttribute("user");
        new CommentDAO().deleteComment(Integer.parseInt(commentId),currentChannel.getId());
    }

}
