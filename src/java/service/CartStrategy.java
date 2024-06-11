/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.HashMap;
import model.*;

/**
 *
 * @author M7510
 */
public interface CartStrategy {
    void addToCart(Laptop laptop, int quantity);
    void overrideCart(Laptop laptop, int quantity);
    void deleteFromCart(Laptop laptop);
    public HashMap<Laptop, Integer> getCart();
}
