/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class OrderItem {
    private int orderItemId;
    private Order orderId;
    private Laptop laptopId;
    private int quantity;
    private float price;

    public OrderItem() {
    }

    public OrderItem(int orderItemId, Order orderId, Laptop laptopId, int quantity, float price) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.laptopId = laptopId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    public Laptop getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(Laptop laptopId) {
        this.laptopId = laptopId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "orderItemId=" + orderItemId + ", orderId=" + orderId + ", laptopId=" + laptopId + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
    
}
