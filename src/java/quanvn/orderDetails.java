/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package quanvn;

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

    // Function to show the order details
    public void showOrderDetails() {
        // Display the order details
        // including the basic order information,
        // receiver information, and the list of ordered products
    }

    // Function to change the order status
    public void changeOrderStatus(String newStatus) {
        // Update the order status
        this.status = newStatus;
    }

    // Function to add sale notes
    public void addSaleNotes(String notes) {
        // Add the sale notes to the order
    }

    // Function to assign the order to another sale
    public void assignToSale(String newSaleName) {
        // Assign the order to the new sale
        this.saleName = newSaleName;
    }
}

// Product.java (nested class in orderDetails.java)

