/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class PlaylistVideo {
    private int id;
    private String createdAt;
    private int playlistId;
    private int videoId;

    public PlaylistVideo(int id, String createdAt, int playlistId, int videoId) {
        this.id = id;
        this.createdAt = createdAt;
        this.playlistId = playlistId;
        this.videoId = videoId;
    }

    public PlaylistVideo() {
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

    public int getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(int playlistId) {
        this.playlistId = playlistId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }
    
    
}
