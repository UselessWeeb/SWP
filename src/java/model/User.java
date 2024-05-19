/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vudai
 */
public class User {
    private int userId;
    private String avatar;
    private String fullName;
    private String gender;
    private String address;
    private String email;
    private String phoneNumber;
    private String password;
    private String state;
    private int roleId;

    // Constructor, Getters, and Setters
    public User(int userId, String avatar, String fullName, String gender, String address, String email, String phoneNumber, String password, String state, int roleId) {
        this.userId = userId;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.state = state;
        this.roleId = roleId;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", avatar=" + avatar + ", fullName=" + fullName + ", gender=" + gender + ", address=" + address + ", email=" + email + ", phoneNumber=" + phoneNumber + ", password=" + password + ", state=" + state + ", roleId=" + roleId + '}';
    }
}
