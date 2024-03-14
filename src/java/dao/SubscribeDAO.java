/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author acer
 */
public class SubscribeDAO extends DBContext{
    
    public void subscribeChannel(int channelId, int subscribeChannelId) {
        try {
            String sql = "INSERT INTO subscribe(\n"
                    + "    channel_id, subscribe_channel_id\n"
                    + ") values (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, subscribeChannelId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void unsubscribeChannel(int channelId, int subscribeChannelId) {
        try {
            String sql = "DELETE subscribe\n"
                    + "WHERE channel_id = ? AND subscribe_channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, subscribeChannelId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Integer countTotalSubscribe(int channelId) {
        try {
            String sql = "SELECT COUNT(*) FROM subscribe WHERE subscribe_channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public boolean isChannelSubscribe(int channelId, int subscribeChannelId) {
        try {
            String sql = "SELECT COUNT(*) FROM subscribe WHERE channel_id = ? AND subscribe_channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, subscribeChannelId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
}
