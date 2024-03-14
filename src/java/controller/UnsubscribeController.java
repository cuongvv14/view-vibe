/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ChannelDAO;
import dao.SubscribeDAO;
import java.io.IOException;
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
@WebServlet(name="UnsubscribeController", urlPatterns={"/channel/unsubscribe"})
public class UnsubscribeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String channelUsername = request.getParameter("channelUsername");
        Channel subscribeChannel = new ChannelDAO().getChannelByUsername(channelUsername);
        Channel channel = (Channel)request.getSession().getAttribute("user");
        new SubscribeDAO().unsubscribeChannel(channel.getId(), subscribeChannel.getId());
    }

}
