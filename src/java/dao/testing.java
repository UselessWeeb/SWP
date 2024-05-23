/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author M7510
 */
public class testing {
    public static void main(String[] args) {
        LaptopDAO laptop = new LaptopDAO();
        System.out.println(laptop.findByPage(0,12, "", ""));
    }
}
