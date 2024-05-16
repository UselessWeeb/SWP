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
    private int idBlog;
    private int idUser;
    private String header;
    private String description;
    private Date date;
    private int status;
    private String img;
    private String category;

    // Default constructor
    public Blog() {
    }

    // Parameterized constructor
    public Blog(int idBlog, int idUser, String header, String description, Date date, int status, String img, String category) {
        this.idBlog = idBlog;
        this.idUser = idUser;
        this.header = header;
        this.description = description;
        this.date = date;
        this.status = status;
        this.img = img;
        this.category = category;
    }

    // Getters and setters
    public int getIdBlog() {
        return idBlog;
    }

    public void setIdBlog(int idBlog) {
        this.idBlog = idBlog;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Blog{" + "idBlog=" + idBlog + ", idUser=" + idUser + ", header=" + header + ", description=" + description + ", date=" + date + ", status=" + status + ", img=" + img + ", category=" + category + '}';
    }
}
