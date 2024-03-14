/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class Comment {
    private int id;
    private String createdAt;
    private Channel channel;
    private int videoId;
    private String content;
    private ArrayList<Comment> reply;

    public Comment(int id, String createdAt, Channel channel, int videoId, String content, ArrayList<Comment> reply) {
        this.id = id;
        this.createdAt = createdAt;
        this.channel = channel;
        this.videoId = videoId;
        this.content = content;
        this.reply = reply;
    }

    public Comment() {
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

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Comment> getReply() {
        return reply;
    }

    public void setReply(ArrayList<Comment> reply) {
        this.reply = reply;
    }
    
    
    public String getDate() {
        
        return this.createdAt.split(" ")[0];
    }
    public int getTotalReply(){
        return this.reply.size();
    }
}
