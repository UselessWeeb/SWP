/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Order_User {
    private int orderUid;
    private String fullname;
    private String address;
    private String phoneNumber;
    private String email;
    private String addInfo;
    private String gender;
    

    public Order_User() {
    }

    public Order_User(String fullname, String address, String phoneNumber, String email, String addInfo, String gender) {
        this.orderUid = orderUid;
        this.fullname = fullname;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.addInfo = addInfo;
        this.gender = gender;
    }

    public int getOrderUid() {
        return orderUid;
    }

    public String getFullname() {
        return fullname;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setOrderUid(int orderUid) {
        this.orderUid = orderUid;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
