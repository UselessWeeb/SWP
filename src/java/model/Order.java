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
    private int price;
    private Status status; // Change the type to Status
    private int user_id;
    
    private Laptop laptop;
    private Order_User user;

    public enum Status {
        Pending,
        Shipped,
        Delivered,
        Cancelled,
    }

    public Order() {
    }

    public Order(int order_id, Date order_date, int price, int status, int user_id) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.price = price;
        this.setStatus(status); // Use the setter to convert the int to Status
        this.user_id = user_id;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(int status) {
        if (status < 0 || status >= Status.values().length) {
            throw new IllegalArgumentException("Invalid status value: " + status);
        }
        this.status = Status.values()[status];
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Laptop getLaptop() {
        return laptop;
    }

    public void setLaptop(Laptop laptop) {
        this.laptop = laptop;
    }

    public Order_User getUser() {
        return user;
    }

    public void setUser(Order_User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", order_date=" + order_date + ", price=" + price + ", status=" + status + ", user_id=" + user_id + ", laptop=" + laptop + ", user=" + user + '}';
    }
}