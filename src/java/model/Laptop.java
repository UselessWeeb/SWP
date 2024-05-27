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
public class Laptop {

    private int laptopId;
    private String title;
    private String mainImage;
    private List<Laptop_Category> category;
    private List<Laptop_Image> image;
    private float originalPrice;
    private String productsDetail;
    private int stock;
    private float salePrice;
    private int status;
    private Date updatedDate;
    
    public Laptop() {
    }
    
    // Constructor, Getters, and Setters
    public Laptop(
            int laptopId, 
            String title, 
            List<Laptop_Category> category,
            List<Laptop_Image> image,
            String mainImage, 
            float originalPrice, 
            String productsDetail, 
            float salePrice, 
            int stock, 
            int status,
            Date updatedDate) {
        this.laptopId = laptopId;
        this.title = title;
        this.category = category;
        this.image = image;
        this.mainImage = mainImage;
        this.originalPrice = originalPrice;
        this.productsDetail = productsDetail;
        this.salePrice = salePrice;
        this.stock = stock;
        this.status = status;
        this.updatedDate = updatedDate;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public float getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(float originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getProductsDetail() {
        return productsDetail;
    }

    public void setProductsDetail(String productsDetail) {
        this.productsDetail = productsDetail;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public List<Laptop_Category> getCategory() {
        return category;
    }

    public void setCategory(List<Laptop_Category> category) {
        this.category = category;
    }

    public List<Laptop_Image> getImage() {
        return image;
    }

    public void setImage(List<Laptop_Image> image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Laptop{" + "laptopId=" + laptopId + ", title=" + title + ", mainImage=" + mainImage + ", category=" + category + ", image=" + image + ", originalPrice=" + originalPrice + ", productsDetail=" + productsDetail + ", stock=" + stock + ", salePrice=" + salePrice + ", status=" + status + ", updatedDate=" + updatedDate + '}';
    }
}
