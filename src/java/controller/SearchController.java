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
import model.Video;

/**
 *
 * @author acer
 */
@WebServlet(name="SearchController", urlPatterns={"/search"})
public class SearchController extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ArrayList<Video> videos = new VideoDAO().searchVideo(keyword);
        request.setAttribute("videos", videos);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }


}
