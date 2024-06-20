/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author M7510
 */
public class Blog {

    private int blogId;
    private String thumbnail;
    private String title;
    private List<Blog_Category> category;
    private Date updatedDate;
    private String blogContent;
    private int userId;
    private int views;

    // Constructor, Getters, and Setters
    public Blog(int blogId, String thumbnail, String title, List<Blog_Category> category, Date updatedDate, String blogContent, int userId, int views) {
        this.blogId = blogId;
        this.thumbnail = thumbnail;
        this.title = title;
        this.category = category;
        this.updatedDate = updatedDate;
        this.blogContent = blogContent;
        this.userId = userId;
        this.views = views;
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

    public List<Blog_Category> getCategory() {
        return category;
    }

    public void setCategory(List<Blog_Category> category) {
        this.category = category;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogId=" + blogId + ", thumbnail=" + thumbnail + ", title=" + title + ", category=" + category + ", updatedDate=" + updatedDate + ", blogContent=" + blogContent + ", userId=" + userId + ", views=" + views + '}';
    }
}
