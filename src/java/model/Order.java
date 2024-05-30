/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author vudai
 */
public class Order {
    private int order_id;
    private Date order_date;
    private String order_name;
    private float total_price;
    private int quality;
    private int status;
    private int user_id;
    private int information_id;
    private int laptop_id;
    
    private Laptop laptop;
    private User user;

    public Order() {
    }

    public Order(int order_id, Date order_date, String order_name, float total_price, int quality, int status, int user_id, int information_id, int laptop_id, Laptop laptop) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.order_name = order_name;
        this.total_price = total_price;
        this.quality = quality;
        this.status = status;
        this.user_id = user_id;
        this.information_id = information_id;
        this.laptop_id = laptop_id;
        this.laptop = laptop;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getOrder_name() {
        return order_name;
    }

    public void setOrder_name(String order_name) {
        this.order_name = order_name;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getInformation_id() {
        return information_id;
    }

    public void setInformation_id(int information_id) {
        this.information_id = information_id;
    }

    public int getLaptop_id() {
        return laptop_id;
    }

    public void setLaptop_id(int laptop_id) {
        this.laptop_id = laptop_id;
    }

    public Laptop getLaptop() {
        return laptop;
    }

    public void setLaptop(Laptop laptop) {
        this.laptop = laptop;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", order_date=" + order_date + ", order_name=" + order_name + ", total_price=" + total_price + ", status=" + status + ", user_id=" + user_id + ", information_id=" + information_id + ", laptop_id=" + laptop_id + ", laptop=" + laptop + '}';
    }

}