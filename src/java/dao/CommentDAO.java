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
import model.Channel;
import model.Comment;

/**
 *
 * @author acer
 */
public class CommentDAO extends DBContext {
    
    private void deleteReplyComment(int commentId) {
        try {
            String sql = "DELETE FROM comments WHERE reply = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, commentId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void deleteComment(int commentId, int channelId) {
        try {
            String sql = "DELETE FROM comments WHERE id = ? AND channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, commentId);
            ps.setInt(2, channelId);

            ps.executeUpdate();
            deleteReplyComment(commentId);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void insertComment(int channelId, int videoId, String content) {
        try {
            String sql = "INSERT INTO comments(\n"
                    + "     channel_id,\n"
                    + "     video_id,\n"
                    + "     content\n"
                    + ") VALUES (\n"
                    + "      ?,\n"
                    + "      ?,\n"
                    + "      ?\n"
                    + ")";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, videoId);
            ps.setNString(3, content);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void insertReplyComment(int channelId, int videoId, String content, int commentId) {
        try {
            String sql = "INSERT INTO comments(\n"
                    + "     channel_id,\n"
                    + "     video_id,\n"
                    + "     content,\n"
                    + "     reply\n"
                    + ") VALUES (\n"
                    + "      ?,\n"
                    + "      ?,\n"
                    + "      ?,\n"
                    + "      ?\n"
                    + " )";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, channelId);
            ps.setInt(2, videoId);
            ps.setNString(3, content);
            ps.setInt(4, commentId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Comment> getCommentsByVideoId(int videoId) {
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    comments.id as comment_id,\n"
                    + "    comments.created_at as comment_created_at,\n"
                    + "    comments.channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.channel_name,\n"
                    + "    channels.avatar,\n"
                    + "    channels.username,\n"
                    + "    comments.video_id,\n"
                    + "    content\n"
                    + "FROM comments\n"
                    + "JOIN channels ON comments.channel_id = channels.id\n"
                    + "WHERE video_id = ? AND reply IS NULL\n"
                    + "ORDER BY comment_created_at DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, videoId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setUsername(rs.getString("username"));
                comment.setId(rs.getInt("comment_id"));
                comment.setCreatedAt(rs.getString("comment_created_at"));
                comment.setContent(rs.getString("content"));
                comment.setVideoId(rs.getInt("video_id"));
                comment.setChannel(channel);
                comment.setReply(getReplyCommentsByCommentId(comment.getId()));
                comments.add(comment);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return comments;
    }

    public ArrayList<Comment> getReplyCommentsByCommentId(int commentId) {
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    comments.id as comment_id,\n"
                    + "    comments.created_at as comment_created_at,\n"
                    + "    comments.channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.channel_name,\n"
                    + "    channels.avatar,\n"
                    + "    channels.username,\n"
                    + "    comments.video_id,\n"
                    + "    content\n"
                    + "FROM comments\n"
                    + "JOIN channels ON comments.channel_id = channels.id\n"
                    + "WHERE comments.reply = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, commentId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setUsername(rs.getString("username"));
                comment.setId(rs.getInt("comment_id"));
                comment.setCreatedAt(rs.getString("comment_created_at"));
                comment.setContent(rs.getString("content"));
                comment.setVideoId(rs.getInt("video_id"));
                comment.setChannel(channel);
                comments.add(comment);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return comments;
    }

}
