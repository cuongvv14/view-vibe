/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Channel;

/**
 *
 * @author acer
 */
public class ChannelDAO extends DBContext {
    
    public Channel register(String username, String password, String channelName) {
        try {
            String sql = "INSERT INTO channels (username, password, channel_name) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setNString(3, channelName);
            
            ps.executeUpdate();
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    Channel newChannel = new Channel();
                    newChannel.setId(generatedKeys.getInt(1));
                    newChannel.setUsername(username);
                    newChannel.setPassword(password);
                    newChannel.setChannelName(channelName);
                    return newChannel;
                }
                else {
                    throw new SQLException("Creating user detail failed, no ID obtained.");
                }
            }
            
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<Integer> getFollowerChannelIds(Integer channelId) {
        ArrayList<Integer> channelIds = new ArrayList<>();
        try {
            String sql = "SELECT * FROM subscribe WHERE subscribe_channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, channelId);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer channel = rs.getInt("channel_id");
                channelIds.add(channel);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return channelIds;
    }
    
    public void updateProfile(String username, String channelName, String description, String avatar, int channelId) {
        try {
            String sql;
            if (avatar != null) {
                sql  = "UPDATE channels\n"
                + "SET  username = ?,\n"
                + "     channel_name = ?,\n"
                + "     description = ?,\n"
                + "     avatar = ?\n"
                + "WHERE id = ?;";
            } else {
                sql  = "UPDATE channels\n"
                + "SET  username = ?,\n"
                + "     channel_name = ?,\n"
                + "     description = ?\n"
                + "WHERE id = ?;";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            
            if (avatar != null) {
                ps.setString(1, username);
                ps.setNString(2, channelName);
                ps.setNString(3, description);
                ps.setString(4, avatar);
                ps.setInt(5, channelId);
            } else {
                ps.setString(1, username);
                ps.setNString(2, channelName);
                ps.setNString(3, description);
                ps.setInt(4, channelId);
            }
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updatePassword(String newPassword, int channelId) {
        try {
            String sql = "UPDATE channels\n"
                    + "SET password = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setInt(2, channelId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Channel> getChannels() {
        ArrayList<Channel> channels = new ArrayList<>();
        try {
            String sql = "SELECT * FROM channels";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Channel channel = new Channel();
                channel.setId(rs.getInt("id"));
                channel.setCreatedAt(rs.getString("created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("description"));
                channel.setAdmin(rs.getBoolean("admin"));
                channels.add(channel);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return channels;
    }

    public Channel getChannelByUsername(String username) {
        try {
            String sql = "SELECT * FROM channels\n"
                    + "WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Channel channel = new Channel();
                channel.setId(rs.getInt("id"));
                channel.setCreatedAt(rs.getString("created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("description"));
                channel.setAdmin(rs.getBoolean("admin"));
                return channel;
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public ArrayList<Channel> getSubscribedChannels(int channelId) {
        ArrayList<Channel> subscribedChannels = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    channels.id,\n"
                    + "    channels.created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    avatar,\n"
                    + "    description\n"
                    + "FROM subscribe\n"
                    + "JOIN channels ON subscribe.subscribe_channel_id = channels.id\n"
                    + "WHERE channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, channelId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Channel channel = new Channel();
                channel.setId(rs.getInt("id"));
                channel.setCreatedAt(rs.getString("created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("description"));

                subscribedChannels.add(channel);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return subscribedChannels;
    }
}
