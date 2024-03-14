/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Channel;
import model.Comment;

/**
 *
 * @author acer
 */
public class LikeVideoDAO extends DBContext {

    public void likeVideo(int channelId, int videoId) {
        try {
            String sql = "INSERT INTO likes_video(\n"
                    + "    channel_id, video_id\n"
                    + ") values (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, videoId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void unlikeVideo(int channelId, int videoId) {
        try {
            String sql = "DELETE likes_video\n"
                    + "WHERE channel_id = ? AND video_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, videoId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Integer countLikeByVideo(int videoId) {
        try {
            String sql = "SELECT COUNT(*) FROM likes_video WHERE video_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, videoId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public boolean isChannelLikeVideo(int videoId, int channelId) {
        try {
            String sql = "SELECT COUNT(*) FROM likes_video WHERE video_id = ? AND channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, videoId);
            ps.setInt(2, channelId);

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
