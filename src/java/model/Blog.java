/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
import java.util.Date;

public class Blog {

    private int blogId;
    private String thumbnail;
    private String title;
    private java.util.Date updatedDate;
    private String category;
    private String blogContent;
    private int userId;

    // Constructor
    public Blog() {
    }

    public Blog(int blogId, String thumbnail, String title, Date updatedDate, String category, String blogContent, int userId) {
        this.blogId = blogId;
        this.thumbnail = thumbnail;
        this.title = title;
        this.updatedDate = updatedDate;
        this.category = category;
        this.blogContent = blogContent;
        this.userId = userId;
    }

    // Getters and Setters
    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public java.util.Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(java.util.Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogId=" + blogId + ", thumbnail=" + thumbnail + ", title=" + title + ", updatedDate=" + updatedDate + ", category=" + category + ", blogContent=" + blogContent + ", userId=" + userId + '}';
    }
}
