/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
import java.util.Date;

public class Order {
    private int orderID;
    private int idUser;
    private int idFruit;
    private int num;
    private int status;
    private int totalPrice;
    private String diaChi;
    private String phoneNum;
    private Date orderDate;

    public Order(int orderID, int idUser, int idFruit, int num, int status, int totalPrice, String diaChi, String phoneNum, Date orderDate) {
        this.orderID = orderID;
        this.idUser = idUser;
        this.idFruit = idFruit;
        this.num = num;
        this.status = status;
        this.totalPrice = totalPrice;
        this.diaChi = diaChi;
        this.phoneNum = phoneNum;
        this.orderDate = orderDate;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdFruit() {
        return idFruit;
    }

    public void setIdFruit(int idFruit) {
        this.idFruit = idFruit;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", idUser=" + idUser +
                ", idFruit=" + idFruit +
                ", num=" + num +
                ", status=" + status +
                ", totalPrice=" + totalPrice +
                ", diaChi='" + diaChi + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", orderDate=" + orderDate +
                '}';
    }
}
