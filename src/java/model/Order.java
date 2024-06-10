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
    private int quantity;
    private int status;
    private int user_id;
    private int laptop_id;
    
    private Laptop laptop;
    private User user;

    public Order() {
    }

    public Order(int order_id, Date order_date, String order_name, int quantity, int status, int user_id, int laptop_id) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.order_name = order_name;
        this.quantity = quantity;
        this.status = status;
        this.user_id = user_id;
        this.laptop_id = laptop_id;
        this.laptop = laptop;
        this.user = user;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
        return "Order{" + "order_id=" + order_id + ", order_date=" + order_date + ", order_name=" + order_name + ", quantity=" + quantity + ", status=" + status + ", user_id=" + user_id + ", laptop_id=" + laptop_id + ", laptop=" + laptop + ", user=" + user + '}';
    }

}