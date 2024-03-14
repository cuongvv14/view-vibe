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
import java.util.Arrays;
import java.util.List;
import java.util.StringJoiner;
import model.Category;
import model.Channel;
import model.Notification;
import model.Video;

/**
 *
 * @author acer
 */
public class VideoDAO extends DBContext {

    public void updateVideo(int videoId, String title, String description, String thumbnail, int categoryId, int channelId) {
        try {
            String sql = "UPDATE videos\n"
                    + "SET\n"
                    + "    title = ?,\n"
                    + "    description = ?,\n"
                    + "    thumbnail = ?,\n"
                    + "    category_id = ?\n"
                    + "WHERE id = ? AND channel_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setNString(1, title);
            ps.setNString(2, description);
            ps.setString(3, thumbnail);
            ps.setInt(4, categoryId);
            ps.setInt(5, videoId);
            ps.setInt(6, channelId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int uploadVideo(String videoUrl, String title, String description, String thumbnail, int categoryId, int channelId) {
        try {
            String sql = "INSERT INTO videos (video_url, title, description, thumbnail, category_id, channel_id) VALUES (\n"
                    + "      ?, ?, ?, ?, ?, ?\n"
                    + ")";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, videoUrl);
            ps.setNString(2, title);
            ps.setNString(3, description);
            ps.setString(4, thumbnail);
            ps.setInt(5, categoryId);
            ps.setInt(6, channelId);

            ps.executeUpdate();
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    Integer newVideoId = generatedKeys.getInt(1);
                    return newVideoId;
                } else {
                    throw new SQLException("Creating invoice detail failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }

    public void deleteVideoById(int videoId, int accountId) {
        try {
            String sql = "DELETE FROM videos WHERE videos.id = ? AND videos.channel_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, videoId);
            ps.setInt(2, accountId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Video> getVideoByChannel(String channelUsername) {

        ArrayList<Video> videos = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, channelUsername);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                videos.add(video);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return videos;

    }

    public ArrayList<Video> searchVideo(String keyword) {

        ArrayList<Video> videos = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "WHERE videos.title LIKE ? OR username LIKE ? OR channel_name LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setNString(1, "%" + keyword + "%");
            ps.setNString(2, "%" + keyword + "%");
            ps.setNString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                videos.add(video);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return videos;

    }

    public ArrayList<Video> getRelatedVideos(int videoId, int categoryId) {

        ArrayList<Video> videos = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "WHERE videos.category_id = ? AND videos.id != ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, categoryId);
            ps.setInt(2, videoId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                videos.add(video);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return videos;

    }

    public void updateVideoView(int videoId, int view) {
        try {
            String sql = "UPDATE videos\n"
                    + "SET [view] = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, view);
            ps.setInt(2, videoId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Video getVideo(int videoId) {
        try {
            String sql = "SELECT TOP(1)\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "WHERE videos.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, videoId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                return video;

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public ArrayList<Video> getSubscribedChannelVideos(Integer channelId) {
        ArrayList<Video> videos = new ArrayList<>();
        ArrayList<Channel> subscribedChannels = new ChannelDAO().getSubscribedChannels(channelId);
        StringJoiner joiner = new StringJoiner(",");
        for(Channel c : subscribedChannels) {
            joiner.add(Integer.toString(c.getId()));
        }
        
        try {
            String sql = "SELECT\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "WHERE channel_id IN ("+ joiner.toString() +")\n"
                    + "ORDER BY videos.created_at";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                videos.add(video);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return videos;
    }

    public ArrayList<Video> getLatestVideos(Integer limit) {
        if (limit == null) {
            limit = 10;
        }
        ArrayList<Video> videos = new ArrayList<>();
        try {
            String sql = "SELECT TOP(?)\n"
                    + "    videos.id as video_id,\n"
                    + "    videos.created_at as video_created_at,\n"
                    + "    video_url,\n"
                    + "    title,\n"
                    + "    videos.description,\n"
                    + "    [view],\n"
                    + "    channel_id,\n"
                    + "    channels.created_at as channel_created_at,\n"
                    + "    channels.username,\n"
                    + "    channels.password,\n"
                    + "    channel_name,\n"
                    + "    channels.description as channel_description,\n"
                    + "    avatar,\n"
                    + "    category_id,\n"
                    + "    categories.created_at as category_created_at,\n"
                    + "    name,\n"
                    + "    slug,\n"
                    + "    thumbnail\n"
                    + "FROM videos\n"
                    + "JOIN channels ON videos.channel_id = channels.id\n"
                    + "JOIN categories ON videos.category_id = categories.id\n"
                    + "ORDER BY videos.created_at";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, limit);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Video video = new Video();

                video.setId(rs.getInt("video_id"));
                video.setCreatedAt(rs.getString("video_created_at"));
                video.setVideoUrl(rs.getString("video_url"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setView(rs.getInt("view"));
                video.setThumbnail(rs.getString("thumbnail"));

                Channel channel = new Channel();
                channel.setId(rs.getInt("channel_id"));
                channel.setCreatedAt(rs.getString("channel_created_at"));
                channel.setUsername(rs.getString("username"));
                channel.setPassword(rs.getString("password"));
                channel.setChannelName(rs.getString("channel_name"));
                channel.setAvatar(rs.getString("avatar"));
                channel.setDescription(rs.getNString("channel_description"));

                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setCreatedAt(rs.getString("category_created_at"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));

                video.setChannel(channel);
                video.setCategory(category);

                videos.add(video);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return videos;
    }
}
