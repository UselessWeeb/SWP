/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vudai
 */
public class Laptop {
    private int laptop_id;
    private String title;
    private String category;
    private String images;
    private float original_price;
    private String product_detail;
    private float sale_price;
    private int is_featuring;
    private int status;
    private int order_id;

    public Laptop() {
    }

    public Laptop(int laptop_id, String title, String category, String images, float original_price, String product_detail, float sale_price, int is_featuring, int status, int order_id) {
        this.laptop_id = laptop_id;
        this.title = title;
        this.category = category;
        this.images = images;
        this.original_price = original_price;
        this.product_detail = product_detail;
        this.sale_price = sale_price;
        this.is_featuring = is_featuring;
        this.status = status;
        this.order_id = order_id;
    }

    public int getLaptop_id() {
        return laptop_id;
    }

    public void setLaptop_id(int laptop_id) {
        this.laptop_id = laptop_id;
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

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public float getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(float original_price) {
        this.original_price = original_price;
    }

    public String getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }

    public float getSale_price() {
        return sale_price;
    }

    public void setSale_price(float sale_price) {
        this.sale_price = sale_price;
    }

    public int getIs_featuring() {
        return is_featuring;
    }

    public void setIs_featuring(int is_featuring) {
        this.is_featuring = is_featuring;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
    
    
}
