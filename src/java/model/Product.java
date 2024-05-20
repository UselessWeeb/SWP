/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class Product {
    private int laptopId;
    private String title;
    private String category;
    private String image;
    private float originalPrice;
    private String productsDetail;
    private float salePrice;
    private int status;

    // Constructors
    public Product() {}

    public Product(int laptopId, String title, String category, String image, float originalPrice, String productsDetail, float salePrice, int status) {
        this.laptopId = laptopId;
        this.title = title;
        this.category = category;
        this.image = image;
        this.originalPrice = originalPrice;
        this.productsDetail = productsDetail;
        this.salePrice = salePrice;
        this.status = status;
    }

    // Getters and Setters
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    // toString method
    @Override
    public String toString() {
        return "Product{" +
                "laptopId=" + laptopId +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", image='" + image + '\'' +
                ", originalPrice=" + originalPrice +
                ", productsDetail='" + productsDetail + '\'' +
                ", salePrice=" + salePrice +
                ", status=" + status +
                '}';
    }
}
