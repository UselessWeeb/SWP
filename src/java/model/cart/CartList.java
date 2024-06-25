package model;

import dao.LaptopDAO;
import java.util.HashMap;
import java.util.Map;

public class CartList {
    private HashMap<String, Integer> cart;

    public CartList() {
        this.cart = new HashMap<>();
    }

    public CartList(HashMap<String, Integer> cart) {
        this.cart = cart;
    }

    public HashMap<String, Integer> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, Integer> cart) {
        this.cart = cart;
    }

    public void addToCart(String laptop, int quantity) {
        cart.put(laptop, cart.getOrDefault(laptop, 0) + quantity);
    }

    public void removeFromCart(String laptop) {
        cart.remove(laptop);
    }

    public void deleteFromCart(String laptop) {
        //delete from cart
        cart.remove(laptop);
    }

    public void overrideCart(String id, int i) {
        //override cart
        cart.put(id, i);
    }
}
