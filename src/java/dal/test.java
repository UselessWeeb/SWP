/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dao.BlogDAO;

/**
 *
 * @author ASUS
 */
public class test {
    public static void main(String[] args) {
        BlogDAO b = new BlogDAO();
        System.out.println(b.getAll());
    }
}
