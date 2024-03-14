/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Notification {
    private int id;
    private String createdAt;
    private String content;
    private String target;

    public Notification(int id, String createdAt, String content, String target) {
        this.id = id;
        this.createdAt = createdAt;
        this.content = content;
        this.target = target;
    }

    public Notification() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
    
    public String getDate() {
        return createdAt.split(" ")[0];
    }
}
