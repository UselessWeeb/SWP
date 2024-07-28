/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author vudai
 */
public class Order {

    private int order_id;
    private Date order_date;
    private float price;
    private Status status; // Change the type to Status
    private int user_id;
    private int sales_id;

    private String notes;

    private Laptop laptop;
    private Order_User user;
    private Date lastUpdate;

    public enum Status {
        Pending,
        Submitted,
        Shipping,
        Delivered,
        Cancelled,
        Refunded;
        
        @Override
        public String toString() {
            // Return the name of the enum in the desired format
            return name();
        }
    }

    public Order() {
    }

    public Order(int order_id, Date order_date, float price, int status, int user_id, int sales_id, String notes) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.price = price;
        this.setStatus(status); // Use the setter to convert the int to Status
        this.user_id = user_id;
        this.sales_id = sales_id;
        this.notes = notes;
    }

    public Order(int order_id, Date order_date, float price, int status, int user_id, int sales_id, String notes, Date lastUpdate) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.price = price;
        this.setStatus(status);
        this.user_id = user_id;
        this.sales_id = sales_id;
        this.notes = notes;
        this.lastUpdate = lastUpdate;
    }
    
    

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(int status) {
        if (status < 0 || status >= Status.values().length) {
            status = 0;
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

    public int getSales_id() {
        return sales_id;
    }

    public void setSales_id(int sales_id) {
        this.sales_id = sales_id;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", order_date=" + order_date + ", price=" + price + ", status=" + status + ", user_id=" + user_id + ", laptop=" + laptop + ", user=" + user + '}';
    }
}
