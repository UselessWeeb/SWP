/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Slider {

    private int sliderId;
    private String title;
    private String images;
    private String details;
    private String backlink;
    private int status;
    private int userId;

    // Constructor, Getters, and Setters
    public Slider(int sliderId, String title, String details, String images, String backlink, int status, int userId) {
        this.sliderId = sliderId;
        this.title = title;
        this.details = details;
        this.images = images;
        this.backlink = backlink;
        this.status = status;
        this.userId = userId;
    }

    public Slider() {
    }

    public int getSliderId() {
        return sliderId;
    }

    public void setSliderId(int sliderId) {
        this.sliderId = sliderId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "Slider{" + "sliderId=" + sliderId + ", title=" + title + ", images=" + images + ", details=" + details + ", backlink=" + backlink + ", status=" + status + ", userId=" + userId + '}';
    }
}
