/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import model.Order;


/**
 *
 * @author quant
 */
public class OrderList {
    
    private final List<Order> orders;

    public OrderList() {
        orders = new ArrayList<>();
    }

    // Function to show the list of orders pagination
    public List<Order> showOrderList(int page, int pageSize, String sortBy, boolean ascending) {
        // Sort the orders list
        Comparator<Order> comparator;
        switch (sortBy) {
            case "orderDate":
                comparator = Comparator.comparing(Order::getOrder_date);
                break;
            case "orderName":
                comparator = Comparator.comparing(Order::getOrder_name);
                break;
            case "totalPrice":
                comparator = Comparator.comparing(Order::getTotal_price);
                break;
            case "orderId":
                comparator = Comparator.comparing(Order::getOrder_id);
                break;
            default:
                comparator = Comparator.comparing(Order::getOrder_id);
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
    public List<Order> filterOrders(String orderDate, String orderName, int status) {
        return orders.stream()
                .filter(o -> Objects.equals(o.getOrder_date(), orderDate)
                        && Objects.equals(o.getOrder_name(), orderName)
                        && Objects.equals(o.getStatus(), status))
                .collect(Collectors.toList());
    }

    // Function to search orders
    public List<Order> searchOrders(int orderId, String orderName) {
        return orders.stream()
                .filter(o -> Objects.equals(o.getOrder_id(), orderId)
                        && Objects.equals(o.getOrder_name(), orderName))
                .collect(Collectors.toList());
    }

    // Function to redirect to order details page
    public void viewOrderDetails(int orderId) {
        Optional<Order> order = orders.stream()
                .filter(o -> Objects.equals(o.getOrder_id(), orderId))
                .findFirst();

        order.ifPresentOrElse(
            o -> {
                // Create an instance of OrderDetails with the order object
                OrderDetails orderDetails = new OrderDetails(
                    Integer.toString(o.getOrder_id()),
                    o.getOrder_name(),
                    "customerEmail",
                    "customerMobile",
                    o.getOrder_date().toString(),
                    o.getTotal_price(),
                    "saleName",
                    Integer.toString(o.getStatus()),
                    "receiverName",
                    "receiverGender",
                    "receiverEmail",
                    "receiverMobile",
                    "receiverAddress"
                );

                orderDetails.showOrderDetails();
            },
            () -> {
                throw new RuntimeException("Order not found.");
            }
        );
    }


    // Function to add a new order
    public void addOrder(Order order) {
        orders.add(order);
    }
}