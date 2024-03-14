/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Subscribe {
    private int id;
    private String createdAt;
    private int channelId;
    private int subscribeChannelId;

    public Subscribe(int id, String createdAt, int channelId, int subscribeChannelId) {
        this.id = id;
        this.createdAt = createdAt;
        this.channelId = channelId;
        this.subscribeChannelId = subscribeChannelId;
    }

    public Subscribe() {
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

    public int getSubscribeChannelId() {
        return subscribeChannelId;
    }

    public void setSubscribeChannelId(int subscribeChannelId) {
        this.subscribeChannelId = subscribeChannelId;
    }
    
    
}
