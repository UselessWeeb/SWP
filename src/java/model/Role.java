/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Role {
    private int role_id;
    private String role_purpose;
    
    //for later authorization, create an enum to handle types of user
    public enum Type{
        admin,
        sale_manager,
        marketing_manager,
        sale,
        marketing,
        customer,
    }
    
    
}
