/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vudai
 */
public class Role {
    private int role_id;
    private String role_purpose;

    public Role() {
    }

    public Role(int role_id, String role_purpose) {
        this.role_id = role_id;
        this.role_purpose = role_purpose;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_purpose() {
        return role_purpose;
    }

    public void setRole_purpose(String role_purpose) {
        this.role_purpose = role_purpose;
    }
    
    
}
