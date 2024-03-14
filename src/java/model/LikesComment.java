/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class LikesComment {
    private int id;
    private String createdAt;
    private int channelId;
    private int commentId;

    public LikesComment(int id, String createdAt, int channelId, int commentId) {
        this.id = id;
        this.createdAt = createdAt;
        this.channelId = channelId;
        this.commentId = commentId;
    }

    public LikesComment() {
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

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
    
    
    
}
