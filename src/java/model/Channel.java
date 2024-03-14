/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Channel {
    private int id;
    private String createdAt;
    private String username;
    private String password;
    private String channelName;
    private String avatar;
    private String description;
    private Boolean admin;

    public Channel(int id, String createdAt, String username, String password, String channelName, String avatar, String description, Boolean admin) {
        this.id = id;
        this.createdAt = createdAt;
        this.username = username;
        this.password = password;
        this.channelName = channelName;
        this.avatar = avatar;
        this.description = description;
        this.admin = admin;
    }

    public Channel() {
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getDate() {
        return this.createdAt.split(" ")[0];
    }

    public Boolean isAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
}
