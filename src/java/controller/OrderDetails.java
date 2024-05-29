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
import java.util.Date;
import model.Order;

/**
 *
 * @author quant
 */
public class OrderDetails {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String orderId = request.getParameter("orderId");
            
            // Retrieve the order details from the database or other data source
            Order order = new Order(
                Integer.parseInt(orderId),
                new Date(),
                "Order 1",
                100.00f,
                2,
                1,
                1,
                1
            );
            
            // Forward the order details to the JSP page
            request.setAttribute("order", order);
            request.getRequestDispatcher("order-details.jsp").forward(request, response);
        }
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