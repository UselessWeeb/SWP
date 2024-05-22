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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class orderList {
    // List of orders
    private List<Order> orders;

    public orderList() {
        orders = new ArrayList<>();
    }

    // Function to show the list of orders pagination
    public List<Order> showOrderList(int page, int pageSize, String sortBy, boolean ascending) {
        // Implement pagination and sorting logic
        // Based on the provided parameters

        // Sort the orders list
        Comparator<Order> comparator;
        switch (sortBy) {
            case "orderDate":
                comparator = Comparator.comparing(Order::getOrderDate);
                break;
            case "customerName":
                comparator = Comparator.comparing(Order::getCustomerName);
                break;
            case "totalCost":
                comparator = Comparator.comparing(Order::getTotalCost);
                break;
            default:
                comparator = Comparator.comparing(Order::getOrderId);
        }

        if (!ascending) {
            comparator = comparator.reversed();
        }

        List<Order> sortedOrders = orders.stream()
                .sorted(comparator)
                .collect(Collectors.toList());

        // Apply pagination
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, sortedOrders.size());
        return sortedOrders.subList(startIndex, endIndex);
    }

    // Function to filter orders
    public List<Order> filterOrders(String orderDate, String customerName, String status) {
        // Implement filtering logic
        // based on the provided parameters
        return orders.stream()
                .filter(o -> (orderDate == null || o.getOrderDate().equals(orderDate))
                        && (customerName == null || o.getCustomerName().equals(customerName))
                        && (status == null || o.getStatus().equals(status)))
                .collect(Collectors.toList());
    }

    // Function to search orders
    public List<Order> searchOrders(String orderId, String customerName) {
        // Implement search logic
        // based on the provided parameters
        return orders.stream()
                .filter(o -> (orderId == null || o.getOrderId().equals(orderId))
                        && (customerName == null || o.getCustomerName().equals(customerName)))
                .collect(Collectors.toList());
    }

    // Function to redirect to order details page
    public void viewOrderDetails(String orderId) {
        // Redirect to the order details page
        // with the provided order ID
        Order order = orders.stream()
                .filter(o -> o.getOrderId().equals(orderId))
                .findFirst()
                .orElse(null);

        if (order != null) {
            // Redirect to the order details page with the order object
            orderDetails orderDetails = new orderDetails(order);
            orderDetails.showOrderDetails();
        } else {
            System.out.println("Order not found.");
        }
    }

    // Function to add a new order
    public void addOrder(Order order) {
        orders.add(order);
    }
}
