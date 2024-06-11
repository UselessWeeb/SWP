package model;

public class CartItemModel {
    private int itemId;
    private int cartId;
    private int laptopId;
    private int quantity;

    public CartItemModel(int itemId, int cartId, int laptopId, int quantity) {
        this.itemId = itemId;
        this.cartId = cartId;
        this.laptopId = laptopId;
        this.quantity = quantity;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}