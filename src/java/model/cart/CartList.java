/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import service.CartStrategy;

/**
 *
 * @author M7510
 */
//temporarity cart for unlogged in user
public class CartList implements CartStrategy{

    //a hash map to store product
    HashMap<Laptop, Integer> cart = new HashMap<>();

    public CartList() {
    }

    @Override
    public HashMap<Laptop, Integer> getCart() {
        return cart;
    }

    public void setCart(HashMap<Laptop, Integer> cart) {
        this.cart = cart;
    }

    @Override
    public void addToCart(Laptop laptop, int quantity) {
        cart.put(laptop, cart.getOrDefault(laptop, 0) + quantity);
    }
    
    @Override
    public void overrideCart(Laptop laptop, int quantity) {
        cart.put(laptop, quantity);
    }

    @Override
    public void deleteFromCart(Laptop laptop) {
        cart.remove(laptop);
    }

    public List<Map.Entry<Laptop, Integer>> getCartItems() {
        return new ArrayList<>(cart.entrySet());
    }
}
