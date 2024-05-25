/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vudai
 */
public class Order_Information {

    private int in4_id;
    private int userId;
    private int laptopId;
    
    private User user;
    private Laptop laptop;
    private Order order;

    public Order_Information() {
    }

    public Order_Information(int in4_id, int userId, int laptopId) {
        this.in4_id = in4_id;
        this.userId = userId;
        this.laptopId = laptopId;
    }

    public int getIn4_id() {
        return in4_id;
    }

    public void setIn4_id(int in4_id) {
        this.in4_id = in4_id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }


    public void setUser(User user) {
        this.user = user;
    }

    public void setLaptop(Laptop laptop) {
        this.laptop = laptop;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
