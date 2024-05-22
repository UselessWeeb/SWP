/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quant
 */

public class orderDetails {
    // Basic order information
    private String orderId;
    private String customerName;
    private String customerEmail;
    private String customerMobile;
    private String orderDate;
    private double totalCost;
    private String saleName;
    private String status;

    // Receiver information
    private String receiverName;
    private String receiverGender;
    private String receiverEmail;
    private String receiverMobile;
    private String receiverAddress;

    // List of ordered products
    private List<Product> products;

    public orderDetails(String orderId, String customerName, String customerEmail, String customerMobile,
                        String orderDate, double totalCost, String saleName, String status,
                        String receiverName, String receiverGender, String receiverEmail,
                        String receiverMobile, String receiverAddress) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerMobile = customerMobile;
        this.orderDate = orderDate;
        this.totalCost = totalCost;
        this.saleName = saleName;
        this.status = status;
        this.receiverName = receiverName;
        this.receiverGender = receiverGender;
        this.receiverEmail = receiverEmail;
        this.receiverMobile = receiverMobile;
        this.receiverAddress = receiverAddress;
        this.products = new ArrayList<>();
    }

    // Function to show the order details
    public void showOrderDetails() {
        // Display the order details
        // including the basic order information,
        // receiver information, and the list of ordered products
        System.out.println("Order ID: " + orderId);
        System.out.println("Customer Name: " + customerName);
        System.out.println("Customer Email: " + customerEmail);
        System.out.println("Customer Mobile: " + customerMobile);
        System.out.println("Order Date: " + orderDate);
        System.out.println("Total Cost: $" + totalCost);
        System.out.println("Sale Name: " + saleName);
        System.out.println("Status: " + status);
        System.out.println();
        System.out.println("Receiver Information:");
        System.out.println("Name: " + receiverName);
        System.out.println("Gender: " + receiverGender);
        System.out.println("Email: " + receiverEmail);
        System.out.println("Mobile: " + receiverMobile);
        System.out.println("Address: " + receiverAddress);
        System.out.println();
        System.out.println("Ordered Products:");
        for (Product product : products) {
            System.out.println("- " + product.getName() + " (Quantity: " + product.getQuantity() + ")");
        }
    }

    // Function to change the order status
    public void changeOrderStatus(String newStatus) {
        // Update the order status
        this.status = newStatus;
    }

    // Function to add sale notes
    public void addSaleNotes(String notes) {
        // Add the sale notes to the order
        // (not implemented in this code)
    }

    // Function to assign the order to another sale
    public void assignToSale(String newSaleName) {
        // Assign the order to the new sale
        this.saleName = newSaleName;
    }

    // Function to add a product to the order
    public void addProduct(Product product) {
        products.add(product);
    }
}

