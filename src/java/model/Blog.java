/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author M7510
 */
public class Blog {

    private int blogId;
    private String thumbnail;
    private String title;
    private Date updatedDate;
    private String category;
    private String blogContent;
    private int userId;

    // Constructor, Getters, and Setters
    public Blog(int blogId, String thumbnail, String title, java.util.Date updatedDate, String category, String blogContent, int userId) {
        this.blogId = blogId;
        this.thumbnail = thumbnail;
        this.title = title;
        this.updatedDate = updatedDate;
        this.category = category;
        this.blogContent = blogContent;
        this.userId = userId;
    }

    public Blog() {
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogId=" + blogId + ", thumbnail=" + thumbnail + ", title=" + title + ", updatedDate=" + updatedDate + ", category=" + category + ", blogContent=" + blogContent + ", userId=" + userId + '}';
    }
}
