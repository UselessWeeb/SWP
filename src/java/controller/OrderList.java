/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import model.Order;


/**
 *
 * @author quant
 */
public class OrderList {
    
    private final List<Order> orders = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve the orders from the database or other data source
            orders.add(new Order(1, new Date(), "Order 1", 100.00f, 2, 1, 1, 1));
            orders.add(new Order(2, new Date(), "Order 2", 50.00f, 1, 2, 2, 2));
            orders.add(new Order(3, new Date(), "Order 3", 75.00f, 2, 3, 3, 3));

            String sortBy = request.getParameter("sortBy");
            boolean ascending = Boolean.parseBoolean(request.getParameter("ascending"));

            List<Order> sortedOrders = showOrderList(1, 10, sortBy, ascending);

            request.setAttribute("orders", sortedOrders);
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        }
    }

    private List<Order> showOrderList(int page, int pageSize, String sortBy, boolean ascending) {
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

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, sortedOrders.size());
        return sortedOrders.subList(startIndex, endIndex);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}