/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Notification;

/**
 *
 * @author acer
 */
public class NotificationDAO extends DBContext {
    
    public void pushNotification(Integer channelId, Notification notification) {
        try {
            String sql = "INSERT INTO notifications (channel_id, content, target) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, channelId);
            ps.setNString(2, notification.getContent());
            ps.setString(3, notification.getTarget());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Notification> getNotification(int channelId) {
        ArrayList<Notification> notifications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM notifications\n"
                    + "WHERE channel_id = ?\n"
                    + "ORDER BY notifications.created_at DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, channelId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                n.setCreatedAt(rs.getString("created_at"));
                n.setContent(rs.getNString("content"));
                n.setTarget(rs.getString("target"));
                
                notifications.add(n);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return notifications;
    }
}
