/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Blog_Category {
    private int cBlog;
    private int blogId;
    private String category;

    public Blog_Category() {
    }

    public Blog_Category(int cBlog, int blogId, String category) {
        this.cBlog = cBlog;
        this.blogId = blogId;
        this.category = category;
    }

    public int getcBlog() {
        return cBlog;
    }

    public void setcBlog(int cBlog) {
        this.cBlog = cBlog;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Blog_Category{" + "cBlog=" + cBlog + ", blogId=" + blogId + ", category=" + category + '}';
    }
}