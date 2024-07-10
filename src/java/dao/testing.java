/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Role;
import model.User;

/**
 *
 * @author M7510
 */
public class testing {
    public static void main(String[] args) {
        AssinDAO dao = new AssinDAO();
        User u = new User();
        u.setUserId(5);
        u.setRole(new Role(4, ""));
        System.out.println(dao.checkAuth(u, 2));
    }
}
