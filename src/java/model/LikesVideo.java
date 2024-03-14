/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class LikesVideo {
    private int id;
    private String createdAt;
    private int channelId;
    private int videoId;

    public LikesVideo(int id, String createdAt, int channelId, int videoId) {
        this.id = id;
        this.createdAt = createdAt;
        this.channelId = channelId;
        this.videoId = videoId;
    }

    public LikesVideo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getChannelId() {
        return channelId;
    }

    public void setChannelId(int channelId) {
        this.channelId = channelId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }
    
    
}
